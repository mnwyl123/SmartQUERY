package com.dcits.credit.service.costManage.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.costManage.CostManageService;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
/**
 * 费用管理ServiceImpl
 * @author wangwenming
 *
 */
@Service("costManageService")
public class CostManageServiceImpl implements CostManageService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 费用对账列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getCRlistPage(Page page) throws Exception {
		return (PageData)dao.findForObject("CostManageMapper.getCRlistPage", page);
	}
	/**
	 * 费用对账计算
	 * @param page
	 * @throws Exception
	 */
	@Override
	public void updateCR(PageData pd) throws Exception {
		List<PageData> date_per = findByFindTime_per(pd);
		List<PageData> date_org = findByFindTime_org(pd);
		if(date_per.size()>0){
			dao.update("CostManageMapper.updateCR_per", pd);
		}else{
			dao.save("CostManageMapper.saveCR_per", pd);
		}
		if(date_org.size()>0){
			dao.update("CostManageMapper.updateCR_org", pd);
		}else{
			dao.save("CostManageMapper.saveCR_org", pd);
		}
	}
	@Override
	public void updateCR_per(PageData pd) throws Exception {
		dao.update("CostManageMapper.updateCR_per", pd);
	}
	@Override
	public void saveCR_per(PageData pd) throws Exception {
		dao.update("CostManageMapper.saveCR_per", pd);
	}
	@Override
	public void updateCR_org(PageData pd) throws Exception {
		dao.update("CostManageMapper.updateCR_org", pd);
	}
	@Override
	public void saveCR_org(PageData pd) throws Exception {
		dao.update("CostManageMapper.saveCR_org", pd);
	}
	
	/**
	 * 根据日期查询个人记录
	 * @param findTime
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> findByFindTime_per(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("CostManageMapper.findByFindTime_per", pd);
	}
	/**
	 * 根据日期查询企业记录
	 * @param findTime
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> findByFindTime_org(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("CostManageMapper.findByFindTime_org", pd);
	}
	/**
	 * 费用分摊明细
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> getCSDlistPage(Page page) throws Exception {
		/*dao.delete("CostManageMapper.delMxTemp1", page);
		dao.delete("CostManageMapper.delMxTemp2", page);
		dao.save("CostManageMapper.addMxTemp1", page);
		dao.save("CostManageMapper.addMxTemp2", page);*/
		return (List<PageData>)dao.findForList("CostManageMapper.getCSDlistPage", page);
	}
	@Override
	public List<PageData> getCSDlistPageHis(Page page) throws Exception {
		return (List<PageData>)dao.findForList("CostManageMapper.hisGetCSDlistPage", page);
	}
	/**
	 * 通过用户所在机构的id 获取 机构名称及所有下属机构名称
	 * @param orgid
	 * @return
	 * @throws Exception 
	 */
	@Override
	public List<String> getAllOrgNameByOrgID(PageData pd) throws Exception {
		return (List<String>)dao.findForList("CostManageMapper.getAllOrgNameByOrgID", pd);
	}
	/**
	 * 获取产品列表
	 * @param 
	 * @return
	 */
	@Override
	public List<String> getAllProduct() throws Exception{
		return (List<String>)dao.findForList("CostManageMapper.getAllProduct",null);
	}
}
