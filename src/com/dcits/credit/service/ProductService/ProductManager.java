package com.dcits.credit.service.ProductService;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.util.PageData;

public interface ProductManager {

	/**数据列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> ProductlistPage(Page page);
	
	public List<PageData> Productlist(PageData pd);
	public PageData productChannelById(PageData pd);
	
	public void UpdateChannelById(PageData pd);
	
	public void SaveChannel(PageData pd);
	
	public void deleteChannelById(PageData pd);
	
	public void deleteAllChannelById(Map<String,Object> map);	
	
}
