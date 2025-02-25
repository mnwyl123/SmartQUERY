package com.dcits.crawl.webdriver.crawler.personCredit;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.crawl.webdriver.crawler.companyCredit.clawer_2.ElementParseUtil;
import com.dcits.crawl.webdriver.crawler.companyCredit.clawer_2.MapsTransSQLUtil;

/**
 * 个人信用报告遗漏部分在此解析并入库
 * @author zhangyy
 *
 */
public class PerCrawlerUtil {

	//二、信息概要
	//数字解读
	public static void LoanDetail_szjd(int num,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService){
		Element szjd = eles.get(num);		
		Elements div_table=szjd.select("div,table");
		List<Integer> tableNum = new ArrayList<Integer>(); 
		int div=0;
		for(int i=0;i<div_table.size();i++){
			Element element = div_table.get(i);
			String text = element.text().trim();
			if(text.contains("（")&&text.contains("）")){
				text=text.substring(3);
			}
			if(("个人信用报告“数字解读”").equals(text)){
				div++;
			}else if(div!=0&&element.is("div")){
				break;
			}
			if(div!=0&&element.is("table")){
				tableNum.add(i);//拿到该小单元下的所有小小单元table号
			}	
		}
		List<String> sqlList = new ArrayList<String>();
		for(int taNum:tableNum){
			Element table = div_table.get(taNum);
			//数字解读
			String sql = ths_tds_szjd(table,reportId,"PER_BASIC","数字解读");
			sqlList.add(sql);
			updateMainSql(sqlList, "PER_BASIC",reportId);
		}			
	}	
	//信贷交易违约信息概要
	public static void LoanDetail_xdjywyxxgy(int num,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService){
		Element xdjywyxxgy = eles.get(num);		
		Elements div_table=xdjywyxxgy.select("div,table");
		List<Integer> tableNum = new ArrayList<Integer>(); 
		int div=0;
		for(int i=0;i<div_table.size();i++){
			Element element = div_table.get(i);
			String text = element.text().trim();
			if(text.contains("（")&&text.contains("）")){
				text=text.substring(3);
			}
			if(("信贷交易违约信息概要").equals(text)){
				div++;
			}else if(div!=0&&element.is("div")){
				break;
			}
			if(div!=0&&element.is("table")){
				tableNum.add(i);//拿到该小单元下的所有小小单元table号
			}	
		}
		List<String> mainSql = new ArrayList<String>();
		for(int taNum:tableNum){
			Element table = div_table.get(taNum);
			//被追偿信息汇总
			if(("被追偿信息汇总").equals(table.select("TR").get(0).text().trim())){
				String sql = ths_tds(table,reportId,"PER_RECOVER_INFO_DETAIL","被追偿信息汇总");
				mainSql.add(sql);
			}
			//呆账信息汇总
			if(("呆账信息汇总").equals(table.select("TR").get(0).text().trim())){
				String sql=ths_tds_main(table,reportId,"PER_LOAN_SUMMARY","呆账信息汇总");
				mainSql.add(sql);
			}
		}
		updateMainSql(mainSql,"PER_LOAN_SUMMARY",reportId);
	}
	
	//信贷交易授信及负债信息概要 
	public static void LoanDetail_xdjysxjfzxxgy(int num,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService){
		Element xdjywyxxgy = eles.get(num);		
		Elements div_table=xdjywyxxgy.select("div,table");
		List<Integer> tableNum = new ArrayList<Integer>(); 
		int div=0;
		for(int i=0;i<div_table.size();i++){
			Element element = div_table.get(i);
			String text = element.text().trim();
			if(text.contains("（")&&text.contains("）")){
				text=text.substring(3);
			}
			if(("信贷交易授信及负债信息概要").equals(text)){
				div++;
			}else if(div!=0&&element.is("div")){
				break;
			}
			if(div!=0&&element.is("table")){
				tableNum.add(i);//拿到该小单元下的所有小小单元table号
			}	
		}
		List<String> mainSql = new ArrayList<String>();
		for(int taNum:tableNum){
			Element table = div_table.get(taNum);
			//循环额度下分账户信息汇总
			if(("循环额度下分账户信息汇总").equals(table.select("TR").get(0).text().trim())){
				String sql = ths_tds_main(table,reportId,"PER_LOAN_SUMMARY","循环额度下分账户信息汇总");
				if(sql!=null && !("").equals(sql))
					mainSql.add(sql);
			}
			//循环贷账户信息汇总
			if(("循环贷账户信息汇总").equals(table.select("TR").get(0).text().trim())){
				String sql=ths_tds_main(table,reportId,"PER_LOAN_SUMMARY","循环贷账户信息汇总");
				if(sql!=null && !("").equals(sql))
					mainSql.add(sql);
			}
			//准贷记卡账户信息汇总
			if(("准贷记卡账户信息汇总").equals(table.select("TR").get(0).text().trim())){
				String sql=ths_tds_main(table,reportId,"PER_LOAN_SUMMARY","准贷记卡账户信息汇总");
				if(sql!=null && !("").equals(sql))
					mainSql.add(sql);
			}
			//相关还款责任信息汇总
			if(("相关还款责任信息汇总").equals(table.select("TR").get(0).text().trim())){
				String sql=xghkzexx_thtd(table,reportId,"PER_LOAN_REPAYER","相关还款责任信息汇总");	
				if(sql!=null && !("").equals(sql))
					mainSql.add(sql);
			}	
		}
		updateMainSql(mainSql,"PER_LOAN_SUMMARY",reportId);
	}
	
