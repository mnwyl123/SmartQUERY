package com.dcits.crawl.service.IndAppReview;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：IndAppReManager
 * 创建人：zhangyy
 * 说明：个人查询申请审核
 */
public interface CrawlIndAppReManager {
	/**个人查询申请审核列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listIndAppRe(Page page);
	
	/**查询个人申请信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getAppCheck(PageData pd);
	
	/**查询用户部门
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getUserDepart(PageData pd);
	
	/**查询用户机构
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String getUserOrg(PageData pd);
	/**更新审核状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateCheck(PageData pd);
	/**查询明细表需要的数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData QueryDetail(String ID);
	/**向明细表插入数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void saveDetail(PageData pd);
	/**更新明细表中查询结果状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void UpdateDetailCheck(PageData pd);
	/**查询当前用户机构ID
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<String> getUserOrgID(PageData pd);
	
	/**查询人行登录用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getLoginInfo(PageData pd);
	
	/**查询查询员登录名
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getQueryUserInfo(PageData pd);
	/**记录重跑次数
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateRerunsTime(PageData pd);
	/**密码错误更新人行账户状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateCreditStatus(PageData pd);

	/**通过大单元标识查询数据库落库表名列名（爬虫专用）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findTabColClawerByTag(String tag);

	/**通过小单元名称查询数据库落库表名列名（爬虫专用）
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findTabColClawerByTableName(String tableName);

	/**test
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findTabColClawerByTableName(PageData tableName);
	/**查询爬虫网页的页面参数信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findWebCrawlerInfoByAction(String action) throws Exception;
	/**根据传入的字典名称和系统字典code查找人行字典code
	 * @param pd
	 * @throws Exception
	 */
	public PageData findWebCrawlerDictByCode(PageData dict_code)throws Exception;

	/**更新状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateStatus(PageData pd) throws Exception;
	/**查找出所有需要转数据字典列的表名
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findTabNameByType(PageData pd)throws Exception;
	/**根据表名查找出所有需要转数据字典列的信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findDictByTabName(PageData pd)throws Exception;
	/**根据字典编号和中文名称查找CODE
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCodeByName(PageData pd)throws Exception;
	/**根据字典编号和中文名称查找CODE
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> selectInfo(PageData pd)throws Exception;
	
	public void updateInfo(PageData pd)throws Exception;
	/**查找出所有需要转数据字典列2的表名,列名和数据字典编号
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findAllTabName2(PageData pd)throws Exception;
	/**查找出所有需要转数据字典并且还加密的表名,列名和数据字典编号
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findEncryptTabName(PageData pd)throws Exception;
	/**查找出所有需要转数据字典 列2 并且还加密的表名,列名和数据字典编号 
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findEncryptTabName2(PageData pd)throws Exception;
	/**通过用户名查询爬虫网络所需参数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findWebCrawlerInfoByUser(PageData pd)throws Exception;
	/**通过人行账户名查询爬虫网络所需参数
	 * @param pd
	 * @throws Exception
	 */
	public PageData findWebCrawlerInfoByCertName(PageData pd)throws Exception;
	/**
	 * 根据id查询此次请求是否存在渠道和渠道流水号
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findChannelInfoById(PageData pd)throws Exception;
	/**
	 * 保存该信用报告返回第三方公共接口的json数据
	 * @param pd
	 * @throws Exception
	 */
	public void savePerJson(PageData pd)throws Exception;
	/**
	 * 根据请求渠道、请求编号和用户名查询对应报告的json
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findPerJson(PageData pd)throws Exception;
	/**
	 * 保存该信用报告返回第三方公共接口的json数据
	 * @param pd
	 * @throws Exception
	 */
	public void saveComJson(PageData pd)throws Exception;
	/**
	 * 根据请求渠道、请求编号和用户名查询对应报告的json
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findComJson(PageData pd)throws Exception;
	/**
	 * 根据征信查询用户名查找相关用户信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCreditAcctInfoByCode(PageData pd)throws Exception;
	/**
	 * 根据密码编号查找预先设置好的密码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findPrePassByCode(PageData pd)throws Exception;
	/**
	 * 更新密码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateCreditPass(PageData pd)throws Exception;
	

	/**
	 * 将所要查询的相关数据插入到数据库的待查询队列表中,并将其状态置为未爬取
	 * @param pd
	 */
	public void insertCompanySelectQueue(PageData pd)throws Exception;

	/**
	 * 循环查询锁
	 * @param pd
	 * @throws Exception
	 */
	public PageData findQueueStatus(PageData pd)throws Exception;

	/**
	 * 修改该条任务的状态为获取到锁的状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateQueueGetLock(PageData pd)throws Exception;

	/**
	 * 修改该条任务的状态为释放锁的状态,无论查询失败还是成功都是查询完成
	 * @param pd
	 * @throws Exception
	 */
	public void updateQueueReleaseLock(PageData pd)throws Exception;

	/**
	 * 查询上一个线程的状态,如果超时,那么释放掉上个线程的锁
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findQueueUpperStatus(PageData pd)throws Exception;

	/**
	 * 修改正在运行的挂掉线程的状态,修改为已完成
	 * @param upperPd
	 * @throws Exception
	 */
	public void updateQueueUpperStatus(PageData pd)throws Exception;
	
	public boolean findQueryType(String type);
	

	/**
	 * 存入征信报文到数据库
	 * @param pd
	 */
	public void saveBody(PageData pd)throws Exception;
	

	/**
	 * 获取征信报文
	 * @param pd
	 */
	public String getBody(String pd)throws Exception;
}
