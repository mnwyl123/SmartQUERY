package com.dcits.credit.service.creditReportInquiry.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.creditReportInquiry.EnterReportInqManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 企业征信报告查询
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
@Service("EnterReportInqService")
public class EnterReportInqService implements EnterReportInqManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("EnterReportInqMapper.datalistPage", page);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> listHis(Page page)throws Exception{
		return (List<PageData>)dao.findForList("EnterReportInqMapper.hisDatalistPage", page);
	}
}

