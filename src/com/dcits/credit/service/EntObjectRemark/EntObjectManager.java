package com.dcits.credit.service.EntObjectRemark;

import java.util.List;

import com.dcits.credit.entity.ObjectItem;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：EntObjectManager
 * 说明：企业异议查询
 */
public interface EntObjectManager {
	
	/**待核查主表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listToCheckMainlistPage(Page page)throws Exception;
	/**
	 * 根据法人查询此法人下的所有机构
	 * @param company
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findOrgByCompany(String company) throws Exception;
	/**
	 * 批量分配异议处理机构
	 * @param list
	 * @throws Exception
	 */
	public void batchUpdateOrg(List<ObjectItem> list) throws Exception;
	/**待核查子表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listToCheckSublistPage(Page page)throws Exception;
	/**待核查二级子表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listToCheckSubLastlistPage(Page page)throws Exception;
	/**根据异议事项号和id查询异议事项附件信息
	 * @param page
	 * @throws Exception
	 */
	public PageData findAttrBy(PageData pd)throws Exception;
	/**通过系统用户名获取流程表值
	 * @param str
	 * @throws Exception
	 */
	public PageData findFs(String str)throws Exception;
	/**
	 * 将请求的信息落库
	 * @param pd 
	 * @throws 
	 */
	public void SaveObjectItem(PageData pd) throws Exception;
	/**
	 * 请求信息落流程表
	 * @param pd 
	 * @throws 
	 */
	public void SaveObjFlow(PageData pd) throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubToCheckObjection(PageData pd)throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjection(PageData pd)throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultSubLastToCheckObjection(PageData pd)throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToCheckObjectionEnclosure(PageData pd)throws Exception;
	/**保存异议事项核查结果上报信息
	 * @param page
	 * @throws Exception
	 */
	public void saveCheckResult(PageData pd)throws Exception;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void toCheckObjectionResult(PageData pd)throws Exception;
	/**通过系统用户名获取人行账户信息
	 * @param str
	 * @throws Exception
	 */
	public PageData findPerBankInfo(String str)throws Exception;
	/**
	 * 查询异议处理结果附件信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findResultAtt(PageData pd) throws Exception;
	
	
	/**查询当前请求报文信息 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listObject(Page page) throws Exception;
	/**查询当前用户应答报文信息
	 * @param pd
	 * @return
	 * @throws Exception  
	 */
	public List<PageData> responseReport(Page page) throws Exception;
	/**查询当前用户应答报文历史信息
	 * @param pd
	 * @return
	 * @throws Exception  
	 */
	public List<PageData> toObjectHis(Page page) throws Exception;

	/**反馈企业异议事项核查结果
	 * @param pd
	 * @return
	 * @throws Exception   listObjTransRecordCom
	 */
	public List<PageData> listObjTransRecord(Page page) throws Exception;
	/**
	 * 反馈企业异议事项更正结果
	 * @param page
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> listObjTransCorrect(Page page) throws Exception;
	/**
	 * 反馈企业异议事项更正结果
	 * @param page
	 * @return
	 * @throws Exception  
	 */
	public List<PageData> listObjTransRecCor(Page page) throws Exception;
	/**异议事项更正结果接受
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToObjectionCorrectAccept(PageData pd)throws Exception;
	/**
	 * 添加标注
	 * @param page
	 * @return
	 * @throws Exception  listObjDelete
	 */
	public List<PageData> listObjAddRemark(Page page) throws Exception;
	/**
	 * 删除标注
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listObjDelete(Page page) throws Exception;
	/**
	 * 保存异议事项核查结果上报信息
	 * @param pd
	 */
	public void correctCheckResult(PageData pd) throws Exception;
	/**
	 * 查询异议事项所有上报信息根据条件
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCheckResultBy(PageData pd)throws Exception;
	/**根据添加个人标注
	 * @param page
	 * @throws Exception
	 */
	public PageData findAddRemarkBy(PageData pd)throws Exception;
	/**存入异议信息表请求6
	 * @param pd
	 * @throws Exception
	 */
	public void saveToObjectionInfoSix(PageData pd)throws Exception;
	/**存入流程状态表
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception;
	/**添加企业标注
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultToAddLabel(PageData pd)throws Exception;
	/**修改个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void updatePersonLabel(PageData pd)throws Exception;
	/**删除个人标注列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listDeletePersonLabellistPage(Page page)throws Exception;
	/**删除个人标注信息
	 * @param page
	 * @throws Exception
	 */
	public void deleteEntLabel(PageData pd)throws Exception;
	/**
	 * 修改异议处理结果
	 * @param pd
	 * @throws Exception
	 */
	public void delAtt(PageData pd) throws Exception;
	/**
	 * 查Object是否含有
	 * @param pdXmlMain
	 * @return
	 */
	public PageData selectObjectID(PageData pd)throws Exception;
	/**
	 * 修改
	 * @param 
	 */
	public void toCheckObjectionUpdate(PageData pdXmlMain)throws Exception;
	/**
	 * 修改
	 * @param pd
	 * @throws Exception
	 */
	public void updateResultToObjectionCorrectAccept(PageData pd)throws Exception;
	/**
	 * 查询
	 * @param 
	 * @return
	 * @throws Exception
	 */
	public PageData selectObjectCorrectID(PageData pd)throws Exception;
	/**
	 * 修改
	 */
	public void updateResultToAddLabel(PageData pdXmlMain)throws Exception;
	/**
	 * 修改
	 * @param pd
	 */
	public void updateToObjectionInfoSix(PageData pd)throws Exception;
	/**
	 * 修改
	 * @param pd
	 * @throws Exception
	 */
	public void updateToFs(PageData pd)throws Exception;
}
