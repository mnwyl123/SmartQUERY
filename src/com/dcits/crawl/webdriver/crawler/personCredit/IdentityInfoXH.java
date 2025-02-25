package com.dcits.crawl.webdriver.crawler.personCredit;


import java.util.ArrayList;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.PageData;


/**
 * 个人基本信息爬取
 * @author zhangyy
 *
 */
public class IdentityInfoXH {

	private static Logger logger = Logger.getLogger(IdentityInfo.class);
	
	//获取个人基本信息
	public String getIdentityInfo(PageData pd,int startNum,Element elen,PersonCrawlerManager personCrawlerService){
		String reportId = pd.getString("REPORT_ID");
		int count = 0;
		String xml = "";
		String xml1 = "";
		String xml2 = "";
		String xml3 = "";
		String xml4 = "";
		List<Element> eles = elen.getElementsByClass("t2");
//		System.out.println("gereneles"+eles);
		for(int i=0;i<eles.size();i++){
			Element ele = eles.get(i);
//			System.out.println("gerenele"+ele);
			String str2 = ele.text().trim();
			String str = str2.substring(3);
			try{
				if(str=="身份信息"||str.equals("身份信息")){
//					System.out.println("身份信息"+str);
					//用户身份信息提取并入库
					xml1 = getIdentityInfo(elen,pd,personCrawlerService,startNum-1);
					count++;
				}else if(str=="配偶信息"||str.equals("配偶信息")){
					//配偶信息提取并入库
					xml2 = getSpouseInfo(elen,reportId,personCrawlerService,startNum-1);
					count++;
				}else if(str=="居住信息"||str.equals("居住信息")){
					//居住信息提取并入库
					xml3 = getLiveInfo(elen,reportId,personCrawlerService,startNum-1);
					count++;
				}else if(str=="职业信息"||str.equals("职业信息")){
					//职业信息提取并入库
					xml4 = getCareerInfo(elen,reportId,personCrawlerService,startNum-1);
					count++;
				}else if(count==4||str.contains("概要")){
					break;
				}
			}catch(Exception e){
				System.out.println("个人基本信息获取异常!");
				System.out.println(e.getMessage());
			}
		}
//		xml = xml2+xml3+xml4;
		xml = xml1+xml2+xml3+xml4;
		return xml;
		
	}
	
	//提取用户身份信息，并存入数据库中
	private String getIdentityInfo(Element eles,PageData data,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_BASIC", "身份信息");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPerBasic(eles, start, fields);
		String xml = "";
		if(listpd.size()>0){
			try {
				xml = WriteXmlReportUtil.writeXmlReportIdentity(listpd.get(0));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			data.putAll(listpd.get(0));
		}
		return xml;
	}
	
	//提取配偶信息，并存入数据库中
	private String getSpouseInfo(Element eles,String reportId,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_SPOU", "配偶信息");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPerSpou(eles, start, fields);
		String xml = "";
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + WriteXmlReportUtil.writeXmlReportSpouse(listpd.get(i));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
//			System.out.println("配偶信息字典后："+listpd.get(i));
		}
		return xml;
	}
	
	//提取居住信息，并存入数据库中
	private String getLiveInfo(Element eles,String reportId,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_LIVE", "居住信息");
		List<PageData> listpd = new GetWebDataXH().getWebInfoLive(eles, start, fields);
		String xml = "";
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + WriteXmlReportUtil.writeXmlReportLive(listpd.get(i));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<RsdInfAry type=\"array\">"+xml+"</RsdInfAry>";
	}
	
	//提取职业信息，并存入数据库中
	private String getCareerInfo(Element eles,String reportId,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_CAREER", "职业信息");
		List<PageData> listpd = new GetWebDataXH().getWebInfoCareer(eles, start, fields);
		String xml = "";
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + WriteXmlReportUtil.writeXmlReportCareer(listpd.get(i));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
			
		}
		return "<OcpInfAry type=\"array\">"+xml+"</OcpInfAry>";
	}
}
