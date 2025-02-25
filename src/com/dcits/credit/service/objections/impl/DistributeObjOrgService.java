package com.dcits.credit.service.objections.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.objections.DistributeObjOrgManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/**
 * 分配异议处理机构
 * @author lenovo
 *
 */
@Service("distributeObjOrgService")
public class DistributeObjOrgService implements DistributeObjOrgManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Override
	public List<PageData> findPerObjResutl(Page page) throws Exception {
		return (List) dao.findForList("DistributeObjOrgMapper.findPerObjResutllistPage", page);
	}

	@Override
	public void saveResult(PageData pd) throws Exception {
		PageData p = findResultById(pd.getString("ID"));
		if(p != null){
			updateResult(pd);
		}else{
			dao.save("DistributeObjOrgMapper.saveResult", pd);
		}
	}

	@Override
	public void saveResultAtt(PageData pd) throws Exception {
		if(findResultAtt(pd) == null){
			dao.save("DistributeObjOrgMapper.saveResultAtt", pd);
		}
	}
	@Override
	public PageData findResultAtt(PageData pd) throws Exception{
		List<PageData> attList = (List) dao.findForList("DistributeObjOrgMapper.findResultAtt", pd);
		if(attList.size()>0) return attList.get(0);
		return null;
	}

	@Override
	public PageData findResultById(String id) throws Exception {
		return (PageData) dao.findForObject("DistributeObjOrgMapper.findResultById", id);
	}

	@Override
	public List<PageData> findResultAttById(String id) throws Exception {
		return (List) dao.findForList("DistributeObjOrgMapper.findResultAttById", id);
	}

	@Override
	public void updateResult(PageData pd) throws Exception {
		dao.update("DistributeObjOrgMapper.updateResult", pd);
	}
	@Override
	public void delAtt(PageData pd) throws Exception{
//		dao.delete("DistributeObjOrgMapper.delAtt", pd);
//		pd = findResultById(pd.getString("ID"));
//		pd.put("ATT_CNT", Integer.parseInt(String.valueOf(pd.get("ATT_CNT")))-1);
//		updateResult(pd);
		dao.update("DistributeObjOrgMapper.updateAtt", pd);
	}
	/**
	 * 分配异议处理机构
	 * @param pd
	 * @throws Exception
	 */
	public void updateHand_ORG(PageData pd) throws Exception{
		dao.update("DistributeObjOrgMapper.updateHand_ORG", pd);
	}
}
