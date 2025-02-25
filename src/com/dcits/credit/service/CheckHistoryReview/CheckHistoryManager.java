package com.dcits.credit.service.CheckHistoryReview;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：CheckHistoryManager
 * 创建人：zhangyy
 * 说明：审核历史
 */
public interface CheckHistoryManager {
	/**审核历史列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listHistoryRe(Page page,String clientType);
	
	/**查询个人历史详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAppHistoryCheck(PageData pd);
	/**查询个人历史详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getEntHistoryCheck(PageData pd);
	/**查询个人历史详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getEntHistoryCheckHis(PageData pd);
	/**查询审核人信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getCheckUserInfo(String USER_ID);
}
