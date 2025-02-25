package com.dcits.credit.service.rest.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.rest.PersonInterfaceService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 查看报告接口
 * @author wangwenming
 * certid:证件号码   username：用户名
 */
@Service("personInterfaceService")
public class PersonInterfaceServiceImpl implements PersonInterfaceService {
	private static Logger logger = Logger.getLogger(CompanyInterfaceImpl.class);
	@Resource(name="daoSupport")
	private DaoSupport dao;
	/**
	 * 根据用户名和客户的证件号码，查询个人信用报告信息
	 */
	@Override
	public JSONObject getReportInfo(PageData pd) throws Exception {
    	JSONObject returnJson = null;
		//根据用户名和客户的证件号码，查到的个人信用报告的报告编号
		List<PageData> rpids = getFlowInfo(pd);
		String rpid = rpids.get(0).getString("REPORT_ID");
		String type = "0";
		String query_time = rpids.get(0).getString("QUERY_TIME");
		//查询查询类型字段
		try{
			List<PageData> reprotTypes = getReportIdType(pd);
			type = reprotTypes.get(0).getString("QUERY_TYPE");
		}catch(Exception e){
			type = "0";
		}
		String date = BaseController.getServerInfo().getString("switch_time");
		boolean is_new = DateUtil.compareDate2(query_time,date);
		if(is_new){
			returnJson = getJsonByReportidInInter(rpid,type);
			returnJson.put("version", "2");
		}else{
			returnJson = getJsonByReportid_old(rpid,type);
			returnJson.put("version", "1");
		}
		
		return returnJson;
	}
	/**
	 * 根据用户名和客户的证件号码，查询个人信用报告信息
	 */
	@Override
	public JSONObject getReportJSON(PageData pd) throws Exception {
    	JSONObject returnJson = null;
		//根据用户名和客户的证件号码，查到的个人信用报告的报告编号
//		List<PageData> rpids = getFlowInfo(pd);
//		String rpid = rpids.get(0).getString("REPORT_ID");
		String type = "0";

    	
    	try{
    		returnJson = getJsonByReportidInInter(pd.getString("REPORT_ID"),type);
    	}catch(Exception e){
    		logger.error(e.getMessage(),e);
    	}
		return returnJson;
	}
	//将子表添加进主表：去掉所有的SERIAL
	public static void addSubToMain(List<Map<String, Object>> mainTab, List<Map<String, String>> subTab, String subNo) throws Exception{
		for(Map<String,Object> map : mainTab){
			String serial = (String) map.get("SERIAL");
			if(mainTab.size()==1){
				map.put(subNo, subTab);
			}else{
				if(serial==null || ("").equals(serial)){
					map.remove("SERIAL");
					continue;
				}else{
					List<Map> list = new ArrayList<Map>();
					for(Map m : subTab){
						String subSerial = (String) m.get("SERIAL");
						if(serial.equals(subSerial)){
							m.remove("SERIAL");
							list.add(m);
						}
					}
					map.put(subNo, list);
				}
			}
			map.remove("SERIAL");
		}
	}
	//将子表添加进主表：表中没有SERIAL
		public static void addSubToMain_NOSERIAL(List<Map<String, Object>> mainTab, List<Map<String, String>> subTab, String subNo) throws Exception{
			for(Map<String,Object> map : mainTab){
				String serial = (String) map.get("SERIAL");
				if(mainTab.size()==1){
					map.put(subNo, subTab);
				}else{
					if(serial==null || ("").equals(serial)){
						map.remove("SERIAL");
						continue;
					}else{
						List<Map> list = new ArrayList<Map>();
						for(Map m : subTab){
							String subSerial = (String) m.get("SERIAL");
							if(subSerial!=null){
								if(serial.equals(subSerial)){
									list.add(m);
								}
							}	
						}
						map.put(subNo, list);
					}
				}
			}
		}
		
	//将子表添加进主表/去掉SERIAL的特殊情况：PER_LOAN_DETAIL表
	public static void addSubToMain_SERIAL(List<Map<String, Object>> mainTab, List<Map<String, String>> subTab, String subNo) throws Exception{
		for(Map<String,Object> map : mainTab){
			String serial = (String) map.get("SERIAL");
			if(mainTab.size()==1){
				map.put(subNo, subTab);
			}else{
				if(serial==null || ("").equals(serial)){
					map.remove("SERIAL");
					continue;
				}else{
					List<Map> list = new ArrayList<Map>();
					for(Map m : subTab){
						String subSerial = (String) m.get("SERIAL");
						if(serial.equals(subSerial)){	
							m.remove("SERIAL");
							list.add(m);
						}
					}
					map.put(subNo, list);
				}
			}
		}
	}
	
