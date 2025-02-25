package com.dcits.credit.controller.QueryFrequerySet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.QuerySet.ExceptionParamManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

@Controller
@RequestMapping(value="/exceptionParam")
public class ExceptionParamController extends BaseController{
	
	@Resource(name="exceptionParamSerivce")
	private ExceptionParamManager service;
	private RoleAuthFactory roleAtuhFactory;
	
	/**
	 * 参数列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/paramlist")
	public ModelAndView paramList(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		page.setPd(pd);
		//权限
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		List<PageData> list = null;
		List<PageData> orgList = null;
		pd.put("COMPANY", company);
		try {
			list = service.paramList(page);
			orgList = service.orgList(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/QueryFrequerySet/ExceptionParam_list");
		mv.addObject("pd",pd);
		mv.addObject("paramList",list);
		mv.addObject("orgList",orgList);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	/**
	 * 弹出新增窗口
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goSaveP")
	public ModelAndView goSaveP(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<PageData> list = null;
		try {
			list = service.orgList(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/QueryFrequerySet/ExceptionParam_edit");
		mv.addObject("msg", "saveP");
		mv.addObject("pd", pd);
		mv.addObject("orgList",list);
		return mv;
	}
	/**
	 * 新增
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveP")
	public ModelAndView saveP(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		try {
			service.saveP(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("save_result");
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 弹出修改窗口
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUpdateP")
	public ModelAndView goUpdateP(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = getPageData();
		PageData pageData;
		Page page = new Page();
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		page.setPd(pd);
		List<PageData> list = null;
		try {
			pageData = service.paramList(page).get(0);
			list = service.orgList(pd);
		} catch (Exception e) {
			pageData = new PageData();
			logger.info(e.getMessage());			
		}
		mv.setViewName("credit/QueryFrequerySet/ExceptionParam_edit");
		mv.addObject("msg", "updateP");
		mv.addObject("pd", pd);
		mv.addObject("paramObject",pageData);
		mv.addObject("orgList",list);
		return mv;
	}
	/**
	 * 修改
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/updateP")
	public ModelAndView updateP(){		
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		try {
			pd.put("ORG_ID", pd.getString("OID"));
			service.updateP(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("save_result");
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteP")
	public ModelAndView deleteP(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		try {
			service.deleteP(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("save_result");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**判断该用户类型 下用户是否存在
	 * @return
	 */
	@RequestMapping(value="/hasO")
	@ResponseBody
	public Object hasO(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		try{
			//判断查询次数设置表中该用户是否已经存在
			if(service.queryOrg(pd)!=null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.getMessage());
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
}
