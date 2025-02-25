package com.dcits.credit.controller.rest.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;

import com.dcits.platform.util.Logger;
import com.dcits.platform.util.StringUtil;

public class TestComInterface {
	private static Logger logger = Logger.getLogger(TestComInterface.class);
	public static void main(String[] args) throws SQLException, MalformedURLException {


     /**
      * 企业信贷
      */
	  //信贷申请
      String  paramEnt = "{\"USERNAME\":\"cxy\",\"CLIENT_NAME\":\"北京报告样本公司\",\"CREDENTIALS_NO_TYPE\":\"30\","
      		+ "\"CHINA_CREDIT_CODE\":\"68690571-9\",\"QUERY_REASON\":\"10\",\"CHANNEL_ID\":\"004\","
      		+ "\"CHANNEL_QUERY_NO\":\"cs20181029143802\",\"CUST_MANAGER\":\"企业测试申请\",\"WARRANT_MATURITY_DATE\":\"99991230\","
      		+ "\"IS_USE\":\"0\",\"IS_CHECK_IMAGE\":\"0\",\"CHECK_SYS_NAME\":\"shy\",\"QUERY_VERSION\":\"30\",\"QUERY_TYPE\":\"0\"}";
      URL urlEnt = new URL("http://10.202.18.30:9001/SmartSense/rest/companyLoanInterface/queryComRequest");
      //信贷查询
      String  paramEntCX = "{\"USERNAME\":\"cxy\",\"CHANNEL_ID\":\"004\",\"CHANNEL_QUERY_NO\":\"cs20181029143802\"}";
	      URL urlEntCX = new URL("http://10.202.18.30:9001/SmartSense/rest/companyLoanInterface/queryComReport");
	/**
	 * 企业公共接口
	 */
	//申请
    String   paramCreCom = "{\"USERNAME\":\"cxy\",\"CLIENT_NAME\":\"北京报告样本公司\","
    		+ "\"CREDENTIALS_NO_TYPE\":\"30\",\"CHINA_CREDIT_CODE\":\"68690571-9\","
    		+ "\"QUERY_REASON\":\"10\",\"CHANNEL_ID\":\"004\",\"CHANNEL_QUERY_NO\":\"cs2018102914393112\","
    		+ "\"CUST_MANAGER\":\"企业测试申请\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"IS_USE\":\"0\",\"IS_CHECK_IMAGE\":\"0\"}";
	URL urlCreCom = new URL("http://10.202.18.30:9001/SmartSense/rest/companyInterface/queryRequest");
	//查询
    String   paramCreComCX = "{\"USERNAME\":\"cxy\",\"CHANNEL_ID\":\"004\",\"CHANNEL_QUERY_NO\":\"cs2018102914393112\"}";
	URL urlCreComCX = new URL("http://10.202.18.30:9001/SmartSense/rest/companyInterface/queryReport");
	
	//个人查询报告页面
    String   paramHttpUrl = "{\"USERNAME\":\"cxy\",\"CHANNEL_ID\":\"003\",\"CHANNEL_QUERY_NO\":\"200\"}";
	URL urlHttpUrl = new URL("http://10.202.18.30:9001/SmartSense/rest/personLoanInterface/queryOriginalReport");
	
	//企业查询报告页面
    String   paramHttpUrl1 = "{\"USERNAME\":\"cxy\",\"CHANNEL_ID\":\"004\",\"CHANNEL_QUERY_NO\":\"cs2018102914393112\"}";
	URL urlHttpUrl1 = new URL("http://10.202.18.30:9001/SmartSense/rest/personLoanInterface/queryOriginalReport");
	
	String[] param = {paramEnt};
      URL[] Url = {urlEnt};
      for(int i=0;i<param.length;i++){
    	   WbSave(param[i],Url[i]); 
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
					}
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
	/**
	 * 删除目录
	 */
	public static void delFileDir(File dir){
		try {
			if(!dir.exists())
				throw new NullPointerException("the dir is null");
			if(dir.isFile()||dir.list()==null){
				dir.delete();
				logger.debug("删除了"+dir.getName());
			}else{
				File[] files = dir.listFiles();
				for(File a : files){
					delFileDir(a);
				}
				dir.delete();
				logger.debug("删除了"+dir.getName());
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
	
	

	
/**
* 征信查询申请资料上传
* @param str
*/
@SuppressWarnings("unused")
public static void WbSave(String str,URL StrUrl ) {
	URL url;
	try {
		byte[] b = str.getBytes("utf-8");
		url = StrUrl;
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");// 提交模式
		// 是否允许输入输出
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setConnectTimeout(60000);// 连接超时 单位毫秒
		conn.setReadTimeout(60000);// 读取超时 单位毫秒
		// 设置请求头里面的数据，以下设置用于解决http请求code415的问题
		conn.setRequestProperty("Content-Type",
				"application/json;charset=UTF-8");
		// 链接地址
		conn.connect();
		// 发送参数
		OutputStream writer = conn.getOutputStream();
		writer.write(b);

		// 清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
		writer.flush();
		writer.close();
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				conn.getInputStream(), "utf-8"));
		String lines = reader.readLine();// 读取请求结果
		logger.debug(lines);
		// JSONObject js=JSONObject.fromObject(lines);
		reader.close();
		conn.disconnect();
	} catch (MalformedURLException e) {
		// TODO Auto-generated catch block
		logger.error(e.getMessage(),e);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		logger.error(e.getMessage(),e);
	} catch (Exception e){
		logger.debug("4444444444444444444444444444444444444444444444");
		logger.error(e.getMessage(),e);
	}
	
}
/**
    * 征信查询申请资料上传
    * @param str
    */
	@SuppressWarnings("unused")
	private static void queryReport(String str) {
		URL url;
		try {
			byte[] b = str.getBytes("utf-8");
			//url = new URL("http://localhost:7001/SmartSense/rest/WbqqCreditQuery/save");
			url = new URL("http://localhost:8080/SmartSense/rest/AsynchronousService/queryReport");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");// 提交模式
			// 是否允许输入输出
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setConnectTimeout(60000);// 连接超时 单位毫秒
			conn.setReadTimeout(60000);// 读取超时 单位毫秒
			// 设置请求头里面的数据，以下设置用于解决http请求code415的问题
			conn.setRequestProperty("Content-Type",
					"application/json;charset=UTF-8");
			// 链接地址
			conn.connect();
			// 发送参数
			OutputStream writer = conn.getOutputStream();
			writer.write(b);

			// 清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
			writer.flush();
			writer.close();
			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			}
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "utf-8"));
			String lines = reader.readLine();// 读取请求结果
			logger.debug(lines);
			// JSONObject js=JSONObject.fromObject(lines);
			reader.close();
			conn.disconnect();

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(),e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(),e);
		}
		
	}	
}
