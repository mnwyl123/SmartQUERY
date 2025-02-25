package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_1;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.UuidUtil;

/**
 * 信贷记录明细
 * @author zhangyy
 *
 */
public class DetailInfo {

	private static Logger logger = Logger.getLogger(DetailInfo.class);
	
	private Map<String, String> cookies = null;
	private Document doc = null;
	private PageData pd = null;
	private String reportId = null;
	private CompanyCrawlerManager companyCrawlerService = null;
	private List<Element> eles = null;
	public DetailInfo(Map<String, String> cook,Document document,PageData pd,String reportId,CompanyCrawlerManager companyCrawlerService,List<Element> eles){
		this.cookies = cook;
		this.doc = document;
		this.pd = pd;
		this.reportId = reportId;
		this.companyCrawlerService = companyCrawlerService;
		this.eles = eles;
	}
	//获取信贷记录明细信息
	public int getDetailInfo(int startNum,int numCount){
		int count = 0;
		for(int i=startNum;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().replace(String.valueOf((char)160), "").trim();
			try{
				if(str.contains("未结清业务")){
					numCount = getUnclearCreditInfo(i,numCount);
					count++;
				}else if(str.contains("已结清业务")){
					//调用方法，提取数据并入库
					numCount = getClearCreditInfo(i,numCount);
					count++;
				}else if(str.contains("对外担保记录")){
					//调用方法，提取数据并入库
					numCount = getGuaranteeInfo(i,numCount);
					count++;
				}else if(count==3||str.contains("公共记录明细")){
					break;
				}
			}catch(Exception e){
				logger.error(e.getMessage());
			}
		}
		return numCount;
	}
	
	//获取未结清业务信息，并入库
	private int getUnclearCreditInfo(int start,int numCount){
		//分为由资产管理公司处置的债务，担保及第三方，欠息，垫款，不良和违约类，关注类，正常类，正常类中的银行承兑汇票
		String settle = "0";   //未结清
		int count = 0;
		for(int i=start+1;i<eles.size();i++){
			String str = eles.get(i).text().replace(String.valueOf((char)160), "").trim();
			if(str.equals("由资产管理公司处置的债务")||str=="由资产管理公司处置的债务"){
				numCount = handleByComp(i,settle,numCount);
				count++;
			}else if(str.equals("担保及第三方代偿的债务")||str=="担保及第三方代偿的债务"){
				numCount = guaranteeInfo(i,settle,numCount);
				count++;
			}else if(str.equals("欠息")||str=="欠息"){
				numCount = lackInterInfo(i,settle,numCount);
				count++;
			}else if(str.equals("垫款")||str=="垫款"){
				numCount = advaPayInfo(i,settle,numCount);
				count++;
			}else if(str.equals("不良和违约类")||str=="不良和违约类"){
				numCount = TableInnerAndOuterInfo(i,settle,"03",numCount);
				count++;
			}else if(str.equals("关注类")||str=="关注类"){
				numCount = TableInnerAndOuterInfo(i,settle,"02",numCount);
				count++;
			}else if(str.equals("正常类")||str=="正常类"){
				numCount = TableInnerAndOuterInfo(i,settle,"01",numCount);
				count++;
			}else if(str.contains("对外担保记录")||str.contains("已结清业务")||str.contains("公共记录明细")||count==7){
				break;
			}
		}
		return numCount;
	}
	
	//获取已结清业务信息，并入库
	private int getClearCreditInfo(int start,int numCount){
		String settle = "1";   //已结清
		int count = 0;
		for(int i=start+1;i<eles.size();i++){
			
			String str = eles.get(i).text().replace(String.valueOf((char)160), "").trim();
			if(str.contains("对外担保记录")||str.contains("公共记录明细")||count==5){
				break;
			}
			if(str.equals("由资产管理公司处置的债务")||str=="由资产管理公司处置的债务"){
				numCount = handleByComp(i,settle,numCount);
				count++;
			}else if(str.equals("担保及第三方代偿的债务")||str=="担保及第三方代偿的债务"){
				numCount = guaranteeInfo(i,settle,numCount);
				count++;
			}else if(str.equals("欠息")||str=="欠息"){
				numCount = lackInterInfo(i,settle,numCount);
				count++;
			}else if(str.equals("垫款")||str=="垫款"){
				numCount = advaPayInfo(i,settle,numCount);
				count++;
			}else{
				numCount = TableInnerAndOuterInfo(i-1,settle,"01",numCount);
				count++;
				break;
			}
		}
		return numCount;
	}
	
