package com.dcits.credit.clawer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dcits.platform.util.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import org.jsoup.select.Elements;

import com.dcits.platform.util.StringUtil;

public class ComParseUtil {
	private static Logger logger = Logger.getLogger(ComParseUtil.class);
	public static String report_id = null;
	
	////解析信息概要
	public static List<String> summaryUtil(List<Element> eles,int xxgy) throws Exception{
		Elements tabs = eles.get(xxgy).select("table");
		//信用提示信息
		Map<String,String> xytsxx = new HashMap<String,String>(); 
		//借贷交易汇总
		Map<String,String> jdjyhz = new HashMap<String,String>(); 
		//存放各模块拼接的sql
		List<String> summary_sql = new ArrayList<String>();
//		//借贷交易汇总-未结清其他交易汇总(对应文档表格B- 86 )
//		List<String> jdjyhz_qt_wjq = null; 
//		//借贷交易汇总-已结清其他交易汇总(对应文档表格B- 88 )
//		List<String> jdjyhz_qt_yjq = null; 
//		//借贷交易汇总-负债历史汇总(对应文档表格B- 90)
//		List<String> fzls = null;
//		//担保交易汇总
//		List<String> dbjyhz = null; 
//		//担保交易汇总-未结清担保交易汇总(对应文档表格B- 92)
//		List<String> dbjyhz_wjq = null;
//		//担保交易汇总-已结清担保交易汇总(对应文档表格B- 94)
//		List<String> dbjyhz_yjq = null;
//		//授信协议汇总信息
//		List<String> sxxy = null;
//		//相关还款责任汇总信息
//		List<String> xghkzrhz = null;
//		//关还款责任汇总信息-借贷交易
//		List<String> xghkzrhz_jd = null;
//		//关还款责任汇总信息-担保交易
//		List<String> xghkzrhz_db = null;
		
		int dbjyflhztm_wjq = 0;//担保交易分类汇总条目(未结清)
		int dbjyflhztm_yjq = 0;//担保交易分类汇总条目(已结清)
		int hkzrlxsl_jd = 0;//相关还款责任汇总->还款责任类型数量(借贷交易)
		int hkzrlxsl_db = 0;//相关还款责任汇总->还款责任类型数量(担保交易)
		for(int i=0; i<tabs.size(); i++){
			Elements trs = tabs.get(i).select("tr"); //table
			Elements select = trs.get(0).select("th"); //first tr
			String firstText = select.text();
			///信用提示信息开始start
			//信贷交易提示
			if(firstText.indexOf("首次有信贷交易的年份")>-1 && firstText.indexOf("发生信贷交易的机构数")>-1){
				for(int j=1; j<trs.size(); j++){
					twoElementsToMap(xytsxx,select,trs.get(j).select("td"));
				}
				continue;
			}
			if(firstText.indexOf("借贷交易")>-1 && firstText.indexOf("担保交易")>-1){
				if(xytsxx == null){
					xytsxx = new HashMap<String,String>();
				}
				Elements xdjyts_part2_tds = trs.select("td");
				if(xdjyts_part2_tds.size()>=7){
					String[] axdjyts_arr = new String[]{"借贷交易余额","担保交易余额","被追偿的借贷交易余额","关注类担保交易余额","关注类借贷交易余额","不良类担保交易余额","不良类借贷交易余额"};
					for(int j=0; j<axdjyts_arr.length; j++){
						xytsxx.put(axdjyts_arr[j], xdjyts_part2_tds.get(j).text());
					}
				}else{
					throw new Exception("信贷交易提示第二部分解析异常");
				}
				continue;
			}
			//非信贷交易及公共信息
			if(firstText.indexOf("非信贷交易账户数")>-1 && firstText.indexOf("欠税记录条数")>-1){
				for(int j=1; j<trs.size(); j++){
					twoElementsToMap(xytsxx,select,trs.get(j).select("td"));
				}
				continue;
			}
			///信用提示信息结束end
			//---------------------------------------------------------//
			///借贷交易汇总信息开始start
			//未结清借贷交易汇总
			if(firstText.indexOf("由资产管理公司处置的债务")>-1 && firstText.indexOf("逾期")>-1){
				String[] wjqxdjyhz_arr = new String[]{"未结清资产处置业务账户数","未结清资产处置业务余额","未结清最近一次处置日期","未结清垫款业务账户数","未结清垫款业务余额","未结清垫款最近一次还款日期","未结清逾期本金","未结清逾期利息及其他","未结清逾期总额"};
				Elements wjqxdjyhz_tds = trs.select("td");
				if(wjqxdjyhz_tds.size()>=9){
					for(int j=0; j<wjqxdjyhz_arr.length; j++){
						jdjyhz.put(wjqxdjyhz_arr[j], wjqxdjyhz_tds.get(j).text());
					}
				}
				continue;
			}
			//未结清其他借贷交易分类汇总
			if(firstText.indexOf("正常类")>-1 && firstText.indexOf("正常类账户数")==-1){
				String all_th = trs.select("th").text();
				if(all_th.indexOf("中长期借款")>-1 
					||all_th.indexOf("短期借款")>-1 
					||all_th.indexOf("循环透支")>-1 
					||all_th.indexOf("贴现")>-1
				){
					for(int j=2; j<trs.size(); j++){
						String first_col = trs.get(j).text(); //当前行的文本值
						Elements tds = trs.get(j).select("td");
						if(first_col.indexOf("中长期借款")>-1){
							qtjdjyflhz_wjq(summary_sql,tds,"中长期借款");
						}
						if(first_col.indexOf("短期借款")>-1){
							qtjdjyflhz_wjq(summary_sql,tds,"短期借款");
						}
						if(first_col.indexOf("循环透支")>-1){
							qtjdjyflhz_wjq(summary_sql,tds,"循环透支");
						}
						if(first_col.indexOf("贴现")>-1){
							qtjdjyflhz_wjq(summary_sql,tds,"贴现");
						}
						if(first_col.indexOf("合计")>-1){
							qtjdjyflhz_wjq(summary_sql,tds,"合计");
						}
					}
				}
				continue;
			}
			//已结清借贷交易汇总
			if(firstText.indexOf("由资产管理公司处置的债务")>-1 && firstText.indexOf("逾期")==-1){
				String[] yjqxdjyhz_arr = new String[]{"已结清资产处置业务账户数","已结清资产处置业务金额","已结清处置完成日期","已结清垫款业务账户数","已结清垫款业务金额","已结清结清日期"};
				Elements yjqxdjyhz_tds = trs.select("td");
				if(yjqxdjyhz_tds.size()>=6){
					for(int j=0; j<yjqxdjyhz_arr.length; j++){
						jdjyhz.put(yjqxdjyhz_arr[j], yjqxdjyhz_tds.get(j).text());
					}
				}
				continue;
			}
			//已结清其他借贷交易分类汇总
			if(firstText.indexOf("正常类账户数")>-1){
				String all_th = trs.select("th").text();
				if(all_th.indexOf("中长期借款")>-1 
					||all_th.indexOf("短期借款")>-1 
					||all_th.indexOf("循环透支")>-1 
					||all_th.indexOf("贴现")>-1
				){
					for(int j=1; j<trs.size(); j++){
						String first_col = trs.get(j).text(); //当前行的文本值
						Elements tds = trs.get(j).select("td");
						if(first_col.indexOf("中长期借款")>-1){
							qtjdjyflhz_yjq(summary_sql,tds,"中长期借款");
						}
						if(first_col.indexOf("短期借款")>-1){
							qtjdjyflhz_yjq(summary_sql,tds,"短期借款");
						}
						if(first_col.indexOf("循环透支")>-1){
							qtjdjyflhz_yjq(summary_sql,tds,"循环透支");
						}
						if(first_col.indexOf("贴现")>-1){
							qtjdjyflhz_yjq(summary_sql,tds,"贴现");
						}
						if(first_col.indexOf("合计")>-1){
							qtjdjyflhz_yjq(summary_sql,tds,"合计");
						}
					}
				}
				continue;
			}
			//负债历史汇总
			if(firstText.indexOf("全部负债")>-1 && firstText.indexOf("关注类负债")>-1){
				if(trs.size()>2){
					jdjyhz.put("负债历史月份数", (trs.size()-2)+"");
					for(int j=2; j<trs.size(); j++){
						Elements th_and_td = trs.get(j).select("th,td");
						if(th_and_td.size()==11){
							String sql = "insert into com_debt_change_hist_summ(report_id,MONTH,ALL_NUM_DEBT_BALANCE,ALL_DEBT_BALANCE,NUM_FOCUS_DEBT_BALANCE,FOCUS_DEBT_BALANCE,NUM_ACCOUNT_BAD_DEBT,BAD_DEBT_BALANCE,NUM_OVER_DEBT,OVER_SUM,NUM_OVER_PRINCIPAL,OVER_PRINCIPAL) values ("
										+"'"+report_id+"','"+th_and_td.get(0).text()+"','"+th_and_td.get(1).text()+"','"+th_and_td.get(2).text()+"','"+th_and_td.get(3).text()+"','"+th_and_td.get(4).text()+"','"+th_and_td.get(5).text()+"','"+th_and_td.get(6).text()+"','"+th_and_td.get(7).text()+"','"+th_and_td.get(8).text()+"','"+th_and_td.get(9).text()+"','"+th_and_td.get(10).text()+"')";
							summary_sql.add(sql);
						}else{
							throw new Exception("借贷交易汇总->负债历史汇总解析异常");
						}
					}
				}
				continue;
			}
			///借贷交易汇总信息结束end
			///担保交易汇总信息开始start
			//未结清担保交易汇总
			//未结清担保交易汇总part1
			if(firstText.indexOf("正常类")>-1 && firstText.indexOf("正常类账户数")==-1){
				//未统计合计
				String all_th = trs.select("th").text();
				if(all_th.indexOf("银行承兑汇票")>-1 
					||all_th.indexOf("信用证")>-1 
				){
					for(int j=2; j<trs.size(); j++){
						String first_col = trs.get(j).text(); //当前行的文本值
						Elements tds = trs.get(j).select("td");
						if(first_col.indexOf("银行承兑汇票")>-1){
							dbjyhz_wjq(summary_sql,tds,"银行承兑汇票");
						}
						if(first_col.indexOf("信用证")>-1){
							dbjyhz_wjq(summary_sql,tds,"信用证");
						}
						dbjyflhztm_wjq++;
					}
				}
				continue;
			}
			//未结清担保交易汇总part2
			if(firstText.indexOf("正常类")>-1 && firstText.indexOf("正常类账户数")==-1){
				//未统计合计
				String all_th = trs.select("th").text();
				if(all_th.indexOf("银行保函")>-1 
					||all_th.indexOf("其他担保交易")>-1 
				){
					for(int j=2; j<trs.size(); j++){
						String first_col = trs.get(j).text(); //当前行的文本值
						Elements tds = trs.get(j).select("td");
						if(first_col.indexOf("银行保函")>-1){
							dbjyhz_yjq(summary_sql,tds,"银行保函");
						}
						if(first_col.indexOf("其他担保交易")>-1){
							dbjyhz_yjq(summary_sql,tds,"其他担保交易");
						}
						dbjyflhztm_wjq++;
					}
				}
				continue;
			}
			//已结清担保交易汇总part1
			if(firstText.indexOf("正常类账户数")>-1){
				//未统计合计
				String all_th = trs.select("th").text();
				if(all_th.indexOf("银行承兑汇票")>-1 
					||all_th.indexOf("信用证")>-1 
				){
					for(int j=1; j<trs.size(); j++){
						String first_col = trs.get(j).text(); //当前行的文本值
						Elements tds = trs.get(j).select("td");
						if(first_col.indexOf("银行承兑汇票")>-1){
							dbjyhz_yjq(summary_sql,tds,"银行承兑汇票");
						}
						if(first_col.indexOf("信用证")>-1){
							dbjyhz_yjq(summary_sql,tds,"信用证");
						}
						dbjyflhztm_yjq++;
					}
				}
				continue;
			}
			//已结清担保交易汇总part2
			if(firstText.indexOf("正常类账户数")>-1){
				//未统计合计
				String all_th = trs.select("th").text();
				if(all_th.indexOf("银行保函")>-1 
					||all_th.indexOf("其他担保交易")>-1 
				){
					for(int j=1; j<trs.size(); j++){
						String first_col = trs.get(j).text(); //当前行的文本值
						Elements tds = trs.get(j).select("td");
						if(first_col.indexOf("银行保函")>-1){
							dbjyhz_yjq(summary_sql,tds,"银行保函");
						}
						if(first_col.indexOf("其他担保交易")>-1){
							dbjyhz_yjq(summary_sql,tds,"其他担保交易");
						}
						dbjyflhztm_yjq++;
					}
				}
				continue;
			}
			///担保交易汇总信息结束end
			///授信协议汇总信息开始start
			if(firstText.indexOf("非循环信用额度")>-1){
				String text = tabs.select("ul").text();
				String is_exists = "否";
				if(StringUtil.isEmpty(text) && text.indexOf("由于存在授信限额的控制")>-1) is_exists = "是";
				if(trs.size()>2){
					Elements tds = trs.get(2).select("td");
					if(tds.size()==6){
						String sql = "insert into COM_CREDIT_GRANT_SUM(REPORT_ID,TOTAL_NON_REV_CREDT,USE_TOTAL_NON_REV_CREDT,REMAIN_TOTAL_NON_REV_CREDT,TOTAL_REV_CREDT,USE_TOTAL_REV_CREDT,REMAIN_TOTAL_REV_CREDT,WHET_CREDIT_LIMT) values ("
									+"'"+report_id+"','"+tds.get(0).text()+"','"+tds.get(1).text()+"','"+tds.get(2).text()+"','"+tds.get(3).text()+"','"+tds.get(4).text()+"','"+tds.get(5).text()+"','"+is_exists+"')";
						summary_sql.add(sql);
					}else{
						throw new Exception("授信协议汇总信息解析异常");
					}
				}
				continue;
			}
			///授信协议汇总信息结束end
			///相关还款责任汇总信息开始start
			//借贷交易
			if(firstText.indexOf("责任类型")>-1 && firstText.indexOf("被追偿业务")>-1 && trs.size()>2){
				for(int j=2; j<trs.size(); j++){
					String type = trs.get(j).select("th").get(0).text();
					Elements tds = trs.get(j).select("td");
					if(type.indexOf("个人信贷交易共同")>-1){
						xghkzrhz_jd(summary_sql,tds,"个人信贷交易共同还款人/共同债务人");
					}
					if(type.indexOf("保证人/反担保人")>-1){
						xghkzrhz_jd(summary_sql,tds,"保证人/反担保人");
					}
					if(type.indexOf("票据承兑人")>-1){
						xghkzrhz_jd(summary_sql,tds,"票据承兑人");
					}
					if(type.indexOf("应收账款债务人")>-1){
						xghkzrhz_jd(summary_sql,tds,"应收账款债务人");
					}
					if(type.indexOf("供应链中")>-1){
						xghkzrhz_jd(summary_sql,tds,"供应链中核心企业");
					}
					if(type.indexOf("其他")>-1){
						xghkzrhz_jd(summary_sql,tds,"其他");
					}
					if(type.indexOf("合计")>-1){
						xghkzrhz_jd(summary_sql,tds,"合计");
					}
					hkzrlxsl_jd++;
				}
				continue;
			}
			//担保交易
			if(firstText.indexOf("责任类型")>-1 && firstText.indexOf("担保交易")>-1 && trs.size()>2){
				for(int j=2; j<trs.size(); j++){
					String type = trs.get(j).select("th").get(0).text();
					Elements tds = trs.get(j).select("td");
					if(type.indexOf("个人信贷交易共同")>-1){
						xghkzrhz_db(summary_sql,tds,"个人信贷交易共同还款人/共同债务人");
					}
					if(type.indexOf("保证人/反担保人")>-1){
						xghkzrhz_db(summary_sql,tds,"保证人/反担保人");
					}
					if(type.indexOf("票据承兑人")>-1){
						xghkzrhz_db(summary_sql,tds,"票据承兑人");
					}
					if(type.indexOf("应收账款债务人")>-1){
						xghkzrhz_db(summary_sql,tds,"应收账款债务人");
					}
					if(type.indexOf("供应链中")>-1){
						xghkzrhz_db(summary_sql,tds,"供应链中核心企业");
					}
					if(type.indexOf("其他")>-1){
						xghkzrhz_db(summary_sql,tds,"其他");
					}
					if(type.indexOf("合计")>-1){
						xghkzrhz_db(summary_sql,tds,"合计");
					}
					hkzrlxsl_db++;
				}
				continue;
			}
			///相关还款责任汇总信息结束end
		}
		///处理页面特殊数据信息开始start
		//担保交易汇总信息
		if(dbjyflhztm_wjq != 0 || dbjyflhztm_yjq != 0){
			summary_sql.add("insert into COM_GUAR_TRANS_IN(REPORT_ID,NUM_SECURED_TRANS_CAT,NUM_SECURED_NOTRANS) values ('"+report_id+"','"+dbjyflhztm_wjq+"','"+dbjyflhztm_yjq+"')");
		}
		//相关还款责任汇总信息
		if(hkzrlxsl_jd != 0 || hkzrlxsl_db != 0){
			summary_sql.add("insert into COM_REPAY_REP_NUM(REPORT_ID,NUM_REPAY_LIA,NUM_REPAY_LIA_DB) values ('"+report_id+"','"+hkzrlxsl_jd+"','"+hkzrlxsl_db+"')");
		}
		///处理页面特殊数据信息结束end
		
		String xytsxx_sql = MapsTransSQLUtil.mapTransSQL(xytsxx,"COM_INFO_CREDIT",report_id); //信用提示信息
		String jdjyhz_sql = MapsTransSQLUtil.mapTransSQL(jdjyhz,"COM_LEND_TRANS",report_id); //借贷交易汇总
		summary_sql.add(xytsxx_sql);
		summary_sql.add(jdjyhz_sql);
		return summary_sql;
	}
	//其他借贷交易分类汇总-未结清
	public static void qtjdjyflhz_wjq(List<String> sqlList,Elements tds,String type){
		String c2 = tds.get(0).text(); //第2列
		if(!"0".equals(c2)){
			//正常类
			String sql = "insert into COM_LEND_TRANS_OTHER(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLAS,NUM_ACCOUNT,BALANCE_NUM) values ("
					+ "'"+report_id+"','"+type+"','正常类',"
					+ "'"+c2+"','"+tds.get(1).text()+"')";
			sqlList.add(sql);
		}
		String c4 = tds.get(2).text();
		if(!"0".equals(c4)){
			//关注类
			String sql = "insert into COM_LEND_TRANS_OTHER(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLAS,NUM_ACCOUNT,BALANCE_NUM) values ("
					+ "'"+report_id+"','"+type+"','关注类',"
					+ "'"+c4+"','"+tds.get(3).text()+"')";
			sqlList.add(sql);
		}
		String c6 = tds.get(4).text();
		if(!"0".equals(c6)){
			//不良类
			String sql = "insert into COM_LEND_TRANS_OTHER(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLAS,NUM_ACCOUNT,BALANCE_NUM) values ("
					+ "'"+report_id+"','"+type+"','不良类',"
					+ "'"+c6+"','"+tds.get(5).text()+"')";
			sqlList.add(sql);
		}
	}
	//其他借贷交易分类汇总-已结清
	public static void qtjdjyflhz_yjq(List<String> sqlList,Elements tds,String type){
		String c2 = tds.get(0).text(); 
		if(!"0".equals(c2)){
			//正常类
			String sql = "insert into COM_LEND_TRANS_SE_TYPE(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLASSIFICATION,NUM_ACCOUNT) values ("
					+ "'"+report_id+"','"+type+"','正常类',"
					+ "'"+c2+"')";
			sqlList.add(sql);
		}
		String c3 = tds.get(1).text();
		if(!"0".equals(c3)){
			//关注类
			String sql = "insert into COM_LEND_TRANS_SE_TYPE(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLASSIFICATION,NUM_ACCOUNT) values ("
					+ "'"+report_id+"','"+type+"','关注类',"
					+ "'"+c3+"')";
			sqlList.add(sql);
		}
		String c4 = tds.get(2).text();
		if(!"0".equals(c4)){
			//不良类
			String sql = "insert into COM_LEND_TRANS_SE_TYPE(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLASSIFICATION,NUM_ACCOUNT) values ("
					+ "'"+report_id+"','"+type+"','不良类',"
					+ "'"+c4+"')";
			sqlList.add(sql);
		}
	}
	//担保交易汇总-未结清
	public static void dbjyhz_wjq(List<String> sqlList,Elements tds,String type){
		String c2 = tds.get(0).text(); //第2列
		if(!"0".equals(c2)){
			//正常类
			String sql = "insert into COM_GUAR_TRANS_INFO_OUTS(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLAS,NUM_ACCOUNT,BALANCE_NUM) values ("
					+ "'"+report_id+"','"+type+"','正常类',"
					+ "'"+c2+"','"+tds.get(1).text()+"')";
			sqlList.add(sql);
		}
		String c4 = tds.get(2).text();
		if(!"0".equals(c4)){
			//关注类
			String sql = "insert into COM_GUAR_TRANS_INFO_OUTS(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLAS,NUM_ACCOUNT,BALANCE_NUM) values ("
					+ "'"+report_id+"','"+type+"','关注类',"
					+ "'"+c4+"','"+tds.get(3).text()+"')";
			sqlList.add(sql);
		}
		String c6 = tds.get(4).text();
		if(!"0".equals(c6)){
			//不良类
			String sql = "insert into COM_GUAR_TRANS_INFO_OUTS(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLAS,NUM_ACCOUNT,BALANCE_NUM) values ("
					+ "'"+report_id+"','"+type+"','不良类',"
					+ "'"+c6+"','"+tds.get(5).text()+"')";
			sqlList.add(sql);
		}
	}
	//担保交易汇总-已结清
	public static void dbjyhz_yjq(List<String> sqlList,Elements tds,String type){
		String c2 = tds.get(0).text(); 
		if(!"0".equals(c2)){
			//正常类
			String sql = "insert into COM_GUAR_TRANS_INFO_SET(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLA,NUM_ACCOUNT) values ("
					+ "'"+report_id+"','"+type+"','正常类',"
					+ "'"+c2+"')";
			sqlList.add(sql);
		}
		String c3 = tds.get(1).text();
		if(!"0".equals(c3)){
			//关注类
			String sql = "insert into COM_GUAR_TRANS_INFO_SET(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLA,NUM_ACCOUNT) values ("
					+ "'"+report_id+"','"+type+"','关注类',"
					+ "'"+c3+"')";
			sqlList.add(sql);
		}
		String c4 = tds.get(2).text();
		if(!"0".equals(c4)){
			//不良类
			String sql = "insert into COM_GUAR_TRANS_INFO_SET(REPORT_ID,BUSS_TYPE,ASSET_QUALITY_CLA,NUM_ACCOUNT) values ("
					+ "'"+report_id+"','"+type+"','不良类',"
					+ "'"+c4+"')";
			sqlList.add(sql);
		}
	}
	//相关还款责任汇总-借贷交易
	public static void xghkzrhz_jd(List<String> sqlList,Elements tds,String type){
		String sql = "insert into COM_BORROM_REPAY(REPORT_ID,TYPE_RESPON,AMOUNT_REPAY_RECOVER,NUM_AMONUT_ACCOUNT,BALANCE_NUM_RECOVER,"
					+"AMOUNT_REPAY_RECOVER_OTHERS,NUM_OTHER_TRANS_BORROW,BALANCE_NUM_OTHER_TRANS_BORROW,"
					+"BALANCE_NUM_OTHER_FOCUS,BALANCE_NUM_OTHER_BAD) values ("
					+ "'"+report_id+"','"+type+"','"+tds.get(0).text()+"','"+tds.get(1).text()+"','"+tds.get(2).text()+"','"
					+tds.get(3).text()+"','"+tds.get(4).text()+"','"+tds.get(5).text()+"','"+tds.get(6).text()+"','"
					+tds.get(7).text()+"')";
		sqlList.add(sql);
	}
	//相关还款责任汇总-担保交易
	public static void xghkzrhz_db(List<String> sqlList,Elements tds,String type){
		String sql = "insert into COM_GUAR_TRANS_RESPON_INFO(REPORT_ID,TYPE_RESPON,AMOUNT_REPAY_RECOVER,NUM_ACCOUNT,BALANCE_NUM,BALANCE_NUM_FOCUS,BALANCE_NUM_FOCUS_BAD) values ("
				+ "'"+report_id+"','"+type+"','"+tds.get(0).text()+"','"+tds.get(1).text()+"','"+tds.get(2).text()+"','"+tds.get(3).text()+"','"+tds.get(4).text()+"')";
		sqlList.add(sql);
	}
	//两个Elements映射为Map
	public static void twoElementsToMap(Map<String,String> map,Elements keys, Elements vals){
		if(map == null){
			map = new HashMap<String,String>();
		}
		for(int i=0; i<keys.size(); i++){
			map.put(keys.get(i).text().replaceAll("\\s",""), vals.get(i).text());
		}
	}
	//将一个List的所有项放入另一个List中
	public static void addAll(List<String> toList,List<String> fromList){
		if(toList == null || fromList == null) return;
		toList.addAll(fromList);
	}
		
	
	
