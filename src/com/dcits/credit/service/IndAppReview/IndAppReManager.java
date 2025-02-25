package com.dcits.credit.service.IndAppReview;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：IndAppReManager
 * 创建人：zhangyy
 * 说明：个人查询申请审核
 */
public interface IndAppReManager {
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
	/**更新审核状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateCheck(PageData pd);
	/**查询明细表需要的数据
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
	/**根据条件查询该客户是否已经被查询过
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByInfoOnFinding(PageData pd);
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

	/**
	 * 查询出需要加密的表名和字段名
	 */
	public List<PageData> queryTableColData();
	/**
	 * 根据流程id获取查询征信报告的系统用户的真实名称
	 * @return
	 */
	public String findNameByFlowId(String flowid);

	/**
	 *  查询重要信息提示需要的表名和列名
	 * @return
	 */
	public List<PageData> findReportTabAndCol_Impo();
	/**
	 * 查询某个用户是否属于村镇银行用户
	 */
	public boolean isTownCompany(String username);
	
	/**
	 * 查询系统查询方式
	 * @param type 个人QueryType、企业ComQueryType
	 * @return
	 */
	public boolean findQueryType(String type);
	/**
	 * 更新接口查询结果代码，结果描述，文件名
	 */
	public void updateResult(PageData pd);
	/**查找出所有需要转数据字典列的表名
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findTabNameByType(PageData pd)throws Exception;
	/**根据表名查找出所有需要转数据字典列的信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findDictByTabName(PageData pd)throws Exception;
	/**根据字典编号和中文名称查找CODE
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCodeByName(PageData pd)throws Exception;
	/**根据字典编号和中文名称查找CODE
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> selectInfo(PageData pd)throws Exception;
	/**
	 * @param pd
	 * @throws Exception
	 */
	public PageData selectPdInfo(PageData pd)throws Exception;
	public void updateInfo(PageData pd)throws Exception;
	
	public void deleteInfo(PageData pd)throws Exception;
	/**查找出所有需要转数据字典列2的表名,列名和数据字典编号
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findAllTabName2(PageData pd)throws Exception;
	/**查找出所有需要转数据字典并且还加密的表名,列名和数据字典编号
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findEncryptTabName(PageData pd)throws Exception;
	/**查找出所有需要转数据字典 列2 并且还加密的表名,列名和数据字典编号 
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findEncryptTabName2(PageData pd)throws Exception;
	/**将相关信息插入到XmlToHtml表中
	 * @param pd
	 * @throws Exception
	 */
	public void XmlToHtmlSave(PageData pd);
	/**将相关信息插入到接口用户人行账户密码信息表中
	 * @param pd
	 * @throws Exception
	 */
	public void savePerbankInfo(PageData pd) throws Exception;
	/**查找接口用户人行账户密码信息 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findPerbankInfo(PageData pd)throws Exception;
	/**修改接口用户人行账户密码信息返回报文信息
	 * @param pd
	 * @throws Exception
	 */
	public void updatePerbankInfo(PageData pd)throws Exception;
	/**向ReStart_executor_Info（重启系统所需线程池任务信息）表中插入数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	/**修改接口用户人行账户密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatePerbankPwd(PageData pd)throws Exception;
	public void saveExcutorInfo(PageData pd);
	
	/**
	 * 获取征信账号
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCREDITNUM(PageData pd) throws Exception;

	/**
	 * 修改账户状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateCREDITSTATUS(PageData pd)throws Exception;

	/**
	 * 修改白名单
	 * @param pd
	 * @throws Exception
	 */
	public void updateISWHITE(PageData pd)throws Exception;
	
}
