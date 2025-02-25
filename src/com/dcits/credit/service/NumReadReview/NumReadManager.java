package com.dcits.credit.service.NumReadReview;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：IndAppReManager
 * 创建人：zhangyy
 * 说明：个人查询申请审核
 */
public interface NumReadManager {
	/**个人查询申请审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listIndAppRe(Page page);
	
	/**查询个人申请信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAppCheck(PageData pd);
	
	/**查询用户部门
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getUserDepart(PageData pd);
	
	/**查询用户机构
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getUserOrg(PageData pd);
	/**1.更新审核状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateCheck(PageData pd);
	/**2.查询明细表需要的数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData QueryDetail(String ID);
	/**向明细表插入数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void saveDetail(PageData pd);
	/**更新明细表中查询结果状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void UpdateDetailCheck(PageData pd);
	/**查询当前用户机构ID
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<String> getUserOrgID(PageData pd);
	
	/**查询人行登录用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getLoginInfo(PageData pd);
	
	/**查询查询员登录名
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getQueryUserInfo(PageData pd);
	/**查询请求信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getQueryInfo(PageData pd);

	public void updateStatus(PageData pd);

	public PageData QueryFlowStatus(String ID);
	/**根据条件查询该客户是否已经被查询过
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByInfo(PageData pd);
	/**更新人行/行内查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateInner(PageData pd);
	/**
	 * 保存SQL
	 * @param SQL
	 */
	public void publicSave(String sql);
	/**
	 * 查找存放报文数据需要的表及表的列
	 * @return
	 */
	public List<PageData> findReportTabAndCol();
	/**
	 * 查找表对应的列
	 * @param list 存放表名
	 * @return
	 */
	public List<PageData> queryColOfTab(List<String> list);
	/**
	 * 查询xml数据字典
	 * @return
	 */
	public List<String> queryXmlDic();
	/**
	 * 查询标签对应字段为SERIAL
	 * @return
	 */
	public List<String> querySerial();

	/*
	 * 查询出需要加密的表名和字段名
	 * */
	public List<PageData> queryTableColData();
	/**
	 * 查询征信账户信息
	 * @param pd
	 * @return
	 * @throws 
	 */
	public PageData QueryAccInfo(PageData pd) throws Exception;
	/**
	 * 更新返回信息
	 * @param pd
	 */
	public void UpdateResponseInfo(PageData pd) throws Exception;
	/**
	 * 将报文信息落库
	 * @param pdXml
	 */
	public void UpdateResponseData(PageData pd) throws Exception;
	/**
	 * 将请求的信息落库
	 * @param pd 
	 * @throws 
	 */
	public void SaveRequestInfo(PageData pd) throws Exception;
	/**
	 * 更新申请人所在的文件名
	 * @param pd
	 */
	public void UpdateFileName(PageData pd) throws Exception;
	/**
	 * 更新ID
	 * @param pd
	 * @throws Exception
	 */
	public void UpdateID(PageData pd) throws Exception;
}
