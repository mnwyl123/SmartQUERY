package com.dcits.credit.service.creditAcctManage;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/**说明： 征信账户管理
 * 
 */
public interface CreditAcctManageManager {

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
	/**保存密码
	 * @param pd
	 * @throws Exception
	 */
	public void savePwd(PageData pd) throws Exception;

	/**修改人行密码 WEB_CRAWLER_INFO2
	 * @param pd
	 * @throws Exception
	 */
	public void pwdUpdate(PageData pd) throws Exception;	
	/**删除perbank表中的数据 -
	 * @param pd
	 * @throws Exception
	 */
	public void deletePerBank(PageData pd)throws Exception;
	/**删除web_crawler_info2表中的数据 
	 * @param pd
	 * @throws Exception
	 */
	public void deleteWeb2(PageData pd)throws Exception;
}
