package com.dcits.credit.service.PersonInterfaceWebSer;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：PersonWebSerManager
 * 创建人：wangguoxing
 * 说明：个人征信查询接口
 */
public interface PersonWebSerManager {
	/**通过系统用户名获取人行用户名
	 * @param str
	 * @throws Exception
	 */
	public String findUsernamePerBank(String str)throws Exception;
	/**通过人行用户名获取人行密码
	 * @param str
	 * @throws Exception
	 */
	public String findPasswordPerBank(String str)throws Exception;
	/**通过系统用户名获取流程表值
	 * @param str
	 * @throws Exception
	 */
	public PageData findFs(String str)throws Exception;
	/**存入请求信息表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToPersonInfo(PageData pd)throws Exception;
	/**存入流程状态表
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception;
	/**存储应答信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void saveResult(PageData pd)throws Exception;
	/**更新请求信息表数据
	 * @param pd
	 * @throws Exception
	 */
	public void updatePersonInfo(PageData pd)throws Exception;
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception;
}
