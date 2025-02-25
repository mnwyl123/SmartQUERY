package com.dcits.platform.service.system.operation;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

//记录日志
public interface OperationManager {
	
	//获取本机MAC
	public String getMac(String ip)throws Exception;
	
	//添加日志
	public void operationLog(String string,String operation) throws Exception;
	/**添加日志
	 * @param pd
	 * @throws Exception
	 */
	public void addLog(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	public List<Map<String, String>> excelExport(Map<String, String> map)throws Exception;

}
