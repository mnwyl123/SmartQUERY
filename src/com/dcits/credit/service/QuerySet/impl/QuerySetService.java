package com.dcits.credit.service.QuerySet.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.QuerySet.QuerySetManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：QuerySetService
 * 创建人：zhangyy
 * 说明：
 */
@Service("querySetService")
public class QuerySetService implements QuerySetManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(QuerySetService.class);
	
	/**查询次数设置列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listQuery(Page page){
		try {
			return (List<PageData>) dao.findForList("QuerySetMapper.QuerySetlistPage", page);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询用户查询次数设置
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void SaveInfo(PageData pd){
		try {
			dao.save("QuerySetMapper.SaveUserInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**查询用户是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData queryUserName(PageData pd){
		try {
			return (PageData) dao.findForObject("QuerySetMapper.queryUserName", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	
	/**查询用户是否已添加
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData queryUser(PageData pd){
		try {
			return (PageData) dao.findForObject("QuerySetMapper.queryUser", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	
	/**查询当前用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData queryUserInfo(PageData pd){
		try {
			return (PageData) dao.findForObject("QuerySetMapper.queryUserInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	
	/**更新用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void updateUser(PageData pd){
		try {
			dao.update("QuerySetMapper.UpdateUserInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**更新用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void deleteUser(PageData pd){
		try {
			dao.delete("QuerySetMapper.deleteUserInfo", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
}
