package com.dcits.credit.service.ServerUtil;

import java.util.List;

import net.sf.json.JSONObject;

import com.dcits.platform.util.PageData;

/** 
 * 人行征信系统接口
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
public interface ServerUtilManager{

	//返回json数据
	public JSONObject returnCrawlerInfo(PageData pd);
	
	//返回json数据
	public JSONObject CreateJsonData(PageData pd);
	
	//返回json数据
	public JSONObject getJsonData(PageData pd);
	
	
}


