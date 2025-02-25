package com.dcits.credit.service.rest;

import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;

import net.sf.json.JSONObject;

/**
 * 查看报告接口（信贷接口）
 *
 */
public interface PersonReportService {
	/**
	 * 通过用户名和客户的证件号码，查询个人信用报告的报告编号和状态
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getFlowInfo(PageData pd) throws Exception;
	
	/**
	 * 根据用户名和客户的证件号码，查询个人信用报告信息（信贷接口）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public JSONObject getReportForCredit(PageData pd) throws Exception;
	/**
	 * 根据用户名和客户的证件号码，查询个人信用报告信息（信贷接口）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public JSONObject getReportForCredit_old(PageData pd) throws Exception;
	/**
	 * 根据用户名和客户的证件号码，查询个人信用报告信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public JSONObject getReportInfo(PageData pd) throws Exception;
	/**
	 * 通过用户名和客户的证件号码，查询个人信用报告的报告编号和状态
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getReportIdType(PageData pd) throws Exception;
}
