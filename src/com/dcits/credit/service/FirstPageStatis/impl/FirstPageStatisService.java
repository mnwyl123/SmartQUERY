package com.dcits.credit.service.FirstPageStatis.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.FirstPageStatis.FirstPageStatisManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：首页
 * 创建人：zhangyy
 */
@Service("statisService")
public class FirstPageStatisService implements FirstPageStatisManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(FirstPageStatisService.class);
	
	/**当前月总查询次数统计
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> StatisQuerySum(PageData pd) {
		try {
			//0:其他用户，1:管理员用户,2:查询员用户,3:审核员用户
			String methodName = "querySum";
			if("1".equals(pd.getString("userType"))){
				methodName = "querySumA";
			}else if("2".equals(pd.getString("userType"))){
				methodName = "querySum";
			}else if("3".equals(pd.getString("userType"))){
				methodName = "";
			}
			return (List<PageData>) dao.findForList("FirstPageMapper."+methodName, pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**统计最近15天查询数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> queryLastCount(PageData pd) {
		try {
			//0:其他用户，1:管理员用户,2:查询员用户,3:审核员用户
			String methodName = "queryLastCount";
			if("1".equals(pd.getString("userType"))){
				methodName = "queryLastCountA";
			}else if("2".equals(pd.getString("userType"))){
				methodName = "queryLastCount";
			}else if("3".equals(pd.getString("userType"))){
				methodName = "";
			}
			return (List<PageData>) dao.findForList("FirstPageMapper."+methodName, pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**统计本月查询详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> queryDetail(PageData pd) {
		try {
			//0:其他用户，1:管理员用户,2:查询员用户,3:审核员用户
			String methodName = "queryDetail";
			if("1".equals(pd.getString("userType"))){
				methodName = "queryDetailA";
			}else if("2".equals(pd.getString("userType"))){
				methodName = "queryDetail";
			}else if("3".equals(pd.getString("userType"))){
				methodName = "";
			}
			return (List<PageData>) dao.findForList("FirstPageMapper."+methodName, pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	
	/**当前月总审核次数统计
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> checkSum(PageData pd) {
		try {
			return (List<PageData>) dao.findForList("FirstPageMapper.checkSum", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**统计最近15天审核数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> checkLastCount(PageData pd) {
		try {
			return (List<PageData>) dao.findForList("FirstPageMapper.checkLastCount", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	/**统计本月审核详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> checkDetail(PageData pd) {
		try {
			return (List<PageData>) dao.findForList("FirstPageMapper.checkDetail", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}

	/**
	 * 查询激增情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> surgeInEarlylistPage(PageData pd) throws Exception {
		dao.delete("QueryWarnMapper.deletesurgeInEarlyTEMP", pd);
		dao.delete("QueryWarnMapper.deletesurgeInEarlyTEMP2", pd);
		dao.update("QueryWarnMapper.savesurgeInEarlyTEMP", pd);
		dao.update("QueryWarnMapper.savesurgeInEarlyTEMP2", pd);
		return (List<PageData>)dao.findForList("FirstPageMapper.surgeInEarlylist", pd);
	}
	/**
	 * 查询失败占比过大情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> failPercentToLargelistPage(PageData pd) throws Exception {
			dao.delete("QueryWarnMapper.deletefailToLargeTEMP", pd);
			dao.update("QueryWarnMapper.savefailPercentToLargeTEMP", pd);
			return (List<PageData>)dao.findForList("FirstPageMapper.failToLargelist", pd);

	}
	@Override
	public List<PageData> shorttimelistPage(PageData pd) throws Exception {
		List<PageData>varList=new ArrayList<PageData>();
			varList = (List<PageData>)dao.findForList("FirstPageMapper.shorttimelist", pd);
		return varList;
	}
}
