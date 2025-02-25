package com.dcits.credit.service.CreditCompanyServer.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.CreditCompanyServer.CreditCompanyServerService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.PageData;
/**
 * 信贷企业接口
 */
@Service("creditCompanyServerService")
public class CreditCompanyServerServiceImpl implements CreditCompanyServerService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(CreditCompanyServerServiceImpl.class);
	//判断查询时间
	@Override
	public JSONObject getReportDataByDate(String REPORT_ID) {
		JSONObject returnJson = new JSONObject();
		try {
			String date = BaseController.getServerInfo().getString("switch_time");
			PageData pd = QueryEntDetail(REPORT_ID);
			String query_time = pd.getString("QUERY_TIME");//本次查询时间
			boolean is_new = DateUtil.compareDate2(query_time,date);
			if(is_new){
				returnJson = getReportDataNow(REPORT_ID);
			}else{
				returnJson = getReportData(REPORT_ID);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return returnJson;
	}	
	//根据report_id查询报告数据_返回一代的数据
	@Override
	public JSONObject getReportData(String REPORT_ID){
		//返回json格式的数据
		JSONObject returnJson = new JSONObject();
		//存放COM_CREDIT_SUMMARY表数据
		List<Map<String,String>> creditSummInfo = new ArrayList<Map<String,String>>();
		Map<String,String> map = new HashMap<String,String>();
		//存放mapping中方法名
		List<String> listMethodName = new ArrayList<String>();
		 
		try {
			//查询报告时间
			List<Map<String, String>> dataInfo = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapperOld.getCreditReport", REPORT_ID);
			map.putAll(dataInfo.get(0));
			 //查询社保缴费状态
			dataInfo = (List<Map<String,String>>) dao.findForList("CreditCompanyServerMapperOld.getCreditSecurPayStatus", REPORT_ID);
			if(dataInfo.size()==0){
				map.put("SOCIAL_SECURITY_STATE", "");
			}else{
				map.putAll(dataInfo.get(0));
			}
			//查询是否有水电费拖欠情况
			dataInfo = (List<Map<String,String>>) dao.findForList("CreditCompanyServerMapperOld.getCreditCostPayStatus", REPORT_ID);
			if(dataInfo.size()==0){
				map.put("WATER_ELECTRICITY_STATE", "");
			}else{
				map.putAll(dataInfo.get(0));
			}
			//已结信贷发生额历史情况
			String count = (String) dao.findForObject("CreditCompanyServerMapperOld.getCreditCount", REPORT_ID);
			
			if("0".equals(count)){  //无已结清信贷业务
				map.put("CREDIT_AMOUNT_HISTORY_STATE", "2");
			}else{ 
				count = (String) dao.findForObject("CreditCompanyServerMapperOld.getCreditAttenNum", REPORT_ID);
				if("0".equals(count)){ //有已结清信贷业务且业务均正常
					map.put("CREDIT_AMOUNT_HISTORY_STATE", "1");
				}
				count = (String) dao.findForObject("CreditCompanyServerMapperOld.getCreditYAttenNum", REPORT_ID);
				if(!"0".equals(count)){ //有已结清信贷业务且业务类型为次级、可疑、损失,已结清信贷信息概要中是否全部在正常类
					map.put("CREDIT_AMOUNT_HISTORY_STATE", "3");
				}
			}
			
			//查询COM_CREDIT_SUMMARY表中剩余字段数据
			listMethodName = new ArrayList<String>();
			listMethodName.add("getCreditNGuar");  //未结清对外担保金额汇总
			listMethodName.add("getCreditNAtten");  //未结清不良信贷金额汇总
			listMethodName.add("getCreditYAtten");  //已结清不良贷款金额汇总
			listMethodName.add("getCreditNSum");  //已结清不良贷款金额汇总
			listMethodName.add("getCreditYSum");  //已结清信贷金额汇总
			listMethodName.add("getCreditLackSum");  //欠息余额汇总
			listMethodName.add("getCreditBussBalance");  //贷款业务余额(元)
			listMethodName.add("getCreditMiddBalance");  //中间和表外业务余额(元)
			listMethodName.add("getCreditBussSum");  //贷款业务授信额(元)
			listMethodName.add("getCreditMiddBussSum");  //中间和表外业务授信额(元)
			for(int i=0;i<listMethodName.size();i++){
				//查询数据
				dataInfo = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapperOld."+listMethodName.get(i), REPORT_ID);
				map.putAll(dataInfo.get(0));
			}
			creditSummInfo.add(map);
			//查询COM_CREDIT_DISPOSAL表数据
			List<Map<String,String>> creditDisposal = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapperOld.getCreditAssetDebt", REPORT_ID);
			//查询COM_CREDIT_COMPENSATION表数据
			List<Map<String,String>> creditCompensation = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapperOld.getCreditGuarComp", REPORT_ID);
			//查询COM_CREDIT_OWE_INTEREST表数据
			List<Map<String,String>> creditOweInterest = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapperOld.getCreditLackInfo", REPORT_ID);
			//转换json
			try{
				returnJson.element("COM_CREDIT_SUMMARY",JSONArray.fromObject(creditSummInfo).toString().replace("null", "\"\""));
				returnJson.element("COM_CREDIT_DISPOSAL",JSONArray.fromObject(creditDisposal).toString().replace("null", "\"\""));
				returnJson.element("COM_CREDIT_COMPENSATION",JSONArray.fromObject(creditCompensation).toString().replace("null", "\"\""));
				returnJson.element("COM_CREDIT_OWE_INTEREST",JSONArray.fromObject(creditOweInterest).toString().replace("null", "\"\""));
				return returnJson;
			}catch(Exception e){
				logger.error("数据转为json格式异常!");
				logger.error(e.getMessage(),e);
				return null;
			}
		} catch (Exception e1) {
			logger.error("数据查询异常!");
			logger.error(e1.getMessage(),e1);
			return null;
		}
	}
	//根据审核时间查询新数据
	@Override
	public JSONObject getReportDataNow(String REPORT_ID) {
		//返回json格式的数据
		JSONObject returnJson = new JSONObject();
		//存放COM_CREDIT_SUMMARY表数据
		List<Map<String,String>> creditSummInfo = new ArrayList<Map<String,String>>();
		Map<String,String> map = new HashMap<String,String>();
		//存放mapping中方法名
		List<String> listMethodName = new ArrayList<String>();
		try {
			//查询报告时间
			List<Map<String, String>> dataInfo = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapper.getCreditReport", REPORT_ID);
			map.putAll(dataInfo.get(0));
			 //查询社保缴费状态
			dataInfo = (List<Map<String,String>>) dao.findForList("CreditCompanyServerMapper.getCreditSecurPayStatus", REPORT_ID);
			if(dataInfo.size()==0){
				map.put("SOCIAL_SECURITY_STATE", "");
			}else{
				map.putAll(dataInfo.get(0));
			}
			//查询是否有水电费拖欠情况
			dataInfo = (List<Map<String,String>>) dao.findForList("CreditCompanyServerMapper.getCreditCostPayStatus", REPORT_ID);
			if(dataInfo.size()==0){
				map.put("WATER_ELECTRICITY_STATE", "");
			}else{
				map.putAll(dataInfo.get(0));
			}
			//已结信贷发生额历史情况
			String count = (String) dao.findForObject("CreditCompanyServerMapper.getCreditCount", REPORT_ID);
			if("0".equals(count)){  //无已结清信贷业务
				map.put("CREDIT_AMOUNT_HISTORY_STATE", "2");
			}else{ 
				count = (String) dao.findForObject("CreditCompanyServerMapper.getCreditAttenNum", REPORT_ID);
				if("0".equals(count)){ //有已结清信贷业务且业务均正常
					map.put("CREDIT_AMOUNT_HISTORY_STATE", "1");
				}
				count = (String) dao.findForObject("CreditCompanyServerMapper.getCreditYAttenNum", REPORT_ID);
				if(!"0".equals(count)){ //有已结清信贷业务且业务类型为次级、可疑、损失,已结清信贷信息概要中是否全部在正常类
					map.put("CREDIT_AMOUNT_HISTORY_STATE", "3");
				}
			}
			//查询COM_CREDIT_SUMMARY表中剩余字段数据
			listMethodName = new ArrayList<String>();
			listMethodName.add("getCreditNGuar");  //未结清对外担保金额汇总
			listMethodName.add("getCreditNAtten");  //未结清不良信贷金额汇总
			listMethodName.add("getCreditYAtten");  //已结清不良贷款金额汇总
			listMethodName.add("getCreditNSum");  //已结清不良贷款金额汇总
			listMethodName.add("getCreditYSum");  //已结清信贷金额汇总
			listMethodName.add("getCreditLackSum");  //欠息余额汇总
			listMethodName.add("getCreditBussBalance");  //贷款业务余额(元)
			listMethodName.add("getCreditMiddBalance");  //中间和表外业务余额(元)
			listMethodName.add("getCreditBussSum");  //贷款业务授信额(元)
			listMethodName.add("getCreditMiddBussSum");  //中间和表外业务授信额(元)
			for(int i=0;i<listMethodName.size();i++){
				//查询数据
				dataInfo = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapper."+listMethodName.get(i), REPORT_ID);
				map.putAll(dataInfo.get(0));
			}
			creditSummInfo.add(map);
			//查询COM_CREDIT_DISPOSAL表数据
			List<Map<String,String>> creditDisposal = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapper.getCreditAssetDebt", REPORT_ID);
			//查询COM_CREDIT_COMPENSATION表数据
			List<Map<String,String>> creditCompensation = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapper.getCreditGuarComp", REPORT_ID);
			//查询COM_CREDIT_OWE_INTEREST表数据
			List<Map<String,String>> creditOweInterest = (List<Map<String, String>>) dao.findForList("CreditCompanyServerMapper.getCreditLackInfo", REPORT_ID);
			//转换json
			try{
				returnJson.element("COM_CREDIT_SUMMARY",JSONArray.fromObject(creditSummInfo).toString().replace("null", "\"\""));
				returnJson.element("COM_CREDIT_DISPOSAL",JSONArray.fromObject(creditDisposal).toString().replace("null", "\"\""));
				returnJson.element("COM_CREDIT_COMPENSATION",JSONArray.fromObject(creditCompensation).toString().replace("null", "\"\""));
				returnJson.element("COM_CREDIT_OWE_INTEREST",JSONArray.fromObject(creditOweInterest).toString().replace("null", "\"\""));
				return returnJson;
			}catch(Exception e){
				logger.error("数据转为json格式异常!");
				logger.error(e.getMessage(),e);
				return null;
			}
		} catch (Exception e1) {
			logger.error("数据查询异常!");
			logger.error(e1.getMessage(),e1);
			return null;
		}
	}
	/**查询明细表需要的数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData QueryEntDetail(String REPORT_ID){
		try {
			return (PageData) dao.findForObject("CreditCompanyServerMapper.getCreditReportDate", REPORT_ID);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}

}
