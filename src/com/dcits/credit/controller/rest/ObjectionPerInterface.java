package com.dcits.credit.controller.rest;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.springframework.stereotype.Component;

import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.personObjection.PersonObjectionManager;
import com.dcits.credit.util.ObjXmlParseUtilPerson;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;

import net.sf.json.JSONObject;

/** 
 * 个人异议信息
 * 创建人：wangguoxing
 * 创建时间：2019-01-14
 */ 
@Component
@Path("/ObjectionPerInterface")
public class ObjectionPerInterface extends BaseController{
	@Resource(name="PersonInquiryService")
	public PersonInquiryManager personInquiryService;
	@Resource(name="PersonObjectionService")
	public PersonObjectionManager personObjectionService;
	//待核查异议事项
	@POST
	@Path("/toCheckObjection")
	public JSONObject toCheckObjection(InputStream is) throws Exception{
		PageData pd =new PageData();
		JSONObject returnjson = new JSONObject();
		JSONObject json = new JSONObject();
		JSONObject xmlJson = new JSONObject();
		String username = null;
		String usernamePerBank = null;
		String passwordPerBank = null;
		String id = null;
		String str = null;
		String requestXml = null;
		String reponseXml = null;
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);

			if(json.get("DataProviderOrgCode")!=null&&!json.get("DataProviderOrgCode").equals("")){
				pd.put("DataProviderOrgCode", json.get("DataProviderOrgCode"));//数据提供机构代码
			}else{
				logger.info("DataProviderOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("UserName")!=null&&!json.get("UserName").equals("")){
				username = (String) json.get("UserName");
				pd.put("UserName", username);//系统征信用户名
				usernamePerBank = personObjectionService.findUsernamePerBank(username);
				pd.put("UserNamePerBank", usernamePerBank);//人行征信用户名
				passwordPerBank = personObjectionService.findPasswordPerBank(usernamePerBank);
				pd.put("Password", passwordPerBank);//人行征信密码
				id = UuidUtil.get64UUID();
				pd.put("ID", id);//查询ID
			}else{
				logger.info("UserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateOrgCode")!=null&&!json.get("OriginateOrgCode").equals("")){
				pd.put("OriginateOrgCode", json.get("OriginateOrgCode"));//发起机构代码
			}else{
				logger.info("OriginateOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateUserCode")!=null&&!json.get("OriginateUserCode").equals("")){
				pd.put("OriginateUserCode", json.get("OriginateUserCode"));//发起用户代码
			}else{
				logger.info("OriginateUserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("BeginDate")!=null&&!json.get("BeginDate").equals("")){
				pd.put("BeginDate", json.get("BeginDate"));//开始日期
			}else{
				logger.info("BeginDate参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("EndDate")!=null&&!json.get("EndDate").equals("")){
				pd.put("EndDate", json.get("EndDate"));//结束日期
			}else{
				logger.info("EndDate参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ReportType")!=null&&!json.get("ReportType").equals("")){
				pd.put("ReportType", json.get("ReportType"));//报告类型
			}else{
				logger.info("ReportType参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
		}catch (Exception e) {
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}
		
		PageData map=null;
		PageData orgMap=new PageData();
		String ORG_CODE="";
		try{
			orgMap=personObjectionService.findFs(username);
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
		
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "1");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		try{
			/*----根据获取的参数数据向个人异议信息表中添加数据-------*/
			personObjectionService.saveToObjectionInfoOne(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			personObjectionService.saveToFs(pd);
			//生成报文
			requestXml = ObjXmlParseUtilPerson.concatMessage(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtilPerson.responseXml(requestXml);
			//数据落库
			PageData pdXmlMain =new PageData();
			List<PageData> pdXmlSub = null;
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlComplex(reponseXml,id);
			personObjectionService.saveResultToCheckObjection(pdXmlMain);
			pdXmlSub = (List<PageData>) pdXmlMain.get("ToCheckInf");
			returnjson = JSONObject.fromObject(pdXmlMain);
			for(PageData pdXmlSubPd : pdXmlSub){
				personObjectionService.saveResultSubToCheckObjection(pdXmlSubPd);
				for(Object obj : pdXmlSubPd.keySet()){
					String key = (String) obj;
					if(key.startsWith("key_")){
						List<PageData> subOfSub = (List)pdXmlSubPd.get(key);
						for(PageData subLast : subOfSub){
							personObjectionService.saveResultSubLastToCheckObjection(subLast);
						}
					}
					
				}
			}
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("QUERY_TIME",QUERY_TIME);//查询时间
			pd.put("STATUS", "06");
			//更新流程表
			personObjectionService.updateFs(pd);
		}catch(Exception e){
			logger.error("ObjectionPerInterface.toCheckObjection()",e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		
		return returnjson;
	}
	//2.待核查异议事项附件
	@POST
	@Path("/toCheckObjectionEnclosure")
	public JSONObject toCheckObjectionEnclosure(InputStream is) throws Exception{
		PageData pd =new PageData();
		JSONObject returnjson = new JSONObject();
		JSONObject json = new JSONObject();
		JSONObject xmlJson = new JSONObject();
		String username = null;
		String usernamePerBank = null;
		String passwordPerBank = null;
		String id = null;
		String str = null;
		String requestXml = null;
		String reponseXml = null;
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);

			if(json.get("DataProviderOrgCode")!=null&&!json.get("DataProviderOrgCode").equals("")){
				pd.put("DataProviderOrgCode", json.get("DataProviderOrgCode"));//征信用户名
			}else{
				logger.info("DataProviderOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("UserName")!=null&&!json.get("UserName").equals("")){
				username = (String) json.get("UserName");
				pd.put("UserName", username);//系统征信用户名
				usernamePerBank = personObjectionService.findUsernamePerBank(username);
				pd.put("UserNamePerBank", usernamePerBank);//人行征信用户名
				passwordPerBank = personObjectionService.findPasswordPerBank(usernamePerBank);
				pd.put("Password", passwordPerBank);//人行征信密码
				id = UuidUtil.get64UUID();
				pd.put("ID", id);//查询ID
			}else{
				logger.info("UserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateOrgCode")!=null&&!json.get("OriginateOrgCode").equals("")){
				pd.put("OriginateOrgCode", json.get("OriginateOrgCode"));//征信用户名
			}else{
				logger.info("OriginateOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateUserCode")!=null&&!json.get("OriginateUserCode").equals("")){
				pd.put("OriginateUserCode", json.get("OriginateUserCode"));//征信用户名
			}else{
				logger.info("OriginateUserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ObjCheckID")!=null&&!json.get("ObjCheckID").equals("")){
				pd.put("ObjCheckID", json.get("ObjCheckID"));//征信用户名
			}else{
				logger.info("ObjCheckID参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ReportType")!=null&&!json.get("ReportType").equals("")){
				pd.put("ReportType", json.get("ReportType"));//报告类型
			}else{
				logger.info("ReportType参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
		}catch (Exception e) {
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}
		
		PageData map=null;
		PageData orgMap=new PageData();
		String ORG_CODE="";
		try{
			orgMap=personObjectionService.findFs(username);
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
		
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "1");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		
		try{
			/*----根据获取的参数数据向个人异议信息表中添加数据-------*/
			personObjectionService.saveToObjectionInfoTwo(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			personObjectionService.saveToFs(pd);
			//生成报文
			requestXml = ObjXmlParseUtilPerson.concatMessageEnclosureAndCorrectAccept(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtilPerson.responseXmlEnclosure(requestXml);
			//数据落库
			PageData pdXmlMain =new PageData();
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,id);
			personObjectionService.saveResultToCheckObjectionEnclosure(pdXmlMain);
			returnjson = JSONObject.fromObject(pdXmlMain);
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("QUERY_TIME",QUERY_TIME);//查询时间
			pd.put("STATUS", "06");
			//更新流程表
			personObjectionService.updateFs(pd);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		
		return returnjson;
	}
	//3.异议事项核查结果
	@POST
	@Path("/toCheckObjectionResult")
	public JSONObject toCheckObjectionResult(InputStream is) throws Exception{
		PageData pd =new PageData();
		JSONObject returnjson = new JSONObject();
		JSONObject json = new JSONObject();
		JSONObject xmlJson = new JSONObject();
		String username = null;
		String usernamePerBank = null;
		String passwordPerBank = null;
		String id = null;
		String str = null;
		String requestXml = null;
		String reponseXml = null;
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);

			if(json.get("DataProviderOrgCode")!=null&&!json.get("DataProviderOrgCode").equals("")){
				pd.put("DataProviderOrgCode", json.get("DataProviderOrgCode"));//数据提供机构代码
			}else{
				logger.info("DataProviderOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("UserName")!=null&&!json.get("UserName").equals("")){
				username = (String) json.get("UserName");
				pd.put("UserName", username);//系统征信用户名
				usernamePerBank = personObjectionService.findUsernamePerBank(username);
				pd.put("UserNamePerBank", usernamePerBank);//人行征信用户名
				passwordPerBank = personObjectionService.findPasswordPerBank(usernamePerBank);
				pd.put("Password", passwordPerBank);//人行征信密码
				id = UuidUtil.get64UUID();
				pd.put("ID", id);//查询ID
			}else{
				logger.info("UserName参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateOrgCode")!=null&&!json.get("OriginateOrgCode").equals("")){
				pd.put("OriginateOrgCode", json.get("OriginateOrgCode"));//发起机构代码
			}else{
				logger.info("OriginateOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateUserCode")!=null&&!json.get("OriginateUserCode").equals("")){
				pd.put("OriginateUserCode", json.get("OriginateUserCode"));//发起用户代码
			}else{
				logger.info("OriginateUserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("PhoneNum")!=null&&!json.get("PhoneNum").equals("")){
				pd.put("PhoneNum", json.get("PhoneNum"));//异议事项号
			}else{
				logger.info("PhoneNum参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ObjCheckID")!=null&&!json.get("ObjCheckID").equals("")){
				pd.put("ObjCheckID", json.get("ObjCheckID"));//异议更正结果
			}else{
				logger.info("ObjCheckID参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ObjCheckNum")!=null&&!json.get("ObjCheckNum").equals("")){
				pd.put("ObjCheckNum", json.get("ObjCheckNum"));//异议更正结果
			}else{
				logger.info("ObjCheckNum参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("CheckResult")!=null&&!json.get("CheckResult").equals("")){
				pd.put("CheckResult", json.get("CheckResult"));//异议更正结果
			}else{
				logger.info("CheckResult参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("CheckResultDesc")!=null&&!json.get("CheckResultDesc").equals("")){
				pd.put("CheckResultDesc", json.get("CheckResultDesc"));//异议更正结果
			}else{
				logger.info("CheckResultDesc参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ReportType")!=null&&!json.get("ReportType").equals("")){
				pd.put("ReportType", json.get("ReportType"));//报告类型
			}else{
				logger.info("ReportType参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
		}catch (Exception e) {
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}
		
		PageData map=null;
		PageData orgMap=new PageData();
		String ORG_CODE="";
		try{
			orgMap=personObjectionService.findFs(username);
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
		
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "1");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		
		try{
			/*----根据获取的参数数据向个人异议信息表中添加数据-------*/
			personObjectionService.saveToObjectionInfoThree(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			personObjectionService.saveToFs(pd);
			//生成报文
			requestXml = ObjXmlParseUtilPerson.concatMessageObjectionResult(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtilPerson.responseXmlResult(requestXml);
			//数据落库
			PageData pdXmlMain =new PageData();
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,id);
			personObjectionService.toCheckObjectionResult(pdXmlMain);
			returnjson = JSONObject.fromObject(pdXmlMain);
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("QUERY_TIME",QUERY_TIME);//查询时间
			pd.put("STATUS", "06");
			//更新流程表
			personObjectionService.updateFs(pd);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		
		return returnjson;
	}
	//4.异议事项更正结果
	@POST
	@Path("/toObjectionCorrect")
	public JSONObject toObjectionCorrect(InputStream is) throws Exception{
		PageData pd =new PageData();
		JSONObject returnjson = new JSONObject();
		JSONObject json = new JSONObject();
		JSONObject xmlJson = new JSONObject();
		String username = null;
		String usernamePerBank = null;
		String passwordPerBank = null;
		String id = null;
		String str = null;
		String requestXml = null;
		String reponseXml = null;
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);

			if(json.get("DataProviderOrgCode")!=null&&!json.get("DataProviderOrgCode").equals("")){
				pd.put("DataProviderOrgCode", json.get("DataProviderOrgCode"));//数据提供机构代码
			}else{
				logger.info("DataProviderOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("UserName")!=null&&!json.get("UserName").equals("")){
				username = (String) json.get("UserName");
				pd.put("UserName", username);//系统征信用户名
				usernamePerBank = personObjectionService.findUsernamePerBank(username);
				pd.put("UserNamePerBank", usernamePerBank);//人行征信用户名
				passwordPerBank = personObjectionService.findPasswordPerBank(usernamePerBank);
				pd.put("Password", passwordPerBank);//人行征信密码
				id = UuidUtil.get64UUID();
				pd.put("ID", id);//查询ID
			}else{
				logger.info("UserName参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateOrgCode")!=null&&!json.get("OriginateOrgCode").equals("")){
				pd.put("OriginateOrgCode", json.get("OriginateOrgCode"));//发起机构代码
			}else{
				logger.info("OriginateOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateUserCode")!=null&&!json.get("OriginateUserCode").equals("")){
				pd.put("OriginateUserCode", json.get("OriginateUserCode"));//发起用户代码
			}else{
				logger.info("OriginateUserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ObjCorrectID")!=null&&!json.get("ObjCorrectID").equals("")){
				pd.put("ObjCorrectID", json.get("ObjCorrectID"));//异议更正号
			}else{
				logger.info("ObjCorrectID参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("CorrectResult")!=null&&!json.get("CorrectResult").equals("")){
				pd.put("CorrectResult", json.get("CorrectResult"));//异议更正结果
			}else{
				logger.info("CorrectResult参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("EnclosureInf")!=null&&!json.get("EnclosureInf").equals("")){
				pd.put("EnclosureInf", json.get("EnclosureInf"));//异议更正结果
			}else{
				logger.info("EnclosureInf参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("CorrectDesc")!=null&&!json.get("CorrectDesc").equals("")){
				pd.put("CorrectDesc", json.get("CorrectDesc"));//异议更正结果
			}else{
				logger.info("CorrectDesc参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ReportType")!=null&&!json.get("ReportType").equals("")){
				pd.put("ReportType", json.get("ReportType"));//报告类型
			}else{
				logger.info("ReportType参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
		}catch (Exception e) {
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}
		
		PageData map=null;
		PageData orgMap=new PageData();
		String ORG_CODE="";
		try{
			orgMap=personObjectionService.findFs(username);
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
		
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "1");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		
		try{
			/*----根据获取的参数数据向个人异议信息表中添加数据-------*/
			personObjectionService.saveToObjectionInfoFour(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			personObjectionService.saveToFs(pd);
			//生成报文
			requestXml = ObjXmlParseUtilPerson.concatObjectionCorrect(null,pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtilPerson.responseXmlCorrect(requestXml);
			//数据落库
			PageData pdXmlMain =new PageData();
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,id);
			personObjectionService.toCheckObjectionResult(pdXmlMain);
			returnjson = JSONObject.fromObject(pdXmlMain);
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("QUERY_TIME",QUERY_TIME);//查询时间
			pd.put("STATUS", "06");
			//更新流程表
			personObjectionService.updateFs(pd);
		}catch(Exception e){
			logger.error("ObjectionPerInterface.toCheckObjection()",e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		
		return returnjson;
	}
	
	
	//5.异议事项更正结果接受情况
	@POST
	@Path("/toObjectionCorrectAccept")
	public JSONObject toObjectionCorrectAccept(InputStream is) throws Exception{
		PageData pd =new PageData();
		JSONObject returnjson = new JSONObject();
		JSONObject json = new JSONObject();
		JSONObject xmlJson = new JSONObject();
		String username = null;
		String usernamePerBank = null;
		String passwordPerBank = null;
		String id = null;
		String str = null;
		String requestXml = null;
		String reponseXml = null;
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);

			if(json.get("DataProviderOrgCode")!=null&&!json.get("DataProviderOrgCode").equals("")){
				pd.put("DataProviderOrgCode", json.get("DataProviderOrgCode"));//征信用户名
			}else{
				logger.info("DataProviderOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("UserName")!=null&&!json.get("UserName").equals("")){
				username = (String) json.get("UserName");
				pd.put("UserName", username);//系统征信用户名
				usernamePerBank = personObjectionService.findUsernamePerBank(username);
				pd.put("UserNamePerBank", usernamePerBank);//人行征信用户名
				passwordPerBank = personObjectionService.findPasswordPerBank(usernamePerBank);
				pd.put("Password", passwordPerBank);//人行征信密码
				id = UuidUtil.get64UUID();
				pd.put("ID", id);//查询ID
			}else{
				logger.info("UserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateOrgCode")!=null&&!json.get("OriginateOrgCode").equals("")){
				pd.put("OriginateOrgCode", json.get("OriginateOrgCode"));//征信用户名
			}else{
				logger.info("OriginateOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateUserCode")!=null&&!json.get("OriginateUserCode").equals("")){
				pd.put("OriginateUserCode", json.get("OriginateUserCode"));//征信用户名
			}else{
				logger.info("OriginateUserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ObjCheckID")!=null&&!json.get("ObjCheckID").equals("")){
				pd.put("ObjCheckID", json.get("ObjCheckID"));//征信用户名
			}else{
				logger.info("ObjCheckID参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ReportType")!=null&&!json.get("ReportType").equals("")){
				pd.put("ReportType", json.get("ReportType"));//报告类型
			}else{
				logger.info("ReportType参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
		}catch (Exception e) {
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}
		
		PageData map=null;
		PageData orgMap=new PageData();
		String ORG_CODE="";
		try{
			orgMap=personObjectionService.findFs(username);
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
		
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "1");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		
		try{
			/*----根据获取的参数数据向个人异议信息表中添加数据-------*/
			personObjectionService.saveToObjectionInfoTwo(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			personObjectionService.saveToFs(pd);
			//生成报文
			requestXml = ObjXmlParseUtilPerson.concatMessageEnclosureAndCorrectAccept(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtilPerson.responseXmlCorrectAccept(requestXml);
			//数据落库
			PageData pdXmlMain =new PageData();
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,id);
			personObjectionService.saveResultToObjectionCorrectAccept(pdXmlMain);
			returnjson = JSONObject.fromObject(pdXmlMain);
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("QUERY_TIME",QUERY_TIME);//查询时间
			pd.put("STATUS", "06");
			//更新流程表
			personObjectionService.updateFs(pd);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		
		return returnjson;
	}
	//6.添加个人标注
	@POST
	@Path("/addPersonLabel")
	public JSONObject addPersonLabel(InputStream is) throws Exception{
		PageData pd =new PageData();
		JSONObject returnjson = new JSONObject();
		JSONObject json = new JSONObject();
		JSONObject xmlJson = new JSONObject();
		String username = null;
		String usernamePerBank = null;
		String passwordPerBank = null;
		String id = null;
		String str = null;
		String requestXml = null;
		String reponseXml = null;
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);

			if(json.get("DataProviderOrgCode")!=null&&!json.get("DataProviderOrgCode").equals("")){
				pd.put("DataProviderOrgCode", json.get("DataProviderOrgCode"));//征信用户名
			}else{
				logger.info("DataProviderOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("UserName")!=null&&!json.get("UserName").equals("")){
				username = (String) json.get("UserName");
				pd.put("UserName", username);//系统征信用户名
				usernamePerBank = personObjectionService.findUsernamePerBank(username);
				pd.put("UserNamePerBank", usernamePerBank);//人行征信用户名
				passwordPerBank = personObjectionService.findPasswordPerBank(usernamePerBank);
				pd.put("Password", passwordPerBank);//人行征信密码
				id = UuidUtil.get64UUID();
				pd.put("ID", id);//查询ID
			}else{
				logger.info("UserName参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateOrgCode")!=null&&!json.get("OriginateOrgCode").equals("")){
				pd.put("OriginateOrgCode", json.get("OriginateOrgCode"));//征信用户名
			}else{
				logger.info("OriginateOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateUserCode")!=null&&!json.get("OriginateUserCode").equals("")){
				pd.put("OriginateUserCode", json.get("OriginateUserCode"));//征信用户名
			}else{
				logger.info("OriginateUserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("Name")!=null&&!json.get("Name").equals("")){
				pd.put("Name", json.get("Name"));//征信用户名
			}else{
				logger.info("Name参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("IDType")!=null&&!json.get("IDType").equals("")){
				pd.put("IDType", json.get("IDType"));//征信用户名
			}else{
				logger.info("IDType参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("IDNum")!=null&&!json.get("IDNum").equals("")){
				pd.put("IDNum", json.get("IDNum"));//征信用户名
			}else{
				logger.info("IDNum参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("BusinessCode")!=null&&!json.get("BusinessCode").equals("")){
				pd.put("BusinessCode", json.get("BusinessCode"));//征信用户名
			}else{
				logger.info("BusinessCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("LocateInfNm")!=null&&!json.get("LocateInfNm").equals("")){
				pd.put("LocateInfNm", json.get("LocateInfNm"));//征信用户名
			}else{
				logger.info("LocateInfNm参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("LocateInfType")!=null&&!json.get("LocateInfType").equals("")){
				pd.put("LocateInfType", json.get("LocateInfType"));//定位信息类别
			}else{
				logger.info("LocateInfType参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("DataOccurOrgCode")!=null&&!json.get("DataOccurOrgCode").equals("")){
				pd.put("DataOccurOrgCode", json.get("DataOccurOrgCode"));//征信用户名
			}else{
				logger.info("DataOccurOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ObjDesc")!=null&&!json.get("ObjDesc").equals("")){
				pd.put("ObjDesc", json.get("ObjDesc"));//征信用户名
			}else{
				logger.info("ObjDesc参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ReportType")!=null&&!json.get("ReportType").equals("")){
				pd.put("ReportType", json.get("ReportType"));//报告类型
			}else{
				logger.info("ReportType参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
		}catch (Exception e) {
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}
		
		PageData map=null;
		PageData orgMap=new PageData();
		String ORG_CODE="";
		try{
			orgMap=personObjectionService.findFs(username);
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
		
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "1");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		
		try{
			/*----根据获取的参数数据向个人异议信息表中添加数据-------*/
			personObjectionService.saveToObjectionInfoSix(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			personObjectionService.saveToFs(pd);
			//生成报文
			requestXml = ObjXmlParseUtilPerson.concatObjectionAddLabel(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtilPerson.responseXmlAddLabel(requestXml);
			//数据落库
			PageData pdXmlMain =new PageData();
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,id);
			personObjectionService.saveResultToAddLabel(pdXmlMain);
			returnjson = JSONObject.fromObject(pdXmlMain);
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("QUERY_TIME",QUERY_TIME);//查询时间
			pd.put("STATUS", "06");
			//更新流程表
			personObjectionService.updateFs(pd);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		
		return returnjson;
	}
	//7.删除个人标注
	@POST
	@Path("/deletePersonLabel")
	public JSONObject deletePersonLabel(InputStream is) throws Exception{
		PageData pd =new PageData();
		JSONObject returnjson = new JSONObject();
		JSONObject json = new JSONObject();
		JSONObject xmlJson = new JSONObject();
		String username = null;
		String usernamePerBank = null;
		String passwordPerBank = null;
		String id = null;
		String str = null;
		String requestXml = null;
		String reponseXml = null;
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);

			if(json.get("DataProviderOrgCode")!=null&&!json.get("DataProviderOrgCode").equals("")){
				pd.put("DataProviderOrgCode", json.get("DataProviderOrgCode"));//征信用户名
			}else{
				logger.info("DataProviderOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("UserName")!=null&&!json.get("UserName").equals("")){
				username = (String) json.get("UserName");
				pd.put("UserName", username);//系统征信用户名
				usernamePerBank = personObjectionService.findUsernamePerBank(username);
				pd.put("UserNamePerBank", usernamePerBank);//人行征信用户名
				passwordPerBank = personObjectionService.findPasswordPerBank(usernamePerBank);
				pd.put("Password", passwordPerBank);//人行征信密码
				id = UuidUtil.get64UUID();
				pd.put("ID", id);//查询ID
			}else{
				logger.info("UserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateOrgCode")!=null&&!json.get("OriginateOrgCode").equals("")){
				pd.put("OriginateOrgCode", json.get("OriginateOrgCode"));//征信用户名
			}else{
				logger.info("OriginateOrgCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("OriginateUserCode")!=null&&!json.get("OriginateUserCode").equals("")){
				pd.put("OriginateUserCode", json.get("OriginateUserCode"));//征信用户名
			}else{
				logger.info("OriginateUserCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ServiceReturnCode")!=null&&!json.get("ServiceReturnCode").equals("")){
				pd.put("ServiceReturnCode", json.get("ServiceReturnCode"));//征信用户名
			}else{
				logger.info("ServiceReturnCode参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			if(json.get("ReportType")!=null&&!json.get("ReportType").equals("")){
				pd.put("ReportType", json.get("ReportType"));//报告类型
			}else{
				logger.info("ReportType参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
		}catch (Exception e) {
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}
		
		PageData map=null;
		PageData orgMap=new PageData();
		String ORG_CODE="";
		try{
			orgMap=personObjectionService.findFs(username);
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
		
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "1");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		
		try{
			/*----根据获取的参数数据向个人异议信息表中添加数据-------*/
			personObjectionService.saveToObjectionInfoSeven(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			personObjectionService.saveToFs(pd);
			//生成报文
			requestXml = ObjXmlParseUtilPerson.concatObjectionDeleteLabel(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtilPerson.responseXmlDeleteLabel(requestXml);
			//数据落库
			PageData pdXmlMain =new PageData();
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,id);
			personObjectionService.toCheckObjectionResult(pdXmlMain);
			returnjson = JSONObject.fromObject(pdXmlMain);
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("QUERY_TIME",QUERY_TIME);//查询时间
			pd.put("STATUS", "06");
			//更新流程表
			personObjectionService.updateFs(pd);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}
		return returnjson;
	}
}