package com.dcits.credit.service.queryStatistics.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;
import com.dcits.credit.service.queryStatistics.PersonRegisterManager;

/** 
 * 说明： 机构查询量统计
 * 创建人：  
 * 创建时间：2017-06-30
 * @version
 */
@Service("PersonRegisterService")
public class PersonRegisterService implements PersonRegisterManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("PersonRegisterMapper.update", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("PersonRegisterMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("PersonRegisterMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		String sign = page.getPd().getString("sign");
		List<PageData>varList = null;
		if(sign.equals("2")) {
			varList = (List<PageData>)dao.findForList("PersonRegisterMapper.findclno", page);
			if(varList.size()>0) {
				int size = varList.size();
				for(int i=0;i<size;i++) {
					String CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO");
					String ID = varList.get(i).getString("ID");
					if(DESUtil.decrypt("enhjeA==", CREDENTIALS_NO).length()>6) {
						CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO).substring(0, 6);
					}else {
						CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
					}
					PageData pd = new PageData();
					pd.put("ID", ID);
					pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
					dao.save("PersonRegisterMapper.updateclno", pd);
				}
			}
			varList = (List<PageData>)dao.findForList("PersonRegisterMapper.datalistPage", page);
		}else {
			varList = (List<PageData>)dao.findForList("PersonRegisterMapper.datalistPage", page);
		}
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			String CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
			varList.get(i).put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		return varList;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listHis(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("PersonRegisterMapper.hisDatalistPage", page);
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			String CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
			varList.get(i).put("CREDENTIALS_NO", CREDENTIALS_NO);
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
		return (List<PageData>)dao.findForList("PersonRegisterMapper.detaillistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonRegisterMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PersonRegisterMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**
	 * 转码
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> findcredType(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonRegisterMapper.findcredType", pd);
	}
	/**所有数据
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("PersonRegisterMapper.listAll", page);
		List<PageData> List = new ArrayList<PageData>();
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			String CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
			varList.get(i).put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		String sign = page.getPd().getString("sign");
		if(sign.equals("2")) {
			for(int i=0;i<size;i++) {
				if(varList.get(i).getString("CREDENTIALS_NO").length()>6) {
					String CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO").substring(0, 6);
					String CREDENTIALSNO = DESUtil.decrypt("enhjeA==", page.getPd().getString("CREDENTIALS_NO"));
					if(CREDENTIALS_NO.equals(CREDENTIALSNO)) {
						List.add(varList.get(i));
						//List = varList.subList(i, i);
					}
				}
			}
			return List;
		}
		return varList;
	}
	@Override
	public List<PageData> findViewById(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonRegisterMapper.findViewById", pd);
	}
	@Override
	public List<PageData> findStatusViewById(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonRegisterMapper.findStatusViewById", pd);
	}
}

