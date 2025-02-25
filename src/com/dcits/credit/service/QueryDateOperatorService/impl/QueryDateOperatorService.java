package com.dcits.credit.service.QueryDateOperatorService.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.QueryDateOperatorService.QueryDateOperatorManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 

 */
@Service("queryDateService")
public class QueryDateOperatorService implements QueryDateOperatorManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(QueryDateOperatorService.class);
	@Override
	public List<PageData> QuerylistPage(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("QueryDateMapper.QuerylistPage", page);
	}
	@Override
	public void Save(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("QueryDateMapper.Save", pd);
	}
	@Override
	public PageData queryByTypeAndCompany(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("QueryDateMapper.queryByTypeAndCompany", pd);
	}
	@Override
	public void Update(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("QueryDateMapper.Update", pd);
	}
	@Override
	public void delete(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("QueryDateMapper.delete", pd);
	}
	@Override
	public void deleteAll(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("QueryDateMapper.deleteAll", map);
	}
	@Override
	public List<PageData> getOrgsByCompany(String company) throws Exception{
		return (List) dao.findForList("QueryDateMapper.getOrgsByCompany", company);
	}
}
