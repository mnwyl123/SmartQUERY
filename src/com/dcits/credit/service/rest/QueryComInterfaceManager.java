package com.dcits.credit.service.rest;

import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;

import net.sf.json.JSONObject;

/**
 *信贷接口
 */
public interface QueryComInterfaceManager {
	/**查询征信账户用户
	 * @param pd
	 * @return
	 * @throws Exception   
	 */
	public PageData queryAccByUserName(PageData pd) throws Exception;
	/**查询插入流程表的信息
	 * @param pd
	 * @return
	 * @throws Exception   
	 */
	public PageData queryUserByUserName(PageData pd) throws Exception;
	/**
	 * 将请求数据落库 
	 */
	public void saveRequestInfo(PageData pd) throws Exception;
	/**
	 * 保存企业信息
	 */
	public void saveEntInfo(PageData pd) throws Exception;
	/**更新流程信息 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateFlowTable(PageData pd) throws Exception;
	/**
	 * 更新企业信息
	 */
	public void updateComInfo(PageData pd) throws Exception;

}
