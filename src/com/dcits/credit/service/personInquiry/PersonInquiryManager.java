package com.dcits.credit.service.personInquiry;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 个人征信查询申请
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
public interface PersonInquiryManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	public void saveURL(PageData pd)throws Exception;
	/**存入流程状态表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**删除流程表
	 * @param pd
	 * @throws Exception
	 */
	public void deleteFs(PageData pd)throws Exception;
	
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception;
	
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	/**列表历史表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listHis(Page page)throws Exception;
	/**查询授权审核人员
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> findCheckUserList(PageData pd)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
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
	/**获取查询编号
	 * @param pd
	 * @throws Exception
	 */
	public PageData findId(PageData pd)throws Exception;
	/**查询同一渠道编号渠道流水号是否重复
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByQueryNo(PageData pd)throws Exception;
	/**获取查询编号
	 * @param pd
	 * @throws Exception
	 */
	public PageData findOrg(PageData pd)throws Exception;
	
	/**查询内部授权人id
	 * @param pd
	 * @throws Exception
	 */
	public PageData findcheckuser(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**定时查询申请信息（外部服务用）
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findListForWb(PageData pd)throws Exception;
	
	//查询当前用户的查询次数设置信息
	public String updateQueryCount(String USERID,String USERNAME,String type);
	/**
	 * 查询次数加1
	 * @param USER_ID
	 */
	public void updateQuery(PageData pd);
	//提交查询申请
	public void updateStatus(PageData pd) throws Exception;
	
	//查询当前系统状态
	public PageData findSysStatus(PageData pd) throws Exception;
	//丢弃数据
	public void updateDStatus(PageData pd) throws Exception;
	/**查询是否含有渠道号
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByCHANNELNO(PageData pd)throws Exception;
	/**查询渠道号与用户名是否一致 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findCHANNELNO_USERNAME(PageData pd) throws Exception;
	/**根据机构id查询机构名称
	 * @param pd
	 * @throws Exception
	 */
	public PageData findOrgNameByCode(String orgCode)throws Exception;
}


