package com.dcits.platform.service.system.cache;

import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;

/** 
 * 说明： 数据字典接口类
 * 创建人：  
 * 创建时间：2015-12-16
 * @version
 */
public interface CacheManager{
	
	/**字典缓存处理 pyj
	 * @param page
	 * @throws Exception
	 */
	public List<Map> findCache(Map map)throws Exception;

	/**字典详细数据
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> findDictionaries(Map map)throws Exception;
	
}

