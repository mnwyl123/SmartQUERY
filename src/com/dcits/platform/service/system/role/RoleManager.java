package com.dcits.platform.service.system.role;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.PolicyInfo;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.tree.TreeEntity;

/**	角色接口类
 * @author pengyj FHadmin  pengyj
 * 修改日期：2015.11.6
 */
public interface RoleManager {
	
	/**列出此组下级角色
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Role> listAllRolesByPId(Page page) throws Exception;
	
	/**通过id查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findObjectById(PageData pd) throws Exception;
	
	/**添加
	 * @param pd
	 * @throws Exception
	 */
	public void add(PageData pd) throws Exception;
	
	/**保存修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception;
	
	/**删除角色
	 * @param ROLE_ID
	 * @throws Exception
	 */
	public void deleteRoleById(PageData pd) throws Exception;
	
	/**给当前角色附加菜单权限
	 * @param role
	 * @throws Exception
	 */
	
	/**通过id查找
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	public Role getRoleById(String ROLE_ID) throws Exception;
	
	
	public List<TreeEntity> getMenuAuthByCompany(String roleId, String company) throws Exception;
	public List<PolicyInfo> getAllRolePolicy() throws Exception;
	public List<String> queryAllFunId() throws Exception;
	public void deletePolicyById(String roleId) throws Exception;
	
	public void insertPolicy(Map<String,Object> map) throws Exception;
	List<Role> listAllRole(String company) throws Exception;
	//查询已授权菜单ID
	public List<String> findMenuId(String ROLE_ID)throws Exception;
	/**删除用户角色
	 * @param ROLE_ID
	 * @throws Exception
	 */
	public void deleteByRoleId(PageData pd) throws Exception;
	
	/**通过COMPANY获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByCom(PageData pd)throws Exception;
	
	/**通过ROLE_ID获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<String> findByRoleId(PageData pd)throws Exception;

	List<Role> listRolesByPId(PageData pd) throws Exception;

	List<Role> listAllRoles(PageData pd) throws Exception;

}
