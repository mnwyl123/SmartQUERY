package com.dcits.platform.controller.system.org;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 说明：组织机构
 * 创建人：  
 * 创建时间：2015-12-16
 */
@Controller
@RequestMapping(value="/org")
public class OrgController extends BaseController {
	
	String menuUrl = "org/list.do"; //菜单地址(权限用)
	@Resource(name="orgService")
	private OrgManager orgService;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="userService")
	private UserManager userService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增org");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORG_ID", this.get32UUID());	//主键
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		if(!flag){
			//普通用户添加
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("USER_ID",user.getUSER_ID());
        	map.put("ORG_ID",pd.get("ORG_ID").toString());
			userService.saveOrgAuth(map); 	//执行保存	
		}
		orgService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 * @param ORG_ID
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String ORG_ID) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除org");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		pd.put("ORG_ID", ORG_ID);
		pd.put("parentId", ORG_ID);
		pd.put("company", company);
		pd.put("USER_ID", USERID);
		String errInfo = "success";
		//String operResult = "删除机构信息失败";
		if(orgService.listSubDepartmentByParentId(pd).size() > 0){//判断是否有子级，是：不允许删除
			errInfo = "false";
		}else{
			//判断是否被用户授权
			if(orgService.finUserOrg(pd).size()>0){
				errInfo = "error";
			}else{
				orgService.delete(pd);	//执行删除
				orgService.deleteUserOrg(pd); //删除用户机构
				//operResult = "删除机构信息成功";
			}
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改org");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();	
		orgService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId==null||menuId.equals(null)){
			//根据菜单名称查询最顶层节点
			menuId = (String) session.getAttribute(USERID+"OrgMenuIdSession");
		}
		
		String keywords = pd.getString("keywords");					//检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String ORG_ID = null == pd.get("ORG_ID")?"":pd.get("ORG_ID").toString();
		if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
			ORG_ID = pd.get("id").toString();
		}
		if(pd.get("parentId")!=null){
			ORG_ID = pd.getString("parentId");
		}
		pd.put("USER_ID", USERID);
		pd.put("COMPANY", company);
		pd.put("ORG_ID", ORG_ID);					//上级ID
		page.setPd(pd);
		List<Org>	varList = orgService.list(page);	//列出Dictionaries列表
		mv.addObject("pd", orgService.findById(pd));		//传入上级所有信息
		mv.addObject("ORG_ID", ORG_ID);			//上级ID
		mv.setViewName("system/org/org_list");
		mv.addObject("varList", varList);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
	/**
	 * 显示列表ztree
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listAllDepartment")
	public ModelAndView listAllDepartment(Model model,String ORG_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String ID = pd.getString("menuId");
		if(ORG_ID==null){
			ORG_ID="0";
		}
		
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		if(!flag){
			ORG_ID="";
		}
		if(ID!=null&&!ID.equals(null)){
			session.setAttribute(USERID+"OrgMenuIdSession", ID);
		}else{
			ID = (String) session.getAttribute(USERID+"OrgMenuIdSession");
		}
		
		try{
			JSONArray arr = JSONArray.fromObject(orgService.listAllDepartment("0",company));
			String json = arr.toString();
			json = json.replaceAll("orgId", "id").replaceAll("parentId", "pId").replaceAll("name", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("ORG_ID",ORG_ID);
			mv.addObject("ID",ID);
			mv.addObject("pd", pd);	
			mv.setViewName("system/org/org_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String ORG_ID = null == pd.get("ORG_ID")?"":pd.get("ORG_ID").toString();
		pd.put("ORG_ID", ORG_ID);					//ID
		PageData pds = orgService.findById(pd);
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		pd.put("COMPANY", company);
		pd.put("ORG_ID_COMBANK", "79103141005");
		pd.put("ORG_ID_PERBANK", "D10027910H0001");
		if(pds==null){
			pd.put("PARENT_ID", "0");
			pd.put("ORG_LEVEL", "1");
		}else{
			int level = Integer.parseInt(pds.get("ORG_LEVEL").toString());
			pd.put("ORG_LEVEL", level+1);
			pd.put("PARENT_ID", pds.getString("ORG_ID"));
		}
		mv.addObject("pd",pd);
		mv.addObject("pds",pds);		//传入上级所有信息
		mv.setViewName("system/org/org_edit");
		mv.addObject("msg", "save");
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String url = pd.getString("url");
		String orgId = pd.getString("ORG_ID");
		pd = orgService.findById(pd);	//根据ID读取
		pd.put("url", url);
		mv.addObject("pd", pd);					//放入视图容器
		pd.put("ORG_ID",pd.get("PARENT_ID").toString());			//用作上级信息
		mv.addObject("pds",orgService.findById(pd));				//传入上级所有信息
		mv.addObject("ORG_ID", pd.get("PARENT_ID").toString());	//传入上级ID，作为子ID用
		pd.put("ORG_ID",orgId);							//复原本ID
		mv.setViewName("system/org/org_edit");
		mv.addObject("msg", "edit");
		return mv;
	}	

	/**判断编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasBianma")
	@ResponseBody
	public Object hasBianma(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		pd.put("COMPANY", company);
		try{
			if(orgService.findByBianma(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	@RequestMapping(value = "/orglist")
	@ResponseBody
	public Map<String, ? extends Object> orglist(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Map<String, Object> param = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		Org org = (Org)session.getAttribute(user.getUSER_ID()+Const.SESSION_ORG);
		param.put("currOrg", org.getOrgCode()==null?"":org.getOrgCode());
		param.put("user", user);
		logger.debug("开始读取机构数据:");
		try {
			modelMap.putAll(orgService.getOrgTree(param));
		} catch (Exception e) {
			logger.error("系统异常请联系管理员",e);
		}
		logger.debug("读取机构数据成功");
		return modelMap;
	}
}
