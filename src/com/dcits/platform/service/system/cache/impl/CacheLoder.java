package com.dcits.platform.service.system.cache.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.dcits.platform.dao.redis.RedisDao;
import com.dcits.platform.service.system.cache.CacheManager;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;

/**
 * 初始化缓存
 * @author pengyj
 *
 */
public class CacheLoder {
	@Resource(name = "redisDaoImpl")
	private RedisDao redisDaoImpl;
	@Resource(name="cacheService")
	private CacheManager cacheService;
	
	protected Logger logger = Logger.getLogger(this.getClass());
	
	//存放数据字典
	public static Map<String,Object> memoryTable = new HashMap<String,Object>();
	
//	public  CacheLoder(RedisDao redisDaoImpl,CacheManager cacheService){
//		this.redisDaoImpl = redisDaoImpl ;
//		this.cacheService = cacheService;
//	}
	
	//在这里加载缓存..
	public void init(){
	try {
			List<Map> varList = cacheService.findCache(null);
			for(int i=0 ;i<varList.size();i++){
				Map<String,Object> mapDic=varList.get(i);
				Map<String,Object> mapParam = new HashMap<String,Object>();
				mapParam.put("codeColName", mapDic.get("DIC_VAL_COLNAME"));
				mapParam.put("valueColName", mapDic.get("DIC_DES_COLNAME"));
				mapParam.put("targeTableName", mapDic.get("DIC_TBLNAME"));
				mapParam.put("dicValColname", mapDic.get("DIC_ID_COLNAME"));
				mapParam.put("dicIdvalue", mapDic.get("DIC_IDVALUE"));
				List<PageData> cache = cacheService.findDictionaries(mapParam);
//				Map<String, String> treeMap = new HashMap<String, String>();
//				for(int j=0 ;j< cache.size();j++){
//					Map<String,Object> mapDic_= cache.get(j);
//					treeMap.put((String) mapDic_.get("CODE"), (String) mapDic_.get("VALUE"));
//				}
				//把数据放到redis中
				if(cache.size()>0){
//					redisDaoImpl.delete((String)mapDic.get("DIC_CODE"));
//					redisDaoImpl.addMap((String)mapDic.get("DIC_CODE"), treeMap);
					memoryTable.remove(mapDic.get("DIC_CODE"));
					memoryTable.put((String) mapDic.get("DIC_CODE"), cache);
				}
			}
			logger.info("缓存加载成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.info("缓存加载失败");
		}
	  }
}