	/**
	 * 接口方式根据报告编号返回JSONObject
	 * @param reportid
	 * @return
	 * @throws Exception
	 */
	public JSONObject getJsonByReportidInInter(String rpid,String type) throws Exception{
		JSONObject returnJson = new JSONObject();
		//报告头信息
		List<Map<String, Object>> reportInfoMain = (List)dao.findForList("GetInterfaceMapper.reportInfoMain", rpid);
		List<Map<String, String>> reportInfoSub = (List)dao.findForList("GetInterfaceMapper.reportInfoSub", rpid);
		addSubToMain_NOSERIAL(reportInfoMain,reportInfoSub,"PER_OTHER_IDENTITY");
		//身份信息
//		List<Map<String, Object>> basicMain = (List)dao.findForList("GetInterfaceMapper.basicMain", rpid);
		List<Map<String, String>> basicSub = (List)dao.findForList("GetInterfaceMapper.basicSub", rpid);
		addSubToMain_NOSERIAL(reportInfoMain, basicSub, "PER_PHONE_INFO");
		//后付费业务欠费信息汇总信息
//		List<Map<String, Object>> afterPayMain = (List)dao.findForList("GetInterfaceMapper.afterPayMain", rpid);
		List<Map<String, String>> afterPaySub = (List)dao.findForList("GetInterfaceMapper.afterPaySub", rpid);
		addSubToMain_NOSERIAL(reportInfoMain, afterPaySub, "PER_AFTER_PAY_OWE_INFO");
		//公共信息概要信息
//		List<Map<String, Object>> publicInfoMain = (List)dao.findForList("GetInterfaceMapper.publicInfoMain", rpid);
		List<Map<String, String>> publicInfoSub = (List)dao.findForList("GetInterfaceMapper.publicInfoSub", rpid);
		addSubToMain_NOSERIAL(reportInfoMain, publicInfoSub, "PER_PUBLIC_SUMMARY_INFO");
		
		//配偶信息
		List<Map<String, String>> spou = (List)dao.findForList("GetInterfaceMapper.spou", rpid);
		//居住信息
		List<Map<String, String>> live = (List)dao.findForList("GetInterfaceMapper.live", rpid);
		//职业信息
		List<Map<String, String>> career = (List)dao.findForList("GetInterfaceMapper.career", rpid);
		//信贷交易信息概要信息
		List<Map<String, Object>> loanSummaryMain = (List)dao.findForList("GetInterfaceMapper.loanSummaryMain", rpid);
		List<Map<String, String>> loanSummaryPrompt = (List)dao.findForList("GetInterfaceMapper.loanSummaryPrompt", rpid);
		List<Map<String, String>> loanSummaryRecover = (List)dao.findForList("GetInterfaceMapper.loanSummaryRecover", rpid);
		List<Map<String, String>> loanSummaryOverdue = (List)dao.findForList("GetInterfaceMapper.loanSummaryOverdue", rpid);
		List<Map<String, String>> loanSummaryRepayer = (List)dao.findForList("GetInterfaceMapper.loanSummaryRepayer", rpid);
		addSubToMain_NOSERIAL(loanSummaryMain, loanSummaryPrompt, "PER_LOAN_PROMPT_DETAIL");
		addSubToMain_NOSERIAL(loanSummaryMain, loanSummaryRecover, "PER_RECOVER_INFO_DETAIL");
		addSubToMain_NOSERIAL(loanSummaryMain, loanSummaryOverdue, "PER_OVERDUE_SUMMARY_INFO");
		addSubToMain_NOSERIAL(loanSummaryMain, loanSummaryRepayer, "PER_LOAN_REPAYER");		
		//查询记录概要信息
		List<Map<String, String>> searchSummary = (List)dao.findForList("GetInterfaceMapper.searchSummary", rpid);
		//借贷账户信息
		List<Map<String, Object>> borrowDetailMain = (List)dao.findForList("GetInterfaceMapper.borrowDetailMain", rpid);
		List<Map<String, String>> curM24ShowSub = (List)dao.findForList("GetInterfaceMapper.curM24ShowSub", rpid);
		List<Map<String, String>> curY5ShowSub = (List)dao.findForList("GetInterfaceMapper.curY5ShowSub", rpid);
		List<Map<String, String>> specialTradeSub = (List)dao.findForList("GetInterfaceMapper.specialTradeSub", rpid);
		List<Map<String, String>> specialCaseSub = (List)dao.findForList("GetInterfaceMapper.specialCaseSub", rpid);
		List<Map<String, String>> largeDivideSub = (List)dao.findForList("GetInterfaceMapper.largeDivideSub", rpid);
		List<Map<String, String>> labelInfoSub = (List)dao.findForList("GetInterfaceMapper.labelInfoSub", rpid);
		addSubToMain_SERIAL(borrowDetailMain, curM24ShowSub, "PER_CUR_M24_SHOW_INFO");
		addSubToMain_SERIAL(borrowDetailMain, curY5ShowSub, "PER_CUR_Y5_SHOW_INFO");
		addSubToMain_SERIAL(borrowDetailMain, specialTradeSub, "PER_SPECIAL_TRADE");
		addSubToMain_SERIAL(borrowDetailMain, specialCaseSub, "PER_SPECIAL_CASE_INFO");
		addSubToMain_SERIAL(borrowDetailMain, largeDivideSub, "PER_LARGE_DIVIDE_INFO");
		addSubToMain_SERIAL(borrowDetailMain, labelInfoSub, "PER_LABEL_INFO");		
		//授信协议信息
		List<Map<String, Object>> credBaseInfoMain = (List)dao.findForList("GetInterfaceMapper.credBaseInfoMain", rpid);
		addSubToMain(credBaseInfoMain, labelInfoSub, "PER_LABEL_INFO");
		//相关还款责任信息
		List<Map<String, Object>> repayerMain = (List)dao.findForList("GetInterfaceMapper.repayerMain", rpid);
		addSubToMain(repayerMain, labelInfoSub, "PER_LABEL_INFO");
		//后付费业务信息
		List<Map<String, Object>> afterPayInfoMain = (List)dao.findForList("GetInterfaceMapper.afterPayInfoMain", rpid);
		addSubToMain(afterPayInfoMain, labelInfoSub, "PER_LABEL_INFO");
		//欠税记录信息
		List<Map<String, Object>> oweTaxesMain = (List)dao.findForList("GetInterfaceMapper.oweTaxesMain", rpid);
		addSubToMain(oweTaxesMain, labelInfoSub, "PER_LABEL_INFO");
		//民事判决记录信息
		List<Map<String, Object>> verdictMain = (List)dao.findForList("GetInterfaceMapper.verdictMain", rpid);
		addSubToMain(verdictMain, labelInfoSub, "PER_LABEL_INFO");
		//强制执行记录信息
		List<Map<String, Object>> inforceMain = (List)dao.findForList("GetInterfaceMapper.inforceMain", rpid);
		addSubToMain(inforceMain, labelInfoSub, "PER_LABEL_INFO");
		//行政处罚记录信息
		List<Map<String, Object>> penaltiesMain = (List)dao.findForList("GetInterfaceMapper.penaltiesMain", rpid);
		addSubToMain(penaltiesMain, labelInfoSub, "PER_LABEL_INFO");
		//住房公积金参缴记录信息
		List<Map<String, Object>> providentFundPayMain = (List)dao.findForList("GetInterfaceMapper.providentFundPayMain", rpid);
		addSubToMain(providentFundPayMain, labelInfoSub, "PER_LABEL_INFO");
		//低保救助记录信息
		List<Map<String, Object>> lowSecurityMain = (List)dao.findForList("GetInterfaceMapper.lowSecurityMain", rpid);
		addSubToMain(lowSecurityMain, labelInfoSub, "PER_LABEL_INFO");
		//执业资格记录信息
		List<Map<String, Object>> qualificationMain = (List)dao.findForList("GetInterfaceMapper.qualificationMain", rpid);
		addSubToMain(qualificationMain, labelInfoSub, "PER_LABEL_INFO");
		//行政奖励记录信息
		List<Map<String, Object>> adminiRewardMain = (List)dao.findForList("GetInterfaceMapper.adminiRewardMain", rpid);
		addSubToMain(adminiRewardMain, labelInfoSub, "PER_LABEL_INFO");
		//标注及声明信息
		List<Map<String, Object>> labelInfoMain = (List)dao.findForList("GetInterfaceMapper.labelInfoMain", rpid);
		addSubToMain(labelInfoMain, labelInfoSub, "PER_LABEL_INFO");		
		//查询记录信息
		List<Map<String, String>> search = (List)dao.findForList("GetInterfaceMapper.search", rpid);		
		
	//去掉json中的SERIAL字段
		 
		
		//评分信息
//		List<Map<String, String>> score = (List)dao.findForList("GetInterfaceMapper.score", rpid);

		//转换json
		String reportInfo_json = JSONArray.fromObject(reportInfoMain).toString().replace("null","\"\"");
//		String basic_json = JSONArray.fromObject(basicMain).toString().replace("null","\"\"");		
		String spou_json = JSONArray.fromObject(spou).toString().replace("null","\"\"");
		String live_json = JSONArray.fromObject(live).toString().replace("null","\"\"");
		String career_json = JSONArray.fromObject(career).toString().replace("null","\"\"");
//		String score_json = JSONArray.fromObject(score).toString().replace("null","\"\"");
		String loanSummary_json = JSONArray.fromObject(loanSummaryMain).toString().replace("null","\"\"");
//		String afterPay_json = JSONArray.fromObject(afterPayMain).toString().replace("null","\"\"");
//		String publicInfo_json = JSONArray.fromObject(publicInfoMain).toString().replace("null","\"\"");
		String searchSummary_json = JSONArray.fromObject(searchSummary).toString().replace("null","\"\"");		
		String borrowDetail_json = JSONArray.fromObject(borrowDetailMain).toString().replace("null","\"\"");
		String credBaseInfo_json = JSONArray.fromObject(credBaseInfoMain).toString().replace("null","\"\"");
		String repayer_json = JSONArray.fromObject(repayerMain).toString().replace("null","\"\"");
		String afterPayInfo_json = JSONArray.fromObject(afterPayInfoMain).toString().replace("null","\"\"");
		String oweTaxes_json = JSONArray.fromObject(oweTaxesMain).toString().replace("null","\"\"");
		String verdict_json = JSONArray.fromObject(verdictMain).toString().replace("null","\"\"");	
		String inforce_json = JSONArray.fromObject(inforceMain).toString().replace("null","\"\"");		
		String penalties_json = JSONArray.fromObject(penaltiesMain).toString().replace("null","\"\"");
		String providentFundPay_json = JSONArray.fromObject(providentFundPayMain).toString().replace("null","\"\"");
		String lowSecurity_json = JSONArray.fromObject(lowSecurityMain).toString().replace("null","\"\"");
		String qualification_json = JSONArray.fromObject(qualificationMain).toString().replace("null","\"\"");
		String adminiReward_json = JSONArray.fromObject(adminiRewardMain).toString().replace("null","\"\"");
		String labelInfo_json = JSONArray.fromObject(labelInfoMain).toString().replace("null","\"\"");
		String search_json = JSONArray.fromObject(search).toString().replace("null","\"\"");

		//获取配置文件信息，将每一个表的信息拆分出来，可以在配置文件里面可以控制是否返回该表信息
		PageData pro = BaseController.getPropertiesByFileName("Find-ReportInterface.properties");		
		//转json
//		if(pro.getString("PER_REPORT_INFO") != null && pro.getString("PER_REPORT_INFO").equals("1")){
//			returnJson.put("PER_REPORT_INFO", reportInfo_json);
//		}
		if(pro.getString("PER_BASIC") != null && pro.getString("PER_BASIC").equals("1")){
			returnJson.put("PER_BASIC", reportInfo_json);
		}
		if(pro.getString("PER_SPOU") != null && pro.getString("PER_SPOU").equals("1")){
			returnJson.put("PER_SPOU", spou_json);
		}
		if(pro.getString("PER_LIVE") != null && pro.getString("PER_LIVE").equals("1")){
			returnJson.put("PER_LIVE", live_json);
		}
		if(pro.getString("PER_CAREER") != null && pro.getString("PER_CAREER").equals("1")){
			returnJson.put("PER_CAREER", career_json);
		}
//		if(pro.getString("PER_SCORE") != null && pro.getString("PER_SCORE").equals("1")){
//			returnJson.put("PER_SCORE", score_json);
//		}
		if(pro.getString("PER_LOAN_SUMMARY") != null && pro.getString("PER_LOAN_SUMMARY").equals("1")){
			returnJson.put("PER_LOAN_SUMMARY", loanSummary_json);
		}
//		if(pro.getString("PER_AFTER_PAY_OWE_INFO") != null && pro.getString("PER_AFTER_PAY_OWE_INFO").equals("1")){
//			returnJson.put("PER_AFTER_PAY_OWE_INFO", afterPay_json);
//		}
//		if(pro.getString("PER_PUBLIC_SUMMARY_INFO") != null && pro.getString("PER_PUBLIC_SUMMARY_INFO").equals("1")){
//			returnJson.put("PER_PUBLIC_SUMMARY_INFO", publicInfo_json);
//		}
		if(pro.getString("PER_QUERY_SUMMARY") != null && pro.getString("PER_QUERY_SUMMARY").equals("1")){
			returnJson.put("PER_QUERY_SUMMARY", searchSummary_json);
		}
//		if(pro.getString("PER_BORROW_DETAIL") != null && pro.getString("PER_BORROW_DETAIL").equals("1")){
//			returnJson.put("PER_BORROW_DETAIL", borrowDetail_json);
//		}
		if(pro.getString("PER_LOAN_DETAIL") != null && pro.getString("PER_LOAN_DETAIL").equals("1")){
			returnJson.put("PER_LOAN_DETAIL", borrowDetail_json);
		}
		if(pro.getString("PER_CRED_BASE_INFO") != null && pro.getString("PER_CRED_BASE_INFO").equals("1")){
			returnJson.put("PER_CRED_BASE_INFO", credBaseInfo_json);
		}
		if(pro.getString("PER_REPAYER") != null && pro.getString("PER_REPAYER").equals("1")){
			returnJson.put("PER_REPAYER", repayer_json);
		}
		if(pro.getString("PER_AFTER_PAY_INFO") != null && pro.getString("PER_AFTER_PAY_INFO").equals("1")){
			returnJson.put("PER_AFTER_PAY_INFO", afterPayInfo_json);
		}
		if(pro.getString("PER_OWE_TAXES") != null && pro.getString("PER_OWE_TAXES").equals("1")){
			returnJson.put("PER_OWE_TAXES", oweTaxes_json);
		}
		if(pro.getString("PER_VERDICT") != null && pro.getString("PER_VERDICT").equals("1")){
			returnJson.put("PER_VERDICT", verdict_json);
		}
		if(pro.getString("PER_INFORCE") != null && pro.getString("PER_INFORCE").equals("1")){
			returnJson.put("PER_INFORCE", inforce_json);
		}
		if(pro.getString("PER_PENALTIES") != null && pro.getString("PER_PENALTIES").equals("1")){
			returnJson.put("PER_PENALTIES", penalties_json);
		}
		if(pro.getString("PER_PROVIDENT_FUND_PAY") != null && pro.getString("PER_PROVIDENT_FUND_PAY").equals("1")){
			returnJson.put("PER_PROVIDENT_FUND_PAY", providentFundPay_json);
		}
		if(pro.getString("PER_LOW_SECURITY") != null && pro.getString("PER_LOW_SECURITY").equals("1")){
			returnJson.put("PER_LOW_SECURITY", lowSecurity_json);
		}
		if(pro.getString("PER_QUALIFICATION") != null && pro.getString("PER_QUALIFICATION").equals("1")){
			returnJson.put("PER_QUALIFICATION", qualification_json);
		}
		if(pro.getString("PER_ADMINI_REWARD") != null && pro.getString("PER_ADMINI_REWARD").equals("1")){
			returnJson.put("PER_ADMINI_REWARD", adminiReward_json);
		}
		if(pro.getString("PER_WHOLE_LABEL_INFO") != null && pro.getString("PER_WHOLE_LABEL_INFO").equals("1")){
			returnJson.put("PER_WHOLE_LABEL_INFO", labelInfo_json);
		}
		if(pro.getString("PER_QUERY_DETAIL") != null && pro.getString("PER_QUERY_DETAIL").equals("1")){
			returnJson.put("PER_QUERY_DETAIL", search_json);
		}
		return returnJson;
	}
	//去掉map中的SERIAL字段
	public void del_SERIAL(List<Map<String, Object>> varList,String subName){
			
		
	}
	
