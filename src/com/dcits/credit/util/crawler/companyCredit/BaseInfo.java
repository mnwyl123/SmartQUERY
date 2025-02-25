package com.dcits.credit.util.crawler.companyCredit;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dcits.credit.service.crawler.CompanyCrawlerManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.PageData;

/**
 * 基本信息
 * @author zhangyy
 *
 */
public class BaseInfo {

	private static Logger logger = Logger.getLogger(BaseInfo.class);
	
	//获取个人基本信息
	public void getBaseInfo(String reportId,int startNum,List<Element> eles,CompanyCrawlerManager companyCrawlerService){
		int count = 0;
		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str=="身份信息"||str.equals("身份信息")){
					//企业身份信息提取并入库
					getIdentityInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(str.contains("主要出资人信息")&&str.contains("注册资金")){
					//主要出资人信息取并入库
					getInveInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(str=="高管人员信息"||str.equals("高管人员信息")){
					//高管人员信息提取并入库
					getSeniorInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(str=="有直接关联关系的其他企业"||str.equals("有直接关联关系的其他企业")){
					//有关系的其他企业信息提取并入库
					getOtherCompanyInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(str=="财务报表"||str.equals("财务报表")){
					//资产负债表信息提取并入库
					getFinanceInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(count==5||str.contains("信息概要")){
					break;
				}
			}catch(Exception e){
				logger.error(e.getMessage());
			}
		}
	}
	
	//获取企业身份信息，并入库
	private void getIdentityInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		String sql = "INSERT INTO COM_CREDIT_BASIC_INFO (";  //拼接sql
		String sqlKey = "REPORT_ID,BORR_NAME,REGI_ADDR,REGI_TYPE,REGI_NO,REGI_DATE,LICENSE_DATE,MECH_CODE,CHINA_CREDIT_CODE,COUNTRY_TAX_REGI_NO,LAND_TEX_REGI_NO";    //字段信息
		String sqlValue = "'"+reportId+"',";    //字段值
		Map<String,String> map = new HashMap<String,String>();
		for(int i=start+1;i<eles.size();i++){
			Element ee = eles.get(i);
			//提取table标签中的内容
			if(ee.hasText()){
				List<Element> cols = ee.select("tr>td"); 
				for(int t=0;t<cols.size()/2;t++){
					sqlValue = sqlValue +"'"+cols.get(2*t+1).text().trim()+"',";
				}
				break;
			}
		}
		sql = sql+sqlKey+") VALUES ("+sqlValue.substring(0, sqlValue.length()-1)+")";
		//入库
		map.put("creatSql", sql);
		try {
			companyCrawlerService.saveInfo(map);
		} catch (Exception e) {
			logger.info(e.getMessage());
			logger.info("企业身份信息入库失败！");
		}
	}
	
	//获取出资人信息，并入库
	private void getInveInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		Map<String,String> map = new HashMap<String,String>();
		//更新企业身份信息注册资本
		String sql = "UPDATE COM_CREDIT_BASIC_INFO SET REIG_CAPITAL=";  //拼接sql
		for(int i=start;i<eles.size();i++){
			String str = eles.get(i).text().trim();
			if(str.contains("注册资金")){
				//提取数值并更新表
				String regEx="[^0-9]";
				// 编译正则表达式
			    Pattern pattern = Pattern.compile(regEx);
			    Matcher matcher = pattern.matcher(str);
			    String value = matcher.replaceAll("").trim();
			    if(str.contains("万元")){
			    	value+="万";
			    }
			    //更新数据库
			    sql=sql+"'"+value+"' WHERE REPORT_ID='"+reportId+"'";
			    try{
			    	//入库
					map.put("updateSql", sql);
					companyCrawlerService.updateInfo(map);
			    }catch(Exception e){
			    	logger.info("企业信息表更新失败!");
			    	logger.error(e.getMessage());
			    }
				break;
			}
		}
		
		//提取出资人信息，并入库
		String sqlI = "INSERT INTO COM_INVESTOR_INFO (";  //拼接sql
		String sqlKey = "REPORT_ID,INVE_NAME,INVE_CRED_TYPE,INVE_CRED_NUM,INVE_PERCENT";    //字段信息
		String strKey = "出资方名称";
		insertDataBase(eles,reportId,companyCrawlerService,start,sqlI,sqlKey,strKey);
	}

