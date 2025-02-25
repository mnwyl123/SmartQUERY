package com.dcits.credit.util.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityExistsException;

import org.apache.log4j.Logger;

import com.dcits.credit.controller.rest.util.RequestReportUtil;
import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.XmlMapEntity;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.EnterAppReview.impl.EntAppReService;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.IndAppReview.impl.IndAppReService;
import com.dcits.credit.service.creditReportInquiry.ImportInfoManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.ObjectUtil;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.XmlParseUtil;
import com.dcits.credit.util.XmlToHtml;
import com.dcits.credit.util.collectFileTransfer.CollectFileTransfer;
import com.dcits.credit.wsimport.IServiceUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.FileUtil;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;
import com.dcits.platform.util.UuidUtil;
import com.dcits.platform.util.ZipStrUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 
 * webservice接口实现类
 *
 */
public class WebServiceServer{
	
	private static Logger logger = Logger.getLogger(WebServiceServer.class);
//	private static Map<String,String> colOfTab = null;
    private static String encoding = "UTF-8";
//    private static Map<String, List<String>> colList_map = null;

	/**
	 * 数据落库
	 * @param queryData
	 * @param authType
	 * @param indAppReService
	 * @param entAppReService
	 */
    @SuppressWarnings("static-access")
	public static void queryReportAndSave(PageData queryData,String authType,IndAppReManager indAppReService,EntAppReManager entAppReService,IDataSubmissionService iDataSubmissionService){
		long sdate = System.currentTimeMillis();
    	String report_id = null;
		String xml = null;
		String id = queryData.getString("ID");
		String path = PathUtil.getClasspath() + Const.FILEPATHIMG ;
		try {
			File f = new File(path + id);
			f.mkdir(); //创建目录
		} catch (Exception e) {
			logger.error("创建目录失败!",e);
		}
		//step1：查询报告
		try {			
			PageData data = null;
			//拼接请求报文
			if("1".equals(authType)){ 
				data = indAppReService.getQueryInfo(queryData);
//				data.put("SERVICE_CODE", "FW_GRXYBG_0115");
				queryData.put("REQ_REPORT", RequestReportUtil.getPerRequest(data));
			}else{
				data = entAppReService.EntReportDetail(queryData);
//				data.put("SERVICE_CODE", "FW_QYXYBG_0087");
				queryData.put("REQ_REPORT", RequestReportUtil.getEntRequest(data));
			}
			queryData.put("QUERY_NAME", data.getString("NAME"));
			//查询征信报告并报送
			xml = queryReport(queryData,authType,indAppReService,iDataSubmissionService);
		} catch (Exception e) {
			//查询失败
			queryData.put("STATUS", "04");
			indAppReService.updateStatus(queryData); //更新查询状态
			logger.error("【去人行webservice接口查询报告异常】", e);
		}
		if(xml == null){
			return;
		}
		logger.debug("============================================"+ xml);
		
		//step2：数据入库，生产html报告		
		String xmlPath = path + id + "/"+ id + ".xml";; //xml报告路径
		String htmlPath = path + id + "/"+ id + ".html"; //html报告路径
		String ftpFileName = id + ".zip"; //ftp服务器存放报告的文件名
		String localFilePath = path + ftpFileName; //压缩文件路径
		String tmpPath = null; //临时文件
		boolean  isExist = false;//是否查无此人
		if(!"AAA001".equals(xml)){
			isExist=true;
			//数据入库
 			try {
 				if(queryData.get("responseType")==null||queryData.get("responseType").equals("1")){
 				}else if(queryData.get("responseType").equals("2")||queryData.get("responseType").equals("3")){
 					XmlMapEntity.xmlMap.put(queryData.getString("ID"), xml);
 					logger.info("添加xml:"+queryData.getString("ID"));
 				}
				List<PageData> reportTabAndCol = indAppReService.findReportTabAndCol();
				XmlParseUtil.allCol = ObjectUtil.listToMap(reportTabAndCol, "XML_TAG", "COLUMN_NAME");
				XmlParseUtil.allTab = ObjectUtil.listToMap(reportTabAndCol, "XML_TAG", "TABLE_NAME");
				PageData pd = XmlParseUtil.xmlToPd(xml,authType);
				//数据单独入库方法 返回report_id后面要用到
				report_id = data_save(pd,authType,indAppReService);
				//更新信息表中状态：06-报告生成
				CompressUtils.updateStatus("06", entAppReService, indAppReService, id, report_id, ("1".equals(authType)?true:false));
			} catch (Exception e) {
				XmlMapEntity.xmlMap.remove(queryData.getString("ID"));
				logger.info("异常情况移除xml:"+queryData.getString("ID"));
				logger.error("数据落库出错，",e);
			}
 			
			//生成信用报告
			try {
				//初始化生成报告需要的参数

				List<String> dicList = indAppReService.queryXmlDic();
				XmlToHtml.allDicName = ObjectUtil.dicMap(dicList);
				XmlToHtml.encoding = encoding;
				//生成xml报告
				FileUtil.writeFile(xmlPath,xml,encoding); 
				//转换成html报告
				tmpPath = XmlToHtml.convertXmlToHtml(xmlPath,authType); 
				XmlToHtml.dictHtml(htmlPath, tmpPath,id,queryData.getString("USER_SYS_NAME")+queryData.getString("QUERY_NAME")); 
			} catch (Exception e) {
				XmlMapEntity.xmlMap.remove(queryData.getString("ID"));
				logger.info("异常情况移除xml:"+queryData.getString("ID"));
				logger.error("【由人行接口返回的报文生成html报文出错！】",e);
			}
 			XmlToHtml.encoding = encoding;
			//生成xml报告
 			FileUtil.writeFile(xmlPath,xml,encoding);
			delFile(tmpPath); //删除替换数据字典前的html页面
			//报告存放本地，将本地报告加密加压保存
			String zipPasswd=id.substring(0,6);
			CompressUtils.zip(path  + id +"/",localFilePath, true, zipPasswd);
			delFile(path  + id); //删除存放人行返回xml和html的页面。
		}
		if(!isExist){//查无此人
			CompressUtils.updateStatus("05", entAppReService, indAppReService, id, report_id, ("1".equals(authType)?true:false));
			return ;
		}
		
		//step3：报告上传ftp服务器
//		try {
//			//压缩上传文件
//			String zipPasswd=id.substring(0,6);
//			CompressUtils.zip(path  + id +"/",localFilePath, true, zipPasswd); 
//			PageData serverInfo = BaseController.getServerInfo();
//			//密码解密
//			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
//			new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
//					Integer.parseInt(serverInfo.getString("port")), 
//					serverInfo.getString("LoginName"), 
//					serverInfo.getString("LoginPass"), 
//					serverInfo.getString("ftpPath")+id+"/", 
//					ftpFileName, 
//					localFilePath 
//					); //将压缩的zip报告上传ftp服务器
//			delFile(xmlPath); //删除xml文件
//			delFile(localFilePath); //删除压缩文件
//			delFile(tmpPath); //删除替换数据字典前的html页面
//			delFile(htmlPath); //删除替换数据字典后的html页面
//		} catch (Exception e) {
//			logger.error("文件上传ftp服务器出错",e);
//		}
		//xml文件上传至ftp
//		try {
//			//压缩上传文件
//			String zipPasswd=id.substring(0,6);
//			CompressUtils.zip(path  + id +"/",localFilePath, true, zipPasswd); 
//			PageData serverInfo = BaseController.getServerInfo();
//			//密码解密
//			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
//			new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
//					Integer.parseInt(serverInfo.getString("port")), 
//					serverInfo.getString("LoginName"), 
//					serverInfo.getString("LoginPass"), 
//					serverInfo.getString("ftpPath")+id+"/", 
//					ftpFileName, 
//					localFilePath 
//					); //将压缩的zip报告上传ftp服务器
//			//将相关信息插入到XmlToHtml表中
//			PageData xmlToHtml = new PageData();
//			xmlToHtml.put("ID", id);
//			xmlToHtml.put("QUERY_NAME", queryData.getString("USERNAME"));
//			xmlToHtml.put("TYPE", queryData.getString("CLIENT_TYPE"));
//			xmlToHtml.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
//			try{
//				indAppReService.XmlToHtmlSave(xmlToHtml);
//			}catch(Exception e){
//				e.printStackTrace();
//			}	
//			delFile(xmlPath); //删除xml文件
//			delFile(localFilePath); //删除压缩文件
//			delFile(tmpPath); //删除替换数据字典前的html页面
//			delFile(htmlPath); //删除替换数据字典后的html页面
//			delFile(path + id );
//		} catch (Exception e) {
//			logger.error("文件上传ftp服务器出错",e);
//		}

		logger.debug("此次查询报告用时"+((System.currentTimeMillis()-sdate)/1000)+"秒");
	}
    
