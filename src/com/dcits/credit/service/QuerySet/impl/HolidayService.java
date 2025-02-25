package com.dcits.credit.service.QuerySet.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.QuerySet.HolidayManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

@Service("holidayManagerSerivce")
public class HolidayService implements HolidayManager {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取参数列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> paramList(Page page) throws Exception{
		return (List<PageData>)dao.findForList("HolidayMapper.paramlistPage", page);
	}
	/**
	 * 新增
	 * @param pd
	 */
	public void saveP(PageData pd) throws Exception{
		dao.save("HolidayMapper.saveP", pd);
	}
	/**
	 * 修改
	 * @param pd
	 * @throws Exception 
	 */
	@Override
	public void updateP(PageData pd) throws Exception {		
		dao.update("HolidayMapper.updateP", pd);
	}
	/**
	 * 删除
	 * @param pd
	 */
	public void deleteP(PageData pd) throws Exception{
		dao.delete("HolidayMapper.deleteP", pd);
	}
	/**
	 * 查询
	 * @param pd
	 */
	@Override
	public PageData queryData(PageData pd) throws Exception {
		return (PageData) dao.findForObject("HolidayMapper.queryData", pd);
	}
}
