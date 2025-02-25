package com.dcits.credit.service.IndAppReview.impl;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：IndAppReService
 * 创建人：zhangyy
 * 说明：个人查询申请审核
 */
@Service("indAppReService")
public  class IndAppReService implements IndAppReManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(IndAppReService.class);
	
	/**个人查询申请审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listIndAppRe(Page page){
		try {
			return (List<PageData>) dao.findForList("IndAppReMapper.IndAppRelistPage", page);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询个人申请信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData getAppCheck(PageData pd){
		try {
			return (PageData) dao.findForObject("IndAppReMapper.getAppCheck", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询用户部门
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String getUserDepart(PageData pd){
		try {
			return (String) dao.findForObject("IndAppReMapper.getUserDepart", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询用户机构
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String getUserOrg(PageData pd){
		try {
			return (String) dao.findForObject("IndAppReMapper.getUserOrg", pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
			return null;
		}
	}
	/**更新审核状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void updateCheck(PageData pd){
		try {
			dao.update("IndAppReMapper.UpdateCheck", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**更新状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void updateStatus(PageData pd){
		try {
			dao.update("IndAppReMapper.updateStatus", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**查询状态表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData QueryFlowStatus(String ID){
		try {
			return (PageData) dao.findForObject("IndAppReMapper.QueryFlowStatus", ID);
		} catch (Exception e) {
			logger.error(e.getMessage());
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
	public PageData QueryDetail(String ID){
		try {
			return (PageData) dao.findForObject("IndAppReMapper.QueryDetail", ID);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**向明细表中插入数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void saveDetail(PageData pd){
		try {
			dao.save("IndAppReMapper.saveDetail", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**更新明细表中查询结果状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void UpdateDetailCheck(PageData pd){
		try {
			dao.update("IndAppReMapper.UpdateDetailCheck", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**查询当前用户机构
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getUserOrgID(PageData pd){
		try {
			return (List<String>)dao.findForList("IndAppReMapper.getUserOrgID", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询人行登录用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData getLoginInfo(PageData pd){
		try {
			return (PageData) dao.findForObject("IndAppReMapper.getLoginInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	
	/**查询查询员登录名
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData getQueryUserInfo(PageData pd){
		try {
			return (PageData) dao.findForObject("IndAppReMapper.getQueryUserInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询请求信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData getQueryInfo(PageData pd){
		try {
			PageData page = (PageData) dao.findForObject("IndAppReMapper.getQueryInfo", pd);
			String CLIENT_NAME = page.getString("CLIENT_NAME");
			String ID_NUM = page.getString("ID_NUM");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			ID_NUM = DESUtil.decrypt("enhjeA==", ID_NUM);
			page.put("CLIENT_NAME", CLIENT_NAME);
			page.put("ID_NUM", ID_NUM);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**根据条件查询该客户是否已经被查询过
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData findByInfo(PageData pd){
		try {
			List<PageData> list = (List)dao.findForList("IndAppReMapper.findByInfo", pd);
			if(list.size()>0) return list.get(0);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	/**根据条件查询该客户是否已经被查询过findByInfoOnFinding
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData findByInfoOnFinding(PageData pd){
		try {
			List<PageData> list = (List)dao.findForList("IndAppReMapper.findByInfoOnFinding", pd);
			if(list.size()>0) return list.get(0);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	/**更新人行/行内查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void updateInner(PageData pd){
		try {
			dao.update("IndAppReMapper.updateInner", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public void publicSave(String sql) {
		try {
			dao.save("IndAppReMapper.publicSave", sql);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	public List<PageData> queryColOfTab(List<String> list) {
		try {
			return (List) dao.findForList("IndAppReMapper.queryColOfTab", list);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	@Override
	public List<PageData> findReportTabAndCol() {
		try {
			return (List) dao.findForList("IndAppReMapper.reportTabAndCol", "");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	@Override
	public List<PageData> findReportTabAndCol_Impo() {
		try {
			return (List) dao.findForList("IndAppReMapper.reportTabAndCol_Impo", "");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	
	@Override
	public List<String> queryXmlDic(){
		try {
			return (List) dao.findForList("IndAppReMapper.queryXmlDic", "");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	@Override
	public List<String> querySerial(){
		try {
			return (List) dao.findForList("IndAppReMapper.querySerial", "");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	
	
	//查询出需要加密的表名和字段名
	@Override
	public List<PageData> queryTableColData(){
		try {
			return (List) dao.findForList("IndAppReMapper.queryTableColData", "");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	/**
	 * 根据流程id获取查询征信报告的系统用户的真实名称
	 * @return
	 */
	public String findNameByFlowId(String flowid){
		try {
			return (String) dao.findForObject("IndAppReMapper.findNameByFlowId", flowid);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	/**
	 * 查询某个用户是否属于村镇银行用户
	 */
	public boolean isTownCompany(String username){
		try {
			PageData companyPd = (PageData) dao.findForObject("IndAppReMapper.getCompanyByUsername", username);
			PageData pd = (PageData)dao.findForObject("IndAppReMapper.townCompany", "TOWN_Company");
			if(pd != null){
				String[] value = pd.getString("VALUE").split(",");
				List<String> list = Arrays.asList(value);
				return list.contains(companyPd.getString("COMPANY"));
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return false;
	}
	
	public boolean findQueryType(String type){
		try {
			PageData pd = (PageData) dao.findForObject("IndAppReMapper.findQueryType", type);
			if(pd != null){
				String value = pd.getString("VALUE");
				if(value.equals("Y")){
					return true;
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return false;
	}
	/**
	 * 更新接口查询结果代码，结果描述，文件名
	 */
	public void updateResult(PageData pd){
		try {
			dao.update("IndAppReMapper.updateResult", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**查找出所有需要转数据字典列的表名
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findTabNameByType(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("IndAppReMapper.findTabNameByType", pd);
	}
	/**根据表名查找出所有需要转数据字典列的信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findDictByTabName(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("IndAppReMapper.findDictByTabName", pd);
	}
	/**根据字典编号和中文名称查找CODE
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCodeByName(PageData pd)throws Exception{
		return (PageData) dao.findForObject("IndAppReMapper.findCodeByName", pd);
	}
	/**
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> selectInfo(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("IndAppReMapper.selectInfo", pd);
	}
	/**
	 * @param pd
	 * @throws Exception
	 */
	public PageData selectPdInfo(PageData pd)throws Exception{
		return (PageData) dao.findForObject("IndAppReMapper.selectPdInfo", pd);
	}
	public void updateInfo(PageData pd)throws Exception{
		 dao.update("IndAppReMapper.updateInfo", pd);
	}
	public void deleteInfo(PageData pd)throws Exception{
		 dao.update("IndAppReMapper.deleteInfo", pd);
	}
	
	/**查找出所有需要转数据字典列2的表名,列名和数据字典编号
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findAllTabName2(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("IndAppReMapper.findAllTabName2", pd);
	}
	/**查找出所有需要转数据字典并且还加密的表名,列名和数据字典编号
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findEncryptTabName(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("IndAppReMapper.findEncryptTabName", pd);
	}
	/**查找出所有需要转数据字典 列2 并且还加密的表名,列名和数据字典编号 
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findEncryptTabName2(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("IndAppReMapper.findEncryptTabName2", pd);
	}
	/**将相关信息插入到XmlToHtml表中
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void XmlToHtmlSave(PageData pd) {
		try {
			dao.save("IndAppReMapper.XmlToHtmlSave", pd);//插入到当前表中
			dao.save("IndAppReMapper.XmlToHtmlSave_His", pd);//插入到历史表中
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**将相关信息插入到接口用户人行账户密码信息表中
	 * @param pd
	 * @throws Exception
	 */
	public void savePerbankInfo(PageData pd) {
		try {
			dao.save("IndAppReMapper.savePerbankInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**查找接口用户人行账户密码信息 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findPerbankInfo(PageData pd)throws Exception{
		return (PageData) dao.findForObject("IndAppReMapper.findPerbankInfo", pd);
	}
	/**修改接口用户人行账户密码信息返回报文信息
	 * @param pd
	 * @throws Exception
	 */
	public void updatePerbankInfo(PageData pd)throws Exception{
		 dao.update("IndAppReMapper.updatePerbankInfo", pd);
	}
	/**修改接口用户人行账户密码
	 * @param pd
	 * @throws Exception
	 */
	public void updatePerbankPwd(PageData pd)throws Exception{
		 dao.update("IndAppReMapper.updatePerbankPwd", pd);
	}
	/**向ReStart_executor_Info（重启系统所需线程池任务信息）表中插入数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void saveExcutorInfo(PageData pd){
		try {
			dao.save("IndAppReMapper.saveExcutorInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getCREDITNUM(PageData pd) throws Exception{
		try{
			return (List<PageData>) dao.findForList("IndAppReMapper.getCREDITNUM", pd);
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	@Override
	public void updateCREDITSTATUS(PageData pd) throws Exception {
		 dao.update("IndAppReMapper.updateCREDITSTATUS", pd);
	}
	@Override
	public void updateISWHITE(PageData pd) throws Exception {
		 dao.update("IndAppReMapper.updateISWHITE", pd);
	}
}