    /**
     * 数据入库单独方法
     * 
     */
	public static String data_save(PageData pd,String authType,IndAppReManager indAppReService) {
		String report_id = null;
		//落库
		try {
			List<String> tabNameList = new ArrayList<String>();
			for(Object obj : pd.keySet()){
				tabNameList.add((String) obj);
			}
			List<PageData> tabColList = indAppReService.queryColOfTab(tabNameList);
			Map<String,String> colOfTab  = ObjectUtil.listToMap(tabColList, "TAB", "COL");
			Map<String, List<String>> colList_map = initList(indAppReService);
			StringBuffer sql = new StringBuffer();
			for(Object obj : pd.keySet()){
				sql.setLength(0); //将sql清空
				String tab_name = (String) obj;
				Object tab_val = pd.get(tab_name);
				if(tab_val instanceof PageData){
					PageData data = (PageData) tab_val;
					if(report_id==null) report_id = data.getString("REPORT_ID");
					sql.append(dataToSQL(colList_map, colOfTab,data,tab_name));
				}else if(tab_val instanceof List){
					List<PageData> data = (List) tab_val;
					try {
						sql.append(dataToSQL(colList_map,colOfTab, data,tab_name));
					} catch (Exception e) {
						// TODO: handle exception
						logger.info(e);	
						logger.error(e);	
					}
					
				}else{
					logger.error("解析人行返回的xml文件得到的数据，表名为【"+tab_name+"】的数据类型不是PageData或者List的形式，请检查！！");
					logger.info("解析人行返回的xml文件得到的数据，表名为【"+tab_name+"】的数据类型不是PageData或者List的形式，请检查！！");
					//System.out.println("解析人行返回的xml文件得到的数据，表名为【"+tab_name+"】的数据类型不是PageData或者List的形式，请检查！！");
				}
				String[] sqls= sql.toString().split("union all");
				if(sqls.length>=100){
					String sqlstart = sqls[0].split("\\)")[0]+")";
					String sqlone = sqls[0].split("\\)")[1];
					StringBuffer sqlnew = new StringBuffer();
					int i=1;
					for(int j=0;j<=sqls.length/100;j++){
						sqlnew.setLength(0);
						for(;i<sqls.length;i++){
							if(i==1){
								sqlnew.append(sqlstart);
								sqlnew.append(sqlone);
								continue;
							}else if((i%100)==1){
								sqlnew.append(sqlstart);
								sqlnew.append(sqls[i]);
								continue;
							}
							sqlnew.append(" union all ");
							sqlnew.append(sqls[i]);
							if((i%100)==0){
								i++;
								break;
							}
						}
						if(sqlnew.length()!=0){
							indAppReService.publicSave(sqlnew.toString());
						}
//						System.out.println(sqlnew.toString());
					}
					
				}else {
					indAppReService.publicSave(sql.toString());
				}
//				indAppReService.publicSave(sql.toString());
			}
		} catch (Exception e) {
			logger.info("数据落库出错，",e);
			logger.error("数据落库出错，",e);
		}
		//将数据库中存入的本次报告中的数据字典列由中文转为CODE存到列2中（一二代通用）
		oneDictToTwo(indAppReService,report_id,authType);	
		return report_id;
	}
    
