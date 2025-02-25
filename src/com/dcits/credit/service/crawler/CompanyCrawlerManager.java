package com.dcits.credit.service.crawler;


import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;

/** 
 * 企业征信报告爬虫
 * 创建人：zhangyy
 */
public interface CompanyCrawlerManager{
	/**新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfo(Map<String,String> map)throws Exception;
	
	/**更新信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateInfo(Map<String,String> map)throws Exception;
	
	
}


