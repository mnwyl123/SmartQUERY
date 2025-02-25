package com.dcits.crawl.webdriver.crawler.personCredit;

import org.apache.log4j.Logger;

import com.dcits.platform.util.PageData;



public class WriteXmlReportUtil {
	private static Logger logger = Logger.getLogger(WriteXmlReportUtil.class);
	//被查询者
	public static String writeXmlReportUser(PageData pdIdentity) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		if(pdIdentity != null){
			for (Object obj: pdIdentity.keySet()){
				strBuf.append("<"+obj+">"+pdIdentity.getString(obj)+"</"+obj+">");
			}
		}
		return strBuf.toString();
	}
	//身份
	public static String writeXmlReportIdentity(PageData pdIdentity) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("<IdentInfAry type=\"array\"><Struct>");
		if(pdIdentity != null){
			for (Object obj: pdIdentity.keySet()){
				strBuf.append("<"+obj+">"+pdIdentity.getString(obj)+"</"+obj+">");
			}
		}
		strBuf.append("</Struct></IdentInfAry>");
		return strBuf.toString();
	}
	//配偶
	public static String writeXmlReportSpouse(PageData pdSpouse) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("<MrlInfAry type=\"array\"><Struct>");
		if(pdSpouse != null){
			for (Object obj: pdSpouse.keySet()){
				strBuf.append("<"+obj+">"+pdSpouse.getString(obj)+"</"+obj+">");
			}
		}
		strBuf.append("</Struct></MrlInfAry>");
		return strBuf.toString();
	}
	//居住
	public static String writeXmlReportLive(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("<Struct>");
		if(pd != null){
			for (Object obj: pd.keySet()){
				strBuf.append("<"+obj+">"+pd.getString(obj)+"</"+obj+">");
			}
		}
		strBuf.append("</Struct>");
		return strBuf.toString();
	}
	//职业
	public static String writeXmlReportCareer(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("<Struct>");
		if(pd != null){
			for (Object obj: pd.keySet()){
				strBuf.append("<"+obj+">"+pd.getString(obj)+"</"+obj+">");
			}
		}
		strBuf.append("</Struct>");
		return strBuf.toString();
	}
	//提示
	public static String writeXmlReportInfoTip(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("<Struct>");
		if(pd != null){
			for (Object obj: pd.keySet()){
				strBuf.append("<"+obj+">"+pd.getString(obj)+"</"+obj+">");
			}
		}
		strBuf.append("</Struct>");
		return strBuf.toString();
	}
	//被追偿
	public static String writeXmlReportRecover(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("<Struct>");
		if(pd != null){
			for (Object obj: pd.keySet()){
				strBuf.append("<"+obj+">"+pd.getString(obj)+"</"+obj+">");
			}
		}
		strBuf.append("</Struct>");
		return strBuf.toString();
	}
	//呆账等公共方法
	public static String writeXmlReportPublic(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		if(pd != null){
			for (Object obj: pd.keySet()){
				strBuf.append("<"+obj+">"+pd.getString(obj)+"</"+obj+">");
			}
		}
		return strBuf.toString();
	}
	//逾期
	public static String writeXmlReportOverdue(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("<Struct>");
		if(pd != null){
			for (Object obj: pd.keySet()){
				strBuf.append("<"+obj+">"+pd.getString(obj)+"</"+obj+">");
			}
		}
		strBuf.append("</Struct>");
		return strBuf.toString();
	}
	//相关还款责任
	public static String writeXmlReportLoanRepayer(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("<Struct>");
		if(pd != null){
			for (Object obj: pd.keySet()){
				strBuf.append("<"+obj+">"+pd.getString(obj)+"</"+obj+">");
			}
		}
		strBuf.append("</Struct>");
		return strBuf.toString();
	}
	//被追偿
	public static String writeXmlReportAssets(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		if(pd != null){
			for (Object obj: pd.keySet()){
				strBuf.append("<"+obj+">"+pd.getString(obj)+"</"+obj+">");
			}
		}
		
		return strBuf.toString();
	}
	//贷款贷记卡准贷记卡
	public static String writeXmlReportLoan(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		if(pd != null){
			for (Object obj: pd.keySet()){
				strBuf.append("<"+obj+">"+pd.getString(obj)+"</"+obj+">");
			}
		}
		return strBuf.toString();
	}
}
