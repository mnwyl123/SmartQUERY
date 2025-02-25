package com.dcits.platform.service.system.pwdRuleConfig.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.service.system.pwdRuleConfig.pwdRuleConfigManager;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 密码规则配置
 * 创建人：huangzwf
 * 创建时间：2016-11-22
 * @version
 */
@Service("pwdRuleConfigService")
public class pwdRuleConfigService implements pwdRuleConfigManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	


	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("pwdRuleConfigMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public PageData list(PageData pd)throws Exception{
		return (PageData)dao.findForObject("pwdRuleConfigMapper.list",pd);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public String checkMaxTime(String ID) throws Exception {
		return (String) dao.checkMaxTime("pwdRuleConfigMapper.checkMaxTime", ID);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public String checkPass(String ID) throws Exception {
		return (String) dao.checkPassword("pwdRuleConfigMapper.initPassword", ID);
	}

}

