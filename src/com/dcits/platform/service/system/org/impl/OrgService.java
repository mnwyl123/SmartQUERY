package com.dcits.platform.service.system.org.impl;

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
import com.dcits.platform.entity.system.OrgTreeEntity;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.tree.TreeDetails;
import com.dcits.platform.util.tree.TreeEntity;
import com.dcits.platform.util.tree.TreeEntityFactory;

/** 
 * 说明： 组织机构
 * 创建人：  
 * 创建时间：2015-12-16
 * @version
 */
@Service("orgService")
public class OrgService implements OrgManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Autowired
	private TreeEntityFactory treeEntityFactory;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("OrgMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("OrgMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("OrgMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Org> list(Page page)throws Exception{
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		if(flag){
			return (List<Org>)dao.findForList("OrgMapper.datalistPage", page);
		}else{
			List<Org> departmentList =(List<Org>)dao.findForList("OrgMapper.ComdatalistPage", page);
			departmentList=bulidOrgTree(departmentList);
			return departmentList;
		}
//		return (List<PageData>)dao.findForList("OrgMapper.datalistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrgMapper.findById", pd);
	}
	
	/**通过编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByBianma(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrgMapper.findByBianma", pd);
	}
	
	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
//	@Override
//	@SuppressWarnings("unchecked")
	public List<Org> listSubDepartmentByParentId(PageData pd) throws Exception {
//		Session session = Jurisdiction.getSession();
//		User user = (User)session.getAttribute(Const.SESSION_USER);
//		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
//		if(flag){
//			return (List<Org>) dao.findForList("OrgMapper.listSubDepartmentByParentId", pd);
//		}else{
//			return (List<Org>) dao.findForList("OrgMapper.listComDepartmentByParentId", pd);
//		}
		
		return (List<Org>) dao.findForList("OrgMapper.listSubDepartmentByParentId", pd);
	}
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)(机构管理，左侧机构树)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Org> listAllDepartment(String parentId,String company) throws Exception {
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		
		PageData pd = new PageData();
		pd.put("parentId", parentId);
		pd.put("company", company);
		pd.put("USER_ID", USERID);
		List<Org> departmentList = new ArrayList<Org>();
		if(flag){
			departmentList = (List<Org>) dao.findForList("OrgMapper.listSubDepartmentByParentId", pd);
			for(Org depar : departmentList){
				depar.setTreeurl("org/list.do?ORG_ID="+depar.getOrgId());
				depar.setSubDepartment(this.listAllDepartment(depar.getOrgId(),company));
				depar.setTarget("treeFrame");
			}
		}else{
			departmentList = (List<Org>) dao.findForList("OrgMapper.listComDepartmentByParentId", pd);
			departmentList=bulidOrgTree(departmentList);
		}
		return departmentList;
	}
	
	public List<Org> bulidOrgTree(List<Org> departmentList){
		//构建树
		List<Org> list = new ArrayList<Org>();
		List<Org> list1 = new ArrayList<Org>();
		for(int i=departmentList.size()-1;i>=0;i--){
			List<Org> OrgList = new ArrayList<Org>();
			String orgId=departmentList.get(i).getOrgId();
			for(int j=0;j<i;j++){
				if(departmentList.get(j).getParentId()==orgId||departmentList.get(j).getParentId().equals(orgId)){
					OrgList.add(departmentList.get(j));
					list.add(departmentList.get(j));
				}
			}
			list1.add(departmentList.get(i));
			departmentList.get(i).setSubDepartment(OrgList);
			departmentList.get(i).setTreeurl("org/list.do?ORG_ID="+departmentList.get(i).getOrgId());
			departmentList.get(i).setTarget("treeFrame");
		}
		for(int i=0;i<list.size();i++){
			for(int j=0;j<list1.size();j++){
				if(list.get(i).getOrgId()==list1.get(j).getOrgId()||(list.get(i).getOrgId()).equals(list1.get(i).getOrgId())){
					departmentList.remove(list.get(i));
				}
			}
		}
		return departmentList;
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public Org findByOrgId(String ORG_ID)throws Exception{
		return (Org)dao.findForObject("OrgMapper.findByOrgId", ORG_ID);
	}
	/**通过USER_ID获取机构信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Org> getOrgByUserId(PageData pd)throws Exception{
		return (List<Org>)dao.findForList("OrgMapper.findOrgByUserId", pd);
	}
	
	//用户授权机构
	public List<Org> listAllOrg(String parentId,String company) throws Exception {
		PageData pd = new PageData();
		pd.put("parentId", parentId);
		pd.put("company", company);
		List<Org> departmentList = new ArrayList<Org>();
		
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		pd.put("USER_ID", user.getUSER_ID());
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		if(flag){
			departmentList = this.listAuDepartmentByParentId(pd);
			for(Org depar : departmentList){
				depar.setTreeurl("org/list.do?ORG_ID="+depar.getOrgId());
				depar.setSubDepartment(this.listAuDepartment(depar.getOrgId(),company));
				depar.setTarget("treeFrame");
			}
		}else{
			departmentList = (List<Org>) dao.findForList("OrgMapper.ComOrglist", pd);
			departmentList=bulidOrgTree(departmentList);
		}
		return departmentList;
	}
	
	//用户列表下拉机构
	@SuppressWarnings("unchecked")
	public List<Org> listAllOrgByCompany(String company)throws Exception{
		PageData pd = new PageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		pd.put("USER_ID", user.getUSER_ID());
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		if(flag){
			return (List<Org>)dao.findForList("OrgMapper.listAllOrgByCompany", company);
		}else{
			return (List<Org>) dao.findForList("OrgMapper.ComOrglist", pd);
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> findRootOrg(String company)throws Exception{
		return (List<Map<String,Object>>)dao.findForList("OrgMapper.findRootOrg", company);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deleteUserOrg(PageData pd)throws Exception{
		dao.delete("OrgMapper.deleteUserOrg", pd);
	}
	
/*	@Override
	@SuppressWarnings("unchecked")
	public List<TreeEntity> getOrgTree(String userName, String company) throws Exception {
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
		String USERID = user.getUSER_ID();
		List<TreeEntity> orgTreeList = null;

		//判断是否为法人
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("company", company);
		String isCompany = (String)dao.findForObject("MenuMapper.isCompany", map);
		if(isCompany.equals("1")){
			session.setAttribute(USERID+"isCompany", true);
			List<TreeDetails> tds = (List<TreeDetails>) dao.findForList("OrgMapper.listAllOrgByCompany", company);
			orgTreeList = treeEntityFactory.buildOrgTreeList(tds, "0");
		}else{
			PageData pd = new PageData();
			pd.put("USER_ID", USERID);
			pd.put("COMPANY", company);
			session.setAttribute(USERID+"isCompany", false);
			List<TreeDetails> tds = (List<TreeDetails>) dao.findForList("OrgMapper.findOrgByUserId", pd);
			
			if(!tds.toString().equals("[null]") && tds.toString() != "[null]"){
				orgTreeList = treeEntityFactory.buildOrgTreeList(tds, "0");
			}else{
				return new ArrayList<TreeEntity>();
			}
		}
		
		return orgTreeList;
	}*/
	
	public Map<String, ? extends Object> getOrgTree(Map<String, Object> param) throws Exception {
		User user = (User) param.get("user");
		Map<String, Object> results = new HashMap<String, Object>();
		String userName = user.getUSERNAME();
		String company = user.getCOMPANY();
		
		//获取所有机构信息
		@SuppressWarnings("unchecked")
		List<TreeDetails> tds = (List<TreeDetails>) dao.findForList("OrgMapper.listAllOrgByCompany", company);
		List<TreeEntity> result = new ArrayList<TreeEntity>();
		//判断是否为法人
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("company", company);
		String isCompany = (String)dao.findForObject("MenuMapper.isCompany", map);
		if(isCompany != null && isCompany.length() > 0){
			List<Map<String, Object>> roots = this.findRootOrg(company);
			for (Map<String, Object> temp : roots) {
				OrgTreeEntity root = new OrgTreeEntity((String)temp.get("ORG_CODE"));
				root = (OrgTreeEntity)treeEntityFactory.buildOrgTreeListInRoot(tds, root);
				result.add(root);
			}
		}else{
			OrgTreeEntity root = new OrgTreeEntity((String)param.get("currOrg"));
			root = (OrgTreeEntity)treeEntityFactory.buildOrgTreeListInRoot(tds, root);
			result.add(root);
		}
		
		results.put("count", result==null?0:result.size());
		results.put("orgNodeList", result);
		
		return results;
	}
	/**通过ORG_ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<String> finUserOrg(PageData pd)throws Exception{
		return (List<String>)dao.findForList("OrgMapper.finUserOrg", pd);
	}
	
	/**
	 * 通过ID获取其子级列表(授权)
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Org> listAuDepartmentByParentId(PageData pd) throws Exception {
		return (List<Org>) dao.findForList("OrgMapper.listAubDepartmentByParentId", pd);
	}
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)(授权)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Org> listAuDepartment(String parentId,String company) throws Exception {
		PageData pd = new PageData();
		pd.put("parentId", parentId);
		pd.put("company", company);
		List<Org> departmentList = this.listAuDepartmentByParentId(pd);
		for(Org depar : departmentList){
			depar.setTreeurl("org/list.do?ORG_ID="+depar.getOrgId());
			depar.setSubDepartment(this.listAuDepartment(depar.getOrgId(),company));
			depar.setTarget("treeFrame");
		}
		return departmentList;
	}
	// 查询所有的机构  pengyj add 20170428
//	@Override
	public List<Org> listOrg(String company) throws Exception {
		return (List<Org>) dao.findForList("OrgMapper.listOrg", company);
	}
	/**
	 * 通过orgName查询orgId
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public String findOrgIdByOrgName(String orgName) throws Exception {
		return  (String) dao.findForObject("OrgMapper.findOrgIdByOrgName", orgName);
	}
}

