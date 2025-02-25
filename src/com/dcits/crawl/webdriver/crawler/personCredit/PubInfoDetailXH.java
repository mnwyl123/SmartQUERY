package com.dcits.crawl.webdriver.crawler.personCredit;


import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.nodes.Element;

import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.PageData;


/**
 * 公共信息明细
 * @author zhangyy
 *
 */
public class PubInfoDetailXH {

	private static Logger logger = Logger.getLogger(PubInfoDetail.class);
	
	public String getPubInfoDetail(int startNum,Element eles,String reportId,PersonCrawlerManager personCrawlerService){
		int no = 0;
		String xml = "";
		String xml1 = "";
		String xml2 = "";
		String xml3 = "";
		String xml4 = "";
		String xml5 = "";
		String xml6 = "";
		String xml7 = "";
		String xml8 = "";
		List<Element> elen = eles.getElementsByClass("t2");
		for(int i=0;i<elen.size();i++){
			Element ele = elen.get(i);
			String str = ele.text().trim().substring(3);
			try{
				if(str=="欠税记录"||str.equals("欠税记录")){
					//获取提示数据
					no = 1;
					xml1 = getPerOweTaxesx(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="民事判决记录"||str.equals("民事判决记录")){
					//获取提示数据
					no = 2;
					xml2 = getPerVerdict(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="强制执行记录"||str.equals("强制执行记录")){
					//获取提示数据
					no = 3;
					xml3 = getPerInforce(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="行政处罚记录"||str.equals("行政处罚记录")){
					//获取提示数据
					no = 4;
					xml4 = getPerPenalties(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="住房公积金参缴记录"||str.equals("住房公积金参缴记录")){
					//住房公积金信息入库
					no = 5;
					xml5 = getAccFund(no,reportId,eles,personCrawlerService,startNum-1);
				}
				else if(str=="低保救助记录"||str.equals("低保救助记录")){
					//获取提示数据
					no = 6;
					xml6 = getLowSecurity(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="执业资格记录"||str.equals("执业资格记录")){
					//获取提示数据
					no = 7;
					xml7 = getQualification(no,reportId,eles,personCrawlerService,startNum-1);
				}else if(str=="行政奖励记录"||str.equals("行政奖励记录")){
					//获取提示数据
					no = 8;
					xml8 = getAdminiReward(no,reportId,eles,personCrawlerService,startNum-1);
				}
				else if(str.contains("查询记录")||str.contains("报告说明")){
					break;
				}
			}catch(Exception e1){
				logger.info("公共明细信息获取异常!");
				logger.error(e1.getMessage());
			}
		}
		xml = xml1+xml2+xml3+xml4+xml5+xml6+xml7+xml8;
		return xml;
	}
	
	//住房公积金信息入库
	private String getAccFund(int no,String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		String xml = "";
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_PROVIDENT_FUND_PAY", "住房公积金参缴记录");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<HoFndPymtInfAry>"
		+xml
		+"</HoFndPymtInfAry>";
	}
	
	//欠税信息入库
	private void getPerOweTaxes(int no,String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_OWE_TAXES", "欠税记录");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
		}
	}
	
	//欠税信息XML
	private String getPerOweTaxesx(int no,String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		String xml = "";
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_OWE_TAXES", "欠税记录");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<OweTaxRcrdInfAry>"
		+xml
		+"</OweTaxRcrdInfAry>";
	}
	
	//民事判决信息入库
	private String getPerVerdict(int no,String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		String xml = "";
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_VERDICT", "民事判决记录");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<CivilJudgeInfAry>"
		+xml
		+"</CivilJudgeInfAry>";
	}
	
	//强制执行信息入库
	private String getPerInforce(int no,String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		String xml = "";
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_INFORCE", "强制执行记录");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<FrceExcsInfAry>"
		+xml
		+"</FrceExcsInfAry>";
	}
	
	//行政处罚记录信息入库
	private String getPerPenalties(int no,String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		String xml = "";
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_PENALTIES", "行政处罚记录");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<AdminPnlInfAry>"
		+xml
		+"</AdminPnlInfAry>";
	}

	//低保救助记录信息入库
	private String getLowSecurity(int no,String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		String xml = "";
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_LOW_SECURITY", "低保救助记录");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<SalvInfAry>"
		+xml
		+"</SalvInfAry>";
	}
	
	//执业资格记录信息入库
	private String getQualification(int no,String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		String xml = "";
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_QUALIFICATION", "执业资格记录");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<OprtQualInfAry>"
		+xml
		+"</OprtQualInfAry>";
	}
	//行政奖励记录信息入库
	private String getAdminiReward(int no,String reportId,Element eles,PersonCrawlerManager personCrawlerService,int start){
		String xml = "";
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH("PER_ADMINI_REWARD", "行政奖励记录");
		List<PageData> listpd = new GetWebDataXH().getWebInfoPublicDetail(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", reportId);
		}
		return "<AwrdRcrdInfAry>"
		+xml
		+"</AwrdRcrdInfAry>";
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
