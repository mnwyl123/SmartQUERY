package com.dcits.credit.controller.QueryFrequerySet;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.QuerySet.ParamManager;
import com.dcits.credit.service.QuerySet.QuerySetManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;
import com.dcits.platform.util.role.RoleAuthFactory;

@Controller
@RequestMapping(value="/paramManage")
public class ParamController extends BaseController{
	
	@Resource(name="paramManagerSerivce")
	private ParamManager service;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="querySetService")
	private QuerySetManager querySetService;
	
	/**
	 * 参数列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/paramlist")
	public ModelAndView paramList(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		//权限
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		page.setPd(pd);
		
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		List<PageData> list = null;
		try {
			list = service.paramList(page);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/QueryFrequerySet/Param_list");
		mv.addObject("pd",pd);
		mv.addObject("paramList",list);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	@RequestMapping(value="/hasId")
	@ResponseBody
	public Object hasId(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		pd.put("COMPANY", company); 
		try{
			if(service.queryByPARAM(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 系统参数列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/sysParamlist")
	public ModelAndView sysParamlist(Page page){
		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		//权限查询
		String menuId = pd.getString("menuId");
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		Map<String,String> map = roleAtuhFactory.getHC(roleIds,menuId);
		
		pd.put("COMPANY", user.getCOMPANY());
		try{
			//存放列表数据信息
			List<PageData> listInfo = new ArrayList<PageData>();
			page.setPd(pd);
			//查询待审核信息
			listInfo = service.sysParamList(page);
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/sysParams/QuerySysParam_list");
		mv.addObject("QX",map);
		return mv;
	}
	
	/**去新增系统参数页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddSysQ")
	public ModelAndView goAddSysQ(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("credit/sysParams/SystemParamAdd");
		mv.addObject("msg", "saveQ");
		mv.addObject("pd", pd);
		return mv;
	}
	/**去修改系统参数页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditSysQ")
	public ModelAndView goEditSysQ(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		//读取信息
		try{
			pd = service.hasSysP(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/sysParams/SystemParamEdit");
		mv.addObject("msg", "UpdateQ");
		mv.addObject("pd", pd);
		return mv;
	}
	/**保存系统参数
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/UpdateSysP")
	public ModelAndView UpdateSysP(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			service.updateSysP(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	

	/**判断系统参数是否存在
	 * @return
	 */
	@RequestMapping(value="/hasQ")
	@ResponseBody
	public Object hasQ(){
		Map<String,String> map = new HashMap<String,String>();
		
		String errInfo = "success";
		PageData pd = this.getPageData();
		try{
			//判断用户表中该用户是否存在
			PageData data = service.hasSysByCode(pd);
			if(data!=null){
				map.put("result", "Yes");
				return AppUtil.returnObject(new PageData(), map);
			}
		} catch(Exception e){
			logger.error(e.getMessage());
		}
		map.put("result", "NO");				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**保存系统参数
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveSysQ")
	public ModelAndView saveSysQ(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			pd.put("sys_ID",UuidUtil.get32UUID());//自动生成主键
			service.saveSysP(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除系统参数
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteSysQ")
	public ModelAndView deleteSysQ(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			service.deleteSysP(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
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
		mv.setViewName("credit/QueryFrequerySet/Param_edit");
		mv.addObject("msg", "saveP");
		mv.addObject("pd", pd);
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
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
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
		
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		
		PageData pageData;
		Page page = new Page();
		page.setPd(pd);
		try {
			pageData = service.paramList(page).get(0);
		} catch (Exception e) {
			pageData = new PageData();
			logger.info(e.getMessage());			
		}
		mv.setViewName("credit/QueryFrequerySet/Param_edit");
		mv.addObject("msg", "updateP");
		mv.addObject("pd", pd);
		mv.addObject("paramObject",pageData);
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
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		try {
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
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
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
}
