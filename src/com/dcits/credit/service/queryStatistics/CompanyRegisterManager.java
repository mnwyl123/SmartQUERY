package com.dcits.credit.service.queryStatistics;

import java.util.List;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 企业征信查询登记簿
 * 创建人：  
 * 创建时间：2017-06-30
 * @version
 */
public interface CompanyRegisterManager{

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
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listHis(Page page)throws Exception;	
	/**列表(详情)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> detailList(Page page)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	/**导出
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listAll(Page page)throws Exception;
}

