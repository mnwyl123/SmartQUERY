package com.dcits.platform.service.system.fhsms;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 站内信接口
 * 创建人：  
 * 创建时间：2016-01-17
 * @version
 */
public interface FhsmsManager{

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
	
	/**获取未读总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findFhsmsCount(String USERNAME)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	/**批量发信
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public List<PageData> findAllByID(String[] smsData)throws Exception;
	/**查询用户是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<String> findUser(PageData pd)throws Exception;
	
}

