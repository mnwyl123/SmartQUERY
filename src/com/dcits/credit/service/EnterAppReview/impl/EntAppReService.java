package com.dcits.credit.service.EnterAppReview.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.ServerUtil.impl.ServerUtilService;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：EntAppReService
 * 创建人：zhangyy
 * 说明：企业查询申请审核
 */
@Service("entAppReService")
public class EntAppReService implements EntAppReManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(EntAppReService.class);
	
	/**企业查询申请审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listEntAppRe(Page page){
		try {
			return (List<PageData>) dao.findForList("EntAppReMapper.EntAppRelistPage", page);
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
			return (PageData) dao.findForObject("EntAppReMapper.getEntCheck", pd);
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
			return (PageData) dao.findForObject("EntAppReMapper.QueryEntDetail", ID);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**查询需要的数据生成报文
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData EntReportDetail(PageData pd){
//		try {
//			return (PageData) dao.findForObject("EntAppReMapper.EntReportDetail", pd);
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			return null;
//		}
		try {
			PageData page = (PageData) dao.findForObject("EntAppReMapper.EntReportDetail", pd);
			String ENT_NAME = page.getString("ENT_NAME");
			String ENT_CERT_NUM = page.getString("ENT_CERT_NUM");
			ENT_NAME = DESUtil.decrypt("enhjeA==", ENT_NAME);
			ENT_CERT_NUM = DESUtil.decrypt("enhjeA==", ENT_CERT_NUM);
			page.put("ENT_NAME", ENT_NAME);
			page.put("ENT_CERT_NUM", ENT_CERT_NUM);
			return page;
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
			dao.save("EntAppReMapper.saveEntDetail", pd);
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
			dao.update("EntAppReMapper.UpdateCDetailCheck", pd);
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
			return (PageData) dao.findForObject("EntAppReMapper.getOrgCode", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**根据条件查询该客户是否已经被查询过
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData findCompanyByInfo(PageData pd){
		try {
			List<PageData> list = (List)dao.findForList("EntAppReMapper.findCompanyByInfo", pd);
			if(list.size()>0) return list.get(0);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	/**查询报文人行需要的数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PageData QueryReportDetail(PageData pd){
		try {
			return (PageData) dao.findForObject("EntAppReMapper.queryReportDetail", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
}
