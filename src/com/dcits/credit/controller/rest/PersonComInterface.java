package com.dcits.credit.controller.rest;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.openqa.jetty.util.ThreadPool.PoolThread;
import org.springframework.stereotype.Component;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.credit.controller.rest.util.MyRejectedExecutionHandler;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.entity.WbCopyFileRunnable;
import com.dcits.credit.entity.WebServiceRunnable;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.QueryDateOperatorService.QueryDateOperatorManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.rest.PersonInterfaceService;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.WbqqInnerRunnable;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
import com.microsoft.schemas.office.x2006.digsig.CTSignatureInfoV1.Factory;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/** 
 * 个人征信报告查询接口（公共）
 * 
 */ 
@Component
@Path("/personComInterface")
public class PersonComInterface extends BaseController{  
	@Resource(name="PersonInquiryService")
	public PersonInquiryManager personInquiryService;
	@Resource(name="personCrawlerService")
	private PersonCrawlerManager personCrawlerService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name="dataSubmissionService")
	private IDataSubmissionService iDataSubmissionService;
	@Resource(name="personInterfaceService")
	private PersonInterfaceService personInterfaceService;
	@Resource(name="entAppReService")
	private EntAppReManager entAppReService;
	@Resource(name="queryDateService")
	private QueryDateOperatorManager queryDateService;
	
	@Resource(name = "crawlIndAppReService")
	private CrawlIndAppReManager crawlIndAppReService;
	@Resource(name = "crawlPersonCrawlerService")
	private com.dcits.crawl.service.crawler.PersonCrawlerManager crawlPersonCrawlerService;
	@Resource(name = "crawlDataSubmissionService")
	private com.dcits.crawl.service.dataSubmission.IDataSubmissionService crawlDataSubmissionService;
	@Resource(name = "crawlEntAppReService")
	private CrawlEntAppReManager crawlEntAppReService;
	@Resource(name = "crawlCompanyCrawlerService")
	private CompanyCrawlerManager crawlCompanyCrawlerService;
	//直销银行渠道编号
	private String zhixiao_channelID="088";
	
	//大数渠道编号
	private String bigData_channelID="013";
	
	private static Map<String,String> userMap = new HashMap<String,String>();
	
	static{
		userMap.put("zhixiao1", BaseController.getPoolInfo().getString("zhixiao1"));
		userMap.put("zhixiao2", BaseController.getPoolInfo().getString("zhixiao2"));
		userMap.put("zhixiao3", BaseController.getPoolInfo().getString("zhixiao3"));
		userMap.put("zhixiao4", BaseController.getPoolInfo().getString("zhixiao4"));
	}
	
	//本地查询接口队列
	ThreadPoolExecutor executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))),new MyRejectedExecutionHandler());
	//一般查询队列(大数)
	ThreadPoolExecutor bigData_Executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))),new MyRejectedExecutionHandler());
	//大批量查询接口1队列(直销银行)
	ThreadPoolExecutor zhiXiao1_Executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workZxQueue"))),new MyRejectedExecutionHandler());
	//大批量查询接口1队列(直销银行)
	ThreadPoolExecutor zhiXiao2_Executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workZxQueue"))),new MyRejectedExecutionHandler());
	//大批量查询接口1队列(直销银行)
	ThreadPoolExecutor zhiXiao3_Executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workZxQueue"))),new MyRejectedExecutionHandler());
	//大批量查询接口1队列(直销银行)
	ThreadPoolExecutor zhiXiao4_Executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workZxQueue"))),new MyRejectedExecutionHandler());
	@POST
	@Path("/queryRequest")
	public JSONObject queryRequest(InputStream is){
		 PageData pd =new PageData();
		JSONObject json = new JSONObject();
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
		try { 
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查询申请请求报文："+json);
			//System.out.println("request json............" + json);
			
			if(!json.get("CLIENT_NAME").equals("")){
				pd.put("CLIENT_NAME",json.get("CLIENT_NAME"));//客户姓名
			}else{
				logger.info("CLIENT_NAME参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(CLIENT_NAME)");
				return returnjson;
			}
			if(!json.get("CREDENTIALS_TYPE").equals("")){
				pd.put("CREDENTIALS_TYPE", json.get("CREDENTIALS_TYPE"));//证件类型
			}else{
				logger.info("CREDENTIALS_TYPE参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(CREDENTIALS_TYPE)");
				return returnjson;
			}
			if(!json.get("CREDENTIALS_NO").equals("")){
				pd.put("CREDENTIALS_NO", json.get("CREDENTIALS_NO"));//证件号码
			}else{
				logger.info("CREDENTIALS_NO参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(CREDENTIALS_NO)");
				return returnjson;
			}
			if(!json.get("QUERY_REASON").equals("")){
				pd.put("QUERY_REASON",json.get("QUERY_REASON"));//查询原因
			}else{
				logger.info("QUERY_REASON参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(QUERY_REASON)");
				return returnjson;
			}
			if(json.get("QUERY_TYPE")!=null&&!json.get("QUERY_TYPE").equals("")){
				pd.put("QUERY_TYPE", json.get("QUERY_TYPE"));//查询类型
			}else{
				pd.put("QUERY_TYPE", "0");
			}
			if(json.get("QUERY_VERSION")!=null&&!json.get("QUERY_VERSION").equals("")){
				pd.put("QUERY_VERSION", json.get("QUERY_VERSION"));//查询版本
			}else{
				pd.put("QUERY_VERSION", "30");
			}
			if(pd.get("QUERY_REASON").equals("05")&&!"31".equals(pd.get("QUERY_VERSION"))){
				logger.info("查询原因与查询版本不对应");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(QUERY_REASON)");
				return returnjson;
			}
			if(!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//第三方在本系统存在的系统用户名
			}else{
				logger.info("USERNAME参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(USERNAME)");
				return returnjson;
			}
			if(!json.get("CHANNEL_ID").equals("")){
				pd.put("CHANNEL_ID", json.get("CHANNEL_ID"));//渠道编号
				PageData QueryCHANNELNO=new PageData();
				QueryCHANNELNO = personInquiryService.findByCHANNELNO(pd);
				if(QueryCHANNELNO!=null&&!QueryCHANNELNO.equals("")){
					if("1".equals(QueryCHANNELNO.getString("CHANNEL_STATUS"))){
						logger.info("渠道状态停用，请去渠道信息页面维护");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常(CHANNEL_ID)");
						return returnjson;
					}
					PageData CHANNELNO_user=new PageData();
					CHANNELNO_user = personInquiryService.findCHANNELNO_USERNAME(pd);//查询渠道号与用户名是否一致
					if(CHANNELNO_user==null){
						logger.info("用户名与渠道编号不统一，请检查！");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常(CHANNEL_ID)");
						return returnjson;
					}
				}else{
					logger.info("渠道编号不存在，请去渠道信息页面维护");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常(CHANNEL_ID)");
					return returnjson;
				}
			}else{
				logger.info("CHANNEL_ID参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(CHANNEL_ID)");
				return returnjson;
			}	
			if(!json.get("CHANNEL_QUERY_NO").equals("")){
				pd.put("CHANNEL_QUERY_NO", json.get("CHANNEL_QUERY_NO"));//渠道流水号
			}else{
				logger.info("CHANNEL_QUERY_NO参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(CHANNEL_QUERY_NO)");
				return returnjson;
			}
			
			if("0".equals(json.get("IS_USE")) || "1".equals(json.get("IS_USE"))){
				pd.put("IS_USE", json.get("IS_USE"));//如果有近期报告，是否使用，1：是  0：否
			}else{
				logger.info("IS_USE参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(IS_USE)");
				return returnjson;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}	
		String is_use = pd.getString("IS_USE"); //有近期报告，是否使用  0:否  1:是
		String type="1"; //客户类型
		String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
		pd.put("DATA_DATE",date);
		PageData orgMap=new PageData();
		try{
			orgMap=personInquiryService.findOrg(pd);
			if(orgMap==null || orgMap.size()==0){
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
			if(QueryNoMap!=null && QueryNoMap.size()>0){
				//存在重复流水号
				if("06".equals(QueryNoMap.getString("STATUS"))||"05".equals(QueryNoMap.getString("STATUS"))){
					logger.info("流水号重复");
					repeatQueryNoAndQueryStatus = 1;
					returnjson.put("errorcode", "04");
					returnjson.put("errormsg", "重复申请");
					return returnjson;
				}else if("04".equals(QueryNoMap.getString("STATUS"))||"02".equals(QueryNoMap.getString("STATUS"))||"07".equals(QueryNoMap.getString("STATUS"))||"08".equals(QueryNoMap.getString("STATUS"))||"09".equals(QueryNoMap.getString("STATUS"))||"10".equals(QueryNoMap.getString("STATUS"))){
					repeatQueryNoAndQueryStatus = 2;
					pd.put("CLIENT_TYPE", "1");
					pd.put("ID",QueryNoMap.getString("ID"));
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
			pd.put("ORG_ID", orgMap.get("ORG_ID"));
			pd.put("IP", orgMap.get("IP"));
			pd.put("MAC", orgMap.get("MAC"));
			pd.put("CLIENT_TYPE", "1");
			/*pd.put("QUERY_VERSION", "30");*/
			/*pd.put("QUERY_TYPE", "0");*/
			//校验资料
			PageData serverInfo=new PageData();
			try {
				//获得配置文件配置信息
				serverInfo = BaseController.getServerInfo();
				serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
				String sourtPath = serverInfo.getString("ftpPath1")+pd.getString("CHANNEL_ID")+"/"+pd.getString("CHANNEL_QUERY_NO")+"/";
				String destPath = serverInfo.getString("ftpPath")+pd.getString("ID")+"/";
				if("1".equals(json.get("IS_CHECK_IMAGE"))){ //是否核验影像资料 1：是， 0：否
					//查看影像资料是否存在
					List<String> fileNameList = new ArrayList<String>();
			        fileNameList.add("LOAN_"+pd.getString("CREDENTIALS_NO"));
			        fileNameList.add("WARR_"+pd.getString("CREDENTIALS_NO"));
			        fileNameList.add("ID_"+pd.getString("CREDENTIALS_NO"));
			        fileNameList.add("IDB_"+pd.getString("CREDENTIALS_NO"));
			        List<String> listName=FtpUtil.isFTPFileExist(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), sourtPath,fileNameList); 
			        if(listName.size()==0&&!"01".equals(pd.getString("QUERY_REASON"))){
			        	logger.debug("影像资料未上传");
			        	returnjson.put("errorcode", "05");
						returnjson.put("errormsg", "影像资料未上传");
						return returnjson;
			        }
			        //将图片搬到以ID命名的文件夹
			        if(listName.size()>0){
			        	WbCopyFileRunnable WbqqTask = new WbCopyFileRunnable(serverInfo,pd.getString("CREDENTIALS_NO"),listName,sourtPath,destPath,"1");
			        	executor.execute(WbqqTask);
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
		
			/*----根据获取的参数数据向个人信息表中添加数据-------*/
			PageData detail = new PageData();
			try{
			personInquiryService.save(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			personInquiryService.saveToFs(pd);
			//查询明细表需要的
			detail = indAppReService.QueryDetail(pd.getString("ID"));
			//向明细表中插入数据
			indAppReService.saveDetail(detail);
			}catch(Exception e){
				logger.error(e.getMessage(),e);
				returnjson.put("errorcode", "02");
				returnjson.put("errormsg", "系统异常");
				//returnjson.put("CHANNEL_QUERY_NO",json.get("CHANNEL_QUERY_NO"));
				return returnjson;
			}
		}
		//查询判断该笔是否可以行内查询
		/*************start**************/
		String limt_date = "0";
		String inner = "2";
		String report_id = "";
		if(!"0".equals(is_use)){
			try {
				PageData queryDate = new PageData();
	//			queryDate.put("COMPANY", BaseController.getServerInfo().getString("channel_company"));
				queryDate.put("COMPANY", orgMap.get("COMPANY"));
				queryDate.put("PARA_TYPE", type);
				queryDate.put("ORG_ID", orgMap.get("ORG_ID"));
				//判断当前法人是否设置了查询时长参数值
				queryDate = queryDateService.queryByTypeAndCompany(queryDate);
				if(queryDate!=null&&queryDate.get("LIMT_DATE")!=null){
					limt_date = String.valueOf(queryDate.get("LIMT_DATE"));
		 		}
				pd.put("LIMT_DATE", limt_date);
				//根据条件查询该客户在一定时间内是否被查询过
				PageData appInfo = indAppReService.findByInfo(pd);
				if(appInfo!=null&&appInfo.get("ID")!=null){
					inner = String.valueOf(appInfo.get("ID"));
					report_id = String.valueOf(appInfo.get("REPORT_ID"));
				}
				if(inner!="2"&&!inner.equals("2")){  //行内查询
					//更新行内/人行字段
					PageData data = new PageData();
					data.put("INTERNAL", inner);
					data.put("ID", pd.get("ID"));
		 			indAppReService.updateInner(data);
				}
			} catch (Exception e1) {
				logger.error(e1.getMessage(),e1);
				returnjson.put("errorcode", "02");
				returnjson.put("errormsg", "系统异常");
				//returnjson.put("CHANNEL_QUERY_NO",json.get("CHANNEL_QUERY_NO"));
				return returnjson;
			}
		}
		/*************end**************/
		if(inner!="2"&&!inner.equals("2")){//行内查询
			if("1".equals(is_use)){
				//行内查询
				WbqqInnerRunnable WbqqInnerTask = new WbqqInnerRunnable(pd,inner,type,report_id,indAppReService,entAppReService);
		        executor.execute(WbqqInnerTask);
		        if(WbqqInnerTask.poolflag){
					returnjson.put("errorcode", "09");
			        returnjson.put("errormsg", "资源已满，请稍后再试！");
			        return returnjson;
				}
			}else{
				//人行查询
				//调用人行webservice接口
				WebServiceRunnable webServiceTask = new WebServiceRunnable(pd,type,indAppReService,entAppReService,iDataSubmissionService,
						crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
				if(pd.getString("CHANNEL_ID").equals(zhixiao_channelID)){
					//直销银行根据用户分为4个队列
					if(json.get("USERNAME").equals(userMap.get("zhixiao1"))){
						zhiXiao1_Executor.execute(webServiceTask);
					}else if(json.get("USERNAME").equals(userMap.get("zhixiao2"))){
						zhiXiao2_Executor.execute(webServiceTask);
					}else if(json.get("USERNAME").equals(userMap.get("zhixiao3"))){
						zhiXiao3_Executor.execute(webServiceTask);
					}else if(json.get("USERNAME").equals(userMap.get("zhixiao4"))){
						zhiXiao4_Executor.execute(webServiceTask);
					}
				}else if(pd.getString("CHANNEL_ID").equals(bigData_channelID)){
					bigData_Executor.execute(webServiceTask);
				}else{
					executor.execute(webServiceTask);
				}
				if(webServiceTask.flag){
					returnjson.put("errorcode", "09");
			        returnjson.put("errormsg", "资源已满，请稍后再试！");
			        return returnjson;
				}
			}
		}else{  
			//人行查询
			//调用人行webservice接口
//			WebServiceRunnable webServiceTask = new WebServiceRunnable(pd,type,indAppReService,entAppReService,iDataSubmissionService);
//	 		executor.execute(webServiceTask);
//	 		if(webServiceTask.flag){
//				returnjson.put("errorcode", "09");
//		        returnjson.put("errormsg", "资源已满，请稍后再试！");
//		        return returnjson;
//			}
	 		WebServiceRunnable webServiceTask = new WebServiceRunnable(pd,type,indAppReService,entAppReService,iDataSubmissionService,
					crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
			if(pd.getString("CHANNEL_ID").equals(zhixiao_channelID)){
				//直销银行根据用户分为4个队列
				if(json.get("USERNAME").equals(userMap.get("zhixiao1"))){
					zhiXiao1_Executor.execute(webServiceTask);
				}else if(json.get("USERNAME").equals(userMap.get("zhixiao2"))){
					zhiXiao2_Executor.execute(webServiceTask);
				}else if(json.get("USERNAME").equals(userMap.get("zhixiao3"))){
					zhiXiao3_Executor.execute(webServiceTask);
				}else if(json.get("USERNAME").equals(userMap.get("zhixiao4"))){
					zhiXiao4_Executor.execute(webServiceTask);
				}
			}else if(pd.getString("CHANNEL_ID").equals(bigData_channelID)){
				bigData_Executor.execute(webServiceTask);
			}else{
				executor.execute(webServiceTask);
			}
			if(webServiceTask.flag){
				returnjson.put("errorcode", "09");
		        returnjson.put("errormsg", "资源已满，请稍后再试！");
		        return returnjson;
			}
		}
//        System.out.println("公共线程池线程池中线程数目："+executor.getPoolSize()+"，队列中等待执行的任务数目："+
//        executor.getQueue().size()+"，已执行玩别的任务数目："+executor.getCompletedTaskCount());
//        System.out.println("直销银行zhx1线程池线程池中线程数目："+zhiXiao1_Executor.getPoolSize()+"，队列中等待执行的任务数目："+
//        		zhiXiao1_Executor.getQueue().size()+"，已执行玩别的任务数目："+zhiXiao1_Executor.getCompletedTaskCount());
//
//        System.out.println("直销银行zhx2线程池线程池中线程数目："+zhiXiao2_Executor.getPoolSize()+"，队列中等待执行的任务数目："+
//        		zhiXiao2_Executor.getQueue().size()+"，已执行玩别的任务数目："+zhiXiao2_Executor.getCompletedTaskCount());
        logger.info("公共线程池线程池中线程数目："+executor.getPoolSize()+"，队列中等待执行的任务数目："+
        		executor.getQueue().size()+"，已执行玩别的任务数目："+executor.getCompletedTaskCount());
        logger.info("直销银行zhx1线程池线程池中线程数目："+zhiXiao1_Executor.getPoolSize()+"，队列中等待执行的任务数目："+
        		zhiXiao1_Executor.getQueue().size()+"，已执行玩别的任务数目："+zhiXiao1_Executor.getCompletedTaskCount());
        logger.info("直销银行zhx2线程池线程池中线程数目："+zhiXiao2_Executor.getPoolSize()+"，队列中等待执行的任务数目："+
        		zhiXiao2_Executor.getQueue().size()+"，已执行玩别的任务数目："+zhiXiao2_Executor.getCompletedTaskCount());
        logger.info("直销银行zhx3线程池线程池中线程数目："+zhiXiao3_Executor.getPoolSize()+"，队列中等待执行的任务数目："+
        		zhiXiao3_Executor.getQueue().size()+"，已执行玩别的任务数目："+zhiXiao3_Executor.getCompletedTaskCount());
        logger.info("直销银行zhx4线程池线程池中线程数目："+zhiXiao4_Executor.getPoolSize()+"，队列中等待执行的任务数目："+
        		zhiXiao4_Executor.getQueue().size()+"，已执行玩别的任务数目："+zhiXiao4_Executor.getCompletedTaskCount());
        logger.info("大数线程池线程池中线程数目："+bigData_Executor.getPoolSize()+"，队列中等待执行的任务数目："+
        		bigData_Executor.getQueue().size()+"，已执行玩别的任务数目："+bigData_Executor.getCompletedTaskCount());
        
        returnjson.put("errorcode", "01");
        returnjson.put("errormsg", "已受理");
        logger.info("查询申请返回报文："+returnjson);
		return returnjson;
	}  
	
	/*
	 * sunyra
	 * 
	 * 个人批量请求接口
	 * */
//	@POST
//	@Path("/queryRequest_batch")
//	public JSONObject queryRequest_batch(InputStream is){
//		PageData pd =new PageData();
//		JSONArray jsonArray = new JSONArray();
//		JSONObject returnjson = new JSONObject();
//		String sysNo="1";
//		PageData pd1=new PageData();
//		pd1.put("sysNo", sysNo);
//		try {
//			pd1 = personInquiryService.findSysStatus(pd1);
//		} catch (Exception e1) {
//			logger.error(e1.getMessage(),e1);
//		}
//		if(pd1.getString("SYS_STATUS").equals("0")){
//			 returnjson.put("errorcode", "08");
//			 returnjson.put("errormsg", "系统维护中");
//			 return returnjson;
//		}
//		try {
//			BufferedReader brs = new BufferedReader(new InputStreamReader(is, "utf-8"));
//			String lines = brs.readLine();
//			jsonArray = JSONArray.fromObject(lines);
//		}catch(Exception e){
//			logger.error("PersonInterface/personQuery_batch出错!",e);
//		}
//		//准备写入文件
//		String str_file=PathUtil.getClasspath() + Const.tx + "eee.txt";
//		File file=new File(str_file);
//		FileOutputStream fis=null;
//		BufferedWriter br=null;
//		OutputStreamWriter isr=null;
//		try {
//			fis = new FileOutputStream(file);	
//			isr= new OutputStreamWriter(fis,"UTF-8");
//			br = new BufferedWriter(isr);		
//			for(int i=0;i<jsonArray.size();i++){
//				JSONObject json =  (JSONObject) jsonArray.get(i);
//				try{
//					if(!json.get("CLIENT_NAME").equals("")){
//						pd.put("CLIENT_NAME",json.get("CLIENT_NAME"));//客户姓名
//					}else{
//						logger.info("CLIENT_NAME参数异常");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}
//					if(!json.get("CREDENTIALS_TYPE").equals("")){
//						pd.put("CREDENTIALS_TYPE", json.get("CREDENTIALS_TYPE"));//证件类型
//					}else{
//						logger.info("CREDENTIALS_TYPE参数异常");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}
//					if(!json.get("CREDENTIALS_NO").equals("")){
//						pd.put("CREDENTIALS_NO", json.get("CREDENTIALS_NO"));//证件号码
//					}else{
//						logger.info("CREDENTIALS_NO参数异常");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}
//					if(!json.get("QUERY_REASON").equals("")){
//						pd.put("QUERY_REASON",json.get("QUERY_REASON"));//查询原因
//					}else{
//						logger.info("QUERY_REASON参数异常");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}
//			if(json.get("QUERY_TYPE")!=null&&!json.get("QUERY_TYPE").equals("")){
//				pd.put("QUERY_TYPE", json.get("QUERY_TYPE"));//查询类型
//			}else{
//				pd.put("QUERY_TYPE", "0");
//			}
//			if(json.get("QUERY_VERSION")!=null&&!json.get("QUERY_VERSION").equals("")){
//				pd.put("QUERY_VERSION", json.get("QUERY_VERSION"));//查询版本
//			}else{
//				pd.put("QUERY_VERSION", "30");
//			}
//			if(pd.get("QUERY_REASON").equals("05")&&!"31".equals(pd.get("QUERY_VERSION"))){
//				logger.info("查询原因与查询版本不对应");
//				returnjson.put("errorcode", "03");
//				returnjson.put("errormsg", "接口参数异常");
//				return returnjson;
//			}
//					if(!json.get("USERNAME").equals("")){
//						pd.put("USERNAME", json.get("USERNAME"));//征信用户名
//					}else{
//						logger.info("USERNAME参数异常");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}
//					if(!json.get("CHANNEL_ID").equals("")){
//						pd.put("CHANNEL_ID", json.get("CHANNEL_ID"));//渠道编号
//						PageData QueryCHANNELNO=new PageData();
//						QueryCHANNELNO = personInquiryService.findByCHANNELNO(pd);
//						if(QueryCHANNELNO!=null&&!QueryCHANNELNO.equals("")){
//							if("1".equals(QueryCHANNELNO.getString("CHANNEL_STATUS"))){
//								logger.info("渠道状态停用，请去渠道信息页面维护");
//								returnjson.put("errorcode", "03");
//								returnjson.put("errormsg", "接口参数异常");
//								returnjson.put("jsonObject", json);
//								return returnjson;
//							}
//						}else{
//							logger.info("渠道编号不存在，请去渠道信息页面维护");
//							returnjson.put("errorcode", "03");
//							returnjson.put("errormsg", "接口参数异常");
//							returnjson.put("jsonObject", json);
//							return returnjson;
//						}
//					}else{
//						logger.info("CHANNEL_ID参数异常");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}
//					if(!json.get("CHANNEL_QUERY_NO").equals("")){
//						pd.put("CHANNEL_QUERY_NO", json.get("CHANNEL_QUERY_NO"));//渠道流水号
//					}else{
//						logger.info("CHANNEL_QUERY_NO参数异常");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}
//					if("1".equals(json.get("IS_CHECK_IMAGE"))){ //是否核验影像资料 1：是， 0：否
//						if(json.get("CUST_MANAGER")!=null&&!json.get("CUST_MANAGER").equals("")){
//							pd.put("CUST_MANAGER",json.get("CUST_MANAGER"));//客户经理
//						}else{
//							logger.info("CUST_MANAGER参数异常");
//							returnjson.put("errorcode", "03");
//							returnjson.put("errormsg", "接口参数异常");
//							returnjson.put("jsonObject", json);
//							return returnjson;
//						}
//						if(json.get("WARRANT_MATURITY_DATE")!=null&&!json.get("WARRANT_MATURITY_DATE").equals("")){
//							pd.put("WARRANT_MATURITY_DATE",json.get("WARRANT_MATURITY_DATE"));//授权书到期日
//						}else{
//							logger.info("WARRANT_MATURITY_DATE参数异常");
//							returnjson.put("errorcode", "03");
//							returnjson.put("errormsg", "接口参数异常");
//							returnjson.put("jsonObject", json);
//							return returnjson;
//						}
//					}else{
//						logger.info("IS_CHECK_IMAGE参数异常");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}
//					if("0".equals(json.get("IS_USE")) || "1".equals(json.get("IS_USE"))){
//						pd.put("IS_USE", json.get("IS_USE"));//如果有近期报告，是否使用，1：是  0：否
//					}else{
//						logger.info("IS_USE参数异常");
//						returnjson.put("errorcode", "03");
//						returnjson.put("errormsg", "接口参数异常");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}		
//				}catch (Exception e) {
//					logger.error(e.getMessage(),e);
//					returnjson.put("errorcode", "03");
//					returnjson.put("errormsg", "参数解析异常");
//					return returnjson;
//				}	
//				String is_use = pd.getString("IS_USE"); //有近期报告，是否使用  0:否  1:是
//				String type="1"; //客户类型
//				String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
//				pd.put("DATA_DATE",date);
//				//校验同一渠道，渠道流水号是否重复
//				PageData QueryNoMap=new PageData();
//				try {
//					QueryNoMap=personInquiryService.findByQueryNo(pd);
//					if(QueryNoMap!=null&&!QueryNoMap.equals("")){
//						if("06".equals(QueryNoMap.getString("STATUS"))||"05".equals(QueryNoMap.getString("STATUS"))){
//							logger.info("流水号重复");
//							jsonArray.remove(i);
//							i--;	
//							if("06".equals(QueryNoMap.getString("STATUS"))){
//								if(!"2".equals(String.valueOf(QueryNoMap.get("INTERNAL")))&&String.valueOf(pd.get("INTERNAL")).length()>30){
//									if("1".equals(is_use)){
//										//行内查询
//										WbqqInnerRunnable WbqqTask = new WbqqInnerRunnable(pd,String.valueOf(QueryNoMap.get("INTERNAL")),"1",String.valueOf(QueryNoMap.get("REPORT_ID")),indAppReService,entAppReService);
//										executor.execute(WbqqTask);
//										if(WbqqTask.poolflag){
//											returnjson.put("errorcode", "09");
//									        returnjson.put("errormsg", "资源已满，请稍后再试！");
//									        return returnjson;
//										}
//									}
//								}
//							}
//							continue;
//						}else if("04".equals(QueryNoMap.getString("STATUS"))||"02".equals(QueryNoMap.getString("STATUS"))||"07".equals(QueryNoMap.getString("STATUS"))||"08".equals(QueryNoMap.getString("STATUS"))||"09".equals(QueryNoMap.getString("STATUS"))||"10".equals(QueryNoMap.getString("STATUS"))){				         
//							pd.put("CLIENT_TYPE", "1");
//							pd.put("ID",QueryNoMap.getString("ID"));					
//							//人行查询
//							//拼接文件
//						    br.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
//							br.write("<Document>\n");
//		                    br.write("<Msg>\n");	
//		                    br.write("<RequestId>");
//		                    br.write(String.valueOf(i+1));
//		                    br.write("</RequestId>\n");
//		                    br.write("<OriginateOrgCode>");
//		                    br.write(json.getString("ORIGINATEORGCODE"));
//		                    br.write("</OriginateOrgCode>\n");
//		                    br.write("<OriginateUserCode>");
//		                    br.write(json.getString("ORIGINATEUSERCODE"));
//		                    br.write("</OriginateUserCode>\n"); 
//		                    br.write("<Name>");
//		                    br.write(json.getString("CLIENT_NAME"));
//		                    br.write("</Name>\n");
//		                    br.write("<IDType>");
//		                    br.write(json.getString("CREDENTIALS_TYPE"));
//		                    br.write("</IDType>\n");
//		                    br.write("<IDNum>");
//		                    br.write(json.getString("CREDENTIALS_NO"));
//		                    br.write("</IDNum>\n");
//		                    br.write("<QueryReason>");
//		                    br.write(json.getString("QUERY_REASON"));
//		                    br.write("</QueryReason>\n");
//		                    br.write("<ServiceCode>");
//		                    br.write(json.getString("ServiceCode"));
//		                    br.write("</ServiceCode>\n");
//		                    br.write("</Msg>\n");
//		                    br.write("</Document>\r\n"); 
//		                    continue;
//						}				
//					}
//				} catch (Exception e1) {
//					logger.error(e1.getMessage(),e1);
//					returnjson.put("errorcode", "02");
//					returnjson.put("errormsg", "系统异常");
//					return returnjson;
//				}	
//				PageData map=null;
//				PageData orgMap=new PageData();
//				String ORG_CODE="";
//				try{
//					orgMap=personInquiryService.findOrg(pd);
//					if(orgMap!=null){
//						ORG_CODE=orgMap.getString("ORG_CODE");
//					}else{
//						logger.info("用户无查询权限");
//						returnjson.put("errorcode", "07");
//						returnjson.put("errormsg", "用户无查询权限");
//						returnjson.put("jsonObject", json);
//						return returnjson;
//					}
//				}catch(Exception e){
//					logger.error(e.getMessage(),e);
//					returnjson.put("errorcode", "02");
//					returnjson.put("errormsg", "系统异常");
//					return returnjson;
//				}
//				String id=UuidUtil.get64UUID();
//				pd.put("ID", id);
//				String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
//				pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
//				pd.put("STATUS", "02");//状态 02已审核
//				pd.put("CHECK_SYS_ID", "0");
//				pd.put("AUDITORS","0");
//				pd.put("INTERNAL", "2");
//				pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
//				pd.put("ORG_ID", orgMap.get("ORG_ID"));
//				pd.put("IP", orgMap.get("IP"));
//				pd.put("MAC", orgMap.get("MAC"));
//				pd.put("CLIENT_TYPE", "1");
//				/*pd.put("QUERY_VERSION", "30");*/
//				/*pd.put("QUERY_TYPE", "0");*/
//				//校验资料		
//				if("1".equals(json.get("IS_CHECK_IMAGE"))){
//					PageData serverInfo=new PageData();
//					try {
//						//获得配置文件配置信息
//						serverInfo = BaseController.getServerInfo();
//						serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
//						String sourtPath = serverInfo.getString("ftpPath1")+pd.getString("CHANNEL_ID")+"/"+pd.getString("CHANNEL_QUERY_NO")+"/";
//						String destPath = serverInfo.getString("ftpPath")+pd.getString("ID")+"/";			
//						if("1".equals(json.get("IS_CHECK_IMAGE"))){ //是否核验影像资料 1：是， 0：否
//							//查看影像资料是否存在
//							List<String> fileNameList = new ArrayList<String>();
//				        	fileNameList.add("LOAN_"+pd.getString("CREDENTIALS_NO"));
//				        	fileNameList.add("WARR_"+pd.getString("CREDENTIALS_NO"));
//				        	fileNameList.add("ID_"+pd.getString("CREDENTIALS_NO"));
//				       	 	fileNameList.add("IDB_"+pd.getString("CREDENTIALS_NO"));        
//				       		List<String> listName=FtpUtil.isFTPFileExist(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), sourtPath,fileNameList); 
//				        	if(listName.size()==0&&!"01".equals(pd.getString("QUERY_REASON"))){
//				        		System.out.println("影像资料未上传");
//				        		returnjson.put("errorcode", "05");
//								returnjson.put("errormsg", "影像资料未上传");
//								returnjson.put("jsonObject", json);
//								return returnjson;
//				        	}
//				        	//将图片搬到以ID命名的文件夹
//				        	if(listName.size()>0){
//				        		WbCopyFileRunnable WbqqTask = new WbCopyFileRunnable(serverInfo,pd.getString("CREDENTIALS_NO"),listName,sourtPath,destPath,"1");
//				        		executor.execute(WbqqTask);
//				        		if(WbqqTask.flag){
//									returnjson.put("errorcode", "09");
//							        returnjson.put("errormsg", "资源已满，请稍后再试！");
//							        return returnjson;
//								}
//				        	}
//						}	
//					}catch(Exception e){
//						logger.error(e.getMessage(),e);
//						returnjson.put("errorcode", "02");
//						returnjson.put("errormsg", "系统异常");
//						return returnjson;
//					}
//		
//			
//				}
//				/*----根据获取的参数数据向个人信息表中添加数据-------*/
//				try{
//					personInquiryService.save(pd);
//					/*----根据获取的参数数据向流程状态表中添加数据--------*/
//					personInquiryService.saveToFs(pd);
//					//查询明细表需要的
//					PageData detail = indAppReService.QueryDetail(pd.getString("ID"));
//					//向明细表中插入数据
//					indAppReService.saveDetail(detail);
//				}catch(Exception e){
//					logger.error(e.getMessage(),e);
//					returnjson.put("errorcode", "02");
//					returnjson.put("errormsg", "系统异常");
//					return returnjson;
//				}
//		
//				//查询判断该笔是否可以行内查询
//				/*************start**************/
//				String limt_date = "0";
//				String inner = "2";
//				String report_id = "";
//				try {
//					PageData queryDate = new PageData();
////					queryDate.put("COMPANY", BaseController.getServerInfo().getString("channel_company"));
//					queryDate.put("COMPANY", orgMap.get("COMPANY"));
//					queryDate.put("ORG_ID", orgMap.get("ORG_ID"));
//					queryDate.put("PARA_TYPE", type);				
//					//判断当前法人是否设置了查询时长参数值
//					queryDate = queryDateService.queryByTypeAndCompany(queryDate);
//					if(queryDate!=null&&queryDate.get("LIMT_DATE")!=null){
//						limt_date = String.valueOf(queryDate.get("LIMT_DATE"));
//					}
//					pd.put("LIMT_DATE", limt_date);
//					//根据条件查询该客户在一定时间内是否被查询过
//					PageData appInfo = indAppReService.findByInfo(pd);
//					if(appInfo!=null&&appInfo.get("ID")!=null){
//						inner = String.valueOf(appInfo.get("ID"));
//						report_id = String.valueOf(appInfo.get("REPORT_ID"));
//					}
//					if(inner!="2"&&!inner.equals("2")){  //行内查询
//						//更新行内/人行字段
//						PageData data = new PageData();
//						data.put("INTERNAL", inner);
//						data.put("ID", id);
//						indAppReService.updateInner(data);
//					}
//				}catch (Exception e1) {
//					logger.error(e1.getMessage(),e1);
//					returnjson.put("errorcode", "02");
//					returnjson.put("errormsg", "系统异常");
//					return returnjson;
//				}
//		
//				/*************end**************/
//				if(inner!="2"&&!inner.equals("2")){//行内查询
//					if("1".equals(is_use)){
//						jsonArray.remove(i);
//						i--;
//						//行内查询
//						WbqqInnerRunnable WbqqInnerTask = new WbqqInnerRunnable(pd,inner,type,report_id,indAppReService,entAppReService);
//						executor.execute(WbqqInnerTask);
//						if(WbqqInnerTask.poolflag){
//							returnjson.put("errorcode", "09");
//					        returnjson.put("errormsg", "资源已满，请稍后再试！");
//					        return returnjson;
//						}
//					}else{
//						//人行查询
//						//拼接文件
//						br.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");				
//						br.write("<Document>\n");
//						br.write("<Msg>\n");	
//						br.write("<RequestId>");
//						br.write(String.valueOf(i+1));
//						br.write("</RequestId>\n");
//						br.write("<OriginateOrgCode>");
//						br.write(json.getString("ORIGINATEORGCODE"));
//						br.write("</OriginateOrgCode>\n");
//						br.write("<OriginateUserCode>");
//						br.write(json.getString("ORIGINATEUSERCODE"));
//						br.write("</OriginateUserCode>\n"); 
//						br.write("<Name>");
//						br.write(json.getString("CLIENT_NAME"));
//						br.write("</Name>\n");
//						br.write("<IDType>");
//						br.write(json.getString("CREDENTIALS_TYPE"));
//						br.write("</IDType>\n");
//						br.write("<IDNum>");
//						br.write(json.getString("CREDENTIALS_NO"));
//						br.write("</IDNum>\n");
//						br.write("<QueryReason>");
//						br.write(json.getString("QUERY_REASON"));
//						br.write("</QueryReason>\n");
//						br.write("<ServiceCode>");
//						br.write(json.getString("ServiceCode"));
//						br.write("</ServiceCode>\n");
//						br.write("</Msg>\n");
//						br.write("</Document>\r\n");
//					}
//				}else{  
//					//人行查询
//					//拼接文件
//					br.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");				
//					br.write("<Document>\n");
//					br.write("<Msg>\n");	
//					br.write("<RequestId>");
//					br.write(String.valueOf(i+1));
//					br.write("</RequestId>\n");
//					br.write("<OriginateOrgCode>");
//					br.write(json.getString("ORIGINATEORGCODE"));
//					br.write("</OriginateOrgCode>\n");
//					br.write("<OriginateUserCode>");
//					br.write(json.getString("ORIGINATEUSERCODE"));
//					br.write("</OriginateUserCode>\n"); 
//					br.write("<Name>");
//					br.write(json.getString("CLIENT_NAME"));
//					br.write("</Name>\n");
//					br.write("<IDType>");
//					br.write(json.getString("CREDENTIALS_TYPE"));
//					br.write("</IDType>\n");
//					br.write("<IDNum>");
//					br.write(json.getString("CREDENTIALS_NO"));
//					br.write("</IDNum>\n");
//					br.write("<QueryReason>");
//					br.write(json.getString("QUERY_REASON"));
//					br.write("</QueryReason>\n");
//					br.write("<ServiceCode>");
//					br.write(json.getString("ServiceCode"));
//					br.write("</ServiceCode>\n");
//					br.write("</Msg>\n");
//					br.write("</Document>\r\n");									
//				}	
//			}    
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			logger.error("PersonInterface/personQuery_batch出错!",e);
//		}finally{			
//			try{
//				if(br!=null)
//					br.close();
//				if(isr!=null)
//					isr.close();
//				if(fis!=null)
//					fis.close();
//			}catch (IOException e) {
//				logger.error("PersonInterface/personQuery_batch出错!",e);
//			}		
//		} 
//		
//		//调用人行webservice接口
//		WebServiceRunnable_batch webServiceTask = new WebServiceRunnable_batch(file,jsonArray,"1",indAppReService,entAppReService);
//		if(pd.getString("CHANNEL_ID").equals(zhixiao_channelID)){
//			//直销银行根据用户分为4个队列
//			if(((JsonObject) jsonArray.get(0)).get("USERNAME").equals(userMap.get("zhixiao1"))){
//				zhiXiao1_Executor.execute(webServiceTask);
//			}else if(((JsonObject) jsonArray.get(0)).get("USERNAME").equals(userMap.get("zhixiao2"))){
//				zhiXiao2_Executor.execute(webServiceTask);
//			}else if(((JsonObject) jsonArray.get(0)).get("USERNAME").equals(userMap.get("zhixiao3"))){
//				zhiXiao3_Executor.execute(webServiceTask);
//			}else if(((JsonObject) jsonArray.get(0)).get("USERNAME").equals(userMap.get("zhixiao4"))){
//				zhiXiao4_Executor.execute(webServiceTask);
//			}
//		}else if(pd.getString("CHANNEL_ID").equals(bigData_channelID)){
//			bigData_Executor.execute(webServiceTask);
//		}else{
//			executor.execute(webServiceTask);
//		}	
//        System.out.println("线程池中线程数目："+executor.getPoolSize()+"，队列中等待执行的任务数目："+
//        executor.getQueue().size()+"，已执行玩别的任务数目："+executor.getCompletedTaskCount());
//        returnjson.put("errorcode", "01");
//        returnjson.put("errormsg", "已受理");
//        logger.info("查询申请返回报文："+returnjson);
//		return returnjson;
//	}  
	
	
	/**
	 * 报告查询接口
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
			logger.info("查看报告请求报文："+json);
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
			logger.debug("查看报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		try {
			List<PageData> list = personInterfaceService.getFlowInfo(pd);
			if(list.size()>0){
				String status = list.get(0).getString("STATUS");
				String reportId = list.get(0).getString("REPORT_ID");
				int orgCnt = Integer.parseInt(list.get(0).get("CNT").toString());
				//人行系统异常
				if (status.equals("04")) {
					jsonReturn.put("errorcode", "08");
					jsonReturn.put("errormsg", "人行连接超时");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("07")) {
					jsonReturn.put("errorcode", "09");
					jsonReturn.put("errormsg", "人行登录密码错误");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("08")) {
					jsonReturn.put("errorcode", "10");
					jsonReturn.put("errormsg", "账号被停用");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("09")) {
					jsonReturn.put("errorcode", "11");
					jsonReturn.put("errormsg", "用户被锁定");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if(status.equals("10")){
					jsonReturn.put("errorcode", "12");
					jsonReturn.put("errormsg", "密码已经过期");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				//未查得
				if(status.equals("05") && reportId == null){
					jsonReturn.put("errorcode", "05");
					jsonReturn.put("errormsg", "信息未查得");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				//无权限
				if(orgCnt == 0 && reportId != null){
					jsonReturn.put("errorcode", "07");
					jsonReturn.put("errormsg", "用户无查询权限");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				//正在爬取
				if(status.equals("02") && reportId == null){
					jsonReturn.put("errorcode", "04");
					jsonReturn.put("errormsg", "正在爬取");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
			}else{
				jsonReturn.put("errorcode", "06");
				jsonReturn.put("errormsg", "未发起查询申请");
				jsonReturn.put("CHANNEL_QUERY_NO", query_no);
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}
			jsonReturn=personInterfaceService.getReportInfo(pd);
			//正在爬取
			if(jsonReturn.size()==0){
				JSONObject jsonReturn1 = new JSONObject();
				jsonReturn1.put("errorcode", "02");
				jsonReturn1.put("errormsg", "系统异常");
				jsonReturn1.put("CHANNEL_QUERY_NO", query_no);
				logger.debug("查看报告返回报文："+jsonReturn1);
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
			logger.debug("查看报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		logger.debug("查看报告返回报文："+jsonReturn);
		return jsonReturn;
	}
	
	
	/**
	 * 数字解询接口
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
		try{
			lines = br.readLine();
			jsonArray = JSONArray.fromObject(lines);
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			logger.error(e2.getMessage(), e2);
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
			logger.debug("查看报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		try {
			List<PageData> list = personInterfaceService.getFlowInfo(pd);
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
					logger.debug("查看报告返回报文："+jsonReturn);	
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("07")) {
					jsonReturn.put("errorcode", "09");
					jsonReturn.put("errormsg", "人行登录密码错误");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("08")) {
					jsonReturn.put("errorcode", "10");
					jsonReturn.put("errormsg", "账号被停用");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("09")) {
					jsonReturn.put("errorcode", "11");
					jsonReturn.put("errormsg", "用户被锁定");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if(status.equals("10")){
					jsonReturn.put("errorcode", "12");
					jsonReturn.put("errormsg", "密码已经过期");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				//未查得
				if(status.equals("05") && reportId == null){
					jsonReturn.put("errorcode", "05");
					jsonReturn.put("errormsg", "信息未查得");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				//无权限
				if(orgCnt == 0 && reportId != null){
					jsonReturn.put("errorcode", "07");
					jsonReturn.put("errormsg", "用户无查询权限");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				//正在爬取
				if(status.equals("02") && reportId == null){
					jsonReturn.put("errorcode", "04");
					jsonReturn.put("errormsg", "正在爬取");
					jsonReturn.put("CHANNEL_QUERY_NO", query_no);
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
			}else{
				jsonReturn.put("errorcode", "06");
				jsonReturn.put("errormsg", "未发起查询申请");
				jsonReturn.put("CHANNEL_QUERY_NO", query_no);
				jsonReturn.put("jsonObject", json);
				logger.debug("查看报告返回报文："+jsonReturn);
				jsonArrayReturn.add(jsonReturn);
				continue;
			}
			//查询个人信用报告信息
			jsonReturn=personInterfaceService.getReportInfo(pd);
			
			//正在爬取
			if(jsonReturn.size()==0){
				JSONObject jsonReturn1 = new JSONObject();
				jsonReturn1.put("errorcode", "02");
				jsonReturn1.put("errormsg", "系统异常");
				jsonReturn1.put("CHANNEL_QUERY_NO", query_no);
				jsonReturn1.put("jsonObject", json);
				logger.debug("查看报告返回报文："+jsonReturn1);
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
			logger.debug("查看报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		}
		jsonObject.put("jsonArray", jsonArrayReturn);
		logger.debug("查看报告返回报文："+jsonObject);
		return jsonObject;
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
			runShutdownNowAndUpdateStatus(bigData_Executor,"bigData_Executor");
			runShutdownNowAndUpdateStatus(zhiXiao1_Executor,"zhiXiao1_Executor");
			runShutdownNowAndUpdateStatus(zhiXiao2_Executor,"zhiXiao2_Executor");
			runShutdownNowAndUpdateStatus(zhiXiao3_Executor,"zhiXiao3_Executor");
			runShutdownNowAndUpdateStatus(zhiXiao4_Executor,"zhiXiao4_Executor");
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
					w.saveExcutorInfo(executor_type,"1");
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}  
