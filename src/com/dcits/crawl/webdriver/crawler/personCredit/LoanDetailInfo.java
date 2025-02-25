package com.dcits.crawl.webdriver.crawler.personCredit;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.WebDriver;

import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.UuidUtil;

/**
 * 信贷交易明细
 * @author zhangyy
 *
 */
public class LoanDetailInfo {

	private static Logger logger = Logger.getLogger(LoanDetailInfo.class);
	
	public void getLoanDetailInfo(int startNum,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService,String queryReson){
		int count = 0;
		int no = 0;
		for(int i=startNum-1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str.length()>3 && !"".equals(str)){
//					if(str.substring(3)=="资产处置信息"||str.substring(3).equals("资产处置信息")){
//						//获取提示数据
//						getInfo(eles,i,reportId,personCrawlerService,"资产处置信息","0");
//						count++;
//					}else if(str.substring(3)=="保证人代偿信息"||str.substring(3).equals("保证人代偿信息")){
//						//获取提示数据
//						getInfo(eles,i,reportId,personCrawlerService,"保证人代偿信息","1");
//						count++;
//					}
					if(str.substring(3)=="非循环贷账户"||str.substring(3).equals("非循环贷账户")){
						no = 1;
						getLoanInfo(no,eles,startNum-1,reportId,personCrawlerService);
						count++;
					}
					else if(str.substring(3)=="贷记卡账户"||str.substring(3).equals("贷记卡账户")){
						no = 2;
						getCreditInfo2(no,eles,startNum-1,reportId,personCrawlerService);
						count++;
					}
					else if(str.substring(3)=="被追偿信息"||str.substring(3).equals("被追偿信息")){
						no = 3;
						getAssetsDisposal(no,eles,startNum-1,reportId,personCrawlerService);
						count++;
//						COMPANY_NAME RECEIVE_DATE AGGREGATE_AMOUNT
					}
					else if(str.substring(3)=="循环额度下分账户"||str.substring(3).equals("循环额度下分账户")){
						no = 4;
						getLoanInfo(no,eles,startNum-1,reportId,personCrawlerService);
						count++;
					}
					else if(str.substring(3)=="循环贷账户"||str.substring(3).equals("循环贷账户")){
						no = 5;
						getLoanInfo(no,eles,startNum-1,reportId,personCrawlerService);
						count++;
					}
					else if(str.substring(3)=="准贷记卡账户"||str.substring(3).equals("准贷记卡账户")){
						no = 6;
						getQCreditInfo2(no,eles,startNum-1,reportId,personCrawlerService);
						count++;
//						Q_CR_REL_CARD_ORG BUSSID Q_CR_REL_CARD_DATE Q_CR_CREDIT_SUM Q_CR_SHARE_CREDIT_SUM CURRENCYTYPE VOUCHTYPE
					}
					else if(str.substring(3)=="相关还款责任信息"||str.substring(3).equals("相关还款责任信息")){
						no = 7;
						getPerRepayer(no,eles,startNum-1,reportId,personCrawlerService);
						count++;
					}
					else if(str.substring(3)=="授信协议信息"||str.substring(3).equals("授信协议信息")){
						no = 8;
						getCredBase(no,eles,startNum-1,reportId,personCrawlerService);
//						BUSS_ORG_CODE CRED_QUOTA_USE CRED_QUOTA CRED_LIMIT EXPI_DATE
//						CRED_LIMIT_NUM CRED_SIGN CURRENCY EFFE_DATE USED_QUOTA
						count++;
					}
//					else if(str.substring(3)=="准贷记卡"||str.substring(3).equals("准贷记卡")){
//						//提取准贷记卡信息数据
//						getQCreditInfo(reportId,eles,personCrawlerService,i);
//						count++;
//					}else if(str=="对外贷款担保信息"||str.equals("对外贷款担保信息")){
//						//获取提示数据
//						getGuaranteeInfo(eles,i,reportId,personCrawlerService);
//						count++;
//					}else if(str=="对外信用卡担保信息"||str.equals("对外信用卡担保信息")){
//						//获取提示数据
//						getCreditGuaranteeInfo(eles,i,reportId,personCrawlerService);
//						count++;
//					}
					else if(str.contains("非信贷交易信息明细")||str.contains("公共信息明细")||str.contains("查询记录")||str.contains("报告说明")){
						break;
					}
				}
			}catch(Exception e){
				logger.info("信贷交易明细信息获取异常!");
				logger.info(e.getMessage());
			}
		}
	}
	//非信贷交易信息明细
	public void getNotLoanDetailInfo(int startNum,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService,String queryReson){
		int count = 0;
		int no = 0;
		for(int i=startNum-1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str.length()>3 && !"".equals(str)){
					if(str=="后付费记录"||str.equals("后付费记录")){
						//提取后付费记录信息数据
						no = 1;
						getAfterPayInfo(no,eles,startNum-1,reportId,personCrawlerService);
						count++;
					}
					else if(count==1||str.contains("公共信息明细")||str.contains("查询记录")||str.contains("报告说明")){
						break;
					}
				}
			}catch(Exception e){
				logger.info("后付费记录信息获取异常!");
				logger.info(e.getMessage());
			}
		}
	}
	
