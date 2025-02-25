package com.dcits.credit.service.NumReadReview.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.NumReadReview.NumReadManager;
import com.dcits.credit.service.ServerUtil.impl.ServerUtilService;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：NumReadReService
 * 创建人：gaoshenga
 * 说明：数字解读审核
 */
@Service("numReadReService")
public class NumReadReService implements NumReadManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(NumReadReService.class);
	
	/**个人查询申请审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listIndAppRe(Page page){
		try {
			return (List<PageData>) dao.findForList("NumReadReMapper.IndAppRelistPage", page);
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
			return (PageData) dao.findForObject("NumReadReMapper.getAppCheck", pd);
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
			return (String) dao.findForObject("NumReadReMapper.getUserDepart", pd);
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
			return (String) dao.findForObject("NumReadReMapper.getUserOrg", pd);
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
			dao.update("NumReadReMapper.UpdateCheck", pd);
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
			dao.update("NumReadReMapper.updateStatus", pd);
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
			return (PageData) dao.findForObject("NumReadReMapper.QueryFlowStatus", ID);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询拼接报文需要的数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData QueryDetail(String ID){
		try {
			return (PageData) dao.findForObject("NumReadReMapper.QueryDetail", ID);
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
			dao.save("NumReadReMapper.saveDetail", pd);
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
			dao.update("NumReadReMapper.UpdateDetailCheck", pd);
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
			return (List<String>)dao.findForList("NumReadReMapper.getUserOrgID", pd);
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
			return (PageData) dao.findForObject("NumReadReMapper.getLoginInfo", pd);
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
			return (PageData) dao.findForObject("NumReadReMapper.getQueryUserInfo", pd);
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
			return (PageData) dao.findForObject("NumReadReMapper.getQueryInfo", pd);
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
			return (PageData) dao.findForObject("NumReadReMapper.findByInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
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
			dao.update("NumReadReMapper.updateInner", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public void publicSave(String sql) {
		try {
			dao.save("NumReadReMapper.publicSave", sql);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public List<PageData> queryColOfTab(List<String> list) {
		try {
			return (List) dao.findForList("NumReadReMapper.queryColOfTab", list);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	@Override
	public List<PageData> findReportTabAndCol() {
		try {
			return (List) dao.findForList("NumReadReMapper.reportTabAndCol", "");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	@Override
	public List<String> queryXmlDic(){
		try {
			return (List) dao.findForList("NumReadReMapper.queryXmlDic", "");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	@Override
	public List<String> querySerial(){
		try {
			return (List) dao.findForList("NumReadReMapper.querySerial", "");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	
	
	//查询出需要加密的表名和字段名
	@Override
	public List<PageData> queryTableColData(){
		try {
			return (List) dao.findForList("NumReadReMapper.queryTableColData", "");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	//查询账户信息
	@Override
	public PageData QueryAccInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("NumReadReMapper.queryAccInfo", pd);
	}
	//更新返回信息
	@Override
	public void UpdateResponseInfo(PageData pd) throws Exception {
		dao.update("NumReadReMapper.updateResponseInfo", pd);
		
	}
	//报文返回数据落库
	@Override
	public void UpdateResponseData(PageData pd) throws Exception {
		dao.update("NumReadReMapper.updateResponseData", pd);
		
	}
	//请求信息落库
	@Override
	public void SaveRequestInfo(PageData pd) throws Exception {
		dao.save("NumReadReMapper.saveRequestInfo", pd);
	}
	@Override
	public void UpdateFileName(PageData pd) throws Exception {
		dao.update("NumReadReMapper.updataFileName", pd);
	}
	@Override
	public void UpdateID(PageData pd) throws Exception {
		dao.update("NumReadReMapper.updateID", pd);
		
	}
}
