package com.dcits.credit.service.rest.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.rest.ObjectionComInterfaceService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 查看企业接口
 * @author 
 */
@Service("ObjectionComInterfaceService")
public class ObjectionComInterfaceImpl implements ObjectionComInterfaceService {
	private static Logger logger = Logger.getLogger(ObjectionComInterfaceImpl.class);
	@Resource(name="daoSupport")
	private  DaoSupport dao;
	
	
	/**
	 * 新增获取待核查异议事项
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	@Override
	public void SaveObjCheckItem(PageData pd) throws Exception {
			dao.save("ObjCheckItem.SaveCheckItem", pd);
	}
	/**
	 * 新增异议企业信息
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	@Override
	public void SaveObjCheckItemCom(PageData pd) throws Exception {
			dao.save("ObjCheckItem.SaveObjCheckItemCom", pd);
	}
	/**
	 * 新增异议历史信息
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	@Override
	public void SaveObjCheckItemHis(PageData pd) throws Exception {
			dao.save("ObjCheckItem.SaveObjCheckItemHis", pd);
	}
	/**
	 *查询需要的数据
	 */
	@Override
	public PageData queryUserByUserName(PageData pd) throws Exception {
			return (PageData) dao.findForObject("ObjCheckItem.queryUserByUserName", pd);
	}
	/**
	 * 落流程状态表
	 * @param pd
	 * @throws Exception  
	 */
	public void SaveObjInfo(PageData pd) throws Exception{
			dao.save("ObjCheckItem.SaveObjInfo", pd);
	}
	/**
	 * 落企业信息表
	 * @param pd
	 * @throws Exception  
	 */
	public void SaveObjectItem(PageData pd) throws Exception{
			dao.save("ObjCheckItem.SaveObjectItem", pd);
	}
	/**
	 *查询需要的数据    
	 */
	@Override
	public PageData queryCreditAcc(PageData pd) throws Exception {
			return (PageData) dao.findForObject("ObjCheckItem.queryCreditAcc", pd);
	}
	/**
	 * 查询成功修改状态表的状态  SaveCheckInfo
	 */
	@Override
	public void updateFlowTable(PageData pd) throws Exception {
			dao.update("ObjCheckItem.updateFlowTable", pd);
	}
	/**
	 * 将请求的异议信息落库
	 * @param pd
	 * @throws Exception  
	 */
	public void saveCheckInfo(PageData pd) throws Exception{
			dao.save("ObjCheckItem.saveCheckInfo", pd);
	}
	/**
	 * 将通用应答报文落库
	 * @param pd
	 * @throws Exception  
	 */
	public void saveUniverInfo(PageData pd) throws Exception{
			dao.save("ObjCheckItem.saveUniverInfo", pd);
	}
	/**
	 * 将企业异议的更改情况落库
	 * @param pd
	 * @throws Exception  
	 */
	public void saveUpdateInfo(PageData pd) throws Exception{
			dao.save("ObjCheckItem.saveUpdateInfo", pd);
	}
	/**
	 * 将企业异议的更改情况落库
	 * @param pd
	 * @throws Exception  
	 */
	public void saveRemarkInfo(PageData pd) throws Exception{
			dao.save("ObjCheckItem.saveRemarkInfo", pd);
	}
	
}
