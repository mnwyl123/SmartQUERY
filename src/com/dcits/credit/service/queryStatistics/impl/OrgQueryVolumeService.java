package com.dcits.credit.service.queryStatistics.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;
import com.dcits.credit.service.queryStatistics.OrgQueryVolumeManager;

/** 
 * 说明： 机构查询量统计
 * 创建人：  
 * 创建时间：2017-06-30
 * @version
 */
@Service("OrgQueryVolumeService")
public class OrgQueryVolumeService implements OrgQueryVolumeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("OrgQueryVolumeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("OrgQueryVolumeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("OrgQueryVolumeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		PageData pd = page.getPd();
		String flag = pd.getString("flag");
		flag = "";
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			return (List<PageData>)dao.findForList("OrgQueryVolumeMapper.dataCheckUserlistPage", page);
		}else if("2".equals(flag)){ //查询员
			return (List<PageData>)dao.findForList("OrgQueryVolumeMapper.dataQueryUserlistPage", page);
		}else{
			return (List<PageData>)dao.findForList("OrgQueryVolumeMapper.datalistPage", page);
		}
		//return (List<PageData>)dao.findForList("OrgQueryVolumeMapper.datalistPage", page);
	}
	
	/**列表(详情)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> detailList(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("OrgQueryVolumeMapper.detaillistPage", page);
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			String CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
			varList.get(i).put("CREDENTIALS_NO", CREDENTIALS_NO);
			
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
	public List<PageData> detailListHis(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("OrgQueryVolumeMapper.hisDetaillistPage", page);
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			String CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
			varList.get(i).put("CREDENTIALS_NO", CREDENTIALS_NO);
			
			String COMPANY_NAME = varList.get(i).getString("COMPANY_NAME");
			String CHINA_CREDIT_CODE = varList.get(i).getString("CHINA_CREDIT_CODE");
			COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
			CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
			varList.get(i).put("COMPANY_NAME", COMPANY_NAME);
			varList.get(i).put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		}
		return varList;
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrgQueryVolumeMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("OrgQueryVolumeMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

