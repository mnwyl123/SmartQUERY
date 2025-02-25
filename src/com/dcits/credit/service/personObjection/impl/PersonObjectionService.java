package com.dcits.credit.service.personObjection.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import com.dcits.credit.controller.ServerUtilTest.ServerUtilTestController;
import com.dcits.credit.entity.ObjectItem;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.personObjection.PersonObjectionManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;

/** 
 * 个人异议信息
 * 创建人：wangguoxing
 * 创建时间：2019-01-14
 */
@Service("PersonObjectionService")
public class PersonObjectionService implements PersonObjectionManager{
	private static Logger logger = Logger.getLogger(PersonObjectionService.class);
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**通过系统用户名获取人行用户名
	 * @param str
	 * @throws Exception
	 */
	public String findUsernamePerBank(String str)throws Exception{
		return (String)dao.findForObject("PersonObjectionMapper.findUsernamePerBank", str);
	}
	/**通过系统用户名获取人行账户信息
	 * @param str
	 * @throws Exception
	 */
	public PageData findPerBankInfo()throws Exception{
		return (PageData)dao.findForObject("PersonObjectionMapper.findPerBankInfo", null);
	}
	/**通过系统用户名获取人行账户信息
	 * @param str
	 * @throws Exception
	 */
	public PageData findComBankInfo()throws Exception{
		return (PageData)dao.findForObject("PersonObjectionMapper.findComBankInfo", null);
	}
	/**通过人行用户名获取人行密码
	 * @param str
	 * @throws Exception
	 */
	public String findPasswordPerBank(String str)throws Exception{
		return (String)dao.findForObject("PersonObjectionMapper.findPasswordPerBank", str);
	}
	/**通过系统用户名获取流程表值
	 * @param str
	 * @throws Exception
	 */
	public PageData findFs(String str)throws Exception{
		return (PageData)dao.findForObject("PersonObjectionMapper.findFs", str);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjection(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveResultToCheckObjection", pd);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubToCheckObjection(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveResultSubToCheckObjection", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubLastToCheckObjection(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveResultSubLastToCheckObjection", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjectionEnclosure(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveResultToCheckObjectionEnclosure", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void toCheckObjectionResult(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.toCheckObjectionResult", pd);
	}
	/**异议事项更正结果接受
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToObjectionCorrectAccept(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveResultToObjectionCorrectAccept", pd);
	}
	/**添加个人标注
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToAddLabel(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveResultToAddLabel", pd);
	}
	/**修改标注信息
	 * @param pd
	 * @throws Exception
	 */
	public void update_UserId(PageData pd)throws Exception{
		dao.update("PersonObjectionMapper.update_UserId", pd);
	}
	/**存入异议信息表请求1
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoOne(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveToObjectionInfoOne", pd);
	}
	/**存入异议信息表请求2,5
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoTwo(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveToObjectionInfoTwo", pd);
	}
	/**存入异议信息表请求3
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoThree(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveToObjectionInfoThree", pd);
	}
	/**存入异议信息表请求4
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoFour(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveToObjectionInfoFour", pd);
	}
	/**存入异议信息表请求6
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoSix(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveToObjectionInfoSix", pd);
	}
	/**存入异议信息表请求7
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoSeven(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveToObjectionInfoSeven", pd);
	}
	/**存入流程状态表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception{
		dao.save("PersonObjectionMapper.saveToFs", pd);
	}
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception{
		dao.update("PersonObjectionMapper.updateFs", pd);
	}
	/**待核查主表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckMainlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.listToCheckMainlistPage", page);
	}
	/**待核查子表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckSublistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.listToCheckSublistPage", page);
	}
	/**待核查二级子表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckSubLastlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.listToCheckSubLast", page);
	}
	/**待核查附件列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckEnclosurelistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.listToCheckEnclosurelistPage", page);
	}
	/**待核查结果列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listToCheckResultlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.listToCheckResultlistPage", page);
	}
	/**更正结果列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listCorrectlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.listCorrectlistPage", page);
	}
	/**更正结果接受列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listCorrectAcceptlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.listCorrectAcceptlistPage", page);
	}
	/**添加个人标注列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAddPersonLabellistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.listAddPersonLabellistPage", page);
	}
	/**删除个人标注列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listDeletePersonLabellistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.listDeletePersonLabellistPage", page);
	}
	
	/**
	 * 根据法人查询此法人下的所有机构
	 * @param company
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findOrgByCompany(String company) throws Exception{
		return (List<PageData>)dao.findForList("PersonObjectionMapper.findOrgByCompany", company);
	}
	/**
	 * 批量分配异议处理机构
	 * @param list
	 * @throws Exception
	 */
	public void batchUpdateOrg(List<ObjectItem> list) throws Exception{
		dao.batchUpdate("PersonObjectionMapper.batchUpdateOrg", list);
	}
	
	/**根据异议事项号和id查询异议事项附件信息
	 * @param page
	 * @throws Exception
	 */
	public PageData findAttrBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonObjectionMapper.findAttrBy", pd);
	}

	public void saveCheckResult(PageData pd) throws Exception{
		dao.update("PersonObjectionMapper.saveCheckResult", pd);
	}
	/**
	 * 查询更正/核查结果通用应答报文根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findObjectionResultBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonObjectionMapper.findObjectionResultBy", pd);
	}
	/**
	 * 更新更正/核查结果通用应答报文根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateObjectionResultBy(PageData pd)throws Exception{
		 dao.update("PersonObjectionMapper.updateObjectionResultBy", pd);
	}
	/**
	 * 查询异议事项核查结果根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCheckResultBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonObjectionMapper.findObjeReportBy", pd);
	}
	/**
	 * 保存个人异议事项更正结果上报信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void saveCorrectResult(PageData pd)throws Exception{
		dao.update("PersonObjectionMapper.saveCorrectResult", pd);
	}
	/**根据添加个人标注
	 * @param page
	 * @throws Exception
	 */
	public PageData findAddRemarkBy(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonObjectionMapper.findAddRemarkBy", pd);
	}
	/**修改个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void updatePersonLabel(PageData pd)throws Exception{
		dao.update("PersonObjectionMapper.updatePersonLabel", pd);
	}
	/**删除个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void deletePersonLabel(PageData pd)throws Exception{
		dao.delete("PersonObjectionMapper.deletePersonLabel", pd);
	}
	/**删除附件
	 * @param pd
	 * @throws Exception
	 */
	public void delAtt(PageData pd)throws Exception{
		dao.update("PersonObjectionMapper.delAtt", pd);
	}
	/**更新更正结果上报信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateResultToObjectionCorrectAccept(PageData pd)throws Exception{
		dao.update("PersonObjectionMapper.updateResultToObjectionCorrectAccept", pd);
	}
	/**查询更正结果上报信息
	 * @param pd
	 * @throws Exception
	 */
	public PageData findResultToObjectionCorrectAcceptBy(PageData pd)throws Exception{
		return (PageData) dao.findForObject("PersonObjectionMapper.findResultToObjectionCorrectAcceptBy", pd);
	}
	/**修改标注信息(全部)
	 * @param pd
	 * @throws Exception
	 */
	public void update_addRemark(PageData pd)throws Exception{
		dao.update("PersonObjectionMapper.update_addRemark", pd);
	}
	/**修改标注信息(全部) 
	 * @param pd
	 * @throws Exception
	 */
	public PageData find_AddRemarkBy(PageData pd)throws Exception{
		return (PageData) dao.findForObject("PersonObjectionMapper.find_AddRemarkBy", pd);
	}
	public PageData selectObject(PageData pd)throws Exception{
		return (PageData) dao.findForObject("PersonObjectionMapper.selectObject", pd);
	}
}

