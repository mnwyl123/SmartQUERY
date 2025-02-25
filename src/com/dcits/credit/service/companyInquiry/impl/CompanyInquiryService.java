package com.dcits.credit.service.companyInquiry.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.companyInquiry.CompanyInquiryManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 企业征信查询申请
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
@Service("CompanyInquiryService")
public class CompanyInquiryService implements CompanyInquiryManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CompanyInquiryMapper.save", pd);
	}
	/**存入流程状态表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception{
		dao.save("CompanyInquiryMapper.saveToFs", pd);
	}
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("CompanyInquiryMapper.delete", pd);
	}
	/**删除流程表
	 * @param pd
	 * @throws Exception
	 */
	public void deleteFs(PageData pd)throws Exception{
		dao.delete("CompanyInquiryMapper.deleteFs", pd);
	}
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception{
		dao.update("CompanyInquiryMapper.update", pd);
	}
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception{
		dao.update("CompanyInquiryMapper.updateFs", pd);
	}
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		PageData pd = page.getPd();
		String flag = pd.getString("isHistory");
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			return (List<PageData>)dao.findForList("CompanyInquiryMapper.datalistPage", page);
		}else{
			return (List<PageData>)dao.findForList("CompanyInquiryMapper.historyDatalistPage", page);
		}
	}
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listHis(Page page)throws Exception{
		PageData pd = page.getPd();
		String flag = pd.getString("isHistory");
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			return (List<PageData>)dao.findForList("CompanyInquiryMapper.hisdatalistPage", page);
		}else{
			return (List<PageData>)dao.findForList("CompanyInquiryMapper.queryhistoryDatalistPage", page);
		}
	}	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CompanyInquiryMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CompanyInquiryMapper.findById", pd);
	}
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByIdHis(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CompanyInquiryMapper.findByIdHis", pd);
	}
	/**获取查询编码
	 * @param pd
	 * @throws Exception
	 */
	public PageData findId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CompanyInquiryMapper.findId", pd);
	}
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CompanyInquiryMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**通过id和功能组名获取数据
	 * @param pd
	 * @throws Exception
	 */
	public String findByIdAndName(PageData pd)throws Exception{
		return (String)dao.findForObject("CompanyInquiryMapper.findByIdAndName", pd);
	}
	
	/**提交申请
	 * @param pd
	 * @throws Exception
	 */
	public void updateStatus(PageData pd)throws Exception{
		dao.update("CompanyInquiryMapper.updateStatus", pd);
	}
}

