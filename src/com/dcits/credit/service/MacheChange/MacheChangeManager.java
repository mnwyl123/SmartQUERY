package com.dcits.credit.service.MacheChange;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：首页
 * 创建人：zhangyy
 */
public interface MacheChangeManager {
	/**当前所有待审核记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryAllRecord(Page page);
	/**更新审核状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateRecord(PageData pd);
	/**更新用户表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateUser(PageData pd);
	/**插入新记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void InsertRecord(PageData pd);
	/**查询当前记录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryById(PageData pd);
	/**查询当前记录是否已经提交
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryRecord(PageData pd);
	/**删除审核信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void delete(PageData pd);
}
