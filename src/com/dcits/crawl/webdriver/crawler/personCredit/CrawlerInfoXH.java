package com.dcits.crawl.webdriver.crawler.personCredit;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.crawl.util.FileTool;
import com.dcits.crawl.util.PathUtil;
import com.dcits.crawl.webdriver.crawler.HtmlForXml;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;


/**
 * 信用报告中数据爬取
 * @author zhangyy
 *
 */
public class CrawlerInfoXH {

	private static Logger logger = Logger.getLogger(CrawlerInfo.class);
	
	public static String XmlFileToStr(String path){
	 	String xmlString = "";
		byte[] strBuffer = null;
		InputStreamReader inputReader =null;
		BufferedReader bf = null;
		StringBuffer sb =null;
		Writer fileWritter =null;
		File xmlfile = new File(path);
		try {

			inputReader = new InputStreamReader(new FileInputStream(xmlfile));
			bf = new BufferedReader(inputReader);
			sb = new StringBuffer();
			String str;
			while ((str = bf.readLine()) != null) {
					str=str.replaceAll("&", "&amp;");
					str=str.replaceAll("<>", "&lt;&gt;");
					int starts = str.indexOf("<");
					int starte = str.indexOf(">");
					String temp =  str.substring(starts, starte+1);
					String temp2 =  temp.replace("<", "</");
					str=str.replace(temp, "SmartSense");
					str=str.replace(temp2, "SmartCrawler");
					str=str.replace("<", "&lt;");
					str=str.replace(">", "&gt;");
					str=str.replace("SmartSense", temp);
					str=str.replace("SmartCrawler", temp2);
				sb.append(str);
				sb.append("\r\n");
			}
		xmlString=sb.toString();
		logger.info("2020202020202020");
		logger.info(xmlString);
		inputReader.close();
		} catch (FileNotFoundException e) {
		e.printStackTrace();
		} catch (IOException e) {
		e.printStackTrace();
		} 
		try {
			bf.close();
			inputReader.close();
			fileWritter=new FileWriter(xmlfile,false);//写入的文本不附加在原来的后面而是直接覆盖
			fileWritter.write(sb.toString());
			fileWritter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return xmlString.replaceAll("\r", "").replaceAll("\n", "");

 }
	//修改状态为06
	public void updateStatus(String pageCode,PersonCrawlerManager personCrawlerService,CrawlIndAppReManager indAppReService,PageData serverInfo){
		PageData pd = new PageData();
		String ID = serverInfo.getString("ID");
		pageCode = pageCode.replaceAll("　", "").replace(" ", "");
		Document document = Jsoup.parse(pageCode);
		Element titles = document.getElementsByTag("TABLE").first();
		List<Element> rows = titles.select("TR>TD,TR>TH");
		pd = getTileInfoOld(rows);
		String flag ="05";  //06表示报告生成，05表示未查得
		if(pd.get("REPORT_ID")!=null){
			flag ="06"; 
			updateStatus(flag,indAppReService,ID,pd.getString("REPORT_ID"),serverInfo.getString("USER_CODE"),serverInfo.getString("CREDENTIALS_NO"),serverInfo.getString("CREDENTIALS_TYPE"));
			
		}
	}
	public String crawlerInfo(String pageCode,PersonCrawlerManager personCrawlerService,CrawlIndAppReManager indAppReService,PageData serverInfo,String input,String output,String user_code){
		String ending = "UTF-8";
		HtmlForXml hx = null;
		String ID = serverInfo.getString("ID");
		pageCode = pageCode.replaceAll("　", "").replace(" ", "");
		Document document = Jsoup.parse(pageCode);
		String reportId="";
		String flag ="05";  //06表示报告生成，05表示未查得
		PageData pd = new PageData();
		pd.put("USER_CODE", user_code);
		try{
			//获取报告头体
			Element titles = document.getElementsByTag("TABLE").first();
			System.out.println("-----"+titles);
			List<Element> rows = titles.select("TR>TD,TR>TH");
			pd = getTileInfo(rows);
			hx = new HtmlForXml(input, output, ending);
			hx.outputXml("<ReportInf type=\"array\">");
			hx.outputXml("<Struct>");
			hx.getHeader();
//			pd = getTileInfo(XmlFileToStr(output));

		}catch(Exception e){
			flag ="04";
			logger.error(e.getMessage());
			logger.info("爬虫失败!");
		}
		
		
		//保存页面源码
//		savePageCode(document.toString(),serverInfo);
		
		//报告生成，则继续爬虫
		if(pd.get("REPORT_ID")!=null){   //表示查得信息
			flag = "06";
//			reportId = pd.getString("REPORT_ID");

			// 一 个人基本信息
			hx.addPersonalInfoStart();

			// 二 信息概要
			hx.addInfoSummaryStart();

			// 三 信贷交易信息明细
			hx.addCreditDetailStart();

			// 四 非信贷交易信息明细
			hx.addNotCreditDetailStart();

			// 五 公共信息明细
			hx.addPublicInformation();
			//hx.InstitutionalDescription();
			//异议标注
			hx.yiyibiaozhu();
			// 六 查询记录
			hx.addQueryRecordStart();

			hx.outputXml("</Struct>");
			hx.outputXml("</ReportInf>");
//	    System.out.println(XmlFileToStr(output));
			hx.close();
//			updateStatus(flag,indAppReService,ID,reportId,user_code,serverInfo.getString("CREDENTIALS_NO"),serverInfo.getString("CREDENTIALS_TYPE"));
		}
		
		
		return XmlFileToStr(output);

	}
		//获取报告头体
	private PageData getTileInfo(String hx) {
			PageData pd = new PageData();
			Pattern pId=Pattern.compile("<ReportNo>\\d+</ReportNo>");
			Pattern pDate=Pattern.compile("<RptTmStmp>2020.07.21 22:01:23</RptTmStmp>");
			Matcher mId=pId.matcher(hx);
			Matcher mDate=pDate.matcher(hx); 
			if(mId.find()){
				String reportId = mId.group().substring(10, mId.group().length()-11);
				pd.put("REPORT_ID", reportId);
			}
			if(mDate.find()){
				String reportTime = mDate.group().substring(11, mDate.group().length()-12);
				pd.put("REPORT_TIME", reportTime);
			}

                   return pd;
		}
//	获取报告头体
	private PageData getTileInfoOld(List<Element> list){
		PageData pd = new PageData();
		for(int t=0;t<list.size();t++){
			List<Element> cols = list.get(t).select("TD,TH");
				if(cols.get(0).text().contains("报告编号")){
					String reportId = cols.get(0).text().substring(5);
					pd.put("REPORT_ID", reportId);
				}
				if(cols.get(0).text().contains("报告时间")){
					String reportTime = cols.get(0).text().substring(5);
					pd.put("REPORT_TIME", reportTime);
				}
		}
		return pd;
	}
	
	
	//提取用户名、证件类型及证件号,并将报告信息入库
	@SuppressWarnings({ "unused", "unchecked" })
	private PageData getUserName(Element eles ,int start,PageData data,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_QUERY_DETAIL", "查询信息");
		List<PageData> listpd = new GetWebDataXH().getWebInfoBasic(eles, start, fields);
		if(listpd.size()>0){
			PageData pd=listpd.get(0);
			data.putAll(pd);
		}

		return data;
	}
	
	private String getTitle(List<Element> list){
		PageData pd = new PageData();
		String xml = "";
		for(int t=0;t<list.size();t++){
			List<Element> cols = list.get(t).select("TD,TH");
				if(cols.get(0).text().contains("报告编号")){
					String reportId = cols.get(0).text().substring(5);
					pd.put("REPORT_ID", reportId);
				}
				if(cols.get(0).text().contains("报告时间")){
					String reportTime = cols.get(0).text().substring(5);
					pd.put("REPORT_TIME", reportTime);
				}
		}
		xml = "<ReportInf type=\"array\"><Struct><ReportNo>"+pd.getString("REPORT_ID")+"</ReportNo><RptTmStmp>"+pd.getString("REPORT_TIME")+"</RptTmStmp>";
		return xml;
	}
	
	private String getInfoBasic(Element eles ,int start,PageData data,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		String xml = "";
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_QUERY_DETAIL", "查询信息");
		List<PageData> listpd = new GetWebDataXH().getWebInfoBasic(eles, start, fields);
		if(listpd.size()>0){
			try {
				xml = WriteXmlReportUtil.writeXmlReportUser(listpd.get(0));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				logger.error("-----WEBXH中：查询信息-----转换出错------", e1);
			}
		}
		return xml;
	}

	//保存页面
	private void savePageCode(String pageCode,PageData pd){
//		String ID = pd.getString("ID");
		String ID = "201903281152";
		try {
			pageCode = pageCode.replaceAll(" ", "&nbsp;"); 
			pageCode = pageCode.replace("javascript:window.close()", "window.location.href=document.referrer;");
			pageCode = pageCode.replace("javascript:document.execCommand('print')", "printReport()");
			if(pd.get("REPORT_ID")==null||"".equals(pd.get("REPORT_ID"))){
				pageCode = pageCode.replace("width=96 height=36", "style='display:none;'");
				//pageCode = pageCode.replace("<IMG src="+"image/pic_r02.gif"+" width=2 height=2>", "&nbsp");
			}
			pageCode = pageCode.substring(0, pageCode.length()-14);
			StringBuffer str = new StringBuffer();
			str.append(pageCode);
			str.append("<script src="+'"'+"../../js/common/jquery-1.10.2.js"+'"'+"></script>");
			str.append("<SCRIPT>");
			str.append("function printReport(){");
			str.append(" javascript:document.execCommand('print');");
			str.append("$.ajax({");
			str.append("async:false,");
			str.append("cache:false,");
			str.append("data:{"+'"'+"ID"+'"'+":'"+ID+"'},");
			str.append("url:'../../../PersonReportInquiry/isPrint.do',");
			str.append("type:"+'"'+"post"+'"');
			str.append(" });");
			str.append("}");
			str.append("</SCRIPT>");
			str.append("</BODY>");
			str.append("<script>document.oncontextmenu = function(){return false;}</script>");
			str.append("</HTML>");
			pageCode = str.toString();
		} catch (Exception e1) {
			logger.info("页面字符替换失败！");
			logger.info(e1.getMessage());
		}
		
		String ftpPath = "/weblogic/file/credit2.0/html/"+ID;
		String path = PathUtil.getClassResources() + Const.FILEPATHFILE +ID;  //文件路径
		String fileName = ID+".html";
		
		PrintWriter out = null;
		try {
			File file = new File(path);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(path,fileName);
			
			if(!file.exists()){
				file.createNewFile();
			}
			out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"GBK")));
			out.write(pageCode);
			out.flush();
		} catch (IOException e) {
			logger.error(e.getMessage());
		}finally{
			out.close();
		}
		try{
//			new FileTool().upLoadFromProduction(pd.getString("IP"), Integer.parseInt(pd.getString("port")), pd.getString("LoginName"), pd.getString("LoginPass"), ftpPath, zipFileName,path+"/"+zipFileName);
			new FileTool().upLoadFromProduction("98.11.52.35", Integer.parseInt("21"), "weblogic", "123456", ftpPath, fileName,path+"/"+fileName);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		//删除本地文件
//		try{
//			Util.deleteDirectory(path);
//		}catch(Exception e){
//			logger.error("本地临时文件删除失败："+ID+e.getMessage(),e);
//		}
	}
	
	//更新信息表中状态
	@Transactional
	public void updateStatus(String flag,CrawlIndAppReManager indAppReService,String ID,String reportId){
		//更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
		try {
			PageData pd = new PageData();
			pd.put("ID", ID);
			pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("STATUS", flag);
			pd.put("REPORT_ID", reportId);
			//更新状态表
			indAppReService.updateCheck(pd);
			if("06".equals(flag)||"06"==flag){
				pd.put("IS_GET", "1");
				//indAppReService.insertSuccToInfo(pd);
			}else{
				pd.put("IS_GET", "0");
			}
			//更新明细表
			indAppReService.UpdateDetailCheck(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Transactional
	public void updateStatus(String flag,CrawlIndAppReManager indAppReService,String ID,String reportId,String user_code,String cardNum,String cardType){
		//更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
		try {
			PageData pd = new PageData();
			pd.put("ID", ID);
			pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("STATUS", flag);
			pd.put("REPORT_ID", reportId);
			pd.put("USER_CODE", user_code);
			pd.put("CARDNUM", cardNum);
			pd.put("CARDTYPE", cardType);
			//更新状态表
			indAppReService.updateCheck(pd);
			if("06".equals(flag)||"06"==flag){
				pd.put("IS_GET", "1");
//				indAppReService.insertSuccToInfo(pd);
			}else{
				pd.put("IS_GET", "0");
			}
			//更新明细表
			indAppReService.UpdateDetailCheck(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	private  PageData getTileInfo(List<Element> list) throws Exception{
		PageData pd = new PageData();
		for(int t=0;t<list.size();t++){
			List<Element> cols = list.get(t).select("TD,TH");
				if(cols.get(0).text().contains("报告编号")){
					String reportId = cols.get(0).text().substring(5);
					pd.put("REPORT_ID", reportId);
				}
				if(cols.get(0).text().contains("报告时间")){
					String reportTime = cols.get(0).text().substring(5);
					pd.put("REPORT_TIME", reportTime);
				}
		}
		return pd;
	}
		
}
