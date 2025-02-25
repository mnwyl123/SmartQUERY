package com.dcits.credit.service.rest.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.rest.PersonReportService;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.PasswordOper;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

import com.dcits.platform.util.DateUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 查看报告接口
 * @author wangwenming
 * certid:证件号码   username：用户名
 */
@Service("PersonReportService")
public class PersonReportServiceImpl implements PersonReportService {

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
			returnJson = getReportForCredit(pd);
		}else{
			returnJson = getReportForCredit_old(pd);
		}
		return returnJson;
	}
	/**
	 * 根据用户名和客户的证件号码，查询个人信用报告信息（信贷接口）
	 */
	public JSONObject getReportForCredit(PageData pd) throws Exception {
		JSONObject returnJson = new JSONObject();
		//根据用户名和客户的证件号码，查到的个人信用报告的报告编号
		List<PageData> rpids = getFlowInfo(pd);
		String rpid = rpids.get(0).getString("REPORT_ID");
		//存放PER_CREDIT_SUMMARY表数据
		List<Map<String,String>> creditSummInfo = new ArrayList<Map<String,String>>();
		Map<String,String> map = new HashMap<String,String>();
		//returnJson = getJsonByReportid(rpid);
		//报告日期，报告编号
		PageData reportDate=(PageData)dao.findForObject("CrawlerInterfaceMapper.reportDate", rpid);
		map.putAll(reportDate);
		//creditSummInfo.add(reportDate);
		//贷款贷记卡24个月还款状态存在数字
		List<Map<String, String>> repayStatus = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.repayStatus", rpid);
		//贷款贷记卡24个月还款状态存在N
		List<Map<String, String>> repayStatus1 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.repayStatus1", rpid);
		List<Map<String, String>> repayStatus2 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.repayStatus2", rpid);
		List<Map<String, String>> repayStatus3 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.repayStatus3", rpid);
		List<Map<String, String>> repayStatus4 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.repayStatus4", rpid);
		//贷款贷记卡账户状态有呆账
		List<Map<String, String>> repayStatus5 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.repayStatus5", rpid);
		/*PageData repayStatus =  (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus", rpid);
		PageData repayStatus1 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus1", rpid);
		PageData repayStatus2 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus2", rpid);
		PageData repayStatus3 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus3", rpid);
		PageData repayStatus4 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus4", rpid);
		PageData repayStatus5 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus5", rpid);*/
		/*//贷款贷记卡24个月还款状态存在N
		PageData repayStatus = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus", rpid);
		//账户状态没有呆账
		PageData repayStatus1 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus1", rpid);
		//贷款贷记卡24个月还款状态没有数字
		PageData repayStatus2 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus2", rpid);
		//贷款贷记卡24个月还款状态最大为1
		PageData repayStatus3 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus3", rpid);
		//贷款贷记卡24个月还款状态最大为2
		PageData repayStatus4 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus4", rpid);
		PageData repayStatus5 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus5", rpid);*/
		//过去两年中最差还款状态
		/*if(repayStatus.get("TOTAL")==repayStatus1.get("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "1");
		}
		if(repayStatus.get("TOTAL")==repayStatus2.get("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "2");
		}
		if(repayStatus.get("TOTAL")==repayStatus3.getString("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "3");
		}
		if(repayStatus.get("TOTAL")==repayStatus4.getString("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "4");
		}
		if(repayStatus.get("TOTAL")==repayStatus5.getString("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "5");
		}*/
		/*if(repayStatus1.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "1");
		}else if(repayStatus2.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "2");
		}else if(repayStatus3.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "3");
		}else if(repayStatus4.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "4");
		}else if(repayStatus5.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "5");
		}*/
	    if(repayStatus4.size()>0){
			map.put("YA2_WORST_REPAY_STATE", "4");
		}else if(repayStatus3.size()>0){
			map.put("YA2_WORST_REPAY_STATE", "3");
		}else if(repayStatus2.size()>0){
			map.put("YA2_WORST_REPAY_STATE", "2");
		}else if(repayStatus1.size()>0&&repayStatus.size()<=0&&repayStatus5.size()<=0){
			map.put("YA2_WORST_REPAY_STATE", "1");
		}else if(repayStatus1.size()<=0&&repayStatus.size()<=0&&repayStatus5.size()<=0){
			map.put("YA2_WORST_REPAY_STATE", "5");
		}
		//creditSummInfo.add(map);
		//过去两年中累计逾期次数
		PageData twoYearOverdueNum=(PageData)dao.findForObject("CrawlerInterfaceMapper.twoYearOverdueNum", rpid);
		if(twoYearOverdueNum!=null){
			map.putAll(twoYearOverdueNum);
		}else{
			map.put("YA2_OVERDUE_NUM", "");
		}
		//creditSummInfo.add(twoYearOverdueNum);
		//首次与银行（含他行）建立信贷关系年份
		List<Map<String, String>> firstCredit = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapper.firstCredit", rpid);
		if(firstCredit!=null&&firstCredit.size()>0){
			map.putAll(firstCredit.get(0));
		}else{
			map.put("FIRST_CREDIT", "");
		}
		//为他人贷款合同担保金额汇总
		PageData otherLoanGuaranteeAmount=(PageData)dao.findForObject("CrawlerInterfaceMapper.otherLoanGuaranteeAmount", rpid);
		if(otherLoanGuaranteeAmount!=null){
			map.putAll(otherLoanGuaranteeAmount);
		}else{
			map.put("OTHER_LOAN_GUARANTEE_AMOUNT", "");
		}
		//最近两年内征信报告查询次数
		PageData yearQueryNum=(PageData)dao.findForObject("CrawlerInterfaceMapper.yearQueryNum", rpid);
		//creditSummInfo.add(yearQueryNum);
		if(yearQueryNum!=null){
			map.putAll(yearQueryNum);
		}else{
			map.put("YA_QUERY_NUM", "");
		}
		//未销户贷记卡账户数汇总,未销户贷记卡发卡机构数汇总
		PageData nsCreditCard=(PageData)dao.findForObject("CrawlerInterfaceMapper.nsCreditCard", rpid);
		if(nsCreditCard!=null){
			map.putAll(nsCreditCard);
		}else{
			map.put("NS_CREDIT_CARD_ORG_NUM", "");
			map.put("NS_CREDIT_CARD_NUM", "");
		}
		//准贷记卡透支180天以上未付余额汇总
		PageData noPayAmount=(PageData)dao.findForObject("CrawlerInterfaceMapper.noPayAmount", rpid);
		if(noPayAmount!=null){
			map.putAll(noPayAmount);
		}else{
			map.put("NO_PAY_AMOUNT_180", "");
		}
		//银行信贷账户数汇总,未结清贷款笔数汇总,未结清贷款法人机构数汇总,未结清贷款合同金额汇总,未结清贷款余额汇总
		//未找到对应数据项***
		PageData nsLoanNum=(PageData)dao.findForObject("CrawlerInterfaceMapper.nsLoanNum", rpid);
		if(nsLoanNum!=null){
			map.putAll(nsLoanNum);
		}else{
			map.put("LOAN_ACCOUNT_NUM", "");
			map.put("NS_LOAN_NUM", "");
			map.put("NS_LOAN_ORG_NUM", "");
			map.put("NS_LOAN_AMOUNT", "");
			map.put("NS_LOAN_BALANCE", "");
		}
		//未结清贷款当前逾期总额
		PageData nsLoanOverdue=(PageData)dao.findForObject("CrawlerInterfaceMapper.nsLoanOverdue", rpid);
		if(nsLoanOverdue!=null){
			map.putAll(nsLoanOverdue);
		}else{
			map.put("NS_LOAN_OVERDUE_AMOUNT", "");
		}
		//未销户贷记卡授信总额
		//未结清贷款当前逾期总额
		PageData NcardSum=(PageData)dao.findForObject("CrawlerInterfaceMapper.NcardSum", rpid);
		if(NcardSum!=null){
			map.putAll(NcardSum);
		}else{
			map.put("CREDITCARDTOTALSUM", "");
		}
		
		creditSummInfo.add(map);
		String creditSummInfo_json = JSONArray.fromObject(creditSummInfo).toString().replace("null", "\"\"");
		returnJson.element("PER_CREDIT_SUMMARY", creditSummInfo_json);
		return returnJson;
	}
	/**
	 * 根据用户名和客户的证件号码，查询个人信用报告信息（信贷接口）
	 */
		JSONObject returnJson = new JSONObject();
		public JSONObject getReportForCredit_old(PageData pd) throws Exception {
		//根据用户名和客户的证件号码，查到的个人信用报告的报告编号
		List<PageData> rpids = getFlowInfo(pd);
		String rpid = rpids.get(0).getString("REPORT_ID");
		//存放PER_CREDIT_SUMMARY表数据
		List<Map<String,String>> creditSummInfo = new ArrayList<Map<String,String>>();
		Map<String,String> map = new HashMap<String,String>();
		//returnJson = getJsonByReportid(rpid);
		//报告日期，报告编号
		PageData reportDate=(PageData)dao.findForObject("CrawlerInterfaceMapperOld.reportDate", rpid);
		map.putAll(reportDate);
		//creditSummInfo.add(reportDate);
		//贷款贷记卡24个月还款状态存在数字
		List<Map<String, String>> repayStatus = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapperOld.repayStatus", rpid);
		//贷款贷记卡24个月还款状态存在N
		List<Map<String, String>> repayStatus1 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapperOld.repayStatus1", rpid);
		List<Map<String, String>> repayStatus2 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapperOld.repayStatus2", rpid);
		List<Map<String, String>> repayStatus3 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapperOld.repayStatus3", rpid);
		List<Map<String, String>> repayStatus4 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapperOld.repayStatus4", rpid);
		//贷款贷记卡账户状态有呆账
		List<Map<String, String>> repayStatus5 = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapperOld.repayStatus5", rpid);
		/*PageData repayStatus =  (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus", rpid);
		PageData repayStatus1 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus1", rpid);
		PageData repayStatus2 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus2", rpid);
		PageData repayStatus3 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus3", rpid);
		PageData repayStatus4 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus4", rpid);
		PageData repayStatus5 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus5", rpid);*/
		/*//贷款贷记卡24个月还款状态存在N
		PageData repayStatus = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus", rpid);
		//账户状态没有呆账
		PageData repayStatus1 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus1", rpid);
		//贷款贷记卡24个月还款状态没有数字
		PageData repayStatus2 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus2", rpid);
		//贷款贷记卡24个月还款状态最大为1
		PageData repayStatus3 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus3", rpid);
		//贷款贷记卡24个月还款状态最大为2
		PageData repayStatus4 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus4", rpid);
		PageData repayStatus5 = (PageData)dao.findForObject("CrawlerInterfaceMapper.repayStatus5", rpid);*/
		//过去两年中最差还款状态
		/*if(repayStatus.get("TOTAL")==repayStatus1.get("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "1");
		}
		if(repayStatus.get("TOTAL")==repayStatus2.get("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "2");
		}
		if(repayStatus.get("TOTAL")==repayStatus3.getString("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "3");
		}
		if(repayStatus.get("TOTAL")==repayStatus4.getString("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "4");
		}
		if(repayStatus.get("TOTAL")==repayStatus5.getString("REPAY_COUNT")){
			map.put("2YA_WORST_REPAY_STATE", "5");
		}*/
		/*if(repayStatus1.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "1");
		}else if(repayStatus2.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "2");
		}else if(repayStatus3.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "3");
		}else if(repayStatus4.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "4");
		}else if(repayStatus5.size()>0){
			map.put("2YA_WORST_REPAY_STATE", "5");
		}*/
	    if(repayStatus4.size()>0){
			map.put("YA2_WORST_REPAY_STATE", "4");
		}else if(repayStatus3.size()>0){
			map.put("YA2_WORST_REPAY_STATE", "3");
		}else if(repayStatus2.size()>0){
			map.put("YA2_WORST_REPAY_STATE", "2");
		}else if(repayStatus1.size()>0&&repayStatus.size()<=0&&repayStatus5.size()<=0){
			map.put("YA2_WORST_REPAY_STATE", "1");
		}else if(repayStatus1.size()<=0&&repayStatus.size()<=0&&repayStatus5.size()<=0){
			map.put("YA2_WORST_REPAY_STATE", "5");
		}
		//creditSummInfo.add(map);
		//过去两年中累计逾期次数
		PageData twoYearOverdueNum=(PageData)dao.findForObject("CrawlerInterfaceMapperOld.twoYearOverdueNum", rpid);
		if(twoYearOverdueNum!=null){
			map.putAll(twoYearOverdueNum);
		}else{
			map.put("YA2_OVERDUE_NUM", "");
		}
		//creditSummInfo.add(twoYearOverdueNum);
		//首次与银行（含他行）建立信贷关系年份
		List<Map<String, String>> firstCredit = (List<Map<String, String>>)dao.findForList("CrawlerInterfaceMapperOld.firstCredit", rpid);
		if(firstCredit!=null&&firstCredit.size()>0){
			map.putAll(firstCredit.get(0));
		}else{
			map.put("FIRST_CREDIT", "");
		}
		//为他人贷款合同担保金额汇总
		PageData otherLoanGuaranteeAmount=(PageData)dao.findForObject("CrawlerInterfaceMapperOld.otherLoanGuaranteeAmount", rpid);
		if(otherLoanGuaranteeAmount!=null){
			map.putAll(otherLoanGuaranteeAmount);
		}else{
			map.put("OTHER_LOAN_GUARANTEE_AMOUNT", "");
		}
		//最近两年内征信报告查询次数
		PageData yearQueryNum=(PageData)dao.findForObject("CrawlerInterfaceMapperOld.yearQueryNum", rpid);
		//creditSummInfo.add(yearQueryNum);
		if(yearQueryNum!=null){
			map.putAll(yearQueryNum);
		}else{
			map.put("YA_QUERY_NUM", "");
		}
		//未销户贷记卡账户数汇总,未销户贷记卡发卡机构数汇总
		PageData nsCreditCard=(PageData)dao.findForObject("CrawlerInterfaceMapperOld.nsCreditCard", rpid);
		if(nsCreditCard!=null){
			map.putAll(nsCreditCard);
		}else{
			map.put("NS_CREDIT_CARD_ORG_NUM", "");
			map.put("NS_CREDIT_CARD_NUM", "");
		}
		//准贷记卡透支180天以上未付余额汇总
		PageData noPayAmount=(PageData)dao.findForObject("CrawlerInterfaceMapperOld.noPayAmount", rpid);
		if(noPayAmount!=null){
			map.putAll(noPayAmount);
		}else{
			map.put("NO_PAY_AMOUNT_180", "");
		}
		//银行信贷账户数汇总,未结清贷款笔数汇总,未结清贷款法人机构数汇总,未结清贷款合同金额汇总,未结清贷款余额汇总
		//未找到对应数据项***
		PageData nsLoanNum=(PageData)dao.findForObject("CrawlerInterfaceMapperOld.nsLoanNum", rpid);
		if(nsLoanNum!=null){
			map.putAll(nsLoanNum);
		}else{
			map.put("LOAN_ACCOUNT_NUM", "");
			map.put("NS_LOAN_NUM", "");
			map.put("NS_LOAN_ORG_NUM", "");
			map.put("NS_LOAN_AMOUNT", "");
			map.put("NS_LOAN_BALANCE", "");
		}
		//未结清贷款当前逾期总额
		PageData nsLoanOverdue=(PageData)dao.findForObject("CrawlerInterfaceMapperOld.nsLoanOverdue", rpid);
		if(nsLoanOverdue!=null){
			map.putAll(nsLoanOverdue);
		}else{
			map.put("NS_LOAN_OVERDUE_AMOUNT", "");
		}
		//未销户贷记卡授信总额
		//未结清贷款当前逾期总额
		PageData NcardSum=(PageData)dao.findForObject("CrawlerInterfaceMapperOld.NcardSum", rpid);
		if(NcardSum!=null){
			map.putAll(NcardSum);
		}else{
			map.put("CREDITCARDTOTALSUM", "");
		}
		
		creditSummInfo.add(map);
		String creditSummInfo_json = JSONArray.fromObject(creditSummInfo).toString().replace("null", "\"\"");
		returnJson.element("PER_CREDIT_SUMMARY", creditSummInfo_json);
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
}
