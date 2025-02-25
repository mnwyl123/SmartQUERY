package com.dcits.credit.controller.rest;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.dcits.credit.util.crawler.Util;
import com.dcits.platform.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Component;

import com.dcits.credit.controller.rest.util.MyRejectedExecutionHandler;
import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.entity.ReadFile;
import com.dcits.credit.entity.WebServiceRunnable;
import com.dcits.credit.service.ChannelService.ChannelManager;
import com.dcits.credit.service.CreditCompanyServer.CreditCompanyServerService;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.companyInquiry.CompanyInquiryManager;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.rest.ReportInterfaceService;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.PasswordOper;
import com.dcits.platform.controller.base.BaseController;
import com.google.gson.JsonArray;

import net.lingala.zip4j.exception.ZipException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/** 
 * 信贷企业接口
 * 
 */ 
@Component
@Path("/companyLoanInterface")
public class CompanyLoanInterface extends BaseController{
	private static Logger logger = Logger.getLogger(CompanyLoanInterface.class);
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
	@Resource(name="creditCompanyServerService")
	private CreditCompanyServerService creditCompanyServerService;
	@Resource(name="channelService")
	private ChannelManager channelService ;
	
	ThreadPoolExecutor executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))),new MyRejectedExecutionHandler());
	//爬虫请求接口
	@POST
	@Path("/queryComRequest")
	public JSONObject queryComRequest(InputStream is){
		 PageData pd =new PageData();
		JSONObject json = new JSONObject();
		JSONObject returnjson = new JSONObject();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查询申请请求报文："+json);
			logger.debug("request json............" + json);
			//提取字段，判断字段
			if(!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(!json.get("CHECK_SYS_NAME").equals("")){
				pd.put("CHECK_SYS_NAME", json.get("CHECK_SYS_NAME"));//审核员用户名
			}else{
				logger.info("CHECK_SYS_NAME参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
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
			if(!json.get("CHANNEL_QUERY_NO").equals("")){
				pd.put("CHANNEL_QUERY_NO", json.get("CHANNEL_QUERY_NO"));//渠道流水号
			}else{
				logger.info("CHANNEL_QUERY_NO参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(!json.get("CLIENT_NAME").equals("")){
				pd.put("COMPANY_NAME",json.get("CLIENT_NAME"));//客户姓名
			}else{
				logger.info("COMPANY_NAME参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(!json.get("CREDENTIALS_NO_TYPE").equals("")){
				pd.put("CREDENTIALS_NO_TYPE", json.get("CREDENTIALS_NO_TYPE"));//证件类型
			}else{
				logger.info("CREDENTIALS_NO_TYPE参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(!json.get("CHINA_CREDIT_CODE").equals("")){
				pd.put("CHINA_CREDIT_CODE", json.get("CHINA_CREDIT_CODE"));//证件号码
			}else{
				logger.info("CHINA_CREDIT_CODE参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(!json.get("QUERY_REASON").equals("")){
				pd.put("QUERY_REASON", json.get("QUERY_REASON"));//查询原因
			}else{
				logger.info("QUERY_REASON参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(!json.get("QUERY_VERSION").equals("")){
				pd.put("QUERY_VERSION",json.get("QUERY_VERSION"));//查询版本
			}else{
				logger.info("QUERY_VERSION参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(!json.get("QUERY_TYPE").equals("")){
				pd.put("QUERY_TYPE",json.get("QUERY_TYPE"));//查询类型
			}else{
				logger.info("QUERY_TYPE参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(!json.get("CUST_MANAGER").equals("")){
				pd.put("CUST_MANAGER",json.get("CUST_MANAGER"));//客户经理
			}else{
				logger.info("CUST_MANAGER参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(!json.get("WARRANT_MATURITY_DATE").equals("")){
				pd.put("WARRANT_MATURITY_DATE",json.get("WARRANT_MATURITY_DATE"));//授权书到期日
			}else{
				logger.info("WARRANT_MATURITY_DATE参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}	
		String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
		pd.put("DATA_DATE",date);
		//校验用户名和渠道编号是否对应
/*		try {
			if(channelService.queryByUserName(pd)==null){
				logger.error("用户名和渠道编号不对应");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "参数解析异常，用户名和渠道编号不对应");
				return returnjson;
			}else{//校验渠道是否正常
				PageData pd1 = channelService.queryChannelById(pd);
				if(!"0".equals(String.valueOf(pd1.get("CHANNEL_STATUS")))){
					logger.error("渠道"+pd.getString("CHANNEL_ID")+"已经停用");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "参数解析异常,该渠道已停用");
					return returnjson;
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);;
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}*/
		//校验同一渠道，渠道流水号是否重复
		PageData QueryNoMap=new PageData();
		try {
			QueryNoMap=personInquiryService.findByQueryNo(pd);
			if(QueryNoMap!=null&&!QueryNoMap.equals("")){
				logger.error("流水号重复");
				returnjson.put("errorcode", "04");
				returnjson.put("errormsg", "重复申请");
				return returnjson;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		
		//查询该用户是否具有查询权限
		PageData orgMap=new PageData();
		PageData userMap=new PageData();
		String ORG_CODE="";
		String CHECK_SYS_ID="";
		try{
			orgMap=personInquiryService.findOrg(pd);
			if(orgMap==null||orgMap.get("USERNAME_PERBANK_ORG")==null){
				logger.error("用户无查询权限");
				returnjson.put("errorcode", "07");
				returnjson.put("errormsg", "用户无查询权限");
				return returnjson;
			}/*else if(!String.valueOf(orgMap.get("LOCK_STATUS")).equals("1")){
				logger.error("非正常状态用户");
				returnjson.put("errorcode", "07");  //错误编码
				returnjson.put("errormsg", "非正常状态用户");
				return returnjson;
			}*/else{
				pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
				userMap=personInquiryService.findcheckuser(pd);
			}
			if(userMap!=null){
				CHECK_SYS_ID=userMap.getString("CHECK_SYS_ID");
			}else{
				logger.info("用户无审核权限");
				returnjson.put("errorcode", "07");
				returnjson.put("errormsg", "用户无审核权限");
				return returnjson;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		//企业信息表字段数据
		pd.put("ID", UuidUtil.get64UUID());
		/*pd.put("CREDENTIALS_NO_TYPE", pd.getString("TYPE"));
		pd.put("CHINA_CREDIT_CODE", pd.getString("CODE"));*/
		pd.put("AUDITORS","0");
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		//状态表字段信息
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		pd.put("APPLICATION_TIME",new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));//申请时间
		pd.put("CHECK_SYS_ID", CHECK_SYS_ID);
		pd.put("STATUS", "00");//状态 00待提交
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("ANNEX", "2");
		pd.put("INTERNAL", "2");
		pd.put("CLIENT_TYPE", "2");
		pd.put("IS_WX_CHECK", "0");
		PageData serverInfo=new PageData();
		/*----根据获取的参数数据向企业信息表中添加数据-------*/
		try{
			//获得配置文件配置信息
			serverInfo = BaseController.getServerInfo();
			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
			String sourtPath = serverInfo.getString("ftpPath1")+pd.getString("CHANNEL_ID")+"/"+APPLICATION_TIME.substring(0,8)+"/"+pd.getString("CHANNEL_QUERY_NO")+"/";
			String destPath = serverInfo.getString("ftpPath")+pd.getString("ID")+"/";
			//查看影像资料是否存在
			List<String> fileNameList = new ArrayList<String>();
	        fileNameList.add("LOAN_"+pd.getString("CHINA_CREDIT_CODE"));
	        fileNameList.add("WARR_"+pd.getString("CHINA_CREDIT_CODE"));
	        fileNameList.add("ID_"+pd.getString("CHINA_CREDIT_CODE"));
	        List<String> listName=FtpUtil.isFTPFileExist(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), sourtPath,fileNameList); 
	        if(listName.size()==0&&!"30".equals(pd.getString("QUERY_REASON"))){
				logger.info("文件不存在");
	        	returnjson.put("errorcode", "05");
				returnjson.put("errormsg", "影像资料未上传");
				return returnjson;
	        }
	        //将图片搬到以ID命名的文件夹
	        if(listName.size()>0){
	        	String orgainFileName="LOAN_"+pd.getString("CHINA_CREDIT_CODE");//贷款申请书（原始文件名称）
	        	for(int i=0;i<listName.size();i++){
					if(listName.get(i).contains(orgainFileName)){
						orgainFileName = listName.get(i);
						break;
					}
				}
				String finalFileName="LOAN_APPLICATION"+".jpg";//贷款申请书
				FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
				orgainFileName="WARR_"+pd.getString("CHINA_CREDIT_CODE");//授权书（原始文件名称）
				for(int i=0;i<listName.size();i++){
					if(listName.get(i).contains(orgainFileName)){
						orgainFileName = listName.get(i);
						break;
					}
				}
				finalFileName="WARRANT"+".jpg";//贷款申请书
				FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
				orgainFileName="ID_"+pd.getString("CHINA_CREDIT_CODE");//身份证明文件（原始文件名称）
				for(int i=0;i<listName.size();i++){
					if(listName.get(i).contains(orgainFileName)){
						orgainFileName = listName.get(i);
						break;
					}
				}
				finalFileName="business_licence"+".jpg";//身份证明文件
				FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
	        }
			companyInquiryService.save(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			companyInquiryService.saveToFs(pd);
			//查询明细表需要的
			PageData detail = entAppReService.QueryEntDetail(pd.getString("ID"));
			//向明细表中插入数据
			entAppReService.saveEntDetail(detail);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			//returnjson.put("CHANNEL_QUERY_NO",json.get("CHANNEL_QUERY_NO"));
			return returnjson;
		}
        returnjson.put("errorcode", "01");
        returnjson.put("errormsg", "已受理");
		//returnjson.put("QUERY_NO",id);
        logger.info("查询申请返回报文："+returnjson);
		return returnjson;
	}  
	
	//批量爬虫请求接口
		@POST
		@Path("/queryComRequest_batch")
		public JSONObject queryComRequest_batch(InputStream is){  
			PageData pd =new PageData();
			JSONObject returnjson = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			BufferedReader br;
			try {
				br = new BufferedReader(new InputStreamReader(is, "utf-8"));
				String lines = br.readLine();
				jsonArray = JSONArray.fromObject(lines);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			for(int i_json=0;i_json<jsonArray.size();i_json++){
				JSONObject json = jsonArray.getJSONObject(i_json);
			try {
				
				logger.info("查询申请请求报文："+json);
				logger.info("request json............" + json);
				//提取字段，判断字段
				if(!json.get("USERNAME").equals("")){
					pd.put("USERNAME", json.get("USERNAME"));//征信用户名
				}else{
					logger.info("USERNAME参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("CHECK_SYS_NAME").equals("")){
					pd.put("CHECK_SYS_NAME", json.get("CHECK_SYS_NAME"));//审核员用户名
				}else{
					logger.info("CHECK_SYS_NAME参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
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
							returnjson.put("errormsg", "接口参数异常");
							returnjson.put("jsonObject", json);
							return returnjson;
						}
					}else{
						logger.info("渠道编号不存在，请去渠道信息页面维护");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "接口参数异常");
						returnjson.put("jsonObject", json);
						return returnjson;
					}
				}else{
					logger.info("CHANNEL_ID参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("CHANNEL_QUERY_NO").equals("")){
					pd.put("CHANNEL_QUERY_NO", json.get("CHANNEL_QUERY_NO"));//渠道流水号
				}else{
					logger.info("CHANNEL_QUERY_NO参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("CLIENT_NAME").equals("")){
					pd.put("COMPANY_NAME",json.get("CLIENT_NAME"));//客户姓名
				}else{
					logger.info("COMPANY_NAME参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("CREDENTIALS_NO_TYPE").equals("")){
					pd.put("CREDENTIALS_NO_TYPE", json.get("CREDENTIALS_NO_TYPE"));//证件类型
				}else{
					logger.info("CREDENTIALS_NO_TYPE参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("CHINA_CREDIT_CODE").equals("")){
					pd.put("CHINA_CREDIT_CODE", json.get("CHINA_CREDIT_CODE"));//证件号码
				}else{
					logger.info("CHINA_CREDIT_CODE参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("QUERY_REASON").equals("")){
					pd.put("QUERY_REASON", json.get("QUERY_REASON"));//查询原因
				}else{
					logger.info("QUERY_REASON参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("QUERY_VERSION").equals("")){
					pd.put("QUERY_VERSION",json.get("QUERY_VERSION"));//查询版本
				}else{
					logger.info("QUERY_VERSION参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("QUERY_TYPE").equals("")){
					pd.put("QUERY_TYPE",json.get("QUERY_TYPE"));//查询类型
				}else{
					logger.info("QUERY_TYPE参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("CUST_MANAGER").equals("")){
					pd.put("CUST_MANAGER",json.get("CUST_MANAGER"));//客户经理
				}else{
					logger.info("CUST_MANAGER参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
				if(!json.get("WARRANT_MATURITY_DATE").equals("")){
					pd.put("WARRANT_MATURITY_DATE",json.get("WARRANT_MATURITY_DATE"));//授权书到期日
				}else{
					logger.info("WARRANT_MATURITY_DATE参数异常");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "接口参数异常");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "参数解析异常");
				return returnjson;
			}	
			String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
			pd.put("DATA_DATE",date);
			//校验用户名和渠道编号是否对应
	/*		try {
				if(channelService.queryByUserName(pd)==null){
					logger.error("用户名和渠道编号不对应");
					returnjson.put("errorcode", "03");
					returnjson.put("errormsg", "参数解析异常，用户名和渠道编号不对应");
					return returnjson;
				}else{//校验渠道是否正常
					PageData pd1 = channelService.queryChannelById(pd);
					if(!"0".equals(String.valueOf(pd1.get("CHANNEL_STATUS")))){
						logger.error("渠道"+pd.getString("CHANNEL_ID")+"已经停用");
						returnjson.put("errorcode", "03");
						returnjson.put("errormsg", "参数解析异常,该渠道已停用");
						return returnjson;
					}
				}
			} catch (Exception e) {
				logger.error(e.getMessage(), e);;
				returnjson.put("errorcode", "02");
				returnjson.put("errormsg", "系统异常");
				return returnjson;
			}*/
			//校验同一渠道，渠道流水号是否重复
			PageData QueryNoMap=new PageData();
			try {
				QueryNoMap=personInquiryService.findByQueryNo(pd);
				if(QueryNoMap!=null&&!QueryNoMap.equals("")){
					logger.error("流水号重复");
					returnjson.put("errorcode", "04");
					returnjson.put("errormsg", "重复申请");
					returnjson.put("jsonObject", json);
					jsonArray.remove(i_json);
					i_json--;
					continue;
				}
			} catch (Exception e) {
				logger.error(e.getMessage(),e);
				returnjson.put("errorcode", "02");
				returnjson.put("errormsg", "系统异常");
				returnjson.put("jsonObject", json);
				return returnjson;
			}
			
			//查询该用户是否具有查询权限
			PageData orgMap=new PageData();
			PageData userMap=new PageData();
			String ORG_CODE="";
			String CHECK_SYS_ID="";
			try{
				orgMap=personInquiryService.findOrg(pd);
				if(orgMap==null||orgMap.get("USERNAME_PERBANK_ORG")==null){
					logger.error("用户无查询权限");
					returnjson.put("errorcode", "07");
					returnjson.put("errormsg", "用户无查询权限");
					returnjson.put("jsonObject", json);
					return returnjson;
				}/*else if(!String.valueOf(orgMap.get("LOCK_STATUS")).equals("1")){
					logger.error("非正常状态用户");
					returnjson.put("errorcode", "07");  //错误编码
					returnjson.put("errormsg", "非正常状态用户");
					return returnjson;
				}*/else{
					pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
					userMap=personInquiryService.findcheckuser(pd);
				}
				if(userMap!=null){
					CHECK_SYS_ID=userMap.getString("CHECK_SYS_ID");
				}else{
					logger.info("用户无审核权限");
					returnjson.put("errorcode", "07");
					returnjson.put("errormsg", "用户无审核权限");
					returnjson.put("jsonObject", json);
					return returnjson;
				}
			}catch(Exception e){
				logger.error(e.getMessage(),e);
				returnjson.put("errorcode", "02");
				returnjson.put("errormsg", "系统异常");
				returnjson.put("jsonObject", json);
				return returnjson;
			}
			//企业信息表字段数据
			pd.put("ID", UuidUtil.get64UUID());
			/*pd.put("CREDENTIALS_NO_TYPE", pd.getString("TYPE"));
			pd.put("CHINA_CREDIT_CODE", pd.getString("CODE"));*/
			pd.put("AUDITORS","0");
			String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			//状态表字段信息
			pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
			pd.put("ORG_ID", orgMap.get("ORG_ID"));
			pd.put("APPLICATION_TIME",new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));//申请时间
			pd.put("CHECK_SYS_ID", CHECK_SYS_ID);
			pd.put("STATUS", "00");//状态 00待提交
			pd.put("IP", orgMap.get("IP"));
			pd.put("MAC", orgMap.get("MAC"));
			pd.put("ANNEX", "2");
			pd.put("INTERNAL", "2");
			pd.put("CLIENT_TYPE", "2");
			pd.put("IS_WX_CHECK", "0");
			PageData serverInfo=new PageData();
			/*----根据获取的参数数据向企业信息表中添加数据-------*/
			try{
				//获得配置文件配置信息
				serverInfo = BaseController.getServerInfo();
				serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
				String sourtPath = serverInfo.getString("ftpPath1")+pd.getString("CHANNEL_ID")+"/"+APPLICATION_TIME.substring(0,8)+"/"+pd.getString("CHANNEL_QUERY_NO")+"/";
				String destPath = serverInfo.getString("ftpPath")+pd.getString("ID")+"/";
				//查看影像资料是否存在
				List<String> fileNameList = new ArrayList<String>();
		        fileNameList.add("LOAN_"+pd.getString("CHINA_CREDIT_CODE"));
		        fileNameList.add("WARR_"+pd.getString("CHINA_CREDIT_CODE"));
		        fileNameList.add("ID_"+pd.getString("CHINA_CREDIT_CODE"));
		        List<String> listName=FtpUtil.isFTPFileExist(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), sourtPath,fileNameList); 
		        if(listName.size()==0&&!"03".equals(pd.getString("QUERY_REASON"))){
					logger.info("文件不存在");
		        	returnjson.put("errorcode", "05");
					returnjson.put("errormsg", "影像资料未上传");
					return returnjson;
		        }
		        //将图片搬到以ID命名的文件夹
		        if(listName.size()>0){
		        	String orgainFileName="LOAN_"+pd.getString("CHINA_CREDIT_CODE");//贷款申请书（原始文件名称）
		        	for(int i=0;i<listName.size();i++){
						if(listName.get(i).contains(orgainFileName)){
							orgainFileName = listName.get(i);
							break;
						}
					}
					String finalFileName="LOAN_APPLICATION"+".jpg";//贷款申请书
					FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
					orgainFileName="WARR_"+pd.getString("CHINA_CREDIT_CODE");//授权书（原始文件名称）
					for(int i=0;i<listName.size();i++){
						if(listName.get(i).contains(orgainFileName)){
							orgainFileName = listName.get(i);
							break;
						}
					}
					finalFileName="WARRANT"+".jpg";//贷款申请书
					FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
					orgainFileName="ID_"+pd.getString("CHINA_CREDIT_CODE");//身份证明文件（原始文件名称）
					for(int i=0;i<listName.size();i++){
						if(listName.get(i).contains(orgainFileName)){
							orgainFileName = listName.get(i);
							break;
						}
					}
					finalFileName="business_licence"+".jpg";//身份证明文件
					FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		        }
				companyInquiryService.save(pd);
				/*----根据获取的参数数据向流程状态表中添加数据--------*/
				companyInquiryService.saveToFs(pd);
				//查询明细表需要的
				PageData detail = entAppReService.QueryEntDetail(pd.getString("ID"));
				//向明细表中插入数据
				entAppReService.saveEntDetail(detail);
			}catch(Exception e){
				logger.error(e.getMessage(),e);
				returnjson.put("errorcode", "02");
				returnjson.put("errormsg", "系统异常");
				//returnjson.put("CHANNEL_QUERY_NO",json.get("CHANNEL_QUERY_NO"));
				return returnjson;
			}
			}
	        returnjson.put("errorcode", "01");
	        returnjson.put("errormsg", "已受理");
			//returnjson.put("QUERY_NO",id);
	        logger.info("查询申请返回报文："+returnjson);
			return returnjson;
		} 
	
	/**
	 * 查询请求接口
	 * @param json
	 * @return
	 */
	@POST
	@Path("/queryComReport")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryComReport(InputStream is){
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		String query_no = "";
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
		} catch (Exception e) { 
			//参数异常
			logger.info(e.getMessage(),e);
			jsonReturn.put("errorcode", "03");
			jsonReturn.put("errormsg", "接口参数有误");
			return jsonReturn;
		}
		try {
			//读取报告编号、状态等信息，以判断是否爬虫成功！
			List<PageData> list = reportService.getFlowInfo(pd);
			String REPORT_ID = "";
			if(list.size()>0){
				String status = list.get(0).getString("STATUS");
				REPORT_ID = String.valueOf(list.get(0).get("REPORT_ID"));
				//人行系统异常
				if (status.equals("00")) {
					jsonReturn.put("errorcode", "02");
					jsonReturn.put("errormsg", "数据待提交");
					return jsonReturn;
				}
				if (status.equals("01")) {
					jsonReturn.put("errorcode", "02");
					jsonReturn.put("errormsg", "数据待审核");
					return jsonReturn;
				}
				//人行系统异常
				if (status.equals("04")) {
					jsonReturn.put("errorcode", "02");
					jsonReturn.put("errormsg", "系统异常");
					return jsonReturn;
				}
				//未查得
				if(status.equals("05") && REPORT_ID.equals("null")){
					jsonReturn.put("errorcode", "05");
					jsonReturn.put("errormsg", "信息未查得");
					return jsonReturn;
				}
				if(status.equals("02") && REPORT_ID.equals("null")){
					jsonReturn.put("errorcode", "04");
					jsonReturn.put("errormsg", "正在爬取");
					return jsonReturn;
				}
				if (status.equals("07")) {
					jsonReturn.put("errorcode", "09");
					jsonReturn.put("errormsg", "人行登录密码错误");
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("08")) {
					jsonReturn.put("errorcode", "10");
					jsonReturn.put("errormsg", "账号被停用");
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if (status.equals("09")) {
					jsonReturn.put("errorcode", "11");
					jsonReturn.put("errormsg", "用户被锁定");
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if(status.equals("10")){
					jsonReturn.put("errorcode", "12");
					jsonReturn.put("errormsg", "密码已经过期");
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
				if(status.equals("11")){
					jsonReturn.put("errorcode", "13");
					jsonReturn.put("errormsg", "机构代码错误");
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
			}else{
				jsonReturn.put("errorcode", "06");
				jsonReturn.put("errormsg", "未发起查询申请");
				return jsonReturn;
			}
			
			//爬虫成功，读取库中数据
			if(!"".equals(REPORT_ID)){
				jsonReturn = creditCompanyServerService.getReportDataByDate(REPORT_ID);
			}
			//正在爬取
			if(jsonReturn == null||jsonReturn.size()==0){
				JSONObject jsonR = new JSONObject();
				jsonR.put("errorcode", "02");
				jsonR.put("errormsg", "系统异常");
				return jsonR;
			}
			//正常获取
			jsonReturn.put("errorcode", "01");
			jsonReturn.put("errormsg", "正常受理");
			jsonReturn.put("CHANNEL_QUERY_NO", query_no);
			logger.debug("查看报告返回报文："+jsonReturn);
			return jsonReturn;
		} catch (Exception e) {
			//系统异常
			logger.info(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
	}
	
	/**
	 * 查询请求接口
	 * @param json
	 * @return
	 */
	@POST
	@Path("/queryComReport_batch")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryComReport_batch(InputStream is){
		JSONArray jsonArrayReturn = new JSONArray();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject=new JSONObject();
		PageData pd = new PageData();
		String query_no = "";
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try{
		String lines = br.readLine();
		jsonArray = JSONArray.fromObject(lines);
		logger.info("查看报告请求报文："+jsonArray);
		}catch(Exception e){
              e.printStackTrace();
		}
		for(int i=0;i<jsonArray.size();i++){
			JSONObject json = jsonArray.getJSONObject(i);
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
		} catch (Exception e) { 
			//参数异常
			logger.info(e.getMessage(),e);
			jsonReturn.put("errorcode", "03");
			jsonReturn.put("errormsg", "接口参数有误");
			jsonReturn.put("jsonObject", json);
			return jsonReturn;
		}
		try {
			//读取报告编号、状态等信息，以判断是否爬虫成功！
			List<PageData> list = reportService.getFlowInfo(pd);
			String REPORT_ID = "";
			if(list.size()>0){
				String status = list.get(0).getString("STATUS");
				REPORT_ID = String.valueOf(list.get(0).get("REPORT_ID"));
				//人行系统异常
				if (status.equals("00")) {
					jsonReturn.put("errorcode", "02");
					jsonReturn.put("errormsg", "数据待提交");
					jsonReturn.put("jsonObject", json);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("01")) {
					jsonReturn.put("errorcode", "02");
					jsonReturn.put("errormsg", "数据待审核");
					jsonReturn.put("jsonObject", json);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				//人行系统异常
				if (status.equals("04")) {
					jsonReturn.put("errorcode", "02");
					jsonReturn.put("errormsg", "系统异常");
					jsonReturn.put("jsonObject", json);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				//未查得
				if(status.equals("05") && REPORT_ID.equals("null")){
					jsonReturn.put("errorcode", "05");
					jsonReturn.put("errormsg", "信息未查得");
					jsonReturn.put("jsonObject", json);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if(status.equals("02") && REPORT_ID.equals("null")){
					jsonReturn.put("errorcode", "04");
					jsonReturn.put("errormsg", "正在爬取");
					jsonReturn.put("jsonObject", json);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("07")) {
					jsonReturn.put("errorcode", "09");
					jsonReturn.put("errormsg", "人行登录密码错误");					
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("08")) {
					jsonReturn.put("errorcode", "10");
					jsonReturn.put("errormsg", "账号被停用");
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if (status.equals("09")) {
					jsonReturn.put("errorcode", "11");
					jsonReturn.put("errormsg", "用户被锁定");
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if(status.equals("10")){
					jsonReturn.put("errorcode", "12");
					jsonReturn.put("errormsg", "密码已经过期");
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
				if(status.equals("11")){
					jsonReturn.put("errorcode", "13");
					jsonReturn.put("errormsg", "机构代码错误");
					jsonReturn.put("jsonObject", json);
					logger.debug("查看报告返回报文："+jsonReturn);
					jsonArrayReturn.add(jsonReturn);
					continue;
				}
			}else{
				jsonReturn.put("errorcode", "06");
				jsonReturn.put("errormsg", "未发起查询申请");
				jsonReturn.put("jsonObject", json);
				logger.debug("查看报告返回报文："+jsonReturn);
				jsonArrayReturn.add(jsonReturn);
				continue;
			}
			
			//爬虫成功，读取库中数据
			if(!"".equals(REPORT_ID)){
				jsonReturn = creditCompanyServerService.getReportDataByDate(REPORT_ID);
			}
			//正在爬取
			if(jsonReturn == null||jsonReturn.size()==0){
				JSONObject jsonR = new JSONObject();
				jsonR.put("errorcode", "02");
				jsonR.put("errormsg", "系统异常");
				jsonR.put("jsonObject", json);
				jsonArrayReturn.add(jsonR);
				continue;
			}
			
			//正常获取
			jsonReturn.put("errorcode", "01");
			jsonReturn.put("errormsg", "正常受理");
			jsonReturn.put("CHANNEL_QUERY_NO", query_no);
			logger.debug("查看报告返回报文："+jsonReturn);
			jsonArrayReturn.add(jsonReturn);
		} catch (Exception e) {
			//系统异常
			logger.info(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		}
		jsonObject.put("jsonArray", jsonArrayReturn);
		logger.info("查看报告返回报文："+jsonObject);
		return jsonObject;
	}
	//此方法不用，查询原始报告使用personLoanInterface接口的queryOriginalReport方法
	@POST
	@Path("/queryComOriginalReport")
	@Produces(MediaType.APPLICATION_JSON)
	public Object queryOriginalReport(InputStream is,@HeaderParam("Host") String url){
		//StringBuilder jsonStr = new StringBuilder();
		ByteArrayInputStream stream = null;
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		String query_no = "";
		String channel_id = "";
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
			channel_id = json.getString("CHANNEL_ID");
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
			//return jsonReturn;
		}
		try {
			List<PageData> list = reportService.getFlowInfo(pd);
			String reportId = null;
			if(list.size()>0){
				String status = list.get(0).getString("STATUS");
				reportId = list.get(0).getString("REPORT_ID");
				int orgCnt = Integer.parseInt(list.get(0).get("CNT").toString());
				pd.put("ID", list.get(0).getString("ID"));
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
				return jsonReturn;
			}
			if(reportId!=null){
				String fileName = this.getOriginalReport(pd,channel_id);
				url = "http://"+url+fileName;
				/*String res = new sun.misc.BASE64Encoder().encode(jsonStr.getBytes("GBK"));*/
				jsonReturn.element("url", url);
				//正常获取
				jsonReturn.put("errorcode", "01");
				jsonReturn.put("errormsg", "正常受理");
				jsonReturn.put("CHANNEL_QUERY_NO", query_no);
			}
		} catch (Exception e) {
			//系统异常
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		logger.info("查看报告返回报文："+jsonReturn);
		return jsonReturn;
	}
	/**
	 * 去服务器下载页面
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	  public String getOriginalReport(PageData pd,String channel_id){
		//JSONObject returnJson = new JSONObject();
		String returnString=new String();
		String ID=pd.getString("ID");
		PageData serverInfo=new PageData();
	 	try {
			serverInfo = BaseController.getServerInfo();
		} catch (IOException e) {
			logger.error(e.getMessage(),e);
		}
		String ftpHost =serverInfo.getString("IP");  
      String ftpUserName =serverInfo.getString("LoginName");  
      String ftpPassword =  PasswordOper.decode(serverInfo.getString("LoginPass"));  
      int ftpPort =  Integer.parseInt(serverInfo.getString("port"));  
      String ftpPath =serverInfo.getString("ftpPath")+ID;   //    credit2.0/data/id
      String app_Name = serverInfo.getString("Application_Name");//  /SmartSense/
      String localPath =PathUtil.getClasspath() + Const.FILEPATHIMG;   //  uploadFiles/uploadImgs/
      String zipFileName=ID+".zip";
      String filePath=localPath+ID+"/"+ID+".html";
      String fileName = ID+ID.substring(0, 10)+".html";
      //判断文件是否存在
      File fil = new File(localPath+fileName);
      if(!fil.exists()){
      	 List<String> fileList = new ArrayList<String>();
           fileList.add(zipFileName);
           FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileList); 
           try {
   			CompressUtils.unZip(localPath+zipFileName,localPath+ID,ID.substring(0,6));
   		} catch (ZipException e) {
   			logger.error(e.getMessage(),e);
   		}
           File file = new File(filePath);
   		ReadFile readFileTest=new ReadFile();
//   		StringBuilder aaa=readFileTest.txtToString(file);
   		String pageCode=readFileTest.txt2String(file);
   		////////////////////
   		//判断报告是否有数字解读部分，若有则对该部分进行隐藏
   		if(pageCode.contains("个人信用报告“数字解读”")&&pageCode.contains("相对位置")){
				pageCode = operateString(pageCode);
			}
   		//隐藏打印按钮
   		pageCode = pageCode.replaceAll("button", "hidden");
   		pageCode = pageCode.replaceAll("javascript:location.href=", "");
   		pageCode = pageCode.replaceAll("javascript:window.open", "");
   		//保存报告
   		try{
   			file = new File(localPath,fileName);
   			if(!file.exists()){
   				file.createNewFile();
   			}
   			FileUtil.writeFile(localPath+fileName, pageCode, "utf-8");
//   			PrintWriter out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"GBK")));
//   			out.write(pageCode);
//   			out.flush();
//   			out.close();
   		}catch(Exception e){
   			logger.error(e.getMessage(),e);
   		}
      }
		return app_Name+Const.FILEPATHIMG+fileName;
	};
	
	//处理数据解读部分
	public static String operateString(String pageCode){
		Document document = Jsoup.parse(pageCode);
		try{
			
			List<Element> ele = document.getElementsByTag("TR");
			for(int i=0;i<ele.size();i++){
				String str = ele.get(i).text();
				if(str.contains("个人信用报告“数字解读”")){
					ele.get(i).attr("style", "display:none");
				}
				if(str.contains("数字解读")&&str.contains("相对位置")){
					ele.get(i).attr("style", "display:none");
					ele.get(i+1).attr("style", "display:none");
					break;
				}
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		return document.toString();
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
			List<Runnable> shutdownNow = executor.shutdownNow();
			for(Runnable r : shutdownNow){
				if(r instanceof WebServiceRunnable){
					WebServiceRunnable w = (WebServiceRunnable) r;
					w.saveExcutorInfo("executor", "4");
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
	