	/**
	 * 通过用户名和客户的证件号码，查询个人信用报告的报告编号和状态
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getFlowInfo(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("CrawlerInterfaceMapper.getReportIdByCertno", pd);
	}
	/**
	 * 通过用户名和客户的证件号码，查询个人信用报告类型
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getReportIdType(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("CrawlerInterfaceMapper.getReportIdType", pd);
	}
	/**
	 * 根据报告编号返回JSONObject
	 * @param reportid
	 * @return
	 * @throws Exception
	 */
	public JSONObject getJsonByReportid_old(String rpid,String type) throws Exception{
		JSONObject returnJson = new JSONObject();
		//String returnJson = new String();
		//报告信息
		List<Map<String, String>> reportInfo = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.reportInfo", rpid);
		//个人基本信息
		List<Map<String, String>> basic = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.basic", rpid);
		//配偶信息
		List<Map<String, String>> spou = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.spou", rpid);
		//居住信息
		List<Map<String, String>> live = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.live", rpid);
		//职业信息
		List<Map<String, String>> career = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.career", rpid);
		List<Map<String, String>> loanSummary = new ArrayList<Map<String, String>>();
		if("2".equals(type)){
			//信息概要带数字解读
			loanSummary = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.loanSummaryType", rpid);
		}else{
			//信息概要
			loanSummary = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.loanSummary", rpid);
		}
		
		//贷款
		List<Map<String, String>> loanDetail = (List<Map<String, String>>)dao.findForList("CrawlerPerInterfaceMapper.loanDetail", rpid);
		//贷记卡
		List<Map<String, String>> creditDetail = (List<Map<String, String>>)dao.findForList("CrawlerPerInterfaceMapper.creditDetail", rpid);
		//准贷记卡
		List<Map<String, String>> qCredit = (List<Map<String, String>>)dao.findForList("CrawlerPerInterfaceMapper.qCredit", rpid);
		//住房公积金参缴记录
		List<Map<String, String>> providentFund = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.providentFund", rpid);
		//养老保险金缴存记录
		List<Map<String, String>> pensioPay = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.pensioPay", rpid);
		//查询记录汇总
		List<Map<String, String>> querySummary = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.querySummary", rpid);
		//信贷审批查询记录明细
		List<Map<String, String>> queryDetail = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.queryDetail", rpid);
		//资产处置/保证人代偿信息
		List<Map<String, String>> assetsDisposal = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.assetsDisposal", rpid);
		//对外担保信息明细
		List<Map<String, String>> externalGuarantee = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.externalGuarantee", rpid);
		//贷款/贷记卡/准贷记卡逾期记录
		List<Map<String, String>> overdueSummary = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.overdueSummary", rpid);
		//特殊交易类型
		List<Map<String, String>> specialTrade = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.SpecialTrade", rpid);
		//说明/声明/标注信息表
		List<Map<String, String>> statement = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.statement", rpid);
		//欠税记录明细
		List<Map<String, String>> oweTaxes = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.oweTaxes", rpid);
		//民事判决/强制执行记录
		List<Map<String, String>> verdict = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.verdict", rpid);
		//行政处罚记录
		List<Map<String, String>> penalties = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.penalties", rpid);
		//养老保险金发放记录
		List<Map<String, String>> pensioRelease = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.pensioRelease", rpid);
		//低保救助记录
		List<Map<String, String>> lowSecurity = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.lowSecurity", rpid);
		//执业资格记录
		List<Map<String, String>> qualification = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.qualification", rpid);
		//行政奖励记录
		List<Map<String, String>> adminiReward = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.adminiReward", rpid);
		//车辆交易和抵押记录
		List<Map<String, String>> vehicleTransaction = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.vehicleTransaction", rpid);
		//电信缴费记录
		List<Map<String, String>> telPay = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.telPay", rpid);
		
		//转换json
		String reportInfo_json = JSONArray.fromObject(reportInfo).toString().replace("null", "\"\"");
		String basic_json = JSONArray.fromObject(basic).toString().replace("null", "\"\"");
		String spou_json = JSONArray.fromObject(spou).toString().replace("null", "\"\"");
		String live_json = JSONArray.fromObject(live).toString().replace("null", "\"\"");
		String career_json = JSONArray.fromObject(career).toString().replace("null", "\"\"");
		String loanSummary_json = JSONArray.fromObject(loanSummary).toString().replace("null", "\"\"");
		String loanDetail_json = JSONArray.fromObject(loanDetail).toString().replace("null", "\"\"");
		String creditDetail_json = JSONArray.fromObject(creditDetail).toString().replace("null", "\"\"");
		String qCredit_json = JSONArray.fromObject(qCredit).toString().replace("null", "\"\"");
		String providentFund_json = JSONArray.fromObject(providentFund).toString().replace("null", "\"\"");
		String pensioPay_json = JSONArray.fromObject(pensioPay).toString().replace("null", "\"\"");
		String querySummary_json = JSONArray.fromObject(querySummary).toString().replace("null", "\"\"");
		String queryDetail_json = JSONArray.fromObject(queryDetail).toString().replace("null", "\"\"");
		String assetsDisposal_json = JSONArray.fromObject(assetsDisposal).toString().replace("null", "\"\"");
		String externalGuarantee_json = JSONArray.fromObject(externalGuarantee).toString().replace("null", "\"\"");
		String overdueSummary_json = JSONArray.fromObject(overdueSummary).toString().replace("null", "\"\"");
		String specialTrade_json = JSONArray.fromObject(specialTrade).toString().replace("null", "\"\"");
		String statement_json = JSONArray.fromObject(statement).toString().replace("null", "\"\"");
		String oweTaxes_json = JSONArray.fromObject(oweTaxes).toString().replace("null", "\"\"");
		String verdict_json = JSONArray.fromObject(verdict).toString().replace("null", "\"\"");
		String penalties_json = JSONArray.fromObject(penalties).toString().replace("null", "\"\"");
		String pensioRelease_json = JSONArray.fromObject(pensioRelease).toString().replace("null", "\"\"");
		String lowSecurity_json = JSONArray.fromObject(lowSecurity).toString().replace("null", "\"\"");
		String qualification_json = JSONArray.fromObject(qualification).toString().replace("null", "\"\"");
		String adminiReward_json = JSONArray.fromObject(adminiReward).toString().replace("null", "\"\"");
		String vehicleTransaction_json = JSONArray.fromObject(vehicleTransaction).toString().replace("null", "\"\"");
		String telPay_json = JSONArray.fromObject(telPay).toString().replace("null", "\"\"");
		//获取配置文件信息，将每一个表的信息拆分出来，可以在配置文件里面可以控制是否返回该表信息
		PageData pro = BaseController.getPropertiesByFileName("Find-Report.properties");		
		//转json
		if(pro.getString("PER_REPORT_INFO") != null && pro.getString("PER_REPORT_INFO").equals("1")){
			returnJson.element("PER_REPORT_INFO", reportInfo_json);
		}
		if(pro.getString("PER_BASIC") != null && pro.getString("PER_BASIC").equals("1")){
			returnJson.element("PER_BASIC", basic_json);
		}
		if(pro.getString("PER_SPOU") != null && pro.getString("PER_SPOU").equals("1")){
			returnJson.element("PER_SPOU", spou_json);
		}
		if(pro.getString("PER_LIVE") != null && pro.getString("PER_LIVE").equals("1")){
			returnJson.element("PER_LIVE", live_json);
		}
		if(pro.getString("PER_CAREER") != null && pro.getString("PER_CAREER").equals("1")){
			returnJson.element("PER_CAREER", career_json);
		}
		if(pro.getString("PER_LOAN_SUMMARY") != null && pro.getString("PER_LOAN_SUMMARY").equals("1")){
			returnJson.element("PER_LOAN_SUMMARY", loanSummary_json);
		}
		if(pro.getString("PER_LOAN_DETAIL") != null && pro.getString("PER_LOAN_DETAIL").equals("1")){
			returnJson.element("PER_LOAN_DETAIL", loanDetail_json);
		}
		if(pro.getString("PER_CREDIT_DETAIL") != null && pro.getString("PER_CREDIT_DETAIL").equals("1")){
			returnJson.element("PER_CREDIT_DETAIL", creditDetail_json);
		}
		if(pro.getString("PER_Q_CREDIT_DETAIL") != null && pro.getString("PER_Q_CREDIT_DETAIL").equals("1")){
			returnJson.element("PER_Q_CREDIT_DETAIL", qCredit_json);
		}
		if(pro.getString("PER_PROVIDENT_FUND_PAY") != null && pro.getString("PER_PROVIDENT_FUND_PAY").equals("1")){
			returnJson.element("PER_PROVIDENT_FUND_PAY", providentFund_json);
		}
		if(pro.getString("PER_PENSIO_PAY") != null && pro.getString("PER_PENSIO_PAY").equals("1")){
			returnJson.element("PER_PENSIO_PAY", pensioPay_json);
		}
		if(pro.getString("PER_QUERY_SUMMARY") != null && pro.getString("PER_QUERY_SUMMARY").equals("1")){
			returnJson.element("PER_QUERY_SUMMARY", querySummary_json);
		}
		if(pro.getString("PER_QUERY_DETAIL") != null && pro.getString("PER_QUERY_DETAIL").equals("1")){
			returnJson.element("PER_QUERY_DETAIL", queryDetail_json);
		}
		if(pro.getString("PER_ASSETS_DISPOSAL") != null && pro.getString("PER_ASSETS_DISPOSAL").equals("1")){
			returnJson.element("PER_ASSETS_DISPOSAL", assetsDisposal_json);
		}
		if(pro.getString("PER_EXTERNAL_GUARANTEE_DETAIL") != null && pro.getString("PER_EXTERNAL_GUARANTEE_DETAIL").equals("1")){
			returnJson.element("PER_EXTERNAL_GUARANTEE_DETAIL", externalGuarantee_json);
		}
		if(pro.getString("PER_OVERDUE_SUMMARY") != null && pro.getString("PER_OVERDUE_SUMMARY").equals("1")){
			returnJson.element("PER_OVERDUE_SUMMARY", overdueSummary_json);
		}
		if(pro.getString("PER_SPECIAL_TRADE") != null && pro.getString("PER_SPECIAL_TRADE").equals("1")){
			returnJson.element("PER_SPECIAL_TRADE", specialTrade_json);
		}
		if(pro.getString("PER_STATEMENT") != null && pro.getString("PER_STATEMENT").equals("1")){
			returnJson.element("PER_STATEMENT", statement_json);
		}
		if(pro.getString("PER_OWE_TAXES") != null && pro.getString("PER_OWE_TAXES").equals("1")){
			returnJson.element("PER_OWE_TAXES", oweTaxes_json);
		}
		if(pro.getString("PER_VERDICT") != null && pro.getString("PER_VERDICT").equals("1")){
			returnJson.element("PER_VERDICT", verdict_json);
		}
		if(pro.getString("PER_PENALTIES") != null && pro.getString("PER_PENALTIES").equals("1")){
			returnJson.element("PER_PENALTIES", penalties_json);
		}
		if(pro.getString("PER_PENSIO_RELEASE") != null && pro.getString("PER_PENSIO_RELEASE").equals("1")){
			returnJson.element("PER_PENSIO_RELEASE", pensioRelease_json);
		}
		if(pro.getString("PER_LOW_SECURITY") != null && pro.getString("PER_LOW_SECURITY").equals("1")){
			returnJson.element("PER_LOW_SECURITY", lowSecurity_json);
		}
		if(pro.getString("PER_QUALIFICATION") != null && pro.getString("PER_QUALIFICATION").equals("1")){
			returnJson.element("PER_QUALIFICATION", qualification_json);
		}
		if(pro.getString("PER_ADMINI_REWARD") != null && pro.getString("PER_ADMINI_REWARD").equals("1")){
			returnJson.element("PER_ADMINI_REWARD", adminiReward_json);
		}
		if(pro.getString("PER_VEHICLE_TRANSACTION") != null && pro.getString("PER_VEHICLE_TRANSACTION").equals("1")){
			returnJson.element("PER_VEHICLE_TRANSACTION", vehicleTransaction_json);
		}
		if(pro.getString("PER_TEL_PAY") != null && pro.getString("PER_TEL_PAY").equals("1")){
			returnJson.element("PER_TEL_PAY", telPay_json);
		}		
		return returnJson;
	}
}
