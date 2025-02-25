package com.dcits.platform.controller.system.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Menu;
import com.dcits.platform.entity.system.MenuInfo;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.company.CompanyManager;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.service.system.menuGroup.menuGroup.MenuFunGroupManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.RightsHelper;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.dcits.platform.util.tree.TreeEntity;
/** 
 * 类名称：MenuController 菜单处理
 * 创建人：FH 
 * 创建时间：2015年10月27日
 * @version
 */
@Controller
@RequestMapping(value="/menu")
public class MenuController extends BaseController {

	String menuUrl = "menu.do"; //菜单地址(权限用)
	@Resource(name="menuService")
	private MenuManager menuService;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="companyService")
	private CompanyManager companyService;
	@Resource(name="MenuFunGroupService")
	private MenuFunGroupManager MenuFunGroupService;
	
	/**
	 * 显示菜单列表
	 * @param model
	 * @return
	 */
	@RequestMapping
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId==null||menuId.equals(null)){
			//根据菜单名称查询最顶层节点
			menuId = (String) session.getAttribute(USERID+"MMenuIdSession");
		}
		String keywords = pd.getString("keywords");					//检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String company = (String) session.getAttribute(USERID+"sessionComp");
		pd.put("COMPANY", company);
		try{
			String MENU_ID = (null == pd.get("MENU_ID") || "".equals(pd.get("MENU_ID").toString()))?"":pd.get("MENU_ID").toString();
			if(null != pd.get("id") && !"".equals(pd.get("id").toString())){
				MENU_ID = pd.get("id").toString();
			}
			
			//根据法人及父节点为0查询菜单ID
			pd.put("MENU_ID", MENU_ID);
			page.setPd(pd);
			List<MenuInfo> menuList = menuService.list(page);
			mv.addObject("pd", menuService.getMenuById(pd));	//传入父菜单所有信息
			mv.addObject("MENU_ID", MENU_ID);
			mv.addObject("USERNAME",session.getAttribute(USERID+Const.SESSION_USERNAME).toString());
			mv.addObject("MSG", null == pd.get("MSG")?"list":pd.get("MSG").toString()); //MSG=change 则为编辑或删除后跳转过来的
			mv.addObject("menuList", menuList);
			mv.setViewName("system/menu/menu_list");
			mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 请求新增菜单页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd()throws Exception{
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		ModelAndView mv = this.getModelAndView();
		try{
			PageData pd = this.getPageData();
			
			String company = (String) session.getAttribute(USERID+"sessionComp");
			if(company.equals("super")||company=="super"){
				List<PageData> listComp = companyService.listAllComp("");
				mv.addObject("listComp",listComp);
			}
			
			pd.put("COMPANY", company);
			String MENU_ID = (null == pd.get("MENU_ID") || "".equals(pd.get("MENU_ID").toString()))?"0":pd.get("MENU_ID").toString();//接收传过来的上级菜单ID,如果上级为顶级就取值“0”
			pd.put("MENU_ID",MENU_ID);
			PageData pds =menuService.getMenuById(pd);
			if(pds==null){
				pd.put("PARENT_ID", "0");
				pd.put("MENU_TYPE", "2");
				pd.put("MENU_STATE", "0");
			}else{
				pd.put("PARENT_ID", pds.get("MENU_ID").toString());
				pd.put("MENU_TYPE", pds.get("MENU_TYPE").toString());
				pd.put("MENU_STATE", pds.get("MENU_STATE").toString());
			}
			mv.addObject("pd", pd);
			mv.addObject("COMPANY", company);
			mv.addObject("pds", pds);	//传入父菜单所有信息
			mv.addObject("MENU_ID", MENU_ID);					//传入菜单ID，作为子菜单的父菜单ID用
			mv.addObject("MSG", "add");							//执行状态 add 为添加
			mv.setViewName("system/menu/menu_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}	
	
	/**
	 * 保存菜单信息
	 * @param menu
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView add()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"保存菜单");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		if(pd.getString("PARENT_ID").equals("0")||pd.getString("PARENT_ID")=="0"||pd.getString("MENU_URL")==null||pd.getString("MENU_URL").equals(null)||pd.getString("MENU_URL").equals("")||pd.getString("MENU_URL")==""){
			pd.put("MENU_URL", "#");
		}
		try{
			pd.put("MENU_ID", String.valueOf(Integer.parseInt(menuService.findMaxId(pd).get("MID").toString())+1));
			pd.put("MENU_ICON", "menu-icon fa fa-leaf black");
			menuService.saveMenu(pd); //保存菜单
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除菜单
	 * @param MENU_ID
	 * @param out
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String MENU_ID)throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除菜单");
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		PageData pd = this.getPageData();
		pd.put("COMPANY", company);
		pd.put("MENU_ID", MENU_ID);
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "";
		String operResult = "删除菜单失败";
		try{
			if(menuService.listSubMenuByParentId(pd).size() > 0){//判断是否有子菜单，是：不允许删除
				errInfo = "false";
			}else{
				menuService.deleteMenuById(pd);
				errInfo = "success";
				operResult = "删除菜单成功";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 请求编辑菜单页面
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		try{
			if(company.equals("super")||company=="super"){
				List<PageData> listComp = companyService.listAllComp("");
				mv.addObject("listComp",listComp);
			}
			
			String id = pd.getString("MENU_ID");
			String url = pd.getString("url");
			pd.put("COMPANY", company);
			pd = menuService.getMenuById(pd);	//读取此ID的菜单数据
			pd.put("url", url);
			mv.addObject("pd", pd);				//放入视图容器
			pd.put("MENU_ID",pd.get("PARENT_ID").toString());			//用作读取父菜单信息
			mv.addObject("pds", menuService.getMenuById(pd));			//传入父菜单所有信息
			mv.addObject("MENU_ID", pd.get("PARENT_ID").toString());	//传入父菜单ID，作为子菜单的父菜单ID用
			mv.addObject("MSG", "edit");
			mv.addObject("COMPANY",company);
			pd.put("MENU_ID",id);			//复原本菜单ID
			mv.setViewName("system/menu/menu_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 保存编辑
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改菜单");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		if(pd.getString("PARENT_ID").equals("0")||pd.getString("PARENT_ID")=="0"||pd.getString("MENU_URL")==null||pd.getString("MENU_URL").equals(null)||pd.getString("MENU_URL").equals("")||pd.getString("MENU_URL")==""){
			pd.put("MENU_URL", "#");
		}
		try{
			menuService.edit(pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 请求编辑菜单图标页面
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toEditicon")
	public ModelAndView toEditicon(String MENU_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("MENU_ID",MENU_ID);
			mv.addObject("pd", pd);
			mv.setViewName("system/menu/menu_icon");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 保存菜单图标 
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/editicon")
	public ModelAndView editicon()throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改菜单图标");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String url = pd.get("url").toString();
		try{
			pd = menuService.editicon(pd);
			mv.addObject("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		//userService.operationLog(url,"修改菜单图标");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 显示菜单列表ztree(菜单管理)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listAllMenu")
	public ModelAndView listAllMenu(Model model,String MENU_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		if(MENU_ID==null){
			MENU_ID = "0";
		}
		PageData pd = this.getPageData();		
		String ID = pd.getString("menuId");
		
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		if(ID!=null&&!ID.equals(null)){
			session.setAttribute(USERID+"MMenuIdSession", ID);
		}else{
			ID = (String) session.getAttribute(USERID+"MMenuIdSession");
		}
		
		String company = (String) session.getAttribute(USERID+"sessionComp");
		try{
			JSONArray arr = JSONArray.fromObject(menuService.listAllMenu("0",company));
			String json = arr.toString();
			json = json.replaceAll("menuId", "id").replaceAll("parentId", "pId").replaceAll("menuName", "name").replaceAll("subMenu", "nodes").replaceAll("hasMenu", "checked").replaceAll("menuUrl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("MENU_ID",MENU_ID);
			mv.addObject("ID",ID);
			mv.setViewName("system/menu/menu_ztree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
//	/**
//	 * 显示菜单列表ztree(拓展左侧四级菜单)
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/otherlistMenu")
//	public ModelAndView otherlistMenu(Model model,String MENU_ID)throws Exception{
//		ModelAndView mv = this.getModelAndView();
//		try{
//			PageData pd = new PageData();
//			pd.put("MENU_ID", MENU_ID);
//			String MENU_URL = menuService.getMenuById(pd).getString("MENU_URL");
//			if("#".equals(MENU_URL.trim()) || "".equals(MENU_URL.trim()) || null == MENU_URL){
//				MENU_URL = "login_default.do";
//			}
//			String roleRights = Jurisdiction.getSession().getAttribute(Jurisdiction.getUsername() + Const.SESSION_ROLE_RIGHTS).toString();	//获取本角色菜单权限
//			List<Menu> athmenuList = menuService.listAllMenuQx(MENU_ID);					//获取某菜单下所有子菜单
//			athmenuList = this.readMenu(athmenuList, roleRights);							//根据权限分配菜单
//			JSONArray arr = JSONArray.fromObject(athmenuList);
//			String json = arr.toString();
//			json = json.replaceAll("MENU_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("MENU_NAME", "name").replaceAll("subMenu", "nodes").replaceAll("hasMenu", "checked").replaceAll("MENU_URL", "url").replaceAll("#", "");
//			model.addAttribute("zTreeNodes", json);
//			mv.addObject("MENU_URL",MENU_URL);		//本ID菜单链接
//			mv.setViewName("system/menu/menu_ztree_other");
//		} catch(Exception e){
//			logger.error(e.toString(), e);
//		}
//		return mv;
//	}
//	
//	/**根据角色权限获取本权限的菜单列表(递归处理)
//	 * @param menuList：传入的总菜单
//	 * @param roleRights：加密的权限字符串
//	 * @return
//	 */
//	public List<Menu> readMenu(List<Menu> menuList,String roleRights){
//		for(int i=0;i<menuList.size();i++){
//			menuList.get(i).setHasMenu(RightsHelper.testRights(roleRights, menuList.get(i).getMENU_ID()));
//			if(menuList.get(i).isHasMenu() && "1".equals(menuList.get(i).getMENU_STATE())){	//判断是否有此菜单权限并且是否隐藏
//				this.readMenu(menuList.get(i).getSubMenu(), roleRights);					//是：继续排查其子菜单
//			}else{
//				menuList.remove(i);
//				i--;
//			}
//		}
//		return menuList;
//	}
	
	/**判断菜单名是否存在
	 * @return
	 */
	@RequestMapping(value="/hasN")
	@ResponseBody
	public Object hasN(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		try{
			PageData pd = this.getPageData();
			if(menuService.findByCompany(pd) != null){
				errInfo = "error";
			}	
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	//菜单列表树
	@RequestMapping(value="/tree")
	@ResponseBody
	public Object MenuTree(){
		List<TreeEntity> menuList = new ArrayList<TreeEntity>();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
			if (user != null) {
				String USERNAME = user.getUSERNAME();
				menuList = menuService.getMenuByUserName(USERNAME, user.getCOMPANY());
			}
		} catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return menuList;
	}
	
}
