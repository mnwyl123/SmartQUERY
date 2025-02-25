package com.dcits.credit.service.QuerySet;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

public interface ParamManager {
	/**
	 * 获取参数列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> paramList(Page page) throws Exception;
	
	public PageData queryByPARAM(PageData pd) throws Exception;
	/**
	 * 新增
	 * @param pd
	 */
	public void saveP(PageData pd) throws Exception;
	/**
	 * 修改
	 * @param pd
	 */
	public void updateP(PageData pd) throws Exception;
	/**
	 * 删除
	 * @param pd
	 */
	public void deleteP(PageData pd) throws Exception;
	
	/**
	 * 查询系统参数列表
	 * @param pd
	 */
	public List<PageData> sysParamList(Page page) throws Exception;
	
	/**
	 * 保存系统参数
	 * @param pd
	 */
	public void saveSysP(PageData pd) throws Exception;
	/**
	 * 修改系统参数
	 * @param pd
	 */
	public void updateSysP(PageData pd) throws Exception;
	/**
	 * 删除系统参数
	 * @param pd
	 */
	public void deleteSysP(PageData pd) throws Exception;
	/**
	 * 根据系统参数ID查询参数
	 * @param pd
	 */
	public PageData hasSysP(PageData pd) throws Exception;
	/**
	 * 根据系统参数编码查询参数
	 * @param pd
	 */
	public PageData hasSysByCode(PageData pd) throws Exception;
}
