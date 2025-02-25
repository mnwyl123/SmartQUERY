package com.dcits.credit.service.personObjection;

import java.util.List;

import com.dcits.credit.entity.ObjectItem;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 个人异议信息
 * 创建人：wangguoxing
 * 创建时间：2019-01-14
 */
public interface PersonObjectionManager{

	/**通过系统用户名获取人行用户名
	 * @param str
	 * @throws Exception
	 */
	public String findUsernamePerBank(String str)throws Exception;
	/**通过系统用户名获取人行账户信息
	 * @param str
	 * @throws Exception 
	 */
	public PageData findPerBankInfo()throws Exception;
	/**通过系统用户名获取人行账户信息
	 * @param str
	 * @throws Exception 
	 */
	public PageData findComBankInfo()throws Exception;
	/**通过人行用户名获取人行密码
	 * @param str
	 * @throws Exception
	 */
	public String findPasswordPerBank(String str)throws Exception;
	/**通过系统用户名获取流程表值
	 * @param str
	 * @throws Exception
	 */
	public PageData findFs(String str)throws Exception;
	/**存入异议信息表请求1
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoOne(PageData pd)throws Exception;
	/**存入异议信息表请求2,5
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoTwo(PageData pd)throws Exception;
	/**存入异议信息表请求3
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoThree(PageData pd)throws Exception;
	/**存入异议信息表请求4
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoFour(PageData pd)throws Exception;
	/**存入异议信息表请求6
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoSix(PageData pd)throws Exception;
	/**存入异议信息表请求7
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoSeven(PageData pd)throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjection(PageData pd)throws Exception;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubToCheckObjection(PageData pd)throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubLastToCheckObjection(PageData pd)throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjectionEnclosure(PageData pd)throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void toCheckObjectionResult(PageData pd)throws Exception;
	/**异议事项更正结果接受
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToObjectionCorrectAccept(PageData pd)throws Exception;
	/**添加个人标注
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToAddLabel(PageData pd)throws Exception;
	/**存入流程状态表
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception;

	
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception;
	
	/**待核查主表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listToCheckMainlistPage(Page page)throws Exception;
	
	/**待核查子表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listToCheckSublistPage(Page page)throws Exception;
	/**待核查二级子表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listToCheckSubLastlistPage(Page page)throws Exception;
	/**待核查附件列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listToCheckEnclosurelistPage(Page page)throws Exception;
	/**待核查结果列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listToCheckResultlistPage(Page page)throws Exception;
	/**更正结果列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listCorrectlistPage(Page page)throws Exception;
	/**更正结果接受列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listCorrectAcceptlistPage(Page page)throws Exception;
	/**添加个人标注列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listAddPersonLabellistPage(Page page)throws Exception;
	/**删除个人标注列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listDeletePersonLabellistPage(Page page)throws Exception;
	/**
	 * 根据法人查询此法人下的所有机构
	 * @param company
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findOrgByCompany(String company) throws Exception;
	/**
	 * 批量分配异议处理机构
	 * @param list
	 * @throws Exception
	 */
	public void batchUpdateOrg(List<ObjectItem> list) throws Exception;
	/**根据异议事项号和id查询异议事项附件信息
	 * @param page
	 * @throws Exception
	 */
	public PageData findAttrBy(PageData pd)throws Exception;
	/**保存异议事项核查结果上报信息
	 * @param page
	 * @throws Exception
	 */
	public void saveCheckResult(PageData pd)throws Exception;
	/**
	 * 查询异议事项所有上报信息根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCheckResultBy(PageData pd)throws Exception;
	/**
	 * 保存个人异议事项更正结果上报信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void saveCorrectResult(PageData pd)throws Exception;
	/**根据添加个人标注
	 * @param page
	 * @throws Exception
	 */
	public PageData findAddRemarkBy(PageData pd)throws Exception;
	/**修改个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void updatePersonLabel(PageData pd)throws Exception;
	/**删除个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void deletePersonLabel(PageData pd)throws Exception;
	/**修改标注信息
	 * @param pd
	 * @throws Exception
	 */
	public void update_UserId(PageData pd)throws Exception;
	/**删除附件
	 * @param pd
	 * @throws Exception
	 */
	public void delAtt(PageData pd)throws Exception;
	/**
	 * 查询核查/更正结果通用应答报文根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findObjectionResultBy(PageData pd)throws Exception;
	/**
	 * 更新核查/更正结果通用应答报文根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateObjectionResultBy(PageData pd)throws Exception;
	/**更新更正结果上报信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateResultToObjectionCorrectAccept(PageData pd)throws Exception;
	/**查询更正结果上报信息
	 * @param pd
	 * @throws Exception
	 */
	public PageData findResultToObjectionCorrectAcceptBy(PageData pd)throws Exception;
	/**修改标注信息(全部)
	 * @param pd
	 * @throws Exception
	 */
	public void update_addRemark(PageData pd)throws Exception;
	/**修改标注信息(全部) 
	 * @param pd
	 * @throws Exception
	 */
	public PageData find_AddRemarkBy(PageData pd)throws Exception;
	/**
	 *检查数据库中是否含有重复的异议事项
	 * @param pd
	 * @return
	 */
	public PageData selectObject(PageData pd)throws Exception;
}


