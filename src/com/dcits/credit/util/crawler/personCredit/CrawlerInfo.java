package com.dcits.credit.util.crawler.personCredit;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.PasswordOper;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.MD5;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

/**
 * 信用报告中数据爬取
 * @author zhangyy
 *
 */
public class CrawlerInfo {

	private static Logger logger = Logger.getLogger(CrawlerInfo.class);
	
	public void crawlerInfo(WebDriver dr,PersonCrawlerManager personCrawlerService,IndAppReManager indAppReService,PageData serverInfo){
		String ID = serverInfo.getString("ID");
		
		Document document = Jsoup.parse(dr.getPageSource().replaceAll("　", "").replace(" ", ""));
		String reportId="";
		String flag ="05";  //06表示报告生成，05表示未查得
		//获取报告头体
		Element titles = document.getElementsByTag("TR").select("TR>TD>TABLE").first();
		List<Element> rows = titles.select("TR");
		PageData pd = getTileInfo(rows);
		
		//报告生成，则继续爬虫
		if(pd.get("REPORT_ID")!=null){  //表示查得信息
			flag = "06";
			reportId = pd.getString("REPORT_ID");
			//保存页面源码
			savePageCode(dr,serverInfo);
			
			List<Element> eles = document.getElementsByTag("TR");
			int secTableStartNum = 0;  //table开始
			int identityStartNum =0;   //基本信息开始
			int creditStartNum=0;    //信息概要开始
			int tradeStartNum=0;    //交易信息开始
			int pubInfoStartNum=0;    //公共信息开始
			int queryStartNum=0;      //查询记录开始
			int declareStartNum=0;   //本人声明开始
			int objectTagStartNum=0;    //异议标注开始
			for(int i=0;i<eles.size();i++){
				Element ele = eles.get(i);
				String str = ele.text().trim();
				if(str.length()>2 && !"".equals(str)){
					if(str.substring(1).trim()=="个人基本信息"||str.substring(1).trim().equals("个人基本信息")){
						identityStartNum=i;
					}else if(str.substring(1).trim()=="信息概要"||str.substring(1).trim().equals("信息概要")){
						creditStartNum=i;
					}else if(str.substring(1).trim()=="信贷交易信息明细"||str.substring(1).trim().equals("信贷交易信息明细")){
						tradeStartNum=i;
					}else if(str.substring(1).trim()=="公共信息明细"||str.substring(1).trim().equals("公共信息明细")){
						pubInfoStartNum=i;
					}else if(str.substring(1).trim()=="查询记录"||str.substring(1).trim().equals("查询记录")){
						queryStartNum=i;
					}else if(str.substring(1).trim()=="本人声明"||str.substring(1).trim().equals("本人声明")){
						declareStartNum=i;
					}else if(str.substring(1).trim()=="异议标注"||str.substring(1).trim().equals("异议标注")){
						objectTagStartNum=i;
					}else if(str.contains("报告时间:")){
						secTableStartNum=i;
					}else if(str.contains("报告说明")){
						break;
					}
				}
			}
			
			//查询报告信息
			//提取用户名、证件类型等信息,并将报告信息入库
			pd = getUserName(eles,secTableStartNum,pd,personCrawlerService);
			if(identityStartNum!=0){
				//获取个人基本信息
				new IdentityInfo().getIdentityInfo(pd,identityStartNum,eles,personCrawlerService);
			}else{
				try {
					personCrawlerService.savePersonIdentity(pd);
				} catch (Exception e) {
					logger.error(e.getMessage());
					logger.info("用户身份入库失败！");
				}
			}
			
			if(creditStartNum!=0){
				//获取信息概要
				new LoanSummaryInfo().getInfoSummary(creditStartNum,eles,reportId,personCrawlerService);
			}
			if(tradeStartNum!=0){
				//获取信贷交易明细信息
				new LoanDetailInfo().getLoanDetailInfo(tradeStartNum, eles, reportId,personCrawlerService);
			}
			if(pubInfoStartNum!=0){
				//获取公共信息明细
				new PubInfoDetail().getPubInfoDetail(pubInfoStartNum, eles, reportId,personCrawlerService);
			}
			if(queryStartNum!=0){
				//获取查询记录
				new QueryRecord().getQueryRecord(queryStartNum, eles, reportId,personCrawlerService);
			}
			if(declareStartNum!=0){
				//获取本人声明
				new QueryRecord().getDeclareObject(reportId, eles, personCrawlerService, declareStartNum,"PER_STATEMENT", "本人声明","3");
			}
			if(objectTagStartNum!=0){
				//获取异议标注
				new QueryRecord().getDeclareObject(reportId, eles, personCrawlerService, objectTagStartNum,"PER_STATEMENT", "异议标注","4");
			}
		}
		//更新信息表中状态(未查得/报告生成)
		updateStatus(flag,indAppReService,ID,reportId);
		dr.quit();
	}
	
