package com.dcits.platform.service.system.fhsms.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.service.system.fhsms.FhsmsManager;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 站内信
 * 创建人：  
 * 创建时间：2016-01-17
 * @version
 */
@Service("fhsmsService")
public class FhsmsService implements FhsmsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("FhsmsMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("FhsmsMapper.delete", pd);
	}
	
	/**修改状态
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("FhsmsMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("FhsmsMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("FhsmsMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("FhsmsMapper.findById", pd);
	}
	
	/**获取未读总数
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findFhsmsCount(String USERNAME)throws Exception{
		return (PageData)dao.findForObject("FhsmsMapper.findFhsmsCount", USERNAME);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("FhsmsMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**批量发信
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public List<PageData>  findAllByID(String[] smsData)throws Exception{
		return (List<PageData>)dao.findForList("FhsmsMapper.findAllByID", smsData);
	}
	/**查询用户是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<String> findUser(PageData pd)throws Exception{
		return (List<String>)dao.findForList("FhsmsMapper.findUser", pd);
	}
	
}

