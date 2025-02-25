package com.dcits.credit.service.rest.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.rest.EntCreditInterfaceManage;
import com.dcits.credit.service.rest.PerCreditInterfaceManage;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 查看企业信贷接口
 * @author 
 * gaoshenga
 */
@Service("PerCreditInterfaceService")
public class PerCreditInterfaceImpl implements PerCreditInterfaceManage {
	private static Logger logger = Logger.getLogger(PerCreditInterfaceImpl.class);
	@Resource(name="daoSupport")
	private  DaoSupport dao;
	
	//查询当前系统状态
	public PageData findSysStatus(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PerCreditInterfaceMapper.findSysStatus", pd);
	}
	
	//查询是否含有渠道号
	@Override
	public PageData findByCHANNELNO(PageData pd) throws Exception {
		return (PageData)dao.findForObject("PerCreditInterfaceMapper.findByCHANNELNO", pd);
	}
	/**查询用户所在机构
	 * @param pd
	 * @throws Exception
	 */
	public PageData findOrg(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PerCreditInterfaceMapper.findOrg", pd);
	}
	/**新增企业信息
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PerCreditInterfaceMapper.save", pd);
	}
	/**存入流程状态表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception{
		dao.save("PerCreditInterfaceMapper.saveToFs", pd);
	}
	/**
	 * 查询征信账户信息
	 */
	@Override
	public PageData queryAccByUserName(PageData pd) throws Exception {
		return (PageData) dao.findForObject("PerCreditInterfaceMapper.queryAccByUserName", pd);
	}
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception{
		dao.update("PerCreditInterfaceMapper.updateFs", pd);
	}
	/**查询同一渠道编号渠道流水号是否重复
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByQueryNo(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PerCreditInterfaceMapper.findByQueryNo", pd);
	}

	@Override
	public void updateByChannel(PageData pd) throws Exception {
		dao.findForObject("PerCreditInterfaceMapper.updateByChannel", pd);
	}
	@Override
	public void updateByDate(PageData pd) throws Exception {
		dao.findForObject("PerCreditInterfaceMapper.updateByDate", pd);
	}
	/**通过流水号查找查询编号
	 * @param list
	 * @throws Exception
	 */
	public List<PageData> findByChannel(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PerCreditInterfaceMapper.findByChannel", pd);
	}
	/**通过时间姓名身份证号查找查询编号
	 * @param list
	 * @throws Exception
	 */
	public List<PageData> findByDATE(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PerCreditInterfaceMapper.findByDATE", pd);
	}
	/**判断次url是否已经插入
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findURLChannel(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PerCreditInterfaceMapper.findURLChannel", pd);
	}
	/**判断次文件是否已经读取
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByFile(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PerCreditInterfaceMapper.findByFile", pd);
	}
	public void deleteIdUrl(PageData pd)throws Exception{
		dao.delete("PerCreditInterfaceMapper.deleteIdUrl", pd);
	}
	/**判断次文件是否已经读取
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByFileData(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PerCreditInterfaceMapper.findByFileData", pd);
	}
	public void deleteUrlData(PageData pd)throws Exception{
		dao.delete("PerCreditInterfaceMapper.deleteUrlData", pd);
	}
	/**判断次文件是否已经读取
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByFileHistData(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PerCreditInterfaceMapper.findByFileHistData", pd);
	}
	public void deleteUrlHistData(PageData pd)throws Exception{
		dao.delete("PerCreditInterfaceMapper.deleteUrlHistData", pd);
	}
	@Override
	public List<PageData> findByCIP(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PerCreditInterfaceMapper.findByCIP", pd);
	}
	public void updateCIP(PageData pd)throws Exception{
		dao.update("PerCreditInterfaceMapper.updateCIP", pd);
	}
	/**更新影像资料数据表
	 * @param list
	 * @throws Exception
	 */
	public void updateURLDATA(PageData pd)throws Exception{
		dao.update("PerCreditInterfaceMapper.updateURLDATA", pd);
	}
	/**更新影像资料历史数据表
	 * @param list
	 * @throws Exception
	 */
	public void updateURLHISTDATA(PageData pd)throws Exception{
		dao.update("PerCreditInterfaceMapper.updateURLHISTDATA", pd);
	}
}
