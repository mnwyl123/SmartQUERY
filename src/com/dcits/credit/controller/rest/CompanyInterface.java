package com.dcits.credit.controller.rest;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Component;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.credit.controller.rest.util.MyRejectedExecutionHandler;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.entity.WbCopyFileRunnable;
import com.dcits.credit.entity.WebServiceRunnable;
import com.dcits.credit.entity.WebServiceRunnable_batch;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.QueryDateOperatorService.QueryDateOperatorManager;
import com.dcits.credit.service.companyInquiry.CompanyInquiryManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.rest.CompanyInterfaceService;
import com.dcits.credit.service.rest.ReportInterfaceService;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ThreadInnerCrawler;
import com.dcits.credit.util.WbqqInnerRunnable;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.UuidUtil;
import com.dcits.platform.util.ZipStrUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/** 
 * 企业公共接口
 * 
 */ 
@Component
@Path("/companyInterface")
public class CompanyInterface extends BaseController{  
	@Resource(name="PersonInquiryService")
	public PersonInquiryManager personInquiryService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name="CompanyInquiryService")
	private CompanyInquiryManager companyInquiryService;
	@Resource(name="entAppReService")
	private EntAppReManager entAppReService;
	@Resource(name="reportInterfaceService")
	private ReportInterfaceService reportService;
	@Resource(name="queryDateService")
	private QueryDateOperatorManager queryDateService;
	@Resource(name="CompanyInterfaceService")
	private CompanyInterfaceService CompanyService ;
	@Resource(name="dataSubmissionService")
	private IDataSubmissionService iDataSubmissionService;
	
	@Resource(name = "crawlIndAppReService")
	private CrawlIndAppReManager crawlIndAppReService;
	@Resource(name = "crawlPersonCrawlerService")
	private PersonCrawlerManager crawlPersonCrawlerService;
	@Resource(name = "crawlDataSubmissionService")
	private com.dcits.crawl.service.dataSubmission.IDataSubmissionService crawlDataSubmissionService;
	@Resource(name = "crawlEntAppReService")
	private CrawlEntAppReManager crawlEntAppReService;
	@Resource(name = "crawlCompanyCrawlerService")
	private CompanyCrawlerManager crawlCompanyCrawlerService;
	
	//查询接口队列
	ThreadPoolExecutor executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))),new MyRejectedExecutionHandler());
	//报告搬运队列
	ThreadPoolExecutor copyExecutor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))),new MyRejectedExecutionHandler());
	@POST
	@Path("/queryRequest")
	public JSONObject queryRequest(InputStream is){
		 PageData pd =new PageData();
		JSONObject json = new JSONObject();
		JSONObject returnjson = new JSONObject();
		JSONObject jsonReturnstr = new JSONObject();
		String sysNo="1";
		BufferedReader br;
		String lines;
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			 returnjson.put("errorcode", "08");
			 returnjson.put("errormsg", "系统维护中");
			 return returnjson;
		}
		try {
			br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查询企业申请请求报文："+json);
			System.out.println("request json............" + json);
			
			//提取字段，判断字段
			if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(USERNAME)");
				return returnjson;
			}
