package com.dcits.credit.service.SavePersonInquiry.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.SavePersonInquiry.SavePersonInquiry;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;

/** 
 * 个人征信查询申请
 * 创建人：gaosheng
 * 创建时间：2018-05-08
 */
@Service("savePersonInquiry")
public class SavePersonInquiryImpl implements SavePersonInquiry{
	private static Logger logger = Logger.getLogger(SavePersonInquiryImpl.class);
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * 将数据插入数据库gaosheng
	 */
	@Override
	public void insertInto(PageData pd)throws Exception {
		dao.save("PersonReMapper.save", pd);
	}
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception{
		dao.update("PersonReMapper.update", pd);
	}
	/**查询授权审核人员
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findCheckUserList(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonReMapper.findByIdDetail", pd);
	}
	/**通过id获取数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonReMapper.findById", pd);
	}
	/**通过id获取数据
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByIdHis(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonReMapper.findByIdHis", pd);
	}
	/**提交申请
	 * @param pd
	 * @throws Exception
	 */
	public void updateStatus(PageData pd)throws Exception{
		dao.update("PersonReMapper.updateStatus", pd);
	}
	@Override
	public List<PageData> QuerylistPage(Page page) {
		try {
			return (List<PageData>) dao.findForList("PersonReMapper.QuerylistPage", page);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	public PageData findByIdDetail(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		 return (PageData)dao.findForObject("PersonReMapper.findByIdDetail", pd);
	}
	/**
	 * 更新审核记录
	 */
	@Override
	public void updateRecord(PageData pd) {
		try{
			dao.update("PersonReMapper.updateRecord", pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}
	/**
	 * 查询员更新审核记录
	 */
	@Override
	public void updateCRecord(PageData pd) {
		try{
			dao.update("PersonReMapper.updateCRecord", pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}
	public PageData findCompanyById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("PersonReMapper.findCompanyById", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listHistoryRe(Page page,String clientType){
		try {
			return (List<PageData>) dao.findForList("PersonReMapper."+clientType, page);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	@Override
	public void updateUser(PageData pd) {
		// TODO Auto-generated method stub
		
	}
	/**
	 * 查询数据显示审核状态
	 */
	@Override
	public PageData FindStatus(PageData pd) throws Exception {
		return (PageData)dao.findForObject("PersonReMapper.findStatus", pd);
	}
	public PageData findByIdAndAdress(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		 return (PageData)dao.findForObject("PersonReMapper.findByIdAndAdress", pd);
	}


}

