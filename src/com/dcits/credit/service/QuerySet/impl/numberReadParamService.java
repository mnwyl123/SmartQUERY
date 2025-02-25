package com.dcits.credit.service.QuerySet.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.QuerySet.numberReadParamManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

@Service("numberReadParamService")
public class numberReadParamService implements numberReadParamManager {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取参数列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> paramList(Page page) throws Exception{
		return (List<PageData>)dao.findForList("numberReadParamMapper.paramlistPage", page);
	}
	/**
	 * 新增
	 * @param pd
	 */
	public void saveP(PageData pd) throws Exception{
		dao.save("numberReadParamMapper.saveP", pd);
	}
	/**
	 * 修改
	 * @param pd
	 * @throws Exception 
	 */
	@Override
	public void updateP(PageData pd) throws Exception {		
		dao.update("numberReadParamMapper.updateP", pd);
	}
	/**
	 * 删除
	 * @param pd
	 */
	public void deleteP(PageData pd) throws Exception{
		dao.delete("numberReadParamMapper.deleteP", pd);
	}
	@Override
	public PageData queryByPARAM(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("numberReadParamMapper.queryByPARAM", pd);
	}
}
