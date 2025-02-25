package com.dcits.credit.service.QuerySet;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：QuerySetManager
 * 创建人：zhangyy
 * 说明：查询次数设置
 */
public interface QuerySetManager {
	/**查询次数设置列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listQuery(Page page);
	
	/**查询用户查询次数设置
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void SaveInfo(PageData pd);
	
	/**查询用户是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryUserName(PageData pd);
	/**查询用户是否已添加
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryUser(PageData pd);
	
	/**查询当前用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryUserInfo(PageData pd);
	/**更新用户参数信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateUser(PageData pd);
	/**删除用户参数信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void deleteUser(PageData pd);
	
}
