package com.dcits.credit.service.queryStatistics.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.queryStatistics.CompanyRegisterManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 企业征信登记簿
 * 创建人：  
 * 创建时间：2017-06-30
 * @version
 */
@Service("CompanyRegisterService")
public class CompanyRegisterService implements CompanyRegisterManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("CompanyRegisterMapper.update", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("CompanyRegisterMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("CompanyRegisterMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("CompanyRegisterMapper.datalistPage", page);
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String COMPANY_NAME = varList.get(i).getString("COMPANY_NAME");
			String CHINA_CREDIT_CODE = varList.get(i).getString("CHINA_CREDIT_CODE");
			COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
			CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
			varList.get(i).put("COMPANY_NAME", COMPANY_NAME);
			varList.get(i).put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		}
		return varList;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listHis(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("CompanyRegisterMapper.hisDatalistPage", page);
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String COMPANY_NAME = varList.get(i).getString("COMPANY_NAME");
			String CHINA_CREDIT_CODE = varList.get(i).getString("CHINA_CREDIT_CODE");
			COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
			CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
			varList.get(i).put("COMPANY_NAME", COMPANY_NAME);
			varList.get(i).put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		}
		return varList;
	}
	
	/**列表(详情)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> detailList(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CompanyRegisterMapper.detaillistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CompanyRegisterMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CompanyRegisterMapper.deleteAll", ArrayDATA_IDS);
	}
	/**导出
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("CompanyRegisterMapper.listAll", page);
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String COMPANY_NAME = varList.get(i).getString("COMPANY_NAME");
			String CHINA_CREDIT_CODE = varList.get(i).getString("CHINA_CREDIT_CODE");
			COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
			CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
			varList.get(i).put("COMPANY_NAME", COMPANY_NAME);
			varList.get(i).put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		}
		return varList;
	}
}