	//解析公共记录明细
	public static void publicInfoUtil(Element ggjlmx_ele,String report_id) throws Exception{
		Elements title1 = ggjlmx_ele.select("img");
		Elements table = ggjlmx_ele.select("table");
		Elements title = ggjlmx_ele.getElementsByClass("g-tt-h3");//小单元
		int count = 0;			
		for(int i=0;i<title.size();i++){
			String text = title.get(i).text();
			int element_start=ggjlmx_ele.html().indexOf(title.get(i).html());
			int element_end=0;
			if(i==title.size()-1){
				element_end=ggjlmx_ele.html().lastIndexOf(">");
			}else{
				element_end=ggjlmx_ele.html().indexOf(title.get(i+1).html());
			}
			
			if(text==null) continue;
			//民事判决记录
			if(text!=null&&text.contains("民事判决记录")){
				//截取民事判决记录单元下的所有代码
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				//单元数据解析并入库
				strong_span(html_sql,report_id,"COM_JUDGE_RECORD");	
				count++;
			}else if(text!=null&&text.contains("强制执行记录")){
				//截取强制执行记录单元下的所有代码
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				//单元数据解析并入库
				strong_span(html_sql,report_id,"COM_VERDICT");
				count++;
			}else if(text!=null&&text.contains("行政处罚记录")){
				//截取行政处罚记录单元下的所有代码
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				//单元数据解析并入库
				strong_span(html_sql,report_id,"COM_PENALTIES");	
				count++;
			}else if(text!=null&&text.contains("住房公积金缴费记录")){
				//截取住房公积金缴费记录单元下的所有代码
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				//单元数据解析并入库
				strong_span(html_sql,report_id,"COM_PROVID_FUND_PAY_RECORD");
				count++;
			}else if(text!=null&&text.contains("获得许可记录")){

				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);			
				ths_tds(html_sql,report_id,"COM_OBTAIN_LICENSE");
				count++;
			}else if(text!=null&&text.contains("获得认证记录")){
				
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				ths_tds(html_sql,report_id,"COM_OBTAIN_CERTIFI");
				count++;
			}else if(text!=null&&text.contains("获得资质记录")){
				
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				ths_tds(html_sql,report_id,"COM_OBTAIN_QUAL");
				count++;
			}else if(text!=null&&text.contains("获得奖励记录")){
				
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				ths_tds(html_sql,report_id,"COM_OBTAIN_REWARD");
				count++;
			}else if(text!=null&&text.contains("拥有专利情况信息单元")){
				
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				ths_tds(html_sql,report_id,"COM_PATENT_CASE");
				count++;
			}else if(text!=null&&text.contains("出入境检验检疫绿色通道信息")){
				
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				ths_tds(html_sql,report_id,"COM_INSP_QUARA");
				count++;
			}else if(text!=null&&text.contains("进出口商品免验信息")){
				
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				ths_tds(html_sql,report_id,"COM_INSP_MJGOODS");
				count++;
			}else if(text!=null&&text.contains("进出口商品检验分类监管信息")){	
				
				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				ths_tds(html_sql,report_id,"COM_IMEX_SUPERVISION");
				count++;
			}else if(text!=null&&text.contains("融资规模控制信息")){

				String html_sql = ggjlmx_ele.html().substring(element_start,element_end);
				ths_tds(html_sql,report_id,"COM_FINAN_SCAL");
				count++;
			}
			if(count>12) 
				break;			
		}			
	}	
	
	
	//解析评级信息
	public static void ratingInfoUtil(Element pjxx_ele,String report_id) throws Exception{
		Element element = pjxx_ele.parent();//拿到所有的html代码
		int element_start=element.html().indexOf(pjxx_ele.toString());
		int element_end=element.html().lastIndexOf(">");
		//截取评级信息的单元代码
		String html_sql = element.html().substring(element_start,element_end);			
		ths_tds(html_sql,report_id,"COM_RAT_INFO");					
	}
	
	
	
	
	
	
	//单个信息单元数据入库： 全是tds的情况，并且key-value用strong-span标签关联
	public static void strong_span(String table_html,String report_id,String table_name){
		Map<String,String> htmlMap = new HashMap<String,String>();
		Document document = Jsoup.parse(table_html.toString());
		document.getElementsByClass("m-form-wrap").remove();//隐藏的表结构此处先不进行解析
		Elements tables = document.getElementsByTag("TABLE");
		
		for(Element ele:tables){	
			htmlMap.clear();
			Elements tds = ele.select("TD"); //全是tds的情况，并且key-value用strong-span标签关联
			for(Element e:tds){
				if(e.select("span").text().trim().equals("--")) //--即代表此处没有数据，不存
					continue;
				String strong = e.select("strong").text().substring(0,
						e.select("strong").text().indexOf("："));
				htmlMap.put(strong, e.select("span").text().trim());
			}
			//数据落库
			String sql;
			try {
				sql = MapsTransSQLUtil.mapTransSQL(htmlMap,table_name,report_id);
				ElementParseUtil.executeSQL(sql);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();		
			}	
		}
	}
	//单个信息单元数据入库：th_td
	public static void ths_tds(String table_html,String report_id,String table_name){
		Map<String,String> htmlMap = new HashMap<String,String>();
		Document document = Jsoup.parse(table_html.toString());
		Elements mspjjl_ele = document.getElementsByTag("TABLE");
		for(Element ele:mspjjl_ele){
			htmlMap.clear();
			Elements ths = ele.select("TH"); 
			Elements tds = ele.select("TD");
			if(ths.size()<tds.size()){//list
				for(int j=0;j<tds.size()/ths.size();j++){
					htmlMap.clear();
					for(int i=0;i<ths.size();i++){
						if(tds.get(i).text().trim().equals("--")){
							continue;        
						}	
						htmlMap.put(ths.get(i).text().trim(), tds.get(i).text().trim());
					}
					//数据落库
					String sql;
					try {
						sql = MapsTransSQLUtil.mapTransSQL(htmlMap,table_name,report_id);
						ElementParseUtil.executeSQL(sql);
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();		
					}	
				}	
			}else if(ths.size()==tds.size()){//map
				for(int i=0;i<ths.size();i++){
					if(tds.get(i).text().trim().equals("--")){
						continue;        
					}
					htmlMap.put(ths.get(i).text().trim(), tds.get(i).text().trim());
				}
				//数据落库
				String sql;
				try {
					sql = MapsTransSQLUtil.mapTransSQL(htmlMap,table_name,report_id);
					ElementParseUtil.executeSQL(sql);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();		
				}	
			}	
		
		}
	}	
	
	
	
	////解析信贷记录明细
	public static List<String> loadDetailUtil(Element xdjlmx_el) throws Exception{
		List<String> loadDetail_sql = new ArrayList<String>();
		Elements tab_div = xdjlmx_el.children().select("table");
		StringBuffer errDesc = new StringBuffer(",");
		for(int i=0; i<tab_div.size(); i++){
			Element el = tab_div.get(i);
			Elements ths = el.select("th");
			//被追偿业务
			if(ths.size()==2 && ths.text().indexOf("被追偿业务")>-1){
				if(i<tab_div.size()-1){
					Element els = tab_div.get(i+1).select("table").get(0);
					Elements tbodys = els.select("tbody");
					for(int j=1; j<tbodys.size(); j++){
						Elements tr_row1 = tbodys.get(j).select("tr").get(0).select("td");
						Elements tr_row2 = tbodys.get(j).select("tr").get(1).select("td");
						String sql = "insert into COM_LEND_ACCOUNT(report_id,NUM_LEND_ACCOUNT,CODE_BUS_MANA_ORG,SMART_LEND_BUS,DATE_ACCOUNT_OPEN,CURRENCY,LEN_SUM,DATE_CLOSE,DATE_INFO_REPORT) values ("
								+ "'"+report_id+"','"+tr_row1.get(0).text()+"','"+tr_row1.get(1).text()+"','"+tr_row1.get(2).text()+"','"+tr_row1.get(3).text()+"','"+tr_row1.get(4).text()+"','"+tr_row1.get(5).text()+"','"+tr_row2.get(0).text()+"','"+tr_row1.get(7).text()+"')";
						loadDetail_sql.add(sql);
						sql = "insert into COM_REPAY_INFO(report_id,BALANCE_NUM,FIVE_CLA,RECE_REPAY_ONECE_TIME,RECE_REPAY_ONECE_SUM,RECE_REPAY_ONECE_FORM,DATE_REPORT_INFO) values("
								+ "'"+report_id+"','"+tr_row1.get(6).text()+"','"+tr_row2.get(1).text()+"','"+tr_row2.get(2).text()+"','"+tr_row2.get(3).text()+"','"+tr_row2.get(4).text()+"','"+tr_row1.get(7).text()+"')";
						loadDetail_sql.add(sql);
					}
					i++;
					continue;
				}
			}
			//中长期借款
			if(ths.size()==2 && ths.text().indexOf("中长期借款")>-1){
				if(i<tab_div.size()-1){
					Element els = tab_div.get(i+1).select("table").get(0);
					Elements tbodys = els.select("tbody");
					//未结清信贷
					if(tbodys.get(0).select("tr>th[rowspan=3]").size()>0){
						for(int j=1; j<tbodys.size(); j++){
							Elements tr_row1 = tbodys.get(j).select("tr").get(0).select("td");
							Elements tr_row2 = tbodys.get(j).select("tr").get(1).select("td");
							Elements tr_row3 = tbodys.get(j).select("tr").get(2).select("td");
							
							String sql = "insert into COM_LEND_ACCOUNT(report_id,serial,time_lim_len,NUM_LEND_ACCOUNT,CODE_BUS_MANA_ORG,SMART_LEND_BUS,DATE_ACCOUNT_OPEN,DUE_TIME,CURRENCY,LEN_SUM,ISSUE_WAY,GUAR_WAY,NUM_CRED_AGREE,DATE_INFO_REPORT) values ("
									+ "'"+report_id+"','"+(1000+i)+"','中长期','"+tr_row1.get(0).text()+"','"+tr_row1.get(1).text()+"','"+tr_row1.get(2).text()+"','"+tr_row1.get(3).text()+"','"+tr_row1.get(4).text()+"','"+tr_row1.get(5).text()+"','"+tr_row1.get(6).text()+"','"+tr_row1.get(7).text()+"','"+tr_row2.get(0).text()+"','"+tr_row3.get(3).text()+"','"+tr_row3.get(5).text()+"')";
							loadDetail_sql.add(sql);
							sql = "insert into COM_REPAY_INFO(report_id,serial,BALANCE_NUM,FIVE_CLA,OVER_SUM,OVER_PRINCIPAL,OVER_MONTH,RECE_REPAY_ONECE_TIME,RECE_REPAY_ONECE_SUM,RECE_REPAY_ONECE_FORM,DATE_REPORT_INFO) values("
									+ "'"+report_id+"','"+(1000+i)+"','"+tr_row2.get(1).text()+"','"+tr_row2.get(2).text()+"','"+tr_row2.get(3).text()+"','"+tr_row2.get(4).text()+"','"+tr_row2.get(5).text()+"','"+tr_row2.get(6).text()+"','"+tr_row3.get(0).text()+"','"+tr_row3.get(1).text()+"','"+tr_row3.get(5).text()+"')";
							loadDetail_sql.add(sql);
						}
						i++;
						continue;
					}
					//已结清信贷
					if(tbodys.get(0).select("tr>th[rowspan=2]").size()>0){
						for(int j=2; j<tbodys.size(); j++){ //此处有些特殊，第二行里面的th里面又包含一个table标签和一个tbody标签，因此j从2开始
							Elements tr_row1 = tbodys.get(j).select("tr").get(0).select("td");
							Elements tr_row2 = tbodys.get(j).select("tr").get(1).select("td");
							String sql = "insert into COM_LEND_ACCOUNT(report_id,serial,time_lim_len,NUM_LEND_ACCOUNT,CODE_BUS_MANA_ORG,SMART_LEND_BUS,DATE_ACCOUNT_OPEN,DUE_TIME,CURRENCY,LEN_SUM,DATE_CLOSE) values ("
									+ "'"+report_id+"','"+(1000+i)+"','中长期','"+tr_row1.get(0).text()+"','"+tr_row1.get(1).text()+"','"+tr_row1.get(2).text()+"','"+tr_row1.get(3).text()+"','"+tr_row1.get(4).text()+"','"+tr_row1.get(5).text()+"','"+tr_row1.get(6).text()+"','"+tr_row2.get(0).text()+"')";
							loadDetail_sql.add(sql);
							Elements tr_row2_tds = tr_row2.get(2).select("td");
							sql = "insert into COM_REPAY_INFO(report_id,serial,FIVE_CLA,RECE_REPAY_ONECE_TIME,RECE_REPAY_ONECE_FORM) values("
									+ "'"+report_id+"','"+(1000+i)+"','"+tr_row2.get(1).text()+"','"+tr_row2_tds.get(0).text()+"','"+tr_row2_tds.get(1).text()+"')";
							loadDetail_sql.add(sql);
							j++;
						}
						i++;
						continue;
					}
				}
			}
			//未结清信贷-短期借款
			if(ths.size()==2 && ths.text().indexOf("短期借款")>-1){
				if(i<tab_div.size()-1){
					Element els = tab_div.get(i+1).select("table").get(0);
					Elements tbodys = els.select("tbody");
					//未结清信贷
					if(tbodys.get(0).select("tr>th[rowspan=3]").size()>0){
						for(int j=1; j<tbodys.size(); j++){
							Elements tr_row1 = tbodys.get(j).select("tr").get(0).select("td");
							Elements tr_row2 = tbodys.get(j).select("tr").get(1).select("td");
							Elements tr_row3 = tbodys.get(j).select("tr").get(2).select("td");
							
							String sql = "insert into COM_LEND_ACCOUNT(report_id,serial,time_lim_len,NUM_LEND_ACCOUNT,CODE_BUS_MANA_ORG,SMART_LEND_BUS,DATE_ACCOUNT_OPEN,DUE_TIME,CURRENCY,LEN_SUM,ISSUE_WAY,GUAR_WAY,NUM_CRED_AGREE,DATE_INFO_REPORT) values ("
									+ "'"+report_id+"','"+(1000+i)+"','短期','"+tr_row1.get(0).text()+"','"+tr_row1.get(1).text()+"','"+tr_row1.get(2).text()+"','"+tr_row1.get(3).text()+"','"+tr_row1.get(4).text()+"','"+tr_row1.get(5).text()+"','"+tr_row1.get(6).text()+"','"+tr_row1.get(7).text()+"','"+tr_row2.get(0).text()+"','"+tr_row3.get(3).text()+"','"+tr_row3.get(5).text()+"')";
							loadDetail_sql.add(sql);
							sql = "insert into COM_REPAY_INFO(report_id,serial,BALANCE_NUM,FIVE_CLA,OVER_SUM,OVER_PRINCIPAL,OVER_MONTH,RECE_REPAY_ONECE_TIME,RECE_REPAY_ONECE_SUM,RECE_REPAY_ONECE_FORM,DATE_REPORT_INFO) values("
									+ "'"+report_id+"','"+(1000+i)+"','"+tr_row2.get(1).text()+"','"+tr_row2.get(2).text()+"','"+tr_row2.get(3).text()+"','"+tr_row2.get(4).text()+"','"+tr_row2.get(5).text()+"','"+tr_row2.get(6).text()+"','"+tr_row3.get(0).text()+"','"+tr_row3.get(1).text()+"','"+tr_row3.get(5).text()+"')";
							loadDetail_sql.add(sql);
						}
						i++;
						continue;
					}
					//已结清信贷
					if(tbodys.get(0).select("tr>th[rowspan=2]").size()>0){
						for(int j=2; j<tbodys.size(); j++){ //此处有些特殊，第二行里面的th里面又包含一个table标签和一个tbody标签，因此j从2开始
							Elements tr_row1 = tbodys.get(j).select("tr").get(0).select("td");
							Elements tr_row2 = tbodys.get(j).select("tr").get(1).select("td");
							String sql = "insert into COM_LEND_ACCOUNT(report_id,serial,time_lim_len,NUM_LEND_ACCOUNT,CODE_BUS_MANA_ORG,SMART_LEND_BUS,DATE_ACCOUNT_OPEN,DUE_TIME,CURRENCY,LEN_SUM,DATE_CLOSE) values ("
									+ "'"+report_id+"','"+(1000+i)+"','短期','"+tr_row1.get(0).text()+"','"+tr_row1.get(1).text()+"','"+tr_row1.get(2).text()+"','"+tr_row1.get(3).text()+"','"+tr_row1.get(4).text()+"','"+tr_row1.get(5).text()+"','"+tr_row1.get(6).text()+"','"+tr_row2.get(0).text()+"')";
							loadDetail_sql.add(sql);
							Elements tr_row2_tds = tr_row2.get(2).select("td");
							sql = "insert into COM_REPAY_INFO(report_id,serial,FIVE_CLA,RECE_REPAY_ONECE_TIME,RECE_REPAY_ONECE_FORM) values("
									+ "'"+report_id+"','"+(1000+i)+"','"+tr_row2.get(1).text()+"','"+tr_row2_tds.get(0).text()+"','"+tr_row2_tds.get(1).text()+"')";
							loadDetail_sql.add(sql);
							j++;
						}
						i++;
						continue;
					}
				}
			}
			//循环透支
			if(ths.size()==2 && ths.text().indexOf("循环透支")>-1){
				if(i<tab_div.size()-1){
					Element els = tab_div.get(i+1).select("table").get(0);
					Elements tbodys = els.select("tbody");
					//未结清信贷
					if(tbodys.get(0).select("tr>th[rowspan=3]").size()>0){
						for(int j=1; j<tbodys.size(); j++){
							Elements tr_row1 = tbodys.get(j).select("tr").get(0).select("td");
							Elements tr_row2 = tbodys.get(j).select("tr").get(1).select("td");
							Elements tr_row3 = tbodys.get(j).select("tr").get(2).select("td");
							
							String sql = "insert into COM_LEND_ACCOUNT(report_id,serial,time_lim_len,NUM_LEND_ACCOUNT,CODE_BUS_MANA_ORG,SMART_LEND_BUS,DATE_ACCOUNT_OPEN,DUE_TIME,CURRENCY,LEN_SUM,ISSUE_WAY,GUAR_WAY,NUM_CRED_AGREE,DATE_INFO_REPORT) values ("
									+ "'"+report_id+"','"+(1000+i)+"','循环透支','"+tr_row1.get(0).text()+"','"+tr_row1.get(1).text()+"','"+tr_row1.get(2).text()+"','"+tr_row1.get(3).text()+"','"+tr_row1.get(4).text()+"','"+tr_row1.get(5).text()+"','"+tr_row1.get(6).text()+"','"+tr_row1.get(7).text()+"','"+tr_row2.get(0).text()+"','"+tr_row3.get(4).text()+"','"+tr_row3.get(6).text()+"')";
							loadDetail_sql.add(sql);
							sql = "insert into COM_REPAY_INFO(report_id,serial,BALANCE_NUM,FIVE_CLA,OVER_SUM,OVER_PRINCIPAL,OVER_MONTH,RECE_REPAY_ONECE_TIME,RECE_REPAY_ONECE_SUM,RECE_REPAY_ONECE_FORM,NUM_MONTH_REMAIN,DATE_REPORT_INFO) values("
									+ "'"+report_id+"','"+(1000+i)+"','"+tr_row2.get(1).text()+"','"+tr_row2.get(2).text()+"','"+tr_row2.get(3).text()+"','"+tr_row2.get(4).text()+"','"+tr_row2.get(5).text()+"','"+tr_row2.get(6).text()+"','"+tr_row3.get(0).text()+"','"+tr_row3.get(1).text()+"','"+tr_row3.get(2).text()+"','"+tr_row3.get(6).text()+"')";
							loadDetail_sql.add(sql);
						}
						i++;
						continue;
					}
					//已结清信贷
					if(tbodys.get(0).select("tr>th[rowspan=2]").size()>0){
						for(int j=2; j<tbodys.size(); j++){//此处有些特殊，第二行里面的th里面又包含一个table标签和一个tbody标签，因此j从2开始
							Elements tr_row1 = tbodys.get(j).select("tr").get(0).select("td");
							Elements tr_row2 = tbodys.get(j).select("tr").get(1).select("td");
							String sql = "insert into COM_LEND_ACCOUNT(report_id,serial,time_lim_len,NUM_LEND_ACCOUNT,CODE_BUS_MANA_ORG,SMART_LEND_BUS,DATE_ACCOUNT_OPEN,DUE_TIME,CURRENCY,CRED_LINE,DATE_CLOSE) values ("
									+ "'"+report_id+"','"+(1000+i)+"','循环透支','"+tr_row1.get(0).text()+"','"+tr_row1.get(1).text()+"','"+tr_row1.get(2).text()+"','"+tr_row1.get(3).text()+"','"+tr_row1.get(4).text()+"','"+tr_row1.get(5).text()+"','"+tr_row1.get(6).text()+"','"+tr_row2.get(0).text()+"')";
							loadDetail_sql.add(sql);
							Elements tr_row2_tds = tr_row2.get(2).select("td");
							sql = "insert into COM_REPAY_INFO(report_id,serial,FIVE_CLA,RECE_REPAY_ONECE_TIME,RECE_REPAY_ONECE_FORM) values("
									+ "'"+report_id+"','"+(1000+i)+"','"+tr_row2.get(1).text()+"','"+tr_row2_tds.get(0).text()+"','"+tr_row2_tds.get(1).text()+"')";
							loadDetail_sql.add(sql);
							j++;
						}
						i++;
						continue;
					}
				}
			}
			//贴现
			if(ths.size()==2 && ths.text().indexOf("贴现")>-1){
				if(i<tab_div.size()-1){
					Elements trs = tab_div.get(i+1).select("table tr");
					//未结清信贷
					if(trs.select("th").indexOf("逾期总额")>-1){
						String sql = null;
						for(int j=1; j<trs.size(); j++){
							Elements tx_tds = trs.get(j).select("td");
							sql = "insert into COM_TX_ACC_ORG(report_id,CODE_ORG,TYPE_BUSINESS,FIVE_TYPE,NUM_OUTSTAND_ACCOUNT,BALANCE_NUM_SUM,OVER_SUM,OVER_PRINCIPAL_SUM) values ("
								 +"'"+report_id+"','"+tx_tds.get(0).text()+"','"+tx_tds.get(1).text()+"','"+tx_tds.get(2).text()+"','"+tx_tds.get(3).text()+"','"+tx_tds.get(4).text()+"','"+tx_tds.get(5).text()+"','"+tx_tds.get(6).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}
					//已结清信贷
					if(trs.select("th").indexOf("逾期总额")==-1){
						String sql = null;
						for(int j=1; j<trs.size(); j++){
							Elements tx_tds = trs.get(j).select("td");
							sql = "insert into COM_TX_ACC_ORG(report_id,CODE_ORG,TYPE_BUSINESS,FIVE_TYPE,NUM_ACC_SETTLE,NUM_ACC_SETTLE_SUM) values ("
								 +"'"+report_id+"','"+tx_tds.get(0).text()+"','"+tx_tds.get(1).text()+"','"+tx_tds.get(2).text()+"','"+tx_tds.get(3).text()+"','"+tx_tds.get(4).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}
				}
			}
			//银行承兑汇票和信用证
			if(ths.size()==2 && ths.text().indexOf("银行承兑汇票和信用证")>-1){
				if(i<tab_div.size()-1){
					Elements trs = tab_div.get(i+1).select("table tr");
					//未结清信贷
					if(trs.select("th").indexOf("垫款标志")==-1){
						for(int j=2; j<trs.size(); j++){
							Elements tx_tds = trs.get(j).select("td");
							String sql = "insert into COM_GUARANTEE_DET(report_id,CODE_ORG,GUAR_TRANS_SPECIES_NICHE,FIVE_CLA,NUM_OUTSTAND_ACCOUNT,IN_THIRTY_DAY_BAL_NUM,IN_SIXTY_DAY_BAL_NUM,IN_NINETY_DAY_BAL_NUM,AFTER_NINETY_DAY_BAL_NUM) values ("
								+ "'"+report_id+"','"+tx_tds.get(0).text()+"','"+tx_tds.get(1).text()+"','"+tx_tds.get(2).text()+"','"+tx_tds.get(3).text()+"','"+tx_tds.get(4).text()+"','"+tx_tds.get(5).text()+"','"+tx_tds.get(6).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}
					//已结清信贷
					if(trs.select("th").indexOf("垫款标志")>-1){
						for(int j=2; j<trs.size(); j++){
							Elements tx_tds = trs.get(j).select("td");
							String sql = "insert into COM_GUARANTEE_DET(report_id,CODE_ORG,GUAR_TRANS_SPECIES_NICHE,FIVE_CLA,NUM_ACC_SETTLE,ADVANCES) values ("
								+ "'"+report_id+"','"+tx_tds.get(0).text()+"','"+tx_tds.get(1).text()+"','"+tx_tds.get(2).text()+"','"+tx_tds.get(3).text()+"','"+tx_tds.get(4).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}
				}
			}
			//银行保函及其他业务
			if(ths.size()==2 && ths.text().indexOf("银行保函及其他业务")>-1){
				if(i<tab_div.size()-1){
					Elements trs = tab_div.get(i+1).select("table tr");
					//未结清信贷
					if(trs.select("th").indexOf("垫款标志")==-1){
						for(int j=1; j<trs.size(); j++){
							Elements tx_tds = trs.get(j).select("td");
							String sql = "insert into COM_GUARANTEE_DET(report_id,CODE_ORG,GUAR_TRANS_SPECIES_NICHE,FIVE_CLA,NUM_OUTSTAND_ACCOUNT,BALANCE_NUM) values ("
								+ "'"+report_id+"','"+tx_tds.get(0).text()+"','"+tx_tds.get(1).text()+"','"+tx_tds.get(2).text()+"','"+tx_tds.get(3).text()+"','"+tx_tds.get(4).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}
					//已结清信贷
					if(trs.select("th").indexOf("垫款标志")>-1){
						for(int j=2; j<trs.size(); j++){
							Elements tx_tds = trs.get(j).select("td");
							String sql = "insert into COM_GUARANTEE_DET(report_id,CODE_ORG,GUAR_TRANS_SPECIES_NICHE,FIVE_CLA,NUM_ACC_SETTLE,ADVANCES) values ("
								+ "'"+report_id+"','"+tx_tds.get(0).text()+"','"+tx_tds.get(1).text()+"','"+tx_tds.get(2).text()+"','"+tx_tds.get(3).text()+"','"+tx_tds.get(4).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}
				}
			}
			//未结清信贷-授信信息
			if(ths.size()==2 && ths.text().indexOf("授信信息")>-1){
				if(i<tab_div.size()-1){
					Elements tbodys = tab_div.get(i+1).select("tbody");
					if(tbodys.get(0).select("th").size() == 12){
						for(int j=1; j<tbodys.size(); j++){
							Elements tx_r1_tds = tbodys.get(j).select("tr").get(0).select("td");
							Elements tx_r2_tds = tbodys.get(j).select("tr").get(1).select("td");
							String sql = "insert into COM_CREDIT_INFO_DATA(report_id,CRED_ID,CODE_ORG,TYPE_CERD,QUOTA_CYC_MARK,EFFEC_DATE,END_DATE,DATE_INFO_REPORT,"
								+ "CURRENCY,CR_CREDIT_SUM,CR_USED_SUM,CR_LIM,CR_LIM_ID) values ("
								+ "'"+report_id+"','"+tx_r1_tds.get(0).text()+"','"+tx_r1_tds.get(1).text()+"','"+tx_r1_tds.get(2).text()+"','"+tx_r1_tds.get(3).text()+"','"+tx_r1_tds.get(4).text()+"','"+tx_r1_tds.get(5).text()+"','"+tx_r1_tds.get(6).text()+"','"
								+ tx_r2_tds.get(0).text()+"','"+tx_r2_tds.get(1).text()+"','"+tx_r2_tds.get(2).text()+"','"+tx_r2_tds.get(3).text()+"','"+tx_r2_tds.get(4).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}else{
						errDesc.append(",未结清信贷-授信信息");
					}
				}
			}
			//相关还款责任-除贴现外的其他业务
			if(ths.size()==2 && ths.text().indexOf("除贴现外的其他业务")>-1){
				if(i<tab_div.size()-1){
					Elements tbodys = tab_div.get(i+1).select("tbody");
					if(tbodys.get(0).select("th").size() == 17){
						for(int j=1; j<tbodys.size(); j++){
							Elements tx_r1_tds = tbodys.get(j).select("tr").get(0).select("td");
							Elements tx_r2_tds = tbodys.get(j).select("tr").get(1).select("td");
							String sql = "insert into COM_BOR_UNDISCOUNT(report_id,CRED_ID,TYPE_REPAY_PES,NUM_GUAR_CONTRA,CURRENCY_REPAY,REPAY_RESP_BALA,CODE_ORG,TYPE_BUSINESS,DATE_OPEN,DUE_TIME_DATE,CURRENCY,"
										+"LEN_SUM,BALANCE_NUM,FIVE_CLA,OVER_SUM,OVER_PRINCIPALOVER_MONTH,NUM_MONTH_REMAIN,DATE_INFO_REPORT"
										+") values('"+report_id+"','"+tx_r1_tds.get(0).text()+"','"+tx_r1_tds.get(1).text()+"','"+tx_r1_tds.get(2).text()+"','"+tx_r1_tds.get(3).text()+"','"+tx_r1_tds.get(4).text()+"','"+tx_r1_tds.get(5).text()+"','"+tx_r1_tds.get(6).text()+"','"+tx_r1_tds.get(7).text()+"','"+tx_r1_tds.get(8).text()+"','"+tx_r1_tds.get(9).text()+"','"
										+tx_r2_tds.get(0).text()+"','"+tx_r2_tds.get(1).text()+"','"+tx_r2_tds.get(2).text()+"','"+tx_r2_tds.get(3).text()+"','"+tx_r2_tds.get(4).text()+"','"+tx_r2_tds.get(5).text()+"','"+tx_r2_tds.get(6).text()+"','"+tx_r2_tds.get(7).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}else{
						errDesc.append(",相关还款责任-除贴现外的其他业务");
					}
				}
			}
			//相关还款责任-贴现
			if(ths.size()==2 && ths.text().indexOf("贴现")>-1){
				if(i<tab_div.size()-1){
					Elements tbodys = tab_div.get(i+1).select("tbody");
					if(tbodys.get(0).select("th").size() == 11){
						for(int j=1; j<tbodys.size(); j++){
							Elements tx_r1_tds = tbodys.get(j).select("tr").get(0).select("td");
							String sql = "insert into COM_BOR_DISCOUNT(REPORT_ID,REPAY_RESP_TYPE,NUM_GUAR_CONTRA,REPAY_RESP_BALA,CODE_ORG,SMART_BUS,FIVE_CLA,NUM_ACCOUNT,LEN_SUM,BALANCE_NUM,OVER_SUM,OVER_PRINCIPAL"
										+") values('"+report_id+"','"+tx_r1_tds.get(0).text()+"','"+tx_r1_tds.get(1).text()+"','"+tx_r1_tds.get(2).text()+"','"+tx_r1_tds.get(3).text()+"','"+tx_r1_tds.get(4).text()+"','"+tx_r1_tds.get(5).text()+"','"+tx_r1_tds.get(6).text()+"','"+tx_r1_tds.get(7).text()+"','"+tx_r1_tds.get(8).text()+"','"+tx_r1_tds.get(9).text()+"','"+tx_r1_tds.get(10).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}else{
						errDesc.append(",相关还款责任-贴现");
					}
				}
			}
			//相关还款责任-为担保交易承担的相关还款责任
			if(ths.size()==2 && ths.text().indexOf("为担保交易承担的相关还款责任")>-1){
				if(i<tab_div.size()-1){
					Elements tbodys = tab_div.get(i+1).select("tbody");
					if(tbodys.get(0).select("th").size() == 9){
						for(int j=1; j<tbodys.size(); j++){
							Elements tx_r1_tds = tbodys.get(j).select("tr").get(0).select("td");
							String sql = "insert into COM_REPAY_GUAR(REPORT_ID,REPAY_RESP_TYPE,NUM_GUAR_CONTRA,REPAY_RESP_BALA,CODE_ORG,SMART_BUS,FIVE_CLA,NUM_ACCOUNT,GUAR_SUM,BALANCE_NUM"
										+") values('"+report_id+"','"+tx_r1_tds.get(0).text()+"','"+tx_r1_tds.get(1).text()+"','"+tx_r1_tds.get(2).text()+"','"+tx_r1_tds.get(3).text()+"','"+tx_r1_tds.get(4).text()+"','"+tx_r1_tds.get(5).text()+"','"+tx_r1_tds.get(6).text()+"','"+tx_r1_tds.get(7).text()+"','"+tx_r1_tds.get(8).text()+"')";
							loadDetail_sql.add(sql);	 
						}
						i++;
						continue;
					}else{
						errDesc.append(",相关还款责任-为担保交易承担的相关还款责任");
					}
				}
			}
			if(!errDesc.toString().equals(",")){
				logger.debug(errDesc.toString().substring(1)+"模块解析错误，请查看");
				throw new Exception(errDesc.toString().substring(1)+"模块解析错误，请查看");
			}
		}
//		printList(loadDetail_sql);
		return loadDetail_sql;
	}
	
	public static void printList(List<String> list){
		for(String str : list){
			logger.debug(str+";");
		}
		logger.debug(list.size());
	}
}
