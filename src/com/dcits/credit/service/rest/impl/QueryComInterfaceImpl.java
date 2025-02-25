package com.dcits.credit.service.rest.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.rest.QueryComInterfaceManager;
import com.dcits.credit.service.rest.ReportInterfaceService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.PageData;
/**

 */
@Service("QueryComInterfaceService")
public class QueryComInterfaceImpl implements QueryComInterfaceManager {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	/**
	 * 查询征信账户信息
	 */
	@Override
	public PageData queryAccByUserName(PageData pd) throws Exception {
		return (PageData) dao.findForObject("QueryComInterface.queryAccByUserName", pd);
	}
	/**
	 *查询需要的数据
	 */
	@Override
	public PageData queryUserByUserName(PageData pd) throws Exception {
			return (PageData) dao.findForObject("QueryComInterface.queryUserByUserName", pd);
	}
	/**
	 * 将请求信息落流程表 
	 */
	@Override
	public void saveRequestInfo(PageData pd) throws Exception {
		dao.save("QueryComInterface.saveRequestInfo", pd);
	}
	/**
	 * 将数据保存至企业信息表
	 */
	@Override
	public void saveEntInfo(PageData pd) throws Exception {
		dao.save("QueryComInterface.saveEntInfo", pd);
	}
	/**
	 * 人行返回数据更新流程表
	 */
	@Override
	public void updateFlowTable(PageData pd) throws Exception {
		dao.update("QueryComInterface.updateFlowTable", pd);
		
	}
	/**
	 * 保存文件名至企业信息表
	 */
	@Override
	public void updateComInfo(PageData pd) throws Exception {
		dao.save("QueryComInterface.updateComInfo", pd);
	}
}
