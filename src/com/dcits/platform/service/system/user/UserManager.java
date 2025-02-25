package com.dcits.platform.service.system.user;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.PageData;


/** 用户接口类
 * @author pengyj fhpengyj (pengyj)
 * 修改时间：2015.11.2
 */
public interface UserManager {
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public User getUserByNameAndPwd(PageData pd)throws Exception;
	
	/**更新登录时间
	 * @param pd
	 * @throws Exception
	 */
	public void updateLastLogin(PageData pd)throws Exception;
	/**更新错误次数
	 * @param pd
	 * @throws Exception
	 */
	public void addErrorTime(PageData pd)throws Exception;
	
	/**通过用户ID获取用户信息和角色信息
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	public User getUserById(String USER_ID) throws Exception;
	
	/**通过USERNAEME获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUsername(PageData pd)throws Exception;
	
	/**列出某角色下的所有用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllUserByRoldId(PageData pd) throws Exception;
	
	/**保存用户IP
	 * @param pd
	 * @throws Exception
	 */
	public void saveIP(PageData pd)throws Exception;
	
	/**用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listUsers(Page page)throws Exception;
	
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUE(PageData pd)throws Exception;
	
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUN(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	public void editU(PageData pd)throws Exception;
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd)throws Exception;
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteU(PageData pd)throws Exception;
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	public void deleteAllU(String[] USER_IDS)throws Exception;
	
	/**用户列表(全部)
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllUser(PageData pd)throws Exception;
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getUserCount(String value)throws Exception;
	
	/**通过法人代码获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String findByCompCodeandName(PageData pd)throws Exception;
	/**删除法人及用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteUC(PageData pd)throws Exception;
	/**批量删除法人及用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	public void deleteAllUC(String[] COMP_CODES)throws Exception;
	/**通过USERNAEME获取法人CODE
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findCompCodeByUsername(PageData pd)throws Exception;
	/**通过USER_ID获取机构信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrgByUserId(PageData pd)throws Exception;
	
	public List<PageData> getProByUserId(PageData pd)throws Exception;
	/**查询错误次数
	 * @param pd
	 * @throws Exception
	 */
	public String checkErrTime(PageData pd)throws Exception;
	/**清除错误次数
	 * @param pd
	 * @throws Exception
	 */
	public String clearErrTime(PageData pd)throws Exception;

	public List<Map<String,Object>> getAllRole(PageData pd)throws Exception;
	
	public List<Map<String,Object>> getAllOrg(PageData pd)throws Exception;

	public void saveRoleAuth(Map<String,Object> map)throws Exception;
	
	public void saveOrgAuth(Map<String,Object> map)throws Exception;
	public void saveproAuth(Map<String,Object> map)throws Exception;
	/**修改初始密码
	 * @param pd
	 * @throws Exception
	 */
	public void ChangeInitPwd(PageData pd)throws Exception;
	//查询已授权机构ID
	public List<String> findOrgId(String USER_ID)throws Exception;
	
	public List<String> findProId(String USER_ID)throws Exception;
	//删除已授权机构信息
	public void deleteAuthOrg(String USER_ID)throws Exception;
	//删除已授权产品信息
	public void deleteAuthPro(String USER_ID)throws Exception;
	//查询已授权角色ID
	public List<String> findRoleId(String USER_ID)throws Exception;
	//删除已授权角色信息
	public void deleteAuthRole(String USER_ID)throws Exception;
	//根据用户ID，查找用户信息
	public PageData findByUserId(PageData pd)throws Exception;
	/**查询用户是否锁定
	 * @param pd
	 * @throws Exception
	 */
	public String checkLock(PageData pd)throws Exception;
	//锁定用户
	public void LockUser(PageData pd)throws Exception;
	/**导出用户
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> OutUsers(Page page)throws Exception;
	
	/**通过USERNAEME和密码获取法人CODE
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<String> findCompCode(PageData pd)throws Exception;
	
	/**通过法人查询用户登录编码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<String> findUserCode(PageData pd)throws Exception;
	
	public void updateUnLock(PageData pd)throws Exception;
	//查询当前用户是否具有查询员权限
	public PageData findPolicy(PageData pd) throws Exception;
	//查询当前用户是否为普通用户
	public PageData findUserType(String USERNAME) throws Exception;
	//查询当前角色是否是查询员角色
	public List<String> findQueryRole(String[] listRoleId) throws Exception;
	//查询当前用户是否具有审核员权限
	public PageData findCheckPolicy(PageData pd) throws Exception;
	/**修改密码
	 * @param pd
	 * @throws Exception
	 */
	public void editPwd(PageData pd)throws Exception;
}
