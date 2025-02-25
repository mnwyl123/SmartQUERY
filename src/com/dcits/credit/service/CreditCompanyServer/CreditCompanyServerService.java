package com.dcits.credit.service.CreditCompanyServer;

import com.dcits.platform.util.PageData;

import net.sf.json.JSONObject;

/**
 * 信贷企业
 */
public interface CreditCompanyServerService {
	/**
	 * 判断查询时间得到数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public JSONObject getReportDataByDate(String REPORT_ID);
	/**
	 * 去库中查询相关数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public JSONObject getReportData(String REPORT_ID);
	/**
	 * 去库中查询相关数据（新数据）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public JSONObject getReportDataNow(String REPORT_ID);
	/**查询本次交易的时间
	 * @param pd
	 * @return
	 * @throws Exception EntReportDetail
	 */
	public PageData QueryEntDetail(String REPORT_ID);
}
