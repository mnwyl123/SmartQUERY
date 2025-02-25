package com.dcits.credit.controller.rest.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import net.sf.json.JSONObject;

public class Test_Out {
	private static Logger logger = Logger.getLogger(Test_Out.class);
	public static void main(String[] args){
		PageData pd_All = new PageData();
		pd_All.remove("ss");
		pd_All.put("pdList", "1");
		logger.debug(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		try {
			List<PageData> pdList = new ArrayList<>();
			pdList.add(pd_All);
			JSONObject json = JSONObject.fromObject(pd_All);
			String  str = json.toString();
			
			String string = "{\"CLIENT_NAME\":\""+pd_All.getString("pdList")+"\"}";
            PageData pdData=new PageData();
            pdData.putAll(pd_All);
            PageData pdData1=new PageData();
            pd_All.put("pdList", "2");
            pdData1.putAll(pd_All);
            
			logger.debug(str);;
		} catch (Exception e) {
			// TODO: handle exception
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
