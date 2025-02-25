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
		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str.contains("（一） 信用提示")){
					//获取信用提示数据
					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "信用提示");
					count++;
				}else if(str.contains("个人信用报告“数字解读”")){
					//获取数字解读数据
					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "数字解读");
					count++;
				}else if(str.contains("（二） 逾期及违约信息概要")){
					//获取逾期及违约信息概要
					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "逾期及违约信息概要");
					count++;
				}else if(str.contains("逾期（透支）信息汇总")){
					//获取逾期（透支）信息汇总数据
					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "逾期（透支）信息汇总");
					count++;
				}else if(str.contains("未结清贷款信息汇总")){
					//获取未结清贷款信息汇总数据
					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "未结清贷款信息汇总");
					count++;
				}else if(str.contains("未销户贷记卡信息汇总")){
					//获取未销户贷记卡信息汇总数据
					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "未销户贷记卡信息汇总");
					count++;
				}else if(str.contains("未销户准贷记卡信息汇总")){
					//获取未销户准贷记卡信息汇总数据
					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "未销户准贷记卡信息汇总");
					count++;
				}else if(str.contains("对外担保信息汇总")){
					pd = getInfo(pd,eles,i,"PER_LOAN_SUMMARY", "对外担保信息汇总");
					count++;
				}else if(count==8||str.contains("信贷交易信息明细")||str.contains("公共信息明细")||str.contains("查询记录")){
					break;
				}
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
	private PageData getInfo(PageData pd,List<Element> eles,int start,String tableName,String value){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml(tableName,value);
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		if(listpd.size()>0){
			pd.putAll(listpd.get(0));
		}
		return pd;
	}
}
