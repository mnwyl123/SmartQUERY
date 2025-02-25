package com.dcits.credit.service.QueryDateOperatorService;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 

 */
public interface QueryDateOperatorManager {
	/**数据列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> QuerylistPage(Page page) throws Exception;
	
	/**新增
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void Save(PageData pd) throws Exception;
	
	/**查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData queryByTypeAndCompany(PageData pd) throws Exception;
	
	/**更新
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void Update(PageData pd) throws Exception;
	
	/**删除
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception;
	/**批量删除
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void deleteAll(Map<String,Object> map) throws Exception;	
	/**
	 * 获取法人下的机构信息
	 * @param company
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getOrgsByCompany(String company) throws Exception;
}
