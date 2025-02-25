package com.dcits.credit.util.crawler.companyCredit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.nodes.Element;

import com.dcits.credit.service.crawler.CompanyCrawlerManager;
import com.dcits.platform.util.UuidUtil;

/**
 * 公共信息明细
 * @author zhangyy
 *
 */
public class PubRecordInfo {

	private static Logger logger = Logger.getLogger(PubRecordInfo.class);
	
	//获取信贷记录明细信息
	public void getPubDetailInfo(String reportId,int startNum,List<Element> eles,CompanyCrawlerManager companyCrawlerService){
		int count = 0;
		String sql = "";
		for(int i=startNum+1;i<eles.size();i++){
			Element ele = eles.get(i);
			String str = ele.text().trim();
			try{
				if("欠税记录".equals(str)){
					sql = "INSERT INTO COM_TAX_ARREARS_RECORD(REPORT_ID,TAX_AUTHORITIES,TAX_ARREARS_SUM,TAX_ARREARS_DATE)";
					getNoTypeInfo(eles,reportId,companyCrawlerService,i,sql,"主管税务机关","欠税总额");
					count++;
				}else if("民事判决记录".equals(str)){
					sql = "INSERT INTO COM_JUDGE_RECORD(REPORT_ID,COURT_FILING,FILING_DATE,LITIG_REASON,LITIG_STATUS,CASE_NUM,LITIG_PRO,LITIG_SUB,LITIG_SUM,CLOSE_STYLE,JUDGE_START_DATE,JUDGE_RESULT)";
					//调用方法，提取数据并入库
					getJudgeInfo(eles,reportId,companyCrawlerService,i,sql);
					count++;
				}else if("强制执行记录".equals(str)){
					sql = "INSERT INTO COM_ENFORCE_RECORD(REPORT_ID,EXE_TYPE,COURT_FILING,FILING_DATE,EXE_CASE,CASE_NUM,APP_EXE_SUB,APP_EXE_SUM,CASE_STATUS,CLOSE_STYLE,EXE_SUB,EXE_SUM)";
					//调用方法，提取数据并入库
					getOtherInfo(eles,reportId,companyCrawlerService,i,sql,"01");
					count++;
				}else if("行政处罚记录".equals(str)){
					sql = "INSERT INTO COM_ENFORCE_RECORD(REPORT_ID,EXE_TYPE,COURT_FILING,FILING_DATE,EXE_CASE,CASE_NUM,APP_EXE_SUB,APP_EXE_SUM,CASE_STATUS,CLOSE_STYLE,EXE_SUB,EXE_SUM)";
					//调用方法，提取数据并入库
					getOtherInfo(eles,reportId,companyCrawlerService,i,sql,"02");
					count++;
				}else if("社会保险参保缴费记录".equals(str)){
					sql = "INSERT INTO COM_SECUR_PAY_RECORD(REPORT_ID,SERIAL_NO,SECUR_TYPE,INSURE_DATE,STATISTIC_DATE,BASE_PAY,PAY_STATUS,TOTAL_ARREAR_SUM)";
					//调用方法，提取数据并入库
					String serial_no = UuidUtil.get32UUID();  //生成流水号
					getOtherInfo(eles,reportId,companyCrawlerService,i,sql,serial_no);
					count++;
				}else if("住房公积金缴费记录".equals(str)){
					sql = "INSERT INTO COM_PROVID_FUND_PAY_RECORD(REPORT_ID,SERIAL_NO,STATISTIC_DATE,FIRST_PAY_DATE,EMPLOY_NUM,BASE_PAY,LAST_PAY_DATE,PAY_TO_DATE,PAY_STATUS,TOTAL_ARREAR_SUM)";
					//调用方法，提取数据并入库
					String serial_no = UuidUtil.get32UUID();  //生成流水号
					getOtherInfo(eles,reportId,companyCrawlerService,i,sql,serial_no);
					count++;
				}else if("获得许可记录".equals(str)){
					sql = "INSERT INTO COM_ENTER_QUAL(REPORT_ID,QUAL_TYPE,GRANT_ORG,QUAL_NAME,GRANT_DATE,END_DATE,CONTENT)";
					//调用方法，提取数据并入库
					getTypeInfo(eles,reportId,companyCrawlerService,i,sql,"许可部门","许可类型","01");
					count++;
				}else if("获得认证记录".equals(str)){
					sql = "INSERT INTO COM_ENTER_QUAL(REPORT_ID,QUAL_TYPE,GRANT_ORG,QUAL_NAME,GRANT_DATE,END_DATE,CONTENT)";
					//调用方法，提取数据并入库
					getTypeInfo(eles,reportId,companyCrawlerService,i,sql,"认证部门","认证类型","02");
					count++;
				}else if("获得资质记录".equals(str)){
					sql = "INSERT INTO COM_ENTER_QUAL(REPORT_ID,QUAL_TYPE,GRANT_ORG,QUAL_NAME,GRANT_DATE,END_DATE,CONTENT)";
					//调用方法，提取数据并入库
					getTypeInfo(eles,reportId,companyCrawlerService,i,sql,"认定部门","资质类型","03");
					count++;
				}else if("获得奖励记录".equals(str)){
					sql = "INSERT INTO COM_ENTER_QUAL(REPORT_ID,QUAL_TYPE,GRANT_ORG,QUAL_NAME,GRANT_DATE,END_DATE,CONTENT)";
					//调用方法，提取数据并入库
					getTypeInfo(eles,reportId,companyCrawlerService,i,sql,"奖励部门","奖励名称","04");
					count++;
				}else if("出入境检验检疫绿色通道信息".equals(str)){
					sql = "INSERT INTO COM_CUSTORM_FAST_TRACK(REPORT_ID,EXEM_TYPE,APPROVAL_ORG,EXEM_MERCH_NAME,END_DATE)";
					//调用方法，提取数据并入库
					getTypeInfo(eles,reportId,companyCrawlerService,i,sql,"批准部门","出口商品名称","01");
					count++;
				}else if("进出口商品免检信息".equals(str)){
					sql = "INSERT INTO COM_CUSTORM_FAST_TRACK(REPORT_ID,EXEM_TYPE,APPROVAL_ORG,EXEM_MERCH_NAME,EXEM_NO,END_DATE)";
					//调用方法，提取数据并入库
					getTypeInfo(eles,reportId,companyCrawlerService,i,sql,"批准部门","免检商品名称","02");
					count++;
				}else if("进出口商品检验分类监管信息".equals(str)){
					sql = "INSERT INTO COM_IMEX_SUPERVISION(REPORT_ID,SUPER_ORG,SUPER_COUNCIL,SUPER_LEVEL,START_DATE,END_DATE)";
					//调用方法，提取数据并入库
					getNoTypeInfo(eles,reportId,companyCrawlerService,i,sql,"监管部门","管辖直属局");
					count++;
				}else if("上市公司或有事项".equals(str)){
					sql = "INSERT INTO COM_LISTED_CORPOR(REPORT_ID,REPORT_ORG,MATTER,INFO_DATE)";
					//调用方法，提取数据并入库
					getNoTypeInfo(eles,reportId,companyCrawlerService,i,sql,"报送机构","或有事项");
					count++;
				}else if("拥有专利情况".equals(str)){
					sql = "INSERT INTO COM_PATENT_CASE(REPORT_ID,PATENT_NAME,PATENT_NO,APP_DATE,GRANT_DATE,EFFECTIVE_YEAR)";
					//调用方法，提取数据并入库
					getNoTypeInfo(eles,reportId,companyCrawlerService,i,sql,"专利名称","专利号");
					count++;
				}else if("公用事业缴费记录".equals(str)){
					sql = "INSERT INTO COM_PUB_COST_PAY_RECORD(REPORT_ID,SERIAL_NO,PUB_COM_NAME,INFO_TYPE,STATIC_DATE,PAY_STATUS,LAST_PAY_DATE,TOTAL_ARREAR_SUM,MAX_ARREAR_OCCUR_DATE,MAX_ARREAR_SUM)";
					//调用方法，提取数据并入库
					String serial_no = UuidUtil.get32UUID();  //生成流水号
					getOtherInfo(eles,reportId,companyCrawlerService,i,sql,serial_no);
					count++;
				}
				if(count==16||str.contains("声明信息明细")){
					break;
				}
			}catch(Exception e){
				logger.info(e.getMessage());
			}
		}
	}
	
