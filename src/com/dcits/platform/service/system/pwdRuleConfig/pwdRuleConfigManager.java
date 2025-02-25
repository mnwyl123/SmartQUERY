package com.dcits.platform.service.system.pwdRuleConfig;

import java.util.List;
import java.util.Map;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 说明： 密码规则配置
 * 创建人：huangzwf
 * 创建时间：2016-11-22
 * @version
 */
public interface pwdRuleConfigManager{


	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public PageData list(PageData pd)throws Exception;

	/**查询最大错误次数
	 * @param pd
	 * @throws Exception
	 */
	public String checkMaxTime(String ID)throws Exception;
	
	/**查询初始密码
	 * @param pd
	 * @throws Exception
	 */
	public String checkPass(String ID)throws Exception;
	
}

