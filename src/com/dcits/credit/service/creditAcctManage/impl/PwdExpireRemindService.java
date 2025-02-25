package com.dcits.credit.service.creditAcctManage.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.creditAcctManage.PwdExpireRemindManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.tree.TreeEntityFactory;

/**说明： 密码到期提醒
 * 
 */
@Service("PwdExpireRemindService")
public class PwdExpireRemindService implements PwdExpireRemindManager{

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
		dao.save("PwdExpireRemindMapper.insert", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void savePwd(PageData pd)throws Exception{
		dao.save("PwdExpireRemindMapper.insertPwd", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("PwdExpireRemindMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void update(PageData pd)throws Exception{
		dao.update("PwdExpireRemindMapper.update", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PwdExpireRemindMapper.datalistPage", page);
	}
	/**列表
	 * @param map
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> queryExpireAccount(Map map)throws Exception{
		return (List<PageData>)dao.findForList("PwdExpireRemindMapper.queryExpireAccount", map);
	}
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CreditAcctManageMapper.findById", pd);
	}
	
	/**通过编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByBianma(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CreditAcctManageMapper.findByBianma", pd);
	}
	/**列表
	 * @param map
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> queryhistAccount(Map map)throws Exception{
		return (List<PageData>)dao.findForList("PwdExpireRemindMapper.queryhistAccount", map);
	}
	@Override
	public void saveY5(Map map)throws Exception{
		dao.update("PwdExpireRemindMapper.saveY5", map);
	}
	@Override
	public void saveM24(Map map)throws Exception{
		dao.update("PwdExpireRemindMapper.saveM24", map);
	}
	@Override
	public void savepld(Map map)throws Exception{
		dao.update("PwdExpireRemindMapper.savepld", map);
	}
	@Override
	public void delY5(Map map)throws Exception{
		dao.update("PwdExpireRemindMapper.delY5", map);
	}
	@Override
	public void delM24(Map map)throws Exception{
		dao.update("PwdExpireRemindMapper.delM24", map);
	}
	@Override
	public void delpld(Map map)throws Exception{
		dao.update("PwdExpireRemindMapper.delpld", map);
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> querySyncAccount(Map map)throws Exception{
		return (List<PageData>)dao.findForList("PwdExpireRemindMapper.querySyncAccount", map);
	}
}