	//获取报告头体
	private PageData getTileInfo(List<Element> list){
		PageData pd = new PageData();
		for(int t=0;t<list.size();t++){
			List<Element> cols = list.get(t).select("TD");
			for(int j=0;j<cols.size();j++){
				if(cols.get(j).text().contains("报告编号:")){
					String reportId = cols.get(j).text().substring(5);
					pd.put("REPORT_ID", reportId);
				}
				if(cols.get(j).text().contains("查询请求时间:")){
					String queryTime = cols.get(j).text().substring(7);
					pd.put("QUERY_TIME", queryTime);
				}
				if(cols.get(j).text().contains("报告时间:")){
					String reportTime = cols.get(j).text().substring(5);
					pd.put("REPORT_TIME", reportTime);
				}
			}
		}
		return pd;
	}
	
	
	//提取用户名、证件类型及证件号,并将报告信息入库
	@SuppressWarnings({ "unused", "unchecked" })
	private PageData getUserName(List<Element> eles ,int start,PageData data,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_QUERY_DETAIL", "查询信息");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		if(listpd.size()>0){
			PageData pd=listpd.get(0);
			//给校验列赋值
			String CHECK_CODE=pd.getString("CLIENT_NAME")+","+pd.getString("CREDENTIALS_TYPE")+","+pd.getString("CREDENTIALS_NO")+","+pd.getString("QUERY_OPERATOR")+","+pd.getString("QUERY_REASON");
			CHECK_CODE=MD5.md5(CHECK_CODE);
			pd.put("CHECK_CODE",CHECK_CODE);
			//data.putAll(listpd.get(0));
			data.putAll(pd);
		}
		try {
			personCrawlerService.saveReportInfo(data);
		} catch (Exception e) {
			logger.error(e.getMessage());
			logger.error("报告信息入库失败！");
		}
		return data;
	}

	//保存页面
	private void savePageCode(WebDriver dr,PageData pd){
		String ID = pd.getString("ID");
		String pageCode = dr.getPageSource();
		try {
			pageCode = pageCode.replaceAll(" ", "&nbsp;"); 
			pageCode = pageCode.replace("javascript:window.close()", "window.location.href=document.referrer;");
			pageCode = pageCode.replace("javascript:document.execCommand('print')", "printReport()");
			pageCode = pageCode.substring(0, pageCode.length()-14);
			StringBuffer str = new StringBuffer();
			str.append(pageCode);
			str.append("<script src="+'"'+"../../static/js/jquery-1.7.2.js"+'"'+"></script>");
			str.append("<SCRIPT>");
			str.append("function printReport(){");
			str.append(" javascript:document.execCommand('print');");
			str.append("$.ajax({");
			str.append("async:false,");
			str.append("cache:false,");
			str.append("data:{"+'"'+"ID"+'"'+":'"+ID+"'},");
			str.append("url:'../../PersonReportInquiry/isPrint.do',");
			str.append("type:"+'"'+"post"+'"');
			str.append(" });");
			str.append("}");
			str.append("</SCRIPT>");
			str.append("</BODY>");
			str.append("</HTML>");
			pageCode = str.toString();
		} catch (Exception e1) {
			logger.info("页面字符替换失败！");
			logger.info(e1.getMessage());
		}
		String ftpPath = pd.getString("ftpPath")+ID;
		String path = PathUtil.getClasspath() + Const.FILEPATHIMG +ID;  //文件路径
		String fileName = ID+".html";
		
		//addb by zz on 20170914
		String zipFileName=ID+".zip";
		String zipPasswd=ID.substring(0,6);
		
		//------
		
		try {
			File file = new File(path);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(path,fileName);
			
			if(!file.exists()){
				file.createNewFile();
			}
			PrintWriter out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"GBK")));
			out.write(pageCode);
			out.flush();
			out.close();
			//addb by zz on 20170915
//			logger.error("------------------"+path+"\\"+fileName);
//			logger.error("------------------"+path+"\\"+zipFileName);
//			logger.error("------------------"+zipPasswd);
			CompressUtils.zip(path+"\\"+fileName,path+"\\"+zipFileName,true,zipPasswd);
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
		try{
			new FileTool().upLoadFromProduction(pd.getString("IP"), Integer.parseInt(pd.getString("port")), pd.getString("LoginName"), pd.getString("LoginPass"), ftpPath, zipFileName,path+"/"+zipFileName);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}
	
	//更新信息表中状态
	@Transactional
	public void updateStatus(String flag,IndAppReManager indAppReService,String ID,String reportId){
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
			}else{
				pd.put("IS_GET", "0");
			}
			//更新明细表
			indAppReService.UpdateDetailCheck(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
		
}
