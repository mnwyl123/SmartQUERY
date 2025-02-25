package com.dcits.crawl.service.EnterAppReview.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;



/** 
 * 类名称：EntAppReService
 * 创建人：zhangyy
 * 说明：企业查询申请审核
 */
@Service("crawlEntAppReService")
public class CrawlEntAppReService implements CrawlEntAppReManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(CrawlEntAppReService.class);
	
	/**企业查询申请审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listEntAppRe(Page page){
		try {
			return (List<PageData>) dao.findForList("ClawerEntAppReMapper.EntAppRelistPage", page);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询企业申请信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData getEntCheck(PageData pd){
		try {
			return (PageData) dao.findForObject("ClawerEntAppReMapper.getEntCheck", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询明细表需要的数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData QueryEntDetail(String ID){
		try {
			return (PageData) dao.findForObject("ClawerEntAppReMapper.QueryEntDetail", ID);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**向明细表中插入数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void saveEntDetail(PageData pd){
		try {
			dao.save("ClawerEntAppReMapper.saveEntDetail", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**更新明细表中查询结果状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void UpdateCDetailCheck(PageData pd){
		try {
			dao.update("ClawerEntAppReMapper.UpdateCDetailCheck", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	/**查询机构编码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData getOrgCode(PageData pd){
		try {
			return (PageData) dao.findForObject("ClawerEntAppReMapper.getOrgCode", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**
	 * 保存企业中证码
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public void saveLoanNo(Map<String, String> pd) throws Exception{
		dao.save("ClawerEntAppReMapper.saveLoanNo", pd);
	}
}
