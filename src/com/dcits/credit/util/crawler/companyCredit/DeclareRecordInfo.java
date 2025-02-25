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
 * 声明信息
 * @author zhangyy
 *
 */
public class DeclareRecordInfo {

	private static Logger logger = Logger.getLogger(DeclareRecordInfo.class);
	
	//获取个人基本信息
	public void getBaseInfo(String reportId,int startNum,List<Element> eles,CompanyCrawlerManager companyCrawlerService){
		int count = 0;
		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str=="报数机构说明"||str.equals("报数机构说明")){
					//企业身份信息提取并入库
					getReportOrgInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(str.contains("征信中心标注")&&str.contains("征信中心标注")){
					//主要出资人信息取并入库
					getOtherInfo(eles,reportId,companyCrawlerService,i,"征信中心标注");
					count++;
				}else if(str=="信息主体声明"||str.equals("信息主体声明")){
					//高管人员信息提取并入库
					getOtherInfo(eles,reportId,companyCrawlerService,i,"信息主体声明");
					count++;
				}else if(count==3){
					break;
				}
			}catch(Exception e){
				logger.error(e.getMessage());
			}
		}
	}
	
	//获取声明信息，并入库
	private void getReportOrgInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		String sql = "INSERT INTO COM_DECL_INFO (REPORT_ID,CONTENTS,DECL_OBJ,ADD_DATE)"; 
		String sqlV = "";
		Map<String,String> map = new HashMap<String,String>();
		//爬取数据
		for(int i=start+1;i<eles.size();i++){
			Element ee = eles.get(i);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					String str = rows.get(j).text().trim();
					if(!str.contains("添加日期")&&!str.contains("内容")){
						String sqlValue = "'"+reportId+"',";
						List<Element> cols = rows.get(j).select("td");
						
						//拼接字段值
						for(int t=0;t<cols.size();t++){
							sqlValue = sqlValue+"'"+cols.get(t).text().trim()+"',";
						}
						sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION";
					}
				}
				break;
			}
		}
		if(!"".equals(sqlV)){
			sql = sql+sqlV.substring(0, sqlV.length()-5);
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
	
	//获取声明信息，并入库
	private void getOtherInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start,String decl_obj){
		String sql = "INSERT INTO COM_DECL_INFO (REPORT_ID,CONTENTS,ADD_DATE,DECL_OBJ)";  
		String sqlV = "";
		Map<String,String> map = new HashMap<String,String>();
		//爬取数据
		for(int i=start+1;i<eles.size();i++){
			Element ee = eles.get(i);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					String str = rows.get(j).text().trim();
					if(!str.contains("添加日期")&&!str.contains("内容")){
						String sqlValue = "'"+reportId+"',";
						List<Element> cols = rows.get(j).select("td");
						
						//拼接字段值
						for(int t=0;t<cols.size();t++){
							sqlValue = sqlValue+"'"+cols.get(t).text().trim()+"','";
						}
						sqlV = sqlV +" SELECT "+sqlValue+decl_obj+"' FROM DUAL UNION";
					}
				}
				break;
			}
		}
		if(!"".equals(sqlV)){
			sql = sql+sqlV.substring(0, sqlV.length()-5);
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
}
