package com.dcits.crawl.webdriver.crawler.personCredit;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.WebDriver;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.crawl.service.dataSubmission.IDataSubmissionService;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.crawl.util.NetSignUtil;
import com.dcits.crawl.util.PasswordOper;
import com.dcits.platform.util.StringUtil;
import com.dcits.crawl.util.Util;
import com.dcits.crawl.webdriver.crawler.CompressUtils;
import com.dcits.crawl.webdriver.crawler.WaitTime;
import com.dcits.crawl.webdriver.crawler.cl.FileUtil;
import com.dcits.credit.entity.XmlMapEntity;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

import net.sf.json.JSONObject;

/**
 * 由登录界面进入到信用报告查询界面
 * @author zhangyy
 *
 */
public class WebCrawler implements Runnable{
	

	private static Logger logger = Logger.getLogger(WebCrawler.class);
	
	private PageData pd;
	private CrawlIndAppReManager indAppReService;
	private CrawlEntAppReManager entAppReService;
	private CompanyCrawlerManager companyCrawlerService;
	private IDataSubmissionService iDataSubmissionService;
	private PersonCrawlerManager crawlPersonCrawlerService;
	
	public WebCrawler(PageData pd, CrawlIndAppReManager indAppReService, CrawlEntAppReManager entAppReService,
			CompanyCrawlerManager companyCrawlerService, IDataSubmissionService iDataSubmissionService,PersonCrawlerManager crawlPersonCrawlerService) {
		this.pd = pd;
		this.indAppReService = indAppReService;
		this.entAppReService = entAppReService;
		this.companyCrawlerService = companyCrawlerService;
		this.iDataSubmissionService = iDataSubmissionService;
		this.crawlPersonCrawlerService = crawlPersonCrawlerService;
	}

	@Override
	public void run() {

		// 直接启用爬取的操作
		getByWebDriver();

	}
	
	public void startCrawler(CrawlIndAppReManager indAppReService,PersonCrawlerManager personCrawlerService,PageData pd,IDataSubmissionService iDataSubmissionService) {
		/*pd.put("QUERY_TYPE", "0");
		pd.put("QUERY_VERSION", "30");
		//判断是否异议版报告
		if("05".equals(pd.getString("QUERY_REASON"))){
			pd.put("QUERY_VERSION", "31");
		}*/
		PageData LoginInfo=new PageData();
		try{
			//读取配置文件
			pd.put("URL", BaseController.getServerInfo().getString("URL"));
			pd.put("URLL", BaseController.getServerInfo().getString("URLL"));
			pd.put("URLL1", BaseController.getServerInfo().getString("URLL1"));
			pd.put("queryType", BaseController.getServerInfo().getString("queryType"));
			pd.put("IP", BaseController.getServerInfo().getString("IP"));
			pd.put("port", BaseController.getServerInfo().getString("port"));
			pd.put("LoginName", BaseController.getServerInfo().getString("LoginName"));
			pd.put("ftpPath", BaseController.getServerInfo().getString("ftpPath"));
			pd.put("LoginPass", PasswordOper.decode(BaseController.getServerInfo().getString("LoginPass")));
			//读取对应人行登录用户密码
			LoginInfo = indAppReService.getLoginInfo(pd);
			pd.put("CREDIT_ACCT", LoginInfo.getString("CREDIT_CODE"));
			pd.put("PASSWORD", PasswordOper.decode(LoginInfo.getString("CURRENT_PASSWORD")));
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			logger.info("读取配置文件失败或读取对应人行登录用户密码失败");
			updateStatus("04",indAppReService,pd.getString("ID"));
			return;
		}
		//查询人行账户状态，若为已锁定（人行用户名或密码错误），则不进行爬虫
		if("0".equals(LoginInfo.getString("PERBANK_STATUS"))){
			updateStatus("07",indAppReService,pd.getString("ID"));
			logger.info("人行账户状态为锁定，直接更新为密码错误！");
		}else{
			String message=intoQuery(pd,personCrawlerService,indAppReService,iDataSubmissionService);
			int time=0;
			//如果登录失败，自动重查两次
			if("04".equals(message)){
					message=intoQuery(pd,personCrawlerService,indAppReService,iDataSubmissionService);
					time++;
				if("04".equals(message)){
					message=intoQuery(pd,personCrawlerService,indAppReService,iDataSubmissionService);
					time++;
				}
			}
			//记录重查次数
			pd.put("RERUNS_TIME",time);
			indAppReService.updateRerunsTime(pd);
		}
	}
	
