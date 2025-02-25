package com.dcits.platform.service.system.company.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.MenuInfo;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.company.CompanyManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.PageData;


/** 系统用户
 * @author pengyj fhpengyj (pengyj)
 * 修改时间：2015.11.2
 */
@Service("companyService")
public class CompanyService implements CompanyManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**法人列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listCompanys(Page page)throws Exception{
		return (List<PageData>) dao.findCompanyList("CompanyMapper.companylistPage", page);
	}
	

	@Override
	@SuppressWarnings("unchecked")
	public PageData findByCompCode(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CompanyMapper.findByCompCode", pd);
	}
	@Override
	public void saveC(PageData pd)throws Exception{
		dao.save("CompanyMapper.saveC", pd);
	}
	/**修改法人
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editC(PageData pd)throws Exception{
		dao.update("CompanyMapper.editC", pd);
	}
	/**删除法人
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deleteC(PageData pd)throws Exception{
		dao.delete("CompanyMapper.deleteC", pd);
	}
	
	/**批量删除
	 * @param USER_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAllC(String[] COMP_CODES)throws Exception{
		dao.delete("CompanyMapper.deleteAllC", COMP_CODES);
	}
	//查询法人名称
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> findByCompCodeList(List<String> CodeList)throws Exception{
		return (List<PageData>)dao.findCompanyList("CompanyMapper.findByCompCodeList", CodeList);
	}
	@Override
	public void buildMenu(List<MenuInfo> menus)throws Exception{
		dao.save("CompanyMapper.buildMenu", menus);
	}
	//查询法人名称
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAllComp(String ID)throws Exception{
		return (List<PageData>)dao.listAllComp("CompanyMapper.listAllComp",ID);
	}
}
