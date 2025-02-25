package com.dcits.credit.service.keyCustMaintain.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.keyCustMaintain.KeyCustMaintainManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.tree.TreeEntityFactory;

/**说明： 重点关注客户维护
 * 
 */
@Service("KeyCustMaintainService")
public class KeyCustMaintainService implements  KeyCustMaintainManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Autowired
	private TreeEntityFactory treeEntityFactory;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("KeyCustMaintainMapper.insert", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("KeyCustMaintainMapper.delete", pd);
	}
	/**删除密码表
	 * @param pd
	 * @throws Exception
	 */
	public void deletePwd(PageData pd)throws Exception{
		dao.delete("KeyCustMaintainMapper.deletePwd", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void update(PageData pd)throws Exception{
		dao.update("KeyCustMaintainMapper.update", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("KeyCustMaintainMapper.datalistPage", page);
	}
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("KeyCustMaintainMapper.findById", pd);
	}
	
	/**通过编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByBianma(PageData pd)throws Exception{
		return (PageData)dao.findForObject("KeyCustMaintainMapper.findByBianma", pd);
	}
	/**获取重点关注客户编号
	 * @param pd
	 * @throws Exception
	 */
	public PageData findId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("KeyCustMaintainMapper.findId", pd);
	}
}
