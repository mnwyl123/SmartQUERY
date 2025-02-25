package com.dcits.credit.service.rest;

import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;

import net.sf.json.JSONObject;

/**
 *查看企业接口
 * @author 
 */
public interface CompanyInterfaceService {
	/**
	 * 根据用户名和客户的证件号码，查询企业信用报告信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public JSONObject getReportInfo(PageData pd) throws Exception;
	/**
	 * 根据用户名和客户的证件号码，查询企业信用报告信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public JSONObject getReportInfoJSON(PageData pd) throws Exception;
	/**
	 * 通过用户名和客户的证件号码，查询个人信用报告的报告编号和状态
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getFlowInfo(PageData pd) throws Exception;
	
	/**
	 * 查询企业中证码
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryLoanNo(PageData pd) throws Exception;
	
	
	/**
	 * 保存企业中证码
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public void saveLoanNo(PageData pd) throws Exception;
}
