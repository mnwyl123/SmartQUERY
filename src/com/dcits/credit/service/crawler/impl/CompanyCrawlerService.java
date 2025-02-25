package com.dcits.credit.service.crawler.impl;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.crawler.CompanyCrawlerManager;
import com.dcits.platform.dao.DaoSupport;

/** 
 * 企业征信报告爬虫
 * 创建人：zhangyy
 */
@Service("companyCrawlerService")
public class CompanyCrawlerService implements CompanyCrawlerManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfo(Map<String,String> map)throws Exception{
		dao.save("CompanyCrawlerMapper.saveInfo", map);
	}
	
	/**更新信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateInfo(Map<String,String> map)throws Exception{
		dao.update("CompanyCrawlerMapper.updateInfo", map);
	}
}

