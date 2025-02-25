package com.dcits.platform.service.system.menu;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Menu;
import com.dcits.platform.entity.system.MenuInfo;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.tree.TreeEntity;


/**说明：MenuService 菜单处理接口
 * @author pengyj fh pengyj
 */
public interface MenuManager {

	/**
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<MenuInfo> listSubMenuByParentId(PageData pd)throws Exception;
	
	/**
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getMenuById(PageData pd) throws Exception;
	
	/**
	 * @param menu
	 * @throws Exception
	 */
	public void saveMenu(PageData pd) throws Exception;
	
	/**
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findMaxId(PageData pd) throws Exception;
	
	/**
	 * @param MENU_ID
	 * @throws Exception
	 */
	public void deleteMenuById(PageData pd) throws Exception;
	
	/**
	 * @param menu
	 * @throws Exception
	 */
	public void edit(PageData pd) throws Exception;
	
	/**
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData editicon(PageData pd) throws Exception;
	
	/**
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<MenuInfo> listAllMenu(String MENU_ID,String company) throws Exception;
	
	/**
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 */
	public List<Menu> listAllMenuQx(String MENU_ID) throws Exception;
		
	public List<TreeEntity> getMenuByUserName(String userName, String company) throws Exception;
	
	public List<MenuInfo> list(Page page)throws Exception;
	public List<String> getRoleIdsByUserName(String userName, String company) throws Exception;
	
	public List<MenuInfo> getAllMenu(String company)throws Exception;

	List<MenuInfo> listSuperSubMenuByParentId(PageData pd)throws Exception;

	public PageData findByCompany(PageData pd)throws Exception;
}