//	//获取table数据
//	private void getInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService,String tableName,String type){
//		//读取配置文件
//		Map<String,String> fields = ReadXmlUtil.readXml("PER_ASSETS_DISPOSAL",tableName);
//		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
//		for(int i=0;i<listpd.size();i++){
//			listpd.get(i).put("REPORT_ID", reportId);
//			listpd.get(i).put("INFO_TYPE", type);
//			//入库
//			try {
//				personCrawlerService.saveAssertAsInfo(listpd.get(i));
//			} catch (Exception e) {
//				logger.error(e.getMessage());
//				logger.info("资产处置/保证人代偿信息入库失败");
//			}
//		}
//	}
//	//获取对外担保数据
//	private void getGuaranteeInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
//		//读取配置文件
//		Map<String,String> fields = ReadXmlUtil.readXml("PER_EXTERNAL_GUARANTEE_DETAIL","对外担保信息");
//		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
//		for(int i=0;i<listpd.size();i++){
//			listpd.get(i).put("REPORT_ID", reportId);
//			//入库
//			try {
//				personCrawlerService.saveGuaranteeInfo(listpd.get(i));
//			} catch (Exception e) {
//				logger.error(e.getMessage());
//				logger.info("对外担保信息入库失败");
//			}
//		}
//	}
//	
//	//获取对外信用卡担保数据
//	private void getCreditGuaranteeInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
//		//读取配置文件
//		Map<String,String> fields = ReadXmlUtil.readXml("PER_EXTERNAL_GUARANTEE_DETAIL","对外信用卡担保信息");
//		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
//		for(int i=0;i<listpd.size();i++){
//			listpd.get(i).put("REPORT_ID", reportId);
//			//入库
//			try {
//				personCrawlerService.saveCreditGuaranteeInfo(listpd.get(i));
//			} catch (Exception e) {
//				logger.error(e.getMessage());
//				logger.info("对外信用卡担保信息入库失败");
//			}
//		}
//	}
	
	//提取后付费记录信息数据
	private void getAfterPayInfo(int no,List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_AFTER_PAY_INFO","后付费记录");
		List<PageData> listpd = new GetWebData().getAfterPayInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveAfterPayInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("后付费记录信息入库失败！");
			}
		}
	}	
	//提取贷款信息数据
	private void getLoanInfo(int no,List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_LOAN_DETAIL","贷款交易信息明细");
		List<List<PageData>> listListPd = new GetWebData().getWebInfoLoan(no, eles, start, fields);
		for(int i=0;i<listListPd.size();i++){
			for(int j=0;j<listListPd.get(i).size();j++){
				if(j==0){
					listListPd.get(i).get(j).put("REPORT_ID", reportId);
					//入库
					try {
						personCrawlerService.saveLoanInfo(listListPd.get(i).get(j));
					} catch (Exception e) {
						logger.error(e.getMessage());
						logger.info("贷款交易明细信息入库失败");
					}
				}else{
					listListPd.get(i).get(j).put("REPORT_ID", reportId);
					//入库
					try {
						personCrawlerService.save5YearInfo(listListPd.get(i).get(j));
					} catch (Exception e) {
						logger.error(e.getMessage());
						logger.info("贷款交易明细5年信息入库失败");
					}
				}
			}
		}
	}
	//提取贷记卡数据
	private void getCreditInfo2(int no,List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_CREDIT_DETAIL","贷记卡交易信息明细");
		System.out.println("wgx"+fields.size());
		List<List<PageData>> listListPd = new GetWebData().getWebInfoLoan(no, eles, start, fields);
		for(int i=0;i<listListPd.size();i++){
			for(int j=0;j<listListPd.get(i).size();j++){
				if(j==0){
					listListPd.get(i).get(j).put("REPORT_ID", reportId);
					//入库
					try {
						personCrawlerService.saveCreditInfo(listListPd.get(i).get(j));
					} catch (Exception e) {
						logger.error(e.getMessage());
						logger.info("贷记卡交易明细信息入库失败");
					}
				}else{
					listListPd.get(i).get(j).put("REPORT_ID", reportId);
					//入库
					try {
						personCrawlerService.save5YearInfo(listListPd.get(i).get(j));
					} catch (Exception e) {
						logger.error(e.getMessage());
						logger.info("贷记卡交易明细5年信息入库失败");
					}
				}
			}
		}
	}
	//提取准贷记卡数据
	private void getQCreditInfo2(int no,List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_Q_CREDIT_DETAIL","准贷记卡交易信息明细");
		List<List<PageData>> listListPd = new GetWebData().getWebInfoLoan(no, eles, start, fields);
		for(int i=0;i<listListPd.size();i++){
			for(int j=0;j<listListPd.get(i).size();j++){
				if(j==0){
					listListPd.get(i).get(j).put("REPORT_ID", reportId);
					//入库
					try {
						personCrawlerService.saveQCreditInfo(listListPd.get(i).get(j));
					} catch (Exception e) {
						logger.error(e.getMessage());
						logger.info("准贷记卡交易明细信息入库失败");
					}
				}else{
					listListPd.get(i).get(j).put("REPORT_ID", reportId);
					//入库
					try {
						personCrawlerService.save5YearInfo(listListPd.get(i).get(j));
					} catch (Exception e) {
						logger.error(e.getMessage());
						logger.info("准贷记卡交易明细5年信息入库失败");
					}
				}
			}
		}
	}
	//被追偿信息明细
	private void getAssetsDisposal(int no,List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_ASSETS_DISPOSAL","被追偿信息明细");
		List<PageData> listpd = new GetWebData().getWebInfoAssetsDisposal(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveAssetsDisposal(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("被追偿信息明细入库失败！");
			}
		}
	}
	//相关还款责任明细
	private void getPerRepayer(int no,List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_REPAYER","相关还款责任明细");
		List<PageData> listpd = new GetWebData().getWebInfoPerRepayer(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.savePerRepayer(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("相关还款责任明细入库失败！");
			}
		}
	}
	//提取授信协议信息数据
	private void getCredBase(int no,List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_CRED_BASE_INFO","授信协议信息");
		List<PageData> listpd = new GetWebData().getWebInfoCredBase(no,eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			try {
				personCrawlerService.saveCredBase(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("授信协议信息入库失败！");
			}
		}
	}
		
//	//提取贷款信息数据，并插入到数据库
//	private void getLoanInfo(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start,String queryReson){
//		for(int i=start;i<eles.size();i++){
//			String str = eles.get(i).text().trim();
//			try{
//				if(str.length()>0 && !"".equals(str)){
//					//String randomNum = RandomNumber.Create64Random();  //生成64位流水号
//					PageData pd = new PageData();
//					pd.put("REPORT_ID", reportId);
//					pd.put("SERIAL_NUMBER", UuidUtil.get32UUID());
//					pd.put("CART_TYPE", "0");
//					
//					if("05".equals(queryReson)){
//						//对str用正则提取异议版数据
//						pd = getUnLoanRegExInfo(pd,eles.get(i).text());
//					}else{
//						//对str用正则提取其中的数据
//						pd = getLoanRegExInfo(pd,eles.get(i).text());
//					}
//					if(pd.get("SERIAL")!=null){
//						//读取配置文件
//						Map<String,String> fields = ReadXmlUtil.readXml("PER_LOAN_DETAIL","贷款交易信息明细");
//						List<PageData> listpd = new GetWebData().getWebInfoLoan(eles, start, fields);
//						if(listpd.size()>0){
//							pd.putAll(listpd.get(0));
//						}
////						Iterator iter = pd.keySet().iterator();
////						while(iter.hasNext()){
////							String ss = (String) iter.next();
////							System.out.println(ss+"++++"+pd.getString(ss));
////						}
//						//将数据插入到数据库中
//						try {
//							//将数据插入贷款明细表
//							personCrawlerService.saveLoanInfo(pd);
//						} catch (Exception e) {
//							logger.error(e.getMessage());
//							logger.info("贷款交易明细信息入库失败！");
//						}
//						try{
//							//向逾期记录表、
//							for(int j=0;j<listpd.size();j++){
//								PageData pd1 = new PageData();
//								pd1.putAll(listpd.get(j));
//								pd1.putAll(pd);
//								if(pd1.get("OVER_MONTH")!=null){
//									personCrawlerService.saveOverdueInfo(pd1);
//								}
//							}
//						}catch (Exception e) {
//							logger.error(e.getMessage());
//							logger.info("逾期记录信息信息入库失败！");
//						}
//						try{
//							//向特殊交易表、
//							for(int j=0;j<listpd.size();j++){
//								PageData pd1 = new PageData();
//								pd1.putAll(listpd.get(j));
//								pd1.putAll(pd);
//								if(pd1.get("SPECIAL_TRADE_TYPE")!=null){
//									personCrawlerService.saveSpecialTrade(pd1);
//								}
//							}
//						}catch (Exception e) {
//							logger.error(e.getMessage());
//							logger.info("特殊交易信息入库失败！");
//						}
//						try{
//							//向本人声明异议表共表中
//							/*if(pd.get("ORG_DES")!=null||pd.get("OWNER_DECLARE")!=null||pd.get("OBJECTIONS")!=null){
//								personCrawlerService.saveDeclareObjectInfo(pd);
//							}*/
//							for(int j=0;j<listpd.size();j++){
//								PageData pd1 = new PageData();
//								pd1.putAll(listpd.get(j));
//								pd1.putAll(pd);
//								if(pd1.get("INSTRUCTION")!=null||pd1.get("ADD_DATE")!=null){
//									personCrawlerService.saveDeclareObjectInfo(pd1);
//								}
//							}
//						}catch (Exception e) {
//							logger.error(e.getMessage());
//							logger.info("本人声明等信息入库失败！");
//						}
//						if("05".equals(queryReson)){
//							//异议版报告数据入库
//							try{
//								personCrawlerService.saveUnCommonInfo(pd);
//							}catch(Exception e){
//								logger.error("异议版报告机构代码/报文文件名称等信息入库失败"+e.getMessage(),e);
//							}
//						}
//						i++;
//					}
//					if(str.contains("贷记卡")||str.contains("准贷记卡")||str.contains("公共信息明细")||str.contains("担保信息")){
//						break;
//					}
//				}
//			}catch(Exception e1){
//				logger.info("贷款详情获取异常!");
//				logger.error(e1.getMessage());
//			}
//		}
//	}
	
	//提取贷记卡信息数据，并插入到数据库中
	private void getCreditInfo(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		for(int i=start;i<eles.size();i++){
			String str = eles.get(i).text().trim();
			try{
				if(str.length()>0 && !"".equals(str)){
					if(str.contains("商业银行“")){
						//String randomNum = RandomNumber.Create64Random();  //生成64位流水号
						PageData pd = new PageData();
						pd.put("REPORT_ID", reportId);
						pd.put("SERIAL_NUMBER", UuidUtil.get32UUID());
						pd.put("CART_TYPE", "1");
						//对str用正则提取其中的数据
						pd = getCreditRegExInfo(pd,str,true);
						//读取配置文件
						Map<String,String> fields = ReadXmlUtil.readXml("PER_CREDIT_DETAIL","贷记卡交易信息明细");
						List<PageData> listpd = new GetWebData().getWebInfo(eles, i, fields);
						if(listpd.size()>0){
							pd.putAll(listpd.get(0));
						}
//						Iterator iter = pd.keySet().iterator();
//						while(iter.hasNext()){
//							String ss = (String) iter.next();
//							System.out.println(ss+"++++"+pd.getString(ss));
//						}
						//将数据插入到数据库中
						try {
							//将数据插入贷款明细表、逾期记录表、本人声明异议表共三张表中
							personCrawlerService.saveCreditInfo(pd);
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("贷记卡交易明细信息入库失败！");
						}
						try{
							//向逾期记录表、
							for(int j=0;j<listpd.size();j++){
								PageData pd1 = new PageData();
								pd1.putAll(listpd.get(j));
								pd1.putAll(pd);
								if(pd1.get("OVER_MONTH")!=null){
									personCrawlerService.saveOverdueInfo(pd1);
								}
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("逾期记录信息信息入库失败！");
						}
						try{
							//向特殊交易表、
							for(int j=0;j<listpd.size();j++){
								PageData pd1 = new PageData();
								pd1.putAll(listpd.get(j));
								pd1.putAll(pd);
								if(pd1.get("SPECIAL_TRADE_TYPE")!=null){
									personCrawlerService.saveSpecialTrade(pd1);
								}
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("特殊交易信息入库失败！");
						}
						try{
							//向本人声明异议表共表中
							for(int j=0;j<listpd.size();j++){
								PageData pd1 = new PageData();
								pd1.putAll(listpd.get(j));
								pd1.putAll(pd);
								if(pd1.get("INSTRUCTION")!=null||pd1.get("ADD_DATE")!=null){
									personCrawlerService.saveDeclareObjectInfo(pd1);
								}
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("本人声明等信息入库失败！");
						}
						i++;
					}else if(str.contains("准贷记卡")||str.contains("公共信息明细")||str.contains("担保信息")){
						break;
					}
				}
			}catch(Exception e1){
				logger.info("贷记卡详情获取异常!");
				logger.error(e1.getMessage());
			}
		}
	}
	
	//提取准贷记卡信息数据，并插入到数据库中
	private void getQCreditInfo(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		for(int i=start;i<eles.size();i++){
			String str = eles.get(i).text().trim();
			try{
				if(str.length()>0 && !"".equals(str)){
					if(str.contains("商业银行“")){
						//String randomNum = RandomNumber.Create64Random();  //生成64位流水号
						PageData pd = new PageData();
						pd.put("REPORT_ID", reportId);
						pd.put("SERIAL_NUMBER", UuidUtil.get32UUID());
						pd.put("CART_TYPE", "2");
						//对str用正则提取其中的数据
						pd = getCreditRegExInfo(pd,str,false);
						//读取配置文件
						Map<String,String> fields = ReadXmlUtil.readXml("PER_Q_CREDIT_DETAIL","准贷记卡交易信息明细");
						List<PageData> listpd = new GetWebData().getWebInfo(eles, i, fields);
						if(listpd.size()>0){
							pd.putAll(listpd.get(0));
						}
//						Iterator iter = pd.keySet().iterator();
//						while(iter.hasNext()){
//							String ss = (String) iter.next();
//							System.out.println(ss+"++++"+pd.getString(ss));
//						}
						//将数据插入到数据库中
						try {
							//将数据插入贷款明细表、逾期记录表、本人声明异议表共三张表中
							personCrawlerService.saveQCreditInfo(pd);
						} catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("准贷记卡交易明细信息入库失败！");
						}
						try{
							//向逾期记录表
							for(int j=0;j<listpd.size();j++){
								PageData pd1 = new PageData();
								pd1.putAll(listpd.get(j));
								pd1.putAll(pd);
								if(pd1.get("OVER_MONTH")!=null){
									personCrawlerService.saveOverdueInfo(pd1);
								}
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("逾期记录信息信息入库失败！");
						}
						try{
							//向特殊交易表、
							for(int j=0;j<listpd.size();j++){
								PageData pd1 = new PageData();
								pd1.putAll(listpd.get(j));
								pd1.putAll(pd);
								if(pd1.get("SPECIAL_TRADE_TYPE")!=null){
									personCrawlerService.saveSpecialTrade(pd1);
								}
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("特殊交易信息入库失败！");
						}
						try{
							//向本人声明异议表共表中
							for(int j=0;j<listpd.size();j++){
								PageData pd1 = new PageData();
								pd1.putAll(listpd.get(j));
								pd1.putAll(pd);
								if(pd1.get("INSTRUCTION")!=null||pd1.get("ADD_DATE")!=null){
									personCrawlerService.saveDeclareObjectInfo(pd1);
								}
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("本人声明等信息入库失败！");
						}
						i++;
					}else if(str.contains("公共信息明细")||str.contains("担保信息")){
						break;
					}
				}
			}catch(Exception e1){
				logger.info("准贷记卡详情获取异常!");
				logger.error(e1.getMessage());
			}
		}
	}
	
	//贷款正则提取信息
	private PageData getLoanRegExInfo(PageData pd,String str){
		// 正常版报告正则表达式规则
		String regEx="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(\\d*)期，(.*)，(\\d{4})年(\\d*)月(\\d*)日到期。截至(\\d{4})年(\\d*)月(\\d*)日";
		String regEx1="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(.*)，(\\d{4})年(\\d*)月(\\d*)日到期。截至(\\d{4})年(\\d*)月(\\d*)日";
		String regEx2="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(\\d*)期，(.*)。截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”";
		String regEx3="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(.*)。截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”";
		String regEx4="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(\\d*)期，(.*)，(\\d{4})年(\\d*)月(\\d*)日到期。截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”，余额为(.*)元";
		boolean flag = true;  //标记是否含有不定期归还
		boolean fg = true;   //标记是否含有账户状态
		boolean fgbal = true;  //标记是否含有余额
		
		if(str.contains("不定期归还")||str.contains("一次性")||str.contains("按其他方式归还")){
			flag = false;
		}
		if(str.contains("账户状态")){
			fg = false;
		}
		if(str.contains("余额")){
			fgbal = false;
		}
		if(!flag){
			regEx = regEx1;
			if(!fg){
				regEx = regEx3;
			}
		}else if(!fg){
			regEx = regEx2;
			if(!fgbal){
				regEx = regEx4;
			}
		}
		
		// 编译正则表达式
	    Pattern pattern = Pattern.compile(regEx);
	    try{
	    	Matcher matcher = pattern.matcher(str);
	 	    while(matcher.find()){
	 	    	pd.put("SERIAL", matcher.group(1));
		 	    pd.put("LOANS_DATE", matcher.group(2)+"年"+matcher.group(3)+"月"+matcher.group(4)+"日");
		 	    pd.put("BANK_TYPE", matcher.group(5));
		 	    pd.put("LOANS_ORG", matcher.group(6));
		 	    /*if(matcher.group(6).length()<3){
		 	    	pd.put("LOANS_ORG", matcher.group(6));
		 	    }else{
		 	    	pd.put("LOANS_ORG", matcher.group(6));
		 	    }*/
		 	    
		 	    pd.put("LOANS_AMOUNT", matcher.group(7));
		 	    if(matcher.group(8).contains("（包括商住两用")){
		 	    	try{
		 	    		pd.put("CURRENCYTYPE", matcher.group(8).split("）")[0]);
				 	    pd.put("LOANS_USE", matcher.group(8).split("）")[1]+"）"+matcher.group(9));
		 	    	}catch(Exception e){
		 	    		 pd.put("LOANS_USE", matcher.group(9));
		 	    	}
		 	    }else{
		 	    	pd.put("CURRENCYTYPE", matcher.group(8));
			 	    pd.put("LOANS_USE", matcher.group(9));
		 	    }
		 	    
		 	    pd.put("BUSSID", matcher.group(10));
		 	    pd.put("VOUCHTYPE", matcher.group(11));
		 	    //正常版报告
	 	    	if(flag){
		 	    	if(fg){  //regEx
		 	    		pd.put("REPAY_NUM", matcher.group(12));
		 		 	    pd.put("REPAY_TYPE", matcher.group(13));
		 		 	    pd.put("EXPIRY_DATE", matcher.group(14)+"年"+matcher.group(15)+"月"+matcher.group(16)+"日");
		 		 	    pd.put("STOP_DATE", matcher.group(17)+"年"+matcher.group(18)+"月"+matcher.group(19)+"日");
		 	    	}else{  //regEx2
		 	    		pd.put("REPAY_NUM", matcher.group(12));
		 		 	    pd.put("REPAY_TYPE", matcher.group(13));
		 		 	    pd.put("STOP_DATE", matcher.group(14)+"年"+matcher.group(15)+"月"+matcher.group(16)+"日");
		 		 	    pd.put("ACC_STATUS", matcher.group(17));
		 		 	    if(!fgbal){ //regEx4
		 		 	    	pd.put("EXPIRY_DATE", matcher.group(14)+"年"+matcher.group(15)+"月"+matcher.group(16)+"日");
		 		 	    	pd.put("STOP_DATE", matcher.group(17)+"年"+matcher.group(18)+"月"+matcher.group(19)+"日");
		 		 	    	pd.put("ACC_STATUS", matcher.group(20));
		 		 	    	pd.put("BALANCE", matcher.group(21));//余额
		 		 	    }
		 	    	}
		 	    	
		 	    }else{
		 	    	if(fg){ //regEx1
		 	    		pd.put("REPAY_TYPE", matcher.group(12));
		 		 	    pd.put("EXPIRY_DATE", matcher.group(13)+"年"+matcher.group(14)+"月"+matcher.group(15)+"日");
		 		 	    pd.put("STOP_DATE", matcher.group(16)+"年"+matcher.group(17)+"月"+matcher.group(18)+"日");
		 	    	}else{ //regEx3
		 	    		pd.put("REPAY_TYPE", matcher.group(12));
		 		 	    pd.put("STOP_DATE", matcher.group(13)+"年"+matcher.group(14)+"月"+matcher.group(15)+"日");
		 		 	   pd.put("ACC_STATUS", matcher.group(16));
		 	    	}
		 	    }
	 	    }
	    }catch(Exception e){
	    	logger.error(e.getMessage(),e);
	    }
		return pd;
	}
	
	//贷记卡和准贷记卡正则提取信息
	private PageData getCreditRegExInfo(PageData pd,String str,boolean flag){
		
		// 正则表达式规则
		String regEx="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)（(.*)），业务号(.*)，授信额度(.*)元，共享授信额度(.*)元，(.*)。截至(\\d{4})年(\\d*)月(\\d*)日，";
		
		// 正则表达式规则
		String regEx1="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)（(.*)），业务号(.*)，授信额度(.*)元，共享授信额度(.*)元，(.*)，截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”";
		String regEx2="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)（(.*)），业务号(.*)，授信额度(.*)元，共享授信额度(.*)元，(.*)。截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”，余额为(.*)元";
		if(str.contains("账户状态为")){
			regEx = regEx1;
			if(str.contains("余额")){
				regEx = regEx2;
			}
		}
		// 编译正则表达式
	    Pattern pattern = Pattern.compile(regEx);
	    
	    Matcher matcher = pattern.matcher(str);
	    matcher.find();
	    //判断发起行
	    /*String org = "1";
	    if(matcher.group(6).length()<3){
		    org = "0";
		}
	    org = matcher.group(6);*/
	    //判断账户类型
	    boolean isRMB = false;
	    if(!matcher.group(8).contains("人民币")){
	    	isRMB = true;
	    }
	    pd.put("SERIAL", matcher.group(1));
	    pd.put("BANK_TYPE", matcher.group(5));
	    pd.put("CARDTYPE", matcher.group(7));
		pd.put("CURRENCYTYPE", matcher.group(8));
		pd.put("BUSSID", matcher.group(9));
		pd.put("VOUCHTYPE", matcher.group(12));
		//true:贷记卡；false：准贷记卡
		if(flag){
			pd.put("CR_REL_CARD_DATE", matcher.group(2)+"年"+matcher.group(3)+"月"+matcher.group(4)+"日");
			pd.put("CR_REL_CARD_ORG", matcher.group(6));
			
			if(isRMB){
				 pd.put("CR_CREDIT_SUM", matcher.group(10).replace("折合人民币", ""));
				 pd.put("CR_SHARE_CREDIT_SUM", matcher.group(11).replace("折合人民币", ""));
			}else{
				 pd.put("CR_CREDIT_SUM", matcher.group(10));
				 pd.put("CR_SHARE_CREDIT_SUM", matcher.group(11));
			}
		    pd.put("CR_STOP_DATE", matcher.group(13)+"年"+matcher.group(14)+"月"+matcher.group(15)+"日");
		    if(str.contains("账户状态为")){
		    	pd.put("CR_ACC_STATUS", matcher.group(16));
			}
		    if(str.contains("余额")){
		    	pd.put("BALANCE", matcher.group(17));
			}
		}else{
			pd.put("Q_CR_REL_CARD_DATE", matcher.group(2)+"年"+matcher.group(3)+"月"+matcher.group(4)+"日");
			pd.put("Q_CR_REL_CARD_ORG", matcher.group(6));
			if(isRMB){
				 pd.put("Q_CR_CREDIT_SUM", matcher.group(10).replace("折合人民币", ""));
				 pd.put("Q_CR_SHARE_CREDIT_SUM", matcher.group(11).replace("折合人民币", ""));
			}else{
				 pd.put("Q_CR_CREDIT_SUM", matcher.group(10));
				 pd.put("Q_CR_SHARE_CREDIT_SUM", matcher.group(11));
			}
		    pd.put("Q_CR_STOP_DATE", matcher.group(13)+"年"+matcher.group(14)+"月"+matcher.group(15)+"日");
		    if(str.contains("账户状态为")){
		    	pd.put("Q_CR_ACC_STATUS", matcher.group(16));
			}
		    if(str.contains("余额")){
		    	pd.put("BALANCE", matcher.group(17));
			}
		}
		return pd;
	}
	//贷款正则提取信息异议版
	private PageData getUnLoanRegExInfo(PageData pd,String str){
		//异议版报告正则表达式规则
		String regEx="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(\\d*)期，(.*)，(\\d{4})年(\\d*)月(\\d*)日到期。贷款机构代码(.*),报文文件名称(.*)，信息更新日期(\\d{4})年(\\d*)月(\\d*)日。截至(\\d{4})年(\\d*)月(\\d*)日";
		String regEx6="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(.*)，(\\d{4})年(\\d*)月(\\d*)日到期。贷款机构代码(.*),报文文件名称(.*)，信息更新日期(\\d{4})年(\\d*)月(\\d*)日。截至(\\d{4})年(\\d*)月(\\d*)日";
		String regEx7="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(\\d*)期，(.*)。贷款机构代码(.*),报文文件名称(.*)，信息更新日期(\\d{4})年(\\d*)月(\\d*)日。截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”";
		String regEx8="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(.*)。贷款机构代码(.*),报文文件名称(.*)，信息更新日期(\\d{4})年(\\d*)月(\\d*)日。截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”";
		String regEx9="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(\\d*)期，(.*)，(\\d{4})年(\\d*)月(\\d*)日到期。贷款机构代码(.*),报文文件名称(.*)，信息更新日期(\\d{4})年(\\d*)月(\\d*)日。截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”，余额为(.*)元";
		
		boolean flag = true;  //标记是否含有不定期归还
		boolean fg = true;   //标记是否含有账户状态
		boolean fgbal = true;  //标记是否含有余额
		//异议报告
		if(str.contains("不定期归还")||str.contains("一次性")||str.contains("按其他方式归还")){
			flag = false;
		}
		if(str.contains("账户状态")){
			fg = false;
		}
		if(str.contains("余额")){
			fgbal = false;
		}
		if(!flag){
			regEx = regEx6;
			if(!fg){
				regEx = regEx8;
			}
		}else if(!fg){
			regEx = regEx7;
			if(!fgbal){
				regEx = regEx9;
			}
		}
		
		// 编译正则表达式
	    Pattern pattern = Pattern.compile(regEx);
	    try{
	    	Matcher matcher = pattern.matcher(str);
	 	    while(matcher.find()){
	 	    	pd.put("SERIAL", matcher.group(1));
		 	    pd.put("LOANS_DATE", matcher.group(2)+"年"+matcher.group(3)+"月"+matcher.group(4)+"日");
		 	    pd.put("BANK_TYPE", matcher.group(5));
		 	    pd.put("LOANS_ORG", matcher.group(6));
		 	    /*if(matcher.group(6).length()<3){
		 	    	pd.put("LOANS_ORG", matcher.group(6));
		 	    }else{
		 	    	pd.put("LOANS_ORG", matcher.group(6));
		 	    }*/
		 	    
		 	    pd.put("LOANS_AMOUNT", matcher.group(7));
		 	   if(matcher.group(8).contains("（包括商住两用")){
		 	    	try{
		 	    		pd.put("CURRENCYTYPE", matcher.group(8).split("）")[0]);
				 	    pd.put("LOANS_USE", matcher.group(8).split("）")[1]+"）"+matcher.group(9));
		 	    	}catch(Exception e){
		 	    		 pd.put("LOANS_USE", matcher.group(9));
		 	    	}
		 	    }else{
		 	    	pd.put("CURRENCYTYPE", matcher.group(8));
			 	    pd.put("LOANS_USE", matcher.group(9));
		 	    }
		 	    
		 	    pd.put("BUSSID", matcher.group(10));
		 	    pd.put("VOUCHTYPE", matcher.group(11));
		 	    //正常版报告
	 	    	if(flag){
		 	    	if(fg){  //regEx5
		 	    		pd.put("REPAY_NUM", matcher.group(12));
		 		 	    pd.put("REPAY_TYPE", matcher.group(13));
		 		 	    pd.put("EXPIRY_DATE", matcher.group(14)+"年"+matcher.group(15)+"月"+matcher.group(16)+"日");
		 		 	    pd.put("LOAN_ORG_CODE", matcher.group(17));
		 		 	    pd.put("REPORT_FILE_NAME", matcher.group(18));
		 		 	    pd.put("UPDATE_TIME", matcher.group(19)+"年"+matcher.group(20)+"月"+matcher.group(21)+"日");
		 		 	    pd.put("STOP_DATE", matcher.group(22)+"年"+matcher.group(23)+"月"+matcher.group(24)+"日");
		 	    	}else{//regEx7
		 	    		pd.put("REPAY_NUM", matcher.group(12));
		 		 	    pd.put("REPAY_TYPE", matcher.group(13));
		 		 	    pd.put("LOAN_ORG_CODE", matcher.group(14));
		 		 	    pd.put("REPORT_FILE_NAME", matcher.group(15));
		 		 	    pd.put("UPDATE_TIME", matcher.group(16)+"年"+matcher.group(17)+"月"+matcher.group(18)+"日");
		 		 	    pd.put("STOP_DATE", matcher.group(19)+"年"+matcher.group(20)+"月"+matcher.group(21)+"日");
		 		 	    pd.put("ACC_STATUS", matcher.group(22));
		 		 	    if(!fgbal){//regEx9
		 		 	    	pd.put("EXPIRY_DATE", matcher.group(14)+"年"+matcher.group(15)+"月"+matcher.group(16)+"日");
		 		 	    	pd.put("LOAN_ORG_CODE", matcher.group(17));
			 		 	    pd.put("REPORT_FILE_NAME", matcher.group(18));
			 		 	    pd.put("UPDATE_TIME", matcher.group(19)+"年"+matcher.group(20)+"月"+matcher.group(21)+"日");
		 		 	    	pd.put("STOP_DATE", matcher.group(22)+"年"+matcher.group(23)+"月"+matcher.group(24)+"日");
		 		 	    	pd.put("ACC_STATUS", matcher.group(25));
		 		 	    	pd.put("BALANCE", matcher.group(26));//余额
		 		 	    }
		 	    	}
		 	    }else{
		 	    	if(fg){//regEx6
		 	    		pd.put("REPAY_TYPE", matcher.group(12));
		 		 	    pd.put("EXPIRY_DATE", matcher.group(13)+"年"+matcher.group(14)+"月"+matcher.group(15)+"日");
		 		 	    pd.put("LOAN_ORG_CODE", matcher.group(16));
		 		 	    pd.put("REPORT_FILE_NAME", matcher.group(17));
		 		 	    pd.put("UPDATE_TIME", matcher.group(18)+"年"+matcher.group(19)+"月"+matcher.group(20)+"日");
		 		 	    pd.put("STOP_DATE", matcher.group(21)+"年"+matcher.group(22)+"月"+matcher.group(23)+"日");
		 	    	}else{//regEx8
		 	    		pd.put("REPAY_TYPE", matcher.group(12));
		 	    		pd.put("LOAN_ORG_CODE", matcher.group(13));
		 		 	    pd.put("REPORT_FILE_NAME", matcher.group(14));
		 		 	    pd.put("UPDATE_TIME", matcher.group(15)+"年"+matcher.group(16)+"月"+matcher.group(17)+"日");
		 		 	    pd.put("STOP_DATE", matcher.group(18)+"年"+matcher.group(19)+"月"+matcher.group(20)+"日");
		 		 	   pd.put("ACC_STATUS", matcher.group(21));
		 	    	}
		 	    }
	 	    }
	    }catch(Exception e){
	    	logger.error(e.getMessage(),e);
	    }
		return pd;
	}
}
