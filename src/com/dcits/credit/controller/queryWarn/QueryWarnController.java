package com.dcits.credit.controller.queryWarn;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.costManage.CostManageService;
import com.dcits.credit.service.queryWarn.QueryWarnService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;

/**
 * 异常查询预警
 * @author wangwenming
 *
 */
@Controller
@RequestMapping(value="/queryWarn")
public class QueryWarnController extends BaseController{
	
	@Resource(name="queryWarnService")
	private QueryWarnService queryWarnService;
	@Resource(name="costManageService")
	private CostManageService costManageService;
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="orgService")
	private OrgManager orgService;
	/**
	 * 获取带有用户名的PageData
	 */
	public PageData getPublicPageData(){
		PageData pd = getPageData();
		
		//当前日期的1号
		//int nowDate = Integer.parseInt(new SimpleDateFormat("yyyyMM").format(new Date()))*100+1;
		//前台传过来的数据日期
		String reqDate = null;
		int reqIntDate = 0;
		if(!(pd.get("QUERYTIME")==null || "".equals(pd.get("QUERYTIME")))){
//			pd.put("QUERYTIME", pd.getString("QUERYTIME")+"-01");
			reqDate = pd.getString("QUERYTIME");
			reqIntDate = Integer.parseInt(reqDate.replace("-", ""));
		}
		if(pd.get("QUERYTIME")==null || "".equals(pd.get("QUERYTIME"))){
			//获取当前日期的前一个月
			//Calendar ca = Calendar.getInstance();
			//ca.add(Calendar.MONTH,-1);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			pd.put("QUERYTIME", date);
		}
		pd.put("SHORTQUERYTIME", pd.getString("QUERYTIME"));
		//获取当前登录用户机构ID
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		//pd.put("USERCODE", userInfo.getUSERNAME());
		try {
			pd.put("ORGID", userInfo.getOrg().getOrgId());
		} catch (Exception e) {
			logger.info(e.getMessage());
			pd.put("ORGID",null);
		}
		//识别当前用户是否为内部授权人
		pd.put("USER_ID", userInfo.getUSER_ID());
		pd.put("COMPANY", userInfo.getCOMPANY());
		pd.put("USERNAME", userInfo.getUSERNAME());
		try {
			if(userService.findCheckPolicy(pd)!=null){
				pd.put("flag", "0"); //当前用户为内部授权人角色用户
			}else if(userService.findPolicy(pd)!=null){
				pd.put("flag", "2"); //当前用户为查询员角色用户
			}
		} catch (Exception e) {
			pd.put("flag", "1");
			logger.error(e.getMessage());
		}
		return pd;
	}
	/**
	 * 查询激增情况预警
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/surgeInEarlylist")
	public ModelAndView surgeInEarlylistPage(Page page){
		ModelAndView mv = getModelAndView();
		PageData pd = getPublicPageData();
		page.setPd(pd);
		List<PageData> list = new ArrayList<PageData>();
		List<Org> orgList = new ArrayList<Org>();
		try {
//			//用户查询上限
//			int userQueryToplimit = Integer.parseInt(getPropertiesValue("userQueryToplimit"));
//			//企业查询上限
//			int orgQueryToplimit = Integer.parseInt(getPropertiesValue("orgQueryToplimit"));
//			//个人查询上限
//			int personQueryToplimit = Integer.parseInt(getPropertiesValue("personQueryToplimit"));
//			pd.put("USERQUERYTOPLIMIT", userQueryToplimit);
//			pd.put("ORGQUERYTOPLIMIT", orgQueryToplimit);
//			pd.put("PERSONQUERYTOPLIMIT", personQueryToplimit);
			orgList = orgService.listAllOrgByCompany(pd.getString("COMPANY"));
			list = queryWarnService.surgeInEarlylistPage(page);
			/*if(list.size()==0){
				list = queryWarnService.surgeInEarlylistPageHis(page);
			}*/
			//orgList = costManageService.getAllOrgNameByOrgID(pd.getString("ORGID"));
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/queryWarn/surgeInEarlyWarn_list");
		mv.addObject("pd", pd);
		mv.addObject("surgeInEarlylist",list);
		mv.addObject("orgList",orgList);
		return mv;
	}
	/**
	 * 查询失败占比过大情况预警
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/failPercentToLargelist")
	public ModelAndView failPercentToLargelistPage(Page page){
		ModelAndView mv = getModelAndView();
		PageData pd = getPublicPageData();
		page.setPd(pd);
		List<PageData> list = new ArrayList<PageData>();
		List<Org> orgList = new ArrayList<Org>();
		try {
			list = queryWarnService.failPercentToLargelistPage(page);
			orgList = orgService.listAllOrgByCompany(pd.getString("COMPANY"));
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/queryWarn/failPercentToLargeWarn_list");
		mv.addObject("pd", pd);
		mv.addObject("failPercentToLargelist",list);
		mv.addObject("orgList",orgList);
		return mv;
	}
	/**
	 * 短时间内对同一客户多次查询情况预警
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/shorttimelist")
	public ModelAndView shorttimelist(Page page){
		ModelAndView mv = getModelAndView();
		PageData pd = getPublicPageData();
		page.setPd(pd);
		List<PageData> list = new ArrayList<PageData>();
		List<Org> orgList = new ArrayList<Org>();
		try {
			list = queryWarnService.shorttimelistPage(page);
			orgList = orgService.listAllOrgByCompany(pd.getString("COMPANY"));
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/queryWarn/shorttime_list");
		mv.addObject("pd", pd);
		mv.addObject("failPercentToLargelist",list);
		mv.addObject("orgList",orgList);
		return mv;
	}
	/**
	 * 非工作时段查询预警
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/noWorkTimelist")
	public ModelAndView noWorkTimelistPage(Page page){
		ModelAndView mv = getModelAndView();
		PageData pd = getPublicPageData();
		List<PageData> list = new ArrayList<PageData>();
		List<Org> orgList = new ArrayList<Org>();
		try {
			//非工作时段
//			String startTime1 = getPropertiesValue("startTime1");
//			String endTime1 = getPropertiesValue("endTime1");
//			String startTime2 = getPropertiesValue("startTime2");
//			String endTime2 = getPropertiesValue("endTime2");
//			String startTime3 = getPropertiesValue("startTime3");
//			String endTime3 = getPropertiesValue("endTime3");
//			pd.put("startTime1", startTime1);
//			pd.put("endTime1", endTime1);
//			pd.put("startTime2", startTime2);
//			pd.put("endTime2", endTime2);
//			pd.put("startTime3", startTime3);
//			pd.put("endTime3", endTime3);
			page.setPd(pd);
			list = queryWarnService.noWorkTimelistPage(page);
			orgList = orgService.listAllOrgByCompany(pd.getString("COMPANY"));
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/queryWarn/noWorkTimeWarn_list");
		mv.addObject("pd", pd);
		mv.addObject("noWorkTimelist",list);
		mv.addObject("orgList",orgList);
		return mv;
	}
	/**
	 * 跨地域查询预警
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/crossRegionlist")
	public ModelAndView crossRegionlistPage(Page page){
		ModelAndView mv = getModelAndView();
		PageData pd = getPublicPageData();
		List<PageData> list = new ArrayList<PageData>();
		List<Org> orgList = new ArrayList<Org>();
		page.setPd(pd);
		try {
			list = queryWarnService.crossRegionlistPage(page);
			orgList = orgService.listAllOrgByCompany(pd.getString("COMPANY"));
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/queryWarn/crossRegionWarn_list");
		mv.addObject("pd", pd);
		mv.addObject("crossRegionlist",list);
		mv.addObject("orgList",orgList);
		return mv;
	}
	/**
	 * 选择其他理由查询占比过大预警
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/otherReasonlist")
	public ModelAndView otherReasonlistPage(Page page){
		ModelAndView mv = getModelAndView();
		PageData pd = getPublicPageData();
		List<PageData> list = new ArrayList<PageData>();
		List<Org> orgList = new ArrayList<Org>();
		page.setPd(pd);
		try {
			list = queryWarnService.otherReasonlistPage(page);
			orgList = orgService.listAllOrgByCompany(pd.getString("COMPANY"));
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/queryWarn/otherReasonWarn_list");
		mv.addObject("pd", pd);
		mv.addObject("otherReasonlist",list);
		mv.addObject("orgList",orgList);
		return mv;
	}
}
