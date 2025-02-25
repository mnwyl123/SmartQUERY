package com.dcits.credit.service.PersonInterfaceWebSer.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.PersonInterfaceWebSer.PersonWebSerManager;
import com.dcits.credit.service.ServerUtil.impl.ServerUtilService;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：PersonWebSerService
 * 创建人：wangguoxing
 * 说明：个人征信查询接口
 */
@Service("PersonWebSerService")
public class PersonWebSerService implements PersonWebSerManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(PersonWebSerService.class);
	
	/**通过系统用户名获取人行用户名
	 * @param str
	 * @throws Exception
	 */
	public String findUsernamePerBank(String str)throws Exception{
		return (String)dao.findForObject("PersonWebSerMapper.findUsernamePerBank", str);
	}
	/**通过人行用户名获取人行密码
	 * @param str
	 * @throws Exception
	 */
	public String findPasswordPerBank(String str)throws Exception{
		return (String)dao.findForObject("PersonWebSerMapper.findPasswordPerBank", str);
	}
	/**通过系统用户名获取流程表值
	 * @param str
	 * @throws Exception
	 */
	public PageData findFs(String str)throws Exception{
		return (PageData)dao.findForObject("PersonWebSerMapper.findFs", str);
	}
	/**存入请求信息表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToPersonInfo(PageData pd)throws Exception{
		dao.save("PersonWebSerMapper.saveToPersonInfo", pd);
	}
	/**存入流程状态表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception{
		dao.save("PersonWebSerMapper.saveToFs", pd);
	}
	/**存储应答信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void saveResult(PageData pd)throws Exception{
		dao.save("PersonWebSerMapper.saveResult", pd);
	}
	/**更新请求信息表数据
	 * @param pd
	 * @throws Exception
	 */
	public void updatePersonInfo(PageData pd)throws Exception{
		dao.update("PersonWebSerMapper.updatePersonInfo", pd);
	}
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception{
		dao.update("PersonWebSerMapper.updateFs", pd);
	}
}
