package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_2;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.crawl.service.dataSubmission.IDataSubmissionService;
import com.dcits.platform.util.Const;
import com.dcits.crawl.util.NetSignUtil;
import com.dcits.crawl.util.PasswordOper;
import com.dcits.platform.util.PathUtil;

import com.dcits.platform.util.StringUtil;
import com.dcits.crawl.util.Util;
import com.dcits.crawl.webdriver.crawler.CompressUtils;
import com.dcits.crawl.webdriver.crawler.cl.FileUtil;
import com.dcits.crawl.webdriver.crawler.companyCredit.clawer_1.BeginCrawlerInfo;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONNull;
import net.sf.json.JSONObject;

/**
 * 由登录界面进入到企业信用报告查询界面
 * 
 * @author zhangyy
 *
 */
public class ComWebCrawler implements Runnable {

	private static Logger logger = Logger.getLogger(ComWebCrawler.class);
	// main方法
	private PageData pd;
	private CrawlIndAppReManager indAppReService;
	private CrawlEntAppReManager entAppReService;
	private CompanyCrawlerManager companyCrawlerService;
	private IDataSubmissionService iDataSubmissionService;

	// public PageData getPageData(){
	// return this.pd;
	// }
	// private static boolean flag = false;
	// public static void setFlag (boolean flag){
	// ComWebCrawler.flag=flag;
	// }
	// public static boolean getFlag (){
	// return ComWebCrawler.flag;
	// }
	public ComWebCrawler(PageData pd, CrawlIndAppReManager indAppReService, CrawlEntAppReManager entAppReService,
			CompanyCrawlerManager companyCrawlerService, IDataSubmissionService iDataSubmissionService) {
		this.pd = pd;
		this.indAppReService = indAppReService;
		this.entAppReService = entAppReService;
		this.companyCrawlerService = companyCrawlerService;
		this.iDataSubmissionService = iDataSubmissionService;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub

		// 直接启用爬取的操作
		startComCrawler();

	}
	// public static void main(String[] args){
	// PageData pd = new PageData();
	// pd.put("ID", "test");
	// //用户登录
	// EntAppReManager entAppReService = null;
	// CompanyCrawlerManager companyCrawlerService = null;
	// IndAppReManager indAppReService = null;
	// IDataSubmissionService iDataSubmissionService =null;
	// pd.put("USERNAME", "002002");
	// pd.put("PASSWORD", "12345678");
	// pd.put("ORGCODE", "79103141005");
	// pd.put("ORG_CODE", "G1061010100736350U");
	// pd.put("QUERY_REASON", "01");
	// pd.put("URL", "http://9.88.47.3/webroottest/");
	// //调用爬虫
	// getWebInfo(pd,entAppReService,companyCrawlerService,indAppReService,iDataSubmissionService);
	// }

	// public ComWebCrawler(PageData pd){
	// this.pd=pd;
	// }
	// public void startComCrawler1(IndAppReManager
	// indAppReService,EntAppReManager entAppReService,CompanyCrawlerManager
	// companyCrawlerService,PageData pd,IDataSubmissionService
	// iDataSubmissionService) throws Exception {
	// String pageCode = "";
	// try {
	// pageCode =
	// XmlParseUtil.readXmlFile("C:/Users/hp/Desktop/baf726f89fe74552a5ecf235d0de3d3f2b43bf2fcedd48b18b5768f2d83d4c75/baf726f89fe74552a5ecf235d0de3d3f2b43bf2fcedd48b18b5768f2d83d4c75.html",
	// "UTF-8");
	// } catch (Exception e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// //因页面解析太慢，因此将解析最后执行
	// ComClawerUtil cl = new ComClawerUtil();
	// //将爬取的html代码解析并入库
	// cl.comParseHtml(pd,pageCode,indAppReService, companyCrawlerService);
	// }

