package com.dcits.credit.util;

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

import org.apache.log4j.Logger;

import com.dcits.crawl.InterfaceServer.InterfaceServerController;
import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.crawl.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

/**
 * 
 * 接口测试类
 *
 */

//@Component
public class ClawerInterfaceServer extends BaseController {
	
	private static Logger logger = Logger.getLogger(ClawerInterfaceServer.class);
	
	public static volatile int NUMB = 0;
	
	public synchronized static String setNumb(List<String> list){
		String credit = "";
		if(NUMB >= list.size()){
			NUMB = 0;
		}
		credit = list.get(NUMB);
		NUMB = NUMB + 1;
		
		return credit;
	} 
	
//	@Resource(name="interfaceServerController")
//	private static InterfaceServerController interfaceServerController;
	
	// public static void WxSave(PageData pd,String type,IndAppReManager
	// indAppReService) {
	// String str="";
	// if("1".equals(type)){ //个人
	// str =
	// "{\"CLIENT_NAME\":\""+pd.getString("CLIENT_NAME")+"\",\"CREDENTIALS_TYPE\":\""+pd.getString("CREDENTIALS_TYPE")+"\",\"CREDENTIALS_NO\":\""+pd.getString("CREDENTIALS_NO")+"\",\"QUERY_REASON\":\""+pd.getString("QUERY_REASON")+"\",\"USERNAME\":\""+pd.getString("USERNAME")+"\",\"ID\":\""+pd.getString("ID")+"\",\"QUERY_TYPE\":\""+pd.getString("QUERY_TYPE")+"\",\"QUERY_VERSION\":\""+pd.getString("QUERY_VERSION")+"\"}";
	// }else{ //企业
	// str =
	// "{\"USER_ID\":\""+pd.getString("USER_ID")+"\",\"TYPE\":\""+pd.getString("TYPE")+"\",\"CODE\":\""+pd.getString("CODE")+"\",\"QUERY_REASON\":\""+pd.getString("QUERY_REASON")+"\",\"ID\":\""+pd.getString("ID")+"\"}";
	// }
	// URL url;
	// try {
	// byte[] b = str.getBytes("utf-8");
	// String spideUrl=BaseController.getServerInfo().getString("spideUrl");
	// url = new URL(spideUrl+"ClawerServer/rest/ClawerServer/queryPerson");
	// if("2".equals(type)){
	// url = new URL(spideUrl+"ClawerServer/rest/ClawerServer/queryCompany");
	// }
	// HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	// conn.setRequestMethod("POST");// 提交模式
	// // 是否允许输入输出
	// conn.setDoInput(true);
	// conn.setDoOutput(true);
	// conn.setConnectTimeout(60000);// 连接超时 单位毫秒
	// conn.setReadTimeout(60000);// 读取超时 单位毫秒
	// // 设置请求头里面的数据，以下设置用于解决http请求code415的问题
	// conn.setRequestProperty("Content-Type",
	// "application/json;charset=UTF-8");
	// // 链接地址
	// conn.connect();
	// // 发送参数
	// OutputStream writer = conn.getOutputStream();
	// writer.write(b);
	//
	// // 清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
	// writer.flush();
	// writer.close();
	// if (conn.getResponseCode() != 200) {
	// throw new RuntimeException("Failed : HTTP error code : "
	// + conn.getResponseCode());
	// }
	// BufferedReader reader = new BufferedReader(new InputStreamReader(
	// conn.getInputStream(), "utf-8"));
	// String lines = reader.readLine();// 读取请求结果
	// logger.info("请求爬虫的返回信息："+lines);
	// //JSONObject js=JSONObject.fromObject(lines);
	// reader.close();
	// conn.disconnect();
	//
	// } catch (MalformedURLException e) {
	// logger.error(e);
	// logger.info("爬虫应用连接异常");
	// logger.info(indAppReService.QueryFlowStatus(pd.getString("ID")));
	// ComWebCrawler comWebCrawler=new ComWebCrawler();
	// comWebCrawler.updateStatus("04",indAppReService,pd.getString("ID"),type);
	// } catch (IOException e) {
	// logger.error(e);
	// logger.info("爬虫应用连接异常");
	// logger.info(indAppReService.QueryFlowStatus(pd.getString("ID")));
	// ComWebCrawler comWebCrawler=new ComWebCrawler();
	// comWebCrawler.updateStatus("04",indAppReService,pd.getString("ID"),type);
	// }
	// }
	//

