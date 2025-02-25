package com.dcits.credit.util.crawler.personCredit;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.PageData;

/**
 * 个人基本信息爬取
 * @author zhangyy
 *
 */
public class IdentityInfo {

	private static Logger logger = Logger.getLogger(IdentityInfo.class);
	
	//获取个人基本信息
	public void getIdentityInfo(PageData pd,int startNum,List<Element> eles,PersonCrawlerManager personCrawlerService){
		String reportId = pd.getString("REPORT_ID");
		int count = 0;
		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str=="身份信息"||str.equals("身份信息")){
					//用户身份信息提取并入库
					getIdentityInfo(eles,pd,personCrawlerService,i);
					count++;
				}else if(str=="配偶信息"||str.equals("配偶信息")){
					//配偶信息取并入库
					getSpouseInfo(eles,reportId,personCrawlerService,i);
					count++;
				}else if(str=="居住信息"||str.equals("居住信息")){
					//居住信息提取并入库
					getLiveInfo(eles,reportId,personCrawlerService,i);
					count++;
				}else if(str=="职业信息"||str.equals("职业信息")){
					//职业信息提取并入库
					getCareerInfo(eles,reportId,personCrawlerService,i);
					count++;
				}else if(count==4||str.contains("二 信息概要")){
					break;
				}
			}catch(Exception e){
				logger.info("个人基本信息获取异常!");
				logger.error(e.getMessage());
			}
		}
	}

	
	//提取用户身份信息，并存入数据库中
	private void getIdentityInfo(List<Element> eles,PageData data,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_BASIC", "身份信息");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		if(listpd.size()>0){
			data.putAll(listpd.get(0));
		}
		try {
			personCrawlerService.savePersonIdentity(data);
		} catch (Exception e) {
			logger.error(e.getMessage());
			logger.info("用户身份入库失败！");
		}
	}
	
	//提取配偶信息，并存入数据库中
	private void getSpouseInfo(List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_SPOU", "配偶信息");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveSpouInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("配偶信息入库失败！");
			}
		}
	}
	
	//提取居住信息，并存入数据库中
	private void getLiveInfo(List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_LIVE", "居住信息");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveLiveInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("居住信息入库失败！");
			}
		}
	}
	
	//提取职业信息，并存入数据库中
	private void getCareerInfo(List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_CAREER", "职业信息");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveCareerInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("职业信息入库失败！");
			}
		}
	}
}
