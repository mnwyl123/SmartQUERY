package com.dcits.credit.clawer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dcits.credit.service.crawler.CompanyCrawlerManager;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.StringUtil;


/**
 * 解析Element元素
 * @author wangwme
 *
 */
public class ElementParseUtil {
	
	protected Logger logger = Logger.getLogger(this.getClass());
	
	private static Map<String,String> sqlMap = new HashMap<String,String>();
	private StringBuffer sqlBuffer = new StringBuffer();
	private CompanyCrawlerManager companyCrawlerService = null;
	
	public ElementParseUtil(CompanyCrawlerManager companyCrawlerService){
		this.companyCrawlerService = companyCrawlerService;
	}
	
	//报告头
	public String reportHead(List<Element> eles,int bgbz,int sfbz,int yyts,int bgsm,String query_org_code){
		if(bgbz==-1 && sfbz==-1 && yyts==-1 && bgsm==-1) return null;
		sqlBuffer.setLength(0); //清空
		String report_id = null;
		String bgbz_col = null;
		String bgbz_val = null;
		String sfbz_val = null;
		try {
			if(bgbz>-1){
				//报告标志
				Element bgbz_element = eles.get(bgbz);
				String left = bgbz_element.getElementsByClass("f-floatleft").get(0).text().replaceAll("\r|\n|:|：|报告编号|查询机构", "");
				String right = bgbz_element.getElementsByClass("f-floatright").get(0).text().replaceAll("\r|\n|:|：|报告时间|查询原因", "");
				report_id = left.substring(0,22);
				String time = right.substring(0,17);
				String reason = right.substring(17).trim();
				bgbz_col = "REPORT_ID,ORG_CODE,REPORT_TIME,QUERY_REASON";
				bgbz_val = "'"+report_id+"',encrypt_dec('"+query_org_code+"'),encrypt_dec('"+time+"'),encrypt_dec('"+reason+"')";
			}
			if(sfbz>-1){
				//身份标识
				Element sfbz_element = eles.get(sfbz);
				Elements select = sfbz_element.select("tr");
				for(int i = 0; i<select.size(); i++){
					String key = select.get(i).select("th>strong").get(0).text();
					String val = select.get(i).select("td").get(0).text();
					if("企业名称".equals(key)){
						bgbz_col += ",ENT_NAME";
						bgbz_val += ",encrypt_dec('"+val+"')";
					}else{
						if(sfbz_val != null){
							sfbz_val += " union all ";
						}else{
							sfbz_val = "";
						}
						sfbz_val += " select '"+report_id+"',encrypt_dec('"+key+"'),encrypt_dec('"+val+"') from dual";
					}
				}
			}
			if(yyts>-1){
				//异议提示
				String yyts_str = eles.get(yyts).select("ul>li>span").get(0).text();
				//信息主体对信用报告内容提出了1笔异议且正在处理中，请浏览时注意阅读相关内容。
				String obj_lab_item = yyts_str.substring(yyts_str.indexOf("了")+1,yyts_str.indexOf("笔")); 
				bgbz_col += ",OBJ_LAB_ITEM";
				bgbz_val += ",'"+obj_lab_item+"'";
			}
			if(bgsm>-1){
				//报告说明
				Elements tds = eles.get(bgsm).select("td");
				String text = tds.get(tds.size()-1).text();
				String regexp = "(\\d{1,}\\.\\d{2})|(\\d{4}-\\d{2})";
				Pattern p = Pattern.compile(regexp);
				Matcher m = p.matcher(text);
				int groupCount = m.groupCount();
				if(groupCount==2){
					m.find();
					bgbz_col += ",RATE_EXCHANGE,EFFE_DATE_RATE";
					bgbz_val += ",'"+m.group();
					m.find();
					bgbz_val +="','"+m.group()+"'";
				}
			}
			//---数据入库开始
			//报告头信息
			sqlBuffer.append("insert into COM_REPORT_INFO(");
			sqlBuffer.append(bgbz_col);
			sqlBuffer.append(") values (");
			sqlBuffer.append(bgbz_val);
			sqlBuffer.append(")");
			executeSQL(sqlBuffer.toString());
			//身份信息
			String sfbz_sql = "insert into COM_IDENT_BASIC(REPORT_ID,TYPE_ENT_IDENT,NUM_ENT_INDENT) "+sfbz_val;
			executeSQL(sfbz_sql);
			//---数据入库结束
		} catch (Exception e) {
			logger.error("报告头信息单元(reportHead)方法入库失败：",e);
		}
		if(StringUtil.isEmpty(report_id) || report_id.trim().length() != 22) logger.error("报告编号获取异常，解析失败！");
		return report_id;
	}
	
