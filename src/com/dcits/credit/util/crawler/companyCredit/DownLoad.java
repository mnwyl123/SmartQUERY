package com.dcits.credit.util.crawler.companyCredit;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import org.apache.log4j.Logger;

import com.dcits.credit.entity.FileTool;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

/**
 * 下载excel
 * @author zhangyy
 *
 */
public class DownLoad {

	private static Logger logger = Logger.getLogger(DownLoad.class);
	
	public void executeAutoItScript(int fileName,PageData pd){ 
	    try {
	    	String ID = pd.getString("ID");
	    	String browser = "IE";
	    	String filepath = PathUtil.getClasspath() + Const.FILEPATHIMG + "/"+ID;  //本地保存路径
	    	File file = new File(filepath);
			if(!file.exists()){
				file.mkdirs();
			}
	    	String execute_file = "exec/downLoadFile.exe";
	    	String cmd = "\"" + execute_file + "\"" + " " + "\"" + browser + "\""
	    			+ " " + "\"" + fileName + "\""
	                + " " + "\"" + filepath + "\"";
	        Process p = Runtime.getRuntime().exec(cmd);
	        p.waitFor(); //wait for the upload.exe to complete
	        p.destroy();
	        //上传至FTP服务器
	        SavePopPage(fileName,pd,filepath);
	    } catch (Exception e) {
	        logger.error(e.getMessage());
	    }
   } 
	//将Excel上传到FTP服务器
	public static void SavePopPage(int count,PageData pd,String path){
		String ID = pd.getString("ID");
		String fileName = count+".xlsx";
		String ftpPath = pd.getString("ftpPath")+ID;
		try {
			new FileTool().upLoadFromProduction(pd.getString("IP"), Integer.parseInt(pd.getString("port")), pd.getString("LoginName"), pd.getString("LoginPass"), ftpPath, fileName,path+"/"+fileName);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
}