	//获取欠税记录等信息，并入库(不含有区别类型)(欠税记录,进出口商品检验分类监管信息,上市公司或有事项,拥有专利情况)
	private void getNoTypeInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start,String sql,String title1,String title2){
		Map<String,String> map = new HashMap<String,String>();
		String sqlV = "";
		//爬取数据
		Element ee = eles.get(start+1);
		if(ee.hasText()){
			List<Element> rows = ee.select("tr");
			for(int j=0;j<rows.size();j++){
				String sqlValue = "'"+reportId+"',";
				String str = rows.get(j).text().trim();
				if(!str.contains(title1)&&!str.contains(title2)){
					List<Element> cols = rows.get(j).select("td");
					//记录有备注的行
					str = cols.get(0).text().trim();
					//拼接字段值
					for(int t=0;t<cols.size();t++){
						sqlValue = sqlValue+"'"+cols.get(t).text().trim()+"',";
					}
					sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION";
				}
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
	
	//获取企业资质等信息，并入库(含有区别类型)(获得许可记录,获得认证记录,获得资质记录,获得奖励记录,出入境检验检疫绿色通道信息,进出口商品免检信息)
	private void getTypeInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start,String sql,String title1,String title2,String flag){
		Map<String,String> map = new HashMap<String,String>();
		String sqlV = "";
		//爬取数据
		Element ee = eles.get(start+1);
		if(ee.hasText()){
			List<Element> rows = ee.select("tr");
			for(int j=0;j<rows.size();j++){
				String sqlValue = "'"+reportId+"','"+flag+"',";
				String str = rows.get(j).text().trim();
				if(!str.contains(title1)&&!str.contains(title2)){
					List<Element> cols = rows.get(j).select("td");
					//记录有备注的行
					str = cols.get(0).text().trim();
					//拼接字段值
					for(int t=0;t<cols.size();t++){
						sqlValue = sqlValue+"'"+cols.get(t).text().trim()+"',";
					}
					sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION";
				}
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
	
	//获取民事判决记录等信息，并入库(不含有流水号和区别类型)(民事判决记录)
	private void getJudgeInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start,String sql){
		Map<String,String> map = new HashMap<String,String>();
		String sqlV = "";
		//爬取数据
		Element ee = eles.get(start+1);
		if(ee.hasText()){
			List<Element> cols = ee.select("tr>td");
			String sqlValue = "'"+reportId+"',";
			for(int i=0;i<cols.size();i++){
				String str = cols.get(i).text().trim().replace("：", ":");
				if(!"".equals(str)){
					String[] list = str.split(":");
					sqlValue = sqlValue+"'"+list[1].trim()+"',";
				}
			}
			sqlV = sqlValue.substring(0, sqlValue.length()-1);
		}
		if(!"".equals(sqlV)){
			sql = sql+"VALUES("+sqlV+")";
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
	
	//获取社保记录等信息，并入库(含有流水号)(强制执行记录,行政处罚记录,社会保险参保缴费记录,住房公积金缴费记录,公用事业缴费记录)
	private void getOtherInfo(List<Element> eles,String reportId,CompanyCrawlerManager companyCrawlerService,int start,String sql,String flag){
		Map<String,String> map = new HashMap<String,String>();
		
		String sqlV = "";
		//爬取数据
		Element ee = eles.get(start+1);
		if(ee.hasText()){
			List<Element> cols = ee.select("tr>td");
			String sqlValue = "'"+reportId+"','"+flag+"',";
			for(int i=0;i<cols.size();i++){
				String str = cols.get(i).text().trim().replace("：", ":");
				if(!"".equals(str)){
					String[] list = str.split(":");
					sqlValue = sqlValue+"'"+list[1].trim()+"',";
				}
			}
			sqlV = sqlValue.substring(0, sqlValue.length()-1);
		}
		if(!"".equals(sqlV)){
			sql = sql+"VALUES("+sqlV+")";
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
