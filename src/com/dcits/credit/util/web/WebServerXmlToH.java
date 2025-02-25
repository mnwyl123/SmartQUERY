package com.dcits.credit.util.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.util.*;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.*;

public class WebServerXmlToH {
	private final static Logger logger = Logger.getLogger(WebServerXmlToH.class);
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
	}
	
	public static void webServer(IndAppReManager indAppReService){		
		PageData serverInfo = BaseController.getPoolInfo();
		String num = serverInfo.getString("maximumPoolSize");
		String sql = "select ID,QUERY_NAME,TYPE FROM xml_to_html_table WHERE "
				+"rownum <= "+num;
		PageData pd = new PageData();
		pd.put("creatSql", sql);
		List<PageData> listPd = new ArrayList<>();
		try {
			listPd = indAppReService.selectInfo(pd);
			for(PageData pd_tmp:listPd){
				//调线程
				
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void XMLToHtml(PageData pd,IndAppReManager indAppReService){
		PageData serverInfo;
		String id = pd.getString("ID");
		String QUERY_NAME = pd.getString("QUERY_NAME");
		String authType = pd.getString("TYPE"); 			
		//step2：数据入库，生产html报告	
		String path = PathUtil.getClasspath() + Const.FILEPATHIMG ;
		String xmlPath = path + id + "/"+ id + ".xml";; //xml报告路径
		String htmlPath = path + id + "/"+ id + ".html"; //html报告路径
		String ftpFileName = id + ".zip"; //ftp服务器存放报告的文件名
		String localFilePath = path + ftpFileName; //压缩文件路径
		String tmpPath = null; //临时文件
		String localXmlPath = PathUtil.getClasspath()+Const.XML;
		try {	
			serverInfo = BaseController.getServerInfo();
			List<String> fileNameList = new ArrayList<String>();
			fileNameList.add(ftpFileName);
			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
			FtpUtil.downloadFtpFile(serverInfo.getString("IP"), 
					 serverInfo.getString("LoginName"),
					 serverInfo.getString("LoginPass"), 
					 Integer.parseInt(serverInfo.getString("port")),
					 serverInfo.getString("ftpPath")+id+"/", 
					 localXmlPath,
					 fileNameList);
			File fileDir= new File(localXmlPath + id);
			if(!fileDir.exists())
				fileDir.mkdirs();
			CompressUtils.unZip(localXmlPath+id+".zip", localXmlPath, id.substring(0, 6)); 
			String xml=XmlParseUtil.readXmlFile(localXmlPath+id+"/"+id+".xml", "UTF-8");
//			String xml=XmlParseUtil.readXmlFile("C:/Users/hp/Desktop/桌面文件/征信/新建文件夹/test.txt", "UTF-8");
			
			//查无此人
			if("AAA001".equals(xml)){
				return ;
			}
			//生成信用报告
			try {
				File file_dir= new File(path + id);
				if(!file_dir.exists())
					file_dir.mkdirs();
				FileUtil.writeFile(xmlPath,xml,"UTF-8"); 
				//转换成html报告
				List<String> dicList = indAppReService.queryXmlDic();
				XmlToHtml.allDicName = ObjectUtil.dicMap(dicList);
				XmlToHtml.encoding="UTF-8";
				logger.debug("********************即将进入convertXmlToHtml********************");
				tmpPath = XmlToHtml.convertXmlToHtml(xmlPath,authType); 
				XmlToHtml.dictHtml(htmlPath, tmpPath,id,QUERY_NAME); 
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//step3：报告上传ftp服务器
			try {
				//压缩上传文件
				String zipPasswd=id.substring(0,6);
				CompressUtils.zip(path  + id +"/",localFilePath, true, zipPasswd); 
				//密码上面已解密
				new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
						Integer.parseInt(serverInfo.getString("port")), 
						serverInfo.getString("LoginName"), 
						serverInfo.getString("LoginPass"), 
						serverInfo.getString("ftpPath")+id+"/", 
						ftpFileName, 
						localFilePath 
						); //将压缩的zip报告上传ftp服务器
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			String deleteSql="delete from xml_to_html_table where ID = '"+id+"'";
			PageData pdSql = new PageData();
			pdSql.put("deleteSql", deleteSql);
			indAppReService.deleteInfo(pdSql);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			delFile(localFilePath); //删除压缩文件
			delFile(tmpPath); //删除替换数据字典前的html页面
			delFile(path+id); //删除替换数据字典后的html页面
			delFile(localXmlPath+id);
			delFile(localXmlPath+id+".zip");
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
			e.printStackTrace();
		}
	}

}
