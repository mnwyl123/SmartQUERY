	package com.dcits.credit.controller.rest.test;

import com.dcits.platform.util.Logger;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;

public class Test2 {
	private static Logger logger = Logger.getLogger(Test2.class);
	@SuppressWarnings("static-access")
	public static void main(String[] args) throws SQLException, MalformedURLException, InterruptedException {
        
		String query_no = "1595621223244";
		//公共接口
		//个人申请接口
		URL url11 = new URL("http://21.129.81.51:22456/SmartSense/rest/personInterface/queryRequest");		
		String  param11 =  "{\"USERNAME\":\"cxy\","
         		+ "\"CLIENT_NAME\":\"王小二\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"622926198501293785\","
         		+ "\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"1\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
         		+ "\"CHANNEL_QUERY_NO\":\""+query_no+"\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"PRO_ID\":\"1\"}"; 
 		
 		String param111 = "{\"GG_BRANCH_NO\":\"001\",\"CHANNEL_ID\":\"003\",\"TERMINALID\":\"\",\"GG_SYS_ID\":\"089\",\"CHANNELTIME\":\"105536\",\"TRAN_CODE\":\"290102\",\"GG_CHANNELCODE\":\"083\",\"CHANNEL_QUERY_NO\":\"201605141054569840470443\",\"USERNAME\":\"cxy\",\"CHANNELDATE\":\"20190514\",\"CHANNELSN\":\"20190514105536\",\"SYSID\":\"089\",\"GG_TELLER_NO\":\"001\"}";
 		WbSave(param11,url11,111); 
 		//个人查询数据接口
 		URL url12 = new URL("http://21.129.81.51:22456/SmartSense/rest/personInterface/queryReport");		
		String  param12 =  "{\"USERNAME\":\"cxy\",\"CHANNEL_ID\":\"0\",\"CHANNEL_QUERY_NO\":\""+query_no+"\"}";

//		WbSave(param11,url11,11); 
// 		WbSave(param12,url12,12);
		
		//企业申请接口
		URL url13 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyInterface/queryRequest");		
 		String  param13 =  " {\"USERNAME\":\"cxy\",\"CLIENT_NAME\":\"北京报告样本公司\",\"CREDENTIALS_NO_TYPE\":\"30\",\"CHINA_CREDIT_CODE\":\"68690571-9\",\"QUERY_REASON\":\"10\",\"CHANNEL_ID\":\"003\",\"CHANNEL_QUERY_NO\":\""+query_no+"\",\"CUST_MANAGER\":\"企业测试申请\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"IS_USE\":\"0\",\"IS_CHECK_IMAGE\":\"0\",\"CHECK_SYS_NAME\":\"shy\",\"QUERY_VERSION\":\"30\",\"QUERY_TYPE\":\"0\"}"; 
 		
 		query_no="QYZX20190617103501689524";
 		//企业查询数据接口
 		URL url14 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyInterface/queryReport");		
		String  param14 =  "{\"USERNAME\":\"zhangyan\",\"CHANNEL_ID\":\"087\",\"CHANNEL_QUERY_NO\":\""+query_no+"\"}";

//		WbSave(param13,url13,13); 
//		WbSave(param14,url14,14);
 		
 		
 		///信贷接口 
 		//个人申请接口
 		query_no = "201805070004";
 		String param21 = "{\"USERNAME\":\"web_cxy\",\"CLIENT_NAME\":\"王小二\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"622926198501293785\",\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"1\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\",\"CHANNEL_QUERY_NO\":\""+query_no+"\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"QUERY_VERSION\":\"30\",\"QUERY_TYPE\":\"2\",\"CHECK_SYS_NAME\":\"web_cxy\"}";
 		URL url21 = new URL("http://10.202.18.30:9001/SmartSense/rest/personLoanInterface/queryRequest");		
// 		WbSave(param21,url21,21); 
 		
 		//个人查询数据接口
 		String param22 = "{\"USERNAME\":\"web_cxy\",\"CHANNEL_ID\":\"003\",\"CHANNEL_QUERY_NO\":\""+query_no+"\"}";
 		URL url22 = new URL("http://10.202.18.30:9001/SmartSense/rest/personLoanInterface/queryReport");		
// 		WbSave(param22,url22,22); 
 		
 		//个人查询报告链接
 		String param23 = "{\"USERNAME\":\"web_cxy\",\"CHANNEL_ID\":\"003\",\"CHANNEL_QUERY_NO\":\""+query_no+"\"}";
 		URL url23 = new URL("http://10.202.18.30:9001/SmartSense/rest/personLoanInterface/queryOriginalReport");		
// 		WbSave(param23,url23,23); 
	
 		//企业申请接口
 		query_no = "201805070006";
 		String param24 = " {\"USERNAME\":\"web_cxy\",\"CLIENT_NAME\":\"北京报告样本公司\",\"CREDENTIALS_NO_TYPE\":\"30\",\"CHINA_CREDIT_CODE\":\"68690571-9\",\"QUERY_REASON\":\"10\",\"CHANNEL_ID\":\"003\",\"CHANNEL_QUERY_NO\":\""+query_no+"\",\"CUST_MANAGER\":\"企业测试申请\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"IS_USE\":\"0\",\"IS_CHECK_IMAGE\":\"0\",\"CHECK_SYS_NAME\":\"cxy\",\"QUERY_VERSION\":\"30\",\"QUERY_TYPE\":\"0\"}";
 		URL url24 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyLoanInterface/queryComRequest");		
// 		WbSave(param24,url24,24); 
 		
 		//企业查询数据接口
 		String param25 = "{\"USERNAME\":\"web_cxy\",\"CHANNEL_ID\":\"003\",\"CHANNEL_QUERY_NO\":\""+query_no+"\"}";
 		URL url25 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyLoanInterface/queryComReport");		
// 		WbSave(param25,url25,25); 
 		
 		//企业查询报告链接
 		String param26 = "{\"USERNAME\":\"web_cxy\",\"CHANNEL_ID\":\"003\",\"CHANNEL_QUERY_NO\":\""+query_no+"\"}";
 		URL url26 = new URL("http://10.202.18.30:9001/SmartSense/rest/personLoanInterface/queryOriginalReport");		
// 		WbSave(param26,url26,26); 
	}  
	
	/**
    * 征信查询申请资料上传
    * @param str
    */
	@SuppressWarnings("unused")
	public static void WbSave(String str,URL StrUrl,int i) {
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
			logger.debug(i+"----"+lines);
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
