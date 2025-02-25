package com.dcits.platform.service.system.org;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 组织机构接口类
 * 创建人：  
 * 创建时间：2015-12-16
 * @version
 */
public interface OrgManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<Org> list(Page page)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;

	/**通过编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByBianma(PageData pd)throws Exception;
	
	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<Org> listSubDepartmentByParentId(PageData pd) throws Exception;
	
	/**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<Org> listAllDepartment(String parentId,String company) throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public Org findByOrgId(String ORG_ID)throws Exception;
	/**通过USER_ID获取机构信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Org> getOrgByUserId(PageData pd)throws Exception;

	public List<Org> listAllOrg(String parentId, String company) throws Exception;
	public List<Org> listAllOrgByCompany(String company) throws Exception;
	
	public List<Map<String,Object>> findRootOrg(String company) throws Exception;
	/**删除用户机构
	 * @param pd
	 * @throws Exception
	 */
	public void deleteUserOrg(PageData pd)throws Exception;
	
	//建立机构树
	//public List<TreeEntity> getOrgTree(String userName, String company) throws Exception;
	
	/**
	 * 构建机构树
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, ? extends Object> getOrgTree(Map<String, Object> param) throws Exception;
	/**通过ORG_ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<String> finUserOrg(PageData pd)throws Exception;

	List<Org> listAuDepartmentByParentId(PageData pd) throws Exception;

	List<Org> listAuDepartment(String parentId, String company)
			throws Exception;
			
	public List<Org> listOrg(String company) throws Exception;

	/**
	 * 通过orgName查询orgId
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public String findOrgIdByOrgName(String orgName) throws Exception;
}

