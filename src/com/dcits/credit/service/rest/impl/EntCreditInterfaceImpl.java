package com.dcits.credit.service.rest.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.rest.EntCreditInterfaceManage;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 查看企业信贷接口
 * @author 
 * gaoshenga
 */
@Service("EntCreditInterfaceService")
public class EntCreditInterfaceImpl implements EntCreditInterfaceManage {
	private static Logger logger = Logger.getLogger(EntCreditInterfaceImpl.class);
	@Resource(name="daoSupport")
	private  DaoSupport dao;
	
	//查询当前系统状态
	public PageData findSysStatus(PageData pd)throws Exception{
		return (PageData)dao.findForObject("EntCreditInterfaceMapper.findSysStatus", pd);
	}
	
	//查询是否含有渠道号
	@Override
	public PageData findByCHANNELNO(PageData pd) throws Exception {
		return (PageData)dao.findForObject("EntCreditInterfaceMapper.findByCHANNELNO", pd);
	}
	/**查询用户所在机构
	 * @param pd
	 * @throws Exception
	 */
	public PageData findOrg(PageData pd)throws Exception{
		return (PageData)dao.findForObject("EntCreditInterfaceMapper.findOrg", pd);
	}
	/**新增企业信息
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("EntCreditInterfaceMapper.save", pd);
	}
	/**存入流程状态表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception{
		dao.save("EntCreditInterfaceMapper.saveToFs", pd);
	}
	/**
	 * 查询征信账户信息
	 */
	@Override
	public PageData queryAccByUserName(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EntCreditInterfaceMapper.queryAccByUserName", pd);
	}
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception{
		dao.update("EntCreditInterfaceMapper.updateFs", pd);
	}
	/**查询同一渠道编号渠道流水号是否重复
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByQueryNo(PageData pd)throws Exception{
		return (PageData)dao.findForObject("EntCreditInterfaceMapper.findByQueryNo", pd);
	}

	
}