	public static void WxSave(PageData pd, String type, IndAppReManager indAppReService,CrawlIndAppReManager crawlIndAppReService,PersonCrawlerManager crawlPersonCrawlerService, IDataSubmissionService crawlDataSubmissionService,
	    	 CrawlEntAppReManager crawlEntAppReService,CompanyCrawlerManager crawlCompanyCrawlerService) {
		String str = null;
		List<PageData> spideids = null;
		String spideid = "";
		try {
			SimpleDateFormat df = new SimpleDateFormat("HH");//设置日期格式
	        int time  = Integer.parseInt(df.format(new Date()));
	        PageData pdtime = new PageData();
	        if(time>=20||time<8){
	        	pdtime.put("ISWHITE", "1");
	        }
			spideids = indAppReService.getCREDITNUM(pdtime);
			List<String> strlist = new ArrayList<String>();
			for(PageData pdd :spideids){
				strlist.add(pdd.getString("CREDIT_CODE"));
			}
//			String[] sparr = new String[strlist.size()];
//			strlist.toArray(sparr);
//			if(sparr.length>1){
//					int a = (int) Math.floor(Math.random()*strlist.size());
//					if(a==1&&(sparr[a]==null||sparr[a].trim().equals(""))){
//						spideid=sparr[0].trim();
//					}else{
//						spideid=sparr[a].trim();
//					}
//			}else{
//				spideid=sparr[0].trim();
//			}
			pd.put("USERNAME", setNumb(strlist));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if ("1".equals(type)) { // 个人
//			str = "{\"CLIENT_NAME\":\"" + pd.getString("CLIENT_NAME") + "\",\"CREDENTIALS_TYPE\":\""
//					+ pd.getString("CREDENTIALS_TYPE") + "\",\"CREDENTIALS_NO\":\"" + pd.getString("CREDENTIALS_NO")
//					+ "\",\"QUERY_REASON\":\"" + pd.getString("QUERY_REASON") + "\",\"USERNAME\":\"" + spideid
//					+ "\",\"ID\":\"" + pd.getString("ID") + "\",\"QUERY_TYPE\":\"" + pd.getString("QUERY_TYPE")
//					+ "\",\"QUERY_VERSION\":\"" + pd.getString("QUERY_VERSION") + "\"}";
			InterfaceServerController interfaceServerController = new InterfaceServerController(crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
			interfaceServerController.queryPerson(pd);
			return ;
		} else { // 企业
//			str = "{\"USER_ID\":\"" + pd.getString("USER_ID") + "\",\"TYPE\":\"" + pd.getString("TYPE")
//					+ "\",\"CODE\":\"" + pd.getString("CODE") + "\",\"QUERY_REASON\":\"" + pd.getString("QUERY_REASON")
//					+ "\",\"ID\":\"" + pd.getString("ID") + "\",\"USERNAME\":\"" + spideid + "\"}";
			InterfaceServerController interfaceServerController = new InterfaceServerController(crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
			interfaceServerController.queryCompany(pd);
			return ;
		}
//		URL url;
//		try {
//			byte[] b = str.getBytes("utf-8");
//			String spideUrl = BaseController.getServerInfo().getString("spideUrl");
//			url = new URL(spideUrl + "ClawerServer/rest/ClawerServer/queryPerson");
//			if ("2".equals(type)) {
//				url = new URL(spideUrl + "ClawerServer/rest/ClawerServer/queryCompany");
//			}
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			conn.setRequestMethod("POST");// 提交模式
//			// 是否允许输入输出
//			conn.setDoInput(true);
//			conn.setDoOutput(true);
//			conn.setConnectTimeout(600000);// 连接超时 单位毫秒
//			conn.setReadTimeout(600000);// 读取超时 单位毫秒
//			// 设置请求头里面的数据，以下设置用于解决http请求code415的问题
//			conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
//			// 链接地址
//			conn.connect();
//			// 发送参数
//			OutputStream writer = conn.getOutputStream();
//			writer.write(b);
//
//			// 清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
//			writer.flush();
//			writer.close();
//			if (conn.getResponseCode() != 200) {
//				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
//			}
//			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
//			String lines = reader.readLine();// 读取请求结果
//			logger.info("请求爬虫的返回信息：" + lines);
//			// JSONObject js=JSONObject.fromObject(lines);
//			reader.close();
//			conn.disconnect();
//
//			JSONObject json = new JSONObject();
//			json = JSONObject.fromObject(lines);
//			String path = PathUtil.getClasspath() + Const.FILEPATHIMG;
//			String ID = pd.getString("ID");
//			String htmlPath = path + pd.getString("ID") + "/" + pd.getString("ID") + ".html";
//			String dir = path + pd.getString("ID");
//			if (json.has("html")) {
//				if (!json.get("html").equals("")) {
//					String html = json.get("html").toString();
//					// html = ZipStrUtil.uncompress(html);
//					File file = new File(dir);
//					if (!file.exists()) {
//						file.mkdirs();
//					}
//					File.createTempFile(ID, ".html");
//					FileUtil.writeFile(htmlPath, html, "UTF-8");
//					CompressUtils.zip(path + ID + "/", path + ID + ".zip", true, ID.substring(0, 6));
//				}
//			}
//		} catch (MalformedURLException e) {
//			logger.error(e);
//			logger.info("爬虫应用连接异常");
//			logger.info(indAppReService.QueryFlowStatus(pd.getString("ID")));
//			ComWebCrawler comWebCrawler = new ComWebCrawler();
//			comWebCrawler.updateStatus("04", indAppReService, pd.getString("ID"), type);
//		} catch (IOException e) {
//			logger.error(e);
//			logger.info("爬虫应用连接异常");
//			logger.info(indAppReService.QueryFlowStatus(pd.getString("ID")));
//			ComWebCrawler comWebCrawler = new ComWebCrawler();
//			comWebCrawler.updateStatus("04", indAppReService, pd.getString("ID"), type);
//		}
	}

	// 去人行测试密码修改是否正确
	public static String TestPwd(PageData pd, IndAppReManager indAppReService) {
		String str = null;
		str = "{\"USERNAME\":\"" + pd.getString("CREDIT_CODE") + "\"}";
		URL url;
		try {
			byte[] b = str.getBytes("utf-8");
			String spideUrl = BaseController.getServerInfo().getString("spideUrl");
			url = new URL(spideUrl + "ClawerServer/rest/ClawerServer/pwdTest");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");// 提交模式
			// 是否允许输入输出
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setConnectTimeout(60000);// 连接超时 单位毫秒
			conn.setReadTimeout(60000);// 读取超时 单位毫秒
			// 设置请求头里面的数据，以下设置用于解决http请求code415的问题
			conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			// 链接地址
			conn.connect();
			// 发送参数
			OutputStream writer = conn.getOutputStream();
			writer.write(b);

			// 清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
			writer.flush();
			writer.close();
			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String lines = reader.readLine();// 读取请求结果
			logger.info("请求爬虫的返回信息：" + lines);
			reader.close();
			conn.disconnect();
			return lines;
		} catch (MalformedURLException e) {
			logger.error(e);
			logger.info("爬虫应用连接异常");
			logger.info(indAppReService.QueryFlowStatus(pd.getString("ID")));
		} catch (IOException e) {
			logger.error(e);
			logger.info("爬虫应用连接异常");
			logger.info(indAppReService.QueryFlowStatus(pd.getString("ID")));
		}
		return null;
	}

}