//			if(json.get("CHANNEL_ID")!=null&&!json.get("CHANNEL_ID").equals("")){
//				pd.put("CHANNEL_ID", json.get("CHANNEL_ID"));//渠道编号
//				PageData QueryCHANNELNO=new PageData();
//				QueryCHANNELNO = personInquiryService.findByCHANNELNO(pd);
//				if(QueryCHANNELNO!=null&&!QueryCHANNELNO.equals("")){
//					if("1".equals(QueryCHANNELNO.getString("CHANNEL_STATUS"))){
//						logger.info("渠道状态停用，请去渠道信息页面维护");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常(CHANNEL_ID)");
//						return returnjson;
//					}
//				}else{
//					logger.info("渠道编号不存在，请去渠道信息页面维护");
//					returnjson.put("errorcode", "03");
//					returnjson.put("errormsg", "接口参数异常(CHANNEL_ID)");
//					return returnjson;
//				}
//			}else{
//				logger.info("CHANNEL_ID参数异常");
//				returnjson.put("errorcode", "03");
//				returnjson.put("errormsg", "接口参数异常(CHANNEL_ID)");
//				return returnjson;
//			}
			if(json.get("CHANNEL_QUERY_NO")!=null&&!json.get("CHANNEL_QUERY_NO").equals("")){
				pd.put("CHANNEL_QUERY_NO", json.get("CHANNEL_QUERY_NO"));//渠道流水号
			}else{
				logger.info("CHANNEL_QUERY_NO参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(CHANNEL_QUERY_NO)");
				return returnjson;
			}
			if(json.get("CLIENT_NAME")!=null&&!json.get("CLIENT_NAME").equals("")){
				pd.put("COMPANY_NAME",json.get("CLIENT_NAME"));//客户姓名
			}else{
				logger.info("COMPANY_NAME参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(COMPANY_NAME)");
				return returnjson;
			}
			if(json.get("CREDENTIALS_NO_TYPE")!=null&&!json.get("CREDENTIALS_NO_TYPE").equals("")){
				pd.put("CREDENTIALS_NO_TYPE", json.get("CREDENTIALS_NO_TYPE"));//证件类型
				pd.put("TYPE", json.get("CREDENTIALS_NO_TYPE"));
			}else{
				logger.info("CREDENTIALS_NO_TYPE参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(CREDENTIALS_NO_TYPE)");
				return returnjson;
			}
			if(json.get("CHINA_CREDIT_CODE")!=null&&!json.get("CHINA_CREDIT_CODE").equals("")){
				pd.put("CODE", json.get("CHINA_CREDIT_CODE"));
				pd.put("CHINA_CREDIT_CODE", json.get("CHINA_CREDIT_CODE"));//证件号码
			}else{
				logger.info("CHINA_CREDIT_CODE参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(CHINA_CREDIT_CODE)");
				return returnjson;
			}
			if(json.get("QUERY_REASON")!=null&&!json.get("QUERY_REASON").equals("")){
				pd.put("QUERY_REASON", json.get("QUERY_REASON"));//查询原因
			}else{
				logger.info("QUERY_REASON参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(QUERY_REASON)");
				return returnjson;
			}
			if("1".equals(json.get("IS_CHECK_IMAGE"))){ //是否核验影像资料 1：是， 0：否
				if(json.get("CUST_MANAGER")!=null&&!json.get("CUST_MANAGER").equals("")){
					pd.put("CUST_MANAGER",json.get("CUST_MANAGER"));//客户经理
				}else{
					logger.info("CUST_MANAGER参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常(CUST_MANAGER)");
					return returnjson;
				}
				if(json.get("WARRANT_MATURITY_DATE")!=null&&!json.get("WARRANT_MATURITY_DATE").equals("")){
					pd.put("WARRANT_MATURITY_DATE",json.get("WARRANT_MATURITY_DATE"));//授权书到期日
				}else{
					logger.info("WARRANT_MATURITY_DATE参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常(WARRANT_MATURITY_DATE)");
					return returnjson;
				}
			}
			if("0".equals(json.get("IS_USE")) || "1".equals(json.get("IS_USE"))){
				pd.put("IS_USE", json.get("IS_USE"));//如果有近期报告，是否使用，1：是  0：否
			}else{
				logger.info("IS_USE参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(IS_USE)");
				return returnjson;
			}
			if(!json.get("PRO_ID").equals("")){
				pd.put("PRO_ID", json.get("PRO_ID"));//产品渠道号
			}else{
				logger.info("PRO_ID参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(PRO_ID)");
				return returnjson;
			}
			if(json.has("YWLB")){//业务类别
				if(!json.get("YWLB").equals("")){
					pd.put("YWLB", json.get("YWLB"));
				}
			}
			if(json.has("CUST_MANAGER")){//客户经理姓名
				if(!json.get("CUST_MANAGER").equals("")){
					pd.put("CUST_MANAGER", json.get("CUST_MANAGER"));
				}
			}
			if(json.has("LSID")){//原系统查询流水号
				if(!json.get("LSID").equals("")){
					if(!json.get("LSID").equals("\"null\"")){
						pd.put("LSID", json.get("LSID"));
					}else {
						pd.put("LSID", "");
					}
				}
			}
			if(json.has("YWSHS")){//业务申请书编号
				if(!json.get("YWSHS").equals("")){
					pd.put("YWSHS", json.get("YWSHS"));
				}
			}
			if(json.has("YWFF")){//业务发放时间
				if(!json.get("YWFF").equals("")){
					pd.put("YWFF", json.get("YWFF"));
				}
			}
			if(json.has("USEPERSON")){//报告使用人
				if(!json.get("USEPERSON").equals("")){
					pd.put("USEPERSON", json.get("USEPERSON"));
				}
			}
			if(json.has("MQNAME")){//面签授权人
				if(!json.get("MQNAME").equals("")){
					pd.put("MQNAME", json.get("MQNAME"));
				}
			}
			if(json.has("YMQNAME")){//面签审核人
				if(!json.get("YMQNAME").equals("")){
					pd.put("YMQNAME", json.get("YMQNAME"));
				}
			}
			if(json.has("SQTIME")){//授权时间
				if(!json.get("SQTIME").equals("")){
					pd.put("SQTIME", json.get("SQTIME"));
				}
			}
			if(json.has("WARRANT_MATURITY_DATE")){//授权书到期日
				if(!json.get("WARRANT_MATURITY_DATE").equals("")){
					pd.put("WARRANT_MATURITY_DATE", json.get("WARRANT_MATURITY_DATE"));
				}
			}
			if(json.has("SHFS")){//授权方式
				if(!json.get("SHFS").equals("")){
					pd.put("SHFS", json.get("SHFS"));
				}
			}
			if(json.has("SFYD")){//是否异地查询
				if(!json.get("SFYD").equals("")){
					pd.put("SFYD", json.get("SFYD"));
				}
			}
			if(json.has("RLSB")){//有无人脸识别
				if(!json.get("RLSB").equals("")){
					pd.put("RLSB", json.get("RLSB"));
				}
			}
			if(json.has("QUERY_VERSION")){//查询版本
				if(!json.get("QUERY_VERSION").equals("")){
					pd.put("QUERY_VERSION", json.get("QUERY_VERSION"));
				}else {
					pd.put("QUERY_VERSION", "30");
				}
			}
			if(json.has("OSYSNO")){//查询源系统编号
				if(!json.get("OSYSNO").equals("")){
					if(json.get("OSYSNO").equals("\"null\"")) {
						pd.put("OSYSNO", "");
					}else {
						pd.put("OSYSNO", json.get("OSYSNO"));
					}
				}
			}
			if(json.has("SFYD")){//是否异地查询
				if(!json.get("SFYD").equals("")){
					pd.put("SFYD", json.get("SFYD"));
				}
			}
			if(json.has("USEPERSON")){//报告使用人
				if(!json.get("USEPERSON").equals("")){
					pd.put("USEPERSON", json.get("USEPERSON"));
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}	
		
		PageData orgMap=new PageData();
		String ORG_CODE="";
		String is_use = pd.getString("IS_USE"); //有近期报告，是否使用  0:否  1:是
		String type="2"; //客户类型
		String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
		pd.put("DATA_DATE",date);
		try{
			orgMap=personInquiryService.findOrg(pd);
			if(orgMap!=null){
				ORG_CODE=orgMap.getString("ORG_CODE");
			}else{
				logger.info("用户无查询权限");
				returnjson.put("errorcode", "07");
				returnjson.put("errormsg", "用户无查询权限");
				return returnjson;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		int repeatQueryNoAndQueryStatus = 0; //0-流水号不重复  1-流水号重复，并且上次查询成功 2-流水号重复，并且上次查询失败
		//校验同一渠道，渠道流水号是否重复
		PageData QueryNoMap=new PageData();
		try {
			QueryNoMap=personInquiryService.findByQueryNo(pd);
			if(QueryNoMap!=null&&!QueryNoMap.equals("")){
				if("06".equals(QueryNoMap.getString("STATUS"))||"05".equals(QueryNoMap.getString("STATUS"))){
					logger.info("流水号重复");
					repeatQueryNoAndQueryStatus = 1;
					returnjson.put("errorcode", "04");
					returnjson.put("errormsg", "重复申请");
					return returnjson;
				}else if("04".equals(QueryNoMap.getString("STATUS"))||"02".equals(QueryNoMap.getString("STATUS"))||"07".equals(QueryNoMap.getString("STATUS"))||"08".equals(QueryNoMap.getString("STATUS"))||"09".equals(QueryNoMap.getString("STATUS"))||"10".equals(QueryNoMap.getString("STATUS"))){
					pd.put("CLIENT_TYPE", "2");
					pd.put("ID",QueryNoMap.getString("ID"));
					repeatQueryNoAndQueryStatus = 2;
				}
			}
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		if(repeatQueryNoAndQueryStatus == 0){
			String id=UuidUtil.get64UUID();
			pd.put("ID", id);
			String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
			pd.put("STATUS", "02");//状态 02已审核
			pd.put("CHECK_SYS_ID", "0");
			pd.put("AUDITORS","0");
			pd.put("INTERNAL", "2");
			pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
			pd.put("USER_ID", orgMap.get("USER_ID"));
			pd.put("ORG_ID", orgMap.get("ORG_ID"));
			pd.put("IP", orgMap.get("IP"));
			pd.put("MAC", orgMap.get("MAC"));
			pd.put("CLIENT_TYPE", "2");
//			pd.put("QUERY_VERSION", "30");
			pd.put("QUERY_TYPE", "1");
			
			PageData serverInfo=new PageData();
			/*----根据获取的参数数据向企业信息表中添加数据-------*/
			try{
				//获得配置文件配置信息
				serverInfo = BaseController.getServerInfo();
				serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
				String sourtPath = serverInfo.getString("ftpPath1")+pd.getString("CHANNEL_ID")+"/"+pd.getString("CHANNEL_QUERY_NO")+"/";
				String destPath = serverInfo.getString("ftpPath")+pd.getString("ID")+"/";
				if("1".equals(json.get("IS_CHECK_IMAGE"))){ //是否核验影像资料 1：是， 0：否
					//查看影像资料是否存在
					List<String> fileNameList = new ArrayList<String>();
			        fileNameList.add("LOAN_"+pd.getString("CHINA_CREDIT_CODE"));
			        fileNameList.add("WARR_"+pd.getString("CHINA_CREDIT_CODE"));
			        fileNameList.add("ID_"+pd.getString("CHINA_CREDIT_CODE"));
			        List<String> listName=FtpUtil.isFTPFileExist(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), sourtPath,fileNameList); 
			        if(listName.size()==0&&!"03".equals(pd.getString("QUERY_REASON"))){
			        	System.out.println("影像资料未上传");
			        	returnjson.put("errorcode", "05");
						returnjson.put("errormsg", "影像资料未上传");
						return returnjson;
			        }
			        //将图片搬到以ID命名的文件夹
			        if(listName.size()>0){
			        	WbCopyFileRunnable WbqqTask = new WbCopyFileRunnable(serverInfo,pd.getString("CODE"),listName,sourtPath,destPath,"2");
			        	copyExecutor.execute(WbqqTask);
			        	if(WbqqTask.flag){
							returnjson.put("errorcode", "09");
					        returnjson.put("errormsg", "资源已满，请稍后再试！");
					        return returnjson;
						}
			        }
				}
			}catch(Exception e){
				logger.error(e.getMessage(),e);
				returnjson.put("errorcode", "02");
				returnjson.put("errormsg", "系统异常");
				return returnjson;
			}
			PageData detail = new PageData();
			try{
				pd.put("CHINA_CREDIT_CODE", DESUtil.encrypt("enhjeA==",pd.getString("CHINA_CREDIT_CODE")));
				pd.put("COMPANY_NAME", DESUtil.encrypt("enhjeA==",pd.getString("COMPANY_NAME")));
				/*----根据获取的参数数据向企业信息表中添加数据-------*/
				companyInquiryService.save(pd);
				/*----根据获取的参数数据向流程状态表中添加数据--------*/
				companyInquiryService.saveToFs(pd);
			
				//查询明细表需要的数据
	 			detail = entAppReService.QueryEntDetail(pd.getString("ID"));
	 			//向明细表中插入数据
	 			entAppReService.saveEntDetail(detail);
			}catch(Exception e){
				logger.error(e.getMessage(),e);
				returnjson.put("errorcode", "02");
				returnjson.put("errormsg", "系统异常");
				return returnjson;
			}
		}
		//查询判断该笔是否可以行内查询
		/*************start**************/
		String limt_date = "0";
		String inner = "2";
		String report_id = "";
		String internal = "";
		String query_no = json.getString("CHANNEL_QUERY_NO");
		if(!"0".equals(is_use)){
			try {
				PageData queryDate = new PageData();
	//			queryDate.put("COMPANY", BaseController.getServerInfo().getString("channel_company"));
				queryDate.put("COMPANY", orgMap.get("COMPANY"));
				queryDate.put("PARA_TYPE", type);
				queryDate.put("ORG_ID", orgMap.getString("ORG_ID"));
				//判断当前法人是否设置了查询时长参数值
				queryDate = queryDateService.queryByTypeAndCompany(queryDate);
				if(queryDate!=null&&queryDate.get("LIMT_DATE")!=null){
					limt_date = String.valueOf(queryDate.get("LIMT_DATE"));
		 		}
				pd.put("LIMT_DATE", limt_date);
				//根据条件查询该客户在一定时间内是否被查询过
				PageData appInfo = entAppReService.findCompanyByInfo(pd);
	 			if(appInfo!=null&&appInfo.get("ID")!=null){
					internal = String.valueOf(appInfo.get("ID"));
	 				inner = String.valueOf(appInfo.get("CHANNEL_QUERY_NO"));
	 				report_id = String.valueOf(appInfo.get("REPORT_ID"));
	 			}
				if(inner!="2"&&!inner.equals("2")){  //行内查询
					//更新行内/人行字段
					PageData data = new PageData();
					data.put("INTERNAL", internal);
					data.put("ID", pd.getString("ID"));
		 			indAppReService.updateInner(data);
				}
			} catch (Exception e1) {
				logger.error(e1.getMessage(),e1);
				returnjson.put("errorcode", "02");
				returnjson.put("errormsg", "系统异常");
				return returnjson;
			}
		}
		/*************end**************/
		if(inner!="2"&&!inner.equals("2")){  //行内查询
			jsonReturnstr = new JSONObject();
			JSONObject jsonReturn = new JSONObject();
			try {
				pd.put("QUERY_NO", inner);
				pd.put("REPORT_ID", report_id);
				jsonReturnstr=CompanyService.getReportInfo(pd);
				pd.put("INTERNAL", "1");
				pd.put("ResultCode", "AAA000");
				pd.put("ResultDesc", "查询成功");
				pd.put("ReportName", "bankCreditReport.xml");
				indAppReService.updateInner(pd);
				indAppReService.updateResult(pd);
				Thread innerCraw = new ThreadInnerCrawler(pd, internal,"2",report_id,indAppReService,entAppReService);
				innerCraw.start();
				String Str = jsonReturnstr.toString();
				Str = ZipStrUtil.compress(Str);
				logger.debug("+++++++++++++++++++++++++++++++++++"+ Str );
				logger.debug("+++++++++++++++++++++++++++++++++++"+ inner );
				jsonReturn.put("bizData", Str);
				jsonReturn.put("errorcode", "01");
				jsonReturn.put("errormsg", "正常受理");
				jsonReturn.put("CHANNEL_QUERY_NO", query_no);
				return jsonReturn;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(),e);
				jsonReturn.put("errorcode", "02");
				jsonReturn.put("errormsg", "系统异常");
				jsonReturn.put("CHANNEL_QUERY_NO", query_no);
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}
		}else{  //人行查询
//			WbqqComRunnable WbqqTask = new WbqqComRunnable(pd,type,indAppReService);
//			executor.execute(WbqqTask);
			WebServiceRunnable webServiceTask = new WebServiceRunnable(pd,"2",indAppReService,entAppReService,iDataSubmissionService,
					crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
 	 		executor.execute(webServiceTask);
 	 		if(webServiceTask.flag){
				returnjson.put("errorcode", "09");
		        returnjson.put("errormsg", "资源已满，请稍后再试！");
		        return returnjson;
			}
		}
        System.out.println("线程池中线程数目："+executor.getPoolSize()+"，队列中等待执行的任务数目："+
        executor.getQueue().size()+"，已执行玩别的任务数目："+executor.getCompletedTaskCount());
        returnjson.put("errorcode", "01");
        returnjson.put("errormsg", "已受理");
		//returnjson.put("QUERY_NO",id);
        logger.info("查询企业申请返回报文："+returnjson);
//		return returnjson;
		JSONObject jsonReturn = new JSONObject();
		JSONObject json1 = new JSONObject();
		List<PageData> list = null;
		int sleeptime = Integer.parseInt(PathUtil.getsleeptime());
		try {
			json1 = JSONObject.fromObject(lines);
			logger.info("查看企业报告请求报文："+json1);
			String username = json1.getString("USERNAME");
			query_no =json1.getString("CHANNEL_QUERY_NO");
			String channel_id = json1.getString("CHANNEL_ID");
			pd.put("USERNAME", username);
			pd.put("QUERY_NO", query_no);
			pd.put("CHANNEL_ID", channel_id);
			PageData QueryCHANNELNO=new PageData();
			QueryCHANNELNO = personInquiryService.findByCHANNELNO(pd);
			if(QueryCHANNELNO!=null&&!QueryCHANNELNO.equals("")){
				if("1".equals(QueryCHANNELNO.getString("CHANNEL_STATUS"))){
					logger.info("渠道状态停用，请去渠道信息页面维护");
					jsonReturn.put("errorcode", "03");
					return jsonReturn;
				}
			}else{
				logger.info("渠道编号不存在，请去渠道信息页面维护");
				jsonReturn.put("errorcode", "03");
				return jsonReturn;
			}
			for(int i = 0 ; i< 60 ; i++) {
				Thread.currentThread().sleep(sleeptime);
				logger.debug("+++++++++++++++++++++++++++++++++++");
				list = reportService.getFlowInfo(pd);
				if(list.get(0).getString("STATUS").equals("06")) {
					break;
				}
			}
			
		} catch (Exception e1) {
			//参数异常
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "03");
			jsonReturn.put("errormsg", "接口参数有误");
			logger.debug("查看企业报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		try {
			
			if(list.size()>0){
				String status = list.get(0).getString("STATUS");
				String reportId = list.get(0).getString("REPORT_ID");
//				int orgCnt = Integer.parseInt(list.get(0).get("CNT").toString());
				//人行系统异常
				if (status.equals("04")) {
					jsonReturn.put("errorcode", "08");
					jsonReturn.put("errormsg", "人行连接超时");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("07")) {
					jsonReturn.put("errorcode", "09");
					jsonReturn.put("errormsg", "人行登录密码错误");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("08")) {
					jsonReturn.put("errorcode", "10");
					jsonReturn.put("errormsg", "账号被停用");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("09")) {
					jsonReturn.put("errorcode", "11");
					jsonReturn.put("errormsg", "用户被锁定");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if(status.equals("10")){
					jsonReturn.put("errorcode", "12");
					jsonReturn.put("errormsg", "密码已经过期");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				//未查得
				if(status.equals("05") && reportId == null){
					jsonReturn.put("errorcode", "05");
					jsonReturn.put("errormsg", "信息未查得");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				//无权限
//				if(orgCnt == 0 && reportId != null){
//					jsonReturn.put("errorcode", "07");
//					jsonReturn.put("errormsg", "用户无查询权限");
//					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
//					logger.debug("查看企业报告返回报文："+jsonReturn);
//					return jsonReturn;
//				}
				//正在爬取
				if(status.equals("02") && reportId == null){
					jsonReturn.put("errorcode", "04");
					jsonReturn.put("errormsg", "正在爬取");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
			}else{
				jsonReturn.put("errorcode", "06");
				jsonReturn.put("errormsg", "未发起查询申请");
				jsonReturn.put("CHANNEL_QUERY_NO", query_no);
				logger.debug("查看企业报告返回报文："+jsonReturn);
				return jsonReturn;
			}
			
			jsonReturnstr=CompanyService.getReportInfo(pd);
			//正在爬取
			if(jsonReturnstr.size()==0){
				JSONObject jsonReturn1 = new JSONObject();
				jsonReturn1.put("errorcode", "02");
				jsonReturn1.put("errormsg", "系统异常");
				jsonReturn1.put("CHANNEL_QUERY_NO", query_no);
				logger.debug("查看企业报告返回报文："+jsonReturn1);
				return jsonReturn1;
			}
			//正常获取
			String Str = jsonReturnstr.toString();
			logger.debug("+++++++++++++++++++++++++++++++++++"+ Str );
			Str = ZipStrUtil.compress(Str);
			logger.debug("+++++++++++++++++++++++++++++++++++"+ inner );
			
			jsonReturn.put("bizData", Str);
			//正常获取
			jsonReturn.put("errorcode", "01");
			jsonReturn.put("errormsg", "正常受理");
			jsonReturn.put("CHANNEL_QUERY_NO", query_no);
		} catch (Exception e) {
			//系统异常
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			jsonReturn.put("CHANNEL_QUERY_NO", query_no);
			logger.debug("查看企业报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		logger.debug("查看企业报告返回报文："+jsonReturn);
		return jsonReturn;
	}  
	
	
	/*sunyra
	 * 企业批量查询接口
	 * */
	@POST
	@Path("/queryRequest_batch")
	public JSONObject queryRequest_batch(InputStream is){
		PageData pd =new PageData();
		JSONArray jsonArray = new JSONArray();
		JSONObject returnjson = new JSONObject();
		String sysNo="1";
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			 returnjson.put("errorcode", "08");
			 returnjson.put("errormsg", "系统维护中");
			 return returnjson;
		}
		
		BufferedReader brs;
		try {
			brs = new BufferedReader(new InputStreamReader(is, "utf-8"));		
			String lines = brs.readLine();
			jsonArray = JSONArray.fromObject(lines);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			logger.error(e2.getMessage(),e2);
		}
		//准备写入文件
		String str_file=PathUtil.getClasspath() + Const.tx + "eee.txt";
		File file=new File(str_file);
		FileOutputStream fis=null;
		BufferedWriter br=null;
		OutputStreamWriter isr=null;
		try {
			fis = new FileOutputStream(file);	
			isr= new OutputStreamWriter(fis,"UTF-8");
			br = new BufferedWriter(isr);		
			for(int i=0;i<jsonArray.size();i++){
				JSONObject json =  (JSONObject) jsonArray.get(i);
				try {						
					//提取字段，判断字段
					if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){
						pd.put("USERNAME", json.get("USERNAME"));//征信用户名
					}else{
						logger.info("USERNAME参数异常");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常");
						return returnjson;
					}
					if(json.get("CHANNEL_ID")!=null&&!json.get("CHANNEL_ID").equals("")){
						pd.put("CHANNEL_ID", json.get("CHANNEL_ID"));//渠道编号
						PageData QueryCHANNELNO=new PageData();
						QueryCHANNELNO = personInquiryService.findByCHANNELNO(pd);
						if(QueryCHANNELNO!=null&&!QueryCHANNELNO.equals("")){
							if("1".equals(QueryCHANNELNO.getString("CHANNEL_STATUS"))){
								logger.info("渠道状态停用，请去渠道信息页面维护");
								returnjson.put("errorcode", "03");
								returnjson.put("errormsg", "接口参数异常");
								return returnjson;
							}
						}else{
							logger.info("渠道编号不存在，请去渠道信息页面维护");
							returnjson.put("errorcode", "03");
							returnjson.put("errormsg", "接口参数异常");
							return returnjson;
						}
					}else{
						logger.info("CHANNEL_ID参数异常");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常");
						return returnjson;
					}
					if(json.get("CHANNEL_QUERY_NO")!=null&&!json.get("CHANNEL_QUERY_NO").equals("")){
						pd.put("CHANNEL_QUERY_NO", json.get("CHANNEL_QUERY_NO"));//渠道流水号
					}else{
						logger.info("CHANNEL_QUERY_NO参数异常");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常");
						return returnjson;
					}
					if(json.get("CLIENT_NAME")!=null&&!json.get("CLIENT_NAME").equals("")){
						pd.put("COMPANY_NAME",json.get("CLIENT_NAME"));//客户姓名
					}else{
						logger.info("COMPANY_NAME参数异常");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常");
						return returnjson;
					}
					if(json.get("CREDENTIALS_NO_TYPE")!=null&&!json.get("CREDENTIALS_NO_TYPE").equals("")){
						pd.put("CREDENTIALS_NO_TYPE", json.get("CREDENTIALS_NO_TYPE"));//证件类型
						pd.put("TYPE", json.get("CREDENTIALS_NO_TYPE"));
					}else{
						logger.info("CREDENTIALS_NO_TYPE参数异常");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常");
						return returnjson;
					}
					if(json.get("CHINA_CREDIT_CODE")!=null&&!json.get("CHINA_CREDIT_CODE").equals("")){
						pd.put("CODE", json.get("CHINA_CREDIT_CODE"));
						pd.put("CHINA_CREDIT_CODE", json.get("CHINA_CREDIT_CODE"));//证件号码
					}else{
						logger.info("CHINA_CREDIT_CODE参数异常");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常");
						return returnjson;
					}
					if(json.get("QUERY_REASON")!=null&&!json.get("QUERY_REASON").equals("")){
						pd.put("QUERY_REASON", json.get("QUERY_REASON"));//查询原因
					}else{
						logger.info("QUERY_REASON参数异常");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常");
						return returnjson;
					}
					if("1".equals(json.get("IS_CHECK_IMAGE"))){ //是否核验影像资料 1：是， 0：否
						if(json.get("CUST_MANAGER")!=null&&!json.get("CUST_MANAGER").equals("")){
							pd.put("CUST_MANAGER",json.get("CUST_MANAGER"));//客户经理
						}else{
							logger.info("CUST_MANAGER参数异常");
							returnjson.put("errorcode", "03");
							returnjson.put("errormsg", "接口参数异常");
							return returnjson;
						}
						if(json.get("WARRANT_MATURITY_DATE")!=null&&!json.get("WARRANT_MATURITY_DATE").equals("")){
							pd.put("WARRANT_MATURITY_DATE",json.get("WARRANT_MATURITY_DATE"));//授权书到期日
						}else{
							logger.info("WARRANT_MATURITY_DATE参数异常");
							returnjson.put("errorcode", "03");
							returnjson.put("errormsg", "接口参数异常");
							return returnjson;
						}
					}
					if("0".equals(json.get("IS_USE")) || "1".equals(json.get("IS_USE"))){
						pd.put("IS_USE", json.get("IS_USE"));//如果有近期报告，是否使用，1：是  0：否
					}else{
						logger.info("IS_USE参数异常");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常");
						return returnjson;
					}
				} catch (Exception e) {
					logger.error(e.getMessage(),e);
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "参数解析异常");
					return returnjson;
				}	
		
				PageData orgMap=new PageData();
				String ORG_CODE="";
				try{
					orgMap=personInquiryService.findOrg(pd);
					if(orgMap!=null){
						ORG_CODE=orgMap.getString("ORG_CODE");
					}else{
						logger.info("用户无查询权限");
						returnjson.put("errorcode", "07");
						returnjson.put("errormsg", "用户无查询权限");
						return returnjson;
					}
				}catch(Exception e){
					logger.error(e.getMessage(),e);
					returnjson.put("errorcode", "02");
					returnjson.put("errormsg", "系统异常");
					return returnjson;
				}
				PageData reportData = new PageData();
				try {
					reportData = entAppReService.QueryReportDetail(pd);
				} catch (Exception e) {
					logger.error(e.getMessage(),e);
				}
				String is_use = pd.getString("IS_USE"); //有近期报告，是否使用  0:否  1:是
				String type="2"; //客户类型
				String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
				pd.put("DATA_DATE",date);
				//校验同一渠道，渠道流水号是否重复
				PageData QueryNoMap=new PageData();
				try {
					QueryNoMap=personInquiryService.findByQueryNo(pd);
					if(QueryNoMap!=null&&!QueryNoMap.equals("")){
						if("06".equals(QueryNoMap.getString("STATUS"))||"05".equals(QueryNoMap.getString("STATUS"))){
							logger.info("流水号重复");
							jsonArray.remove(i);
							i--;
							if("06".equals(QueryNoMap.getString("STATUS"))){
								if(!"2".equals(String.valueOf(QueryNoMap.get("INTERNAL")))&&String.valueOf(pd.get("INTERNAL")).length()>30){ 
									if("1".equals(is_use)){
									//行内查询
										WbqqInnerRunnable WbqqTask = new WbqqInnerRunnable(pd,String.valueOf(QueryNoMap.get("INTERNAL")),"2",String.valueOf(QueryNoMap.get("REPORT_ID")),indAppReService,entAppReService);
										executor.execute(WbqqTask);
									}
								}
							}
							continue;
						}else if("04".equals(QueryNoMap.getString("STATUS"))||"02".equals(QueryNoMap.getString("STATUS"))||"07".equals(QueryNoMap.getString("STATUS"))||"08".equals(QueryNoMap.getString("STATUS"))||"09".equals(QueryNoMap.getString("STATUS"))||"10".equals(QueryNoMap.getString("STATUS"))){
							pd.put("CLIENT_TYPE", "2");
							pd.put("ID",QueryNoMap.getString("ID"));							
							//人行查询
							//拼接文件
							 br.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
								br.write("<Document>\n");
			                    br.write("<Msg>\n");	
			                    br.write("<RequestId>");
			                    br.write(String.valueOf(i+1));
			                    br.write("</RequestId>\n");
			                    br.write("<OriginateOrgCode>");
			                    br.write(reportData.getString("ORIGINATEORGCODE"));
			                    br.write("</OriginateOrgCode>\n");
			                    br.write("<OriginateUserCode>");
			                    br.write(reportData.getString("ORIGINATEUSERCODE"));
			                    br.write("</OriginateUserCode>\n"); 
			                    br.write("<EntName>");
			                    br.write(json.getString("CLIENT_NAME"));
			                    br.write("</EntName>\n");
			                    br.write("<EntCertType>");
			                    br.write(json.getString("CREDENTIALS_NO_TYPE"));
			                    br.write("</EntCertType>\n");
			                    br.write("<EntCertNum>");
			                    br.write(json.getString("CHINA_CREDIT_CODE"));
			                    br.write("</EntCertNum>\n");
			                    br.write("<QueryReason>");
			                    br.write(json.getString("QUERY_REASON"));
			                    br.write("</QueryReason>\n");
			                    br.write("<ServiceCode>");
			                    br.write(reportData.getString("SERVICECODE"));
			                    br.write("</ServiceCode>\n");
			                    br.write("</Msg>\n");
			                    br.write("</Document>\r\n"); 
		                    continue;
						}
					}
				} catch (Exception e1) {
					logger.error(e1.getMessage(),e1);
					returnjson.put("errorcode", "02");
					returnjson.put("errormsg", "系统异常");
					return returnjson;
				}
				String id=UuidUtil.get64UUID();
				pd.put("ID", id);
				String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
				pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
				pd.put("STATUS", "02");//状态 02已审核
				pd.put("CHECK_SYS_ID", "0");
				pd.put("AUDITORS","0");
				pd.put("INTERNAL", "2");
				pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
				pd.put("USER_ID", orgMap.get("USER_ID"));
				pd.put("ORG_ID", orgMap.get("ORG_ID"));
				pd.put("IP", orgMap.get("IP"));
				pd.put("MAC", orgMap.get("MAC"));
				pd.put("CLIENT_TYPE", "2");
				pd.put("QUERY_VERSION", "20");
				pd.put("QUERY_TYPE", "1");
				
				PageData serverInfo=new PageData();
				/*----根据获取的参数数据向企业信息表中添加数据-------*/
				try{
					//获得配置文件配置信息
					serverInfo = BaseController.getServerInfo();
					serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
					String sourtPath = serverInfo.getString("ftpPath1")+pd.getString("CHANNEL_ID")+"/"+pd.getString("CHANNEL_QUERY_NO")+"/";
					String destPath = serverInfo.getString("ftpPath")+pd.getString("ID")+"/";
					if("1".equals(json.get("IS_CHECK_IMAGE"))){ //是否核验影像资料 1：是， 0：否
						//查看影像资料是否存在
						List<String> fileNameList = new ArrayList<String>();
				        fileNameList.add("LOAN_"+pd.getString("CHINA_CREDIT_CODE"));
				        fileNameList.add("WARR_"+pd.getString("CHINA_CREDIT_CODE"));
				        fileNameList.add("ID_"+pd.getString("CHINA_CREDIT_CODE"));
				        List<String> listName=FtpUtil.isFTPFileExist(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), sourtPath,fileNameList); 
				        if(listName.size()==0&&!"03".equals(pd.getString("QUERY_REASON"))){
				        	System.out.println("影像资料未上传");
				        	returnjson.put("errorcode", "05");
							returnjson.put("errormsg", "影像资料未上传");
							return returnjson;
				        }
				        //将图片搬到以ID命名的文件夹
				        if(listName.size()>0){
				        	WbCopyFileRunnable WbqqTask = new WbCopyFileRunnable(serverInfo,pd.getString("CODE"),listName,sourtPath,destPath,"2");
				        	copyExecutor.execute(WbqqTask);
				        }
					}
				}catch(Exception e){
					logger.error(e.getMessage(),e);
					returnjson.put("errorcode", "02");
					returnjson.put("errormsg", "系统异常");
					return returnjson;
				}
				try{
					/*----根据获取的参数数据向企业信息表中添加数据-------*/
					companyInquiryService.save(pd);
					/*----根据获取的参数数据向流程状态表中添加数据--------*/
					companyInquiryService.saveToFs(pd);
				
					//查询明细表需要的数据
		 			PageData detail = entAppReService.QueryEntDetail(pd.getString("ID"));
		 			//向明细表中插入数据
		 			entAppReService.saveEntDetail(detail);
				}catch(Exception e){
					logger.error(e.getMessage(),e);
					returnjson.put("errorcode", "02");
					returnjson.put("errormsg", "系统异常");
					return returnjson;
				}
		
				//查询判断该笔是否可以行内查询
				/*************start**************/
				String limt_date = "0";
				String inner = "2";
				String report_id = "";
				try {
					PageData queryDate = new PageData();
//					queryDate.put("COMPANY", BaseController.getServerInfo().getString("channel_company"));
					queryDate.put("COMPANY", orgMap.get("COMPANY"));
					queryDate.put("ORG_ID", orgMap.get("ORG_ID"));
					queryDate.put("PARA_TYPE", type);
					//判断当前法人是否设置了查询时长参数值
					queryDate = queryDateService.queryByTypeAndCompany(queryDate);
					if(queryDate!=null&&queryDate.get("LIMT_DATE")!=null){
						limt_date = String.valueOf(queryDate.get("LIMT_DATE"));
			 		}
					pd.put("LIMT_DATE", limt_date);
					//根据条件查询该客户在一定时间内是否被查询过
					PageData appInfo = entAppReService.findCompanyByInfo(pd);
					if(appInfo!=null&&appInfo.get("ID")!=null){
						inner = String.valueOf(appInfo.get("ID"));
						report_id = String.valueOf(appInfo.get("REPORT_ID"));
					}
					if(inner!="2"&&!inner.equals("2")){  //行内查询
						//更新行内/人行字段
						PageData data = new PageData();
						data.put("INTERNAL", inner);
						data.put("ID", id);
						indAppReService.updateInner(data);
					}
				} catch (Exception e1) {
					logger.error(e1.getMessage(),e1);
					returnjson.put("errorcode", "02");
					returnjson.put("errormsg", "系统异常");
					return returnjson;
				}
		
				/*************end**************/
				if(inner!="2"&&!inner.equals("2")){  //行内查询
					if("1".equals(is_use)){
						jsonArray.remove(i);
						i--;
						//调用线程，启动爬虫
						WbqqInnerRunnable WbqqInnerTask = new WbqqInnerRunnable(pd,inner,type,report_id,indAppReService,entAppReService);
						executor.execute(WbqqInnerTask);
					}else{
						//人行查询
						//拼接文件
						 br.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
							br.write("<Document>\n");
		                    br.write("<Msg>\n");	
		                    br.write("<RequestId>");
		                    br.write(String.valueOf(i+1));
		                    br.write("</RequestId>\n");
		                    br.write("<OriginateOrgCode>");
		                    br.write(reportData.getString("ORIGINATEORGCODE"));
		                    br.write("</OriginateOrgCode>\n");
		                    br.write("<OriginateUserCode>");
		                    br.write(reportData.getString("ORIGINATEUSERCODE"));
		                    br.write("</OriginateUserCode>\n"); 
		                    br.write("<EntName>");
		                    br.write(json.getString("CLIENT_NAME"));
		                    br.write("</EntName>\n");
		                    br.write("<EntCertType>");
		                    br.write(json.getString("CREDENTIALS_NO_TYPE"));
		                    br.write("</EntCertType>\n");
		                    br.write("<EntCertNum>");
		                    br.write(json.getString("CHINA_CREDIT_CODE"));
		                    br.write("</EntCertNum>\n");
		                    br.write("<QueryReason>");
		                    br.write(json.getString("QUERY_REASON"));
		                    br.write("</QueryReason>\n");
		                    br.write("<ServiceCode>");
		                    br.write(reportData.getString("SERVICECODE"));
		                    br.write("</ServiceCode>\n");
		                    br.write("</Msg>\n");
		                    br.write("</Document>\r\n"); 
					}
				}else{
					//人行查询
					//拼接文件
				    br.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
					br.write("<Document>\n");
                    br.write("<Msg>\n");	
                    br.write("<RequestId>");
                    br.write(String.valueOf(i+1));
                    br.write("</RequestId>\n");
                    br.write("<OriginateOrgCode>");
                    br.write(reportData.getString("ORIGINATEORGCODE"));
                    br.write("</OriginateOrgCode>\n");
                    br.write("<OriginateUserCode>");
                    br.write(reportData.getString("ORIGINATEUSERCODE"));
                    br.write("</OriginateUserCode>\n"); 
                    br.write("<EntName>");
                    br.write(json.getString("CLIENT_NAME"));
                    br.write("</EntName>\n");
                    br.write("<EntCertType>");
                    br.write(json.getString("CREDENTIALS_NO_TYPE"));
                    br.write("</EntCertType>\n");
                    br.write("<EntCertNum>");
                    br.write(json.getString("CHINA_CREDIT_CODE"));
                    br.write("</EntCertNum>\n");
                    br.write("<QueryReason>");
                    br.write(json.getString("QUERY_REASON"));
                    br.write("</QueryReason>\n");
                    br.write("<ServiceCode>");
                    br.write(reportData.getString("SERVICECODE"));
                    br.write("</ServiceCode>\n");
                    br.write("</Msg>\n");
                    br.write("</Document>\r\n"); 
					}
			}    
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("PersonInterface/personQuery_batch出错!",e);
		}finally{			
			try{
				if(br!=null)
					br.close();
				if(isr!=null)
					isr.close();
				if(fis!=null)
					fis.close();
			}catch (IOException e) {
				logger.error("PersonInterface/personQuery_batch出错!",e);
			}		
		} 
		//调用人行webservice接口				
		WebServiceRunnable_batch webServiceTask = new WebServiceRunnable_batch(file,jsonArray,"2",indAppReService,entAppReService);
		executor.execute(webServiceTask);				
		
        System.out.println("线程池中线程数目："+executor.getPoolSize()+"，队列中等待执行的任务数目："+
        executor.getQueue().size()+"，已执行玩别的任务数目："+executor.getCompletedTaskCount());
        returnjson.put("errorcode", "01");
        returnjson.put("errormsg", "已受理");
		//returnjson.put("QUERY_NO",id);
        logger.info("查询企业申请返回报文："+returnjson);
		return returnjson;
	} 
	/**
	 * 企业报告数据查询接口
	 * @param json
	 * @return
	 */
	@POST
	@Path("/queryReport")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryReport(InputStream is){
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		String query_no = "";
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		} catch (UnsupportedEncodingException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查看企业报告请求报文："+json);
			String username = json.getString("USERNAME");
			query_no =json.getString("CHANNEL_QUERY_NO");
			String channel_id = json.getString("CHANNEL_ID");
			pd.put("USERNAME", username);
			pd.put("QUERY_NO", query_no);
			pd.put("CHANNEL_ID", channel_id);
			PageData QueryCHANNELNO=new PageData();
			QueryCHANNELNO = personInquiryService.findByCHANNELNO(pd);
			if(QueryCHANNELNO!=null&&!QueryCHANNELNO.equals("")){
				if("1".equals(QueryCHANNELNO.getString("CHANNEL_STATUS"))){
					logger.info("渠道状态停用，请去渠道信息页面维护");
					jsonReturn.put("errorcode", "03");
					return jsonReturn;
				}
			}else{
				logger.info("渠道编号不存在，请去渠道信息页面维护");
				jsonReturn.put("errorcode", "03");
				return jsonReturn;
			}
		} catch (Exception e1) {
			//参数异常
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "03");
			jsonReturn.put("errormsg", "接口参数有误");
			logger.debug("查看企业报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		try {
			List<PageData> list = reportService.getFlowInfo(pd);
			if(list.size()>0){
				String status = list.get(0).getString("STATUS");
				String reportId = list.get(0).getString("REPORT_ID");
				int orgCnt = Integer.parseInt(list.get(0).get("CNT").toString());
				//人行系统异常
				if (status.equals("04")) {
					jsonReturn.put("errorcode", "08");
					jsonReturn.put("errormsg", "人行连接超时");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("07")) {
					jsonReturn.put("errorcode", "09");
					jsonReturn.put("errormsg", "人行登录密码错误");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("08")) {
					jsonReturn.put("errorcode", "10");
					jsonReturn.put("errormsg", "账号被停用");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("09")) {
					jsonReturn.put("errorcode", "11");
					jsonReturn.put("errormsg", "用户被锁定");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if(status.equals("10")){
					jsonReturn.put("errorcode", "12");
					jsonReturn.put("errormsg", "密码已经过期");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				//未查得
				if(status.equals("05") && reportId == null){
					jsonReturn.put("errorcode", "05");
					jsonReturn.put("errormsg", "信息未查得");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				//无权限
				if(orgCnt == 0 && reportId != null){
					jsonReturn.put("errorcode", "07");
					jsonReturn.put("errormsg", "用户无查询权限");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				//正在爬取
				if(status.equals("02") && reportId == null){
					jsonReturn.put("errorcode", "04");
					jsonReturn.put("errormsg", "正在爬取");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看企业报告返回报文："+jsonReturn);
					return jsonReturn;
				}
			}else{
				jsonReturn.put("errorcode", "06");
				jsonReturn.put("errormsg", "未发起查询申请");
				jsonReturn.put("CHANNEL_QUERY_NO", query_no);
				logger.debug("查看企业报告返回报文："+jsonReturn);
				return jsonReturn;
			}
			
			jsonReturn=CompanyService.getReportInfo(pd);
			//正在爬取
			if(jsonReturn.size()==0){
				JSONObject jsonReturn1 = new JSONObject();
				jsonReturn1.put("errorcode", "02");
				jsonReturn1.put("errormsg", "系统异常");
				jsonReturn1.put("CHANNEL_QUERY_NO", query_no);
				logger.debug("查看企业报告返回报文："+jsonReturn1);
				return jsonReturn1;
			}
			//正常获取
			jsonReturn.put("errorcode", "01");
			jsonReturn.put("errormsg", "正常受理");
			jsonReturn.put("CHANNEL_QUERY_NO", query_no);
		} catch (Exception e) {
			//系统异常
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			jsonReturn.put("CHANNEL_QUERY_NO", query_no);
			logger.debug("查看企业报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		logger.debug("查看企业报告返回报文："+jsonReturn);
		return jsonReturn;
	}
	
	/**
	 * 企业报告数据查询接口
	 * @param json
	 * @return
	 */
	@POST
	@Path("/queryReport_batch")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryReport_batch(InputStream is){
		JSONArray jsonArrayReturn = new JSONArray();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject=new JSONObject();
		PageData pd = new PageData();
		String query_no = "";
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		} catch (UnsupportedEncodingException e3) {
			// TODO Auto-generated catch block
			e3.printStackTrace();
		}
		String lines;
		try {
			lines = br.readLine();
			jsonArray = JSONArray.fromObject(lines);
			logger.info("查看企业报告请求报文："+jsonArray);
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		for(int i=0;i<jsonArray.size();i++){
			JSONObject json=(JSONObject) jsonArray.get(i);
			JSONObject jsonReturn = new JSONObject();
		try {
			
			String username = json.getString("USERNAME");
			query_no =json.getString("CHANNEL_QUERY_NO");
			String channel_id = json.getString("CHANNEL_ID");
			pd.put("USERNAME", username);
			pd.put("QUERY_NO", query_no);
			pd.put("CHANNEL_ID", channel_id);
			PageData QueryCHANNELNO=new PageData();
			QueryCHANNELNO = personInquiryService.findByCHANNELNO(pd);
			if(QueryCHANNELNO!=null&&!QueryCHANNELNO.equals("")){
				if("1".equals(QueryCHANNELNO.getString("CHANNEL_STATUS"))){
					logger.info("渠道状态停用，请去渠道信息页面维护");
					jsonReturn.put("errorcode", "03");
					jsonReturn.put("jsonObject", json);
					return jsonReturn;
				}
			}else{
				logger.info("渠道编号不存在，请去渠道信息页面维护");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("jsonObject", json);
				return jsonReturn;
			}
		} catch (Exception e1) {
			//参数异常
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "03");
			jsonReturn.put("errormsg", "接口参数有误");
			jsonReturn.put("jsonObject", json);
			logger.debug("查看企业报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		try {
			List<PageData> list = reportService.getFlowInfo(pd);
			if(list.size()>0){
				String status = list.get(0).getString("STATUS");
				String reportId = list.get(0).getString("REPORT_ID");
				int orgCnt = Integer.parseInt(list.get(0).get("CNT").toString());
				//人行系统异常
				if (status.equals("04")) {
					jsonReturn.put("errorcode", "08");
					jsonReturn.put("errormsg", "人行连接超时");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);				
					logger.debug("查看企业报告返回报文："+jsonReturn);	
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("07")) {
					jsonReturn.put("errorcode", "09");
					jsonReturn.put("errormsg", "人行登录密码错误");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);				
					logger.debug("查看企业报告返回报文："+jsonReturn);	
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("08")) {
					jsonReturn.put("errorcode", "10");
					jsonReturn.put("errormsg", "账号被停用");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);				
					logger.debug("查看企业报告返回报文："+jsonReturn);	
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("09")) {
					jsonReturn.put("errorcode", "11");
					jsonReturn.put("errormsg", "用户被锁定");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);				
					logger.debug("查看企业报告返回报文："+jsonReturn);	
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if(status.equals("10")){
					jsonReturn.put("errorcode", "12");
					jsonReturn.put("errormsg", "密码已经过期");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);				
					logger.debug("查看企业报告返回报文："+jsonReturn);	
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				//未查得
				if(status.equals("05") && reportId == null){
					jsonReturn.put("errorcode", "05");
					jsonReturn.put("errormsg", "信息未查得");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);				
					logger.debug("查看企业报告返回报文："+jsonReturn);	
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				//无权限
				if(orgCnt == 0 && reportId != null){
					jsonReturn.put("errorcode", "07");
					jsonReturn.put("errormsg", "用户无查询权限");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);				
					logger.debug("查看企业报告返回报文："+jsonReturn);	
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				//正在爬取
				if(status.equals("02") && reportId == null){
					jsonReturn.put("errorcode", "04");
					jsonReturn.put("errormsg", "正在爬取");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);				
					logger.debug("查看企业报告返回报文："+jsonReturn);	
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
			}else{
				jsonReturn.put("errorcode", "06");
				jsonReturn.put("errormsg", "未发起查询申请");
				jsonReturn.put("CHANNEL_QUERY_NO", query_no);
				jsonReturn.put("jsonObject", json);				
				logger.debug("查看企业报告返回报文："+jsonReturn);	
				jsonArrayReturn.add(jsonReturn);
				continue;
			}
			
			jsonReturn=CompanyService.getReportInfo(pd);
			//正在爬取
			if(jsonReturn.size()==0){
				JSONObject jsonReturn1 = new JSONObject();
				jsonReturn1.put("errorcode", "02");
				jsonReturn1.put("errormsg", "系统异常");
				jsonReturn1.put("CHANNEL_QUERY_NO", query_no);
				jsonReturn1.put("jsonObject", json);				
				logger.debug("查看企业报告返回报文："+jsonReturn1);	
				jsonArrayReturn.add(jsonReturn1);
				continue;
			}
			//正常获取
			jsonReturn.put("errorcode", "01");
			jsonReturn.put("errormsg", "正常受理");
			jsonReturn.put("CHANNEL_QUERY_NO", query_no);
			jsonArrayReturn.add(jsonReturn);
		} catch (Exception e) {
			//系统异常
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			jsonReturn.put("CHANNEL_QUERY_NO", query_no);
			logger.debug("查看企业报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		}
		jsonObject.put("jsonArray", jsonArrayReturn);
		logger.debug("查看企业报告返回报文："+jsonObject);
		return jsonObject;
	}
	
	
	@GET
	@Path("/testpath")
	@Produces(MediaType.TEXT_PLAIN)
	public String sayHello() {
		return "Hello queryCompany!";
	}
	
	/**
	 * 
	 * 重启服务前执行此接口
	 * @param is
	 * @return
	 */
	@POST
	@Path("/stopAllThreadPool")
	public boolean stopThread(){
		try {
			runShutdownNowAndUpdateStatus(executor,"executor");
			runShutdownNowAndUpdateStatus(copyExecutor,"copyExecutor");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private boolean runShutdownNowAndUpdateStatus(ThreadPoolExecutor tpe,String executor_type){
		try {
			List<Runnable> shutdownNow = tpe.shutdownNow();
			for(Runnable r : shutdownNow){
				if(r instanceof WebServiceRunnable){
					WebServiceRunnable w = (WebServiceRunnable) r;
					w.saveExcutorInfo(executor_type,"2");
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}  
