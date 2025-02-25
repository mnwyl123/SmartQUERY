package com.dcits.credit.service.ChannelService;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 

 */
public interface ChannelManager {
	/**数据列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> QuerylistPage(Page page);
	
	/**新增渠道信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void SaveChannel(PageData pd);
	
	/**查询渠道信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryChannelById(PageData pd);
	
	/**更新渠道信息 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void UpdateChannelById(PageData pd);
	
	/**删除渠道
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void deleteChannelById(PageData pd);
	/**批量删除
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void deleteAllChannelById(Map<String,Object> map);	
	/**更新用户表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void UpdateUser(Map<String,Object> map);	
	/**查询所有渠道信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryChannel(PageData pd);
	/**根据用户名和渠道编号查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryByUserName(PageData pd);
}
