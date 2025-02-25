package com.dcits.credit.util.crawler.personCredit;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.WebDriver;

import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.PageData;

/**
 * 公共信息明细
 * @author zhangyy
 *
 */
public class PubInfoDetail {

	private static Logger logger = Logger.getLogger(PubInfoDetail.class);
	
	public void getPubInfoDetail(int startNum,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService){
		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str=="欠税记录"||str.equals("欠税记录")){
					//获取提示数据
					getInfo(eles,i,reportId,personCrawlerService,"PER_OWE_TAXES","欠税记录");
				}else if(str=="民事判决记录"||str.equals("民事判决记录")){
					//获取提示数据
					getJUDInfo(eles,i,reportId,personCrawlerService,"民事判决记录","0");
				}else if(str=="强制执行记录"||str.equals("强制执行记录")){
					//获取提示数据
					getJUDInfo(eles,i,reportId,personCrawlerService,"强制执行记录","1");
				}else if(str=="行政处罚记录"||str.equals("行政处罚记录")){
					//获取提示数据
					getInfo(eles,i,reportId,personCrawlerService,"PER_PENALTIES","行政处罚记录");
				}else if(str=="住房公积金参缴记录"||str.equals("住房公积金参缴记录")){
					//住房公积金信息入库
					getAccFund(reportId,eles,personCrawlerService,i);
				}else if(str=="养老保险金缴存记录"||str.equals("养老保险金缴存记录")){
					//养老保险缴存入库
					getPension(reportId,eles,personCrawlerService,i);
				}else if(str=="养老保险金发放记录"||str.equals("养老保险金发放记录")){
					//获取提示数据
					getInfo(eles,i,reportId,personCrawlerService,"PER_PENSIO_RELEASE","养老保险金发放记录");
				}else if(str=="低保救助记录"||str.equals("低保救助记录")){
					//获取提示数据
					getInfo(eles,i,reportId,personCrawlerService,"PER_LOW_SECURITY","低保救助记录");
				}else if(str=="执业资格记录"||str.equals("执业资格记录")){
					//获取提示数据
					getInfo(eles,i,reportId,personCrawlerService,"PER_QUALIFICATION","执业资格记录");
				}else if(str=="行政奖励记录"||str.equals("行政奖励记录")){
					//获取提示数据
					getInfo(eles,i,reportId,personCrawlerService,"PER_ADMINI_REWARD","行政奖励记录");
				}else if(str=="车辆交易和抵押记录"||str.equals("车辆交易和抵押记录")){
					//获取提示数据
					getInfo(eles,i,reportId,personCrawlerService,"PER_VEHICLE_TRANSACTION","车辆交易和抵押记录");
				}else if(str=="电信缴费记录"||str.equals("电信缴费记录")){
					//获取提示数据
					getInfo(eles,i,reportId,personCrawlerService,"PER_TEL_PAY","电信缴费记录");
				}else if(str.contains("查询记录")||str.contains("报告说明")){
					break;
				}
			}catch(Exception e1){
				logger.info("公共明细信息获取异常!");
				logger.error(e1.getMessage());
			}
		}
	}
	
	//获取table数据
	private void getInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService,String tableName,String name){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,name);
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		Map<String,String> map = new HashMap<String,String>();
		for(int i=0;i<listpd.size();i++){
			String sql = "INSERT INTO "+tableName;
			PageData pd = listpd.get(i);
			pd.put("REPORT_ID", reportId);
			//拼接sql
			String sqlKey="";
			String sqlValue="";
			Iterator iter = pd.keySet().iterator();
			while(iter.hasNext()){
				String key = (String) iter.next();
				sqlKey=sqlKey+key+",";
				sqlValue=sqlValue+"'"+pd.getString(key)+"',";
			}
			sqlKey = sqlKey.substring(0, sqlKey.length()-1);
			sqlValue = sqlValue.substring(0, sqlValue.length()-1);
			sql = sql+"( "+sqlKey+") VALUES ("+sqlValue+" )";
			//入库
			map.put("creatSql", sql);
			try {
				personCrawlerService.saveOtherDetailInfo(map);
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("信息入库失败！");
			}
		}
	}
	
	//获取民事判决/强制执行
	private void getJUDInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService,String name,String type){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_VERDICT",name);
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			listpd.get(i).put("TYPE", type);
			try {
				//入库
				personCrawlerService.saveJudgmentExecuteInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("民事判决/强制执行信息入库失败！");
			}
		}
	}
	
	//住房公积金信息入库
	private void getAccFund(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_PROVIDENT_FUND_PAY", "住房公积金参缴记录");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveAccFundInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("住房公积金信息入库失败！");
			}
		}
	}
	
	//养老保险信息入库
	private void getPension(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_PENSIO_PAY", "养老保险金缴存记录");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.savePensionInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("养老保险信息入库失败！");
			}
		}
	}
}