	//用户登录并进入条件输入界面
	private  String intoQuery(PageData pd,PersonCrawlerManager personCrawlerService,CrawlIndAppReManager indAppReService,IDataSubmissionService iDataSubmissionService){
		String message = "";
		String queryType = "";
		try{
			queryType = pd.getString("queryType");
			if("1".equals(queryType)){
//				message=getByWebDriver(pd,personCrawlerService,indAppReService,iDataSubmissionService);
			}else{
				message=getByJsoup(pd,personCrawlerService,indAppReService,iDataSubmissionService);
			}
		}catch(Exception e){
			logger.error(queryType+e.getMessage(), e);
		}
		
		return message;	
	}
	//jsoup方式
	private static String getByJsoup(PageData pd,PersonCrawlerManager personCrawlerService,CrawlIndAppReManager indAppReService,IDataSubmissionService iDataSubmissionService){
		/**进入登录界面*/
		String url="";
		String status="";
		String message="";
		String ipStr = pd.getString("URLL1");
		Response response = null;
		Map<String, String> cookies = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		try{
			map.put("userid", pd.getString("CREDIT_ACCT"));
			map.put("password",pd.getString("PASSWORD"));
			map.put("B1","%B5%C7++%C2%BC");
			map.put("isDissentLogin", "null");
			url = ipStr + "logon.do";
			response = Util.queryContentOfCharset(url, map, cookies, Method.POST, "UTF-8");
			//logger.info(response.body());
			if(response.statusCode() != 200){
				status="04";
				updateStatus(status,indAppReService,pd.getString("ID"));
				logger.info("登录系统时,网络请求异常" + response.statusCode());
				message="04";
				return message;
			}
		}catch (Exception e){
			status="04";
			updateStatus(status,indAppReService,pd.getString("ID"));
			logger.error(e.getMessage(),e);
			logger.info("登录页加载或登录页提交失败，登录失败");
			message="04";
			return message;
		}
		if(response.body().contains("密码错误")){//密码错误
			status="07";
			updateStatus(status,indAppReService,pd.getString("ID"));
			//如果密码错误，将人行账户状态置为0锁定状态
			pd.put("PERBANK_STATUS", "0");
			indAppReService.updateCreditStatus(pd);
			System.out.println("用户名或密码错误");
			logger.info("用户名或密码错误");
		}else if(response.body().contains("帐号被停用")){
			status="08";
			updateStatus(status,indAppReService,pd.getString("ID"));
			System.out.println("帐号被停用");
			logger.info("帐号被停用");
		}else if(response.body().contains("用户被锁定")){
			status="09";
			updateStatus(status,indAppReService,pd.getString("ID"));
			System.out.println("用户被锁定");
			logger.info("用户被锁定");
		}else if(response.body().contains("密码已经过期")){
			status="10";
			updateStatus(status,indAppReService,pd.getString("ID"));
			System.out.println("密码已经过期");
			logger.info("密码已经过期");
		}else if(response.body().contains("新闻公告")||response.body().contains("政策法规")){//登录成功
			logger.info("登录成功");
			try{
				cookies = response.cookies();
				String username = URLEncoder.encode(pd.getString("CLIENT_NAME").trim(),"gb2312");
				String cercode = URLEncoder.encode(pd.getString("CREDENTIALS_NO").trim(),"gb2312");
//				url=ipStr+"queryAction.do?username="+username+"&certype="+
//						 pd.getString("CREDENTIALS_TYPE")+"&cercode="+cercode+"&queryreason="+
//						 pd.getString("QUERY_REASON")+"&vertype="+pd.getString("QUERY_VERSION")+"&idauthflag="+
//						 pd.getString("QUERY_TYPE")+"&policetype=0";
				url=ipStr+"personDir/queryCreditReport.action?certName="+username+"&certTypeID="+
						 pd.getString("CREDENTIALS_TYPE")+"&certNum="+cercode+"&queryReasonID="+
						 pd.getString("QUERY_REASON")+"&vertype="+pd.getString("QUERY_VERSION")+"&idauthflag="+
						 pd.getString("QUERY_TYPE")+"&policetype=0";
				logger.info("报告页URL："+url);
				logger.info("报告页请求开始");
				response = getRequest(url,cookies,Method.GET,"GBK");
				
				Document document = Jsoup.parse(response.body());
				List<Element> eles = document.getElementsByTag("DIV");
				String urlright = eles.get(4).attr("src");
				String urlleft = "http://9.164.47.55/";
				String urlReport = urlleft + urlright;
				
				
				if(response.statusCode() != 200){
					status="04";
					updateStatus(status,indAppReService,pd.getString("ID"));
					logger.info("报告页跳转时,网络请求异常"+response.body());
				}else if(!response.body().contains("打  印")&&!response.body().contains("关  闭")){
					response = getRequest(url,cookies,Method.GET,"GBK");
				}

				System.out.println("证件号码："+pd.getString("CREDENTIALS_NO")+"。。。。。。。");
				
				if(response.body().contains(pd.getString("CREDENTIALS_NO").trim())&&response.body().contains(pd.getString("CLIENT_NAME").trim())&&!response.body().contains("获取数据库连接失败")){
					//进行页面信息爬虫
					
//					CrawlerInfo cl = new CrawlerInfo();
//					cl.crawlerInfo(response.body(),personCrawlerService,indAppReService,pd);
					Thread  cl = new CrawlerInfo(response.body(),personCrawlerService,indAppReService,pd);
					System.out.println("------in-----");			
					//将爬取的html代码解析并入库
					cl.start();
					//调用报文报送方法
					try{
						iDataSubmissionService.sendSubmissionData(pd.getString("ID"),"1");
					}catch(Exception e1){
						logger.info("报文报送异常!");
						logger.error(e1.getMessage(),e1);
					}
				}else if(response.body().contains(pd.getString("CREDENTIALS_NO").trim())&&response.body().contains(pd.getString("CLIENT_NAME").trim())&&response.body().contains("获取数据库连接失败")){
					status="04";
					updateStatus(status,indAppReService,pd.getString("ID"));
					logger.info("获取数据库连接失败"+response.body());
				}else if(response.body().contains(pd.getString("CREDENTIALS_NO").trim())&&!response.body().contains(pd.getString("CLIENT_NAME").trim())){
					logger.info("采用gkb编码");
					System.out.println("采用gbk编码");
					username = URLEncoder.encode(pd.getString("CLIENT_NAME").trim(),"GBK");
					cercode = URLEncoder.encode(pd.getString("CREDENTIALS_NO").trim(),"GBK");
					url=ipStr+"queryAction.do?username="+username+"&certype="+
							 pd.getString("CREDENTIALS_TYPE")+"&cercode="+cercode+"&queryreason="+
							 pd.getString("QUERY_REASON")+"&vertype="+pd.getString("QUERY_VERSION")+"&idauthflag="+
							 pd.getString("QUERY_TYPE")+"&policetype=0";
					logger.info("报告页URL："+url);
					logger.info("报告页请求开始");
					response = getRequest(url,cookies,Method.GET,"GBK");
					if(response.statusCode() != 200){
						status="04";
						updateStatus(status,indAppReService,pd.getString("ID"));
						logger.info("报告页跳转时,网络请求异常"+response.body());
					}else if(!response.body().contains("打  印")&&!response.body().contains("关  闭")){
						response = getRequest(url,cookies,Method.GET,"GBK");
					}
					if(response.body().contains(pd.getString("CREDENTIALS_NO").trim())&&response.body().contains(pd.getString("CLIENT_NAME").trim())&&!response.body().contains("获取数据库连接失败")){
						//进行页面信息爬虫
//						CrawlerInfo cl = new CrawlerInfo();
//						cl.crawlerInfo(response.body(),personCrawlerService,indAppReService,pd);
						Thread  cl = new CrawlerInfo(response.body(),personCrawlerService,indAppReService,pd);
						System.out.println("------in-----");			
						//将爬取的html代码解析并入库
						cl.start();
						//调用报文报送方法
						try{
							iDataSubmissionService.sendSubmissionData(pd.getString("ID"),"1");
						}catch(Exception e1){
							logger.info("报文报送异常!");
							logger.error(e1.getMessage(),e1);
						}
					}else{
						status="04";
						updateStatus(status,indAppReService,pd.getString("ID"));
						logger.info("报告页跳转时,未跳转到正确的报告页"+response.body());
					}
				}else{
					status="04";
					updateStatus(status,indAppReService,pd.getString("ID"));
					logger.info("报告页跳转时,未跳转到正确的报告页"+response.body());
				}
			}catch(Exception e){
				status="04";
				updateStatus(status,indAppReService,pd.getString("ID"));
				logger.info("报告页跳转异常");
				logger.error(e.getMessage(),e);
			}
			/*//调用报文报送方法
			try{
				iDataSubmissionService.sendSubmissionData(pd.getString("ID"),"1");
			}catch(Exception e1){
				logger.info("报文报送异常!");
				logger.error(e1.getMessage(),e1);
			}*/
		}else{
			if(!status.equals("04")&&!status.equals("07")){
				updateStatus("04",indAppReService,pd.getString("ID"));
			}
			logger.info("登录失败");
			message="04";
		}
		return message;	
	}
	
