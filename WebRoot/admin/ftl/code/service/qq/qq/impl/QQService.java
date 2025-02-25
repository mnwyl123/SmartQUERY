/*package com.dcits.crawl.service.qq.qq.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.service.qq.qq.QQManager;

*//** 
 * 说明： qq
 * 创建人：  
 * 创建时间：2016-10-28
 * @version
 *//*
@Service("qqService")
public class QQService implements QQManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	*//**新增
	 * @param pd
	 * @throws Exception
	 *//*
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("QQMapper.save", pd);
	}
	
	*//**删除
	 * @param pd
	 * @throws Exception
	 *//*
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("QQMapper.delete", pd);
	}
	
	*//**修改
	 * @param pd
	 * @throws Exception
	 *//*
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("QQMapper.edit", pd);
	}
	
	*//**列表
	 * @param page
	 * @throws Exception
	 *//*
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("QQMapper.datalistPage", page);
	}
	
	*//**列表(全部)
	 * @param pd
	 * @throws Exception
	 *//*
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("QQMapper.listAll", pd);
	}
	
	*//**通过id获取数据
	 * @param pd
	 * @throws Exception
	 *//*
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("QQMapper.findById", pd);
	}
	
	*//**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 *//*
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("QQMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

*/