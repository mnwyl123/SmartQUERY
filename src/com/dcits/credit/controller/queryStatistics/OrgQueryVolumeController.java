package com.dcits.credit.controller.queryStatistics;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.dcits.credit.service.orgstatistic.OrgStatisticManager;
import com.dcits.credit.service.queryStatistics.OrgQueryVolumeManager;

/** 
 * 说明：机构查询量统计
 * 创建人：  
 * 创建时间：2017-06-30
 */
@Controller
@RequestMapping(value="/OrgQueryVolume")
public class OrgQueryVolumeController extends BaseController {
	
	String menuUrl = "OrgQueryVolume/list.do"; //菜单地址(权限用)
	
	@Resource(name="OrgQueryVolumeService")
	private OrgQueryVolumeManager OrgQueryVolumeService;
	@Resource(name="orgService")
	private OrgManager orgService;
	@Resource(name="userService")
	private UserManager userService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表OrgQueryVolume");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = userInfo.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		Org curOrg = (Org) session.getAttribute(USERID+Const.SESSION_ORG);
		String menuId = pd.getString("menuId");
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		try {
			pd.put("ORGID", userInfo.getOrg().getOrgId());
		} catch (Exception e) {
			logger.info(e.getMessage());
			pd.put("ORGID",null);
		}
		//识别当前用户是否为内部授权人
		pd.put("USER_ID", userInfo.getUSER_ID());
		pd.put("COMPANY", userInfo.getCOMPANY());
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
		List<PageData> prolist=new ArrayList<PageData>();
		pd.put("USERID",userInfo.getUSER_ID());
		prolist = userService.getProByUserId(pd);
		page.setPd(pd);
		List<Org> orgList = orgService.listAllOrgByCompany(company);
		List<PageData>	varList = OrgQueryVolumeService.list(page);	//
		mv.setViewName("credit/queryStatistic/orgQueryVolume_list");
		mv.addObject("varList", varList);
		mv.addObject("orgList",orgList);
		mv.addObject("prolist",prolist);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
		return mv;
	}
	
	
	 /**去详情页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetail")
	public ModelAndView goEdit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		page.setPd(pd);
		List<PageData> varList =OrgQueryVolumeService.detailList(page);	
		if(varList.size()==0){
			varList =OrgQueryVolumeService.detailListHis(page);	
		}
		mv.setViewName("credit/queryStatistic/orgQueryVolumeDetail_list");
		mv.addObject("varList", varList);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
