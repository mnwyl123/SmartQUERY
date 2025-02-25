package com.dcits.credit.service.EntObjectRemark.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.entity.ObjectItem;
import com.dcits.credit.service.EntObjectRemark.EntObjectManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：QuerySetService
 * 创建人：zhangyy
 * 说明：
 */
@Service("entObjectService")
public class EntObjectService implements EntObjectManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(EntObjectService.class);
	
	
	/**待核查主表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckMainlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("EntObjectMapper.listToCheckMainlistPage", page);
	}
	/**
	 * 根据法人查询此法人下的所有机构
	 * @param company
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findOrgByCompany(String company) throws Exception{
		return (List<PageData>)dao.findForList("EntObjectMapper.findOrgByCompany", company);
	}
	/**
	 * 批量分配异议处理机构
	 * @param list
	 * @throws Exception
	 */
	public void batchUpdateOrg(List<ObjectItem> list) throws Exception{
		dao.batchUpdate("EntObjectMapper.batchUpdateOrg", list);
	}
	/**待核查子表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckSublistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("EntObjectMapper.listToCheckSublistPage", page);
	}
	/**待核查二级子表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckSubLastlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("EntObjectMapper.listToCheckSubLast", page);
	}
	/**根据异议事项号和id查询异议事项附件信息
	 * @param page
	 * @throws Exception
	 */
	public PageData findAttrBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("EntObjectMapper.findAttrBy", pd);
	}
	/**通过系统用户名获取流程表值
	 * @param str
	 * @throws Exception
	 */
	public PageData findFs(String str)throws Exception{
		return (PageData)dao.findForObject("EntObjectMapper.findFs", str);
	}
	/**
	 * 落企业信息表
	 * @param pd
	 * @throws Exception  
	 */
	public void SaveObjectItem(PageData pd) throws Exception{
		dao.save("EntObjectMapper.SaveObjectItem", pd);
	}
	/**
	 * 落流程状态表
	 * @param pd
	 * @throws   
	 */
	public void SaveObjFlow(PageData pd) throws Exception{
		dao.save("EntObjectMapper.SaveObjFlow", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubToCheckObjection(PageData pd)throws Exception{
		dao.save("EntObjectMapper.saveResultSubToCheckObjection", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjection(PageData pd)throws Exception{
		dao.save("EntObjectMapper.saveResultToCheckObjection", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubLastToCheckObjection(PageData pd)throws Exception{
		dao.save("EntObjectMapper.saveResultSubLastToCheckObjection", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjectionEnclosure(PageData pd)throws Exception{
		dao.save("EntObjectMapper.saveResultToCheckObjectionEnclosure", pd);
	}
	/**
	 * 保存异议核查信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveCheckResult(PageData pd) throws Exception{
		dao.update("EntObjectMapper.saveCheckResult", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void toCheckObjectionResult(PageData pd)throws Exception{
		dao.save("EntObjectMapper.toCheckObjectionResult", pd);
	}
	/**通过系统用户名获取人行账户信息
	 * @param str
	 * @throws Exception
	 */
	public PageData findPerBankInfo(String str)throws Exception{
		return (PageData)dao.findForObject("EntObjectMapper.findPerBankInfo", str);
	}
	@Override
	public PageData findResultAtt(PageData pd) throws Exception{
		List<PageData> attList = (List) dao.findForList("EntObjectMapper.findResultAtt", pd);
		if(attList.size()>0) return attList.get(0);
		return null;
	}
	
	
	
	/**查询次数设置列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listObject(Page page) throws Exception{
			return (List<PageData>) dao.findForList("EntObjectMapper.listObjectlistPage", page);
	}
	/**
	 * 查询当前用户应答报文信息
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> responseReport(Page page) throws Exception {
		 return (List<PageData>) dao.findForList("EntObjectMapper.responseReportlistPage", page);
	}
	/**
	 * 查询当前用户应答报文历史信息  listObjAccess
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> toObjectHis(Page page) throws Exception {
		 return (List<PageData>) dao.findForList("EntObjectMapper.toObjectHislistPage", page);
	}
	

	/**
	 * 3.反馈企业异议事项核查结果   
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listObjTransRecord(Page page) throws Exception {
		 return (List<PageData>) dao.findForList("EntObjectMapper.listObjTransRecordlistPage", page);
	}
	/**
	 * 反馈企业异议事项更正结果 
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listObjTransCorrect(Page page) throws Exception {
		 return (List<PageData>) dao.findForList("EntObjectMapper.listObjTransCorrectlistPage", page);
	}
	/**
	 * 反馈企业异议事项更正结果接受情况
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listObjTransRecCor(Page page) throws Exception {
		 return (List<PageData>) dao.findForList("EntObjectMapper.listObjTransRecCorlistPage", page);
	}
	/**异议事项更正结果接受
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToObjectionCorrectAccept(PageData pd)throws Exception{
		dao.save("EntObjectMapper.saveResultToObjectionCorrectAccept", pd);
	}
	/**
	 * 添加标注  
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listObjAddRemark(Page page) throws Exception {
		 return (List<PageData>) dao.findForList("EntObjectMapper.listObjAddRemarklistPage", page);
	}
	/**
	 * 删除企业标注
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listObjDelete(Page page) throws Exception {
		 return (List<PageData>) dao.findForList("EntObjectMapper.listObjDeletelistPage", page);
	}
	/**
	 * 保存异议核查结果信息
	 */
	@Override
	public void correctCheckResult(PageData pd) throws Exception {
		dao.update("EntObjectMapper.correctCheckResult", pd);
		
	}
	/**
	 * 查询异议事项核查结果根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCheckResultBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("EntObjectMapper.findObjeReportBy", pd);
	}
	/**根据添加企业标注
	 * @param page
	 * @throws Exception
	 */
	public PageData findAddRemarkBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("EntObjectMapper.findAddRemarkBy", pd);
	}
	/**存入异议信息表请求6
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoSix(PageData pd)throws Exception{
		dao.save("EntObjectMapper.saveToObjectionInfoSix", pd);
	}
	/**存入流程状态表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception{
		dao.save("EntObjectMapper.saveToFs", pd);
	}
	/**添加个人标注
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToAddLabel(PageData pd)throws Exception{
		dao.save("EntObjectMapper.saveResultToAddLabel", pd);
	}
	/**修改个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void updatePersonLabel(PageData pd)throws Exception{
		dao.update("EntObjectMapper.updatePersonLabel", pd);
	}
	/**删除企业标注列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listDeletePersonLabellistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("EntObjectMapper.listDeletePersonLabellistPage", page);
	}
	/**删除个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void deleteEntLabel(PageData pd)throws Exception{
		dao.delete("EntObjectMapper.deleteEntLabel", pd);
	}
	@Override
	public void delAtt(PageData pd) throws Exception{
		dao.update("EntObjectMapper.updateAtt", pd);
	}
	@Override
	public PageData selectObjectID(PageData pd) throws Exception{
		return (PageData)dao.findForObject("EntObjectMapper.selectObjectID", pd);
	}
	@Override
	public void toCheckObjectionUpdate(PageData pd) throws Exception {
		dao.update("EntObjectMapper.toCheckObjectionUpdate", pd);
		
	}
	/**
	 * 更新
	 */
	@Override
	public void updateResultToObjectionCorrectAccept(PageData pd) throws Exception {
		dao.update("EntObjectMapper.updateResultToObjectionCorrectAccept", pd);
	}
	/**
	 * 查询是否含有重复的更改结果  
	 */
	@Override
	public PageData selectObjectCorrectID(PageData pd) throws Exception{
		return (PageData)dao.findForObject("EntObjectMapper.selectObjectCorrectID", pd);
	}
	/**
	 * 
	 */
	@Override
	public void updateResultToAddLabel(PageData pd) throws Exception {
		dao.update("EntObjectMapper.updateResultToAddLabel", pd);
	}
	@Override
	public void updateToObjectionInfoSix(PageData pd) throws Exception {
		dao.update("EntObjectMapper.updateToObjectionInfoSix", pd);
	}
	@Override
	public void updateToFs(PageData pd) throws Exception {
		dao.update("EntObjectMapper.updateToFs", pd);
	}
}
