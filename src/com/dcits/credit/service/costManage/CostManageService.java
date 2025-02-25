package com.dcits.credit.service.costManage;

import java.util.List;
import java.util.Set;

import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/**
 * 费用管理Service
 * @author wangwenming
 *
 */
public interface CostManageService {
	/**
	 * 费用对账列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData getCRlistPage(Page page) throws Exception;
	/**
	 * 费用对账计算
	 * @param page
	 * @throws Exception
	 */
	public void updateCR(PageData pd) throws Exception;
	public void updateCR_per(PageData pd) throws Exception;
	public void saveCR_per(PageData pd) throws Exception;
	public void updateCR_org(PageData pd) throws Exception;
	public void saveCR_org(PageData pd) throws Exception;
	/**
	 * 根据日期查询个人记录
	 * @param findTime
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByFindTime_per(PageData pd) throws Exception;
	/**
	 * 根据日期查询企业记录
	 * @param findTime
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByFindTime_org(PageData pd) throws Exception;
	/**
	 * 费用分摊明细
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCSDlistPage(Page page) throws Exception;
	public List<PageData> getCSDlistPageHis(Page page) throws Exception;
	/**
	 * 通过用户所在机构的id 获取 机构名称及所有下属机构名称
	 * @param orgid
	 * @return
	 */
	public List<String> getAllOrgNameByOrgID(PageData pd) throws Exception;
	/**
	 * 获取产品列表
	 * @param 
	 * @return
	 */
	public List<String> getAllProduct() throws Exception;
	
}
