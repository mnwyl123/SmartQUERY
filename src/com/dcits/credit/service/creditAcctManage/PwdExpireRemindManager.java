package com.dcits.credit.service.creditAcctManage;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/**说明： 密码到期提醒
 * 
 */
public interface PwdExpireRemindManager {

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
	public void update(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**小于某个天数列表
	 * @param map
	 * @throws Exception
	 */
	public List<PageData> queryExpireAccount(Map map)throws Exception;
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
    //保存密码
	public void savePwd(PageData pd) throws Exception;
	/**需要转存数据列表
	 * @param map
	 * @throws Exception
	 */
	public List<PageData> queryhistAccount(Map map)throws Exception;
	public void saveY5(Map map) throws Exception;
	public void saveM24(Map map) throws Exception;
	public void savepld(Map map) throws Exception;
	public void delY5(Map map) throws Exception;
	public void delM24(Map map) throws Exception;
	public void delpld(Map map) throws Exception;
	public List<PageData> querySyncAccount(Map map)throws Exception;
}
