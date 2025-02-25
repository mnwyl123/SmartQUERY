package com.dcits.credit.service.MacheChange.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.FirstPageStatis.FirstPageStatisManager;
import com.dcits.credit.service.MacheChange.MacheChangeManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：首页
 * 创建人：zhangyy
 */
@Service("macheService")
public class MacheChangeService implements MacheChangeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(MacheChangeService.class);
	
	@Override
	public List<PageData> queryAllRecord(Page page) {
		try{
			return (List<PageData>) dao.findForList("MacheChangeMapper.macheChangelistPage", page);
		}catch(Exception e){
			logger.error(e.getMessage());
			return null;
		}
	}
	@Override
	public void updateRecord(PageData pd) {
		try{
			dao.update("MacheChangeMapper.updateRecord", pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}
	@Override
	public void updateUser(PageData pd) {
		try{
			dao.update("MacheChangeMapper.updateUserIp", pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}
	@Override
	public void InsertRecord(PageData pd) {
		try{
			dao.save("MacheChangeMapper.saveRecord", pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}
	@Override
	public PageData queryRecord(PageData pd) {
		try{
			return (PageData) dao.findForObject("MacheChangeMapper.queryByRecord", pd);
		}catch(Exception e){
			logger.error(e.getMessage());
			return null;
		}
	}
	@Override
	public PageData queryById(PageData pd) {
		try{
			return (PageData) dao.findForObject("MacheChangeMapper.queryById", pd);
		}catch(Exception e){
			logger.error(e.getMessage());
			return null;
		}
	}
	
	@Override
	public void delete(PageData pd) {
		try{
			dao.delete("MacheChangeMapper.delete", pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}
	
}
