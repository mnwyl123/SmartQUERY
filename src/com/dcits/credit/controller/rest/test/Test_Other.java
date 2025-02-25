package com.dcits.credit.controller.rest.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.dcits.platform.util.Logger;


public class Test_Other {
	private static Logger logger = Logger.getLogger(Test_Other.class);
	
	public static void main(String[] args){

		 //8.企业单笔请求接口
		try {
			for(int i=0;i<1;i++){
				String CHANNEL_QUERY_NO = new SimpleDateFormat("yyyyMMddHHmmssMS").format(new Date());
				CHANNEL_QUERY_NO="201906141809466365";
				String systime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				systime=systime;
				//8.企业单笔请求接口
				URL url8 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyInterface/queryRequest");
				String  param8 = "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
		        		+ "\"CLIENT_NAME\":\"北京报告样本公司"+i+"\",\"CREDENTIALS_NO_TYPE\":\"30\",\"CHINA_CREDIT_CODE\":\"18507965-8\","
		        		+ "\"QUERY_REASON\":\"10\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
		        		+ "\"CHANNEL_QUERY_NO\":\""+CHANNEL_QUERY_NO+"\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\","
		        		+ "\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}"; 				
				//9.企业单笔请求接口
				URL url9 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyInterface/queryRequest");
				String  param9 = "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
		        		+ "\"CLIENT_NAME\":\"其他公司"+i+"\",\"CREDENTIALS_NO_TYPE\":\"30\",\"CHINA_CREDIT_CODE\":\"18507965-8\","
		        		+ "\"QUERY_REASON\":\"10\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
		        		+ "\"CHANNEL_QUERY_NO\":\""+CHANNEL_QUERY_NO+"\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\","
		        		+ "\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}"; 
				
				//90.企业单笔查询接口
//				URL url90 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyInterface/queryReport");
				URL url90 = new URL("http://localhost:8281/SmartSense/rest/companyInterface/queryReport");
				String  param90 = "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
		        		+ "\"CLIENT_NAME\":\"北京报告样本公司"+i+"\",\"CREDENTIALS_NO_TYPE\":\"30\",\"CHINA_CREDIT_CODE\":\"68690571-9\","
		        		+ "\"QUERY_REASON\":\"10\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
		        		+ "\"CHANNEL_QUERY_NO\":\""+CHANNEL_QUERY_NO+"\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\","
		        		+ "\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}"; 
			
				//10.个人单笔请求接口
				URL url10 = new URL("http://10.202.18.30:9001/SmartSense/rest/personInterface/queryRequest");		
		 		String  param10 =  "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
		         		+ "\"CLIENT_NAME\":\"琪琪"+i+"\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"11010819931010444X\","
		         		+ "\"QUERY_REASON\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
		         		+ "\"CHANNEL_QUERY_NO\":\""+CHANNEL_QUERY_NO+"\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\","
		         		+ "\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}"; 
		 		//11.个人单笔请求接口
				URL url11 = new URL("http://10.202.18.30:9001/SmartSense/rest/personInterface/queryRequest");		
		 		String  param11 =  "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
		         		+ "\"CLIENT_NAME\":\"张大胆"+i+"\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"11010819931212444X\","
		         		+ "\"QUERY_REASON\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
		         		+ "\"CHANNEL_QUERY_NO\":\""+CHANNEL_QUERY_NO+"\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\","
		         		+ "\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}"; 
		 		String query_no="20190613151223340968";
		 		URL url12 = new URL("http://10.202.18.30:9001/SmartSense/rest/personInterface/queryReport");		
				String  param12 =  "{\"USERNAME\":\"cxy\",\"CHANNEL_ID\":\"003\",\"CHANNEL_QUERY_NO\":\""+query_no+"\"}";

		 		
		 		//30.个人信贷查询		        
		 		URL url30 = new URL("http://10.202.18.30:9001/SmartSense/rest/personLoanInterface/queryRequest");
		        String  param30 = "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
		         		+ "\"CLIENT_NAME\":\"张某某\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"11010819931010444X\",\"WARRANT_MATURITY_DATE\":\"99991230\","
		         		+ "\"QUERY_REASON\":\"01\",\"QUERY_TYPE\":\"02\",\"CUST_MANAGER\":\"个人测试申请\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"IS_USE\":\"1\","
		         		+ "\"CHANNEL_QUERY_NO\":\""+CHANNEL_QUERY_NO+"\",\"QUERY_VERSION\":\"02\",\"CHECK_SYS_NAME\":\"cxy\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}";
		        //32.企业信贷查询
		        URL url32 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyLoanInterface/queryComRequest");
		        String  param32 = "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
		         		+ "\"CLIENT_NAME\":\"北京报告样本公司\",\"CREDENTIALS_NO_TYPE\":\"30\",\"CHINA_CREDIT_CODE\":\"68690571-9\",\"WARRANT_MATURITY_DATE\":\"99991230\","
		         		+ "\"QUERY_REASON\":\"10\",\"QUERY_TYPE\":\"02\",\"CUST_MANAGER\":\"个人测试申请\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"IS_USE\":\"1\","
		         		+ "\"CHANNEL_QUERY_NO\":\""+CHANNEL_QUERY_NO+"\",\"QUERY_VERSION\":\"02\",\"CHECK_SYS_NAME\":\"cxy\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}";		        
//		        System.out.println(i);
//		        if(i%2==0){
		        	WbSave(param90,url90);	
//		        	WbSave(param12,url12);	
//		        }else{
//		        	WbSave(param9,url9);	
//		        }
			
			}		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(),e);
		}	
		logger.debug(",,,");
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
					url = new URL("http://localhost:8281/SmartSense/rest/AsynchronousService/queryReport");
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