	//多次加载报告
	public static Response getRequest(String url,Map<String, String> cookies,Method med,String charset){
		Response response = null;
		try{
			response = Util.queryContentByGet(url,cookies,Method.GET,"GBK");
			if(response.statusCode() != 200){
				response = Util.queryContentByGet(url,cookies,Method.GET,"GBK");
				if(response.statusCode() != 200){
					response = Util.queryContentByGet(url,cookies,Method.GET,"GBK");
				}
			}
		}catch(Exception e){
			logger.error("报告页跳转时,网络请求异常"+e.getMessage(),e);
		}
		return response;
	}
	
	
	//webdriver方式
	@SuppressWarnings("static-access")
	public String getByWebDriver(){
		/**进入登录界面*/
		String pageCode="";
		String xmlReport = "";
		String status="";
		String message="";
		String url = null;
		String pageBody ="";
		Response response = null;
		String subject = "";
		Map<String, String> cookies = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();
		NetSignUtil signUtil = new NetSignUtil();
		try{	
			//pd.put("PASSWORD",PasswordOper.encode("Aa@123456"));
			//登录页面			
			PageData web_user = new PageData();
			//web_user.put("type", "1");
			web_user.put("USERNAME", pd.getString("USERNAME"));
			PageData  webInfo = indAppReService.findWebCrawlerInfoByUser(web_user);
			map.put("local_cpu", webInfo.getString("LOCAL_CPU"));
			map.put("local_disk", webInfo.getString("LOCAL_DISK"));
			map.put("local_network", webInfo.getString("LOCAL_NETWORK"));
			map.put("username", webInfo.getString("USER_CODE"));
			map.put("password", webInfo.getString("USER_PWD"));
			logger.info("+++++++++++++++++"+ webInfo.getString("USER_PWD") +"登录参数获取" + "+++++++++++++++++++++++");
			//对征信用户名进行数字签名
			web_user.put("reportMessage", webInfo.getString("USER_CODE"));
			subject = webInfo.getString("SUBJECT");
			web_user.put("subject", subject);
			logger.info("digital signature:before"+subject + "+++++++++++++++++++++++");
			String sign = signUtil.generateBondMsgSign2(web_user);
			logger.info("digital signature:after"+sign + "+++++++++++++++++++++++");
			//放入请求参数中
			map.put("signinfo", sign);
			int sleepState = 0;
			int retflag = 0;
			while(true) {
				if(retflag >=5){
					return pd.getString("ID");
				}
				//获取状态不为3的第一个数据
				PageData statusPd = indAppReService.findQueueStatus(pd);
				if(statusPd==null){
					return pd.getString("ID");
				}
				if(!statusPd.get("INCREMENT_ID").equals(pd.get("INCREMENT_ID"))) {
					sleepState++;
					if(sleepState >= 10) {
						//查到当前账号以及当前ID依据时间进行倒叙排序最新的数据之前运行的状态在1和2的所有数据
						List<PageData> upperPd = indAppReService.findQueueUpperStatus(pd);
						if(upperPd!=null){
							for(int i=0;i<upperPd.size();i++){
								if(upperPd.get(i).get("RUN_TIME_SECOND")==null||upperPd.get(i).get("RUN_TIME_SECOND").equals("")){
									indAppReService.updateQueueUpperStatus(upperPd.get(i));
									sleepState = 0;
								}else{
									int  runTimeSecond = Integer.parseInt((upperPd.get(i).getString("RUN_TIME_SECOND")));
									//上个任务运行超过一分钟强制放锁,并重新进入该任务的轮询
									if(runTimeSecond >= 20) {
										indAppReService.updateQueueUpperStatus(upperPd.get(i));
										sleepState = 0;
									}else {
										sleepState = 0;
									}
								}
							}
						}
					}else{
						Thread.sleep(3000);
					}
				}else {
					//修改数据表中的查询状态,获取到锁
					indAppReService.updateQueueGetLock(statusPd);
					pd.put("INCREMENT_ID", statusPd.get("INCREMENT_ID"));
					break;
				}			
			}
			PageData serverInfo=new PageData();
			serverInfo = BaseController.getServerInfo();
			logger.info("pick up information：serverInfo："+serverInfo + "+++++++++++++++++++++++");
			url = serverInfo.getString("URL_PER")+new Date().getTime();
			//url = "http://21.5.250.1/creditreference/v2/prod/web-bank-manage/auth/login.do?t="+new Date().getTime();
			logger.info("Access Bank Information：MAP:"+map.toString() + "  URL:"+url+"++++++++++++++++++++++");
			response = Util.queryContentOfCharset(url, map, cookies,Method.POST,"UTF-8");
			//logger.info("pick up information：responseBody："+response.body() + "+++++++++++++++++++++++");
//			System.out.println(response.body());
			//获取用户cookies信心
			cookies = response.cookies();
			//处理登录失败的情况
			if(response.statusCode() != 200){
				logger.info("登录系统时,网络请求异常" + response.statusCode());
				System.out.println("登录系统时,网络请求异常" + response.statusCode());
				updateStatus("04",indAppReService,pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return pd.getString("ID");
			}
			//System.out.println("++++++++++++++++++"+response.body());
			if (response.body().contains("密码错误")) {
				logger.info("密码错误。  密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("密码错误。  密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				updateStatus("07",indAppReService,pd.getString("ID"));
				//如果密码错误，将人行账户状态置为0锁定状态
				pd.put("PERBANK_STATUS", "0");
				indAppReService.updateCreditStatus(pd);
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return pd.getString("ID");
			}else if (response.body().contains("用户不存在")) {
				logger.info("用户不存在。 用户名："+ pd.getString("USERNAME")+" 密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("用户不存在。 用户名："+ pd.getString("USERNAME")+" 密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				updateStatus("07",indAppReService,pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return pd.getString("ID");
			}else if (response.body().contains("帐号被停用")) {
				logger.info("帐号被停用。 用户名："+ pd.getString("USERNAME"));
				System.out.println("帐号被停用。 用户名："+ pd.getString("USERNAME"));
				updateStatus("08",indAppReService,pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return pd.getString("ID");
			}else if (response.body().contains("用户被锁定")) {
				logger.info("用户被锁定。 用户名："+ pd.getString("USERNAME"));
				System.out.println("用户被锁定。 用户名："+ pd.getString("USERNAME"));
				updateStatus("09",indAppReService,pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return pd.getString("ID");
			}else if (response.body().contains("密码已经过期")) {
				logger.info("******************密码过期******************");
				System.out.println("******************密码过期******************");
				updateStatus("10",indAppReService,pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return pd.getString("ID");
			}else if (response.body().contains("机构代码错误")) {
				logger.info("机构代码错误。 机构代码："+ pd.getString("ORGCODE"));
				System.out.println("机构代码错误。 机构代码："+ pd.getString("ORGCODE"));
				updateStatus("11",indAppReService,pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return pd.getString("ID");
			}else if(response.body().contains("证书验签失败")){
				logger.info("证书验签失败："+ pd.getString("USERNAME"));
				System.out.println("证书验签失败："+ pd.getString("USERNAME"));
				updateStatus("13",indAppReService,pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return pd.getString("ID");
			}
			//登录成功
			logger.info(pd.getString("ID")+"登录成功...............................");		
			//获取页面动态token
			url = serverInfo.getString("URL_TOKEN");
			response = Util.queryContentOfCharset(url, map, cookies,Method.GET,"UTF-8");
			JSONObject json_token =  JSONObject.fromObject(response.body());
			logger.info("+++++++++++++++++"+"获取页面动态token...............................");	
			//提交页面
			//map1.put("声明", webInfo.getString("PER_STATEMENT"));
			map1.put("声明", "on");
			map1.put("csrfToken", json_token.getString("token"));			
			map1.put("backUrl", serverInfo.getString("backUrl"));//在配置文件里写的参数值
			
			//数据字典参数一一映射 -----start-----
			PageData pDict_code = new PageData();
			//信用报告版本
			pDict_code.put("dict_name", "reportVersion");
			pDict_code.put("o_code", "1.0");	
			PageData p_code=indAppReService.findWebCrawlerDictByCode(pDict_code);
			map1.put("reportVersion",p_code.getString("C_CODE"));
//			map1.put("reportVersion","2462728429062106112");
			//信用报告封装格式
			pDict_code.put("dict_name", "reportFormat");
			pDict_code.put("o_code", "numReadhtml");	
			p_code=indAppReService.findWebCrawlerDictByCode(pDict_code);
			map1.put("reportFormat",p_code.getString("C_CODE"));		
//			map1.put("reportFormat","2492639467605691392");			
//			map1.put("reportFormat","2492639468071259136");	
			//证件类型
			pDict_code.put("dict_name", "CREDENTIALS_TYPE");
			pDict_code.put("o_code", pd.getString("CREDENTIALS_TYPE"));	
			p_code =indAppReService.findWebCrawlerDictByCode(pDict_code);
			map1.put("certTypeID",p_code.getString("C_CODE"));
//			map1.put("certTypeID","1014691");
			//查询原因
			pDict_code.put("dict_name", "QUERY_REASON");
			pDict_code.put("o_code", pd.getString("QUERY_REASON"));
			p_code =indAppReService.findWebCrawlerDictByCode(pDict_code);
			map1.put("queryReasonID",p_code.getString("C_CODE"));
//			map1.put("queryReasonID","3003230");
			
			//20191022  新增请求参数
			pDict_code.put("dict_name", "reportFormatText");
			pDict_code.put("o_code", "1");
			p_code =indAppReService.findWebCrawlerDictByCode(pDict_code);
			map1.put("reportFormatText",p_code.getString("C_CODE"));
//			map1.put("reportFormatText","html格式");
			
			//数据字典参数一一映射 -----end----- 
			
			map1.put("certName",DESUtil.decrypt("enhjeA==", pd.getString("CLIENT_NAME")));	
			map1.put("certNum",DESUtil.decrypt("enhjeA==",pd.getString("CREDENTIALS_NO")));
			//数字签名新增请求参数
			map1.put("signinfo", "");
			map1.put("forminfo", "");
			//拼接$("#personDir-form").serialize();
			StringBuffer sb = new StringBuffer();
			Set<String> keySet = map1.keySet();
			for(String key:keySet){
				sb.append(key).append("=").append(map1.get(key)).append("&");
			}
			String signinfo = sb.substring(0, sb.length()-1);
			//签名服务器加密
			PageData pdTmp = new PageData();
			pdTmp.put("subject", subject);
			pdTmp.put("reportMessage", signinfo);
			logger.info("+++++++++++++++++"+signinfo +"获取页面动态token1...............................");
			String signedInfo = signUtil.generateBondMsgSign(pdTmp);
			map1.put("signinfo", signedInfo);
			map1.put("forminfo", signinfo);
			logger.info("+++++++++++++++++"+map1 +"获取页面动态token2...............................");
			url = serverInfo.getString("URL_PER1");
			response = Util.queryContentOfCharset(url, map1, cookies,Method.POST,"UTF-8");
			logger.info("+++++++++++++++++"+response +"获取页面动态token3...............................");
			JSONObject json =  JSONObject.fromObject(response.body());			
			logger.info("+++++++++++++++++"+response.body() +"token4...............................");
			//将爬出的html文件放置的文件夹创建好---------  start-------
			String id = pd.getString("ID");
			String path = PathUtil.getClasspath() + Const.FILEPATHIMG ;
			logger.info("+++++++++++++++++"+path +"获取页面动态token5...............................");
			String htmlPath = path + id +File.separator+ id + ".html"; //html报告路径
			String XMLPath = path + id + File.separator+ id + ".xml"; //html报告路径
			try {
				File f = new File(path + id);
				f.mkdir(); //创建目录	
			} catch (Exception e) {
				logger.error("创建目录失败!",e);
			}			
			//将爬出的html文件放置的文件夹创建好---------  end-------
			if(json.get("msg")!=null && json.get("msg").toString().contains("输入的姓名与系统收录的姓名不一致")){
				try {	
					PageData pdStatus = new PageData();
					pdStatus.put("STATUS", "20");
					pdStatus.put("ID",id);
					indAppReService.updateStatus(pdStatus);
					//修改状态，释放锁
					pd.put("RELEASE_LOCK_STSTUS", "1");
					indAppReService.updateQueueReleaseLock(pd);
					return pd.getString("ID");
				} catch (Exception e) {
					// TODO: handle exception
					logger.info("输入的姓名与系统收录的姓名不一致,建议使用查询个人姓名功能确认系统中收录的姓名。");
					logger.error(e);
					return pd.getString("ID");
				}
			}
			//查无此人
			if(json.get("msg")!=null && (("系统中无此人信用报告").equals(json.get("msg"))||("无此人信用记录").equals(json.get("msg")))){
				//根据模板，生成查无此人的html报告
				try {	
//					XmlToHtml.createHtml_per(htmlPath, pd);	
					PageData pdStatus = new PageData();
					pdStatus.put("STATUS", "05");
					pdStatus.put("ID",id);
					indAppReService.updateStatus(pdStatus);
					//修改状态，释放锁
					pd.put("RELEASE_LOCK_STSTUS", "1");
					indAppReService.updateQueueReleaseLock(pd);
					return pd.getString("ID");
				} catch (Exception e) {
					// TODO: handle exception
					logger.info("生成查无此人模板出错！");
					logger.error(e);
				}		
			}else{
				//征信报告页面
				url = serverInfo.getString("URL_PER2")+json.getString("fileID");
				map2.put("fileID", json.getString("fileID"));
				response = Util.queryContentOfCharset(url, map2, cookies,Method.POST,"UTF-8");				
				pageBody =  response.body();
				
				try{
					if(!pageBody.contains("本报告由中国人民银行征信中心出具")){
						response = Util.queryContentOfCharset(url, map2, cookies,Method.POST,"UTF-8");						
						pageBody =  response.body();
						if(!pageBody.contains("本报告由中国人民银行征信中心出具")){
							response = Util.queryContentOfCharset(url, map2, cookies,Method.POST,"UTF-8");						
							pageBody =  response.body();
						}
					}
				}catch(Exception e){
					logger.error("爬取页面时出错"+e.getMessage(),e);
					//修改状态，释放锁
					pd.put("RELEASE_LOCK_STSTUS", "2");
					indAppReService.updateQueueReleaseLock(pd);
				}
				
				
				
//				System.out.println("------in-----");			
//				//将爬取的html代码解析并入库
//				cl.crawlerInfo(response.body(),personCrawlerService,indAppReService,pd);
				//调用报文报送方法
//				try{
//					boolean report = indAppReService.findQueryType("REPORTTYPE");
//					if(report){
//						iDataSubmissionService.sendSubmissionData(pd.getString("ID"),"1");
//					}
//				}catch(Exception e1){
//					logger.info("报文报送异常!");
//					logger.error(e1.getMessage(),e1);
//				}

				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				
				PageData pdbody = new PageData();
				pdbody.put("ID", pd.getString("ID"));
				pdbody.put("QUERY_NO", pd.getString("QUERY_NO"));
				//20220621,把原来直接插入HTML文件修改成插入base64加密后的内容
				//pdbody.put("BODY", response.body()) 
				pdbody.put("BODY", Base64.encodeBase64String(response.body().toString().getBytes()));
				indAppReService.saveBody(pdbody);
				
				if(pd.getString("INTERFACE")!=null&&pd.getString("INTERFACE").equals("queryRequestFast")){
					XmlMapEntity.xmlMap.put(id, response.body());
					logger.info("添加html:"+id);
				}
				
//				PageData pdStatus = new PageData();
//				pdStatus.put("STATUS", "15");//更新数据状态为数据解析中。
//				pdStatus.put("ID",id);
//				indAppReService.updateStatus(pdStatus);
//				//处理html代码
				pageBody=pageBody.replaceAll("../resources/product/", "../../../static/resources/product/");
				pageBody = pageBody.replace("</html>","<script src=\"../../js/common/jquery-1.10.2.js\"></script><SCRIPT>function printReport(){ javascript:document.execCommand('print');$.ajax({async:false,cache:false,data:{\"ID\":'"
				   +pd.getString("ID")+"'},url:'../../../PersonReportInquiry/isPrint.do',type:\"post\" });}</SCRIPT><script>document.oncontextmenu = function(){return false;}</script>"
					+"<form method=\"POST\" action=\"--WEBBOT-SELF--\">"
					+" <p align=\"center\"> "
					+"	<input onMouseOver=\"msover();\" style=\"border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58\" onMouseOut=\"msout();\" type=\"button\" name=\"doPrint\" value=\"打  印\" class=\"button2\" onclick=\"printReport()\"/>&#160;&#160;"
					+"	<input onMouseOver=\"msover();\" style=\"border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58\" onMouseOut=\"msout();\" type=\"button\" name=\"goBack\" value=\"关  闭\" class=\"button1\" onclick=\"window.location.href=document.referrer;\"/> </p> "
					+"<br>"
					+"<br>"
					+"<br>"
					+"<br>"
					+"<br>"
					+"<br>"
					+"</form></html>");	
				pageBody = pageBody.replace("</html>","<script src=\"../../../static/reportStyle/shuiyin.js\"></script><script type=\"text/javascript\">watermark({\"watermark_txt\":\"张三提供\"});</script>");
				
				//将爬取的html代码写入文件
				try {				
					FileUtil.writeFile(htmlPath,pageBody,"UTF-8"); 
				} catch (Exception e) {
					// TODO: handle exception
					logger.error("将爬取的html代码写入文件出错！",e);
				}
			}
							
			String ftpFileName = id + ".zip"; //ftp服务器存放报告的文件名
			String localFilePath = path + ftpFileName; //压缩文件路径
					
			try {
				//20220621,经分析，暂时注释掉。
				/*CrawlerInfoXH clxh = new CrawlerInfoXH();
				xmlReport = clxh.crawlerInfo(response.body(), crawlPersonCrawlerService, indAppReService, pd, htmlPath,
						XMLPath, pd.getString("USER_CODE"));
				logger.info("ADDxml:"+id+"xmlFile");*/
				// 压缩上传文件
				String zipPasswd = id.substring(0, 6);
				CompressUtils.zip(path + id + File.separator, localFilePath, true, zipPasswd);
				// //密码解密
				// serverInfo.put("LoginPass",
				// PasswordOper.decode(serverInfo.getString("LoginPass")));
				// new
				// FileTool().upLoadFromProduction(serverInfo.getString("IP"),
				// Integer.parseInt(serverInfo.getString("port")),
				// serverInfo.getString("LoginName"),
				// serverInfo.getString("LoginPass"),
				// serverInfo.getString("ftpPath")+id+"/",
				// ftpFileName,
				// localFilePath
				// ); //将压缩的zip报告上传ftp服务器
				// delFile(localFilePath); //删除压缩文件
				delFile(htmlPath); // 删除替换数据字典后的html页面
				delFile_Dir(path + id + File.separator); // 删除本地文件夹

			} catch (Exception e) {
				logger.error("HTML UP TO FTP HAS ERROR:",e);
			}
			//解析速度太慢，因此放到最后再执行
			Thread  cl = new CrawlerInfo(response.body(),crawlPersonCrawlerService,indAppReService,pd);
			System.out.println("------in-----");			
			//将爬取的html代码解析并入库
			cl.start();
			
			return pageBody;	
		}catch(Exception e){
			try {
				pd.put("RELEASE_LOCK_STSTUS", "2");
				indAppReService.updateQueueReleaseLock(pd);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			status="04";
			updateStatus(status,indAppReService,pd.getString("ID"));
//			dr.quit();
			logger.info("报告页跳转加载异常");			
			logger.error(e.getMessage(),e);

			return pd.getString("ID");	
		}
		
	}

	
	
	public void getWebInfo(Response response){
		
	}
	
	
	
	//判断页面是否跳转完成
	public static void getResult(String url,WebDriver dr){
		int i=0;
		while(true){
			if(i==2){  //登录失败
				break;
			}
			if(url.equals(dr.getCurrentUrl())){
				WaitTime.threadWait(3000);
				i++;
			}else{
				break;
			}
		}
	}
	
	//更新信息表中状态
	public static void updateStatus(String flag,CrawlIndAppReManager indAppReService,String ID){
		//更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
		try {
			PageData pd = new PageData();
			pd.put("ID", ID);
			pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("STATUS", flag);
			if("06".equals(flag)||"06"==flag){
				pd.put("IS_GET", "1");
				pd.put("RESULTCODE", "AAA000");
			} else {
				pd.put("IS_GET", "0");
				pd.put("RESULTCODE", "");
			}
			//更新状态表
			indAppReService.updateCheck(pd);
			//更新明细表
			indAppReService.UpdateDetailCheck(pd);
		} catch (Exception e) {
			logger.error(e);
		}
	}
	
	
	/**
	 * 删除文件
	 * @param path
	 */
	private static void delFile(String path){
		try {
			if(!StringUtil.isEmpty(path)){
				File file = new File(path);
				if(file.exists()){
					if(file.isFile()){
						file.delete();
					}else if(file.isDirectory()){
						File[] arrFile = file.listFiles();
						for(File fi : arrFile){
							delFile(fi.getAbsolutePath());
						}
						file.delete();
					}
				}
			}
		} catch (Exception e) {
			logger.error("IndAppReController.delFile方法出错",e);
		}
	}
	/**
	 * 删除文件夹
	 * @param path
	 */
	@SuppressWarnings("unused")
	private static  void delFile_Dir(String path){
		try {
			if(!StringUtil.isEmpty(path)){
				File file = new File(path);
				if(file.isDirectory()){
					file.delete();
					}
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
