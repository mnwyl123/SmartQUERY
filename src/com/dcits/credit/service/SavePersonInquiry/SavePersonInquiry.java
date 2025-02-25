package com.dcits.credit.service.SavePersonInquiry;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 个人征信查询申请
 * 创建人：gaosheng
 * 创建时间：2018-05-09
 */
public interface SavePersonInquiry{
	/**数据列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> QuerylistPage(Page page);
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	/**查询授权审核人员
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> findCheckUserList(PageData pd)throws Exception;
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByIdHis(PageData pd)throws Exception;
	//提交查询申请
	public void updateStatus(PageData pd) throws Exception;
	//将数据插入数据库
	public void insertInto(PageData pd) throws Exception;
	//查询员页面
	public PageData findByIdDetail(PageData pd) throws Exception;
	/**更新审核状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateRecord(PageData pd);
	/**查询员更新审核状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateCRecord(PageData pd);
	/**更新用户表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateUser(PageData pd);
	/**
	 * 查询公司
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCompanyById(PageData pd) throws Exception;

	/**审核历史列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listHistoryRe(Page page,String clientType);
	/**
	 * 查询数据显示审核状态
	 * @param pd
	 * @return
	 */
	public PageData FindStatus(PageData pd) throws Exception ;
	//管理员页面
	public PageData findByIdAndAdress(PageData pd) throws Exception;
}


