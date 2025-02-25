package com.dcits.credit.service.rest.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.rest.ReportInterfaceService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.PageData;
/**
 * 查看报告接口
 * @author wangwenming
 * certid:证件号码   username：用户名
 */
@Service("reportInterfaceService")
public class ReportInterfaceServiceImpl implements ReportInterfaceService {

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
		//查询查询类型字段
		try{
			List<PageData> reprotTypes = getReportIdType(pd);
			type = reprotTypes.get(0).getString("QUERY_TYPE");
		}catch(Exception e){
			type = "0";
		}
		returnJson = getJsonByReportid(rpid,type);
		return returnJson;
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
	public JSONObject getJsonByReportid(String rpid,String type) throws Exception{
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
		List<Map<String, String>> loanDetail = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.loanDetail", rpid);
		//贷记卡
		List<Map<String, String>> creditDetail = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.creditDetail", rpid);
		//准贷记卡
		List<Map<String, String>> qCredit = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.qCredit", rpid);
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
