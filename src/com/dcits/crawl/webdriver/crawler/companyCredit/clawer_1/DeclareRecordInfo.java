package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_1;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.nodes.Element;

import com.dcits.crawl.service.crawler.CompanyCrawlerManager;

/**
 * 声明信息
 * @author zhangyy
 *
 */
public class DeclareRecordInfo {

	private static Logger logger = Logger.getLogger(DeclareRecordInfo.class);

	private String reportId = null;
	private CompanyCrawlerManager companyCrawlerService = null;
	private List<Element> eles = null;
	public DeclareRecordInfo(String reportId,CompanyCrawlerManager companyCrawlerService,List<Element> eles){
		this.reportId = reportId;
		this.companyCrawlerService = companyCrawlerService;
		this.eles = eles;
	}
	//获取个人基本信息
	public void getBaseInfo(int startNum){
		int count = 0;
		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().replace(String.valueOf((char)160), "").trim();
			try{
				if(str=="报数机构说明"||str.equals("报数机构说明")){
					//企业身份信息提取并入库
					getReportOrgInfo(i);
					count++;
				}else if(str.contains("征信中心标注")&&str.contains("征信中心标注")){
					//主要出资人信息取并入库
					getOtherInfo(i,"征信中心标注");
					count++;
				}else if(str=="信息主体声明"||str.equals("信息主体声明")){
					//高管人员信息提取并入库
					getOtherInfo(i,"信息主体声明");
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
	private void getReportOrgInfo(int start){
		String sql = "INSERT INTO COM_DECL_INFO (REPORT_ID,CONTENTS,DECL_OBJ,ADD_DATE)"; 
		String sqlV = "";
		Map<String,String> map = new HashMap<String,String>();
		//爬取数据
		for(int i=start+1;i<eles.size();i++){
			Element ee = eles.get(i);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					String str = rows.get(j).text().replace(String.valueOf((char)160), "").trim();
					if(!str.contains("添加日期")&&!str.contains("内容")){
						String sqlValue = "'"+reportId+"',";
						List<Element> cols = rows.get(j).select("td");
						
						//拼接字段值
						for(int t=0;t<cols.size();t++){
							sqlValue = sqlValue+"'"+cols.get(t).text().replace(String.valueOf((char)160), "").trim()+"',";
						}
						sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION ALL";
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
	}
	
	//获取声明信息，并入库
	private void getOtherInfo(int start,String decl_obj){
		String sql = "INSERT INTO COM_DECL_INFO (REPORT_ID,CONTENTS,ADD_DATE,DECL_OBJ)";  
		String sqlV = "";
		Map<String,String> map = new HashMap<String,String>();
		//爬取数据
		for(int i=start+1;i<eles.size();i++){
			Element ee = eles.get(i);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					String str = rows.get(j).text().replace(String.valueOf((char)160), "").trim();
					if(!str.contains("添加日期")&&!str.contains("内容")){
						String sqlValue = "'"+reportId+"',";
						List<Element> cols = rows.get(j).select("td");
						
						//拼接字段值
						for(int t=0;t<cols.size();t++){
							sqlValue = sqlValue+"'"+cols.get(t).text().replace(String.valueOf((char)160), "").trim()+"',";
						}
						sqlV = sqlV +" SELECT "+sqlValue+"'"+decl_obj+"' FROM DUAL UNION ALL";
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
	}
}
