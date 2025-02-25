package com.dcits.platform.controller.system.cache;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import redis.clients.jedis.Jedis;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.redis.RedisDao;
import com.dcits.platform.service.system.cache.CacheManager;
import com.dcits.platform.service.system.cache.impl.CacheLoder;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;

/** 
 * 类名称：CacheController
 * 创建人：pengyj
 * 更新时间：2015年11月3日
 * @version
 */
@Controller
@RequestMapping(value="/cache")

public class CacheController extends BaseController {
	
	@Resource(name = "redisDaoImpl")
	private RedisDao redisDaoImpl;
	@Resource(name="cacheService")
	private CacheManager cacheService;
	
	/**同步缓存数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/putCache")
	@ResponseBody
	public Object putCache() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"初始化缓存字典");
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
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
//			Map<String, String> treeMap = new HashMap<String, String>();
//			for(int j=0 ;j< cache.size();j++){
//				Map<String,Object> mapDic_= cache.get(j);
//				treeMap.put((String) mapDic_.get("CODE"), (String) mapDic_.get("VALUE"));
//			}
			//把数据放到redis中
			if(cache.size()>0){
				//数据字典存放在redis中
//				redisDaoImpl.delete((String)mapDic.get("DIC_CODE"));
//				redisDaoImpl.addMap((String)mapDic.get("DIC_CODE"), treeMap);
				//数据字典存放在内存中
				CacheLoder.memoryTable.remove(mapDic.get("DIC_CODE"));
				CacheLoder.memoryTable.put((String) mapDic.get("DIC_CODE"), cache);
			}
		}
		logAfter(logger);
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map); 
	}
	
	/**得到缓存信息
	 * 参数传递方式  cacheId=01,02,03
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getCache")
	@ResponseBody
	public Object getCache() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取字典");
		PageData pd = this.getPageData();
		List<Map<?, ?>> cacheList = new ArrayList<Map<?, ?>>();
		JSONArray dataJson = JSONArray.parseArray( pd.getString("list").toString());
		if(!dataJson.isEmpty() && dataJson != null ){
			for (int i = 0; i < dataJson.size(); i++) {
				Map <String,Object> map = new HashMap<String, Object>();
		        JSONObject jsonObject = dataJson.getJSONObject(i);
				String chcheId = jsonObject.getString("dictId");
				//从redis中读取数据
//				List<Map<String,String>>  cacheMap = redisDaoImpl.getListMap(chcheId) ;
				//从内存中读取数据
				if(!"".equals(chcheId)&&null!=chcheId){
					List<Map<String,String>>  cacheMap = CacheController.getListMap(chcheId) ;
					map.put("dict", cacheMap);
					map.put("id", jsonObject.getString("id"));
					cacheList.add(map) ;
				}
			}
		}
		return cacheList;
	}
	
	/**获取List<Map>
	 * @param key
	 * @return
	 */	 
	public static List<Map<String,String>> getListMap(String key){
		//存放返回值
		List<Map<String,String>> listMap =  new ArrayList<Map<String,String>>();
		//根据key值获取对应的list值
		List<PageData> list = (List<PageData>) CacheLoder.memoryTable.get(key);
		//获取字典表中数据(表中含有order_by字段)
		if(list.size()>0&&list.get(0).get("ORDER_BY")!=null){
			//存放order_by的值
			List<Integer> listOrder = new ArrayList<Integer>();
			//根据order_by的值存放code和name的map
			Map<Integer,Object> treeMap = new HashMap<Integer,Object>();
			for(int i=0;i<list.size();i++){
				//存放code和name
				Map <String,String> map = new HashMap<String, String>();
				PageData pd = list.get(i);
				map.put(pd.getString("CODE"), pd.getString("VALUE"));
				treeMap.put(Integer.parseInt(pd.get("ORDER_BY").toString()), map);
				listOrder.add(Integer.parseInt(pd.get("ORDER_BY").toString()));
			}
			
			//根据order_by排序
			 Collections.sort(listOrder);
			 //根据有序的order_by获取map
			 for (Integer it:listOrder){ 
				 //获取order_by对应的map
				 Map <String,String> map = (Map<String, String>) treeMap.get(it);
				 Map <String,String> map1 = new HashMap<String, String>();
				 for(String code : map.keySet()){
					 map1.put("key", code);
					 map1.put("value", map.get(code));
				 }
				 listMap.add(map1);
			 }
		}else{//获取其它表中数据
			for(int i=0;i<list.size();i++){
				//存放code和name
				Map <String,String> map = new HashMap<String, String>();
				PageData pd = list.get(i);
				map.put("key", pd.getString("CODE"));
				map.put("value", pd.getString("VALUE"));
				listMap.add(map);
			}
		}
		
		 return listMap;
	}
	
}
