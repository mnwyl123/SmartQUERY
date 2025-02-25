package com.dcits.crawl.service.crawler.impl;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;


/** 
 * 企业征信报告爬虫
 * 创建人：zhangyy
 */
@Service("crawlCompanyCrawlerService")
public class CrawlCompanyCrawlerService implements CompanyCrawlerManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfo(Map<String,String> map)throws Exception{
		dao.save("ClawerCompanyCrawlerMapper.saveInfo", map);
	}
	
	/**更新信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateInfo(Map<String,String> map)throws Exception{
		dao.update("ClawerCompanyCrawlerMapper.updateInfo", map);
	}
}