	//基本信息
	public void baseInfo(List<Element> eles,int jbxx,String report_id){
		if(jbxx==-1) return;
		try {
			Element jbxx_el = eles.get(jbxx);
			Elements title = jbxx_el.select("div>img");
			Elements content = jbxx_el.select("table");
			int jbgkxx = -1;//基本概况信息
			int zczbjzyczrxx = -1;//注册资本及主要出资人信息
			int zyzcryxx = -1;//主要组成人员信息
			int sjjg = -1;//上级机构
			int sjkzr = -1;//实际控制人

			for(int i = 0;i<title.size(); i++){
				String text = title.get(i).parent().text();
				if(text==null) continue;
				if(text.contains("基本概况信息")){
					jbgkxx = i;
				}else if(text.contains("注册资本及主要出资人信息")){
					zczbjzyczrxx = i;
				}else if(text.contains("主要组成人员信息")){
					zyzcryxx = i;
				}else if(text.contains("上级机构")){
					sjjg = i;
				}else if(text.contains("实际控制人")){
					sjkzr = i;
				}
				if(jbgkxx != -1 && zczbjzyczrxx !=-1 && zyzcryxx != -1 && sjjg != -1 && sjkzr != -1) break;
			}
			if(content.size()>=title.size()){
				Map<String,String> htmlMap = new HashMap<String,String>();
				if(jbgkxx>-1){
					htmlMap.clear();
					//基本概况信息
					Element jbgkxx_el = content.get(jbgkxx);
					Elements ths = jbgkxx_el.select("th");
					Elements tds = jbgkxx_el.select("td");
					for(int i=0; i<ths.size(); i++){
						htmlMap.put(ths.get(i).text(), tds.get(i).text());
					}
					String jbgkxx_sql = MapsTransSQLUtil.mapTransSQL(htmlMap,"COM_CREDIT_BASIC_INFO",report_id);
					executeSQL(jbgkxx_sql);
				}
				if(zczbjzyczrxx>-1){
					htmlMap.clear();
					//注册资本及主要出资人信息
					Elements zczbjzyczrxx_els = content.get(zczbjzyczrxx).select("tr");
					String rc_text = title.get(zczbjzyczrxx).parent().select("span").get(0).text();
					String REIG_CAPITAL = MapsTransSQLUtil.matchStr(rc_text,"([1-9]\\d{1,}\\.\\d{1,})"); //注册资本
					String NUM_INVEST = "0"; //主要出资人个数
					String DATE_UPDATE_INVEST = ""; //更新日期
					if(zczbjzyczrxx_els.size()>2){
						//主表
						NUM_INVEST = (zczbjzyczrxx_els.size()-2)+"";
						String dui_text = zczbjzyczrxx_els.get(zczbjzyczrxx_els.size()-1).select("td").last().text();
						DATE_UPDATE_INVEST = MapsTransSQLUtil.matchStr(dui_text,"(\\d{4}-\\d{2}-\\d{2})"); 
						String main_sql = "insert into COM_INVESTOR(REIG_CAPITAL,NUM_INVEST,DATE_UPDATE_INVEST,report_id) values ("
								+ "'" + REIG_CAPITAL + "','"
								+ NUM_INVEST + "','"
								+ DATE_UPDATE_INVEST + "','"
								+ report_id +"')";
						executeSQL(main_sql);
						//子表
						Elements ths = zczbjzyczrxx_els.get(0).select("th");
						for(int i=1; i<zczbjzyczrxx_els.size()-1; i++){
							Elements tds = zczbjzyczrxx_els.get(i).select("td");
							for(int j=0;j<ths.size();j++){
								htmlMap.put(ths.get(j).text(), tds.get(j).text());
							}
							String a = zczbjzyczrxx_els.get(i).select("td a").get(0).attr("onclick").toLowerCase();
							if(a.contains("idtype=1")){
								htmlMap.put("出资人身份类别", "1");
							}else if(a.contains("idtype=2")){
								htmlMap.put("出资人身份类别", "2");
							}
							String sub_sql = MapsTransSQLUtil.mapTransSQL(htmlMap,"COM_INVESTOR_INFO",report_id);
							executeSQL(sub_sql);
							htmlMap.clear();
						}
					}
				}
				if(zyzcryxx>-1){
					htmlMap.clear();
					//主要组成人员信息
					Elements zyzcryxx_els = content.get(zyzcryxx).select("tr");
					String  NUM_PEPL = "0";//主要组成人员个数
					String DATE_UPDATE_SENIOR = null; //更新日期
					if(zyzcryxx_els.size()>2){
						//主表
						NUM_PEPL = (zyzcryxx_els.size()-2)+"";
						String dus_text = zyzcryxx_els.get(zyzcryxx_els.size()-1).select("td").last().text();
						DATE_UPDATE_SENIOR = MapsTransSQLUtil.matchStr(dus_text,"(\\d{4}-\\d{2}-\\d{2})"); 
						String main_sql = "insert into COM_MAIN_MEMBER(REPORT_ID,NUM_PEPL,DATE_UPDATE_SENIOR) values ("
								+ "'" + report_id + "','"
								+ NUM_PEPL + "','"
								+ DATE_UPDATE_SENIOR +"')";
						executeSQL(main_sql);
						//子表
						Elements ths = zyzcryxx_els.get(0).select("th"); //标题
						for(int i=1; i<zyzcryxx_els.size()-1; i++){
							Elements tds = zyzcryxx_els.get(i).select("td");
							for(int j=0;j<ths.size();j++){
								htmlMap.put(ths.get(j).text(), tds.get(j).text());
							}
							String sub_sql = MapsTransSQLUtil.mapTransSQL(htmlMap,"COM_SENIOR_MANAGER_INFO",report_id);
							executeSQL(sub_sql);
							htmlMap.clear();
						}
					}
					
				}
				if(sjjg>-1){
					//上级机构
					Elements sjjg_els = content.get(sjjg).select("tr");
					Elements ths = sjjg_els.get(0).select("th"); //标题
					for(int i=1; i<sjjg_els.size(); i++){
						Elements tds = sjjg_els.get(i).select("td");
						for(int j=0;j<ths.size();j++){
							htmlMap.put(ths.get(j).text(), tds.get(j).text());
						}
						String sql = MapsTransSQLUtil.mapTransSQL(htmlMap,"COM_SUP_ORG",report_id);
						executeSQL(sql);
						htmlMap.clear();
					}
				}
				if(sjkzr>-1){
					//实际控制人
					htmlMap.clear();
					//主要组成人员信息
					Elements sjkzr_els = content.get(sjkzr).select("tr");
					String CONTROL_NUM = "0";//主要组成人员个数
					String DATE_UPDATE_ACT = null; //更新日期
					if(sjkzr_els.size()>1){
						//主表
						CONTROL_NUM = (sjkzr_els.size()-1)+"";
						DATE_UPDATE_ACT = sjkzr_els.get(sjkzr_els.size()-1).select("td").last().text();
						String main_sql = "insert into COM_CONTRO_PERSON(REPORT_ID,DATE_UPDATE_ACT,CONTROL_NUM) values ("
								+ "'" + report_id + "','"
								+ DATE_UPDATE_ACT + "','"
								+ CONTROL_NUM +"')";
						executeSQL(main_sql);
						//子表
						Elements ths = sjkzr_els.get(0).select("th"); //标题
						for(int i=1; i<sjkzr_els.size(); i++){
							Elements tds = sjkzr_els.get(i).select("td");
							for(int j=0;j<ths.size();j++){
								htmlMap.put(ths.get(j).text(), tds.get(j).text());
							}
							String a = sjkzr_els.get(i).select("td a").get(0).attr("onclick").toLowerCase();
							if(a.contains("idtype=1")){
								htmlMap.put("身份类型", "1");
							}else if(a.contains("idtype=2")){
								htmlMap.put("身份类型", "2");
							}
							String sub_sql = MapsTransSQLUtil.mapTransSQL(htmlMap,"COM_ACTUAL_CONTROLLER",report_id);
							executeSQL(sub_sql);
							htmlMap.clear();
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error("基本信息(baseInfo)入库方法失败：",e);
		}
	}
	
	//信息概要
	public void summary(List<Element> eles,int xxgy,String report_id){
		if(xxgy == -1) return;
		ComParseUtil.report_id = report_id;
		try {
			List<String> summary_sql = ComParseUtil.summaryUtil(eles,xxgy);
			for(String str : summary_sql){
				executeSQL(str);
			}
		} catch (Exception e) {
			logger.error("信息概要入库失败！",e);
		}
	}
	
	//非信贷记录明细
	public void noLoanSummary(List<Element> eles,int fxdjlmx,String report_id) throws Exception{
		if(fxdjlmx == -1) return;
		Element fxdjlmx_ele = eles.get(fxdjlmx);
		Elements title = fxdjlmx_ele.select("img");
		Elements table = fxdjlmx_ele.select("table");
		int gysyjfxx=-1;//公用事业缴费信息
		int other = -1;//其他，例如公用事业历史缴费记录
		for(int i=0;i<title.size();i++){
			String text = title.get(i).parent().text();
			if(text==null) continue;
			if(text!=null&&text.contains("公用事业缴费信息")){
				gysyjfxx=i;
			}else if(text!=null&&text.contains("公用事业历史缴费记录明细")){
				other=i;
			}
			if(gysyjfxx!=-1&&other!=-1) break;			
		}		
		//公用事业缴费信息
		if(gysyjfxx!=-1){
			Element table_gysyjfxx = table.get(gysyjfxx);
			Elements ths = table_gysyjfxx.select("th");
			Elements tds = table_gysyjfxx.select("td"); 
			Map<String,String> htmlMap = new HashMap<String,String>();
			if(ths.size()<tds.size()){//list
				for(int j=0;j<tds.size()/ths.size();j++){
					htmlMap.clear();
					for(int i=0;i<ths.size();i++){
						if(tds.get(i).text().trim().equals("查看")){//存在子表
							continue;         //此处先不解析以javascript生成的子表
						}	
						htmlMap.put(ths.get(i).text().trim(), tds.get(i).text().trim());
					}
					String gysyjfxx_sql = MapsTransSQLUtil.mapTransSQL(htmlMap,"COM_PUB_COST_PAY_RECORD",report_id);
					executeSQL(gysyjfxx_sql);
				}
				
			}else if(ths.size()==tds.size()){//map
				for(int i=0;i<ths.size();i++){
					htmlMap.put(ths.get(i).text().trim(), tds.get(i).text().trim());
				}
				String gysyjfxx_sql = MapsTransSQLUtil.mapTransSQL(htmlMap,"COM_PUB_COST_PAY_RECORD",report_id);
				executeSQL(gysyjfxx_sql);
			}	
		}
	}	

	//公共记录明细
	public void publicInfo(List<Element> eles,int ggjlmx,String report_id) throws Exception{
		if(ggjlmx == -1) return;
		Element ggjlmx_ele = eles.get(ggjlmx);
	    ComParseUtil.publicInfoUtil(ggjlmx_ele, report_id);	
	}
	
	//评级信息 
	public void ratingInfo(List<Element> eles,int pjxx,String report_id) throws Exception{
		if(pjxx == -1) return;
		Element pjxx_ele = eles.get(pjxx);		
	    ComParseUtil.ratingInfoUtil(pjxx_ele, report_id);	
	}

	//信贷记录明细
	public void loadDetail(List<Element> eles,int xdjlmx,String report_id){
		if(xdjlmx == -1) return;
		ComParseUtil.report_id = report_id;
		Element xdjlmx_el = eles.get(xdjlmx);
		try {
			List<String> loadDetail_sql = ComParseUtil.loadDetailUtil(xdjlmx_el);
			executeSQL(loadDetail_sql);
		} catch (Exception e) {
			logger.error("信贷记录明细入库失败！",e);
		}
	}
	
	//执行sql
	public static void executeSQL(String SQL) throws Exception{
		sqlMap.put("creatSql", SQL);		
//		companyCrawlerService.saveInfo(sqlMap);
//		System.out.println(SQL+";");
	}
	//执行sql
	public void executeSQL(List<String> sqls) throws Exception{
		for(String sql : sqls){
			executeSQL(sql);
		}
	}
	
}
