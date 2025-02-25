package com.dcits.credit.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.util.crawler.companyCredit.ComWebCrawler;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
/**
 * 
 * ftp上copy影像资料
 *
 */
public class CopyFileServer extends BaseController{
	
	private static Logger logger = Logger.getLogger(CopyFileServer.class);
	
	//个人影像资料copy
	public static void CopyPerFile(PageData serverInfo,String cerdentialsNo,List<String> listName,String sourtPath,String destPath) {
	  	String orgainFileName="LOAN_"+cerdentialsNo;//贷款申请书（原始文件名称）
		String finalFileName="LOAN_APPLICATION"+".jpg";//贷款申请书
		for(int i=0;i<listName.size();i++){
			if(listName.get(i).contains(orgainFileName)){
				orgainFileName = listName.get(i);
				break;
			}
		}
		try{
			FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		
		orgainFileName="WARR_"+cerdentialsNo;//授权书（原始文件名称）
		for(int i=0;i<listName.size();i++){
			if(listName.get(i).contains(orgainFileName)){
				orgainFileName = listName.get(i);
				break;
			}
		}
		finalFileName="WARRANT"+".jpg";//贷款申请书
		try{
			FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		
		orgainFileName="ID_"+cerdentialsNo;//身份证明正面文件（原始文件名称）
		for(int i=0;i<listName.size();i++){
			if(listName.get(i).contains(orgainFileName)){
				orgainFileName = listName.get(i);
				break;
			}
		}
		finalFileName="IDENTITY_DOCUMENT"+".jpg";//身份证明文件
		try{
			FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		
		orgainFileName="IDB_"+cerdentialsNo;//身份证明反面文件（原始文件名称）
		for(int i=0;i<listName.size();i++){
			if(listName.get(i).contains(orgainFileName)){
				orgainFileName = listName.get(i);
				break;
			}
		}
		finalFileName="IDENTITY_DOCUMENT_B"+".jpg";//身份证明文件
		try{
			FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
  	}	
	
	//企业影像资料copy
	public static void CopyComFile(PageData serverInfo,String cardNo,List<String> listName,String sourtPath,String destPath) {
    	String orgainFileName="LOAN_"+cardNo;//贷款申请书（原始文件名称）
    	for(int i=0;i<listName.size();i++){
			if(listName.get(i).contains(orgainFileName)){
				orgainFileName = listName.get(i);
				break;
			}
		}
		String finalFileName="LOAN_APPLICATION"+".jpg";//贷款申请书
		try{
			FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		orgainFileName="WARR_"+cardNo;//授权书（原始文件名称）
		for(int i=0;i<listName.size();i++){
			if(listName.get(i).contains(orgainFileName)){
				orgainFileName = listName.get(i);
				break;
			}
		}
		finalFileName="WARRANT"+".jpg";//贷款申请书
		try{
			FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		orgainFileName="ID_"+cardNo;//身份证明文件（原始文件名称）
		for(int i=0;i<listName.size();i++){
			if(listName.get(i).contains(orgainFileName)){
				orgainFileName = listName.get(i);
				break;
			}
		}
		finalFileName="business_licence"+".jpg";//身份证明文件
		try{
			FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
  	}	
}
