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
public interface PerCreditInterfaceManage {
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
	/**
	 * 查询同一渠道编号渠道流水号是否重复
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByQueryNo(PageData pd)throws Exception;
	/**
	 * 通过流水号更新流程状态表
	 * @param list
	 * @throws Exception
	 */
	public void updateByChannel(PageData pd)throws Exception;
	public void updateByDate(PageData pd)throws Exception;
	/**通过流水号查找查询编号
	 * @param list
	 * @throws Exception
	 */
	public List<PageData> findByChannel(PageData pd)throws Exception;
	/**通过时间姓名身份证号查找查询编号
	 * @param list
	 * @throws Exception
	 */
	public List<PageData> findByDATE(PageData pd)throws Exception;
	/**判断次url是否已经插入
	 * @param list
	 * @throws Exception
	 */
	public List<PageData> findURLChannel(PageData pd)throws Exception;
	/**判断次文件是否已经读取
	 * @param list
	 * @throws Exception
	 */
	public List<PageData> findByFile(PageData pd)throws Exception;
	public void deleteIdUrl(PageData pd)throws Exception;
	/**判断次文件是否已经读取
	 * @param list
	 * @throws Exception
	 */
	public List<PageData> findByFileData(PageData pd)throws Exception;
	public void deleteUrlData(PageData pd)throws Exception;
	/**判断次文件是否已经读取
	 * @param list
	 * @throws Exception
	 */
	public List<PageData> findByFileHistData(PageData pd)throws Exception;
	public void deleteUrlHistData(PageData pd)throws Exception;
	
	public List<PageData> findByCIP(PageData pd)throws Exception;
	public void updateCIP(PageData pd)throws Exception;
	/**更新影像资料数据表
	 * @param list
	 * @throws Exception
	 */
	public void updateURLDATA(PageData pd)throws Exception;
	/**更新影像资料历史数据表
	 * @param list
	 * @throws Exception
	 */
	public void updateURLHISTDATA(PageData pd)throws Exception;
}
