package com.dcits.credit.service.queryStatistics;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 说明：人行征信查询流水统计
 * 创建人：  
 * 创建时间：2017-06-30
 * @version
 */
public interface BankQueryFlowManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**企业查询流水列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> comQuerylist(Page page)throws Exception;
	/**个人查询流水列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(详情)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> detailList(Page page)throws Exception;
	/**列表(详情)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> detailListHis(Page page)throws Exception;
	/**列表(详情)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> comDetailList(Page page) throws Exception;
	
	/**批量新增
	 * @param pd
	 * @throws Exception
	 */
	public void bachSave(PageData pd)throws Exception;
	/**企业查询流水列表(总计专用)
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> comDataCountPage(PageData pd)throws Exception;
	
}

