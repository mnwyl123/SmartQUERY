package com.dcits.credit.service.QuerySet.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.QuerySet.ExceptionParamManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

@Service("exceptionParamSerivce")
public class ExceptionParamService implements ExceptionParamManager {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取参数列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> paramList(Page page) throws Exception{
		return (List<PageData>)dao.findForList("ExceptionParamMapper.paramlistPage", page);
	}
	/**
	 * 新增
	 * @param pd
	 */
	public void saveP(PageData pd) throws Exception{
		dao.save("ExceptionParamMapper.saveP", pd);
	}
	/**
	 * 修改
	 * @param pd
	 * @throws Exception 
	 */
	@Override
	public void updateP(PageData pd) throws Exception {		
		dao.update("ExceptionParamMapper.updateP", pd);
	}
	/**
	 * 删除
	 * @param pd
	 */
	public void deleteP(PageData pd) throws Exception{
		dao.delete("ExceptionParamMapper.deleteP", pd);
	}
	/**
	 * 获取机构列表
	 * @throws Exception
	 */
	public List<PageData> orgList(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("ExceptionParamMapper.orgList", pd);
	}
	/**
	 * 查询机构
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData queryOrg(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ExceptionParamMapper.selectOrg", pd);
	}
}
