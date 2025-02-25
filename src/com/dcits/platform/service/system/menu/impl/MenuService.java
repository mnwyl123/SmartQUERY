package com.dcits.platform.service.system.menu.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Menu;
import com.dcits.platform.entity.system.MenuInfo;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.tree.TreeDetails;
import com.dcits.platform.util.tree.TreeEntity;
import com.dcits.platform.util.tree.TreeEntityFactory;

/** 
 * 类名称：MenuService 菜单处理
 * 创建人：FH    3  1 3 5 9 6 7 9 0pengyj
 * 修改时间：2015年10月27日
 * @version v2
 */
@Service("menuService")
public class MenuService implements MenuManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Autowired
	private TreeEntityFactory treeEntityFactory;
	
	/**
	 * 通过ID获取其子一级菜单
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<MenuInfo> listSubMenuByParentId(PageData pd) throws Exception {
		return (List<MenuInfo>) dao.findForList("MenuMapper.listSubMenuByParentId", pd);
	}
	
	/**
	 * 通过菜单ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getMenuById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("MenuMapper.getMenuById", pd);
	}
	
	/**
	 * 新增菜单
	 * @param menu
	 * @throws Exception
	 */
	@Override
	public void saveMenu(PageData pd) throws Exception {
		dao.save("MenuMapper.insertMenu", pd);
	}
	
	/**
	 * 取最大ID
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findMaxId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("MenuMapper.findMaxId", pd);
	}
	
	/**
	 * 删除菜单
	 * @param MENU_ID
	 * @throws Exception
	 */
	@Override
	public void deleteMenuById(PageData pd) throws Exception {
		dao.save("MenuMapper.deleteMenuById", pd);
	}
	
	/**
	 * 编辑
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		 dao.update("MenuMapper.updateMenu", pd);
	}
	
	/**
	 * 保存菜单图标 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData editicon(PageData pd) throws Exception {
		return (PageData)dao.findForObject("MenuMapper.editicon", pd);
	}
	
	/**
	 * 获取所有菜单并填充每个菜单的子菜单列表(菜单管理)(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<MenuInfo> listAllMenu(String MENU_ID,String company) throws Exception {
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
		String USERID = user.getUSER_ID();
		PageData pd = new PageData();
		pd.put("MENU_ID", MENU_ID);
		pd.put("COMPANY", company);
		List<MenuInfo> menuList = new ArrayList<MenuInfo>();
		String USERNAME = (String) session.getAttribute(USERID+Const.SESSION_USERNAME);
		if(USERNAME =="super"||USERNAME.equals("super")){
			menuList = this.listSuperSubMenuByParentId(pd);
		}else{
			menuList = this.listSubMenuByParentId(pd);
		}
		for(MenuInfo menu : menuList){
			menu.setMenuUrl("menu.do?MENU_ID="+menu.getMenuId());
			menu.setSubMenu(this.listAllMenu(menu.getMenuId(),company));
			menu.setTarget("treeFrame");
		}
		return menuList;
	}

	/**
	 * 获取所有菜单并填充每个菜单的子菜单列表(系统菜单列表)(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Menu> listAllMenuQx(String MENU_ID) throws Exception {
		return null;
//		List<Menu> menuList = this.listSubMenuByParentId(MENU_ID);
//		for(Menu menu : menuList){
//			menu.setSubMenu(this.listAllMenuQx(menu.getMENU_ID()));
//			menu.setTarget("treeFrame");
//		}
//		return menuList;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<TreeEntity> getMenuByUserName(String userName, String company) throws Exception {
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
		String USERID = user.getUSER_ID();
		List<TreeEntity> menuList = null;

		//判断是否为super用户
		if(userName.equals("super")){
			session.setAttribute(USERID+"isCompany", true);
			List<TreeDetails> tds = (List<TreeDetails>) dao.findForList("MenuMapper.querySuperMenu", "");
			menuList = treeEntityFactory.buildTreeList(tds, "0");
			return menuList;
		}

		//判断是否为法人
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("company", company);
		String isCompany = (String)dao.findForObject("MenuMapper.isCompany", map);
		if(isCompany.equals("1")){
			session.setAttribute(USERID+"isCompany", true);
			List<TreeDetails> tds = (List<TreeDetails>) dao.findForList("MenuMapper.queryAllMenu", map);
			menuList = treeEntityFactory.buildTreeList(tds, "0");
		}else{
			session.setAttribute(USERID+"isCompany", false);
			//查询该普通用户的roleid
			List<String> roleId = (List<String>) dao.findForList("MenuMapper.getRoleIdByUserName", map);
			if(roleId.size() == 0){
				return new ArrayList<TreeEntity>();
			}
			map.put("list", roleId);
			List<TreeDetails> tds = (List<TreeDetails>) dao.findForList("MenuMapper.queryMenuByRoleId", map);
			
			if(!tds.toString().equals("[null]") && tds.toString() != "[null]"){
				menuList = treeEntityFactory.buildTreeList(tds, "0");
			}else{
				return new ArrayList<TreeEntity>();
			}
		}
		
		return menuList;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<MenuInfo> list(Page page)throws Exception{
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
		String USERID = user.getUSER_ID();
		String USERNAME = (String) session.getAttribute(USERID+Const.SESSION_USERNAME);
		if(USERNAME =="super"||USERNAME.equals("super")){
			return (List<MenuInfo>)dao.findForList("MenuMapper.superdatalistPage", page);
		}else{
			return (List<MenuInfo>)dao.findForList("MenuMapper.datalistPage", page);
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<String> getRoleIdsByUserName(String userName, String company) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("company", company);
		List<String> roleIds = (List<String>) dao.findForList("MenuMapper.getRoleIdByUserName", map);
		return roleIds;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<MenuInfo> getAllMenu(String company)throws Exception{
		return (List<MenuInfo>)dao.findForList("MenuMapper.getAllMenu", company);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<MenuInfo> listSuperSubMenuByParentId(PageData pd) throws Exception {
		return (List<MenuInfo>) dao.findForList("MenuMapper.listSuperSubMenuByParentId", pd);
	}
	/**通过COMPANY获取菜单数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByCompany(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MenuMapper.findByCompany", pd);
	}
}
