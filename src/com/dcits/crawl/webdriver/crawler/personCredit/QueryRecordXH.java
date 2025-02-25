package com.dcits.crawl.webdriver.crawler.personCredit;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.WebDriver;

import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.crawl.util.UuidUtil;
import com.dcits.platform.util.PageData;


/**
 * 查询记录信息
 * @author zhangyy
 *
 */
public class QueryRecordXH {

	private static Logger logger = Logger.getLogger(QueryRecord.class);
	
	public String getQueryRecord(int startNum,Element eles,String reportId,PersonCrawlerManager personCrawlerService,String type){
		String xml = "";
		//查询记录信息入库
		xml = getQueryDetailInfo(reportId,eles,personCrawlerService,startNum);
		return xml;
	}
	
	
	//征信中心说明信息入库
	public void getCenterStatement(String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_STATEMENT", "征信中心说明");
		List<PageData> listpd = new GetWebDataXH().getWebInfoQueryDetail(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			listpd.get(i).put("INSTRUCTION_TYPE", "3");
			try {
				personCrawlerService.saveDeclareObjectInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("征信中心说明信息入库失败！");
			}
		}
	}
	//异议标注信息入库
	public void getStatement(String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_STATEMENT", "异议标注");
		List<PageData> listpd = new GetWebDataXH().getWebInfoQueryDetail(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			listpd.get(i).put("INSTRUCTION_TYPE", "2");
			try {
				personCrawlerService.saveDeclareObjectInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("异议标注信息入库失败！");
			}
		}
	}
	//信贷审批查询记录信息入库
	private String getQueryDetailInfo(String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		String xml = "";
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_QUERY_DETAIL", "信贷审批查询记录明细");
		List<PageData> listpd = new GetWebDataXH().getWebInfoQueryDetail(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<LoanQryRcrdInfAry>"
		+xml
		+"</LoanQryRcrdInfAry>";
	}
	
	//本人声明信息入库
	public void getDeclareObject(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start,String tableName,String name,String type,String instrType){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName, name);
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			//String randomNum = RandomNumber.Create64Random();  //生成64位流水号
			listpd.get(i).put("SERIAL_NUMBER", UuidUtil.get32UUID());
			listpd.get(i).put("REPORT_ID", reportId);
			listpd.get(i).put("CART_TYPE", type);
			listpd.get(i).put("INSTRUCTION_TYPE", instrType);
			try{
				//向本人声明异议中插入数据
				personCrawlerService.saveDeclareObjectInfo(listpd.get(i));
			}catch (Exception e) {
				logger.error(e.getMessage());
				if(type=="3"||type.equals("3")){
					logger.info("本人声明信息入库失败！");
				}else{
					logger.info("异议标注信息入库失败！");
				}
			}
		}
	}
}
