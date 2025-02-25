package com.dcits.credit.service.creditReportInquiry;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 *  重要信息提示
 * 创建人：sunyra
 * 创建时间：2019-02-27
 */
public interface ImportInfoManager{
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	/**删除信息详情表中数据
	 * @param pd
	 * @throws Exception
	 */
	public void deleteMessage(PageData pd) throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(Map<String,String> map) throws Exception;
	
	/**查找最大id
	 * @param pd
	 * @throws Exception
	 */
	public int findReportMaxId() throws Exception;
	/**新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfo(Map<String,String> map)throws Exception;
	/**获取信息详情
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> getMessageInfo(PageData pd)throws Exception;
}


