package com.dcits.credit.schedul;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContextEvent;

import org.apache.log4j.Logger;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.service.EntObjectRemark.EntObjectManager;
import com.dcits.credit.service.personObjection.PersonObjectionManager;
import com.dcits.credit.service.personObjection.impl.PersonObjectionService;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.FileToBase64;
import com.dcits.credit.util.ObjXmlParseUtil;
import com.dcits.credit.util.ObjXmlParseUtilPerson;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.XmlToHtml;
import com.dcits.credit.util.web.WebServiceServer;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.FileUtil;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;
import com.dcits.platform.util.UuidUtil;

import net.sf.json.JSONObject;

/**
 * 异议处理
 * @author wangwme
 *
 */
public class SchedulObjTask implements Runnable{
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	private PersonObjectionManager service;
	private EntObjectManager entObjectService;
	private ServletContextEvent sce;
	

	public SchedulObjTask(PersonObjectionManager service,EntObjectManager entObjectService){
		this.service = service;
		this.entObjectService = entObjectService;
	}

	public void run() {
		try {			
//			service = (PersonObjectionManager) WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean("PersonObjectionService"); 
//			entObjectService = (EntObjectManager) WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean("entObjectService"); 
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			logger.debug("异议处理-当前执行的时间是"+sdf.format(new Date()));
//			logger.debug("=============个人异议处理start============");
//			PageData perPd = getRequestPerPd();
//			String yesterday = DateUtil.getAfterDayDate("-1").substring(0,10);
//			perPd.put("BEGIN_DATE", yesterday);
//			perPd.put("END_DATE", yesterday);
//			perPd.put("REPORTTYPE", "1");
//			String querymessage = ObjXmlParseUtilPerson.concatMessage(perPd); //请求报文
//			logger.debug("个人异议处理请求报文："+querymessage);
//			toCheckObjection_per(perPd,querymessage);
//			logger.debug("=============个人异议处理end============");
//			logger.debug("=============企业异议处理start============");
//			PageData EntPd = getRequestComPd();
//			EntPd.put("BEGIN_DATE", yesterday);
//			EntPd.put("END_DATE", yesterday);
//			EntPd.put("REPORTTYPE", "1");
//			String EntqueryMessage = ObjXmlParseUtil.dealWithReport(perPd);//请求报文
//			logger.debug("企业异议处理请求报文："+EntqueryMessage);
//			toCheckObjection_Ent(EntPd,EntqueryMessage);
//			logger.debug("=============企业异议处理end============");
//			logger.debug("run "+System.currentTimeMillis());
		} catch (Exception e) {
			logger.error("定时任务线程错误！！！--------------------");
			logger.error(e.getMessage());
		}
	}
	/**
	 * 获取个人拼接请求报文所需要的pd
	 * @return
	 */
	private PageData getRequestPerPd(){
		PageData pd = new PageData();
		try {
			 pd = service.findPerBankInfo();
		} catch (Exception e) {
			logger.error("异议处理定时任务出错",e);
			logger.error(e.getMessage(),e);
		}
		return pd;
	}
	/**
	 * 获取企业拼接请求报文所需要的pd
	 * @return
	 */
	private PageData getRequestComPd(){
		PageData pd = new PageData();
		try {
			pd = service.findComBankInfo();
		} catch (Exception e) {
			logger.error("异议处理定时任务出错",e);
			logger.error(e.getMessage(),e);
		}
		return pd;
	}
	/**
	 * 调人行接口获取企业待核查异议事项
	 * @param entPd
	 * @param entqueryMessage
	 */
	private void toCheckObjection_Ent(PageData pd, String entqueryMessage) {
		PageData orgMap=new PageData();
		try{
			orgMap=entObjectService.findFs(pd.getString("USERNAME"));
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		String id = UuidUtil.get64UUID();
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
		try {
			/*----保存请求信息-------*/
			entObjectService.SaveObjectItem(pd);
			/*----保存请求流程-------*/
			entObjectService.SaveObjFlow(pd);
			//人行返回报文
			String reponseXml = ObjXmlParseUtil.responseXml(entqueryMessage);
			//数据落库
			PageData pdXmlMain =new PageData();
			List<PageData> pdXmlSub = null;
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlComplex(reponseXml,id);
			entObjectService.saveResultToCheckObjection(pdXmlMain);
			pdXmlSub = (List<PageData>) pdXmlMain.get("ToCheckInf");
			String  OBJITEMINF_id=null;
			for(PageData pdXmlSubPd : pdXmlSub){
				PageData pdNum = service.selectObject(pdXmlSubPd);
				if(!"0".equals(String.valueOf(pdNum.get("COUNT")))){
					continue;
				}
				OBJITEMINF_id= UuidUtil.get64UUID();//异议事项信息ID
				for(Object obj : pdXmlSubPd.keySet()){
					String key = (String) obj;
					if(key.startsWith("key_")){
						List<PageData> subOfSub = (List)pdXmlSubPd.get(key);
						for(PageData subLast : subOfSub){
							entObjectService.saveResultSubLastToCheckObjection(subLast);
						}
					}
					//异议事项信息解析并上传至服务器  此处应为ftp地址					
					if(key.equals("ObjItemInf")&&pdXmlSubPd.getString(key)!=null){
						strToFileToFtpEnt(pdXmlSubPd.getString(key), OBJITEMINF_id);
						pdXmlSubPd.put("ObjItemInf", OBJITEMINF_id);
					}
				}
				entObjectService.saveResultSubToCheckObjection(pdXmlSubPd);
				//处理个人待核查异议事项附件信息
				if("Y".equals(String.valueOf(pdXmlSubPd.getString("EnclosureFlag")))){
					pd.put("OBJCHECKID", pdXmlSubPd.getString("ObjCheckID"));
					checkEnclosure_Ent(pd);
				}
			}
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("QUERY_TIME",QUERY_TIME);//查询时间
			pd.put("STATUS", "06");
			//更新流程表
			service.updateFs(pd);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
	/**
	 * 获取企业待核查异议事项附件信息
	 * @param pd
	 */
	private void checkEnclosure_Ent(PageData reqParmete) {
		String requestXml = null;
		String reponseXml = null; 
		try {
			//生成报文
			requestXml = ObjXmlParseUtil.dealWithReportAudInfo(reqParmete);
			//人行返回报文
			reponseXml = ObjXmlParseUtil.responseXmlAudInfo(requestXml);
			String flow_id = reqParmete.getString("ID"); //流程id
			//数据落库
			PageData pdXmlMain = 	
					ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,flow_id);
			String enclosureFlag = pdXmlMain.getString("EnclosureFlag");
			if(enclosureFlag != null && enclosureFlag.equals("Y")){
				String objCheckID = pdXmlMain.getString("ObjCheckID");
				//存在附件
				String enclosureInf = pdXmlMain.getString("EnclosureInf");
				//附件名称
				String enclosureName = objCheckID + ".zip";//解密生成文件的
				String enclosureNamea = objCheckID+"jiami" + ".zip";
				//解析base64生成的文件地址
				String enclosurePath = PathUtil.getClasspath() + Const.OBJ_ENCLOSURE +enclosureName;
				FileToBase64.decoderBase64File(enclosureInf,enclosurePath);//解密到指定地址
				PageData serverInfo = BaseController.getServerInfo();
				String zipPasswd=objCheckID.substring(0,6);
				//本地加密后的文件地址
				String localFilePath = PathUtil.getClasspath() + Const.OBJ_ENCLOSURE +enclosureNamea;
				CompressUtils.zip(enclosurePath, localFilePath, true, zipPasswd); //加密
				serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));//密码解密
				String ftpPath = serverInfo.getString("ftpObjAttPath_download")+flow_id+"/"; //ftp服务器存放报告的路径
				try {
					new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
							Integer.parseInt(serverInfo.getString("port")), 
							serverInfo.getString("LoginName"),
							serverInfo.getString("LoginPass"),
							ftpPath,
							enclosureName,
							localFilePath 
							); //将压缩的zip报告上传ftp服务器
				} catch (Exception e) {
					logger.error("企业待核查异议事项附件信息（文件名："+enclosureName+"）上传ftp服务器失败",e);
				}finally{
					delFile(enclosurePath); //删除最初的zip文件
					delFile(localFilePath); //删除加密的zip压缩文件					
				}
			}
			service.saveResultToCheckObjectionEnclosure(pdXmlMain);
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		} catch (Exception e) {
			logger.error("获取企业待核查异议事项附件信息失败",e);
		}
	}


	/**
	 * 访问人行接口，查询昨天异议事项
	 * @param pd
	 * @param querymessage
	 */
	private void toCheckObjection_per(PageData pd,String querymessage){
		PageData orgMap=new PageData();
		try{
			orgMap=service.findFs(pd.getString("USERNAME"));
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		String id = UuidUtil.get64UUID();
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
			service.saveToObjectionInfoOne(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			service.saveToFs(pd);
			//人行返回报文
			String reponseXml = ObjXmlParseUtilPerson.responseXml(querymessage);
			//数据落库
			PageData pdXmlMain =new PageData();
			List<PageData> pdXmlSub = null;
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlComplex(reponseXml,id);
			service.saveResultToCheckObjection(pdXmlMain);
			pdXmlSub = (List<PageData>) pdXmlMain.get("ToCheckInf");
			String  OBJITEMINF_id=null;
			
			for(PageData pdXmlSubPd : pdXmlSub){
				//检查是否含有重复的异议事项
				PageData pdNum = service.selectObject(pdXmlSubPd);
				if(!"0".equals(String.valueOf(pdNum.get("COUNT")))){
					continue;
				}
			    OBJITEMINF_id= UuidUtil.get64UUID();//异议事项信息ID			    
				for(Object obj : pdXmlSubPd.keySet()){
					String key = (String) obj;
					if(key.startsWith("key_")){
						List<PageData> subOfSub = (List)pdXmlSubPd.get(key);
						for(PageData subLast : subOfSub){
							service.saveResultSubLastToCheckObjection(subLast);
						}
					}
					//异议事项信息解析并上传至服务器  此处应为ftp地址					
					if(key.equals("ObjItemInf")&&pdXmlSubPd.getString(key)!=null){
						strToFileToFtp(pdXmlSubPd.getString(key), OBJITEMINF_id);
						pdXmlSubPd.put("ObjItemInf", OBJITEMINF_id);
					} 
				}	
//				System.out.println("************************************\n"+pdXmlSubPd.getString("ObjItemInf"));
				service.saveResultSubToCheckObjection(pdXmlSubPd);
				//处理个人待核查异议事项附件信息
				if("Y".equals(String.valueOf(pdXmlSubPd.getString("EnclosureFlag")))){
					pd.put("OBJCHECKID", pdXmlSubPd.getString("ObjCheckID"));
					checkEnclosure_per(pd);
				}

			}
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("QUERY_TIME",QUERY_TIME);//查询时间
			pd.put("STATUS", "06");
			//更新流程表
			service.updateFs(pd);
		}catch(Exception e){
			logger.error("ObjectionPerInterface.toCheckObjection()",e);
		}
	}
	//异议事项信息解析成文件并上传至ftp
	@SuppressWarnings("static-access")
	private void strToFileToFtpEnt(String ObjItemInf,String id){
		//读取配置文件信息
		PageData serverInfo=new PageData();
		String htmlPath = null;
		String localFilePath = null;
		try {
			serverInfo = BaseController.getServerInfo();			 	
			//本地生成文件路径
			String ObjItemInf_Path = PathUtil.getClasspath() + Const.FILEPATHFILE;
			String ObjItemInf_FileName = id+".html";
			htmlPath = ObjItemInf_Path+ObjItemInf_FileName;	
			try {
				//将异议事项信息从string解析成html文件
				FileToBase64.decoderBase64File(ObjItemInf, htmlPath);
			} catch (Exception e) {
				logger.error("【将异议事项信息从string解析成html文件出错！】", e);
			}
			String ftpPath = serverInfo.getString("ftpObjAttPath_download")+id+"/"; //ftp服务器存放报告的路径
			String ftpFileName = id + ".zip"; //ftp服务器存放报告的文件名
			localFilePath = ObjItemInf_Path + ftpFileName; //本地压缩后的zip文件的绝对路径
			String zipPasswd=id.substring(0,6);	
			CompressUtils.zip(htmlPath, localFilePath, true, zipPasswd); //将html报告压缩成zip报告
			//密码解密
			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
			new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
						Integer.parseInt(serverInfo.getString("port")), 
						serverInfo.getString("LoginName"), 
						serverInfo.getString("LoginPass"), 
						ftpPath,
						ftpFileName, 
						localFilePath 
						); //将压缩的zip报告上传ftp服务器
		} catch (Exception e) {
			logger.error("【企业异议事项信息解析上传ftp出错！】SchedulObjTask.strToFileToFtp方法出错",e);
		} finally{			
			delFile(htmlPath); //删除xml文件
			delFile(localFilePath); //删除压缩文件
		}
	}
	//异议事项信息解析成文件并上传至ftp
	@SuppressWarnings("static-access")
	private void strToFileToFtp(String ObjItemInf,String id){
		//读取配置文件信息
		PageData serverInfo=new PageData();
		String htmlPath = null;
		String localFilePath = null;
		try {
			serverInfo = BaseController.getServerInfo();			 	
			//本地生成文件路径
			String ObjItemInf_Path = PathUtil.getClasspath() + Const.FILEPATHFILE;
			String ObjItemInf_FileName = id+".html";
			htmlPath = ObjItemInf_Path+ObjItemInf_FileName;	
			try {
				//将异议事项信息从string解析成html文件
				FileToBase64.decoderBase64File(ObjItemInf, htmlPath);
			} catch (Exception e) {
				logger.error("【将异议事项信息从string解析成html文件出错！】", e);
			}
			String ftpPath = serverInfo.getString("ftpObjAttPath_download")+id+"/"; //ftp服务器存放报告的路径
			String ftpFileName = id + ".zip"; //ftp服务器存放报告的文件名
			localFilePath = ObjItemInf_Path + ftpFileName; //本地压缩后的zip文件的绝对路径
			String zipPasswd=id.substring(0,6);	
			CompressUtils.zip(htmlPath, localFilePath, true, zipPasswd); //将html报告压缩成zip报告
			//密码解密
			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
			new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
						Integer.parseInt(serverInfo.getString("port")), 
						serverInfo.getString("LoginName"), 
						serverInfo.getString("LoginPass"), 
						ftpPath,
						ftpFileName, 
						localFilePath 
						); //将压缩的zip报告上传ftp服务器
		} catch (Exception e) {
			logger.error("【异议事项信息解析上传ftp出错！】SchedulObjTask.strToFileToFtp方法出错",e);
		} finally{			
			delFile(htmlPath); //删除解码后的html文件
			delFile(localFilePath); //删除压缩文件
		}
	}
		/**
		 * 删除文件
		 * @param path
		 */
		private void delFile(String path){
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
				logger.error("SchedulObjTask.delFile方法出错",e);
				logger.error(e.getMessage(),e);
			}
		}										
	
	/**
	 * 获取个人待核查异议事项附件信息
	 * @param reqParmete
	 */
	@SuppressWarnings("static-access")
	private void checkEnclosure_per(PageData reqParmete){
		String requestXml = null;
		String reponseXml = null;
		String enclosurePath = null;
		String enclosurePath1 = null;
		String enclosurePath_dir = null;
		String enclosurePath1_dir = null;
		try {
			//生成报文
			requestXml = ObjXmlParseUtilPerson.concatMessageEnclosureAndCorrectAccept(reqParmete);
			//人行返回报文
			reponseXml = ObjXmlParseUtilPerson.responseXmlEnclosure(requestXml);
			String flow_id = reqParmete.getString("ID"); //流程id
			//数据落库
			PageData pdXmlMain = 
					ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,flow_id);
			String enclosureFlag = pdXmlMain.getString("EnclosureFlag");
			if(enclosureFlag != null && enclosureFlag.equals("Y")){
				String objCheckID = pdXmlMain.getString("ObjCheckID");
				//存在附件
				String enclosureInf = pdXmlMain.getString("EnclosureInf");
				String enclosureName = objCheckID + ".zip";
				
				enclosurePath1 = PathUtil.getClasspath() + Const.OBJ_ENCLOSURE + 
						flow_id +"/"+flow_id+"/"+ objCheckID + ".zip"; 
				enclosurePath = PathUtil.getClasspath() + Const.OBJ_ENCLOSURE + 
						flow_id +"/"+ objCheckID + ".zip";                     //将zip再加密压缩成zip
				//文件夹，方便删除---start--
				enclosurePath1_dir = PathUtil.getClasspath() + Const.OBJ_ENCLOSURE + 
						flow_id +"/"+flow_id+"/"; 
				enclosurePath_dir = PathUtil.getClasspath() + Const.OBJ_ENCLOSURE + 
						flow_id +"/";  
				//------end----
				try {
					File file =  new File(PathUtil.getClasspath() + Const.OBJ_ENCLOSURE + 
							flow_id +"/");
				    if(!file.exists()){
				    	file.mkdir();
				    }
					FileToBase64.decoderBase64File(enclosureInf,enclosurePath);
				} catch (Exception e) {
					logger.error(e.getMessage(),e);
				}
				PageData serverInfo = BaseController.getServerInfo();
				//密码解密
				serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
				String ftpPath = serverInfo.getString("ftpObjAttPath_download")+flow_id; //ftp服务器存放报告的路径				
				CompressUtils.zip(enclosurePath, enclosurePath1, true, objCheckID.substring(0, 6)); //将zip再加密压缩成zip
				try {
					new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
							Integer.parseInt(serverInfo.getString("port")), 
							serverInfo.getString("LoginName"), 
							serverInfo.getString("LoginPass"), 
							ftpPath, 
							enclosureName, 
							enclosurePath1 
							); //将压缩的zip报告上传ftp服务器
				} catch (Exception e) {
					logger.error("个人待核查异议事项附件信息（文件名："+enclosureName+"）上传ftp服务器失败",e);
				}
			}
			service.saveResultToCheckObjectionEnclosure(pdXmlMain);
			String QUERY_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		} catch (Exception e) {
			logger.error("获取个人待核查异议事项附件信息失败",e);
		}finally {
			delFile(enclosurePath);
			delFile(enclosurePath1);
			delFile_Dir(enclosurePath1_dir);
			delFile_Dir(enclosurePath_dir);
		}
	}
	/**
	 * 删除文件夹
	 * @param path
	 */
	@SuppressWarnings("unused")
	private  void delFile_Dir(String path){
		try {
			if(!StringUtil.isEmpty(path)){
				File file = new File(path);
				if(file.isDirectory()){
					file.delete();
					}
				}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
	/**
     * 获取星期几
     * @return
     */
    public static int week(){
    	String[] arr = new String[]{"星期一","星期二","星期三","星期四","星期五","星期六","星期日"};
    	String week = DateUtil.getAfterDayWeek("0");
    	for(int i=0;i<arr.length;i++){
    		if(week.equals(arr[i])){
    			return i+1;
    		}
    	}
    	return 7;
    }
}
