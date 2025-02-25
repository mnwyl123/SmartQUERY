package com.dcits.credit.service.CheckHistoryReview.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.CheckHistoryReview.CheckHistoryManager;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.ServerUtil.impl.ServerUtilService;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：CheckHistoryService
 * 创建人：zhangyy
 * 说明：审核历史
 */
@Service("historyService")
public class CheckHistoryService implements CheckHistoryManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(CheckHistoryService.class);
	
	/**企业查询申请审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listHistoryRe(Page page,String clientType){
		try {
			return (List<PageData>) dao.findForList("HistoryMapper."+clientType, page);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询个人历史详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData getAppHistoryCheck(PageData pd){
		try {
			PageData page = (PageData) dao.findForObject("HistoryMapper.getAppHistoryCheck", pd);
			 
			String CLIENT_NAME = page.getString("CLIENT_NAME");
			String CREDENTIALS_NO = page.getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			page.put("CLIENT_NAME", CLIENT_NAME);
			page.put("CREDENTIALS_NO", CREDENTIALS_NO);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询企业历史详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData getEntHistoryCheck(PageData pd){
		try {
			return (PageData) dao.findForObject("HistoryMapper.getEntHistoryCheck", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public PageData getEntHistoryCheckHis(PageData pd){
		try {
			return (PageData) dao.findForObject("HistoryMapper.hisgetEntHistoryCheck", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询审核人信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData getCheckUserInfo(String USER_ID){
		try {
			return (PageData) dao.findForObject("HistoryMapper.getCheckUserInfo", USER_ID);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
}
