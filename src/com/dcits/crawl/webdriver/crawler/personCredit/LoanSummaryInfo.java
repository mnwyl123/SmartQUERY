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
import com.dcits.platform.util.PageData;

/**
 * 信贷概要信息
 * @author zhangyy
 *
 */
public class LoanSummaryInfo {

	private static Logger logger = Logger.getLogger(LoanSummaryInfo.class);
	

	//信息概要
	public void getInfoSummary(int startNum,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService){
		PageData pd = new PageData();
		pd.put("REPORT_ID", reportId);
		int count = 0;
		int no = 0;
		for(int i=startNum-1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str2 = ele.text().trim();
			System.out.println("信息概要11"+str2);
			String str = str2.substring(3);
			try{
				if(str=="信贷交易信息提示"||str.equals("信贷交易信息提示")){
					//获取信用提示数据
					no = 1;
					pd = getInfoTip(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "信贷交易信息提示", personCrawlerService);
					count++;
				}else if(str=="信贷交易违约信息概要"||str.equals("信贷交易违约信息概要")){
					//获取
					no = 2;
//					ACCOUNT_TYPE ACC_SUM MONTH_CNT SINGLE_MONTH_MAX_AMOUNT MAX_MONTH_CNT
					pd = getInfoOverdue(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "逾期（透支）信息汇总", personCrawlerService);
					no = 21;
					pd = getRecover(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "被追偿信息汇总", personCrawlerService);
//					BALANCE BUSS_TYPE ACC_SUM
					no = 22;
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "呆账信息汇总");
//					BAD_DEBT_NUM BAD_DEBT_BALANCE
					count++;
				}else if(str=="信贷交易授信及负债信息概要"||str.equals("信贷交易授信及负债信息概要")){
					//获取逾期及违约信息概要
					no = 3;
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "非循环贷账户信息汇总");
//					NON_REV_ACC_SUM NON_REV_BALANCE NON_REV_CRED_SUM NON_REV_MANAGER_ORG_CNT NON_REV_REPAY_AVG6
					no = 4;
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "贷记卡账户信息汇总");
//					CIRC_QUO_ACC_SUM CIRC_QUO_BALANCE CIRC_QUO_CRED_SUM CIRC_QUO_MANA_ORG_CNT CIRC_QUO_REPAY_AVG6
					no = 31;
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "循环额度下分账户信息汇总");
//					CIRC_ACC_ACC_SUM CIRC_ACC_BALANCE CIRC_ACC_CRED_SUM CIRC_ACC_MANA_ORG_CNT CIRC_ACC_REPAY_AVG6
					no = 32;
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "循环贷账户信息汇总");
//					
					no = 33;
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "准贷记卡账户信息汇总");
					no = 34;
					pd = getLoanRepayer(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "相关还款责任信息汇总", personCrawlerService);
//					REPAY_TYPE ACC_SUM BORROWER_CATEGORY BALANCE REPAY_SUM
					count++;
				}else if(str=="查询记录概要"||str.equals("查询记录概要")){
					//获取逾期（透支）信息汇总数据
					no = 5;
					pd = getInfoQuerySummary(no,pd,eles,startNum-1,"PER_QUERY_SUMMARY", "查询记录概要", personCrawlerService);
					count++;
				}else if(str=="个人信用报告“数字解读”"||str.equals("个人信用报告“数字解读”")){
					//获取逾期（透支）信息汇总数据
					no = 6;
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "数字解读");
					count++;
				}
				else if(str.contains("非信贷交易信息概要")){
					no = 7;
					pd = getAfterPay(no,pd,eles,startNum-1,"PER_AFTER_PAY_OWE_INFO", "后付费业务欠费信息汇总", personCrawlerService);
					count++;
//					ARRE_ACC_NUM BUSS_TYPE ARRE_SUM
				}
				else if(str.contains("公共信息概要")){
					no = 8;
					pd = getPublic(no,pd,eles,startNum-1,"PER_PUBLIC_SUMMARY_INFO", "公共信息汇总", personCrawlerService);
					count++;
//					PUBLIC_INFO_TYPE RECORD_NUM INVOLVE_SUM
				}
//				else if(str.contains("未销户贷记卡信息汇总")){
//					//获取未销户贷记卡信息汇总数据
//					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "未销户贷记卡信息汇总");
//					count++;
//				}else if(str.contains("未销户准贷记卡信息汇总")){
//					//获取未销户准贷记卡信息汇总数据
//					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "未销户准贷记卡信息汇总");
//					count++;
//				}else if(str.contains("对外担保信息汇总")){
//					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "对外担保信息汇总");
//					count++;
//				}
				else if(str.contains("贷交易信息明细")||str.contains("共信息明细")){
					break;
				}
//				else if(count==8||str.contains("信贷交易信息明细")||str.contains("公共信息明细")||str.contains("查询记录")){
//					break;
//				}
			}catch(Exception e){
				logger.info("信息概要获取异常!");
				logger.error(e.getMessage());
			}
		}
		//提取的所有数据插入到数据库中
		try {
			personCrawlerService.saveCreditSumInfo(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			logger.info("信贷概要信息入库失败！");
		}
	}
	
	//获取table数据
	private PageData getInfo(int no,PageData pd,List<Element> eles,int start,String tableName,String value){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,value);
		List<PageData> listpd = new GetWebData().getWebInfoSummary(no, eles, start, fields);
		if(listpd.size()>0){
			pd.putAll(listpd.get(0));
		}
		return pd;
	}
	
	//信贷交易信息提示
	private PageData getInfoTip(int no,PageData pd,List<Element> eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,value);
		List<PageData> listpd = new GetWebData().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveCreditTipInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("信贷交易信息提示入库失败！");
			}
		}
		return pd;
	}
	
	//逾期信息汇总
	private PageData getInfoOverdue(int no,PageData pd,List<Element> eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,value);
		List<PageData> listpd = new GetWebData().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveInfoOverdue(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("逾期信息汇总入库失败！");
			}
		}
		return pd;
	}
	
	//被追偿信息汇总
	private PageData getRecover(int no,PageData pd,List<Element> eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,value);
		List<PageData> listpd = new GetWebData().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveRecover(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("被追偿信息汇总入库失败！");
			}
		}
		return pd;
	}
	//相关还款责任信息汇总
	private PageData getLoanRepayer(int no,PageData pd,List<Element> eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,value);
		List<PageData> listpd = new GetWebData().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveLoanRepayer(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("相关还款责任信息汇总入库失败！");
			}
		}
		return pd;
	}
	//后付费汇总
	private PageData getAfterPay(int no,PageData pd,List<Element> eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,value);
		List<PageData> listpd = new GetWebData().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveAfterPay(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("后付费汇总入库失败！");
			}
		}
		return pd;
	}
	
	//公共信息概要
	private PageData getPublic(int no,PageData pd,List<Element> eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,value);
		List<PageData> listpd = new GetWebData().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.savePublic(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("公共信息概要入库失败！");
			}
		}
		return pd;
	}
	
	//查询记录概要
	private PageData getInfoQuerySummary(int no,PageData pd,List<Element> eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,value);
		List<PageData> listpd = new GetWebData().getWebInfoSummary(no, eles, start, fields);
		if(listpd.size()>0){
			pd.putAll(listpd.get(0));
		}
		try {
			personCrawlerService.saveInfoQuerySummary(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			logger.info("查询记录概要入库失败！");
		}
//		LR_QUERY_TIME LR_QUERY_ORG_CODE LR_QUERY_ORG_REASON
		return pd;
	}
}
