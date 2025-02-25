package com.dcits.platform.service.system.menuGroup.menuGroup.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.service.system.menuGroup.menuGroup.MenuFunGroupManager;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 菜单功能组
 * 创建人：huangzwf
 * 创建时间：2016-11-22
 * @version
 */
@Service("MenuFunGroupService")
public class MenuFunGroupService implements MenuFunGroupManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("MenuFunGroupMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("MenuFunGroupMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("MenuFunGroupMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MenuFunGroupMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MenuFunGroupMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MenuFunGroupMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MenuFunGroupMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**通过id和功能组名获取数据
	 * @param pd
	 * @throws Exception
	 */
	public String findByIdAndName(PageData pd)throws Exception{
		return (String)dao.findForObject("MenuFunGroupMapper.findByIdAndName", pd);
	}
}