	//获取对外担保明细信息，并入库
	private int getGuaranteeInfo(int start,int numCount){
		Map<String,String> map = new HashMap<String,String>();
		List<String> list = new ArrayList<String>();//记录第一列值，方便更新备注时使用
		String sql = "INSERT INTO COM_GUAR_DETAIL_INFO(REPORT_ID,SERIAL_NO,GUAR_TYPE,GUARANTOR,GUAR_CRED_TYPE,GUAR_CRED_NUM,GUAR_CURRENCY,GUAR_SUM,GUAR_STYLE,MAIN_BUSS,REMARKS)";
		String sqlV = "";
		int nextTable = 0;
		Map<Integer,String> listSerial = new HashMap<Integer,String>();
		//爬取数据
		for(int i=start+1;i<eles.size();i++){
			Element ee = eles.get(i);
			if(ee.hasText()){
				nextTable = i+1;
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					
					String str = rows.get(j).text().replace(String.valueOf((char)160), "").trim();
					String serial_no = UuidUtil.get32UUID();
					listSerial.put(j, serial_no);
					if(!str.contains("类型")&&!str.contains("被担保人")){
						List<Element> cols = rows.get(j).select("td");
						String sqlValue = "'"+reportId+"','"+serial_no+"',";
						//记录有备注的行
						str = cols.get(0).text().replace(String.valueOf((char)160), "").trim();
						if(str.contains("(")&&str.contains("")){
							list.add(str);
						}
						//拼接字段值
						for(int t=0;t<cols.size();t++){
							sqlValue = sqlValue+"'"+cols.get(t).text().replace(String.valueOf((char)160), "").trim()+"',";
						}
						sqlV = sqlV +" SELECT "+sqlValue+"' '"+" FROM DUAL UNION ALL";
					}
				}
				break;
			}
		}
		if(!"".equals(sqlV)){
			sql = sql+sqlV.substring(0, sqlV.length()-9);
			//入库
			map.put("creatSql", sql);
			try {
				companyCrawlerService.saveInfo(map);
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("信息入库失败！");
			}
		}
		
