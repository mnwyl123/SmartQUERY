package com.dcits.credit.service.EnterAppReview;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：EntAppReManager
 * 创建人：zhangyy
 * 说明：企业查询申请审核
 */
public interface EntAppReManager {
	/**企业查询申请审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listEntAppRe(Page page);
	
	/**查询企业申请信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getEntCheck(PageData pd);
	/**查询明细表需要的数据
	 * @param pd
	 * @return
	 * @throws Exception EntReportDetail
	 */
	public PageData QueryEntDetail(String ID);
	/**向明细表插入数据
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public void saveEntDetail(PageData pd);
	/**更新明细表中查询结果状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void UpdateCDetailCheck(PageData pd);
	
	/**查询登录的机构编码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getOrgCode(PageData pd);
	/**根据条件查询该客户是否已经被查询过
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCompanyByInfo(PageData pd);
	/**查询明细表需要的数据
	 * @param pd
	 * @return
	 * @throws Exception EntReportDetail
	 */
	public PageData EntReportDetail(PageData pd);
	/**
	 * 查询报文人行需要的数据
	 * @param pd
	 * @return
	 */
	public PageData QueryReportDetail(PageData pd);
}
