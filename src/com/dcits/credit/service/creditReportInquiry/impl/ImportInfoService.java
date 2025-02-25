package com.dcits.credit.service.creditReportInquiry.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.creditReportInquiry.ImportInfoManager;
import com.dcits.credit.service.creditReportInquiry.PersonReportInqManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 重要信息提示
 * 创建人：sunyra
 * 创建时间：2019-02-27
 */
@Service("ImportInfoService")
public class ImportInfoService implements ImportInfoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ImportInfoMapper.datalistPage", page);
	}
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd) throws Exception{
		dao.update("ImportInfoMapper.delete", pd);
	}
	/**删除信息详情表中数据
	 * @param pd
	 * @throws Exception
	 */
	public void deleteMessage(PageData pd) throws Exception{
		dao.update("ImportInfoMapper.deleteMessage", pd);
	}
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(Map<String,String> map) throws Exception{
		dao.update("ImportInfoMapper.save", map);
	}
	
	/**查询最大id
	 * @param pd
	 * @throws Exception
	 */
	public int findReportMaxId() throws Exception{
		return (int) dao.findForObject("ImportInfoMapper.findReportMaxId", "");
	}
	
	/**新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfo(Map<String,String> map)throws Exception{
		dao.save("ImportInfoMapper.saveInfo", map);
	}
	
	/**获取信息详情
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> getMessageInfo(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ImportInfoMapper.getMessageInfo", pd);
	};
}