	//将数据库中存入的本次报告中的数据字典列由中文转为CODE存到列2中（一二代通用）
	public static void oneDictToTwo(IndAppReManager indAppReService,String report_id,String authType){
		PageData pd = new PageData();
		if(authType.equals("1")){
			pd.put("type", "PER");
		}else{
			pd.put("type", "COM");
		}		
		try {
			List<PageData> tabColList = new ArrayList<PageData>();
			tabColList = indAppReService.findAllTabName2(pd);
			String updateSql = null;
			PageData sqlPd = new PageData();
			for(PageData tabCol:tabColList){
				updateSql="update "+tabCol.getString("TABLE_NAME")+" set "
			               +tabCol.getString("COLUMN_NAME")+"2"
				           +"='"+tabCol.getString("COLUMN_NAME")+"'"
				           +" where report_id = '"+report_id+"'";														
				sqlPd.put("updateSql", updateSql);
				indAppReService.updateInfo(sqlPd);					
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}	
		
	
    
    /**
	 * 数据落库_批量
	 * @param queryData
	 * @param authType
	 * @param indAppReService
	 * @param entAppReService
	 */
    @SuppressWarnings("static-access")
    public static void queryReportAndSave_batch(File file,JSONArray jsonArray,String authType,IndAppReManager indAppReService,EntAppReManager entAppReService){
//		String report_id = null;
//		try {
//			List<PageData> reportTabAndCol = indAppReService.findReportTabAndCol();
//			List<String> dicList = indAppReService.queryXmlDic();
//			XmlParseUtil.allCol = ObjectUtil.listToMap(reportTabAndCol, "XML_TAG", "COLUMN_NAME");
//			XmlParseUtil.allTab = ObjectUtil.listToMap(reportTabAndCol, "XML_TAG", "TABLE_NAME");
//			XmlToHtml.allDicName = ObjectUtil.dicMap(dicList);
//			XmlToHtml.encoding = encoding;
//			String xml = null;
//			try {
//				//去人行查询征信报告
//				xml = queryReport_batch(file, authType);
//			} catch (Exception e) {
//				logger.error("【去人行webservice接口查询报告异常】", e);
//			}
//			for(int i=0;i<jsonArray.size();i++){
//			JSONObject json=(JSONObject) jsonArray.get(i);
//			String id = json.getString("ID");
//			if(xml != null){
//				//生成html报文并存放到ftp服务器上
//				String xmlPath = null; //xml文件路径
//				String localFilePath = null; //压缩文件路径
//				String tmpPath = null; //替换数据字典前的html页面路径
//				String htmlPath = null; //替换数据字典后的html页面路径
//				String path = null;
//				PageData serverInfo = BaseController.getServerInfo();
//				try {
//					String zipPasswd=id.substring(0,6);
//					//生成html页面
//					path = PathUtil.getClasspath() + Const.FILEPATHIMG;
//					xmlPath = path + id + ".xml";
//					htmlPath = path + id + ".html"; //报告的本地位置
//					String ftpPath = serverInfo.getString("ftpPath")+id; //ftp服务器存放报告的路径
//					String ftpFileName = id + ".zip"; //ftp服务器存放报告的文件名
//					localFilePath = path + ftpFileName; //本地压缩后的zip文件的绝对路径
//					FileUtil.writeFile(xmlPath,xml,encoding); //生成xml报告
//					tmpPath = XmlToHtml.convertXmlToHtml(xmlPath,authType); //将xml报告转成html报告
//					String findName = indAppReService.findNameByFlowId(id); //查询报告的用户的真实名称
//					XmlToHtml.dictHtml(htmlPath, tmpPath,id,findName); //html报告替换数据字典信息
//					CompressUtils.zip(htmlPath, localFilePath, true, zipPasswd); //将html报告压缩成zip报告
//					//密码解密
//					serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
//					new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
//							Integer.parseInt(serverInfo.getString("port")), 
//							serverInfo.getString("LoginName"), 
//							serverInfo.getString("LoginPass"), 
//							ftpPath, 
//							ftpFileName, 
//							localFilePath 
//							); //将压缩的zip报告上传ftp服务器
//				} catch (Exception e) {
//					logger.error("【由人行接口返回的报文生成html报文出错！】",e);
//				} finally{
//					File xmlFile = new File(xmlPath);
//					if(xmlFile.exists()){
//						new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
//								Integer.parseInt(serverInfo.getString("port")), 
//								serverInfo.getString("LoginName"), 
//								serverInfo.getString("LoginPass"), 
//								serverInfo.getString("ftpXmlReportPath"), 
//								id+".xml", 
//								xmlPath 
//								); //将压缩的zip报告上传ftp服务器
//					}
//					delFile(xmlPath); //删除xml文件
//					delFile(localFilePath); //删除压缩文件
//					delFile(path + id);
//					delFile(tmpPath); //删除替换数据字典前的html页面
//					delFile(htmlPath); //删除替换数据字典后的html页面
//				}
//			}
//			//解析xml报文并落库
//			
//			PageData pd = XmlParseUtil.xmlToPd(xml,authType);
//			List<String> tabNameList = new ArrayList<String>();
//			for(Object obj : pd.keySet()){
//				tabNameList.add((String) obj);
//			}
//			List<PageData> tabColList = indAppReService.queryColOfTab(tabNameList);
//			colOfTab = ObjectUtil.listToMap(tabColList, "TAB", "COL");
//		//	List<PageData> tableCol = indAppReService.queryTableColData();
//			colList_map = initList(indAppReService);
//			StringBuffer sql = new StringBuffer();
//			for(Object obj : pd.keySet()){
//				sql.replace(0, sql.length(), "");
//				String tab_name = (String) obj;
//				Object tab_val = pd.get(tab_name);
//				if(tab_val instanceof PageData){
//					PageData data = (PageData) tab_val;
//					if(report_id==null) report_id = data.getString("REPORT_ID");
//					sql.append(dataToSQL(data,tab_name));
//				}else if(tab_val instanceof List){
//					List<PageData> data = (List) tab_val;
//					sql.append(dataToSQL(data,tab_name));
//				}else{
//					logger.error("解析人行返回的xml文件得到的数据，表名为【"+tab_name+"】的数据类型不是PageData或者List的形式，请检查！！");
//				}
//				indAppReService.publicSave(sql.toString());
//			}
//			//更新信息表中状态
// 			//06 报告生成
// 			CompressUtils.updateStatus("06", entAppReService, indAppReService, id, report_id, ("1".equals(authType)?true:false));
//			}
//		
//		} catch (Exception e) {
//			logger.error("【去人行查询报文出错】",e);
//			e.printStackTrace();
//		}		
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

	
	
	//将数据库查询出的数据做map转化
	public static Map<String,List<String>> initList(IndAppReManager indAppReService){
		Map<String,List<String>> retMap = new HashMap<String,List<String>>();		
		List<PageData> tableCol = indAppReService.queryTableColData(); //查询出需要加密的表名和字段名
		Map<String, String> map =new HashMap<>();
		try {
			map=ObjectUtil.listToMap(tableCol, "TABLE_NAME", "COL_NAME");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(Object object : map.keySet()){
			String key = (String) object;
			String val = String.valueOf(map.get(key));
		    String[] col= val.split(",");
		    List<String> col_string=java.util.Arrays.asList(col);
		    retMap.put(key, col_string);
		}
		return retMap;
	}
	/**
	 * 将简单pd转化为sql
	 * @param pd
	 * @param tab_name
	 * @return
	 */
	private static String dataToSQL(Map<String, List<String>> colList_map,Map<String,String> colOfTab,PageData data,String tab_name){
		
		String cols = colOfTab.get(tab_name);
		StringBuffer sql = new StringBuffer("insert into "+tab_name+"("+cols+") values (");
		String[] arrCols = cols.split(",");
	    Map<String,String> tableColMap = new HashMap<String,String>();		    
//	    try {
//			tableColMap=ObjectUtil.listToMap(tableCol, "TABLE_NAME", "COL_NAME");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	     Map<String, List<String>> colList_map=new HashMap<String, List<String>>();
//	   for(String key:tableColMap.keySet()){
//		   String colList=tableColMap.get(key);
//		   String[] col= colList.split(",");
//		   List<String> col_string=java.util.Arrays.asList(col);
//		   colList_map.put(key, col_string);	   
//	   }
	   
	   if(colList_map.containsKey(tab_name)){
		   for(int i=0;i<arrCols.length;i++){
			   if(colList_map.get(tab_name).contains(arrCols[i])){
				   if(i>0) 
					   sql.append(",");
				   String str = String.valueOf(data.get(arrCols[i])).replace("null", "");
					str = DESUtil.encrypt("enhjeA==", str);
				   sql.append("'"+str+"'");
			   }else{
				if(i>0)
					sql.append(",");
				sql.append("'"+String.valueOf(data.get(arrCols[i])).replace("null", "").replace("\\", "\\\\").replace("'", "\\'")+"'");
			}
		   }
	   }else{	  
		for(int i=0;i<arrCols.length;i++){
			if(i>0) sql.append(",");
			sql.append("'"+String.valueOf(data.get(arrCols[i])).replace("null", "").replace("\\", "\\\\").replace("'", "\\'")+"'");
		}
		}
		sql.append(")");
		return sql.toString();       
	}
	/**
	 * 将List转化为sql
	 * @param pd
	 * @param tab_name
	 * @return
	 */
	private static String dataToSQL(Map<String, List<String>> colList_map,Map<String,String> colOfTab,List<PageData> data,String tab_name){
		String cols = colOfTab.get(tab_name);
		StringBuffer sql = new StringBuffer("insert into "+tab_name+"("+cols+") ");
		String[] arrCols = cols.split(",");
		int n=0;
		if(colList_map.containsKey(tab_name)){
			for(PageData pd : data){
				if(n>0) sql.append(" union all ");
				sql.append(" select ");
				for(int i=0;i<arrCols.length;i++){
					if(colList_map.get(tab_name).contains(arrCols[i])){
						if(i>0) sql.append(",");
						String str = String.valueOf(pd.get(arrCols[i])).replace("null", "");
						str = DESUtil.encrypt("enhjeA==", str);
						sql.append("'"+str+"'");
					}else{ 
						if(i>0) sql.append(",");
						sql.append("'"+String.valueOf(pd.get(arrCols[i])).replace("null", "").replace("\\", "\\\\").replace("'", "\\'")+"'");
					}
				}
				sql.append(" from dual ");
				n++;
			}
		}else{
			for(PageData pd : data){
				if(n>0) sql.append(" union all ");
				sql.append(" select ");
				for(int i=0;i<arrCols.length;i++){
					if(i>0) sql.append(",");
					sql.append("'"+String.valueOf(pd.get(arrCols[i])).replace("null", "").replace("\\", "\\\\").replace("'", "\\'")+"'");
				}
				sql.append(" from dual ");
				n++;
			}
		}
		return sql.toString();       
	}
	/**
	 * 通过人行接口查询请求数据
	 * @param authType 1-个人  2-企业
	 * @return
	 * @throws Exception 
	 */
	private static String queryReport(PageData queryData,String authType,IndAppReManager indAppReService,IDataSubmissionService iDataSubmissionService) throws Exception{
		//请求报文
		String requestXml = queryData.getString("REQ_REPORT");
		//人行返回报文
		String reponseXml = null;
		//人行报文XML
		String xml = null;
		String flow_id = queryData.getString("ID");
		PageData pdXmlMain =new PageData();
		if("1".equals(authType)){
			//个人
			reponseXml = IServiceUtil.queryReport(requestXml, "D101");
			pdXmlMain = RequestReportUtil.parseXml(reponseXml,flow_id);
		}else if("2".equals(authType)){
			//企业
			reponseXml = IServiceUtil.queryReport(requestXml, "D103");
			pdXmlMain = RequestReportUtil.parseXml(reponseXml,flow_id);
		}else{
			throw new Exception("参数客户类型不正确！");
		}
		logger.info(reponseXml);
		//报送
		try{
			boolean report = indAppReService.findQueryType("REPORTTYPE");
			if(report){
				iDataSubmissionService.sendSubmissionData(queryData.getString("ID"),authType);
			}
		}catch(Exception e){
			logger.error("报文报送异常!",e);
		}
		//根据查询结果代码处理查询结果
		String resultCode = pdXmlMain.getString("ResultCode");
		if("AAA000".equals(resultCode)){
			//查询成功
			indAppReService.updateResult(pdXmlMain);
			return pdXmlMain.getString("ReportMessage");
		}else if("AAA001".equals(resultCode)){
			//处理成功，但无查询结果
			pdXmlMain.put("STATUS", "05");
			indAppReService.updateStatus(pdXmlMain);
			
			//根据模板，生成查无此人的html报告
			String path = PathUtil.getClasspath() + Const.FILEPATHIMG + flow_id + "/" + flow_id+ ".html";
			PageData data = new PageData();
			data = indAppReService.getQueryInfo(queryData);
			if(data==null){
				data = new PageData();
				data.put("QUERY_NAME", queryData.get("QUERY_NAME"));
			}else{
				data.put("QUERY_NAME", queryData.get("QUERY_NAME"));
			}
			if("1".equals(authType)){
				//个人
				XmlToHtml.createHtml_per(path, data);
			}else if("2".equals(authType)){
				//企业
				XmlToHtml.createHtml_com(path, data);
			}else{
				throw new Exception("参数客户类型不正确！");
			}
			return "AAA001";
		}else{
			//查询失败
			pdXmlMain.put("STATUS", "04");
			indAppReService.updateStatus(pdXmlMain); //更新查询状态
			indAppReService.updateResult(pdXmlMain); //更新查询结果
		}
		return null;
	}
	
	
	
	private static String queryReport_batch(File file,String authType) throws Exception{
		//人行返回报文
		String reponseXml = null;
		//人行报文XML
		String xml = null;
		PageData pdXmlMain =new PageData();
		if("1".equals(authType)){//个人
			//调人行接口，返回应答报文
			int file_num = CollectFileTransfer.addFile(file);
			String batch_reponse=CollectFileTransfer.upload("");
			reponseXml=CollectFileTransfer.download("");
			pdXmlMain = RequestReportUtil.parseXml(reponseXml,"");
			xml = pdXmlMain.getString("ReportMessage");
		}else if("2".equals(authType)){ //企业
			//调人行接口，返回应答报文
			int file_num = CollectFileTransfer.addFile(file);
			String batch_reponse=CollectFileTransfer.upload("");
			reponseXml=CollectFileTransfer.download("");
			//人行返回企业报文
			pdXmlMain = RequestReportUtil.parseXml(reponseXml,"");
			xml = pdXmlMain.getString("ReportMessage");
		}else{
			throw new Exception("参数客户类型不正确！");
		}
		return xml;
	}
	// 重要信息提示数据落库
	@SuppressWarnings("static-access" )
	public static void importInfo_test(String type,ImportInfoManager importInfoService) {
		// TODO Auto-generated method stub
		String report_id = null;
		IndAppReService indAppReService = new IndAppReService();
		EntAppReService entAppReService = new EntAppReService();
		try {
			List<PageData> reportTabAndCol_Impo = indAppReService.findReportTabAndCol_Impo();			
			List<String> dicList = indAppReService.queryXmlDic();
			XmlParseUtil.allCol = ObjectUtil.listToMap(reportTabAndCol_Impo, "XML_TAG", "COLUMN_NAME");
			XmlParseUtil.allTab = ObjectUtil.listToMap(reportTabAndCol_Impo, "XML_TAG", "TABLE_NAME");
			XmlToHtml.allDicName = ObjectUtil.dicMap(dicList);
			XmlToHtml.encoding = encoding;
			String xml = null;
			//
			  //此处拼接请求报文（不明确）
			//
			try {
				//去人行查询征信报告
				xml = queryReport_Impo(type);
			} catch (Exception e) {
				logger.error("【去人行webservice接口查询报告异常】", e);
			}
//			String id = queryData.getString("ID");
			String id = "";
			if(xml != null){
				//生成html报文并存放到ftp服务器上
				String xmlPath = null; //xml文件路径
				String localFilePath = null; //压缩文件路径
				String tmpPath = null; //替换数据字典前的html页面路径
				String htmlPath = null; //替换数据字典后的html页面路径
				PageData serverInfo = BaseController.getServerInfo();
				try {
					String zipPasswd=id.substring(0,6);
					
					//生成html页面
					String path = PathUtil.getClasspath() + Const.FILEPATHIMG;
					xmlPath = path + id + ".xml";
					htmlPath = path + id + ".html"; //报告的本地位置
					String ftpPath = serverInfo.getString("ftpPath")+Const.IMPOR; //ftp服务器存放报告的路径
					String ftpFileName = id + ".zip"; //ftp服务器存放报告的文件名
					localFilePath = path + ftpFileName; //本地压缩后的zip文件的绝对路径
					FileUtil.writeFile(xmlPath,xml,encoding); //生成xml报告
					tmpPath = XmlToHtml.convertXmlToHtml(xmlPath,type); //将xml报告转成html报告
					String findName = indAppReService.findNameByFlowId(id); //查询报告的用户的真实名称
					XmlToHtml.dictHtml(htmlPath, tmpPath,id,findName); //html报告替换数据字典信息
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
					PageData pageData=null;
					pageData.put("ID", UuidUtil.get32UUID());
					pageData.put("REPORT_ID",  UuidUtil.get32UUID());
					pageData.put("NAME", ftpFileName);
					pageData.put("STATUS", "02");
					Date date=new Date();
					SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");					
					pageData.put("M_DATE",dateFormat.format(date));
					pageData.put("MESSAGE", "##");
					importInfoService.save(pageData);	
				} catch (Exception e) {
					logger.error("【由人行接口返回的报文生成html报文出错！】",e);
				} finally{
					File xmlFile = new File(xmlPath);
					if(xmlFile.exists()){
						new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
								Integer.parseInt(serverInfo.getString("port")), 
								serverInfo.getString("LoginName"), 
								serverInfo.getString("LoginPass"), 
								serverInfo.getString("ftpXmlReportPath"), 
								id+".xml", 
								xmlPath 
								); //将压缩的zip报告上传ftp服务器
					}
					delFile(xmlPath); //删除xml文件
					delFile(localFilePath); //删除压缩文件
					delFile(tmpPath); //删除替换数据字典前的html页面
					delFile(htmlPath); //删除替换数据字典后的html页面
				}
			}
			//解析xml报文并落库
			
			PageData pd = XmlParseUtil.xmlToPd(xml,type);
			List<String> tabNameList = new ArrayList<String>();
			for(Object obj : pd.keySet()){
				tabNameList.add((String) obj);
			}
			List<PageData> tabColList = indAppReService.queryColOfTab(tabNameList);
			Map<String,String> colOfTab = ObjectUtil.listToMap(tabColList, "TAB", "COL");
		//	List<PageData> tableCol = indAppReService.queryTableColData();
			Map<String, List<String>> colList_map = initList(indAppReService);
			StringBuffer sql = new StringBuffer();
			for(Object obj : pd.keySet()){
				sql.replace(0, sql.length(), "");
				String tab_name = (String) obj;
				Object tab_val = pd.get(tab_name);
				if(tab_val instanceof PageData){
					PageData data = (PageData) tab_val;
					if(report_id==null) report_id = data.getString("REPORT_ID");
					sql.append(dataToSQL(colList_map,colOfTab, data,tab_name));
				}else if(tab_val instanceof List){
					List<PageData> data = (List) tab_val;
					sql.append(dataToSQL(colList_map,colOfTab, data,tab_name));
				}else{
					logger.error("解析人行返回的xml文件得到的数据，表名为【"+tab_name+"】的数据类型不是PageData或者List的形式，请检查！！");
				}
				indAppReService.publicSave(sql.toString());
			}
			//更新信息表中状态
 			//06 报告生成
 			CompressUtils.updateStatus("06", entAppReService, indAppReService, id, report_id, ("1".equals(type)?true:false));
		
		} catch (Exception e) {
			logger.error("【去人行查询报文出错】",e);
			e.printStackTrace();
		}
				
		
		
		
		
	}
	private static String queryReport_Impo(String authType) throws Exception{
		//人行返回报文
		String reponseXml = null;
		//人行报文XML
		String xml = null;
		PageData pdXmlMain =new PageData();
		if("1".equals(authType)){//个人
			//调人行接口，返回重要信息提示应答报文			
			reponseXml=CollectFileTransfer.download("");
			//人行返回重要信息提示报文
			pdXmlMain = RequestReportUtil.parseXml(reponseXml,"");//test
			xml = pdXmlMain.getString("ReportMessage");
		}else if("2".equals(authType)){ //企业
			//调人行接口，返回重要信息提示应答报文
			reponseXml=CollectFileTransfer.download("");//test
			//人行返回重要信息提示报文
			pdXmlMain = RequestReportUtil.parseXml(reponseXml,"");
			xml = pdXmlMain.getString("ReportMessage");
		}else{
			throw new Exception("参数客户类型不正确！");
		}
		return xml;
	}
	
}
