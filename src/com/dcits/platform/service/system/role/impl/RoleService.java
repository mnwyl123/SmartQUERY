package com.dcits.platform.service.system.role.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.PolicyInfo;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.role.RoleManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.tree.TreeDetails;
import com.dcits.platform.util.tree.TreeEntity;
import com.dcits.platform.util.tree.TreeEntityFactory;

/**	角色
 * @author pengyj FHadmin 
 * 修改日期：2015.11.6
 */
@Service("roleService")
public class RoleService implements RoleManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Autowired
	private TreeEntityFactory treeEntityFactory;
	
	/**列出此组下级角色
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Role> listAllRolesByPId(Page page) throws Exception {
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		if(flag){
			return (List<Role>) dao.findForList("RoleMapper.RolelistPage", page);
		}else{
			return (List<Role>) dao.findForList("RoleMapper.ComRolelistPage", page);
		}
		
	}
	
	/**通过id查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findObjectById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("RoleMapper.findObjectById", pd);
	}
	
	/**添加
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void add(PageData pd) throws Exception {
		dao.save("RoleMapper.insert", pd);
	}
	
	/**保存修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("RoleMapper.edit", pd);
	}
	
	/**删除角色
	 * @param ROLE_ID
	 * @throws Exception
	 */
	@Override
	public void deleteRoleById(PageData pd) throws Exception {
		dao.delete("RoleMapper.deleteRoleById", pd);
	}
	
	/**通过id查找
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	@Override
	public Role getRoleById(String ROLE_ID) throws Exception {
		return (Role) dao.findForObject("RoleMapper.getRoleById", ROLE_ID);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<TreeEntity> getMenuAuthByCompany(String roleId, String company) throws Exception {
		List<TreeEntity> menuList = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("roleId", roleId);
		map.put("company", company);
		List<TreeDetails> tds = (List<TreeDetails>) dao.findForList("RoleMapper.queryMenuByCompany", map);
		menuList = treeEntityFactory.buildTreeChecked(treeEntityFactory.buildTreeList(tds, "0"));
		return menuList;
	}
	
	@Override
	public void deletePolicyById(String roleId) throws Exception{
		dao.delete("RoleMapper.deletePolicyById", roleId);
	}
	
	@Override
	public void insertPolicy(Map<String,Object> map) throws Exception{
		dao.save("RoleMapper.insertPolicy", map);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<PolicyInfo> getAllRolePolicy() throws Exception {
		// TODO Auto-generated method stub
		List<PolicyInfo> list = (List<PolicyInfo>) dao.findForList("RoleMapper.queryAllRolePolicy", "");
		return list;
	}
	
	@Override
	public List<Role> listAllRole(String company) throws Exception {
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		PageData pd = new PageData();
		pd.put("USER_ID", USERID);
		pd.put("COMPANY", company);
		Page page = new Page();
		List<Role> RoleList = new ArrayList<Role>();
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		page.setPd(pd);
		//根据用户不同显示不同角色
		if(flag){
			RoleList = (List<Role>) dao.findForList("RoleMapper.RolelistAut", pd);
		}else{
			RoleList =  (List<Role>) dao.findForList("RoleMapper.ComRolelistAut", pd);
		}
		
//		List<Role> RoleList = this.listAllRoles(pd);
		for(Role depar : RoleList){
			depar.setTarget("treeFrame");
		}
		return RoleList;
	}
	
	@Override
	public List<String> findMenuId(String ROLE_ID)throws Exception{
		return (List<String>) dao.findForList("RoleMapper.findMenuId", ROLE_ID);
	}

	@Override
	public List<String> queryAllFunId() throws Exception {
		// TODO Auto-generated method stub
		List<String> list = (List<String>) dao.findForList("RoleMapper.queryAllFunId", "");
		return list;
	}
	
	/**删除用户角色
	 * @param ROLE_ID
	 * @throws Exception
	 */
	@Override
	public void deleteByRoleId(PageData pd) throws Exception {
		dao.delete("RoleMapper.deleteByRoleId", pd);
	}
	
	/**通过COMPANY获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findByCom(PageData pd)throws Exception{
		return (PageData)dao.findForObject("RoleMapper.findByCom", pd);
	}
	/**通过ROLE_ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<String> findByRoleId(PageData pd)throws Exception{
		return (List<String>)dao.findForList("RoleMapper.findByRoleId", pd);
	}
	/**列出此组下级角色(用户界面下拉列表)
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Role> listRolesByPId(PageData pd) throws Exception {
		Page page = new Page();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		page.setPd(pd);
		if(flag){
			return (List<Role>) dao.findForList("RoleMapper.RolelistPage", page);
		}else{
			return (List<Role>) dao.findForList("RoleMapper.ComRolelistPage", page);
		}
		
	}
	/**列出此组下级角色(授权)
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Role> listAllRoles(PageData pd) throws Exception {
		return (List<Role>) dao.findForList("RoleMapper.AllRolelist", pd);
		
	}
}
