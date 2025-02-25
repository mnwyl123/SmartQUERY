package com.dcits.credit.service.creditAcctManage.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dcits.credit.service.creditAcctManage.CreditAcctManageManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.tree.TreeEntityFactory;

/**说明： 征信账户管理
 * 
 */
@Service("CreditAcctManageService")
public class CreditAcctManageService implements CreditAcctManageManager{

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
		dao.save("CreditAcctManageMapper.insert", pd);
		if(pd.getString("IS_WEB").equals("0")){
			//接口用户要插入到perbank表中
			dao.save("CreditAcctManageMapper.addPerBank", pd);
		}
		
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void savePwd(PageData pd)throws Exception{
		dao.save("CreditAcctManageMapper.insertPwd", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("CreditAcctManageMapper.delete", pd);
	}
	/**删除perbank表中的数据 -
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deletePerBank(PageData pd)throws Exception{
		dao.delete("CreditAcctManageMapper.deletePerBank", pd);
	}
	/**删除web_crawler_info2表中的数据 
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deleteWeb2(PageData pd)throws Exception{
		dao.delete("CreditAcctManageMapper.deleteWeb2", pd);
	}
	/**删除密码表
	 * @param pd
	 * @throws Exception
	 */
	public void deletePwd(PageData pd)throws Exception{
		dao.delete("CreditAcctManageMapper.deletePwd", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void update(PageData pd)throws Exception{
		dao.update("CreditAcctManageMapper.update", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CreditAcctManageMapper.datalistPage", page);
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
	/**修改人行密码 WEB_CRAWLER_INFO2
	 * @param pd
	 * @throws Exception
	 */
	public void pwdUpdate(PageData pd) throws Exception{
		if((PageData)dao.findForObject("CreditAcctManageMapper.findByUN", pd)==null) {
			dao.update("CreditAcctManageMapper.pwdUpdate", pd);
		}else{
			dao.update("CreditAcctManageMapper.updateInfo", pd);
		}
		//（人行加密）
	}
}
