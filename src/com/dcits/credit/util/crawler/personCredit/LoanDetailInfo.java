package com.dcits.credit.util.crawler.personCredit;


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

import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.util.RandomNumber;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;

/**
 * 信贷交易明细
 * @author zhangyy
 *
 */
public class LoanDetailInfo {

	private static Logger logger = Logger.getLogger(LoanDetailInfo.class);
	
	public void getLoanDetailInfo(int startNum,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService){
		int count = 0;
		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str.length()>3 && !"".equals(str)){
					if(str.substring(3)=="资产处置信息"||str.substring(3).equals("资产处置信息")){
						//获取提示数据
						getInfo(eles,i,reportId,personCrawlerService,"资产处置信息","0");
						count++;
					}else if(str.substring(3)=="保证人代偿信息"||str.substring(3).equals("保证人代偿信息")){
						//获取提示数据
						getInfo(eles,i,reportId,personCrawlerService,"保证人代偿信息","1");
						count++;
					}else if(str.substring(3)=="贷款"||str.substring(3).equals("贷款")){
						//提取贷款信息数据
						getLoanInfo(reportId,eles,personCrawlerService,i);
						count++;
					}else if(str.substring(3)=="贷记卡"||str.substring(3).equals("贷记卡")){
						//提取贷记卡信息数据
						getCreditInfo(reportId,eles,personCrawlerService,i);
						count++;
					}else if(str.substring(3)=="准贷记卡"||str.substring(3).equals("准贷记卡")){
						//提取准贷记卡信息数据
						getQCreditInfo(reportId,eles,personCrawlerService,i);
						count++;
					}else if(str=="对外担保信息"||str.equals("对外担保信息")){
						//获取提示数据
						getGuaranteeInfo(eles,i,reportId,personCrawlerService);
						count++;
					}else if(str=="对外信用卡担保信息"||str.equals("对外信用卡担保信息")){
						//获取提示数据
						getCreditGuaranteeInfo(eles,i,reportId,personCrawlerService);
						count++;
					}else if(count==7||str.contains("公共信息明细")||str.contains("查询记录")||str.contains("报告说明")){
						break;
					}
				}
			}catch(Exception e){
				logger.info("信贷交易明细信息获取异常!");
				logger.info(e.getMessage());
			}
		}
	}
	
	//获取table数据
	private void getInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService,String tableName,String type){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_ASSETS_DISPOSAL",tableName);
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			listpd.get(i).put("INFO_TYPE", type);
			//入库
			try {
				personCrawlerService.saveAssertAsInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("资产处置/保证人代偿信息入库失败");
			}
		}
	}
	//获取对外担保数据
	private void getGuaranteeInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_EXTERNAL_GUARANTEE_DETAIL","对外担保信息");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			//入库
			try {
				personCrawlerService.saveGuaranteeInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("对外担保信息入库失败");
			}
		}
	}
	
	//获取对外信用卡担保数据
	private void getCreditGuaranteeInfo(List<Element> eles,int start,String reportId,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_EXTERNAL_GUARANTEE_DETAIL","对外信用卡担保信息");
		List<PageData> listpd = new GetWebData().getWebInfo(eles, start, fields);
		for(int i=0;i<listpd.size();i++){
			listpd.get(i).put("REPORT_ID", reportId);
			//入库
			try {
				personCrawlerService.saveCreditGuaranteeInfo(listpd.get(i));
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("对外信用卡担保信息入库失败");
			}
		}
	}
		
	//提取贷款信息数据，并插入到数据库
	private void getLoanInfo(String reportId,List<Element> eles,PersonCrawlerManager personCrawlerService,int start){
		for(int i=start;i<eles.size();i++){
			String str = eles.get(i).text().trim();
			try{
				if(str.length()>0 && !"".equals(str)){
					//String randomNum = RandomNumber.Create64Random();  //生成64位流水号
					PageData pd = new PageData();
					pd.put("REPORT_ID", reportId);
					pd.put("SERIAL_NUMBER", UuidUtil.get32UUID());
					pd.put("CART_TYPE", "0");
					//对str用正则提取其中的数据
					pd = getLoanRegExInfo(pd,eles.get(i).text());
					if(pd.get("SERIAL")!=null){
						//读取配置文件
						Map<String,String> fields = ReadXmlUtil.readXml("PER_LOAN_DETAIL","贷款交易信息明细");
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
							//将数据插入贷款明细表
							personCrawlerService.saveLoanInfo(pd);
						} catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("贷款交易明细信息入库失败！");
						}
						try{
							//向逾期记录表、
							for(int j=0;j<listpd.size();j++){
								pd.putAll(listpd.get(j));
								if(pd.get("OVER_MONTH")!=null){
									personCrawlerService.saveOverdueInfo(pd);
								}
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("逾期记录信息信息入库失败！");
						}
						try{
							//向本人声明异议表共表中
							if(pd.get("ORG_DES")!=null||pd.get("OWNER_DECLARE")!=null||pd.get("OBJECTIONS")!=null){
								personCrawlerService.saveDeclareObjectInfo(pd);
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("本人声明等信息入库失败！");
						}
						i++;
					}
					if(str.contains("贷记卡")||str.contains("准贷记卡")||str.contains("公共信息明细")||str.contains("担保信息")){
						break;
					}
				}
			}catch(Exception e1){
				logger.info("贷款详情获取异常!");
				logger.error(e1.getMessage());
			}
		}
	}
	
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
							//向逾期记录表
							for(int j=0;j<listpd.size();j++){
								pd.putAll(listpd.get(j));
								if(pd.get("OVER_MONTH")!=null){
									personCrawlerService.saveOverdueInfo(pd);
								}
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("逾期记录信息信息入库失败！");
						}
						try{
							//向本人声明异议表共表中
							if(pd.get("ORG_DES")!=null||pd.get("OWNER_DECLARE")!=null||pd.get("OBJECTIONS")!=null){
								personCrawlerService.saveDeclareObjectInfo(pd);
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
								pd.putAll(listpd.get(j));
								if(pd.get("OVER_MONTH")!=null){
									personCrawlerService.saveOverdueInfo(pd);
								}
							}
						}catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("逾期记录信息信息入库失败！");
						}
						try{
							//向本人声明异议表共表中
							if(pd.get("ORG_DES")!=null||pd.get("OWNER_DECLARE")!=null||pd.get("OBJECTIONS")!=null){
								personCrawlerService.saveDeclareObjectInfo(pd);
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
		// 正则表达式规则
		String regEx="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(\\d*)期，(.*)，(\\d{4})年(\\d*)月(\\d*)日到期。截至(\\d{4})年(\\d*)月(\\d*)日";
		String regEx1="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(.*)，(\\d{4})年(\\d*)月(\\d*)日到期。截至(\\d{4})年(\\d*)月(\\d*)日";
		String regEx2="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(\\d*)期，(.*)。截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”";
		String regEx3="(\\d*).(\\d{4})年(\\d*)月(\\d*)日(.*)“(.*)”发放的(.*)元（(.*)）(.*)，业务号(.*)，(.*)，(.*)。截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”";
		
		boolean flag = true;
		boolean fg = true;
		if(str.contains("不定期归还")||str.contains("一次性")){
			flag = false;
		}
		if(str.contains("账户状态")){
			fg = false;
		}
		if(!flag){
			regEx = regEx1;
			if(!fg){
				regEx = regEx3;
			}
		}else if(!fg){
			regEx = regEx2;
		}
		
		// 编译正则表达式
	    Pattern pattern = Pattern.compile(regEx);
	    try{
	    	 Matcher matcher = pattern.matcher(str);
	 	    matcher.find();
	 	    pd.put("SERIAL", matcher.group(1));
	 	    pd.put("LOANS_DATE", matcher.group(2)+"年"+matcher.group(3)+"月"+matcher.group(4)+"日");
	 	    if(matcher.group(6).length()<3){
	 	    	pd.put("LOANS_ORG", "0");
	 	    }else{
	 	    	pd.put("LOANS_ORG", "1");
	 	    }
	 	    
	 	    pd.put("LOANS_AMOUNT", matcher.group(7));
	 	    pd.put("CURRENCYTYPE", matcher.group(8));
	 	    pd.put("LOANS_USE", matcher.group(9));
	 	    pd.put("BUSSID", matcher.group(10));
	 	    pd.put("VOUCHTYPE", matcher.group(11));
	 	    if(flag){
	 	    	if(fg){
	 	    		pd.put("REPAY_NUM", matcher.group(12));
	 		 	    pd.put("REPAY_TYPE", matcher.group(13));
	 		 	    pd.put("EXPIRY_DATE", matcher.group(14)+"年"+matcher.group(15)+"月"+matcher.group(16)+"日");
	 		 	    pd.put("STOP_DATE", matcher.group(17)+"年"+matcher.group(18)+"月"+matcher.group(19)+"日");
	 	    	}else{
	 	    		pd.put("REPAY_NUM", matcher.group(12));
	 		 	    pd.put("REPAY_TYPE", matcher.group(13));
	 		 	    pd.put("STOP_DATE", matcher.group(14)+"年"+matcher.group(15)+"月"+matcher.group(16)+"日");
	 		 	    pd.put("ACC_STATUS", matcher.group(17));
	 	    	}
	 	    	
	 	    }else{
	 	    	if(fg){
	 	    		pd.put("REPAY_TYPE", matcher.group(12));
	 		 	    pd.put("EXPIRY_DATE", matcher.group(13)+"年"+matcher.group(14)+"月"+matcher.group(15)+"日");
	 		 	    pd.put("STOP_DATE", matcher.group(16)+"年"+matcher.group(17)+"月"+matcher.group(18)+"日");
	 	    	}else{
	 	    		pd.put("REPAY_TYPE", matcher.group(12));
	 		 	    pd.put("STOP_DATE", matcher.group(13)+"年"+matcher.group(14)+"月"+matcher.group(15)+"日");
	 		 	   pd.put("ACC_STATUS", matcher.group(16));
	 	    	}
	 	    }
	    }catch(Exception e){
	    	
	    }
	   
		return pd;
	}
	
	//贷记卡和准贷记卡正则提取信息
	private PageData getCreditRegExInfo(PageData pd,String str,boolean flag){
		
		// 正则表达式规则
		String regEx="(\\d*).(\\d{4})年(\\d*)月(\\d*)日.*商业银行“(.*)”发放的(.*)（(.*)），业务号(.*)，授信额度(.*)元，共享授信额度(.*)元，(.*)。截至(\\d{4})年(\\d*)月(\\d*)日，";
		
		// 正则表达式规则
		String regEx1="(\\d*).(\\d{4})年(\\d*)月(\\d*)日.*商业银行“(.*)”发放的(.*)（(.*)），业务号(.*)，授信额度(.*)元，共享授信额度(.*)元，(.*)，截至(\\d{4})年(\\d*)月(\\d*)日，账户状态为“(.*)”";

		if(str.contains("账户状态为")){
			regEx = regEx1;
		}
		// 编译正则表达式
	    Pattern pattern = Pattern.compile(regEx);
	    
	    Matcher matcher = pattern.matcher(str);
	    matcher.find();
	    //判断发起行
	    String org = "1";
	    if(matcher.group(5).length()<3){
		    org = "0";
		}
	    //判断账户类型
	    boolean isRMB = false;
	    if(matcher.group(7).contains("美元")){
	    	isRMB = true;
	    }
	    pd.put("SERIAL", matcher.group(1));
	    pd.put("CARDTYPE", matcher.group(6));
		pd.put("CURRENCYTYPE", matcher.group(7));
		pd.put("BUSSID", matcher.group(8));
		pd.put("VOUCHTYPE", matcher.group(11));
		//true:贷记卡；false：准贷记卡
		if(flag){
			pd.put("CR_REL_CARD_DATE", matcher.group(2)+"年"+matcher.group(3)+"月"+matcher.group(4)+"日");
			pd.put("CR_REL_CARD_ORG", org);
			
			if(isRMB){
				 pd.put("CR_CREDIT_SUM", matcher.group(9).replace("折合人民币", ""));
				 pd.put("CR_SHARE_CREDIT_SUM", matcher.group(10).replace("折合人民币", ""));
			}else{
				 pd.put("CR_CREDIT_SUM", matcher.group(9));
				 pd.put("CR_SHARE_CREDIT_SUM", matcher.group(10));
			}
		    pd.put("CR_STOP_DATE", matcher.group(12)+"年"+matcher.group(13)+"月"+matcher.group(14)+"日");
		    if(str.contains("账户状态为")){
		    	pd.put("CR_ACC_STATUS", matcher.group(15));
			}
		}else{
			pd.put("Q_CR_REL_CARD_DATE", matcher.group(2)+"年"+matcher.group(3)+"月"+matcher.group(4)+"日");
			pd.put("Q_CR_REL_CARD_ORG", org);
			if(isRMB){
				 pd.put("Q_CR_CREDIT_SUM", matcher.group(9).replace("折合人民币", ""));
				 pd.put("Q_CR_SHARE_CREDIT_SUM", matcher.group(10).replace("折合人民币", ""));
			}else{
				 pd.put("Q_CR_CREDIT_SUM", matcher.group(9));
				 pd.put("Q_CR_SHARE_CREDIT_SUM", matcher.group(10));
			}
		    pd.put("Q_CR_STOP_DATE", matcher.group(12)+"年"+matcher.group(13)+"月"+matcher.group(14)+"日");
		    if(str.contains("账户状态为")){
		    	pd.put("Q_CR_ACC_STATUS", matcher.group(15));
			}
		}
		return pd;
	}
}
