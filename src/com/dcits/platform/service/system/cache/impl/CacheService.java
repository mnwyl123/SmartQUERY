package com.dcits.platform.service.system.cache.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.service.system.cache.CacheManager;
import com.dcits.platform.util.PageData;


/** 
 * 说明： 数据字典
 * 创建人：  
 * 创建时间：2015-12-16
 * @version
 */
@Service("cacheService")
public class CacheService implements CacheManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**字典缓存处理 pyj
	 * @param page
	 * @throws Exception
	 */
	@Override
	public List<Map> findCache(Map map)throws Exception{
		return (List<Map>)dao.findForList("CacheMapper.findCache", map);
	}

	/**字典详细数据
	 * @param page
	 * @throws Exception
	 */
	@Override
	public List<PageData> findDictionaries(Map map)throws Exception{
		if("SYS_DICTIONARIES".equals(map.get("targeTableName"))){
			return (List<PageData>)dao.findForList("CacheMapper.findDictionaries", map);
		}else{
			return (List<PageData>)dao.findForList("CacheMapper.QueryDictionaries", map);
		}
		
	}
}

