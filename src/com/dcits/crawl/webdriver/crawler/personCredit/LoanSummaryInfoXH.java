package com.dcits.crawl.webdriver.crawler.personCredit;


import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.nodes.Element;

import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.PageData;


/**
 * 信贷概要信息
 * @author zhangyy
 *
 */
public class LoanSummaryInfoXH {

	private static Logger logger = Logger.getLogger(LoanSummaryInfo.class);
	

	//信息概要
	public String getInfoSummary(int startNum,Element eles,String reportId,PersonCrawlerManager personCrawlerService){
		PageData pd = new PageData();
		pd.put("REPORT_ID", reportId);
		String xml = "";
		String xml1 = "";
		String xml2 = "";
		String xml3 = "";
		String xml4 = "";
		String xml5 = "";
		String xml6 = "";
		String xml7 = "";
		String xml8 = "";
		String xml9 = "";
		String xml10 = "";
		String xml11 = "";
		String xml12 = "";
		String xml13 = "";
		
		int count = 0;
		int no = 0;
		List<Element> elen = eles.getElementsByClass("t2");
		for(int i=0;i<elen.size();i++){
			Element ele = elen.get(i);
			String str2 = ele.text().trim();
			String str = str2.substring(3);
			try{
				if(str=="信贷交易信息提示"||str.equals("信贷交易信息提示")){
					//获取信用提示数据
					no = 1;
					xml1 = getInfoTipx(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "信贷交易信息提示", personCrawlerService);
					pd = getInfoTip(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "信贷交易信息提示", personCrawlerService);
					
					System.out.println("6"+xml1);
					count++;
				}else if(str=="信贷交易违约信息概要"||str.equals("信贷交易违约信息概要")){
					//获取
					no = 2;
					xml4 = getInfoOverduex(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "逾期（透支）信息汇总", personCrawlerService);
					pd = getInfoOverdue(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "逾期（透支）信息汇总", personCrawlerService);
					no = 21;
					xml2 = getRecoverx(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "被追偿信息汇总", personCrawlerService);
					pd = getRecover(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "被追偿信息汇总", personCrawlerService);
					System.out.println("7"+xml2);
					no = 22;
					xml3 = getInfox(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "呆账信息汇总");
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "呆账信息汇总");
					count++;
				}else if(str=="信贷交易授信及负债信息概要"||str.equals("信贷交易授信及负债信息概要")){
					//获取逾期及违约信息概要
					no = 3;
					xml5 = getInfox(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "非循环贷账户信息汇总");
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "非循环贷账户信息汇总");
					no = 4;
					xml8 = getInfox(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "贷记卡账户信息汇总");
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "贷记卡账户信息汇总");
					no = 31;
					xml6 = getInfox(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "循环额度下分账户信息汇总");
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "循环额度下分账户信息汇总");
					no = 32;
					xml7 = getInfox(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "循环贷账户信息汇总");
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "循环贷账户信息汇总");
					no = 33;
					xml9 = getInfox(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "准贷记卡账户信息汇总");
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "准贷记卡账户信息汇总");
					no = 34;
					xml10 = getLoanRepayerx(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "相关还款责任信息汇总", personCrawlerService);
					pd = getLoanRepayer(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "相关还款责任信息汇总", personCrawlerService);
					count++;
				}else if(str=="查询记录概要"||str.equals("查询记录概要")){
					//获取查询记录概要
					no = 5;
					xml13 = getInfoQuerySummaryx(no,pd,eles,startNum-1,"PER_QUERY_SUMMARY", "查询记录概要", personCrawlerService);
					pd = getInfoQuerySummary(no,pd,eles,startNum-1,"PER_QUERY_SUMMARY", "查询记录概要", personCrawlerService);
					count++;
				}else if(str=="个人信用报告“数字解读”"||str.equals("个人信用报告“数字解读”")){
					//获取数字解读
					no = 6;
					pd = getInfo(no,pd,eles,startNum-1,"PER_LOAN_SUMMARY", "数字解读");
					count++;
				}
				else if(str.contains("非信贷交易信息概要")){
					no = 7;
					xml11 = getAfterPayx(no,pd,eles,startNum-1,"PER_AFTER_PAY_OWE_INFO", "后付费业务欠费信息汇总", personCrawlerService);
					pd = getAfterPay(no,pd,eles,startNum-1,"PER_AFTER_PAY_OWE_INFO", "后付费业务欠费信息汇总", personCrawlerService);
					count++;
				}
				else if(str.contains("公共信息概要")){
					no = 8;
					xml12 = getPublicx(no,pd,eles,startNum-1,"PER_PUBLIC_SUMMARY_INFO", "公共信息汇总", personCrawlerService);
					pd = getPublic(no,pd,eles,startNum-1,"PER_PUBLIC_SUMMARY_INFO", "公共信息汇总", personCrawlerService);
					count++;
				}
				else if(str.contains("贷交易信息明细")||str.contains("共信息明细")){
					break;
				}
			}catch(Exception e){
				System.out.println("信息概要获取异常!");
				System.out.println(e.getMessage());
			}
		}
		//提取的所有数据插入到数据库中
		xml = xml1+xml2+xml3+xml4+xml5+xml6+xml7+xml8
				+xml9+xml10+xml11+xml12+xml13;
		return xml;
	}
	
	//获取table数据
	private PageData getInfo(int no,PageData pd,Element eles,int start,String tableName,String value){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		if(listpd.size()>0){
			pd.putAll(listpd.get(0));
		}
		return pd;
	}
	private String getInfox(int no,PageData pd,Element eles,int start,String tableName,String value){
		//读取配置文件
		String xml = "";
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		if(listpd.size()>0){
			try {
				xml = xml + WriteXmlReportUtil.writeXmlReportPublic(listpd.get(0));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			pd.putAll(listpd.get(0));
		}
		if(no==22){
			xml = xml;
		}else if(no==3){
			xml = "<Struct>"+xml+"</Struct>";
		}else if(no==31){
			xml = "<Struct>"+xml+"</Struct>";
		}else if(no==32){
			xml = "<Struct>"+xml+"</Struct>";
		}else if(no==4){
			xml = "<Struct>"+xml+"</Struct>";
		}else if(no==33){
			xml = "<Struct>"+xml+"</Struct>";
		}
		return xml;
	}
	
	//信贷交易信息提示
	private PageData getInfoTip(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveCreditTipInfo(listpd.get(i));
			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				System.out.println("信贷交易信息提示入库失败！");
			}
		}
		return pd;
	}
	private String getInfoTipx(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		String xml = "";
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + WriteXmlReportUtil.writeXmlReportInfoTip(listpd.get(i));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
		}
		return "<CrTxnInfAry><Struct><CrTxnTotAcctNum></CrTxnTotAcctNum><CrTxnBsnTpNum></CrTxnBsnTpNum><CrTxnHintInfAry>"+xml+"</CrTxnHintInfAry>";
	}
	
	//逾期信息汇总
	private PageData getInfoOverdue(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveInfoOverdue(listpd.get(i));
			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				System.out.println("逾期信息汇总入库失败！");
			}
		}
		return pd;
	}
	private String getInfoOverduex(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		String xml = "";
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + WriteXmlReportUtil.writeXmlReportOverdue(listpd.get(i));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
		}
		return "<OdueSmryMsgAry>"+xml+"</OdueSmryMsgAry>";
	}
	
	//被追偿信息汇总
	private PageData getRecover(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveRecover(listpd.get(i));
			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				System.out.println("被追偿信息汇总入库失败！");
			}
		}
		return pd;
	}
	private String getRecoverx(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		String xml = "";
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		System.out.println("beisize:"+listpd.size());
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + WriteXmlReportUtil.writeXmlReportRecover(listpd.get(i));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
		}
		return "<RcvryBsnTpNum></RcvryBsnTpNum><RcvryTotAcctNum></RcvryTotAcctNum><RcvryTotBalAmt></RcvryTotBalAmt><RcvrySmryMsgAry>"+xml+"</RcvrySmryMsgAry>";
	}
	//相关还款责任信息汇总
	private PageData getLoanRepayer(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveLoanRepayer(listpd.get(i));
			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				System.out.println("相关还款责任信息汇总入库失败！");
			}
		}
		return pd;
	}
	private String getLoanRepayerx(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		String xml = "";
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + WriteXmlReportUtil.writeXmlReportLoanRepayer(listpd.get(i));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
		}
		return "<RlvRpymtNum></RlvRpymtNum><RlvRpymtSmryMsgAry>"+xml+"</RlvRpymtSmryMsgAry>";
	}
	//后付费汇总
	private PageData getAfterPay(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.saveAfterPay(listpd.get(i));
			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				System.out.println("后付费汇总入库失败！");
			}
		}
		return pd;
	}
	private String getAfterPayx(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		String xml = "";
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
		}
		return "<NoCrTxnInfAry><Struct><AfPymtBsnTpNum></AfPymtBsnTpNum><AfPymtBsnArgInfAry>"
		+xml
		+"</AfPymtBsnArgInfAry></Struct></NoCrTxnInfAry>";
	}
	
	//公共信息概要
	private PageData getPublic(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
			try {
				personCrawlerService.savePublic(listpd.get(i));
			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				System.out.println("公共信息概要入库失败！");
			}
		}
		return pd;
	}
	private String getPublicx(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		String xml = "";
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			try {
				xml = xml + "<Struct>"+WriteXmlReportUtil.writeXmlReportPublic(listpd.get(i))+"</Struct>";
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			listpd.get(i).put("REPORT_ID", pd.getString("REPORT_ID"));
		}
		return "<PblcInfAry><Struct><PblcInfTpNum></PblcInfTpNum><PblcSmryMsgAry>"
		+xml
		+"</PblcSmryMsgAry></Struct></PblcInfAry>";
	}
	
	//查询记录概要
	private PageData getInfoQuerySummary(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		if(listpd.size()>0){
			pd.putAll(listpd.get(0));
		}
		try {
			personCrawlerService.saveInfoQuerySummary(pd);
		} catch (Exception e) {
//			System.out.println(e.getMessage());
//			System.out.println("查询记录概要入库失败！");
		}
//		LR_QUERY_TIME LR_QUERY_ORG_CODE LR_QUERY_ORG_REASON
		return pd;
	}
	private String getInfoQuerySummaryx(int no,PageData pd,Element eles,int start,String tableName,String value, PersonCrawlerManager personCrawlerService){
		//读取配置文件
		String xml = "";
		Map<String,String> fields = ReadXmlUtil.readXmlXH(tableName,value);
		List<PageData> listpd = new GetWebDataXH().getWebInfoSummary(no, eles, start, fields);
		if(listpd.size()>0){
			try {
				xml = xml +WriteXmlReportUtil.writeXmlReportPublic(listpd.get(0));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			pd.putAll(listpd.get(0));
		}
		return "<QryInfAry><Struct>"
		+xml
		+"</Struct></QryInfAry>";
	}
}
