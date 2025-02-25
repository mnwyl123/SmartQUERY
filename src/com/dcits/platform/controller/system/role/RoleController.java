package com.dcits.platform.controller.system.role;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Menu;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.appuser.AppuserManager;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.service.system.role.RoleManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.RightsHelper;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.dcits.platform.util.tree.TreeEntity;
/** 
 * 类名称：RoleController 角色权限管理
 * 创建人：  
 * 修改时间：2015年11月6日
 * @version
 */
@Controller
@RequestMapping(value="/role")
public class RoleController extends BaseController {
	
	String menuUrl = "role/roleList.do"; //菜单地址(权限用)
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	
	private RoleAuthFactory roleAtuhFactory;
	
	/** 进入权限首页
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/roleList")
	public ModelAndView roleList(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String USERID = user.getUSER_ID();
			String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);

			List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
			String menuId = pd.getString("menuId");
			if(menuId!=null&&!menuId.equals(null)){
				session.setAttribute(USERID+"roleMenuIdSession", menuId);
			}else{
				menuId = (String) session.getAttribute(USERID+"roleMenuIdSession");
			}
			pd.put("COMPANY", company); 
			pd.put("USER_ID", USERID);
			String keywords = pd.getString("keywords");					//检索条件
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
			page.setPd(pd);
			List<Role> roleList_z = roleService.listAllRolesByPId(page);		//列出此组下架角色
			Map<String,String> list = (Map<String, String>) roleAtuhFactory.getHC(roleIds,menuId);
			mv.addObject("pd", pd);
			mv.addObject("roleList_z", roleList_z);
			mv.setViewName("system/role/role_list");
			mv.addObject("QX",list);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**去新增页面
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			mv.addObject("msg", "add");
			mv.setViewName("system/role/role_edit");
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**保存新增角色
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView add()throws Exception{
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增角色");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();

			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String USERID = user.getUSER_ID();
			String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
			
			pd.put("ROLE_ID", this.get32UUID());	//ID 主键
			
			pd.put("COMPANY", company); 
			Boolean flag = (Boolean) session.getAttribute(USERID+"isCompany");
			if(!flag){
				//普通用户添加
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("USER_ID",USERID);
	        	map.put("ROLE_ID",pd.get("ROLE_ID").toString());
				userService.saveRoleAuth(map); 	//执行保存	
			}
			roleService.add(pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**请求编辑
	 * @param ROLE_ID
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit( String ROLE_ID )throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String USERID = user.getUSER_ID();
			String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
			
			pd = this.getPageData();
			pd.put("ROLE_ID", ROLE_ID);   
			pd.put("COMPANY", company);
			pd = roleService.findObjectById(pd);

			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			mv.setViewName("system/role/role_edit");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**保存修改
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit()throws Exception{
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改角色");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			roleService.edit(pd);
			mv.addObject("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除角色
	 * @param ROLE_ID
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object deleteRole(@RequestParam String ROLE_ID)throws Exception{
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除角色");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		String errInfo = "";
		
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		try{
			pd.put("ROLE_ID", ROLE_ID);
			pd.put("COMPANY", company);
		
			//判断该角色是否授权用户
			if(roleService.findByRoleId(pd).size()>0){
				errInfo = "error";
			}else{
				roleService.deleteRoleById(pd);	//执行删除
				roleService.deleteByRoleId(pd); //删除用户角色关联表中数据
				roleService.deletePolicyById(ROLE_ID);
				errInfo = "success";
			}
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 显示菜单列表ztree(菜单授权菜单)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/menuqx")
	public ModelAndView listAllMenu(Model model,String ROLE_ID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String USERID = user.getUSER_ID();
			String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
			List<TreeEntity> menuList=roleService.getMenuAuthByCompany(ROLE_ID, company);//menuList = this.readMenu(menuList, roleRights);			//根据角色权限处理菜单权限状态(递归处理)
			JSONArray arr = (JSONArray) JSONArray.toJSON(menuList);
			String json = arr.toString();	
			json = json.replaceAll("MENU_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("title", "name").replaceAll("childNodeList", "nodes").replaceAll("\"false\"","false").replaceAll("\"true\"", "true");
			//根据角色ID查询相关菜单ID
			List<String> IDs = roleService.findMenuId(ROLE_ID);
			model.addAttribute("zTreeNodes", json);
			mv.addObject("ROLE_ID",ROLE_ID);
			mv.addObject("ID",IDs);
			mv.setViewName("system/role/menuqx");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**保存角色菜单权限
	 * @param ROLE_ID 角色ID
	 * @param menuIds 菜单ID集合
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/saveMenuqx")
	public void saveMenuqx(@RequestParam String roleId,@RequestParam String resoIds,@RequestParam String resoAllInfo,PrintWriter out)throws Exception{
		PageData pd = new PageData();
		try{
			 if(null != roleId &&  !"".equals(roleId.trim())){
			    pd.put("ROLE_ID", roleId);
			    roleService.deletePolicyById(roleId);
				    
			    JSONArray dataJson = JSONArray.parseArray(resoAllInfo.toString());
			    for (int i = 0; i < dataJson.size(); i++) {
			    	Map<String,Object> map = new HashMap<String,Object>();
			        JSONObject jsonObject = dataJson.getJSONObject(i);
		        	map.put("ROLE_ID",roleId);
		        	map.put("MENU_ID",jsonObject.get("menuId"));
		        	map.put("FUN_GROUP_ID",jsonObject.get("funGroupId"));
		        	map.put("FUN_ID",jsonObject.get("funId"));
		        	roleService.insertPolicy(map);		
			    }
			}
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		RoleAuthFactory.refresh();
	}

	
	/**根据角色权限处理权限状态(递归处理)
	 * @param menuList：传入的总菜单
	 * @param roleRights：加密的权限字符串
	 * @return
	 */
	public List<Menu> readMenu(List<Menu> menuList,String roleRights){
		for(int i=0;i<menuList.size();i++){
			menuList.get(i).setHasMenu(RightsHelper.testRights(roleRights, menuList.get(i).getMENU_ID()));
			this.readMenu(menuList.get(i).getSubMenu(), roleRights);					//是：继续排查其子菜单
		}
		return menuList;
	}
	
	/**判断角色名是否存在
	 * @return
	 */
	@RequestMapping(value="/hasR")
	@ResponseBody
	public Object hasR(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		try{
			pd = this.getPageData();
			pd.put("company", company);
			if(roleService.findByCom(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
}