	@SuppressWarnings("static-access")
	public void startComCrawler() {
		// 加载浏览器驱动
		// WebDriver dr = WebDriverInfo.getWebDriver();
		/** 进入登录界面 */
		String pageCode = "";
		String status = "";
		String message = "";
		String pageBody = "";
		String url = null;
		Response response = null;
		Map<String, String> cookies = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();
		try {
			// 一、登录页面
			PageData web_user = new PageData();
			web_user.put("type", "2");
			web_user.put("USERNAME", pd.getString("USERNAME"));
			pd.put("QUERY_ORG_CODE", "D10052410H0001");
			PageData webInfo = indAppReService.findWebCrawlerInfoByUser(web_user);
			map.put("local_cpu", webInfo.getString("LOCAL_CPU"));
			map.put("local_disk", webInfo.getString("LOCAL_DISK"));
			map.put("local_network", webInfo.getString("LOCAL_NETWORK"));
			map.put("username", webInfo.getString("USER_CODE"));
			map.put("password", webInfo.getString("USER_PWD"));
			// 对征信用户名进行数字签名
			web_user.put("reportMessage", webInfo.getString("USER_CODE"));
			web_user.put("subject", webInfo.getString("SUBJECT"));
			logger.info("数字签名" + webInfo.getString("SUBJECT") + "+++++++++++++++++++++++");
			String sign = NetSignUtil.generateBondMsgSign(web_user);
			// 放入请求参数中
			map.put("signinfo", sign);
			int sleepState = 0;
			while(true) {
				PageData statusPd = indAppReService.findQueueStatus(pd);
				if(statusPd == null||!statusPd.get("ID").equals(pd.get("ID"))) {
					sleepState++;
					if(sleepState >= 20) {
						//查到上一个账号运行的时间
						List<PageData> upperPd = indAppReService.findQueueUpperStatus(pd);
						for(int i=0;i<upperPd.size();i++){
							if(upperPd.get(i).get("RUN_TIME_SECOND")==null||upperPd.get(i).get("RUN_TIME_SECOND").equals("")){
								indAppReService.updateQueueUpperStatus(upperPd.get(i));
								sleepState = 0;
							}else{
								int runTimeSecond = ((Integer)upperPd.get(i).get("RUN_TIME_SECOND")).intValue();
								//上个任务运行超过一分钟强制放锁,并重新进入该任务的轮询
								if(runTimeSecond >= 40) {
									indAppReService.updateQueueUpperStatus(upperPd.get(i));
									sleepState = 0;
								}else {
									sleepState = 0;
								}
							}
						}
					}
					
					Thread.sleep(3000);
				}else {
					//修改数据表中的查询状态,获取到锁
					indAppReService.updateQueueGetLock(statusPd);
					pd.put("INCREMENT_ID", statusPd.get("INCREMENT_ID"));
					break;
				}			
			}

			PageData serverInfo = new PageData();
			serverInfo = BaseController.getServerInfo();
			logger.info("获取信息" + serverInfo + "+++++++++++++++++++++++");
			// url =
			// "http://9.88.47.3/creditreference/v2/test/web-bank-manage/auth/login.do?t="+new
			// Date().getTime();
			url = serverInfo.getString("URL_COM") + new Date().getTime();
			response = Util.queryContentOfCharset(url, map, cookies, Method.POST, "UTF-8");
			logger.info("获取信息" + response.body() + "+++++++++++++++++++++++");
			// 处理登录失败的情况
			if (response.statusCode() != 200) {
				logger.info("登录系统时,网络请求异常" + response.statusCode());
				System.out.println("登录系统时,网络请求异常" + response.statusCode());
				updateStatus("04", entAppReService, indAppReService, pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return ;
			}
			if (response.body().contains("密码错误")) {
				logger.info("密码错误。  密码：" + PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("密码错误。  密码：" + PasswordOper.decode(pd.getString("PASSWORD")));
				updateStatus("07", entAppReService, indAppReService, pd.getString("ID"));
				// 如果密码错误，将人行账户状态置为0锁定状态
				pd.put("PERBANK_STATUS", "0");
				indAppReService.updateCreditStatus(pd);
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return ;
			} else if (response.body().contains("用户不存在")) {
				logger.info("用户不存在。 用户名：" + pd.getString("USERNAME") + " 密码："
						+ PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("用户不存在。 用户名：" + pd.getString("USERNAME") + " 密码："
						+ PasswordOper.decode(pd.getString("PASSWORD")));
				updateStatus("07", entAppReService, indAppReService, pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return ;
			} else if (response.body().contains("帐号被停用")) {
				logger.info("帐号被停用。 用户名：" + pd.getString("USERNAME"));
				System.out.println("帐号被停用。 用户名：" + pd.getString("USERNAME"));
				updateStatus("08", entAppReService, indAppReService, pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return ;
			} else if (response.body().contains("用户被锁定")) {
				logger.info("用户被锁定。 用户名：" + pd.getString("USERNAME"));
				System.out.println("用户被锁定。 用户名：" + pd.getString("USERNAME"));
				updateStatus("09", entAppReService, indAppReService, pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return ;
			} else if (response.body().contains("密码已经过期")) {
				logger.info("******************密码过期******************");
				System.out.println("******************密码过期******************");
				updateStatus("10", entAppReService, indAppReService, pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return ;
			} else if (response.body().contains("机构代码错误")) {
				logger.info("机构代码错误。 机构代码：" + pd.getString("ORGCODE"));
				System.out.println("机构代码错误。 机构代码：" + pd.getString("ORGCODE"));
				updateStatus("11", entAppReService, indAppReService, pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return;
			} else if (response.body().contains("证书验签失败")) {
				logger.info("证书验签失败：" + pd.getString("USERNAME"));
				System.out.println("证书验签失败：" + pd.getString("USERNAME"));
				updateStatus("13", entAppReService, indAppReService, pd.getString("ID"));
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);
				return;
			}
			// 登录成功
			logger.info(pd.getString("ID") + "登录成功...............................");
			cookies = response.cookies();
			// 获取页面动态token
			url = serverInfo.getString("URL_TOKEN");
			response = Util.queryContentOfCharset(url, map, cookies, Method.GET, "UTF-8");
			JSONObject json_token = JSONObject.fromObject(response.body());

			logger.info("token信息" + json_token + "+++++++++++++++++++++++");
			// 二、提交页面1
			map1.put("声明", webInfo.getString("COM_STATEMENT"));
			map1.put("csrfToken", json_token.getString("token"));
			// 下拉框参数信息
			// 数据字典参数一一映射 -----start-----
			PageData pDict_code = new PageData();
			// 信用报告版本
			pDict_code.put("dict_name", "reportVersion_com");
			pDict_code.put("o_code", "1.0");
			PageData p_code = indAppReService.findWebCrawlerDictByCode(pDict_code);
			// map1.put("reportVersion",p_code.getString("C_CODE"));2461994230655001600
			map1.put("reportVersion", "2461994230655001600");
			// 信用报告封装格式
			pDict_code.put("dict_name", "reportFormat_com");
			pDict_code.put("o_code", "html");
			p_code = indAppReService.findWebCrawlerDictByCode(pDict_code);
			// map1.put("reportFormat",p_code.getString("C_CODE"));
			map1.put("reportFormat", "2492639467253369856");
			// 其他证件类型
			if (pd.getString("otherIdentityTypeID") != null && !("").equals(pd.getString("otherIdentityTypeID"))) {
				pDict_code.put("dict_name", "otherIdentityTypeID");
				pDict_code.put("o_code", pd.getString("otherIdentityTypeID"));
				p_code = indAppReService.findWebCrawlerDictByCode(pDict_code);
				map1.put("otherIdentityTypeID", p_code.getString("C_CODE"));
				// 其他证件号码
				map1.put("otherIdentityCode", pd.getString("otherIdentityCode"));
			}
			// 查询原因
			switch (pd.getString("queryReasonID")) {
			case "10":
				pDict_code.put("o_code", "01");
				break;
			case "20":
				pDict_code.put("o_code", "02");
				break;
			case "30":
				pDict_code.put("o_code", "03");
				break;
			case "40":
				pDict_code.put("o_code", "05");
				break;
			case "50":
				pDict_code.put("o_code", "18");
				break;
			case "90":
				pDict_code.put("o_code", "04");
				break;
			default:
				pDict_code.put("o_code", "01");
				break;
			}
			pDict_code.put("dict_name", "queryReasonID");
//			pDict_code.put("o_code", pd.getString("queryReasonID"));
			p_code = indAppReService.findWebCrawlerDictByCode(pDict_code);
			map1.put("queryReasonID",p_code.getString("C_CODE"));
			map1.put("queryReasonID", "1078953");
			// 20191023新增
			pDict_code.put("dict_name", "reportFormatText");
			pDict_code.put("o_code", "2");
			p_code = indAppReService.findWebCrawlerDictByCode(pDict_code);
			// map1.put("reportFormatText",p_code.getString("C_CODE"));html格式
			map1.put("reportFormatText", "html格式");
			// 数据字典参数一一映射 -----end-----

			// 输入框参数信息
			// 中征码
			if (pd.getString("signCode") != null && !("").equals(pd.getString("signCode"))) {
				map1.put("signCode", pd.getString("signCode"));
			}
			// 统一社会信用代码
			if (pd.getString("uniformSocialCredCode") != null && !("").equals(pd.getString("uniformSocialCredCode"))) {
				map1.put("uniformSocialCredCode", pd.getString("uniformSocialCredCode"));
			}
			// 组织机构代码
			if (pd.getString("orgInstCode") != null && !("").equals(pd.getString("orgInstCode"))) {
				map1.put("orgInstCode", pd.getString("orgInstCode"));
			}
			map1.put("backUrl", "");
			map1.put("protocolID", "");
			map1.put("entCertID", "");
			map1.put("certName", "");// 企业ID（人行获取）
			// 20191220 数字签名新增请求参数 start
			map1.put("signinfo", "");
			map1.put("forminfo", "");
			// 拼接$("#personDir-form").serialize();
			StringBuffer sb = new StringBuffer();
			Set<String> keySet = map1.keySet();
			for (String key : keySet) {
				sb.append(key).append("=").append(map1.get(key)).append("&");
			}
			String signinfo = sb.substring(0, sb.length() - 1);
			// 签名服务器加密
			web_user.put("reportMessage", signinfo);
			String signedInfo = NetSignUtil.generateBondMsgSign(web_user);
			map1.put("signinfo", signedInfo);
			map1.put("forminfo", signinfo);
			// 20191220 end
			// url =
			// "http://9.88.47.3/creditreference/v2/test/web-bank-manage/companydir/getInstList.action";
			url = serverInfo.getString("URL_COM1");
			response = Util.queryContentOfCharset(url, map1, cookies, Method.POST, "UTF-8");
			logger.info("++++++++++++++" + "URL_COM1" + "+" + response.body() + "...............................");
			JSONObject json = JSONObject.fromObject(response.body());
			logger.info("+++++++++++++++++" + json + "获取页面动态token4...............................");

			// 将爬出的html文件放置的文件夹创建好--------- start-------
			String id = pd.getString("ID");
			String path = PathUtil.getClasspath() + Const.FILEPATHIMG;
			String htmlPath = path + id + "/" + id + ".html"; // html报告路径
			String ftpFileName = id + ".zip"; // ftp服务器存放报告的文件名
			String localFilePath = path + ftpFileName; // 压缩文件路径
			String tmpPath = null; // 临时文件

			File f = new File(path + id);
			if (!f.exists()) {
				f.mkdir(); // 创建目录
			}

			// 将爬出的html文件放置的文件夹创建好--------- end-------
			// 查无此人
			if (json.get("companyList").equals(JSONNull.getInstance())) {
				// 根据模板，生成查无此人的html报告
				try {
					// XmlToHtml.createHtml_com(htmlPath, pd);
					PageData pdStatus = new PageData();
					pdStatus.put("STATUS", "05");
					pdStatus.put("ID", id);
					indAppReService.updateStatus(pdStatus);
					return ;
				} catch (Exception e) {
					// TODO: handle exception
					logger.info("生成查无此人模板出错！");
					logger.error(e);
				}

			} else {
				// 三、企业提交页面2 (与提交页面1公用参数map)
				// url =
				// "http://9.88.47.3/creditreference/v2/test/web-bank-manage/companydir/queryCreditReportAjax.action";
				url = serverInfo.getString("URL_COM2");
				JSONArray jsonArray = (JSONArray) json.get("companyList");
				json = (JSONObject) jsonArray.get(0);
				map1.put("certName", json.getString("comName"));// 企业名称
				map1.put("entCertID", json.getString("entCertId"));// 企业ID
				response = Util.queryContentOfCharset(url, map1, cookies, Method.POST, "UTF-8");
				logger.info("++++++++++++++" + "URL_COM2" + "+" + response.body() + "...............................");
				json = JSONObject.fromObject(response.body());
				logger.info("+++++++++++++++++" + json + "获取页面动态token4...............................");
				// 四、征信报告页面
				// url =
				// "http://9.88.47.3/creditreference/v2/test/web-bank-manage/companydir/viewReport.action?fileID="+json.getString("fileID");
				url = serverInfo.getString("URL_COM3") + json.getString("fileID");
				map2.put("fileID", json.getString("fileID"));
				response = Util.queryContentOfCharset(url, map2, cookies, Method.POST, "UTF-8");
				pageBody = response.body();
				// logger.info("++++++++++++++"+"URL_COM3"+"+"+response.body()
				// +"...............................");

				try {
					if (!pageBody.contains("本报告由中国人民银行征信中心出具")) {
						response = Util.queryContentOfCharset(url, map2, cookies, Method.POST, "UTF-8");
						pageBody = response.body();
						if (!pageBody.contains("本报告由中国人民银行征信中心出具")) {
							response = Util.queryContentOfCharset(url, map2, cookies, Method.POST, "UTF-8");
							pageBody = response.body();
						}
					}
				} catch (Exception e) {
					logger.error("爬取页面时出错" + e.getMessage(), e);
				}

				// ComWebCrawler.setFlag(false);
				// ComClawerUtil cl = new ComClawerUtil();
				// //将爬取的html代码解析并入库
				// cl.comParseHtml(pd,response.body(),indAppReService,
				// companyCrawlerService);

				// 调用报文报送方法
				try {
					boolean report = indAppReService.findQueryType("REPORTTYPE");
					if(report){
						iDataSubmissionService.sendSubmissionData(pd.getString("ID"), "2");
					}
				} catch (Exception e1) {
					logger.info("报文报送异常!");
					logger.error(e1.getMessage(), e1);
				}
				//爬取结束直接修改爬取状态并释放锁,无论爬取失败还是成功,放锁状态为自身正常放锁
				pd.put("RELEASE_LOCK_STSTUS", "1");
				indAppReService.updateQueueReleaseLock(pd);

				// 处理html代码
				pageBody = pageBody.replaceAll("../resources/product/", "../../../static/resources/product/");
				pageBody = pageBody.replace("</html>",
						"<script src=\"../../js/common/jquery-1.10.2.js\"></script><SCRIPT>function printReport(){ javascript:document.execCommand('print');$.ajax({async:false,cache:false,data:{\"ID\":'"
								+ pd.getString("ID")
								+ "'},url:'../../../PersonReportInquiry/isPrint.do',type:\"post\" });}</SCRIPT><script>document.oncontextmenu = function(){return false;}</script>"
								+ "<form method=\"POST\" action=\"--WEBBOT-SELF--\">" + " <p align=\"center\"> "
								+ "	<input onMouseOver=\"msover();\" style=\"border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58\" onMouseOut=\"msout();\" type=\"button\" name=\"doPrint\" value=\"打  印\" class=\"button2\" onclick=\"printReport()\"/>&#160;&#160;"
								+ "	<input onMouseOver=\"msover();\" style=\"border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58\" onMouseOut=\"msout();\" type=\"button\" name=\"goBack\" value=\"关  闭\" class=\"button1\" onclick=\"window.location.href=document.referrer;\"/> </p> "
								+ "<br>" + "<br>" + "<br>" + "<br>" + "<br>" + "<br>" + "</form></html>");
				pageBody = pageBody.replace("</html>",
						"<script src=\"../../../static/reportStyle/shuiyin.js\"></script><script type=\"text/javascript\">watermark({\"watermark_txt\":\"张三提供\"});</script>");
				// 将爬取的html代码写入文件
				try {
					FileUtil.writeFile(htmlPath, pageBody, "UTF-8");
				} catch (Exception e) {
					// TODO: handle exception
					logger.error("将爬取的html代码写入文件出错！", e);
				}
			}
			try {
				// 压缩上传文件
				String zipPasswd = id.substring(0, 6);
				CompressUtils.zip(path + id + "/", localFilePath, true, zipPasswd);
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
				// ); //将压缩的zip报告上传ftp服务器8
				// delFile(localFilePath); //删除压缩文件
				delFile(tmpPath); // 删除替换数据字典前的html页面
				delFile(htmlPath); // 删除替换数据字典后的html页面
				delFile_Dir(path + id + "/"); // 删除本地文件夹
			} catch (Exception e) {
				logger.error("爬虫html文件上传ftp服务器出错", e);
			}

			// 因页面解析太慢，因此将解析最后执行
			Thread ru = new ComClawerUtil(pd, response.body(), indAppReService, companyCrawlerService);
			// 将爬取的html代码解析并入库
			ru.start();
			
		} catch (Exception e) {
			//爬取结束直接修改爬取状态并释放锁,无论爬取失败还是成功,放锁状态为自身异常放锁
			try {
				pd.put("RELEASE_LOCK_STSTUS", "2");
				indAppReService.updateQueueReleaseLock(pd);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			status = "04";
			updateStatus(status, entAppReService, indAppReService, pd.getString("ID"));
			// dr.quit();
			logger.info("报告页跳转加载异常");
			logger.info("报错URL页面:" + url);
			logger.error(e.getMessage(), e);
		}

	}

	// 登录系统及中间页面处理
	public static void getWebInfo(PageData pd, CrawlEntAppReManager entAppReService,
			CompanyCrawlerManager companyCrawlerService, CrawlIndAppReManager indAppReService,
			IDataSubmissionService iDataSubmissionService) {
		String ipStr = pd.getString("URL3");

		Response response = null;
		Map<String, String> cookies = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		try {
			// 登陆
			logger.info(pd.getString("ID") + "登录...........");
			map.put("orgCode", pd.getString("ORGCODE"));
			map.put("userid", pd.getString("USERNAME"));
			map.put("password", PasswordOper.decode(pd.getString("PASSWORD")));
			String url = ipStr + "logon.do";
			response = Util.queryContentOfCharset(url, map, cookies, Method.POST, "GBK");
			if (response.statusCode() != 200) {
				logger.info("登录系统时,网络请求异常" + response.statusCode());
				System.out.println("登录系统时,网络请求异常" + response.statusCode());
				updateStatus("04", entAppReService, indAppReService, pd.getString("ID"));
				return;
			}
			if (response.body().contains("密码错误")) {
				logger.info("密码错误。  密码：" + PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("密码错误。  密码：" + PasswordOper.decode(pd.getString("PASSWORD")));
				updateStatus("07", entAppReService, indAppReService, pd.getString("ID"));
				// 如果密码错误，将人行账户状态置为0锁定状态
				pd.put("PERBANK_STATUS", "0");
				indAppReService.updateCreditStatus(pd);
				return;
			} else if (response.body().contains("用户不存在")) {
				logger.info("用户不存在。 用户名：" + pd.getString("USERNAME") + " 密码："
						+ PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("用户不存在。 用户名：" + pd.getString("USERNAME") + " 密码："
						+ PasswordOper.decode(pd.getString("PASSWORD")));
				updateStatus("07", entAppReService, indAppReService, pd.getString("ID"));
				return;
			} else if (response.body().contains("帐号被停用")) {
				logger.info("帐号被停用。 用户名：" + pd.getString("USERNAME"));
				System.out.println("帐号被停用。 用户名：" + pd.getString("USERNAME"));
				updateStatus("08", entAppReService, indAppReService, pd.getString("ID"));
				return;
			} else if (response.body().contains("用户被锁定")) {
				logger.info("用户被锁定。 用户名：" + pd.getString("USERNAME"));
				System.out.println("用户被锁定。 用户名：" + pd.getString("USERNAME"));
				updateStatus("09", entAppReService, indAppReService, pd.getString("ID"));
				return;
			} else if (response.body().contains("密码已经过期")) {
				logger.info("******************密码过期******************");
				System.out.println("******************密码过期******************");
				updateStatus("10", entAppReService, indAppReService, pd.getString("ID"));
				return;
			} else if (response.body().contains("机构代码错误")) {
				logger.info("机构代码错误。 机构代码：" + pd.getString("ORGCODE"));
				System.out.println("机构代码错误。 机构代码：" + pd.getString("ORGCODE"));
				updateStatus("11", entAppReService, indAppReService, pd.getString("ID"));
				return;
			}
			logger.info(pd.getString("ID") + "登录成功...............................");
			cookies = response.cookies();
			url = ipStr + "newconfirmProfessionReport.do";
			map.clear();

			if ("10".equals(pd.getString("TYPE"))) {
				// 机构信用代码
				map.put("creditcode", pd.getString("CODE"));
			} else {
				map.put("creditcode", "");
			}
			if ("11".equals(pd.getString("TYPE"))) {
				// 中征码
				map.put("loancardno", pd.getString("CODE"));
			} else {
				map.put("loancardno", "");
			}
			if ("12".equals(pd.getString("TYPE"))) {
				// 组织机构代码
				map.put("corpno", pd.getString("CODE"));
			} else {
				map.put("corpno", "");
			}
			List<String> listType = new ArrayList<String>();
			listType.add("01");
			listType.add("02");
			listType.add("03");
			listType.add("04");
			listType.add("05");
			listType.add("06");
			listType.add("07");
			listType.add("08");
			listType.add("99");
			if (listType.contains(pd.getString("TYPE"))) {
				// 登记注册类型
				map.put("regitypecode", pd.getString("TYPE"));
				// 登记注册码
				map.put("frgcorpno", pd.getString("CODE"));
			} else {
				map.put("regitypecode", "");
				map.put("frgcorpno", "");
			}
			if ("13".equals(pd.getString("TYPE"))) {
				// 纳税人识别号(国税)
				map.put("gsregino", pd.getString("CODE"));
			} else {
				map.put("gsregino", "");
			}
			if ("14".equals(pd.getString("TYPE"))) {
				// 纳税人识别号(地税)
				map.put("dsregino", pd.getString("CODE"));
			} else {
				map.put("dsregino", "");
			}

			map.put("type", "20");
			map.put("searchreason", pd.getString("QUERY_REASON"));
			map.put("attribute", "0");
			map.put("displayreason", "1");
			map.put("offline", "null");
			map.put("radioValue", "0");
			map.put("searchType", "1");

			System.out.println("creditcode----------------" + map.get("creditcode")
					+ "///loancardno************************" + map.get("loancardno"));
			System.out.println("corpno----------------" + map.get("corpno") + "///regitypecode************************"
					+ map.get("regitypecode"));
			System.out.println("frgcorpno----------------" + map.get("frgcorpno") + "//gsregino************************"
					+ map.get("gsregino"));
			System.out.println("dsregino----------------" + map.get("dsregino") + "//type************************"
					+ map.get("type"));
			System.out.println("searchreason----------------" + map.get("searchreason")
					+ "//attribute************************" + map.get("attribute"));
			System.out.println("displayreason----------------" + map.get("displayreason")
					+ "//offline************************" + map.get("offline"));
			System.out.println("radioValue----------------" + map.get("radioValue")
					+ "//searchType************************" + map.get("searchType"));
			System.out.println("////////cookies----------------" + cookies);

			try {
				response = Util.queryContentOfCharset(url, map, cookies, Method.POST, "GBK");
				if (response.statusCode() != 200) {
					logger.info("企业征信数据爬取失败【条件输入界面》》》报告页面跳转失败】,网络请求异常" + response.statusCode());
					System.out.println("企业征信数据爬取失败【条件输入界面》》》报告页面跳转失败】,网络请求异常" + response.statusCode());
					updateStatus("04", entAppReService, indAppReService, pd.getString("ID"));
					return;
				}
			} catch (Exception e) {
				logger.error("企业征信数据爬取失败【条件输入界面》》》报告页面跳转失败】" + response.statusCode() + e.getMessage(), e);
				logger.error("企业征信数据爬取失败【条件输入界面》》》报告页面跳转失败】报告体：" + response.body());
				System.out.println("企业征信数据爬取失败【条件输入界面》》》报告页面跳转失败】" + response.statusCode());
				updateStatus("04", entAppReService, indAppReService, pd.getString("ID"));
				return;
			}
			System.out.println(pd.getString("ID") + "****************准备展开详情页面*********************************");
			logger.info(pd.getString("ID") + "****************准备展开详情页面*********************************");
			Document document = Jsoup.parse(response.body());
			if (!document.toString().contains("借款人信息不存在")) {
				for (int i = 0; i < 3; i++) {
					try {
						url = ipStr + "professionReportExpend.do";
						map.clear();
						String borrow = document.getElementById("borrowernamecn").attr("value");
						map.put("borrowernamecn", borrow);
						map.put("borrownatuCode", "1");
						map.put("crccode", document.getElementById("crccode").attr("value"));
						map.put("creditCode", document.getElementById("creditCode").attr("value"));
						map.put("financecode", pd.getString("ORGCODE"));
						map.put("loancardcode", document.getElementById("loancardcode").attr("value"));
						map.put("reportcode", document.getElementById("reportcode").attr("value"));
						map.put("reqid", document.getElementById("reqid").attr("value"));
						map.put("searchReason", document.getElementById("searchReason").attr("value"));
						map.put("searchReason", document.getElementById("searchReason").attr("value"));
						map.put("searchReasonCode", document.getElementById("searchReasonCode").attr("value"));
						map.put("searchReasonCode", document.getElementById("searchReasonCode").attr("value"));
						map.put("sz_zk.x", "40");
						map.put("sz_zk.y", "10");
						response = Util.queryContentOfCharset(url, map, cookies, Method.POST, "GBK");
						if (response.statusCode() != 200) {
							logger.info("第" + i + 1 + "报告页面展开失败" + response.statusCode());
							System.out.println("第" + i + 1 + "报告页面展开失败" + response.statusCode());
							updateStatus("04", entAppReService, indAppReService, pd.getString("ID"));
							return;
						}
					} catch (Exception e) {
						logger.info("第" + i + 1 + "报告页面展开失败" + response.statusCode());
						System.out.println("第" + i + 1 + "报告页面展开失败" + response.statusCode());
						updateStatus("04", entAppReService, indAppReService, pd.getString("ID"));
						return;
					}
					if (response.body().contains("winprint")) {
						break;
					}
				}
			}
			System.out.println(pd.getString("ID") + "****************详情页面展开完成*********************************");
			logger.info(pd.getString("ID") + "****************详情页面展开完成*********************************");
			try {
				// 爬取页面数据
				new BeginCrawlerInfo().crawlerInfo(response.body(), entAppReService, companyCrawlerService, pd,
						indAppReService, cookies);
			} catch (Exception e) {
				updateStatus("04", entAppReService, indAppReService, pd.getString("ID"));
				logger.error(e.getMessage(), e);
				return;
			}

			// 调用报文报送方法
			try {
				iDataSubmissionService.sendSubmissionData(pd.getString("ID"), "2");
			} catch (Exception e) {
				logger.error("报文报送异常!");
				logger.error(e.getMessage(), e);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			updateStatus("04", entAppReService, indAppReService, pd.getString("ID"));
		}
	}

	// 更新信息表中状态
	@Transactional
	public static void updateStatus(String flag, CrawlEntAppReManager entAppReService, CrawlIndAppReManager indAppReService,
			String ID) {
		/// 更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
		try {
			PageData pd = new PageData();
			pd.put("ID", ID);
			pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("STATUS", flag);
			// pd.put("REPORT_ID", reportId);
			// 更新状态表
			if ("06".equals(flag) || "06" == flag) {
				pd.put("IS_GET", "1");
				pd.put("RESULTCODE", "AAA000");
			} else {
				pd.put("IS_GET", "0");
				pd.put("RESULTCODE", "");
			}
			indAppReService.updateCheck(pd);
			// 更新明细表
			entAppReService.UpdateCDetailCheck(pd);
		} catch (Exception e) {
			logger.info("更新状态失败");
			logger.error(e.getMessage());
		}
	}

	/**
	 * 删除文件
	 * 
	 * @param path
	 */
	private static void delFile(String path) {
		try {
			if (!StringUtil.isEmpty(path)) {
				File file = new File(path);
				if (file.exists()) {
					if (file.isFile()) {
						file.delete();
					} else if (file.isDirectory()) {
						File[] arrFile = file.listFiles();
						for (File fi : arrFile) {
							delFile(fi.getAbsolutePath());
						}
						file.delete();
					}
				}
			}
		} catch (Exception e) {
			logger.error("IndAppReController.delFile方法出错", e);
		}
	}

	/**
	 * 删除文件夹
	 * 
	 * @param path
	 */
	@SuppressWarnings("unused")
	private static void delFile_Dir(String path) {
		try {
			if (!StringUtil.isEmpty(path)) {
				File file = new File(path);
				if (file.isDirectory()) {
					file.delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
