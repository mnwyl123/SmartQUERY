package com.dcits.credit.service.QuerySet.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.QuerySet.ParamManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

@Service("paramManagerSerivce")
public class ParamService implements ParamManager {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取参数列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> paramList(Page page) throws Exception{
		return (List<PageData>)dao.findForList("ParamMapper.paramlistPage", page);
	}
	@Override
	public PageData queryByPARAM(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("ParamMapper.queryByPARAM", pd);
	}
	/**
	 * 新增
	 * @param pd
	 */
	public void saveP(PageData pd) throws Exception{
		dao.save("ParamMapper.saveP", pd);
	}
	/**
	 * 修改
	 * @param pd
	 * @throws Exception 
	 */
	@Override
	public void updateP(PageData pd) throws Exception {		
		dao.update("ParamMapper.updateP", pd);
	}
	/**
	 * 删除
	 * @param pd
	 */
	public void deleteP(PageData pd) throws Exception{
		dao.delete("ParamMapper.deleteP", pd);
	}
	
	
	
	/**
	 * 获取系统参数列表
	 * sunyra
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> sysParamList(Page page) throws Exception{
		return (List<PageData>)dao.findForList("ParamMapper.sysParamlistPage", page);
	}
	/**
	 * 新增
	 * @param pd
	 */
	public void saveSysP(PageData pd) throws Exception{
		dao.save("ParamMapper.addSysParam", pd);
	}
	/**
	 * 修改
	 * @param pd
	 * @throws Exception 
	 */
	@Override
	public void updateSysP(PageData pd) throws Exception {		
		dao.update("ParamMapper.editSysParam", pd);
	}
	/**
	 * 删除
	 * @param pd
	 */
	public void deleteSysP(PageData pd) throws Exception{
		dao.delete("ParamMapper.deleteSysParam", pd);
	}
	/**
	 * 根据系统参数ID查询参数
	 * @param pd
	 */
	public PageData hasSysP(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ParamMapper.hasSysParam", pd);
	}
	
	/**
	 * 根据系统参数编码查询参数
	 * @param pd
	 */
	public PageData hasSysByCode(PageData pd) throws Exception{
		return (PageData) dao.findForObject("ParamMapper.hasSysParamByCode", pd);
	}
}
