package com.dcits.crawl.service.EnterAppReview;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;



/** 
 * 类名称：EntAppReManager
 * 创建人：zhangyy
 * 说明：企业查询申请审核
 */
public interface CrawlEntAppReManager {
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
	 * @throws Exception
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
	/**
	 * 保存企业中证码
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public void saveLoanNo(Map<String, String> pd) throws Exception;
}
