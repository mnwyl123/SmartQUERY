package com.dcits.platform.service.system.menuGroup.menuGroup;

import java.util.List;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 菜单功能组
 * 创建人：huangzwf
 * 创建时间：2016-11-22
 * @version
 */
public interface MenuFunGroupManager{

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
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
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
	
	/**通过id和功能组名获取数据
	 * @param pd
	 * @throws Exception
	 */
	public String findByIdAndName(PageData pd)throws Exception;
}

