package com.dcits.platform.service.system.menuGroup.menuGroupmx.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.service.system.menuGroup.menuGroupmx.MenuFunGroupMxManager;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 明细表
 * 创建人：huangzwf
 * 创建时间：2016-11-22
 * @version
 */
@Service("MenuFunGroupmxService")
public class MenuFunGroupMxService implements MenuFunGroupMxManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("MenuFunGroupMxMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("MenuFunGroupMxMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("MenuFunGroupMxMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MenuFunGroupMxMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MenuFunGroupMxMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MenuFunGroupMxMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MenuFunGroupMxMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**查询明细总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCount(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MenuFunGroupMxMapper.findCount", pd);
	}
	/**查组ID是否存在
	 * @param pd
	 * @throws Exception
	 */
	public PageData findFunID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MenuFunGroupMxMapper.findFunID", pd);
	}
	/**查询是否被使用
	 * @param pd
	 * @throws Exception
	 */
	public PageData findMenuCount(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MenuFunGroupMxMapper.findMenuCount", pd);
	}
}

