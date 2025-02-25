package com.dcits.platform.service.system.company;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.MenuInfo;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.PageData;


/** 用户接口类
 * @author pengyj fhpengyj (pengyj)
 * 修改时间：2015.11.2
 */
public interface CompanyManager {
	/**法人列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listCompanys(Page page)throws Exception;
	
	/**通过COMP_CODE获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByCompCode(PageData pd)throws Exception;
	/**保存法人
	 * @param pd
	 * @throws Exception
	 */
	public void saveC(PageData pd)throws Exception;
	/**修改法人
	 * @param pd
	 * @throws Exception
	 */
	public void editC(PageData pd)throws Exception;
	/**删除法人
	 * @param pd
	 * @throws Exception
	 */
	public void deleteC(PageData pd)throws Exception;
	/**批量删除
	 * @param COMP_CODES
	 * @throws Exception
	 */
	public void deleteAllC(String[] COMP_CODES)throws Exception;
	
	/**通过COMP_CODE获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findByCompCodeList(List<String> CodeList)throws Exception;
	
	/**建立法人菜单
	 * @param pd
	 * @throws Exception
	 */
	public void buildMenu(List<MenuInfo> menus)throws Exception;
	public List<PageData> listAllComp(String ID)throws Exception;
	
}
