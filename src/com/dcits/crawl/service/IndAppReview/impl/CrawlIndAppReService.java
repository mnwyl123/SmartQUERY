package com.dcits.crawl.service.IndAppReview.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：IndAppReService
 * 创建人：zhangyy
 * 说明：个人查询申请审核
 */
@Service("crawlIndAppReService")
public class CrawlIndAppReService implements CrawlIndAppReManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(CrawlIndAppReService.class);
	
	/**个人查询申请审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listIndAppRe(Page page){
		try {
			return (List<PageData>) dao.findForList("ClawerIndAppReMapper.IndAppRelistPage", page);
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
			return (PageData) dao.findForObject("ClawerIndAppReMapper.getAppCheck", pd);
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
			return (String) dao.findForObject("ClawerIndAppReMapper.getUserDepart", pd);
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
			return (String) dao.findForObject("ClawerIndAppReMapper.getUserOrg", pd);
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
			dao.update("ClawerIndAppReMapper.UpdateCheck", pd);
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
			dao.update("ClawerIndAppReMapper.updateStatus", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**记录重跑次数
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void updateRerunsTime(PageData pd){
		try {
			dao.update("ClawerIndAppReMapper.updateRerunsTime", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**密码错误更新人行账户状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void updateCreditStatus(PageData pd){
		try {
			dao.update("ClawerIndAppReMapper.updateCreditStatus", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
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
			return (PageData) dao.findForObject("ClawerIndAppReMapper.QueryDetail", ID);
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
			dao.save("ClawerIndAppReMapper.saveDetail", pd);
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
			dao.update("ClawerIndAppReMapper.UpdateDetailCheck", pd);
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
			return (List<String>)dao.findForList("ClawerIndAppReMapper.getUserOrgID", pd);
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
			return (PageData) dao.findForObject("ClawerIndAppReMapper.getLoginInfo", pd);
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
			return (PageData) dao.findForObject("ClawerIndAppReMapper.getQueryUserInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**通过大单元标识查询数据库落库表名列名（爬虫专用）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findTabColClawerByTag(String tag){
		try {
			return  (List<PageData>) dao.findForList("ClawerIndAppReMapper.findTabColClawerByTag", tag);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**通过小单元名称查询数据库落库表名列名（爬虫专用）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findTabColClawerByTableName(String tableName){
		try {
			return  (List<PageData>) dao.findForList("ClawerIndAppReMapper.findTabColClawerByTableName", tableName);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}
	/**通过小单元名称查询数据库落库表名列名（爬虫专用）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findTabColClawerByTableName(PageData pd){
		try {
			return  (List<PageData>) dao.findForList("ClawerIndAppReMapper.findTabColClawerByTableName1", pd);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询爬虫网页的页面参数信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findWebCrawlerInfoByAction(String action)throws Exception{
		return (List<PageData>) dao.findForList("ClawerIndAppReMapper.findWebCrawlerInfoByAction", action);
	}
	
	
	/**根据传入的字典名称和系统字典code查找人行字典code
	 * @param pd
	 * @throws Exception
	 */
	public PageData findWebCrawlerDictByCode(PageData dict_code)throws Exception{
		return (PageData) dao.findForObject("ClawerIndAppReMapper.findWebCrawlerDictByCode", dict_code);
	}
	
	/**查找出所有需要转数据字典列的表名
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findTabNameByType(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ClawerIndAppReMapper.findTabNameByType", pd);
	}
	/**根据表名查找出所有需要转数据字典列的信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findDictByTabName(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ClawerIndAppReMapper.findDictByTabName", pd);
	}
	/**根据字典编号和中文名称查找CODE
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCodeByName(PageData pd)throws Exception{
		return (PageData) dao.findForObject("ClawerIndAppReMapper.findCodeByName", pd);
	}
	/**
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> selectInfo(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ClawerIndAppReMapper.selectInfo", pd);
	}
	public void updateInfo(PageData pd)throws Exception{
		 dao.update("ClawerIndAppReMapper.updateInfo", pd);
	}

	/**查找出所有需要转数据字典列2的表名,列名和数据字典编号
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findAllTabName2(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ClawerIndAppReMapper.findAllTabName2", pd);
	}
	/**查找出所有需要转数据字典并且还加密的表名,列名和数据字典编号
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findEncryptTabName(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ClawerIndAppReMapper.findEncryptTabName", pd);
	}
	/**查找出所有需要转数据字典 列2 并且还加密的表名,列名和数据字典编号 
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findEncryptTabName2(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("ClawerIndAppReMapper.findEncryptTabName2", pd);
	}
	/**通过用户名查询爬虫网络所需参数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findWebCrawlerInfoByUser(PageData pd)throws Exception{
		return (PageData) dao.findForObject("ClawerIndAppReMapper.findWebCrawlerInfoByUser", pd);
	}

	/**通过人行账户名查询爬虫网络所需参数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findWebCrawlerInfoByCertName(PageData pd)throws Exception{
		return (PageData) dao.findForObject("ClawerIndAppReMapper.findWebCrawlerInfoByCertName", pd);
	}
	@Override
	public PageData findChannelInfoById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("ClawerIndAppReMapper.findChannelInfoById", pd);
	}
	@Override
	public void savePerJson(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("jsonContentMapper.savePerJson", pd);
	}
	@Override
	public PageData findPerJson(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("jsonContentMapper.findPerJson", pd);
	}
	@Override
	public void saveComJson(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("jsonContentMapper.saveComJson", pd);
	}
	@Override
	public PageData findComJson(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("jsonContentMapper.findComJson", pd);
	}
	@Override
	public PageData findCreditAcctInfoByCode(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("ClawerIndAppReMapper.findCreditAcctInfoByCode", pd);
	}
	@Override
	public PageData findPrePassByCode(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("ClawerIndAppReMapper.findPrePassByCode", pd);
	}
	@Override
	public void updateCreditPass(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ClawerIndAppReMapper.updateCreditAcct", pd);
		dao.update("ClawerIndAppReMapper.updateWebCrawler2", pd);
	}
	@Override
	public void insertCompanySelectQueue(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("ClawerIndAppReMapper.insertCompanySelectQueue", pd);
	}
	@Override
	public PageData findQueueStatus(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ClawerIndAppReMapper.findQueueStatus", pd);
		
	}
	@Override
	public void updateQueueGetLock(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ClawerIndAppReMapper.updateQueueGetLock", pd);
	}
	@Override
	public void updateQueueReleaseLock(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ClawerIndAppReMapper.updateQueueReleaseLock", pd);
	}
	@Override
	public List<PageData> findQueueUpperStatus(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ClawerIndAppReMapper.findQueueUpperStatus",pd);
	}
	@Override
	public void updateQueueUpperStatus(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("ClawerIndAppReMapper.updateQueueUpperStatus", pd);
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
	@Override
	public void saveBody(PageData pd) throws Exception {
		dao.save("ClawerIndAppReMapper.saveBody", pd);
	}
	@Override
	public String getBody(String st) throws Exception {
		PageData pd = (PageData) dao.findForObject("ClawerIndAppReMapper.getBody", st);
		if(pd!=null){
			String body = pd.getString("BODY");
			return body;
		}else{
			pd = (PageData) dao.findForObject("ClawerIndAppReMapper.getBodyNoCommand", st);
			if(pd!=null){
				String body = pd.getString("BODY");
				return body;
			}
		}
		return "";
	}
}