	//非信贷交易信息概要
	public static void LoanDetail_fxdjyxxgy(int num,List<Element> eles,String reportId,PersonCrawlerManager personCrawlerService){
		Element xdjywyxxgy = eles.get(num);		
		Elements div_table=xdjywyxxgy.select("div,table");
		List<Integer> tableNum = new ArrayList<Integer>(); 
		int div=0;
		for(int i=0;i<div_table.size();i++){
			Element element = div_table.get(i);
			String text = element.text().trim();
			if(text.contains("（")&&text.contains("）")){
				text=text.substring(3);
			}
			if(("非信贷交易信息概要").equals(text)){
				div++;
			}else if(div!=0&&element.is("div")){
				break;
			}
			if(div!=0&&element.is("table")){
				tableNum.add(i);//拿到该小单元下的所有小小单元table号
			}	
		}
		List<String> mainSql = new ArrayList<String>();
		for(int taNum:tableNum){
			Element table = div_table.get(taNum);
			//后付费业务欠费信息汇总
			if(("后付费业务欠费信息汇总").equals(table.select("TR").get(0).text().trim())){
				String sql = ths_tds(table,reportId,"PER_AFTER_PAY_OWE_INFO","后付费业务欠费信息汇总");
				if(sql!=null && !("").equals(sql))
					mainSql.add(sql);
			}			
		}
		updateMainSql(mainSql,"PER_LOAN_SUMMARY",reportId);
	}
	
	
	//单个信息单元数据入库：th_td(本该是td的地方有th) 表单元信息中插入到主表中的信息需要计算
	public static String ths_tds_mainCount(Element table,String report_id,String table_name,String table_value){
		String sql=null;
		Elements trs = table.select("TR");
		Elements ths = trs.get(1).select("TH");
		for(int i=2;i<trs.size();i++){
			Map<String, String> map =  new HashMap<String, String>();
			Elements tds = trs.get(i).select("TH,TD");
			for(int j=0;j<ths.size();j++){
				if(("--").equals(tds.get(j).text())){
					map.clear();
					break;					
				}
				map.put(ths.get(j).text(), tds.get(j).text());
			}
			try {
				if(map.size()!=0)
					sql = MapsTransSQLUtil.mapTransSQL_PER(map, table_name, table_value, report_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return sql;
	}
	
	
	//相关还款责任信息汇总 子表解析入库
	public static String xghkzexx_thtd(Element table,String report_id,String table_name,String table_value){
		String sql = null;
		List<String> sqlList = new ArrayList<String>();
		Elements trs = table.select("TR");			
		Map<String, String> map =  new HashMap<String, String>();
		for(int i=1;i<trs.size();i++){
			Elements tds = trs.get(i).select("TH,TD");						 				
			for(int j=0;j<tds.size();j++){			
				String colspan = null;
				int cols=0;
				if(tds.get(j).attr("colspan")!=null && !("").equals(tds.get(j).attr("colspan"))){
					colspan = tds.get(j).attr("colspan");
				    cols = Integer.parseInt(colspan);
				}
				if(colspan!=null && (i==1||i==5)){
					map.put("借款人身份类别", tds.get(j).text().trim().substring(1));
				}else if(colspan!=null && (i==2||i==6)){					
					map.put("还款责任类型", tds.get(j).text().trim());
					Elements ths_th = trs.get(i+1).select("TH,TD");
					Elements tds_td = trs.get(i+2).select("TH,TD");
					for(int t=0;t<tds_td.size()/cols;t++){
						for(int td=t*cols;td<cols;td++){
							if(("--").equals(tds_td.get(td).text().trim())){
								break;
							}else if(td==1||td==4){
								map.put("还款责任金额", tds_td.get(td).text().trim());
							}else{
								map.put(ths_th.get(td).text().trim(), tds_td.get(td).text().trim());
							}				
						}
						try {
							if(map.size()!=0){
								sql = MapsTransSQLUtil.mapTransSQL_PER(map, table_name, table_value, report_id);
								ElementParseUtil.executeSQL_PER(sql);
								sqlList.add(sql);
								map.clear();
							}				
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}	
					}	
						
				}
				
			}
		}
		//相关还款责任个数需插入子表
		if(sqlList.size()!=0){
			map.clear();
			map.put("相关还款责任个数", String.valueOf(sqlList.size()));
			try {
				sql = MapsTransSQLUtil.mapTransSQL_PER(map, "PER_LOAN_SUMMARY", table_value, report_id);				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return sql;
		}
		return null;
	}		
	//多个主表insert信息作update插入
	public static void updateMainSql(List<String> mainSql,String mainTabName,String report_id){
		for(String sql:mainSql){
			String[] sqlList = sql.split("\\(|\\)");
			String[] colList = sqlList[1].split(",");
			String[] valList = sqlList[3].substring(1, sqlList[3].length()-1).split("\\',\\'");
			StringBuffer updateSql =  new StringBuffer();			
			updateSql.append("update "+mainTabName+" set ");
			for(int i=0;i<colList.length;i++){
				updateSql.append(colList[i]+"='"+valList[i]+"',");
			}
			updateSql.delete(updateSql.lastIndexOf(","), updateSql.length());
			updateSql.append(" where report_id='"+report_id+"'");
			try {
				ElementParseUtil.executeUpdateSQL_PER(updateSql.toString());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	//单个信息单元数据入库：th_td(本该是td的地方有th) 表单元信息中全部是需要插入到主表中的信息(数字解读+通用)
	public static String ths_tds_szjd(Element table,String report_id,String table_name,String table_value){
		String sql=null;
		Elements trs = table.select("TR");
		Elements ths = trs.get(0).select("TH");
		for(int i=1;i<trs.size();i++){
			Map<String, String> map =  new HashMap<String, String>();
			Elements tds = trs.get(i).select("TH,TD");
			for(int j=0;j<ths.size();j++){
				if(("--").equals(tds.get(j).text())){
					map.clear();
					break;					
				}
				map.put(ths.get(j).text(), tds.get(j).text());
			}
			try {
				if(map.size()!=0)
					sql = MapsTransSQLUtil.mapTransSQL_PER(map, table_name, table_value, report_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return sql;
	}		
	//单个信息单元数据入库：th_td(本该是td的地方有th) 表单元信息中全部是需要插入到主表中的信息
	public static String ths_tds_main(Element table,String report_id,String table_name,String table_value){
		String sql=null;
		Elements trs = table.select("TR");
		Elements ths = trs.get(1).select("TH");
		for(int i=2;i<trs.size();i++){
			Map<String, String> map =  new HashMap<String, String>();
			Elements tds = trs.get(i).select("TH,TD");
			for(int j=0;j<ths.size();j++){
				if(("--").equals(tds.get(j).text())){
					map.clear();
					break;					
				}
				map.put(ths.get(j).text(), tds.get(j).text());
			}
			try {
				if(map.size()!=0)
					sql = MapsTransSQLUtil.mapTransSQL_PER(map, table_name, table_value, report_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return sql;
	}			
	//单个信息单元数据入库：th_td(本该是td的地方有th) 
	public static String ths_tds(Element table,String report_id,String table_name,String table_value){
		String sql=null;
		Elements trs = table.select("TR");
		Elements ths = trs.get(1).select("TH");
		try {
			for(int i=2;i<trs.size();i++){
				Map<String, String> map =  new HashMap<String, String>();
				Elements tds = trs.get(i).select("TH,TD");
				for(int j=0;j<ths.size();j++){
					if(("--").equals(tds.get(j).text())){
						map.clear();
						break;					
					}else if(("合计").equals(tds.get(j).text())){
						//合计作为最后一行，直接返回sql进行update拼接
						map.clear();
						for(int t=1;t<ths.size();t++){
							map.put(ths.get(t).text(), tds.get(t).text());
						}
						sql = MapsTransSQLUtil.mapTransSQL_PER(map, "PER_LOAN_SUMMARY", table_value, report_id);
						return sql;
					}
					map.put(ths.get(j).text(), tds.get(j).text());
				}
				if(map.size()!=0){
					//解析成sql入库
					sql = MapsTransSQLUtil.mapTransSQL_PER(map, table_name, table_value, report_id);
					ElementParseUtil.executeSQL_PER(sql);
				}		
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return sql;
	}		
	
}
