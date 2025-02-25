package com.dcits.credit.service.rest;

import java.util.List;
import java.util.Map;

import com.dcits.platform.util.PageData;

import net.sf.json.JSONObject;

/**
 *查看企业信贷接口
 * @author 
 * gaoshenga
 */
public interface EntCreditInterfaceManage {
	/**
	 * 查询系统当前状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findSysStatus(PageData pd)throws Exception;
	/**
	 * 查询渠道信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	PageData findByCHANNELNO(PageData pd) throws Exception;
	/**
	 * 查询所在机构
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findOrg(PageData pd)throws Exception;
	/**
	 * 保存企业信息
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	/**
	 * 保存流程状态
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception;
	/**
	 * 查询征信账户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryAccByUserName(PageData pd) throws Exception;
	/**
	 * 更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception;
	/**查询同一渠道编号渠道流水号是否重复
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByQueryNo(PageData pd)throws Exception;	

}
