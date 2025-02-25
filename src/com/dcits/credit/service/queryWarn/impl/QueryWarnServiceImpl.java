package com.dcits.credit.service.queryWarn.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.queryWarn.QueryWarnService;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;

@Service("queryWarnService")
public class QueryWarnServiceImpl implements QueryWarnService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	/**
	 * 查询激增情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> surgeInEarlylistPage(Page page) throws Exception {
		PageData pd = page.getPd();
		String flag = pd.getString("flag");
		flag = "";
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			dao.delete("QueryWarnMapper.deletesurgeTEMP", pd);
			dao.delete("QueryWarnMapper.deletesurgeTEMP2", pd);
			dao.update("QueryWarnMapper.savesurgeTEMP", pd);
			dao.update("QueryWarnMapper.savesurgeTEMP2", pd);
			return (List<PageData>)dao.findForList("QueryWarnMapper.surgelistPage", page);
		}else if("2".equals(flag)){ //查询员
			dao.delete("QueryWarnMapper.deletesurgeQueryTEMP", pd);
			dao.delete("QueryWarnMapper.deletesurgeQueryTEMP2", pd);
			dao.update("QueryWarnMapper.savesurgeQueryTEMP", pd);
			dao.update("QueryWarnMapper.savesurgeQueryTEMP2", pd);
			return (List<PageData>)dao.findForList("QueryWarnMapper.surgeQuerylistPage", page);
		}else{
			dao.delete("QueryWarnMapper.deletesurgeInEarlyTEMP", pd);
			dao.delete("QueryWarnMapper.deletesurgeInEarlyTEMP2", pd);
			dao.update("QueryWarnMapper.savesurgeInEarlyTEMP", pd);
			dao.update("QueryWarnMapper.savesurgeInEarlyTEMP2", pd);
			return (List<PageData>)dao.findForList("QueryWarnMapper.surgeInEarlylistPage", page);
		}
	}
	@Override
	public List<PageData> surgeInEarlylistPageHis(Page page) throws Exception {
		PageData pd = page.getPd();
		String flag = pd.getString("flag");
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			return (List<PageData>)dao.findForList("QueryWarnMapper.hisSurgelistPage", page);
		}else if("2".equals(flag)){ //查询员
			return (List<PageData>)dao.findForList("QueryWarnMapper.hisSurgeQuerylistPage", page);
		}else{
			return (List<PageData>)dao.findForList("QueryWarnMapper.hisSurgeInEarlylistPage", page);
		}
	}
	/**
	 * 查询失败占比过大情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> failPercentToLargelistPage(Page page) throws Exception {
		PageData pd = page.getPd();
		String flag = pd.getString("flag");
		flag = "0";
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			dao.delete("QueryWarnMapper.deletefailToLargeTEMP", pd);
			dao.update("QueryWarnMapper.savefailToLargeQueryTEMP", pd);
			return (List<PageData>)dao.findForList("QueryWarnMapper.failToLargelistPage", page);
		}else if("2".equals(flag)){ //查询员
			dao.delete("QueryWarnMapper.deletefailToLargeQueryTEMP", pd);
			dao.update("QueryWarnMapper.savefailToLargeTEMP", pd);
			return (List<PageData>)dao.findForList("QueryWarnMapper.failToLargeQuerylistPage", page);
		}else{
			dao.delete("QueryWarnMapper.deletefailPercentToLargeTEMP", pd);
			dao.update("QueryWarnMapper.savefailPercentToLargeTEMP", pd);
			return (List<PageData>)dao.findForList("QueryWarnMapper.failPercentToLargelistPage", page);
		}
	}
	/**
	 * 非工作时段查询预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> noWorkTimelistPage(Page page) throws Exception {
		List<PageData>varList=new ArrayList<PageData>();
		PageData pd = page.getPd();
		String flag = pd.getString("flag");
		flag = "1";
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			varList = (List<PageData>)dao.findForList("QueryWarnMapper.noWorklistPage", page);
		}else if("2".equals(flag)){ //查询员
			varList =  (List<PageData>)dao.findForList("QueryWarnMapper.noWorkQuerylistPage", page);
		}else{
			varList =  (List<PageData>)dao.findForList("QueryWarnMapper.noWorkTimelistPage", page);
		}
		
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String CERTNO = varList.get(i).getString("CERTNO");
			String CLIENTNAME = varList.get(i).getString("CLIENTNAME");
			CERTNO = DESUtil.decrypt("enhjeA==", CERTNO);
			CLIENTNAME = DESUtil.decrypt("enhjeA==", CLIENTNAME);
			varList.get(i).put("CERTNO", CERTNO);
			varList.get(i).put("CLIENTNAME", CLIENTNAME);
		}
		
		return varList;
	}
	@Override
	public List<PageData> shorttimelistPage(Page page) throws Exception {
		List<PageData>varList=new ArrayList<PageData>();
			varList = (List<PageData>)dao.findForList("QueryWarnMapper.shorttimelistPage", page);
			int size = varList.size();
			for(int i=0;i<size;i++) {
				String CERTNO = varList.get(i).getString("CERTNO");
				String CLIENTNAME = varList.get(i).getString("CLIENTNAME");
				CERTNO = DESUtil.decrypt("enhjeA==", CERTNO);
				CLIENTNAME = DESUtil.decrypt("enhjeA==", CLIENTNAME);
				varList.get(i).put("CERTNO", CERTNO);
				varList.get(i).put("CLIENTNAME", CLIENTNAME);
			}
		return varList;
	}
	/**
	 * 跨地域查询预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> crossRegionlistPage(Page page) throws Exception{
		List<PageData>varList=new ArrayList<PageData>();
		PageData pd = page.getPd();
		String flag = pd.getString("flag");
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			dao.delete("QueryWarnMapper.deleteRegionTEMP", pd);
			varList = (List<PageData>)dao.findForList("QueryWarnMapper.RegiontemplistPage", page);
			int size = varList.size();
			for(int i=0;i<size;i++) {
				String CHINACREDITCODE = varList.get(i).getString("CHINACREDITCODE");
				String CLIENTNAME = varList.get(i).getString("CLIENTNAME");
				CHINACREDITCODE = DESUtil.decrypt("enhjeA==", CHINACREDITCODE);
				CLIENTNAME = DESUtil.decrypt("enhjeA==", CLIENTNAME);
				varList.get(i).put("CHINACREDITCODE", CHINACREDITCODE);
				varList.get(i).put("CLIENTNAME", CLIENTNAME);
				pd = varList.get(i);
				dao.update("QueryWarnMapper.saveRegionTEMP", pd);
			}
			varList = (List<PageData>)dao.findForList("QueryWarnMapper.RegionlistPage", page);
		}else if("2".equals(flag)){ //查询员
			dao.delete("QueryWarnMapper.deleteRegionQueryTEMP", pd);
			varList = (List<PageData>)dao.findForList("QueryWarnMapper.RegionQuerytemplistPage", page);
			int size = varList.size();
			for(int i=0;i<size;i++) {
				String CHINACREDITCODE = varList.get(i).getString("CHINACREDITCODE");
				String CLIENTNAME = varList.get(i).getString("CLIENTNAME");
				CHINACREDITCODE = DESUtil.decrypt("enhjeA==", CHINACREDITCODE);
				CLIENTNAME = DESUtil.decrypt("enhjeA==", CLIENTNAME);
				varList.get(i).put("CHINACREDITCODE", CHINACREDITCODE);
				varList.get(i).put("CLIENTNAME", CLIENTNAME);
				pd = varList.get(i);
				dao.update("QueryWarnMapper.saveRegionTEMP", pd);
			}
			varList = (List<PageData>)dao.findForList("QueryWarnMapper.RegionQuerylistPage", page);
		}else{
			dao.delete("QueryWarnMapper.deletecrossRegionTEMP", pd);
			varList = (List<PageData>)dao.findForList("QueryWarnMapper.crossRegiontemplistPage", page);
			int size = varList.size();
			for(int i=0;i<size;i++) {
				String CHINACREDITCODE = varList.get(i).getString("CHINACREDITCODE");
				String CLIENTNAME = varList.get(i).getString("CLIENTNAME");
				CHINACREDITCODE = DESUtil.decrypt("enhjeA==", CHINACREDITCODE);
				CLIENTNAME = DESUtil.decrypt("enhjeA==", CLIENTNAME);
				varList.get(i).put("CHINACREDITCODE", CHINACREDITCODE);
				varList.get(i).put("CLIENTNAME", CLIENTNAME);
				pd = varList.get(i);
				dao.update("QueryWarnMapper.saveRegionTEMP", pd);
			}
			varList = (List<PageData>)dao.findForList("QueryWarnMapper.crossRegionlistPage", page);
		}
		
		
		return varList;
	}
	/**
	 * 选择其他理由查询占比过大预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> otherReasonlistPage(Page page) throws Exception{
		PageData pd = page.getPd();
		String flag = pd.getString("flag");
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			dao.delete("QueryWarnMapper.deleteotherReaTEMP", pd);
			dao.update("QueryWarnMapper.saveotherReaTEMP", pd);
			return (List<PageData>)dao.findForList("QueryWarnMapper.otherRealistPage", page);
		}else if("2".equals(flag)){ //查询员
			dao.delete("QueryWarnMapper.deleteotherReaQueryTEMP", pd);
			dao.update("QueryWarnMapper.saveotherReaQueryTEMP", pd);
			return (List<PageData>)dao.findForList("QueryWarnMapper.otherReaQuerylistPage", page);
		}else{
			dao.delete("QueryWarnMapper.deleteotherReasonTEMP", pd);
			dao.update("QueryWarnMapper.saveotherReasonTEMP", pd);
			return (List<PageData>)dao.findForList("QueryWarnMapper.otherReasonlistPage", page);
		}
	}

}
