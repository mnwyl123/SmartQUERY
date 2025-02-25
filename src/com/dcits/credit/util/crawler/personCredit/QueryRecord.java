package com.dcits.credit.util.crawler.personCredit;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.WebDriver;

import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.util.RandomNumber;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;

/**
 * 查询记录信息
 * @author zhangyy
 *
 */
public class QueryRecord {

	private static Logger logger = Logger.getLogger(QueryRecord.class);
	
	public void getQueryRecord(int startNum,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService){

		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str=="查询记录汇总"||str.equals("查询记录汇总")){
					//查询记录汇总信息入库
					getQueryInfo(reportId,eles,personCrawlerService,i);
				}else if(str=="信贷审批查询记录明细"||str.equals("信贷审批查询记录明细")){
					//信贷审批查询记录信息入库
					getQueryDetailInfo(reportId,eles,personCrawlerService,i);
				}else if(str.contains("报告说明")){
					break;
				}
			}catch(Exception e1){
				logger.info("查询记录信息获取异常!");
				logger.error(e1.getMessage());
			}
		}
	}
	
	//查询记录汇总信息入库
	private void getQueryInfo(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_QUERY_SUMMARY", "查询记录汇总");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveQueryInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("查询汇总信息入库失败！");
			}
		}
	}
	
	//信贷审批查询记录信息入库
	private void getQueryDetailInfo(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_QUERY_DETAIL", "信贷审批查询记录明细");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveQueryDetailInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("查询汇总明细信息入库失败！");
			}
		}
	}
	
	//本人声明信息入库
	public void getDeclareObject(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start,String tableName,String name,String type){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName, name);
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			//String randomNum = RandomNumber.Create64Random();  //生成64位流水号
			listpd.get(i).put("SERIAL_NUMBER", UuidUtil.get32UUID());
			listpd.get(i).put("REPORT_ID", reportId);
			listpd.get(i).put("CART_TYPE", type);
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
