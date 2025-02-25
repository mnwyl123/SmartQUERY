package com.dcits.credit.service.personInquiry.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import com.dcits.credit.controller.ServerUtilTest.ServerUtilTestController;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;

/** 
 * 个人征信查询申请
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
@Service("PersonInquiryService")
public class PersonInquiryService implements PersonInquiryManager{
	private static Logger logger = Logger.getLogger(PersonInquiryService.class);
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PersonInquiryMapper.save", pd);
	}
	public void saveURL(PageData pd)throws Exception{
		dao.save("PersonInquiryMapper.saveURL", pd);
	}
	/**存入流程状态表
	 * @param pd
	 * @throws Exception
	 */
	public void saveToFs(PageData pd)throws Exception{
		dao.save("PersonInquiryMapper.saveToFs", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PersonInquiryMapper.delete", pd);
	}
	/**删除流程表
	 * @param pd
	 * @throws Exception
	 */
	public void deleteFs(PageData pd)throws Exception{
		dao.delete("PersonInquiryMapper.deleteFs", pd);
	}
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd)throws Exception{
		dao.update("PersonInquiryMapper.update", pd);
	}
	/**更新流程表
	 * @param pd
	 * @throws Exception
	 */
	public void updateFs(PageData pd)throws Exception{
		dao.update("PersonInquiryMapper.updateFs", pd);
	}
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		PageData pd = page.getPd();
		String flag = pd.getString("isHistory");
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			return (List<PageData>)dao.findForList("PersonInquiryMapper.datalistPage", page);
		}else{
			return (List<PageData>)dao.findForList("PersonInquiryMapper.historyDatalistPage", page);
		}
	}
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listHis(Page page)throws Exception{
		PageData pd = page.getPd();
		String flag = pd.getString("isHistory");
		if("0".equals(flag)){//当前用户为内部授权人角色用户
			return (List<PageData>)dao.findForList("PersonInquiryMapper.hisdatalistPage", page);
		}else{
			return (List<PageData>)dao.findForList("PersonInquiryMapper.queryhistoryDatalistPage", page);
		}
	}
	/**查询授权审核人员
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findCheckUserList(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonInquiryMapper.findCheckUserList", pd);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonInquiryMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonInquiryMapper.findById", pd);
	}
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByIdHis(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonInquiryMapper.findByIdHis", pd);
	}
	/**查询同一渠道编号渠道流水号是否重复
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByQueryNo(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonInquiryMapper.findByQueryNo", pd);
	}
	/**获取查询编号
	 * @param pd
	 * @throws Exception
	 */
	public PageData findId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonInquiryMapper.findId", pd);
	}
	
	/**查询用户所在机构
	 * @param pd
	 * @throws Exception
	 */
	public PageData findOrg(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonInquiryMapper.findOrg", pd);
	}
	
	/**查询内部授权人id
	 * @param pd
	 * @throws Exception
	 */
	public PageData findcheckuser(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonInquiryMapper.findcheckuser", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PersonInquiryMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**提交申请
	 * @param pd
	 * @throws Exception
	 */
	public void updateStatus(PageData pd)throws Exception{
		dao.update("PersonInquiryMapper.updateStatus", pd);
	}
	
	//查询当前系统状态
	public PageData findSysStatus(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonInquiryMapper.findSysStatus", pd);
	}
	
	/**定时查询申请信息（外部服务用）
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findListForWb(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonInquiryMapper.findListForWb", pd);
	}
	
	//判断查询次数是否超过上限
	public String updateQueryCount(String USER_ID,String USERNAME,String type){
		String flag = "0";  //为0表示正常，为1表示超过次数
		
		//获取当前月
		String cur_month = new SimpleDateFormat("yyyyMM").format(new Date());
		//根据用户ID查询该用户的查询设置信息
		try {
			PageData pd = new PageData();
			pd.put("USER_ID", USER_ID);
			pd.put("USER_TYPE", type);
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			List<PageData> pds = (List<PageData>) dao.findForList("PersonInquiryMapper.queryCount", pd);
			if(pds.size()==0){//初始化查询参数表				
				pd = new PageData(); 
				pd.put("USER_ID", USER_ID);
				pd.put("USERNAME", USERNAME);
				pd.put("QUERY_MIN_COUNT", 10);
				pd.put("QUERY_MULTIPLE", 1);
				pd.put("QUERY_MONTH", cur_month);
				pd.put("QUERY_COUNT", 0);
				pd.put("AVG_QUERY_COUNT", 0);
				pd.put("USER_TYPE", type);
				pd.put("COMPANY", user.getCOMPANY());
				try{
					dao.save("PersonInquiryMapper.saveQueryCount", pd);
				}catch(Exception e){
					logger.error(e.getMessage());
				}
			}else{
				//新增当前月份
				int queryMinCount = 0;  //下限值
				Double queryMultiple = 0.0;   //倍数
				int queryCount = 0;    //当月查询次数
				int avgQueryCount = 0;   //前三个月平均次数
				String month = "";    //月份
				pd.putAll(pds.get(0));
				if(pd.get("QUERY_MIN_COUNT")!=null){
					queryMinCount = Integer.parseInt(pd.get("QUERY_MIN_COUNT").toString());
				}
				if(pd.get("QUERY_MULTIPLE")!=null){
					queryMultiple = Double.parseDouble(pd.get("QUERY_MULTIPLE").toString());				
				}
				if(pd.get("QUERY_MONTH")!=null){
					month = pd.getString("QUERY_MONTH");
				}
				if(pd.get("QUERY_COUNT")!=null){
					queryCount = Integer.parseInt(pd.get("QUERY_COUNT").toString());
				}
				if(pd.get("AVG_QUERY_COUNT")!=null){
					avgQueryCount = Integer.parseInt(pd.get("AVG_QUERY_COUNT").toString());
				}
				//不是当前月，则更新前三个月平均次数
				if(!cur_month.equals(month)){
					String tol = (String) dao.findForObject("PersonInquiryMapper.getQueryCount", pd);
					avgQueryCount= Integer.parseInt(tol);
					if(avgQueryCount%3==0){
						avgQueryCount = avgQueryCount/3;
					}else{
						avgQueryCount = avgQueryCount/3+1;
					}
					if(avgQueryCount<queryMinCount){
						avgQueryCount = queryMinCount;
					}
					pd.put("QUERY_MONTH", cur_month);
					pd.put("QUERY_COUNT", 0);
					pd.put("AVG_QUERY_COUNT", avgQueryCount);
					pd.put("COMPANY", user.getCOMPANY());
//					//更新表
//					dao.update("PersonInquiryMapper.updateQuery", pd);
					//新增当前月份
					dao.save("PersonInquiryMapper.saveQueryCount", pd);
				}else{
					if(queryMinCount>avgQueryCount){
						avgQueryCount=queryMinCount;
					}
					//计算是否超过次数
					Double num = avgQueryCount*queryMultiple;	
					if(queryCount>=num){
						flag = "1";
					}
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return flag;
	}
	
	/**
	 * 查询次数加1
	 * @param USER_ID
	 */
	public void updateQuery(PageData pd){
		try {
			//获取当前月
			String cur_month = new SimpleDateFormat("yyyyMM").format(new Date());
			pd.put("QUERY_MONTH", cur_month);
			dao.update("PersonInquiryMapper.updateAddQuery", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	/**丢弃数据
	 * @param pd
	 * @throws Exception
	 */
	public void updateDStatus(PageData pd)throws Exception{
		dao.update("PersonInquiryMapper.updateDStatus", pd);
	}
	//查询是否含有渠道号
	@Override
	public PageData findByCHANNELNO(PageData pd) throws Exception {
		return (PageData)dao.findForObject("PersonInquiryMapper.findByCHANNELNO", pd);
	}
	//查询渠道号与用户名是否一致  
	@Override
	public PageData findCHANNELNO_USERNAME(PageData pd) throws Exception {
		return (PageData)dao.findForObject("PersonInquiryMapper.findCHANNELNO_USERNAME", pd);
	}
	/**根据机构id查询机构名称
	 * @param pd
	 * @throws Exception
	 */
	public PageData findOrgNameByCode(String orgCode)throws Exception{
		return (PageData)dao.findForObject("PersonInquiryMapper.findOrgNameByCode", orgCode);
	}
	
}