	//获取高管人员信息，并入库
	private void getSeniorInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		String sqlI = "INSERT INTO COM_SENIOR_MANAGER_INFO (";  //拼接sql
		String sqlKey = "REPORT_ID,SENIOR_DUTIES,SENIOR_NAME,SNEIOR_CRED_TYPE,SNEIOR_CRED_NUM";    //字段信息
		String strKey = "职务";
		insertDataBase(eles,reportId,companyCrawlerService,start,sqlI,sqlKey,strKey);
	}

	//获取关联企业信息，并入库
	private void getOtherCompanyInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		String sqlI = "INSERT INTO COM_DIRECT_CONN_OTHERS (";  //拼接sql
		String sqlKey = "REPORT_ID,COM_NAME,CHINA_CREDIT_CODE,REALTION";    //字段信息
		String strKey = "中征码";
		insertDataBase(eles,reportId,companyCrawlerService,start,sqlI,sqlKey,strKey);
	}
	
	//公用数据提取并入库
	private void insertDataBase(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start,String sqlI,String sqlKey,String strKey){
		Map<String,String> map = new HashMap<String,String>();
		String[] str = sqlKey.split(",");
		int cout = str.length-1;
		//提取高管人员信息，并入库
		for(int i=start+1;i<eles.size();i++){
			//提取table标签中的内容
			Element ee = eles.get(i);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					String sql = sqlI;
					String sqlValue = "'"+reportId+"',";    //字段值
					if(!rows.get(j).text().trim().contains(strKey)){
						List<Element> cols = rows.get(j).select("td");
						//处理行数不对等问题
						if(cout>0&&cout>cols.size()){
							List<Element> lastCol = rows.get(j-1).select("td");
							for(int t=0;t<cout-cols.size();t++){
								sqlValue = sqlValue +"'"+lastCol.get(t).text().trim()+"',";
							}
						}
						for(int t=0;t<cols.size();t++){
							sqlValue = sqlValue +"'"+cols.get(t).text().trim()+"',";
						}
						sql = sql+sqlKey+") VALUES ("+sqlValue.substring(0, sqlValue.length()-1)+")";
						//入库
						map.put("creatSql", sql);
						try {
							companyCrawlerService.saveInfo(map);
						} catch (Exception e) {
							logger.error(e.getMessage());
							logger.info("信息入库失败！");
						}
					}
				}
				break;
			}
		}
	}	

	//获取财务报表信息信息，并入库
	private void getFinanceInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		int count = 0;
		String sqlI = "INSERT INTO COM_FINANCIAL_REPORT_FORM (";  //拼接sql
		String sqlKey = "REPORT_ID,REPORT_TYPE,DATE_RANGE,REPORT_YEAR,ENTERPRISE_RANGE";    //字段信息
		for(int i=start+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str=="资产负债表"||str.equals("资产负债表")){
					getFinInfoInsertDataBase(eles,reportId,companyCrawlerService,i,sqlI,sqlKey,"01");
					count++;
				}else if(str=="利润表"||str.equals("利润表")){
					//利润表中数据提取并入库
					getFinInfoInsertDataBase(eles,reportId,companyCrawlerService,i,sqlI,sqlKey,"02");
					count++;
				}else if(str=="现金流量表"||str.equals("现金流量表")){
					//现金流量表中信息提取并入库
					getFinInfoInsertDataBase(eles,reportId,companyCrawlerService,i,sqlI,sqlKey,"03");
					count++;
				}
				if(count==3){
					break;
				}
			}catch(Exception e){
				logger.error(e.getMessage());
			}
		}
	}
	
	//财务报表信息入库公共方法
	public void getFinInfoInsertDataBase(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start,String sqlI,String sqlKey,String type){
		Map<String,String> map = new HashMap<String,String>();
		//提取高管人员信息，并入库
		for(int i=start+1;i<eles.size();i++){
			//提取table标签中的内容
			Element ee = eles.get(i);
			if(ee.hasText()){
				
				List<Element> rows = ee.select("tr");
				int rowNum = 0;   //记录标题行位置
				List<Element> titleCols = new ArrayList<Element>(); //记录标题
				for(int j=0;j<rows.size();j++){
					if(rows.get(j).text().trim().contains("报表类型")){
						rowNum = j;
						titleCols = rows.get(j).select("td");
						break;
					}
				}
				if(titleCols.size()>0){
					String resultValue = "";
					for(int j=rowNum+1;j<rows.size();j++){
						List<Element> cols = rows.get(j).select("td"); 
						for(int t=1;t<cols.size();t++){
							String sqlValue = "'"+reportId+"','"+type+"','"+cols.get(0).text().trim()+"',";    //字段值
							sqlValue = sqlValue +"'"+titleCols.get(t).text().trim()+"','"+cols.get(t).text().trim()+"'";
							resultValue = resultValue+" SELECT "+sqlValue+" FROM DUAL UNION";
						}
					}
						
					sqlI = sqlI+sqlKey+")"+resultValue.substring(0, resultValue.length()-5);
					//入库
					map.put("creatSql", sqlI);
					try {
						companyCrawlerService.saveInfo(map);
					} catch (Exception e) {
						logger.error(e.getMessage());
						logger.info("信息入库失败！");
					}
				}
				break;
			}
		}
	}
}
