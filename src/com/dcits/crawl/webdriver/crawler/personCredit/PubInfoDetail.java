package com.dcits.crawl.webdriver.crawler.personCredit;


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

import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.PageData;

/**
 * 公共信息明细
 * @author zhangyy
 *
 */
public class PubInfoDetail {

	private static Logger logger = Logger.getLogger(PubInfoDetail.class);
	
	public void getPubInfoDetail(int startNum,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService){
		int no = 0;
		for(int i=startNum-1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim().substring(3);
			try{
				if(str=="欠税记录"||str.equals("欠税记录")){
					//获取提示数据
					no = 1;
					getPerOweTaxes(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="民事判决记录"||str.equals("民事判决记录")){
					//获取提示数据
					no = 2;
					getPerVerdict(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="强制执行记录"||str.equals("强制执行记录")){
					//获取提示数据
					no = 3;
					getPerInforce(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="行政处罚记录"||str.equals("行政处罚记录")){
					//获取提示数据
					no = 4;
					getPerPenalties(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="住房公积金参缴记录"||str.equals("住房公积金参缴记录")){
					//住房公积金信息入库
					no = 5;
					getAccFund(no,reportId,eles,personCrawlerService,startNum-1);
				}
//				else if(str=="养老保险金缴存记录"||str.equals("养老保险金缴存记录")){
//					//养老保险缴存入库
//					getPension(reportId,eles,personCrawlerService,i);
//				}else if(str=="养老保险金发放记录"||str.equals("养老保险金发放记录")){
//					//获取提示数据
//					getInfo(eles,i,reportId,personCrawlerService,"PER_PENSIO_RELEASE","养老保险金发放记录");
//				}
				else if(str=="低保救助记录"||str.equals("低保救助记录")){
					//获取提示数据
					no = 6;
					getLowSecurity(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="执业资格记录"||str.equals("执业资格记录")){
					//获取提示数据
					no = 7;
					getQualification(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="行政奖励记录"||str.equals("行政奖励记录")){
					//获取提示数据
					no = 8;
					getAdminiReward(no,reportId,eles,personCrawlerService,startNum-1);
				}
//				else if(str=="车辆交易和抵押记录"||str.equals("车辆交易和抵押记录")){
//					//获取提示数据
//					getInfo(eles,i,reportId,personCrawlerService,"PER_VEHICLE_TRANSACTION","车辆交易和抵押记录");
//				}else if(str=="电信缴费记录"||str.equals("电信缴费记录")){
//					//获取提示数据
//					getTelInfo(eles,i,reportId,personCrawlerService,"PER_TEL_PAY","电信缴费记录");
//				}
				/*else if(str.contains("最近24个月缴费记录")){
					//获取提示数据
					getInfo(eles,i,reportId,personCrawlerService,"PER_TEL_PAY","电信缴费记录");
				}*/
				else if(str.contains("查询记录")||str.contains("报告说明")){
					break;
				}
			}catch(Exception e1){
				logger.info("公共明细信息获取异常!");
				logger.error(e1.getMessage());
			}
		}
	}
	
//	//获取table数据
//	private void getInfo(int no,List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService,String tableName,String name){
//		//读取配置文件
//		Map<String,String> fields = ReadXmlUtil.readXml(tableName,name);
//		List<PageData> listpd = new GetWebData().getWebInfoPublicDetail(no,eles, start, fields);
//		Map<String,String> map = new HashMap<String,String>();
//		for(int i=0;i<listpd.size();i++){
//			String sql = "INSERT INTO "+tableName;
//			PageData pd = listpd.get(i);
//			pd.put("REPORT_ID", reportId);
//			//拼接sql
//			String sqlKey="";
//			String sqlValue="";
//			Iterator iter = pd.keySet().iterator();
//			while(iter.hasNext()){
//				String key = (String) iter.next();
//				sqlKey=sqlKey+key+",";
//				sqlValue=sqlValue+"'"+pd.getString(key)+"',";
//			}
//			sqlKey = sqlKey.substring(0, sqlKey.length()-1);
//			sqlValue = sqlValue.substring(0, sqlValue.length()-1);
//			sql = sql+"( "+sqlKey+") VALUES ("+sqlValue+" )";
//			//入库
//			map.put("creatSql", sql);
//			try {
//				personCrawlerService.saveOtherDetailInfo(map);
//			} catch (Exception e) {
//				logger.error(e.getMessage());
//				logger.info("信息入库失败！");
//			}
//		}
//	}
//	//获取电信缴费记录
//	private void getTelInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService,String tableName,String name){
//		//读取配置文件
//		Map<String,String> fields = ReadXmlUtil.readXml(tableName,name);
//		List<PageData> listpd = new GetWebData().getWebTelInfo(eles, start, fields);
//		Map<String,String> map = new HashMap<String,String>();
//		for(int i=0;i<listpd.size();i++){
//			String sql = "INSERT INTO "+tableName;
//			PageData pd = listpd.get(i);
//			pd.put("REPORT_ID", reportId);
//			//拼接sql
//			String sqlKey="";
//			String sqlValue="";
//			Iterator iter = pd.keySet().iterator();
//			while(iter.hasNext()){
//				String key = (String) iter.next();
//				sqlKey=sqlKey+key+",";
//				sqlValue=sqlValue+"'"+pd.getString(key)+"',";
//			}
//			sqlKey = sqlKey.substring(0, sqlKey.length()-1);
//			sqlValue = sqlValue.substring(0, sqlValue.length()-1);
//			sql = sql+"( "+sqlKey+") VALUES ("+sqlValue+" )";
//			//入库
//			map.put("creatSql", sql);
//			try {
//				personCrawlerService.saveOtherDetailInfo(map);
//			} catch (Exception e) {
//				logger.error(e.getMessage());
//				logger.info("信息入库失败！");
//			}
//		}
//	}
//	//获取民事判决/强制执行
//	private void getJUDInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService,String name,String type){
//		//读取配置文件
//		Map<String,String> fields = ReadXmlUtil.readXml("PER_VERDICT",name);
//		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
//		for(int i=0;i<listpd.size();i++){
//			listpd.get(i).put("REPORT_ID", reportId);
//			listpd.get(i).put("TYPE", type);
//			try {
//				//入库
//				personCrawlerService.saveJudgmentExecuteInfo(listpd.get(i));
//			} catch (Exception e) {
//				logger.error(e.getMessage());
//				logger.info("民事判决/强制执行信息入库失败！");
//			}
//		}
//	}
	
	//住房公积金信息入库
	private void getAccFund(int no,String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_PROVIDENT_FUND_PAY", "住房公积金参缴记录");
		List<PageData> listpd = new GetWebData().getWebInfoPublicDetail(no,eles, start, fields);
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
	
	//欠税信息入库
	private void getPerOweTaxes(int no,String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_OWE_TAXES", "欠税记录");
		List<PageData> listpd = new GetWebData().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.savePerOweTaxes(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("欠税信息入库失败！");
			}
		}
	}
	
	//民事判决信息入库
	private void getPerVerdict(int no,String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_VERDICT", "民事判决记录");
		List<PageData> listpd = new GetWebData().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.savePerVerdict(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("民事判决记录信息入库失败！");
			}
		}
	}
	
	//强制执行信息入库
	private void getPerInforce(int no,String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_INFORCE", "强制执行记录");
		List<PageData> listpd = new GetWebData().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.savePerInforce(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("强制执行记录信息入库失败！");
			}
		}
	}
	
	//行政处罚记录信息入库
	private void getPerPenalties(int no,String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_PENALTIES", "行政处罚记录");
		List<PageData> listpd = new GetWebData().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.savePerPenalties(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("行政处罚记录信息入库失败！");
			}
		}
	}

	//低保救助记录信息入库
	private void getLowSecurity(int no,String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_LOW_SECURITY", "低保救助记录");
		List<PageData> listpd = new GetWebData().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveLowSecurity(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("低保救助记录信息入库失败！");
			}
		}
	}
	
	//执业资格记录信息入库
	private void getQualification(int no,String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_QUALIFICATION", "执业资格记录");
		List<PageData> listpd = new GetWebData().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveQualification(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("执业资格记录信息入库失败！");
			}
		}
	}
	//行政奖励记录信息入库
	private void getAdminiReward(int no,String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_ADMINI_REWARD", "行政奖励记录");
		List<PageData> listpd = new GetWebData().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveAdminiReward(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("行政奖励记录信息入库失败！");
			}
		}
	}
	
//	getInfo(no,eles,i,reportId,personCrawlerService,"PER_LOW_SECURITY","低保救助记录");
//	getInfo(no,eles,i,reportId,personCrawlerService,"PER_QUALIFICATION","执业资格记录");
//	getInfo(no,eles,i,reportId,personCrawlerService,"PER_ADMINI_REWARD","行政奖励记录");
	
//	//养老保险信息入库
//	private void getPension(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
//		//读取配置文件
//		Map<String,String> fields = ReadXmlUtil.readXml("PER_PENSIO_PAY", "养老保险金缴存记录");
//		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
//		for(int i=0;i<listpd.size();i++){
//			listpd.get(i).put("REPORT_ID", reportId);
//			try {
//				personCrawlerService.savePensionInfo(listpd.get(i));
//			} catch (Exception e) {
//				logger.error(e.getMessage());
//				logger.info("养老保险信息入库失败！");
//			}
//		}
//	}
}