		//更新表，添加备注
		if(list.size()>0){
			Element ee = eles.get(nextTable);
			if(ee.hasText()){
				sql = "UPDATE COM_GUAR_DETAIL_INFO SET REMARKS=";
				Map<String,String> result = getRemarksInfo(ee);
				Set<String> iter = result.keySet();
				for(String it:iter){
					String str = result.get(it);
					for(int i=0;i<list.size();i++){
						if(list.get(i).contains(it)){
							 //更新数据库
						    sql=sql+"'"+str+"' WHERE REPORT_ID='"+reportId+" AND GUAR_TYPE='"+list.get(i)+"'" ;
						    try{
						    	//入库
								map.put("updateSql", sql);
								companyCrawlerService.updateInfo(map);
						    }catch(Exception e){
						    	logger.info("信息表更新失败!");
						    	logger.error(e.getMessage());
						    }
							break;
						}
					}
				}
			}
		}
		if(nextTable>0){
			//解析弹出框
			numCount = new BombBoxAnalyze().onClickWindow(doc, cookies, eles.get(nextTable-1), reportId, listSerial, companyCrawlerService, "B","","", numCount, pd);
		}
		return numCount;
	}
	
	//由资产管理公司处置的债务
	private int handleByComp(int start,String settle,int numCount){
		String sql = "INSERT INTO COM_ASSET_DISP_DEBT_DETAIL(REPORT_ID,SERIAL_NO,DISP_ORG,CURRENCY,ORIG_AMOUNT,REC_DATE,BALANCE,LAST_DISP_DATE,SETTLE_STATUS,REMARKS)";
		if(settle=="1"||"1".equals(settle)){
			sql = "INSERT INTO COM_ASSET_DISP_DEBT_DETAIL(REPORT_ID,SERIAL_NO,DISP_ORG,CURRENCY,ORIG_AMOUNT,REC_DATE,LAST_DISP_DATE,SETTLE_STATUS,REMARKS)";
		}
		String sqlU = "UPDATE COM_ASSET_DISP_DEBT_DETAIL SET REMARKS=";
		numCount = getInfoToDataBase(start,settle,"处置机构","币种","DISP_ORG",sql,sqlU,"",numCount);
		return numCount;
	}
	//担保及第三方代偿的债务
	private int guaranteeInfo(int start,String settle,int numCount){
		String sql = "INSERT INTO COM_GUAR_COMP_DETAIL(REPORT_ID,SERIAL_NO,COMP_ORG,LAST_COMP_DATE,TATAL_COMP_SUM,COMP_BALANCE,LAST_REPAY_DATE,ORIG_GUSS,SETTLE_STATUS,REMARKS)";
		if(settle=="1"||"1".equals(settle)){
			sql = "INSERT INTO COM_GUAR_COMP_DETAIL(REPORT_ID,SERIAL_NO,COMP_ORG,LAST_COMP_DATE,TATAL_COMP_SUM,LAST_REPAY_DATE,ORIG_GUSS,SETTLE_STATUS,REMARKS)";
		}
		String sqlU = "UPDATE COM_GUAR_COMP_DETAIL SET REMARKS=";
		numCount = getInfoToDataBase(start,settle,"代偿机构","最近代偿日期","COMP_ORG",sql,sqlU,"",numCount);
		return numCount;
	}
	//欠息
	private int lackInterInfo(int start,String settle,int numCount){
		String sql = "INSERT INTO COM_LACK_INTEREST(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,HIS_MAX_LACK_INTE,FIRST_LACK_INTE_DATE,LAST_SETTLE_DATE,LACK_INTE_TYPE,SETTLE_STATUS,REMARKS)";
		String sqlU = "UPDATE COM_LACK_INTEREST SET REMARKS=";
		if("0".equals(settle)){
			sql = "INSERT INTO COM_LACK_INTEREST(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,LACK_INTE_BALANCE,BALANCE_CHANGE_DATE,LACK_INTE_TYPE,SETTLE_STATUS,REMARKS)";
		}
		numCount = getInfoToDataBase(start,settle,"授信机构","币种","CREDIT_ORG",sql,sqlU,"",numCount);
		return numCount;
	}
	//垫款
	private int advaPayInfo(int start,String settle,int numCount){
		String sql = "INSERT INTO COM_ADVA_PAY_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,ADVA_PAY_SUM,ADVA_PAY_DATE,ADVA_SETTLE_DATE,FIVE_TYPE,ORIG_BUSS,SETTLE_STATUS,REMARKS)";
		String sqlU = "UPDATE COM_ADVA_PAY_DETAIL SET REMARKS=";
		if("0".equals(settle)){
			sql = "INSERT INTO COM_ADVA_PAY_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,ADVA_PAY_SUM,ADVA_PAY_BALANCE,ADVA_PAY_DATE,FIVE_TYPE,ORIG_BUSS,SETTLE_STATUS,REMARKS)";
		}
		String windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,MARGIN_PERCENT,FIVE_TYPE)";
		numCount = getInfoToDataBase(start,settle,"授信机构","币种","CREDIT_ORG",sql,sqlU,windowSql,numCount);
		return numCount;
	}
	
	//表内和表外业务
	private int TableInnerAndOuterInfo(int start,String settle,String attenStatus,int numCount){
		int count = 0;
		String sql = "";
		String sqlU = "";
		String status = settle;
		for(int i=start+1;i<eles.size();i++){
			String str = eles.get(i).text().replace(String.valueOf((char)160), "").trim();
			settle = status;
			String windowSql = "";
			if(str.equals("贷款")||str=="贷款"){
				sql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,FIVE_TYPE,LOAN_TYPE,IS_GUAR,EXTENSION,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				if("0".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,LOAN_TYPE,IS_GUAR,EXTENSION,HIS_RECORD,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				}else if("1".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,SETTLE_STYLE,FIVE_TYPE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,SETTLE_STYLE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}
				sqlU = "UPDATE COM_INNER_BUSS_DETAIL SET REMARKS=";
				settle = "01','"+attenStatus+"','"+settle;
				//已结清类弹出框拼接sql
				numCount = getInfoToDataBase(i,settle,"授信机构","种类","CREDIT_ORG",sql,sqlU,windowSql,numCount);
				count++;
			}else if(str.equals("类贷款")||str=="类贷款"){
				sql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,FIVE_TYPE,IS_GUAR,EXTENSION,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				if("0".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,IS_GUAR,EXTENSION,HIS_RECORD,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				}else if("1".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,SETTLE_STYLE,FIVE_TYPE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,SETTLE_STYLE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}
				sqlU = "UPDATE COM_INNER_BUSS_DETAIL SET REMARKS=";
				settle = "02','"+attenStatus+"','"+settle;
				numCount = getInfoToDataBase(i,settle,"授信机构","业务种类","CREDIT_ORG",sql,sqlU,windowSql,numCount);
				count++;
			}else if(str.equals("贸易融资")||str=="贸易融资"){
				sql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,FIVE_TYPE,IS_GUAR,EXTENSION,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				if("0".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,IS_GUAR,EXTENSION,HIS_RECORD,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				}else if("1".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,SETTLE_STYLE,FIVE_TYPE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_INNER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,SETTLE_DATE,SETTLE_STYLE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}
				sqlU = "UPDATE COM_INNER_BUSS_DETAIL SET REMARKS=";
				settle = "03','"+attenStatus+"','"+settle;
				numCount = getInfoToDataBase(i,settle,"授信机构","种类","CREDIT_ORG",sql,sqlU,windowSql,numCount);
				count++;
			}else if(str.equals("保理")||str=="保理"){
				sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,FIVE_TYPE,IS_GUAR,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				if("0".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,IS_GUAR,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				}else if("1".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,SETTLE_DATE,FIVE_TYPE,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,SETTLE_DATE,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}
				sqlU = "UPDATE COM_OUTER_BUSS_DETAIL SET REMARKS=";
				settle = "04','"+attenStatus+"','"+settle;
				numCount = getInfoToDataBase(i,settle,"授信机构","种类","CREDIT_ORG",sql,sqlU,windowSql,numCount);
				count++;
			}else if(str.equals("票据贴现")||str=="票据贴现"){
				sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,FIVE_TYPE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				if("0".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,ACC_NUM,BUSS_BALANCE,HIS_RECORD,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}else if("1".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,FIVE_TYPE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}
				sqlU = "UPDATE COM_OUTER_BUSS_DETAIL SET REMARKS=";
				settle = "05','"+attenStatus+"','"+settle;
				numCount = getInfoToDataBase(i,settle,"授信机构","种类","CREDIT_ORG",sql,sqlU,windowSql,numCount);
				count++;
			}else if(str.equals("银行承兑汇票")||str=="银行承兑汇票"){
				//未结清正常类，单独处理
				if("0".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_BANK_ACC_ATTACGED_INFO(REPORT_ID,SERIAL_NO,CREDIT_ORG,BANK_ACC_NUM,TH_BALANCE,SIX_BALANCE,NI_BALANCE,MOR_NI_BALANCE,TOTAL,HIS_RECORD,REMARKS)";
					sqlU = "UPDATE COM_BANK_ACC_ATTACGED_INFO SET REMARKS=";
					settle = "999";
					windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,MARGIN_PERCENT,IS_GUAR,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
					numCount = getInfoToDataBase(i,settle,"授信机构","到期日","CREDIT_ORG",sql,sqlU,windowSql,numCount);
					count++;
				}else if("1".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,FIVE_TYPE,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
					sqlU = "UPDATE COM_OUTER_BUSS_DETAIL SET REMARKS=";
					settle = "06','"+attenStatus+"','"+settle;
					numCount = getInfoToDataBase(i,settle,"授信机构","种类","CREDIT_ORG",sql,sqlU,windowSql,numCount);
					count++;
				}else{
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,MARGIN_PERCENT,FIVE_TYPE,IS_GUAR,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					sqlU = "UPDATE COM_OUTER_BUSS_DETAIL SET REMARKS=";
					settle = "06','"+attenStatus+"','"+settle;
					numCount = getInfoToDataBase(i,settle,"授信机构","种类","CREDIT_ORG",sql,sqlU,windowSql,numCount);
					count++;
				}
				count++;
			}else if(str.equals("信用证")||str=="信用证"){
				sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,MARGIN_PERCENT,FIVE_TYPE,IS_GUAR,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				if("0".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,ACC_NUM,BUSS_SUM,BUSS_BALANCE,HIS_RECORD,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,MARGIN_PERCENT,IS_GUAR,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}else if("1".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,FIVE_TYPE,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}
				sqlU = "UPDATE COM_OUTER_BUSS_DETAIL SET REMARKS=";
				settle = "07','"+attenStatus+"','"+settle;
				numCount = getInfoToDataBase(i,settle,"授信机构","币种","CREDIT_ORG",sql,sqlU,windowSql,numCount);
				count++;
				count++;
			}else if(str.equals("保函")||str=="保函"){
				sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,MARGIN_PERCENT,FIVE_TYPE,IS_GUAR,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
				if("0".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,ACC_NUM,BUSS_SUM,BUSS_BALANCE,HIS_RECORD,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,BUSS_BALANCE,START_DATE,STOP_DATE,MARGIN_PERCENT,IS_GUAR,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}else if("1".equals(settle)&&"01".equals(attenStatus)){
					sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,FIVE_TYPE,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS,REMARKS)";
					windowSql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CREDIT_ORG,TYPE,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,SETTLE_DATE,IS_ADVA,BUSS_TYPE,ATTEN_STATUS,SETTLE_STATUS)";
				}
				sqlU = "UPDATE COM_OUTER_BUSS_DETAIL SET REMARKS=";
				settle = "08','"+attenStatus+"','"+settle;
				numCount = getInfoToDataBase(i,settle,"授信机构","种类","CREDIT_ORG",sql,sqlU,windowSql,numCount);
				count++;
				count++;
			}else if(str.contains("对外担保记录")||str.contains("已结清业务")||str.contains("正常类")||str.contains("关注类")||str.contains("不良和违约类")||str.contains("公共记录明细")||count==8){
				break;
			}
		}
		return numCount;
	}
	
	//公共方法
	private int getInfoToDataBase(int start,String settle,String title1,String title2,String key,String sql,String sqlU,String windowSql,int numCount){
		Map<String,String> map = new HashMap<String,String>();
		List<String> list = new ArrayList<String>();//记录第一列值，方便更新备注时使用
		String sqlV = "";
		int nextTable = 0;
		Map<Integer,String> listSerial = new HashMap<Integer,String>();
		//爬取数据
	//	for(int i=start+1;i<eles.size();i++){
			Element ee = eles.get(start+1);
			if(ee.hasText()){
				nextTable = start+1+1;
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					String str = rows.get(j).text().replace(String.valueOf((char)160), "").trim();
					String serial_no = UuidUtil.get32UUID();  //流水号
					listSerial.put(j, serial_no);
					if(!str.contains(title1)&&!str.contains(title2)){
						List<Element> cols = rows.get(j).select("td");
						String sqlValue = "'"+reportId+"','"+serial_no+"',";
						//记录有备注的行
						str = cols.get(0).text().trim();
						if(str.contains("(")&&str.contains("")){
							list.add(str);
						}
						
						if(settle!="999"&&!"999".equals(settle)){
							//拼接字段值
							for(int t=0;t<cols.size();t++){
								sqlValue = sqlValue+"'"+cols.get(t).text().replace(String.valueOf((char)160), "").trim()+"',";
							}
							sqlV = sqlV +" SELECT "+sqlValue+"'"+settle+"',' '"+" FROM DUAL UNION ALL";
						}else{
							//拼接字段值
							for(int t=0;t<cols.size();t++){
								sqlValue = sqlValue+"'"+cols.get(t).text().replace(String.valueOf((char)160), "").trim()+"',";
							}
							sqlV = sqlV +" SELECT "+sqlValue+"' '"+" FROM DUAL UNION ALL";
						}
					}
				}
			//	break;
			}else{
				nextTable = start+1;
			}
		//}
		if(!"".equals(sqlV)){
			sql = sql+sqlV.substring(0, sqlV.length()-9);
			map.put("creatSql", sql);
			//入库
			try {
				companyCrawlerService.saveInfo(map);
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("信息入库失败！");
			}
		}
		
		//更新表，添加备注
		if(list.size()>0){
			ee = eles.get(nextTable);
			if(ee.hasText()){
				Map<String,String> result = getRemarksInfo(ee);
				Set<String> iter = result.keySet();
				for(String it:iter){
					String str = result.get(it).replace(String.valueOf((char)160), "");
					for(int i=0;i<list.size();i++){
						if(list.get(i).contains(it)){
							 //更新数据库
							sqlU=sqlU+"'"+str+"' WHERE REPORT_ID='"+reportId+" AND "+key+"='"+list.get(i)+"'" ;
						    try{
						    	//入库
								map.put("updateSql", sqlU);
								companyCrawlerService.updateInfo(map);
						    }catch(Exception e){
						    	logger.info("信息表更新失败!");
						    	logger.error(e.getMessage());
						    }
							break;
						}
					}
				}
			}
		}
		
		//解析弹出框
		if(nextTable>0){
			try{
				if("999".equals(settle)){
					settle = "06','01','0";
					//(未结清类业务明细,票据贴现、银承、信用证、保函)
					numCount = new BombBoxAnalyze().onClickWindow(doc, cookies, eles.get(nextTable), reportId, listSerial, companyCrawlerService, "C", settle, windowSql, numCount, pd);
				}else{
					String[] strs = settle.split(",");
					if(strs.length>2){  //
						if(strs[2].contains("1")){//判断是否为已结清类
							//判断是否有查看正常结清类业务链接
							boolean flag = false;
							List<Element> rows = eles.get(nextTable).select("table").select("tr");
							for(int t=0;t<rows.size();t++){
								List<Element> cols = rows.get(t).select("td");
								for(int k=0;k<cols.size();k++){
									List<Element> ss = cols.get(k).getElementsByTag("input");
									if(ss.size()>0){
										flag = true;
										break;
									}
								}
							}
							if(flag){
								numCount = new BombBoxAnalyze().onClickWindow(doc, cookies, eles.get(nextTable), reportId, listSerial, companyCrawlerService, "C", settle, windowSql, numCount, pd);
							}
						}else if(strs[0].contains("05")||strs[0].contains("07")||strs[0].contains("08")){
							//(未结清类业务明细,票据贴现、银承、信用证、保函)
							numCount = new BombBoxAnalyze().onClickWindow(doc, cookies, eles.get(nextTable-1), reportId, listSerial, companyCrawlerService, "C", settle, windowSql, numCount, pd);
						}else{
							//(未结清弹出框)(解析担保、历史记录、展期)
							numCount = new BombBoxAnalyze().onClickWindow(doc, cookies, eles.get(nextTable-1), reportId, listSerial, companyCrawlerService, "A", settle, windowSql, numCount, pd);
						}
					}else{//由资产管理公司处置的债务、担保及第三方代偿的债务、欠息、垫款，settle为单个值
						numCount = new BombBoxAnalyze().onClickWindow(doc, cookies, eles.get(nextTable-1), reportId, listSerial, companyCrawlerService, "E", settle, windowSql, numCount, pd);
					}
				}
			}catch(Exception e){
				logger.error(e.getMessage(),e);
				logger.error("该table无click事件");
			}
		}
		return numCount;
	}
	
	//提取备注信息
	private Map<String,String> getRemarksInfo(Element ee){
		Map<String,String> result = new HashMap<String,String>();
		//提取数值并更新表
		String regEx="(\\d+)";
		// 编译正则表达式
	    Pattern pattern = Pattern.compile(regEx);
	    try{
	    	List<Element> cols = ee.select("tr>td");
			for(int i=0;i<cols.size();i++){
				String str = cols.get(i).text().replace(String.valueOf((char)160), "").trim();
			    Matcher matcher = pattern.matcher(str);
			    matcher.find();
			    result.put("("+matcher.group()+")", str);
			}
	    }catch(Exception e){
	    	logger.error(e.getMessage());
	    }
		return result;
	}
}
