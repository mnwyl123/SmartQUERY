package com.dcits.credit.service.keyCustMaintain;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/**说明： 重点关注客户维护
 * 
 */
public interface KeyCustMaintainManager {

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
	/**删除密码表
	 * @param pd
	 * @throws Exception
	 */
	public void deletePwd(PageData pd)throws Exception;
	
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
	/**获取客户编号
	 * @param pd
	 * @throws Exception
	 */
	public PageData findId(PageData pd)throws Exception;
}
