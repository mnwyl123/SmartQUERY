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
 * 概要信息
 * @author zhangyy
 *
 */
public class SummaryInfo {

	private static Logger logger = Logger.getLogger(SummaryInfo.class);
	
	//获取概要信息
	public void getSummaryInfo(String reportId,int startNum,List<Element> eles,CompanyCrawlerManager companyCrawlerService){
		int count = 0;
		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if(str.equals("未结清信贷信息概要")){
					//调用方法，提取数据并入库
					getUnclearCreditInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(str.equals("已结清信贷信息概要")){
					//调用方法，提取数据并入库
					getClearCreditInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(str.equals("负债变化历史")){
					getDebtInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(str.equals("对外担保信息概要")){
					getGuaranteeInfo(eles,reportId,companyCrawlerService,i);
					count++;
				}else if(count==4||str.contains("信贷记录明细")){
					break;
				}
			}catch(Exception e){
				logger.info(e.getMessage());
			}
		}
	}
	
	//获取未结清信贷信息概要信息，并入库
	private void getUnclearCreditInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		for(int i=start+1;i<eles.size();i++){
			String text = eles.get(i).text().trim();
			if(text.contains("已结清信贷信息概要")||text.contains("负债变化历史")||text.contains("对外担保信息概要")||text.contains("信贷记录明细")){
				break;
			}
			//提取table标签中的内容
			Element ee = eles.get(i);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					String str = rows.get(j).text().trim();
					if(str.contains("资产管理公司处置的债务")||str.contains("欠息汇总")||str.contains("垫款")||str.contains("担保代偿或第三方代偿的债务")){
						//调用方法
						insertAssetsDataBase(rows,reportId,companyCrawlerService,"0");
						break;
					}else if(str.contains("正常类汇总")&&str.contains("关注类汇总")){
						//调用方法处理未结清的信贷概要大表
						insertCreditDataBase(rows,reportId,companyCrawlerService,"0");
						break;
					}
				}
			}
		}
	}
	
	//获取已结清信贷信息概要信息，并入库
	private void getClearCreditInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		for(int i=start+1;i<eles.size();i++){
			String text = eles.get(i).text().trim();
			if(text.contains("负债变化历史")||text.contains("对外担保信息概要")||text.contains("信贷记录明细")){
				break;
			}
			//提取table标签中的内容
			Element ee = eles.get(i);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					String str = rows.get(j).text().trim();
					if(str.contains("资产管理公司处置的债务")||str.contains("欠息汇总")||str.contains("垫款")||str.contains("担保代偿或第三方代偿的债务")||str.contains("被剥离负债汇总")){
						//调用方法
						insertAssetsDataBase(rows,reportId,companyCrawlerService,"1");
						break;
					}else if(str.contains("贷款")&&str.contains("类贷款")&&str.contains("票据贴现")){
						//调用方法处理已结清的信贷概要大表
						insertCLearCreditDataBase(rows,reportId,companyCrawlerService,"1");
						break;
					}
				}
			}
		}
	}
	
	//未结清/已结清资产类数据提取并入库
	private void insertAssetsDataBase(List<Element> rows,String reportId,CompanyCrawlerManager companyCrawlerService,String settle){
		Map<String,String> map = new HashMap<String,String>();
		//提取记录类型
		List<String> listType = new ArrayList<String>();
		for(int j=0;j<rows.size();j++){
			String str = rows.get(j).text().trim();
			if(str.contains("资产管理公司处置的债务")||str.contains("欠息汇总")||str.contains("垫款")||str.contains("担保代偿或第三方代偿的债务")){
				List<Element> cols = rows.get(j).select("td"); 
				for(int i=0;i<cols.size();i++){
					str = cols.get(i).text().trim();
					if(str.contains("资产管理公司处置的债务")){
						listType.add("01");
					}else if(str.contains("欠息汇总")){
						listType.add("02");
					}else if(str.contains("垫款")){
						listType.add("03");
					}else if(str.contains("担保代偿或第三方代偿的债务")){
						listType.add("04");
					}else if(str.contains("被剥离负债汇总")){
						listType.add("05");
					}
				}
			}
		}
		//提取数据，并入库
		String sqlI = "INSERT INTO COM_BAD_ASSETS_DISP_SUMM (";  //拼接sql
		String sqlKey = "REPORT_ID,BAD_ASSETS_TYPE,BAD_ASSETS_NUM,BAD_ASSETS_BALANCE,LAST_DISPOSAL_DATE,SETTLE_STATUS";    //字段信息
		String sqlV="";
		for(int i=0;i<rows.size();i++){
			String str = rows.get(i).text().trim();
			if(str.contains("笔数")){
				List<Element> cols = rows.get(i+1).select("td"); 
				int num1=0;   //记录上一个类型数据列数
				int num = 0;  //记录该类型有几列数据
				for(int t=0;t<listType.size();t++){
					String type = listType.get(t);
					String sqlValue = "'"+reportId+"','"+type+"',";
					
					if(type=="02"||type.equals("02")){
						num = 2;
					}else if((type=="03"||type.equals("03"))&&(settle=="0"||settle.equals("0"))){
						num = 2;
					}else{
						num = 3;
					}
					for(int j=t*num1;j<t*num1+num;j++){
						sqlValue=sqlValue+"'"+cols.get(j).text().trim()+"',";
					}
					if(num==2){
						sqlValue = sqlValue+"' ',";
					}
					sqlValue = sqlValue+"'"+settle+"'";
					sqlV=sqlV+" SELECT "+sqlValue+" FROM DUAL UNION";
					num1=num;
				}
			}
		}
		sqlV = sqlV.substring(0, sqlV.length()-5);
		sqlI = sqlI+sqlKey+")"+sqlV;
		//入库
		map.put("creatSql", sqlI);
		try {
			companyCrawlerService.saveInfo(map);
		} catch (Exception e) {
			logger.error(e.getMessage());
			logger.info("信息入库失败！");
		}
	}
	
	//未结清信贷业务分类信息概要信息提取并入库
	private void insertCreditDataBase(List<Element> rows,String reportId,CompanyCrawlerManager companyCrawlerService,String settle){
		Map<String,String> map = new HashMap<String,String>();
		int dataRowNum = 0;  //记录数据从第几行开始
		List<String> listType = new ArrayList<String>();
		for(int j=0;j<rows.size();j++){
			String str = rows.get(j).text().trim();
			if(str.contains("正常类汇总")||str.contains("关注类汇总")||str.contains("不良/违约类汇总")){
				List<Element> cols = rows.get(j).select("td");
				for(int i=0;i<cols.size();i++){
					str = cols.get(i).text().trim();
					if(str.contains("正常类汇总")){
						listType.add("01");
					}else if(str.contains("关注类汇总")){
						listType.add("02");
					}else if(str.contains("不良/违约类汇总")){
						listType.add("03");
					}
				}
			}else if(str.contains("笔数")&&str.contains("余额")){
				dataRowNum = j+1;
				break;
			}
		}
		
		for(int i=dataRowNum;i<rows.size();i++){
			List<Element> cols = rows.get(i).select("td");
			String str = cols.get(0).text().trim();
			String bussType = "";
			if(str=="贷款"||str.equals("贷款")){
				bussType = "01";
			}else if(str=="类贷款"||str.equals("类贷款")){
				bussType = "02";
			}else if(str=="贸易融资"||str.equals("贸易融资")){
				bussType = "03";
			}else if(str=="保理"||str.equals("保理")){
				bussType = "04";
			}else if(str=="票据贴现"||str.equals("票据贴现")){
				bussType = "05";
			}else if(str=="银行承兑汇票"||str.equals("银行承兑汇票")){
				bussType = "06";
			}else if(str=="信用证"||str.equals("信用证")){
				bussType = "07";
			}else if(str=="保函"||str.equals("保函")){
				bussType = "08";
			}
			
			if(!"".equals(bussType)){
				String sqlV = "";
				int count = 2;
				for(int j=0;j<listType.size();j++){
					String type = listType.get(j);
					String sqlValue = "'"+reportId+"','"+bussType+"','"+type+"',";
					int num = 2*j+count;
					for(int t=2*j;t<num;t++){
						sqlValue = sqlValue+"'"+cols.get(t+1).text().trim()+"',";
					}
					sqlValue = sqlValue+"'"+settle+"'";
					sqlV = sqlV +" SELECT "+sqlValue+" FROM DUAL UNION";
				}
				//提取数据，并入库
				String sqlI = "INSERT INTO COM_UNCLEAR_CREDIT_TYPE_SUMM (";  //拼接sql
				String sqlKey = "REPORT_ID,BUSS_TYPE,ATTENT_STATUS,BUSS_NUM,BUSS_BALANCE,SETTLE_STATUS";    //字段信息
				
				sqlI = sqlI+sqlKey+")"+sqlV.substring(0, sqlV.length()-5);
				//入库
				map.put("creatSql", sqlI);
				try {
					companyCrawlerService.saveInfo(map);
				} catch (Exception e) {
					logger.error(e.getMessage());
					logger.info("信息入库失败！");
				}
			}
		}
	}
	
	//已结清信贷业务分类信息概要信息提取并入库
	private void insertCLearCreditDataBase(List<Element> rows,String reportId,CompanyCrawlerManager companyCrawlerService,String settle){
		Map<String,String> map = new HashMap<String,String>();
		int dataRowNum = 0;  //记录数据从第几行开始
		List<String> listType = new ArrayList<String>();
		for(int j=0;j<rows.size();j++){
			String str = rows.get(j).text().trim();
			if(str.contains("贷款")||str.contains("类贷款")||str.contains("贸易融资")){
				List<Element> cols = rows.get(j).select("td");
				for(int i=0;i<cols.size();i++){
					str = cols.get(i).text().trim();
					if(str=="贷款"||str.equals("贷款")){
						listType.add("01");
					}else if(str=="类贷款"||str.equals("类贷款")){
						listType.add("02");
					}else if(str=="贸易融资"||str.equals("贸易融资")){
						listType.add("03");
					}else if(str=="保理"||str.equals("保理")){
						listType.add("04");
					}else if(str=="票据贴现"||str.equals("票据贴现")){
						listType.add("05");
					}else if(str=="银行承兑汇票"||str.equals("银行承兑汇票")){
						listType.add("06");
					}else if(str=="信用证"||str.equals("信用证")){
						listType.add("07");
					}else if(str=="保函"||str.equals("保函")){
						listType.add("08");
					}
				}
				dataRowNum = j+1;
				break;
			}
		}
		
		for(int i=dataRowNum;i<rows.size();i++){
			String str = rows.get(i).text().trim();
			String bussType = "";
			if(str.contains("正常类笔数")){
				bussType = "01";
			}else if(str.contains("关注类笔数")){
				bussType = "02";
			}else if(str.contains("不良/违约类笔数")){
				bussType = "03";
			}
			
			if(!"".equals(bussType)){
				List<Element> cols = rows.get(i).select("td");
				String sqlV = "";
				for(int j=0;j<listType.size();j++){
					String type = listType.get(j);
					String sqlValue = "";
					sqlValue = "'"+reportId+"','"+type+"','"+bussType+"','"+cols.get(j+1).text().trim()+"','"+settle+"'";
					sqlV = sqlV +" SELECT "+sqlValue+" FROM DUAL UNION";
				}
				//提取数据，并入库
				String sqlI = "INSERT INTO COM_UNCLEAR_CREDIT_TYPE_SUMM (";  //拼接sql
				String sqlKey = "REPORT_ID,BUSS_TYPE,ATTENT_STATUS,BUSS_NUM,SETTLE_STATUS";    //字段信息
				
				sqlI = sqlI+sqlKey+")"+sqlV.substring(0, sqlV.length()-5);
				//入库
				map.put("creatSql", sqlI);
				try {
					companyCrawlerService.saveInfo(map);
				} catch (Exception e) {
					logger.error(e.getMessage());
					logger.info("信息入库失败！");
				}
			}
		}
	}
	
	//获取负债变化历史信息，并入库
	private void getDebtInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		//提取数据，并入库
		String sqlI = "INSERT INTO COM_DEBT_CHANGE_HIST_SUMM (";  //拼接sql
		String sqlKey = "REPORT_ID,CHANGE_DATE,ALL_DEBT_BALANCE,BAD_DEBT_BALANCE";    //字段信息
		String sqlV = "";
		for(int i=start+1;i<eles.size();i++){
			//提取table标签中的内容
			Element ee = eles.get(i);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();){
					List<Element> cols1 = rows.get(j).select("td");
					List<Element> cols2= rows.get(j+1).select("td");
					List<Element> cols3= rows.get(j+2).select("td");
					for(int t=0;t<cols1.size();t++){
						String str = cols1.get(t).text().trim();
						if(!"".equals(str)){
							String sqlValue = "'"+reportId+"','"+str+"','"+cols2.get(t).text().trim()+"','"+cols3.get(t).text().trim()+"',";
							sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION";
						}
					}
					j=j+3;
				}
				break;
			}
		}
		if(!"".equals(sqlV)){
			sqlI = sqlI+sqlKey+")"+sqlV.substring(0, sqlV.length()-5);
			Map<String,String> map = new HashMap<String,String>();
			//入库
			map.put("creatSql", sqlI);
			try {
				companyCrawlerService.saveInfo(map);
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("信息入库失败！");
			}
		}
	}
	
	//获取对外担保信息，并入库
	private void getGuaranteeInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start){
		//提取数据，并入库
		String sqlI = "INSERT INTO COM_FORE_GUAR_SUMM (";  //拼接sql
		String sqlKey = "REPORT_ID,GUAR_TYPE,GUAR_NUM,GUAR_SUM,NOR_GUAR_BALANCE,ATTEN_GUAR_BALANCE,BAD_GUAR_BALANCE";    //字段信息
		String sqlV = "";
		for(int i=start+1;i<eles.size();i++){
			//提取table标签中的内容
			Element ee = eles.get(i);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				for(int j=0;j<rows.size();j++){
					String guar_type = "";
					String str = rows.get(j).text().trim();
					if(str.contains("保证汇总")){
						guar_type = "01";
					}else if(str.contains("抵押汇总")){
						guar_type = "02";
					}else if(str.contains("质押汇总")){
						guar_type = "03";
					}
					if(!"".equals(guar_type)){
						List<Element> cols = rows.get(j).select("td");
						String sqlValue = "'"+reportId+"','"+guar_type+"',";
						for(int t=1;t<6;t++){
							sqlValue = sqlValue+"'"+cols.get(t).text().trim()+"',";
						}
						sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION";
					}
				}
				break;
			}
		}
		if(!"".equals(sqlV)){
			sqlI = sqlI+sqlKey+")"+sqlV.substring(0, sqlV.length()-5);
			Map<String,String> map = new HashMap<String,String>();
			//入库
			map.put("creatSql", sqlI);
			try {
				companyCrawlerService.saveInfo(map);
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("信息入库失败！");
			}
		}
	}
}
