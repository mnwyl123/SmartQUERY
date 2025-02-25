package com.dcits.crawl.service.dataSubmission;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/**
 * 数据报送Service
 * @author wang.wenming
 *
 */
public interface IDataSubmissionService {
	/**
	 * 个人征信数据列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCifmPersonList(Page page) throws Exception;
	/**
	 * 更新流程表状态
	 * @param queryId
	 * @throws Exception
	 */
	public void updateStatus(PageData pd) throws Exception;
	/**
	 * 唯一标识查询个人征信数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData getCifmPersonObject(String id) throws Exception;
	/**
	 * 企业征信数据列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getCifmCompanyList(Page page) throws Exception;
	/**
	 * 唯一标识查询企业征信数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData getCifmCompanyObject(String id) throws Exception;
	/**
	 * 发送报文到指定接口的调用方法
	 * @param id
	 * @param dataType 上报数据类型：1:个人征信查询明细 2:企业征信查询明细
	 * @return
	 * @throws Exception 
	 */
	public String sendSubmissionData(String queryId,String dataType);
	/**
	 * 获取个人xml
	 * @param queryId
	 * @return
	 * @throws Exception 
	 */
	public String getPersonByte(String queryId) throws Exception;
	/**
	 * 获取企业xml
	 * @param queryId
	 * @return
	 * @throws Exception 
	 */
	public String getCompanyByte(String queryId) throws Exception;
}
