package com.dcits.credit.service.rest.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.rest.CompanyInterfaceService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 查看企业接口
 * @author 
 */
@Service("CompanyInterfaceService")
public class CompanyInterfaceImpl implements CompanyInterfaceService {
	private static Logger logger = Logger.getLogger(CompanyInterfaceImpl.class);
	@Resource(name="daoSupport")
	private  DaoSupport dao;
	/**
	 * 根据用户名和客户的证件号码，查询企业信用报告信息
	 */
	@Override
	public JSONObject getReportInfo(PageData pd) throws Exception {
    	JSONObject returnJson = null;
    	try{
    		//根据用户名和客户的证件号码，查到的个人信用报告的报告编号
    		List<PageData> rpids = getFlowInfo(pd);
    		String rpid = rpids.get(0).getString("REPORT_ID");
    		String query_time = rpids.get(0).getString("QUERY_TIME");
    		String date = BaseController.getServerInfo().getString("switch_time");
    		boolean is_new = DateUtil.compareDate2(query_time,date);
    		if(is_new){
    			returnJson = getJsonByReportid(rpid);
    			returnJson.put("version", "2");
    		}else{
    			returnJson = getJsonByReportid_Old(rpid);
    			returnJson.put("version", "1");
    		}
    	}catch(Exception e){
    		logger.error(e.getMessage(),e);
    	}
		return returnJson;
	}
	/**
	 * 根据用户名和客户的证件号码，查询企业信用报告信息
	 */
	@Override
	public JSONObject getReportInfoJSON(PageData pd) throws Exception {
    	JSONObject returnJson = null;
    	try{
    		returnJson = getJsonByReportid(pd.getString("REPORT_ID"));
    	}catch(Exception e){
    		logger.error(e.getMessage(),e);
    	}
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
	 * 查询企业中证码
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryLoanNo(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("CrawlerComInterfaceMapper.queryLoanNo", pd);
	}
	
	/**
	 * 保存企业中证码
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public void saveLoanNo(PageData pd) throws Exception{
		dao.save("CrawlerComInterfaceMapper.saveLoanNo", pd);
	}
	
	/**
	 * 根据报告编号返回JSONObject
	 * @param reportid
	 * @return
	 * @throws Exception
	 */
	public JSONObject getJsonByReportid_Old(String rpid) throws Exception{
		JSONObject returnJson = new JSONObject();
		//String returnJson = new String();
		//报告信息
		List<Map<String, String>> reportInfo = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.reportInfo", rpid);
		//基本信息
		List<Map<String, String>> basic = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.basic", rpid);
		//高管人员信息
		List<Map<String, String>> seniorManager = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.seniorManager", rpid);
		//有直接关联关系的其他企业
		List<Map<String, String>> otherCom = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.otherCom", rpid);
		//出资人信息
		List<Map<String, String>> investorInfo = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.investorInfo", rpid);
		//信息概要
		List<Map<String, String>> infoSummary = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.infoSummary", rpid);
		//未结清不良资产处置信息概要
		List<Map<String, String>> badAssetDispSumm = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.badAssetDispSumm", rpid);
		//未结清信贷业务分类信息概要
		List<Map<String, String>> unclearCreditTypeSumm = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.unclearCreditTypeSumm", rpid);
		//负债变化历史概要
		List<Map<String, String>> debtChangeHistSumm = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.debtChangeHistSumm", rpid);
		//对外担保概要
		List<Map<String, String>> formGuarSumm = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.formGuarSumm", rpid);
		//资产公司处置债务明细
		List<Map<String, String>> assetDispDebtDetail = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.assetDispDebtDetail", rpid);
		//担保及第三方代偿业务明细
		List<Map<String, String>> guarCompDetail = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.guarCompDetail", rpid);
		//欠息明细
		List<Map<String, String>> lackInterest = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.lackInterest", rpid);
		//垫款明细
		List<Map<String, String>> advaPayDetail = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.advaPayDetail", rpid);
		//表内业务明细
		List<Map<String, String>> innerBussDetail = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.innerBussDetail", rpid);
		//表外业务明细
		List<Map<String, String>> outerBussDetail = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.outerBussDetail", rpid);
		//银承附加信息
		List<Map<String, String>> bankAccAttacgedInfo = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.bankAccAttacgedInfo", rpid);
		//担保明细
		List<Map<String, String>> guarDetailInfo = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.guarDetailInfo", rpid);
		//欠税记录
		List<Map<String, String>> taxArrearsRecord = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.taxArrearsRecord", rpid);
		//判决记录
		List<Map<String, String>> judgeRecord = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.judgeRecord", rpid);
		//执行记录
		List<Map<String, String>> enforceRecord = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.enforceRecord", rpid);
		//社保缴费记录
		List<Map<String, String>> securPayRecord = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.securPayRecord", rpid);
		//公积金缴费记录
		List<Map<String, String>> providFundPayRecord = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.providFundPayRecord", rpid);
		//企业资质
		List<Map<String, String>> enterQual = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.enterQual", rpid);
		//海关快速通道
		List<Map<String, String>> custormFastTrack = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.custormFastTrack", rpid);
		//进出口分类监管
		List<Map<String, String>> imexSupervision = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.imexSupervision", rpid);
		//上市公司或有事项
		List<Map<String, String>> listedCorpor = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.listedCorpor", rpid);
		//专利情况
		List<Map<String, String>> patentCase = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.patentCase", rpid);
		//公共事业费用缴费记录
		List<Map<String, String>> pubCostPayRecord = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.pubCostPayRecord", rpid);
		//声明信息
		List<Map<String, String>> declInfo = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.declInfo", rpid);
		//财务报表
		List<Map<String, String>> financialReportForm = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.financialReportForm", rpid);
		//表内业务正常类历史记录
		List<Map<String, String>> innerBussNorHisRecord = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.innerBussNorHisRecord", rpid);
		//展期明细
		List<Map<String, String>> extendDetail = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.extendDetail", rpid);
		//对外担保
		List<Map<String, String>> exterGuar = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.exterGuar", rpid);
		//被担保
		List<Map<String, String>> wasGuar = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.wasGuar", rpid);
		//抵/质押物
		List<Map<String, String>> pledge = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.pledge", rpid);
		//公共信息明细
		List<Map<String, String>> publicInfoDetail = (List<Map<String, String>>)dao.findForList("CrawlerComInterfaceMapper.publicInfoDetail", rpid);
		
		//转换json
		String reportInfo_json = JSONArray.fromObject(reportInfo).toString().replace("null", "\"\"");
		String basic_json = JSONArray.fromObject(basic).toString().replace("null", "\"\"");
		String seniorManager_json = JSONArray.fromObject(seniorManager).toString().replace("null", "\"\"");
		String otherCom_json = JSONArray.fromObject(otherCom).toString().replace("null", "\"\"");
		String investorInfo_json = JSONArray.fromObject(investorInfo).toString().replace("null", "\"\"");
		String infoSummary_json = JSONArray.fromObject(infoSummary).toString().replace("null", "\"\"");
		String badAssetDispSumm_json = JSONArray.fromObject(badAssetDispSumm).toString().replace("null", "\"\"");
		String unclearCreditTypeSumm_json = JSONArray.fromObject(unclearCreditTypeSumm).toString().replace("null", "\"\"");
		String debtChangeHistSumm_json = JSONArray.fromObject(debtChangeHistSumm).toString().replace("null", "\"\"");
		String formGuarSumm_json = JSONArray.fromObject(formGuarSumm).toString().replace("null", "\"\"");
		String assetDispDebtDetail_json = JSONArray.fromObject(assetDispDebtDetail).toString().replace("null", "\"\"");
		String guarCompDetail_json = JSONArray.fromObject(guarCompDetail).toString().replace("null", "\"\"");
		String lackInterest_json = JSONArray.fromObject(lackInterest).toString().replace("null", "\"\"");
		String advaPayDetail_json = JSONArray.fromObject(advaPayDetail).toString().replace("null", "\"\"");
		String innerBussDetail_json = JSONArray.fromObject(innerBussDetail).toString().replace("null", "\"\"");
		String outerBussDetail_json = JSONArray.fromObject(outerBussDetail).toString().replace("null", "\"\"");
		String bankAccAttacgedInfo_json = JSONArray.fromObject(bankAccAttacgedInfo).toString().replace("null", "\"\"");
		String guarDetailInfo_json = JSONArray.fromObject(guarDetailInfo).toString().replace("null", "\"\"");
		String taxArrearsRecord_json = JSONArray.fromObject(taxArrearsRecord).toString().replace("null", "\"\"");
		String judgeRecord_json = JSONArray.fromObject(judgeRecord).toString().replace("null", "\"\"");
		String enforceRecord_json = JSONArray.fromObject(enforceRecord).toString().replace("null", "\"\"");
		String securPayRecord_json = JSONArray.fromObject(securPayRecord).toString().replace("null", "\"\"");
		String providFundPayRecord_json = JSONArray.fromObject(providFundPayRecord).toString().replace("null", "\"\"");
		String enterQual_json = JSONArray.fromObject(enterQual).toString().replace("null", "\"\"");
		String custormFastTrack_json = JSONArray.fromObject(custormFastTrack).toString().replace("null", "\"\"");
		String imexSupervision_json = JSONArray.fromObject(imexSupervision).toString().replace("null", "\"\"");
		String listedCorpor_json = JSONArray.fromObject(listedCorpor).toString().replace("null", "\"\"");
		String patentCase_json = JSONArray.fromObject(patentCase).toString().replace("null", "\"\"");
		String pubCostPayRecord_json = JSONArray.fromObject(pubCostPayRecord).toString().replace("null", "\"\"");
		String declInfo_json = JSONArray.fromObject(declInfo).toString().replace("null", "\"\"");
		String financialReportForm_json = JSONArray.fromObject(financialReportForm).toString().replace("null", "\"\"");
		String innerBussNorHisRecord_json = JSONArray.fromObject(innerBussNorHisRecord).toString().replace("null", "\"\"");
		String extendDetail_json = JSONArray.fromObject(extendDetail).toString().replace("null", "\"\"");
		String exterGuar_json = JSONArray.fromObject(exterGuar).toString().replace("null", "\"\"");
		String wasGuar_json = JSONArray.fromObject(wasGuar).toString().replace("null", "\"\"");
		String pledge_json = JSONArray.fromObject(pledge).toString().replace("null", "\"\"");
		String publicInfoDetail_json = JSONArray.fromObject(publicInfoDetail).toString().replace("null", "\"\"");
		//获取配置文件信息，将每一个表的信息拆分出来，可以在配置文件里面可以控制是否返回该表信息
		PageData pro = BaseController.getPropertiesByFileName("Find-ComReport.properties");		
		//转json
		if(pro.getString("COM_REPORT_INFO") != null && pro.getString("COM_REPORT_INFO").equals("1")){
			returnJson.element("COM_REPORT_INFO", reportInfo_json);
		}
		if(pro.getString("COM_CREDIT_BASIC_INFO") != null && pro.getString("COM_CREDIT_BASIC_INFO").equals("1")){
			returnJson.element("COM_CREDIT_BASIC_INFO", basic_json);
		}
		if(pro.getString("COM_SENIOR_MANAGER_INFO") != null && pro.getString("COM_SENIOR_MANAGER_INFO").equals("1")){
			returnJson.element("COM_SENIOR_MANAGER_INFO", seniorManager_json);
		}
		if(pro.getString("COM_DIRECT_CONN_OTHERS") != null && pro.getString("COM_DIRECT_CONN_OTHERS").equals("1")){
			returnJson.element("COM_DIRECT_CONN_OTHERS", otherCom_json);
		}
		if(pro.getString("COM_INVESTOR_INFO") != null && pro.getString("COM_INVESTOR_INFO").equals("1")){
			returnJson.element("COM_INVESTOR_INFO", investorInfo_json);
		}
		if(pro.getString("COM_INFO_SUMMARY") != null && pro.getString("COM_INFO_SUMMARY").equals("1")){
			returnJson.element("COM_INFO_SUMMARY", infoSummary_json);
		}
		if(pro.getString("COM_BAD_ASSETS_DISP_SUMM") != null && pro.getString("COM_BAD_ASSETS_DISP_SUMM").equals("1")){
			returnJson.element("COM_BAD_ASSETS_DISP_SUMM", badAssetDispSumm_json);
		}
		if(pro.getString("COM_UNCLEAR_CREDIT_TYPE_SUMM") != null && pro.getString("COM_UNCLEAR_CREDIT_TYPE_SUMM").equals("1")){
			returnJson.element("COM_UNCLEAR_CREDIT_TYPE_SUMM", unclearCreditTypeSumm_json);
		}
		if(pro.getString("COM_DEBT_CHANGE_HIST_SUMM") != null && pro.getString("COM_DEBT_CHANGE_HIST_SUMM").equals("1")){
			returnJson.element("COM_DEBT_CHANGE_HIST_SUMM", debtChangeHistSumm_json);
		}
		if(pro.getString("COM_FORE_GUAR_SUMM") != null && pro.getString("COM_FORE_GUAR_SUMM").equals("1")){
			returnJson.element("COM_FORE_GUAR_SUMM", formGuarSumm_json);
		}
		if(pro.getString("COM_ASSET_DISP_DEBT_DETAIL") != null && pro.getString("COM_ASSET_DISP_DEBT_DETAIL").equals("1")){
			returnJson.element("COM_ASSET_DISP_DEBT_DETAIL", assetDispDebtDetail_json);
		}
		if(pro.getString("COM_GUAR_COMP_DETAIL") != null && pro.getString("COM_GUAR_COMP_DETAIL").equals("1")){
			returnJson.element("COM_GUAR_COMP_DETAIL", guarCompDetail_json);
		}
		if(pro.getString("COM_LACK_INTEREST") != null && pro.getString("COM_LACK_INTEREST").equals("1")){
			returnJson.element("COM_LACK_INTEREST", lackInterest_json);
		}
		if(pro.getString("COM_ADVA_PAY_DETAIL") != null && pro.getString("COM_ADVA_PAY_DETAIL").equals("1")){
			returnJson.element("COM_ADVA_PAY_DETAIL", advaPayDetail_json);
		}
		if(pro.getString("COM_INNER_BUSS_DETAIL") != null && pro.getString("COM_INNER_BUSS_DETAIL").equals("1")){
			returnJson.element("COM_INNER_BUSS_DETAIL", innerBussDetail_json);
		}
		if(pro.getString("COM_OUTER_BUSS_DETAIL") != null && pro.getString("COM_OUTER_BUSS_DETAIL").equals("1")){
			returnJson.element("COM_OUTER_BUSS_DETAIL", outerBussDetail_json);
		}
		if(pro.getString("COM_BANK_ACC_ATTACGED_INFO") != null && pro.getString("COM_BANK_ACC_ATTACGED_INFO").equals("1")){
			returnJson.element("COM_BANK_ACC_ATTACGED_INFO", bankAccAttacgedInfo_json);
		}
		if(pro.getString("COM_GUAR_DETAIL_INFO") != null && pro.getString("COM_GUAR_DETAIL_INFO").equals("1")){
			returnJson.element("COM_GUAR_DETAIL_INFO", guarDetailInfo_json);
		}
		if(pro.getString("COM_TAX_ARREARS_RECORD") != null && pro.getString("COM_TAX_ARREARS_RECORD").equals("1")){
			returnJson.element("COM_TAX_ARREARS_RECORD", taxArrearsRecord_json);
		}
		if(pro.getString("COM_JUDGE_RECORD") != null && pro.getString("COM_JUDGE_RECORD").equals("1")){
			returnJson.element("COM_JUDGE_RECORD", judgeRecord_json);
		}
		if(pro.getString("COM_ENFORCE_RECORD") != null && pro.getString("COM_ENFORCE_RECORD").equals("1")){
			returnJson.element("COM_ENFORCE_RECORD", enforceRecord_json);
		}
		if(pro.getString("COM_SECUR_PAY_RECORD") != null && pro.getString("COM_SECUR_PAY_RECORD").equals("1")){
			returnJson.element("COM_SECUR_PAY_RECORD", securPayRecord_json);
		}
		if(pro.getString("COM_PROVID_FUND_PAY_RECORD") != null && pro.getString("COM_PROVID_FUND_PAY_RECORD").equals("1")){
			returnJson.element("COM_PROVID_FUND_PAY_RECORD", providFundPayRecord_json);
		}
		if(pro.getString("COM_ENTER_QUAL") != null && pro.getString("COM_ENTER_QUAL").equals("1")){
			returnJson.element("COM_ENTER_QUAL", enterQual_json);
		}
		if(pro.getString("COM_CUSTORM_FAST_TRACK") != null && pro.getString("COM_CUSTORM_FAST_TRACK").equals("1")){
			returnJson.element("COM_CUSTORM_FAST_TRACK", custormFastTrack_json);
		}
		if(pro.getString("COM_IMEX_SUPERVISION") != null && pro.getString("COM_IMEX_SUPERVISION").equals("1")){
			returnJson.element("COM_IMEX_SUPERVISION", imexSupervision_json);
		}
		if(pro.getString("COM_LISTED_CORPOR") != null && pro.getString("COM_LISTED_CORPOR").equals("1")){
			returnJson.element("COM_LISTED_CORPOR", listedCorpor_json);
		}
		if(pro.getString("COM_PATENT_CASE") != null && pro.getString("COM_PATENT_CASE").equals("1")){
			returnJson.element("COM_PATENT_CASE", patentCase_json);
		}
		if(pro.getString("COM_PUB_COST_PAY_RECORD") != null && pro.getString("COM_PUB_COST_PAY_RECORD").equals("1")){
			returnJson.element("COM_PUB_COST_PAY_RECORD", pubCostPayRecord_json);
		}
		if(pro.getString("COM_DECL_INFO") != null && pro.getString("COM_DECL_INFO").equals("1")){
			returnJson.element("COM_DECL_INFO", declInfo_json);
		}
		if(pro.getString("COM_FINANCIAL_REPORT_FORM") != null && pro.getString("COM_FINANCIAL_REPORT_FORM").equals("1")){
			returnJson.element("COM_FINANCIAL_REPORT_FORM", financialReportForm_json);
		}
		if(pro.getString("COM_INNER_BUSS_NOR_HIS_RECORD") != null && pro.getString("COM_INNER_BUSS_NOR_HIS_RECORD").equals("1")){
			returnJson.element("COM_INNER_BUSS_NOR_HIS_RECORD", innerBussNorHisRecord_json);
		}
		if(pro.getString("COM_EXTEND_DETAIL") != null && pro.getString("COM_EXTEND_DETAIL").equals("1")){
			returnJson.element("COM_EXTEND_DETAIL", extendDetail_json);
		}
		if(pro.getString("COM_EXTER_GUAR") != null && pro.getString("COM_EXTER_GUAR").equals("1")){
			returnJson.element("COM_EXTER_GUAR", exterGuar_json);
		}
		if(pro.getString("COM_WAS_GUAR") != null && pro.getString("COM_WAS_GUAR").equals("1")){
			returnJson.element("COM_WAS_GUAR", wasGuar_json);
		}
		if(pro.getString("COM_PLEDGE") != null && pro.getString("COM_PLEDGE").equals("1")){
			returnJson.element("COM_PLEDGE", pledge_json);
		}
		if(pro.getString("COM_PUBLIC_INFO_DETAIL") != null && pro.getString("COM_PUBLIC_INFO_DETAIL").equals("1")){
			returnJson.element("COM_PUBLIC_INFO_DETAIL", publicInfoDetail_json);
		}
		return returnJson;
	}
	/**
	 * 根据报告编号返回JSONObject
	 * @param reportid
	 * @return
	 * @throws Exception
	 */
	public  JSONObject getJsonByReportid(String rpid) throws Exception{
 		JSONObject returnJson = new JSONObject();
		//String returnJson = new String();
		//报告头信息单元
		List<Map<String, Object>> reportInfo = (List) dao.findForList("ComInterfaceMapper.reportInfo", rpid);
		for(Map<String, Object> info:reportInfo ){
			String ORG_CODE = info.get("ORG_CODE").toString();
			ORG_CODE = DESUtil.decrypt("enhjeA==", ORG_CODE).replace("\\\\", "\\");
			info.put("ORG_CODE", ORG_CODE);
			String QUERY_REASON = info.get("QUERY_REASON").toString();
			QUERY_REASON = DESUtil.decrypt("enhjeA==", QUERY_REASON).replace("\\\\", "\\");
			info.put("QUERY_REASON", QUERY_REASON);
			String REPORT_TIME = info.get("REPORT_TIME").toString();
			REPORT_TIME = DESUtil.decrypt("enhjeA==", REPORT_TIME).replace("\\\\", "\\");
			info.put("REPORT_TIME", REPORT_TIME);
			String ENT_NAME = info.get("ENT_NAME").toString();
			ENT_NAME = DESUtil.decrypt("enhjeA==", ENT_NAME).replace("\\\\", "\\");
			info.put("ENT_NAME", ENT_NAME);	
		}
		
		List<Map> reportList = (List) dao.findForList("ComInterfaceMapper.entInfo", rpid);
		for(Map info:reportList ){
			String TYPE_ENT_IDENT = info.get("TYPE_ENT_IDENT").toString();
			TYPE_ENT_IDENT = DESUtil.decrypt("enhjeA==", TYPE_ENT_IDENT).replace("\\\\", "\\");
			info.put("TYPE_ENT_IDENT", TYPE_ENT_IDENT);
			String NUM_ENT_INDENT = info.get("NUM_ENT_INDENT").toString();
			NUM_ENT_INDENT = DESUtil.decrypt("enhjeA==", NUM_ENT_INDENT).replace("\\\\", "\\");
			info.put("NUM_ENT_INDENT", NUM_ENT_INDENT);
		}
		SubToMain(reportInfo, reportList, "COM_IDENT_BASIC");//企业身份信息
		//基本信息单元
		List<Map<String,Object>> basic  = (List<Map<String,Object>>) dao.findForList("ComInterfaceMapper.basic", rpid);
		for(Map<String,Object> info:basic ){
			String ADDRESS_EDI = info.get("ADDRESS_EDI").toString();
			ADDRESS_EDI = DESUtil.decrypt("enhjeA==", ADDRESS_EDI).replace("\\\\", "\\");
			info.put("ADDRESS_EDI", ADDRESS_EDI);
			String ADDRE_BUSS = info.get("ADDRE_BUSS").toString();
			ADDRE_BUSS = DESUtil.decrypt("enhjeA==", ADDRE_BUSS).replace("\\\\", "\\");
			info.put("ADDRE_BUSS", ADDRE_BUSS);
			String LICENSE_DATE = info.get("LICENSE_DATE").toString();
			LICENSE_DATE = DESUtil.decrypt("enhjeA==", LICENSE_DATE).replace("\\\\", "\\");
			info.put("LICENSE_DATE", LICENSE_DATE);
		}
		//注册资本及主要出资人
		List<Map<String,Object>> investorMap = (List) dao.findForList("ComInterfaceMapper.investor", rpid);
		List<Map> investorList = (List) dao.findForList("ComInterfaceMapper.investorInfo", rpid);
		for(Map info:investorList ){
			String INVE_NAME = info.get("INVE_NAME").toString();
			INVE_NAME = DESUtil.decrypt("enhjeA==", INVE_NAME).replace("\\\\", "\\");
			info.put("INVE_NAME", INVE_NAME);
			String INVE_CRED_TYPE = info.get("INVE_CRED_TYPE").toString();
			INVE_CRED_TYPE = DESUtil.decrypt("enhjeA==", INVE_CRED_TYPE).replace("\\\\", "\\");
			info.put("INVE_CRED_TYPE", INVE_CRED_TYPE);
			String INVE_CRED_NUM = info.get("INVE_CRED_NUM").toString();
			INVE_CRED_NUM = DESUtil.decrypt("enhjeA==", INVE_CRED_NUM).replace("\\\\", "\\");
			info.put("INVE_CRED_NUM", INVE_CRED_NUM);
			String INVE_PERCENT = info.get("INVE_PERCENT").toString();
			INVE_PERCENT = DESUtil.decrypt("enhjeA==", INVE_PERCENT).replace("\\\\", "\\");
			info.put("INVE_PERCENT", INVE_PERCENT);	
		}
		SubToMain(investorMap, investorList, "COM_INVESTOR_INFO");//出资人信息
		//主要成员信息单元
		List<Map<String,Object>> seniorInfo = (List) dao.findForList("ComInterfaceMapper.senior", rpid);
		List<Map> seniorList = (List) dao.findForList("ComInterfaceMapper.seniorManager", rpid);
		for(Map info:seniorList ){
			String SENIOR_DUTIES = info.get("SENIOR_DUTIES").toString();
			SENIOR_DUTIES = DESUtil.decrypt("enhjeA==", SENIOR_DUTIES).replace("\\\\", "\\");
			info.put("SENIOR_DUTIES", SENIOR_DUTIES);
			String SENIOR_NAME = info.get("SENIOR_NAME").toString();
			SENIOR_NAME = DESUtil.decrypt("enhjeA==", SENIOR_NAME).replace("\\\\", "\\");
			info.put("SENIOR_NAME", SENIOR_NAME);
			String SNEIOR_CRED_TYPE = info.get("SNEIOR_CRED_TYPE").toString();
			SNEIOR_CRED_TYPE = DESUtil.decrypt("enhjeA==", SNEIOR_CRED_TYPE).replace("\\\\", "\\");
			info.put("SNEIOR_CRED_TYPE", SNEIOR_CRED_TYPE);
			String SNEIOR_CRED_NUM = info.get("SNEIOR_CRED_NUM").toString();
			SNEIOR_CRED_NUM = DESUtil.decrypt("enhjeA==", SNEIOR_CRED_NUM).replace("\\\\", "\\");
			info.put("SNEIOR_CRED_NUM", SNEIOR_CRED_NUM);	
		}
		SubToMain(seniorInfo, seniorList, "COM_SENIOR_MANAGER_INFO");//组成人员信息
		//上级机构单元
		List<Map<String,Object>> seniorOrg  = (List<Map<String,Object>>) dao.findForList("ComInterfaceMapper.seniorOrg", rpid);
		//实际控制人信息单元
		List<Map<String,Object>> controlPerInfo = (List) dao.findForList("ComInterfaceMapper.controlPer", rpid);
		List<Map> controlList = (List) dao.findForList("ComInterfaceMapper.controlPerInfo", rpid);
		for(Map info:controlList ){
			String NAME_IDENTITY = info.get("NAME_IDENTITY").toString();
			NAME_IDENTITY = DESUtil.decrypt("enhjeA==", NAME_IDENTITY).replace("\\\\", "\\");
			info.put("NAME_IDENTITY", NAME_IDENTITY);
			String TYPE_IDENTITY = info.get("TYPE_IDENTITY").toString();
			TYPE_IDENTITY = DESUtil.decrypt("enhjeA==", TYPE_IDENTITY).replace("\\\\", "\\");
			info.put("TYPE_IDENTITY", TYPE_IDENTITY);
			String TYPE_IDENTITY_NUM = info.get("TYPE_IDENTITY_NUM").toString();
			TYPE_IDENTITY_NUM = DESUtil.decrypt("enhjeA==", TYPE_IDENTITY_NUM).replace("\\\\", "\\");
			info.put("TYPE_IDENTITY_NUM", TYPE_IDENTITY_NUM);
		}
		SubToMain(controlPerInfo, controlList, "COM_ACTUAL_CONTROLLER");//实际控制人信息
		//信用提示信息单元
		List<Map<String,Object>> entCreditInfo  = (List<Map<String,Object>>) dao.findForList("ComInterfaceMapper.entCreditInfo", rpid);		
		//借贷交易汇总信息单元
		List<Map<String,Object>> borrowAccountInfo = (List) dao.findForList("ComInterfaceMapper.borrowAccountInfo", rpid);
		List<Map> unClearList = (List) dao.findForList("ComInterfaceMapper.unOtherClearInfo", rpid);
		SubToMainKeepSERIAL(borrowAccountInfo, unClearList, "COM_LEND_TRANS_OTHER");//未结清
		List<Map> clearList = (List) dao.findForList("ComInterfaceMapper.otherClearInfo", rpid);
		SubToMainKeepSERIAL(borrowAccountInfo, clearList, "COM_LEND_TRANS_SE_TYPE");//已结清
		List<Map> debetHistoryList = (List) dao.findForList("ComInterfaceMapper.debetHistoryInfo", rpid);
		SubToMain(borrowAccountInfo, debetHistoryList, "COM_DEBT_CHANGE_HIST_SUMM");//负债历史
		//担保交易信息汇总单元
		List<Map<String,Object>> guarCreditInfo = (List) dao.findForList("ComInterfaceMapper.guarCreditInfo", rpid);
		List<Map> unGuarList = (List) dao.findForList("ComInterfaceMapper.unGuarInfo", rpid);
		SubToMainKeepSERIAL(guarCreditInfo, unGuarList, "COM_GUAR_TRANS_INFO_OUTS");//未结清担保
		List<Map> guarList = (List) dao.findForList("ComInterfaceMapper.guarInfo", rpid);
		SubToMain(guarCreditInfo, guarList, "COM_GUAR_TRANS_INFO_SET");//已结清担保
		//授信协议汇总信息单元
		List<Map<String,Object>> grantCreditInfo  = (List<Map<String,Object>>) dao.findForList("ComInterfaceMapper.grantCreditInfo", rpid);		
		//相关还款责任汇总信息单元
		List<Map<String,Object>> repayReponseInfo =  (List) dao.findForList("ComInterfaceMapper.repayReponseInfo", rpid);
		List<Map> repayBorrowCreditList = (List) dao.findForList("ComInterfaceMapper.repayBorrowCredit", rpid);
		SubToMainKeepSERIAL(repayReponseInfo, repayBorrowCreditList, "COM_BORROM_REPAY");//借贷相关还款
		List<Map> guaBorrowList = (List) dao.findForList("ComInterfaceMapper.guaBorrowInfo", rpid);		
		SubToMain(repayReponseInfo, guaBorrowList, "COM_GUAR_TRANS_RESPON_INFO");//担保交易相关还款责任信息
		//借贷账户信息单元
		List<Map<String,Object>> borrowCreditList = (List) dao.findForList("ComInterfaceMapper.borrowCreditInfo", rpid);
		List<Map> repayCreditList  = (List) dao.findForList("ComInterfaceMapper.repayCreditInfo", rpid);
		SubToMainKeepSERIAL(borrowCreditList, repayCreditList, "COM_REPAY_INFO");//相关还表现信息
		List<Map> transCreditList = (List) dao.findForList("ComInterfaceMapper.transCreditInfo", rpid);
		SubToMain(borrowCreditList, transCreditList, "COM_SPETRANS_INFO");//特定交易
		//贴现账户分机构汇总信息单元
		List<Map<String,Object>> txCreditInfoList = (List) dao.findForList("ComInterfaceMapper.txCreditInfo", rpid);
		//欠息信息单元
		List<Map<String,Object>> lackInterestList = (List) dao.findForList("ComInterfaceMapper.lackInterest", rpid);
		//担保账户信息
		List<Map<String,Object>> creditGuartInfo = (List) dao.findForList("ComInterfaceMapper.creditGuartInfo", rpid);
		//担保账户分机构汇总信息单元
		List<Map<String,Object>> guartOrgAllInfo = (List) dao.findForList("ComInterfaceMapper.guartOrgAllInfo", rpid);
		//授信协议信息单元
		List<Map<String,Object>> creditProtocolInfo = (List) dao.findForList("ComInterfaceMapper.creditProtocolInfo", rpid);
		//相关还款责任借贷账户（不含贴现）信息单元
		List<Map<String,Object>> creditBorrowInfo = (List) dao.findForList("ComInterfaceMapper.creditBorrowInfo", rpid);		
		//相关还款责任贴现账户分机构汇总信息单元
		List<Map<String,Object>> creditInBorrowInfo = (List) dao.findForList("ComInterfaceMapper.creditInBorrowInfo", rpid);		
		//相关还款责任贴现账户分机构汇总信息单元
		List<Map<String,Object>> guartReponseInfo = (List) dao.findForList("ComInterfaceMapper.guartReponseInfo", rpid);
		//公共事业缴费信息明细单元
		List<Map<String,Object>> pubCostPayInfo = (List) dao.findForList("ComInterfaceMapper.pubCostPayInfo", rpid);
		List<Map> costPayInfoList  = (List) dao.findForList("ComInterfaceMapper.costPayInfo", rpid);
		SubToMain(pubCostPayInfo, costPayInfoList, "COM_PUBLIC_INFO_DETAIL");//过去24各月缴费信息
		//欠税信息记录单元
		List<Map<String,Object>> taxArrearsRecord = (List) dao.findForList("ComInterfaceMapper.taxArrearsRecord", rpid);
		//民事判决记录单元
		List<Map<String,Object>> judgeRecordInfo = (List) dao.findForList("ComInterfaceMapper.judgeRecordInfo", rpid);
		//强制执行记录信息单元
		List<Map<String,Object>> verdictRecordInfo = (List) dao.findForList("ComInterfaceMapper.verdictRecordInfo", rpid);
		//行政处罚记录信息单元
		List<Map<String,Object>> penaltiesRecordInfo = (List) dao.findForList("ComInterfaceMapper.penaltiesRecordInfo", rpid);
		//住房公积金缴费记录信息单元
		List<Map<String,Object>> providFunInfo = (List) dao.findForList("ComInterfaceMapper.providFunInfo", rpid);
		List<Map> providFunDetail  = (List) dao.findForList("ComInterfaceMapper.providFunDetail", rpid);
		SubToMainOne(providFunInfo, providFunDetail, "COM_PROVID_PAY_RECORD_YEAR");//过去24各月缴费信息
		//获得许可记录信息单元
		List<Map<String,Object>> obtainLincense = (List) dao.findForList("ComInterfaceMapper.obtainLincense", rpid);
		//获得认证记录信息单元
		List<Map<String,Object>> obtainCertifi = (List) dao.findForList("ComInterfaceMapper.obtainCertifi", rpid);
		//获得资质记录信息单元
		List<Map<String,Object>> obtainQual = (List) dao.findForList("ComInterfaceMapper.obtainQual", rpid);
		//获得奖励记录信息单元
		List<Map<String,Object>> obtainReward = (List) dao.findForList("ComInterfaceMapper.obtainReward", rpid);
		//拥有专利情况信息单元
		List<Map<String,Object>> patentCaseInfo = (List) dao.findForList("ComInterfaceMapper.patentCaseInfo", rpid);
		//出入境检验检疫绿色通道信息单元
		List<Map<String,Object>> inspQuaraInfo = (List) dao.findForList("ComInterfaceMapper.inspQuaraInfo", rpid);
		//进出口商品免验信息单元
		List<Map<String,Object>> inspMJGoodsInfo = (List) dao.findForList("ComInterfaceMapper.inspMJGoodsInfo", rpid);
		//进出口商品检验分类监管信息单元
		List<Map<String,Object>> ImexSupervision = (List) dao.findForList("ComInterfaceMapper.ImexSupervision", rpid);
		//融资规模控制信息单元
		List<Map<String,Object>> finanScalInfo = (List) dao.findForList("ComInterfaceMapper.finanScalInfo", rpid);
		//企业资产负债表（2002 版）信息单元
		List<Map<String,Object>> debetHistInfo = (List) dao.findForList("ComInterfaceMapper.debetHistInfo", rpid);
		//企业资产负债表（2007 版）信息单元
		List<Map<String,Object>> debetHistSevenInfo = (List) dao.findForList("ComInterfaceMapper.debetHistSevenInfo", rpid);
		//企业利润及利润分配表（2002 版）信息单元
		List<Map<String,Object>> profitInfoTwo = (List) dao.findForList("ComInterfaceMapper.profitInfoTwo", rpid);
		//企业利润及利润分配表（2007 版）信息单元
		List<Map<String,Object>> profitInfoSeven = (List) dao.findForList("ComInterfaceMapper.profitInfoSeven", rpid);
		//企业现金流量表（2002 版）信息单元
		List<Map<String,Object>> cashFlowTwoInfo = (List) dao.findForList("ComInterfaceMapper.cashFlowTwoInfo", rpid);
		//企业现金流量表（2007 版）信息单元
		List<Map<String,Object>> cashFlowSevenInfo = (List) dao.findForList("ComInterfaceMapper.cashFlowSevenInfo", rpid);
		//事业单位资产负债表（1997 版）信息单元
		List<Map<String,Object>> carAssLiaInfo = (List) dao.findForList("ComInterfaceMapper.carAssLiaInfo", rpid);
		//事业单位资产负债表（2013 版）信息单元
		List<Map<String,Object>> carAssOtInfo = (List) dao.findForList("ComInterfaceMapper.carAssOtInfo", rpid);
		//事业单位收入支出表（1997 版）信息单元
		List<Map<String,Object>> carAssOutNsInfo = (List) dao.findForList("ComInterfaceMapper.carAssOutNsInfo", rpid);
		//事业单位收入支出表（2013 版）信息单元
		List<Map<String,Object>> carAssOutOtInfo = (List) dao.findForList("ComInterfaceMapper.carAssOutOtInfo", rpid);
		//评级信息单元
		List<Map<String,Object>> comRatInfo = (List) dao.findForList("ComInterfaceMapper.comRatInfo", rpid);
		//声明及异议标注信息单元
		List<Map<String,Object>> comRatInfoObj = (List) dao.findForList("ComInterfaceMapper.comRatInfoObj", rpid);
		//转json
		String reportInfo_json = JSONArray.fromObject(reportInfo).toString().replace("null","\"\"");
		String basicInfo_json = JSONArray.fromObject(basic).toString().replace("null","\"\"");
		String investorInfo_json = JSONArray.fromObject(investorMap).toString().replace("null","\"\"");
		String principlemembers_json = JSONArray.fromObject(seniorInfo).toString().replace("null","\"\"");
		String seniorOrg_json = JSONArray.fromObject(seniorOrg).toString().replace("null","\"\"");
		String controlPerInfo_json = JSONArray.fromObject(controlPerInfo).toString().replace("null","\"\"");
		String entCreditInfo_json = JSONArray.fromObject(entCreditInfo).toString().replace("null","\"\"");
		String borrowAccountInfo_json = JSONArray.fromObject(borrowAccountInfo).toString().replace("null","\"\"");
		String guarCreditInfo_json = JSONArray.fromObject(guarCreditInfo).toString().replace("null","\"\"");
		String grantCreditInfo_json = JSONArray.fromObject(grantCreditInfo).toString().replace("null","\"\"");
		String repayReponseInfo_json = JSONArray.fromObject(repayReponseInfo).toString().replace("null","\"\"");
		String borrowCreditInfo_json = JSONArray.fromObject(borrowCreditList).toString().replace("null","\"\"");
		String txCreditInfoInfo_json = JSONArray.fromObject(txCreditInfoList).toString().replace("null","\"\"");
		String lackInterestInfo_json = JSONArray.fromObject(lackInterestList).toString().replace("null","\"\"");
		String creditGuartInfo_json = JSONArray.fromObject(creditGuartInfo).toString().replace("null","\"\"");
		String guartOrgAllInfo_json = JSONArray.fromObject(guartOrgAllInfo).toString().replace("null","\"\"");
		String creditProtocolInfo_json = JSONArray.fromObject(creditProtocolInfo).toString().replace("null","\"\"");
		String creditBorrowInfo_json = JSONArray.fromObject(creditBorrowInfo).toString().replace("null","\"\"");
		String creditInBorrowInfo_json = JSONArray.fromObject(creditInBorrowInfo).toString().replace("null","\"\"");
		String guartReponseInfo_json = JSONArray.fromObject(guartReponseInfo).toString().replace("null","\"\"");
		String pubCostPayInfo_json = JSONArray.fromObject(pubCostPayInfo).toString().replace("null","\"\"");
		String taxArrearsRecord_json = JSONArray.fromObject(taxArrearsRecord).toString().replace("null","\"\"");
		String judgeRecordInfo_json = JSONArray.fromObject(judgeRecordInfo).toString().replace("null","\"\"");
		String verdictRecordInfo_json = JSONArray.fromObject(verdictRecordInfo).toString().replace("null","\"\"");
		String penaltiesRecordInfo_json = JSONArray.fromObject(penaltiesRecordInfo).toString().replace("null","\"\"");
		String providFunInfo_json = JSONArray.fromObject(providFunInfo).toString().replace("null","\"\"");
		String obtainLincense_json = JSONArray.fromObject(obtainLincense).toString().replace("null","\"\"");
		String obtainCertifi_json = JSONArray.fromObject(obtainCertifi).toString().replace("null","\"\"");
		String obtainQual_json = JSONArray.fromObject(obtainQual).toString().replace("null","\"\"");
		String obtainReward_json = JSONArray.fromObject(obtainReward).toString().replace("null","\"\"");
		String patentCaseInfo_json = JSONArray.fromObject(patentCaseInfo).toString().replace("null","\"\"");
		String inspQuaraInfo_json = JSONArray.fromObject(inspQuaraInfo).toString().replace("null","\"\"");
		String inspMJGoodsInfo_json = JSONArray.fromObject(inspMJGoodsInfo).toString().replace("null","\"\"");
		String ImexSupervision_json = JSONArray.fromObject(ImexSupervision).toString().replace("null","\"\"");
		String finanScalInfo_json = JSONArray.fromObject(finanScalInfo).toString().replace("null","\"\"");
		String debetHistInfo_json = JSONArray.fromObject(debetHistInfo).toString().replace("null","\"\"");
		String debetHistSevenInfo_json = JSONArray.fromObject(debetHistSevenInfo).toString().replace("null","\"\"");
		String profitInfoTwo_json = JSONArray.fromObject(profitInfoTwo).toString().replace("null","\"\"");
		String profitInfoSeven_json = JSONArray.fromObject(profitInfoSeven).toString().replace("null","\"\"");
		String cashFlowTwoInfo_json = JSONArray.fromObject(cashFlowTwoInfo).toString().replace("null","\"\"");
		String cashFlowSevenInfo_json = JSONArray.fromObject(cashFlowSevenInfo).toString().replace("null","\"\"");
		String carAssLiaInfo_json = JSONArray.fromObject(carAssLiaInfo).toString().replace("null","\"\"");
		String carAssOtInfo_json = JSONArray.fromObject(carAssOtInfo).toString().replace("null","\"\"");
		String carAssOutNsInfo_json = JSONArray.fromObject(carAssOutNsInfo).toString().replace("null","\"\"");
		String carAssOutOtInfo_json = JSONArray.fromObject(carAssOutOtInfo).toString().replace("null","\"\"");
		String comRatInfo_json = JSONArray.fromObject(comRatInfo).toString().replace("null","\"\"");
		String comRatInfoObj_json = JSONArray.fromObject(comRatInfoObj).toString().replace("null","\"\"");
		//获取配置文件信息，将每一个表的信息拆分出来，可以在配置文件里面可以控制是否返回该表信息
		PageData pro = BaseController.getPropertiesByFileName("Find-ComReportInterface.properties");	
		if(pro.getString("COM_REPORT_INFO") != null && pro.getString("COM_REPORT_INFO").equals("1")){
			returnJson.element("COM_REPORT_INFO", reportInfo_json);
		}
		if(pro.getString("COM_CREDIT_BASIC_INFO") != null && pro.getString("COM_CREDIT_BASIC_INFO").equals("1")){
			returnJson.element("COM_CREDIT_BASIC_INFO", basicInfo_json);
		}
		if(pro.getString("COM_INVESTOR") != null && pro.getString("COM_INVESTOR").equals("1")){
			returnJson.element("COM_INVESTOR", investorInfo_json);
		}
		if(pro.getString("COM_MAIN_MEMBER") != null && pro.getString("COM_MAIN_MEMBER").equals("1")){
			returnJson.element("COM_MAIN_MEMBER", principlemembers_json);
		}
		if(pro.getString("COM_SUP_ORG") != null && pro.getString("COM_SUP_ORG").equals("1")){
			returnJson.element("COM_SUP_ORG", seniorOrg_json);
		}
		if(pro.getString("COM_CONTRO_PERSON") != null && pro.getString("COM_CONTRO_PERSON").equals("1")){
			returnJson.element("COM_CONTRO_PERSON", controlPerInfo_json);
		}
		if(pro.getString("COM_INFO_CREDIT") != null && pro.getString("COM_INFO_CREDIT").equals("1")){
			returnJson.element("COM_INFO_CREDIT", entCreditInfo_json);
		}
		if(pro.getString("COM_LEND_TRANS") != null && pro.getString("COM_LEND_TRANS").equals("1")){
			returnJson.element("COM_LEND_TRANS", borrowAccountInfo_json);
		}
		if(pro.getString("COM_GUAR_TRANS_IN") != null && pro.getString("COM_GUAR_TRANS_IN").equals("1")){
			returnJson.element("COM_GUAR_TRANS_IN", guarCreditInfo_json);
		}
		if(pro.getString("COM_CREDIT_GRANT_SUM") != null && pro.getString("COM_CREDIT_GRANT_SUM").equals("1")){
			returnJson.element("COM_CREDIT_GRANT_SUM", grantCreditInfo_json);
		}
		if(pro.getString("COM_REPAY_REP_NUM") != null && pro.getString("COM_REPAY_REP_NUM").equals("1")){
			returnJson.element("COM_REPAY_REP_NUM", repayReponseInfo_json);
		}
		if(pro.getString("COM_LEND_ACCOUNT") != null && pro.getString("COM_LEND_ACCOUNT").equals("1")){
			returnJson.element("COM_LEND_ACCOUNT", borrowCreditInfo_json);
		}
		if(pro.getString("COM_TX_ACC_ORG") != null && pro.getString("COM_TX_ACC_ORG").equals("1")){
			returnJson.element("COM_TX_ACC_ORG", txCreditInfoInfo_json);
		}
		if(pro.getString("COM_LACK_INTEREST") != null && pro.getString("COM_LACK_INTEREST").equals("1")){
			returnJson.element("COM_LACK_INTEREST", lackInterestInfo_json);
		}
		if(pro.getString("COM_GUAR_ACCT_INFO") != null && pro.getString("COM_GUAR_ACCT_INFO").equals("1")){
			returnJson.element("COM_GUAR_ACCT_INFO", creditGuartInfo_json);
		}
		if(pro.getString("COM_GUARANTEE_DET") != null && pro.getString("COM_GUARANTEE_DET").equals("1")){
			returnJson.element("COM_GUARANTEE_DET", guartOrgAllInfo_json);
		}
		if(pro.getString("COM_CREDIT_INFO_DATA") != null && pro.getString("COM_CREDIT_INFO_DATA").equals("1")){
			returnJson.element("COM_CREDIT_INFO_DATA", creditProtocolInfo_json);
		}
		if(pro.getString("COM_BOR_UNDISCOUNT") != null && pro.getString("COM_BOR_UNDISCOUNT").equals("1")){
			returnJson.element("COM_BOR_UNDISCOUNT", creditBorrowInfo_json);
		}
		if(pro.getString("COM_BOR_DISCOUNT") != null && pro.getString("COM_BOR_DISCOUNT").equals("1")){
			returnJson.element("COM_BOR_DISCOUNT", creditInBorrowInfo_json);
		}
		if(pro.getString("COM_REPAY_GUAR") != null && pro.getString("COM_REPAY_GUAR").equals("1")){
			returnJson.element("COM_REPAY_GUAR", guartReponseInfo_json);
		}
		if(pro.getString("COM_PUB_COST_PAY_RECORD") != null && pro.getString("COM_PUB_COST_PAY_RECORD").equals("1")){
			returnJson.element("COM_PUB_COST_PAY_RECORD", pubCostPayInfo_json);
		}
		if(pro.getString("COM_TAX_ARREARS_RECORD") != null && pro.getString("COM_TAX_ARREARS_RECORD").equals("1")){
			returnJson.element("COM_TAX_ARREARS_RECORD", taxArrearsRecord_json);
		}
		if(pro.getString("COM_JUDGE_RECORD") != null && pro.getString("COM_JUDGE_RECORD").equals("1")){
			returnJson.element("COM_JUDGE_RECORD", judgeRecordInfo_json);
		}
		if(pro.getString("COM_VERDICT") != null && pro.getString("COM_VERDICT").equals("1")){
			returnJson.element("COM_VERDICT", verdictRecordInfo_json);
		}
		if(pro.getString("COM_PENALTIES") != null && pro.getString("COM_PENALTIES").equals("1")){
			returnJson.element("COM_PENALTIES", penaltiesRecordInfo_json);
		}
		if(pro.getString("COM_PROVID_FUND_PAY_RECORD") != null && pro.getString("COM_PROVID_FUND_PAY_RECORD").equals("1")){
			returnJson.element("COM_PROVID_FUND_PAY_RECORD", providFunInfo_json);
		}
		if(pro.getString("COM_OBTAIN_LICENSE") != null && pro.getString("COM_OBTAIN_LICENSE").equals("1")){
			returnJson.element("COM_OBTAIN_LICENSE", obtainLincense_json);
		}
		if(pro.getString("COM_OBTAIN_CERTIFI") != null && pro.getString("COM_OBTAIN_CERTIFI").equals("1")){
			returnJson.element("COM_OBTAIN_CERTIFI", obtainCertifi_json);
		}
		if(pro.getString("COM_OBTAIN_QUAL") != null && pro.getString("COM_OBTAIN_QUAL").equals("1")){
			returnJson.element("COM_OBTAIN_QUAL", obtainQual_json);
		}
		if(pro.getString("COM_OBTAIN_REWARD") != null && pro.getString("COM_OBTAIN_REWARD").equals("1")){
			returnJson.element("COM_OBTAIN_REWARD", obtainReward_json);
		}
		if(pro.getString("COM_PATENT_CASE") != null && pro.getString("COM_PATENT_CASE").equals("1")){
			returnJson.element("COM_PATENT_CASE", patentCaseInfo_json);
		}
		if(pro.getString("COM_INSP_QUARA") != null && pro.getString("COM_INSP_QUARA").equals("1")){
			returnJson.element("COM_INSP_QUARA", inspQuaraInfo_json);
		}
		if(pro.getString("COM_INSP_MJGOODS") != null && pro.getString("COM_INSP_MJGOODS").equals("1")){
			returnJson.element("COM_INSP_MJGOODS", inspMJGoodsInfo_json);
		}
		if(pro.getString("COM_IMEX_SUPERVISION") != null && pro.getString("COM_IMEX_SUPERVISION").equals("1")){
			returnJson.element("COM_IMEX_SUPERVISION", ImexSupervision_json);
		}
		if(pro.getString("COM_FINAN_SCAL") != null && pro.getString("COM_FINAN_SCAL").equals("1")){
			returnJson.element("COM_FINAN_SCAL", finanScalInfo_json);
		}
		if(pro.getString("COM_DEBT_HIST_INFO") != null && pro.getString("COM_DEBT_HIST_INFO").equals("1")){
			returnJson.element("COM_DEBT_HIST_INFO", debetHistInfo_json);
		}
		if(pro.getString("COM_FINANCIAL_SEVEN_INFO") != null && pro.getString("COM_FINANCIAL_SEVEN_INFO").equals("1")){
			returnJson.element("COM_FINANCIAL_SEVEN_INFO", debetHistSevenInfo_json);
		}
		if(pro.getString("COM_PROFIT_INFO_TWO_INFO") != null && pro.getString("COM_PROFIT_INFO_TWO_INFO").equals("1")){
			returnJson.element("COM_PROFIT_INFO_TWO_INFO", profitInfoTwo_json);
		}
		if(pro.getString("COM_PROFIT_INFO_SEVEN_INFO") != null && pro.getString("COM_PROFIT_INFO_SEVEN_INFO").equals("1")){
			returnJson.element("COM_PROFIT_INFO_SEVEN_INFO", profitInfoSeven_json);
		}
		if(pro.getString("COM_CASH_FLOW_TWO_INFO") != null && pro.getString("COM_CASH_FLOW_TWO_INFO").equals("1")){
			returnJson.element("COM_CASH_FLOW_TWO_INFO", cashFlowTwoInfo_json);
		}
		if(pro.getString("COM_CASH_FLOW_SEVEN_INFO") != null && pro.getString("COM_CASH_FLOW_SEVEN_INFO").equals("1")){
			returnJson.element("COM_CASH_FLOW_SEVEN_INFO", cashFlowSevenInfo_json);
		}
		if(pro.getString("COM_CAR_ASS_LIA_NS_INFO") != null && pro.getString("COM_CAR_ASS_LIA_NS_INFO").equals("1")){
			returnJson.element("COM_CAR_ASS_LIA_NS_INFO", carAssLiaInfo_json);
		}		
		if(pro.getString("COM_CAR_ASS_LIA_OT_INFO") != null && pro.getString("COM_CAR_ASS_LIA_OT_INFO").equals("1")){
			returnJson.element("COM_CAR_ASS_LIA_OT_INFO", carAssOtInfo_json);
		}
		if(pro.getString("COM_CAR_ASS_OUT_NS_INFO") != null && pro.getString("COM_CAR_ASS_OUT_NS_INFO").equals("1")){
			returnJson.element("COM_CAR_ASS_OUT_NS_INFO", carAssOutNsInfo_json);
		}
		if(pro.getString("COM_CAR_ASS_OUT_OT_INFO") != null && pro.getString("COM_CAR_ASS_OUT_OT_INFO").equals("1")){
			returnJson.element("COM_CAR_ASS_OUT_OT_INFO", carAssOutOtInfo_json);
		}
		if(pro.getString("COM_RAT_INFO") != null && pro.getString("COM_RAT_INFO").equals("1")){
			returnJson.element("COM_RAT_INFO", comRatInfo_json);
		}
		if(pro.getString("COM_RAT_INFO_OBJ") != null && pro.getString("COM_RAT_INFO_OBJ").equals("1")){
			returnJson.element("COM_RAT_INFO_OBJ", comRatInfoObj_json);
		}
		return returnJson;
	}
	public static void SubToMain(List<Map<String,Object>> mainTab, List<Map> subTab, String subNum) throws Exception{
		for(Map<String,Object> map : mainTab){
			String serial = (String) map.get("SERIAL");
			if(mainTab.size()==1){
				for(Map<String, Object> sub:subTab){
					sub.remove("SERIAL");
				}
				map.put(subNum, subTab);
				break;
			}else{
				if(serial == null || "".equals(serial)){
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
					map.remove("SERIAL");
					map.put(subNum, list);
				}
			}
		}	
	}
	
	public static void SubToMainKeepSERIAL(List<Map<String,Object>> mainTab, List<Map> subTab, String subNum) throws Exception{
		for(Map<String,Object> map : mainTab){
			String serial = (String) map.get("SERIAL");
			if(mainTab.size()==1){
				map.put(subNum, subTab);
				break;
			}else{
				if(serial == null || "".equals(serial)){
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
					map.put(subNum, list);
				}
			}
		}	
	}
	//一对多
	public static void SubToMainOne(List<Map<String,Object>> mainTab, List<Map> subTab, String subNum) throws Exception{
		for(Map<String,Object> map : mainTab){
			String serial = (String) map.get("SERIAL");
			if(mainTab.size()==1){
				if(serial == null || "".equals(serial)){
					for(Map<String,Object> sub:subTab){
						sub.remove("SERIAL");
					}
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
					map.remove("SERIAL");
					map.put(subNum, list);
				}
			}
		}
	}
}
