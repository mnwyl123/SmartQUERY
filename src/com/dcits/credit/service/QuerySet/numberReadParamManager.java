package com.dcits.credit.service.QuerySet;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

public interface numberReadParamManager {
	/**
	 * 获取参数列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> paramList(Page page) throws Exception;
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
	
	public PageData queryByPARAM(PageData pd) throws Exception;
	
}
