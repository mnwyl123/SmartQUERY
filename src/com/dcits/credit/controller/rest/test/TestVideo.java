package com.dcits.credit.controller.rest.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import com.dcits.platform.util.Logger;


public class TestVideo {
	private static Logger logger = Logger.getLogger(TestVideo.class);
	/*public static void main(String[] args) throws Exception {
         //密码修改
         URL url20 = new URL("http://21.129.81.51:22456/SmartSense/rest/updatePWDInterface/updatePwd");
         String  param20 = "{\"USERNAME\":\"YLB_jkcx\"}"; 
         //测试影像平台
         URL url21 = new URL("http://21.129.15.51:8080/uip/ImpService");
         String  param21 = "{\"tranCode\":\"1001\",\"branchId\": \"zhongguancun\","
         		+ "\"permission\": \"1111\",\"sysId\": \"ccb\",\"busiNo\": \"ccb-ceshi\","
         		+ "\"operaId\": \"zhangsan\"}"; 
         File file2 = new File("C:\\Users\\gaoshenga\\Desktop\\Chrysanthemum.jpg");
         String base64 = FileToBase64.fileToBase64(file2);
         String  param22 ="{\"tranCode\":\"2001\",\"sysId\":\"SGC\","
         		+ "\"operId\":\"125\","
//         		+ "\"branchNo\":\"801500003\","
         		+ "\"fileName\":\"WARRANT.jpg\","
         		+ "\"fileType\":\"jpg\","
         		+ "\"billType\":\"WARRANT\","
         		+ "\"busiNo\":\"ccb-2017\","
         		+ "\"isOcr\":\"0\","
//         		+ "\"templateNo\":\"17\","
//         		+ "\"remark\":\"testdemo\","
         		+ "\"base64\":\""
         		+base64+"\"}";
         
		 JSONObject json = new JSONObject();
		 json.put("tranCode", "2001");
		 json.put("sysId", "SGC");
		 json.put("operId", "01245");
		 json.put("fileName", "WARRANT1.jpg");
		 json.put("fileType", "jpg");
		 json.put("busiNo", "0012");
		 json.put("isOcr", "0");
		 json.put("base64", base64);
		 String data  = json.toString();
         String  param23 ="{\"tranCode\":\"2002\","
        		 	+"\"sysId\":\"SGC\","
        		 	+ "\"busiNo\":\"0012\","
        			+"\"fileId\":\"95018fb36f0c8954016f0d9593f40230\"}";
//         String[] param = {param19};
////          URL[] Url = {url1,url2,url3,url4,url5,url6,url7};
//          URL[] Url = {url19};
//          for(int i=0;i<param.length;i++){
//        	   WbSave(param[i],Url[i]); 
//          }
        String a  = WbSave(param23,url21);
        System.out.println(a);
//        JSONObject jsonre = JSONObject.fromObject(a);
//        String fileId = jsonre.getString("fileId");
//        System.out.println(fileId);
        
	   }  */
	
	public static void main(String[] args) {
		String a  = ".ada";
		//System.out.println(a.substring(1));
	}
	/**
    * 征信查询申请资料上传
    * @param str
    */
	@SuppressWarnings("unused")
	public static String WbSave(String str,URL StrUrl ) {
		URL url;
		String realse = "";
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
//			System.out.println(lines);
			realse = lines;
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
		return realse;
		
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
