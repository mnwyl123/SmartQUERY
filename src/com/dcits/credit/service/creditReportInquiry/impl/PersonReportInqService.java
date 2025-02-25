package com.dcits.credit.service.creditReportInquiry.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.creditReportInquiry.PersonReportInqManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 个人征信报告查看
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
@Service("PersonReportInqService")
public class PersonReportInqService implements PersonReportInqManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonReportInqMapper.datalistPage", page);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> listHis(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonReportInqMapper.hisDatalistPage", page);
	}
	/**记录是否打印
	 * @param pd
	 * @throws Exception
	 */
	public void updateIsPrint(PageData pd) throws Exception{
		dao.update("PersonReportInqMapper.updateIsPrint", pd);
	}
	/**
	 * 查询系统设置
	 */
	public PageData findPrintNum() throws Exception{
		return (PageData) dao.findForObject("PersonReportInqMapper.findPrintNum", "printNum");
	}
	
	/**
	 * 查询实际查询次数
	 */
	public PageData findActualNum(PageData pd) throws Exception{
		return (PageData) dao.findForObject("PersonReportInqMapper.findActualNum", pd);
	}

}

