package com.dcits.credit.controller.rest;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Component;

import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.rest.EntCreditInterfaceManage;
import com.dcits.credit.service.rest.ObjectionComInterfaceService;
import com.dcits.credit.util.ObjXmlParseUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/** 
 * 企业异议接口
 * 创建人：gaoshenga
 * 创建时间：2019-01-14
 * 
 */ 
@Component
@Path("/ObjectionComInterface")
public class ObjectionComInterface extends BaseController{ 
	@Resource(name="EntCreditInterfaceService")
	private EntCreditInterfaceManage EntCreditService;
	@Resource(name="PersonInquiryService")
	public PersonInquiryManager personInquiryService;
	@Resource(name="ObjectionComInterfaceService")
	private ObjectionComInterfaceService ObjectionComInterfaceService ;
	/**
	 * 1.获取企业待核查异议事项
	 * @param json
	 * @return
	 */
	@POST
	@Path("/queryReportObjPendAud")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryReportObjPendAud(InputStream is){
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String query_no = "";
		String sysNo="1";
		//请求报文
		String requestXml = null;
		//返回报文
		String reponseXml = null;
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			jsonReturn.put("errorcode", "08");
			jsonReturn.put("errormsg", "系统维护中");
			 return jsonReturn;
		}
		try {
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查看企业报告请求报文："+json);
			//提取字段，判断字段
			if(json.get("DATAPROVIDERORGCODE")!=null&&!json.get("DATAPROVIDERORGCODE").equals("")){
				pd.put("DATAPROVIDERORGCODE", json.get("DATAPROVIDERORGCODE"));//征信用户名
			}else{
				logger.info("DATAPROVIDERORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEORGCODE")!=null&&!json.get("ORIGINATEORGCODE").equals("")){
				pd.put("ORIGINATEORGCODE", json.get("ORIGINATEORGCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEUSERCODE")!=null&&!json.get("ORIGINATEUSERCODE").equals("")){
				pd.put("ORIGINATEUSERCODE", json.get("ORIGINATEUSERCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEUSERCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("BEGINDATE")!=null&&!json.get("BEGINDATE").equals("")){
				pd.put("BEGINDATE", json.get("BEGINDATE"));//征信用户名
			}else{
				logger.info("BEGINDATE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ENDDATE")!=null&&!json.get("ENDDATE").equals("")){
				pd.put("ENDDATE", json.get("ENDDATE"));//征信用户名
			}else{
				logger.info("ENDDATE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("REPORT_TYPE")!=null&&!json.get("REPORT_TYPE").equals("")){
				pd.put("REPORT_TYPE", json.get("REPORT_TYPE"));//报告类型
			}else{
				logger.info("REPORT_TYPE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
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
		//查询账户信息
		PageData pdAcc = new PageData();
		try {
			pdAcc = EntCreditService.queryAccByUserName(pd);
			if(pdAcc==null){
				logger.info("用户无人行查询账户");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无人行查询账号");
				return jsonReturn;
			}
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		//查询机构信息
		PageData orgMap=new PageData();
		String ORG_CODE=null;;
		try{
			orgMap=EntCreditService.findOrg(pd);
			if(orgMap!=null){
				ORG_CODE=orgMap.getString("ORG_CODE");
			}else{
				logger.info("用户无查询权限");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无查询权限");
				return jsonReturn;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		String id=UuidUtil.get64UUID();
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "2");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		pd.put("USERCODE", pdAcc.get("USERCODE"));
		pd.put("PASSWORD", pdAcc.get("PASSWORD"));
		try {
			//落库流程表
			ObjectionComInterfaceService.SaveObjInfo(pd);
			//落库异议表
			ObjectionComInterfaceService.SaveObjectItem(pd);
			//生成报文
			requestXml = ObjXmlParseUtil.dealWithReport(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtil.responseXml(requestXml);
			//解析人行返回报文
			PageData pdMain = ObjXmlParseUtil.parseXmlMain(reponseXml,id);
			 //保存主表
			ObjectionComInterfaceService.SaveObjCheckItem(pdMain);
			 //保存子表信息
			List<PageData> pdSub = ObjXmlParseUtil.parseXmlSub(reponseXml,id);
				for(PageData pa : pdSub){
				Object obj = pa.get("HistoricalCheckInf");
				if(obj instanceof PageData){
					ObjectionComInterfaceService.SaveObjCheckItemHis((PageData) obj);
				}else if( obj instanceof List){
					List<PageData> li  = (List) obj;
					for(PageData pg : li){
						ObjectionComInterfaceService.SaveObjCheckItemHis(pg);
					}
				}
				ObjectionComInterfaceService.SaveObjCheckItemCom(pa);
			}
			//更新流程表信息
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
			pd.put("STATUS", "06");
			ObjectionComInterfaceService.updateFlowTable(pd);
			//将保存的数据返回给第三方接口
			pdMain.put("ToCheckInf", pdSub);
			String comObjInfo_json = JSONArray.fromObject(pdMain).toString();
			jsonReturn.put("Msg", comObjInfo_json);	
		} catch (Exception e) {
			logger.error("ObjectionComInterfaceService.Save保存数据库的方法出错！", e);
		}
		return jsonReturn;
	}
	/**
	 * 2.获取企业待核查异议事项附件信息
	 * @param is
	 * @return
	 */
	@POST
	@Path("/queryReportObjPendAudInfo")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryReportObjPendAudInfo(InputStream is){
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String query_no = "";
		//请求报文
		String requestXml = null;
		//返回报文
		String reponseXml = null;
		String sysNo="1";
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			jsonReturn.put("errorcode", "08");
			jsonReturn.put("errormsg", "系统维护中");
			 return jsonReturn;
		}
		try {
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查看企业报告请求报文："+json);
			//提取字段，判断字段
			if(json.get("DATAPROVIDERORGCODE")!=null&&!json.get("DATAPROVIDERORGCODE").equals("")){
				pd.put("DATAPROVIDERORGCODE", json.get("DATAPROVIDERORGCODE"));//征信用户名
			}else{
				logger.info("DATAPROVIDERORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEORGCODE")!=null&&!json.get("ORIGINATEORGCODE").equals("")){
				pd.put("ORIGINATEORGCODE", json.get("ORIGINATEORGCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEUSERCODE")!=null&&!json.get("ORIGINATEUSERCODE").equals("")){
				pd.put("ORIGINATEUSERCODE", json.get("ORIGINATEUSERCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEUSERCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("OBJCHECKID")!=null&&!json.get("OBJCHECKID").equals("")){
				pd.put("OBJCHECKID", json.get("OBJCHECKID"));//征信用户名
			}else{
				logger.info("OBJCHECKID参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("REPORT_TYPE")!=null&&!json.get("REPORT_TYPE").equals("")){
				pd.put("REPORT_TYPE", json.get("REPORT_TYPE"));//报告类型
			}else{
				logger.info("REPORT_TYPE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
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
		//查询账户信息
		PageData pdAcc = new PageData();
		try {
			pdAcc = EntCreditService.queryAccByUserName(pd);
			if(pdAcc==null){
				logger.info("用户无人行查询账户");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无人行查询账号");
				return jsonReturn;
			}
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		//查询机构信息
		PageData orgMap=new PageData();
		String ORG_CODE=null;;
		try{
			orgMap=EntCreditService.findOrg(pd);
			if(orgMap!=null){
				ORG_CODE=orgMap.getString("ORG_CODE");
			}else{
				logger.info("用户无查询权限");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无查询权限");
				return jsonReturn;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		String id=UuidUtil.get64UUID();
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "2");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		pd.put("USERCODE", pdAcc.get("USERCODE"));
		pd.put("PASSWORD", pdAcc.get("PASSWORD"));
		try {
			//落库流程表
			ObjectionComInterfaceService.SaveObjInfo(pd);
			//落库异议表
			ObjectionComInterfaceService.SaveObjectItem(pd);
			//生成报文
			requestXml = ObjXmlParseUtil.dealWithReportAudInfo(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtil.responseXmlAudInfo(requestXml);
			//解析人行报文
			PageData pdMain = ObjXmlParseUtil.parseXmlMaina(reponseXml,id);
			 //保存主表
			ObjectionComInterfaceService.saveCheckInfo(pdMain);
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
			pd.put("STATUS", "06");
			//更新流程表
			ObjectionComInterfaceService.updateFlowTable(pd);
			//给接口返回数据
			String comObjInfo_json = JSONArray.fromObject(pdMain).toString();
			jsonReturn.put("Msg", comObjInfo_json);	
		} catch (Exception e) {
			logger.error("ObjectionComInterfaceService.Save保存数据库的方法出错！", e);
		}
		return jsonReturn;
	}
	/**
	 * 3.反馈企业异议事项核查结果
	 * @param is
	 * @return
	 * @throws Exception 
	 */
	@POST
	@Path("/queryReportObjCheckResult")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryReportObjCheckResult(InputStream is) throws Exception{
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		String query_no = "";
		//请求报文
		String requestXml = null;
		//返回报文
		String reponseXml = null;
		String sysNo="1";
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			jsonReturn.put("errorcode", "08");
			jsonReturn.put("errormsg", "系统维护中");
			 return jsonReturn;
		}
		try {
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查看企业报告请求报文："+json);
			//提取字段，判断字段
			if(json.get("DATAPROVIDERORGCODE")!=null&&!json.get("DATAPROVIDERORGCODE").equals("")){
				pd.put("DATAPROVIDERORGCODE", json.get("DATAPROVIDERORGCODE"));//征信用户名
			}else{
				logger.info("DATAPROVIDERORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEORGCODE")!=null&&!json.get("ORIGINATEORGCODE").equals("")){
				pd.put("ORIGINATEORGCODE", json.get("ORIGINATEORGCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEUSERCODE")!=null&&!json.get("ORIGINATEUSERCODE").equals("")){
				pd.put("ORIGINATEUSERCODE", json.get("ORIGINATEUSERCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEUSERCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("PHONENUM")!=null&&!json.get("PHONENUM").equals("")){
				pd.put("PHONENUM", json.get("PHONENUM"));//征信用户名
			}else{
				logger.info("PHONENUM参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}			
			if(json.get("OBJCHECKID")!=null&&!json.get("OBJCHECKID").equals("")){
				pd.put("OBJCHECKID", json.get("OBJCHECKID"));//征信用户名
			}else{
				logger.info("OBJCHECKID参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("OBJCHECKNUM")!=null&&!json.get("OBJCHECKNUM").equals("")){
				pd.put("OBJCHECKNUM", json.get("OBJCHECKNUM"));//征信用户名
			}else{
				logger.info("OBJCHECKNUM参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}			
			if(json.get("CHECKRESULT")!=null&&!json.get("CHECKRESULT").equals("")){
				pd.put("CHECKRESULT", json.get("CHECKRESULT"));//征信用户名
			}else{
				logger.info("CHECKRESULT参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}			
			if(json.get("CHECKRESULTDESC")!=null&&!json.get("CHECKRESULTDESC").equals("")){
				pd.put("CHECKRESULTDESC", json.get("CHECKRESULTDESC"));//征信用户名
			}else{
				logger.info("CHECKRESULTDESC参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("REPORT_TYPE")!=null&&!json.get("REPORT_TYPE").equals("")){
				pd.put("REPORT_TYPE", json.get("REPORT_TYPE"));//报告类型
			}else{
				logger.info("REPORT_TYPE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
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
		//查询账户信息
		PageData pdAcc = new PageData();
		try {
			pdAcc = EntCreditService.queryAccByUserName(pd);
			if(pdAcc==null){
				logger.info("用户无人行查询账户");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无人行查询账号");
				return jsonReturn;
			}
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		//查询机构信息
		PageData orgMap=new PageData();
		String ORG_CODE=null;;
		try{
			orgMap=EntCreditService.findOrg(pd);
			if(orgMap!=null){
				ORG_CODE=orgMap.getString("ORG_CODE");
			}else{
				logger.info("用户无查询权限");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无查询权限");
				return jsonReturn;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		String id=UuidUtil.get64UUID();
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "2");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		pd.put("USERCODE", pdAcc.get("USERCODE"));
		pd.put("PASSWORD", pdAcc.get("PASSWORD"));
		try {
			//落库流程表
			ObjectionComInterfaceService.SaveObjInfo(pd);
			//落库异议表
			ObjectionComInterfaceService.SaveObjectItem(pd);
			//生成报文
			requestXml = ObjXmlParseUtil.dealWithReportCheckResult(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtil.responseXmlCheckResult(requestXml);
			//数据落库
			PageData pdMain = ObjXmlParseUtil.parseXmlMaina(reponseXml,id);
			 //保存主表
			ObjectionComInterfaceService.saveUniverInfo(pdMain);
			//修改流程表里面的数据 
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
			pd.put("STATUS", "06");
			ObjectionComInterfaceService.updateFlowTable(pd);
			//将保存的数据返回给第三方接口
			String comObjInfo_json = JSONArray.fromObject(pdMain).toString();
			jsonReturn.put("Msg", comObjInfo_json);
		} catch (Exception e) {
			logger.error("ObjectionComInterfaceService.Save保存数据库的方法出错！", e);
		}
		return jsonReturn;
	}
	//4.反馈企业异议事项更正结果
	@POST
	@Path("/queryReportObjCorrResult")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryReportObjCorrResult(InputStream is) throws Exception{
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		String query_no = "";
		String sysNo="1";
		//请求报文
		String requestXml = null;
		//返回报文
		String reponseXml = null;
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			jsonReturn.put("errorcode", "08");
			jsonReturn.put("errormsg", "系统维护中");
			 return jsonReturn;
		}
		try {
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查看企业报告请求报文："+json);
			//提取字段，判断字段
			if(json.get("DATAPROVIDERORGCODE")!=null&&!json.get("DATAPROVIDERORGCODE").equals("")){
				pd.put("DATAPROVIDERORGCODE", json.get("DATAPROVIDERORGCODE"));//征信用户名
			}else{
				logger.info("DATAPROVIDERORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEORGCODE")!=null&&!json.get("ORIGINATEORGCODE").equals("")){
				pd.put("ORIGINATEORGCODE", json.get("ORIGINATEORGCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEUSERCODE")!=null&&!json.get("ORIGINATEUSERCODE").equals("")){
				pd.put("ORIGINATEUSERCODE", json.get("ORIGINATEUSERCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEUSERCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("OBJCORRECTID")!=null&&!json.get("OBJCORRECTID").equals("")){
				pd.put("OBJCORRECTID", json.get("OBJCORRECTID"));//征信用户名
			}else{
				logger.info("OBJCORRECTID参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}			
			if(json.get("CORRECTRESULT")!=null&&!json.get("CORRECTRESULT").equals("")){
				pd.put("CORRECTRESULT", json.get("CORRECTRESULT"));//征信用户名
			}else{
				logger.info("CORRECTRESULT参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ENCLOSUREINF")!=null&&!json.get("ENCLOSUREINF").equals("")){
				pd.put("ENCLOSUREINF", json.get("ENCLOSUREINF"));//征信用户名
			}else{
				logger.info("ENCLOSUREINF参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}			
			if(json.get("CORRECTDESC")!=null&&!json.get("CORRECTDESC").equals("")){
				pd.put("CORRECTDESC", json.get("CORRECTDESC"));//征信用户名
			}else{
				logger.info("CORRECTDESC参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("REPORT_TYPE")!=null&&!json.get("REPORT_TYPE").equals("")){
				pd.put("REPORT_TYPE", json.get("REPORT_TYPE"));//报告类型
			}else{
				logger.info("REPORT_TYPE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
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
		//查询账户信息
		PageData pdAcc = new PageData();
		try {
			pdAcc = EntCreditService.queryAccByUserName(pd);
			if(pdAcc==null){
				logger.info("用户无人行查询账户");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无人行查询账号");
				return jsonReturn;
			}
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		//查询机构信息
		PageData orgMap=new PageData();
		String ORG_CODE=null;;
		try{
			orgMap=EntCreditService.findOrg(pd);
			if(orgMap!=null){
				ORG_CODE=orgMap.getString("ORG_CODE");
			}else{
				logger.info("用户无查询权限");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无查询权限");
				return jsonReturn;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		String id=UuidUtil.get64UUID();
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "2");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		pd.put("USERCODE", pdAcc.get("USERCODE"));
		pd.put("PASSWORD", pdAcc.get("PASSWORD"));
		try {
			//落库流程表
			ObjectionComInterfaceService.SaveObjInfo(pd);
			//落库异议表
			ObjectionComInterfaceService.SaveObjectItem(pd);
			//生成报文
//			requestXml = ObjXmlParseUtil.dealWithReportCorrect(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtil.SaveXmlCorrect(requestXml);
			//数据落库
			PageData pdMain = ObjXmlParseUtil.parseXmlMaina(reponseXml,id);
			 //保存主表
			ObjectionComInterfaceService.saveUniverInfo(pdMain);
			//修改流程表里面的数据 
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
			pd.put("STATUS", "06");
			ObjectionComInterfaceService.updateFlowTable(pd);
			//将保存的数据返回给第三方接口
			String comObjInfo_json = JSONArray.fromObject(pdMain).toString();
			jsonReturn.put("Msg", comObjInfo_json);
		} catch (Exception e) {
			logger.error("ObjectionComInterfaceService.Save保存数据库的方法出错！", e);
		}
		return jsonReturn;
	}
	/**
	 * 5.查询企业异议事项更正结果接受情况
	 * @param is
	 * @return
	 */
	@POST
	@Path("/queryReportObjCorrResultRec")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryReportObjCorrResultRec(InputStream is){
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String query_no = "";
		String sysNo="1";
		//请求报文
		String requestXml = null;
		//返回报文
		String reponseXml = null;
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			jsonReturn.put("errorcode", "08");
			jsonReturn.put("errormsg", "系统维护中");
			 return jsonReturn;
		}
		try {
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查看企业报告请求报文："+json);
			//提取字段，判断字段
			if(json.get("DATAPROVIDERORGCODE")!=null&&!json.get("DATAPROVIDERORGCODE").equals("")){
				pd.put("DATAPROVIDERORGCODE", json.get("DATAPROVIDERORGCODE"));//征信用户名
			}else{
				logger.info("DATAPROVIDERORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEORGCODE")!=null&&!json.get("ORIGINATEORGCODE").equals("")){
				pd.put("ORIGINATEORGCODE", json.get("ORIGINATEORGCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEUSERCODE")!=null&&!json.get("ORIGINATEUSERCODE").equals("")){
				pd.put("ORIGINATEUSERCODE", json.get("ORIGINATEUSERCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEUSERCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("OBJCHECKID")!=null&&!json.get("OBJCHECKID").equals("")){
				pd.put("OBJCHECKID", json.get("OBJCHECKID"));//征信用户名
			}else{
				logger.info("OBJCHECKID参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("REPORT_TYPE")!=null&&!json.get("REPORT_TYPE").equals("")){
				pd.put("REPORT_TYPE", json.get("REPORT_TYPE"));//报告类型
			}else{
				logger.info("REPORT_TYPE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
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
		PageData pdAcc = new PageData();
		try {
			pdAcc = EntCreditService.queryAccByUserName(pd);
			if(pdAcc==null){
				logger.info("用户无人行查询账户");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无人行查询账号");
				return jsonReturn;
			}
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		//查询机构信息
		PageData orgMap=new PageData();
		String ORG_CODE=null;;
		try{
			orgMap=EntCreditService.findOrg(pd);
			if(orgMap!=null){
				ORG_CODE=orgMap.getString("ORG_CODE");
			}else{
				logger.info("用户无查询权限");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无查询权限");
				return jsonReturn;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		String id=UuidUtil.get64UUID();
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "2");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		pd.put("USERCODE", pdAcc.get("USERCODE"));
		pd.put("PASSWORD", pdAcc.get("PASSWORD"));
		try {
			//落库流程表
			ObjectionComInterfaceService.SaveObjInfo(pd);
			//落库异议表
			ObjectionComInterfaceService.SaveObjectItem(pd);
			//生成报文
			requestXml = ObjXmlParseUtil.dealWithReportResultRec(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtil.responseXmlResultRec(requestXml);
			//解析人行返回数据
			PageData pdMain = ObjXmlParseUtil.parseXmlMaina(reponseXml,id);
			//保存主表
			ObjectionComInterfaceService.saveUpdateInfo(pdMain);
			//更新流程表
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
			pd.put("STATUS", "06");
			ObjectionComInterfaceService.updateFlowTable(pd);
			String comObjInfo_json = JSONArray.fromObject(pdMain).toString();
			jsonReturn.put("Msg", comObjInfo_json);
		} catch (Exception e) {
			logger.error("ObjectionComInterfaceService.Save保存数据库的方法出错！", e);
		}
		return jsonReturn;
	}
	/**
	 * 6.查询企业异议事项更正结果接受情况
	 * @param is
	 * @return
	 * @throws Exception 
	 */
	@POST
	@Path("/queryReportObjAddAnnotation")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryReportObjAddAnnotation(InputStream is) throws Exception{
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
		String query_no = "";
		String sysNo="1";
		//请求报文
		String requestXml = null;
		//返回报文
		String reponseXml = null;
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			jsonReturn.put("errorcode", "08");
			jsonReturn.put("errormsg", "系统维护中");
			 return jsonReturn;
		}
		try {
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查看企业报告请求报文："+json);
			//提取字段，判断字段
			if(json.get("DATAPROVIDERORGCODE")!=null&&!json.get("DATAPROVIDERORGCODE").equals("")){
				pd.put("DATAPROVIDERORGCODE", json.get("DATAPROVIDERORGCODE"));//征信用户名
			}else{
				logger.info("DATAPROVIDERORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEORGCODE")!=null&&!json.get("ORIGINATEORGCODE").equals("")){
				pd.put("ORIGINATEORGCODE", json.get("ORIGINATEORGCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEUSERCODE")!=null&&!json.get("ORIGINATEUSERCODE").equals("")){
				pd.put("ORIGINATEUSERCODE", json.get("ORIGINATEUSERCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEUSERCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ENTNAME")!=null&&!json.get("ENTNAME").equals("")){
				pd.put("ENTNAME", json.get("ENTNAME"));//征信用户名
			}else{
				logger.info("ENTNAME参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ENTIDTYPE")!=null&&!json.get("ENTIDTYPE").equals("")){
				pd.put("ENTIDTYPE", json.get("ENTIDTYPE"));//征信用户名
			}else{
				logger.info("ENTIDTYPE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ENTIDNUM")!=null&&!json.get("ENTIDNUM").equals("")){
				pd.put("ENTIDNUM", json.get("ENTIDNUM"));//征信用户名
			}else{
				logger.info("ENTIDNUM参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("BUSINESSCODE")!=null&&!json.get("BUSINESSCODE").equals("")){
				pd.put("BUSINESSCODE", json.get("BUSINESSCODE"));//征信用户名
			}else{
				logger.info("BUSINESSCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("LOCATEINFNM")!=null&&!json.get("LOCATEINFNM").equals("")){
				pd.put("LOCATEINFNM", json.get("LOCATEINFNM"));//征信用户名
			}else{
				logger.info("LOCATEINFNM参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("LOCATEINFTYPE")!=null&&!json.get("LOCATEINFTYPE").equals("")){
				pd.put("LOCATEINFTYPE", json.get("LOCATEINFTYPE"));//征信用户名
			}else{
				logger.info("LOCATEINFTYPE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("DATAOCCURORGCODE")!=null&&!json.get("DATAOCCURORGCODE").equals("")){
				pd.put("DATAOCCURORGCODE", json.get("DATAOCCURORGCODE"));//征信用户名
			}else{
				logger.info("DATAOCCURORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("OBJDESC")!=null&&!json.get("OBJDESC").equals("")){
				pd.put("OBJDESC", json.get("OBJDESC"));//征信用户名
			}else{
				logger.info("OBJDESC参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("REPORT_TYPE")!=null&&!json.get("REPORT_TYPE").equals("")){
				pd.put("REPORT_TYPE", json.get("REPORT_TYPE"));//报告类型
			}else{
				logger.info("REPORT_TYPE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
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
		//查询账户信息
		PageData pdAcc = new PageData();
		try {
			pdAcc = EntCreditService.queryAccByUserName(pd);
			if(pdAcc==null){
				logger.info("用户无人行查询账户");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无人行查询账号");
				return jsonReturn;
			}
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		//查询机构信息
		PageData orgMap=new PageData();
		String ORG_CODE=null;;
		try{
			orgMap=EntCreditService.findOrg(pd);
			if(orgMap!=null){
				ORG_CODE=orgMap.getString("ORG_CODE");
			}else{
				logger.info("用户无查询权限");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无查询权限");
				return jsonReturn;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		String id=UuidUtil.get64UUID();
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "2");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		pd.put("USERCODE", pdAcc.get("USERCODE"));
		pd.put("PASSWORD", pdAcc.get("PASSWORD"));
		try {
			//落库流程表
			ObjectionComInterfaceService.SaveObjInfo(pd);
			//落库异议表
			ObjectionComInterfaceService.SaveObjectItem(pd);
			//生成报文
			requestXml = ObjXmlParseUtil.dealWithReportAddAnnotation(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtil.responseXmlAddAnnotation(requestXml);
			//解析报文
			PageData pdMain = ObjXmlParseUtil.parseXmlMaina(reponseXml,id);
			 //保存主表
			ObjectionComInterfaceService.saveRemarkInfo(pdMain);
			//更新流程表
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
			pd.put("STATUS", "06");
			ObjectionComInterfaceService.updateFlowTable(pd);
			String comObjInfo_json = JSONArray.fromObject(pdMain).toString();
			jsonReturn.put("Msg", comObjInfo_json);
		} catch (Exception e) {
			logger.error("ObjectionComInterfaceService.Save保存数据库的方法出错！", e);
		}
		return jsonReturn;
	}
	/**
	 * 7.删除企业标注
	 * @param is
	 * @return
	 */
	@POST
	@Path("/queryReportObjDeleAnnotation")
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject queryReportObjDeleAnnotation(InputStream is){
		JSONObject jsonReturn = new JSONObject();
		JSONObject json = new JSONObject();
		PageData pd = new PageData();
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String query_no = "";
		String sysNo="1";
		//请求报文
		String requestXml = null;
		//返回报文
		String reponseXml = null;
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			jsonReturn.put("errorcode", "08");
			jsonReturn.put("errormsg", "系统维护中");
			 return jsonReturn;
		}
		try {
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查看企业报告请求报文："+json);
			//提取字段，判断字段
			if(json.get("DATAPROVIDERORGCODE")!=null&&!json.get("DATAPROVIDERORGCODE").equals("")){
				pd.put("DATAPROVIDERORGCODE", json.get("DATAPROVIDERORGCODE"));//征信用户名
			}else{
				logger.info("DATAPROVIDERORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEORGCODE")!=null&&!json.get("ORIGINATEORGCODE").equals("")){
				pd.put("ORIGINATEORGCODE", json.get("ORIGINATEORGCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEORGCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("ORIGINATEUSERCODE")!=null&&!json.get("ORIGINATEUSERCODE").equals("")){
				pd.put("ORIGINATEUSERCODE", json.get("ORIGINATEUSERCODE"));//征信用户名
			}else{
				logger.info("ORIGINATEUSERCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("SERVICERETURNCODE")!=null&&!json.get("SERVICERETURNCODE").equals("")){
				pd.put("SERVICERETURNCODE", json.get("SERVICERETURNCODE"));//征信用户名
			}else{
				logger.info("SERVICERETURNCODE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
				return jsonReturn;
			}
			if(json.get("REPORT_TYPE")!=null&&!json.get("REPORT_TYPE").equals("")){
				pd.put("REPORT_TYPE", json.get("REPORT_TYPE"));//报告类型
			}else{
				logger.info("REPORT_TYPE参数异常");
				jsonReturn.put("errorcode", "03");
				jsonReturn.put("errormsg", "接口参数异常");
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
		//查询账户信息
		PageData pdAcc = new PageData();
		try {
			pdAcc = EntCreditService.queryAccByUserName(pd);
			if(pdAcc==null){
				logger.info("用户无人行查询账户");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无人行查询账号");
				return jsonReturn;
			}
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		//查询机构信息
		PageData orgMap=new PageData();
		String ORG_CODE=null;;
		try{
			orgMap=EntCreditService.findOrg(pd);
			if(orgMap!=null){
				ORG_CODE=orgMap.getString("ORG_CODE");
			}else{
				logger.info("用户无查询权限");
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户无查询权限");
				return jsonReturn;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "系统异常");
			return jsonReturn;
		}
		String id=UuidUtil.get64UUID();
		pd.put("ID", id);
		pd.put("USER_SYS_ID", orgMap.get("USER_ID"));
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
		pd.put("CHECK_SYS_ID", "0");
		pd.put("STATUS", "02");//状态 02已审核
		pd.put("IP", orgMap.get("IP"));
		pd.put("MAC", orgMap.get("MAC"));
		pd.put("CLIENT_TYPE", "2");
		pd.put("ORG_ID", orgMap.get("ORG_ID"));
		pd.put("USERCODE", pdAcc.get("USERCODE"));
		pd.put("PASSWORD", pdAcc.get("PASSWORD"));
		try {
			//落库流程表
			ObjectionComInterfaceService.SaveObjInfo(pd);
			//落库异议表
			ObjectionComInterfaceService.SaveObjectItem(pd);
			//生成报文
			requestXml = ObjXmlParseUtil.dealWithReportDeleAnnotation(pd);
			//人行返回报文
			reponseXml = ObjXmlParseUtil.responseXmlDeleAnnotation(requestXml);
			//数据落库
			PageData pdMain = ObjXmlParseUtil.parseXmlMaina(reponseXml,id);
			 //保存主表
			ObjectionComInterfaceService.saveUniverInfo(pdMain);
			//修改流程表里面的数据 
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
			pd.put("STATUS", "06");
			ObjectionComInterfaceService.updateFlowTable(pd);
			//将保存的数据返回给第三方接口
			String comObjInfo_json = JSONArray.fromObject(pdMain).toString();
			jsonReturn.put("Msg", comObjInfo_json);
		} catch (Exception e) {
			logger.error("ObjectionComInterfaceService.Save保存数据库的方法出错！", e);
		}
		return jsonReturn;
	}
	@GET
	@Path("/testpath")
	@Produces(MediaType.TEXT_PLAIN)
	public String sayHello() {
		return "Hello queryCompany!";
	}

}  
