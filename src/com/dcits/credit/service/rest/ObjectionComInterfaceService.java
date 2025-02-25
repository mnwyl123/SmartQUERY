package com.dcits.credit.service.rest;

import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;

import net.sf.json.JSONObject;

/**
 *查看企业接口
 * @author 
 */
public interface ObjectionComInterfaceService {
	/**新增获取待核查异议事项
	 * @param pd
	 * @return
	 * @throws Exception	
	 */
	public void SaveObjCheckItem(PageData pd) throws Exception;
	/**新增异议企业信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void SaveObjCheckItemCom(PageData pd) throws Exception;
	/**新增异议历史审核信息
	 * @param pd
	 * @return
	 * @throws Exception	
	 */
	public void SaveObjCheckItemHis(PageData pd) throws Exception;
	/**查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception  SaveObjInfo
	 */
	public PageData queryUserByUserName(PageData pd) throws Exception;
	/**
	 * 将请求的信息落库
	 * @param pd queryCreditAcc
	 * @throws 
	 */
	public void SaveObjInfo(PageData pd) throws Exception;
	/**
	 * 将请求的信息落库
	 * @param pd 
	 * @throws 
	 */
	public void SaveObjectItem(PageData pd) throws Exception;
	/**查询用户信息
	 * @param pd
	 * @return
	 * @throws Exception  
	 */
	public PageData queryCreditAcc(PageData pd) throws Exception;
	/**更新流程信息 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateFlowTable(PageData pd) throws Exception;
	/**
	 * 将请求的信息落库
	 * @param pd 
	 * @throws 
	 */
	public void saveCheckInfo(PageData pd) throws Exception;
	/**
	 * 将请求的信息落库
	 * @param pd  
	 * @throws 
	 */
	public void saveUniverInfo(PageData pd) throws Exception;
	/**
	 * 将请求的信息落库
	 * @param pd   saveRemarkInfo
	 * @throws 
	 */
	public void saveUpdateInfo(PageData pd) throws Exception;
	/**
	 * 将请求的信息落库
	 * @param pd   saveRemarkInfo
	 * @throws 
	 */
	public void saveRemarkInfo(PageData pd) throws Exception;
}
