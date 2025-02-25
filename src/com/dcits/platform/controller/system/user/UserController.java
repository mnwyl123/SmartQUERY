package com.dcits.platform.controller.system.user;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.dcits.credit.service.ChannelService.ChannelManager;
import com.dcits.credit.service.ProductService.ProductManager;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.dictionaries.DictionariesManager;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.service.system.pwdRuleConfig.pwdRuleConfigManager;
import com.dcits.platform.service.system.role.RoleManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.FileUpload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.ObjectExcelRead;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.PwdRuleCheck;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.sun.org.apache.bcel.internal.generic.Select;

/** 
 * 类名称：UserController
 * 创建人：FH fhpengyj (pengyj)
 * 更新时间：2015年11月3日
 * @version
 */
@Controller
@RequestMapping(value="/user")
public class UserController extends BaseController {
	
	String menuUrl = "user/listUsers.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="pwdRuleConfigService")
	private pwdRuleConfigManager pwdRuleConfigService ;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="orgService")
	private OrgManager orgService;
	@Resource(name="operationService")
	private OperationManager operationService;
	@Resource(name="PersonInquiryService")
	private PersonInquiryManager PersonInquiryService;
	@Resource(name="channelService")
	private ChannelManager channelService ;
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	@Resource(name="productService")
	private ProductManager productService ;
	private RoleAuthFactory roleAtuhFactory;
	
	/**显示用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listUsers")
	public ModelAndView listUsers(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		Org curOrg = (Org) session.getAttribute(USERID+Const.SESSION_ORG);
		if(curOrg!=null){
			pd.put("orgId", curOrg.getOrgId());
		}

		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"userMenuIdSession", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"userMenuIdSession");
		}
		pd.put("COMPANY", company); 
		pd.put("curUser", user.getUSERNAME());
		pd.put("curComp", "admin"+company);
		pd.put("USER_ID", USERID);
		page.setPd(pd);
		
		PageData data = new PageData();
		data.putAll(pd);
		data.put("keywords", "");
		List<Role> roleList = roleService.listRolesByPId(data);//列出所有系统用户角色
		Map<String,String> map = roleAtuhFactory.getHC(roleIds,menuId);
		List<Org> orgList = orgService.listAllOrgByCompany(company);
		List<PageData> productInfo = productService.Productlist(pd);
		List<PageData>	userList = userService.listUsers(page);	//列出用户列表
		String roleCount="0";
		String orgCount="0";
		String proCount="0";
		if(roleList.size()>0){
			roleCount = "1";
		}
		if(orgList.size()>0){
			orgCount = "1";
		}
		if(productInfo.size()>0){
			proCount = "1";
		}
		pd.put("roleCount", roleCount);
		pd.put("orgCount", orgCount);
		mv.setViewName("system/user/user_list");
		mv.addObject("userList", userList);
		mv.addObject("productList", productInfo);
		mv.addObject("roleList", roleList);
		mv.addObject("orgList",orgList);
		mv.addObject("pd", pd);
		mv.addObject("QX",map);	//按钮权限
		return mv;
	}
	
	/**删除用户
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteU")
	public void deleteU(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除user");
		PageData pd = new PageData();
		pd = this.getPageData();
		userService.deleteU(pd);
		out.write("success");
		out.close();
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddU")
	public ModelAndView goAddU()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip=request.getRemoteAddr();  
	    }else{
	    	ip=request.getHeader("x-forwarded-for"); 
	    }
		pd.put("IP", ip);
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		pd.put("COMPANY", company); 
		List<PageData> channelList = channelService.queryChannel(pd);  //渠道信息
		//pd.put("MAC", operationService.getMac(ip));
		mv.setViewName("system/user/user_add");
		mv.addObject("msg", "saveU");
		mv.addObject("pd", pd);
		mv.addObject("channelList", channelList);
		return mv;
	}
	
	/**去用户授权页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAuthOrg")
	public ModelAndView goAuthOrg(Model model)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		List<String> IDs = new ArrayList<String>();
		String json ="";
		//从数据库中读取已经授权的机构ID
		if(pd.get("type").toString()=="org"||pd.get("type").toString().equals("org")){
			//机构授权
			IDs = userService.findOrgId(pd.get("USER_ID").toString());
			net.sf.json.JSONArray arr = net.sf.json.JSONArray.fromObject(orgService.listAllOrg("0",company));
			json = arr.toString();
			json = json.replaceAll("orgId", "id").replaceAll("parentId", "pId").replaceAll("name", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");
			mv.setViewName("system/user/user_OrgAuth");
		}else if(pd.get("type").toString()=="pro"||pd.get("type").toString().equals("pro")){
			//产品授权
			IDs = userService.findProId(pd.get("USER_ID").toString());
			net.sf.json.JSONArray arr = net.sf.json.JSONArray.fromObject(productService.Productlist(pd));
			json = arr.toString();
			json = json.replaceAll("PRODUCT_ID", "id").replaceAll("PRODUCT_NAME", "name");
			mv.setViewName("system/user/user_proAuth");
		}else{
			//角色授权
			IDs = userService.findRoleId(pd.get("USER_ID").toString());
			net.sf.json.JSONArray arr = net.sf.json.JSONArray.fromObject(roleService.listAllRole(company));
			json = arr.toString();
			json = json.replaceAll("ROLE_ID", "id").replaceAll("ROLE_NAME", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");
			mv.setViewName("system/user/user_auth");
		}
		model.addAttribute("zTreeNodes", json);
		mv.addObject("ID",IDs);
		mv.addObject("pd", pd);	
		return mv;
	}

	@RequestMapping(value="/saveAuth")
	@ResponseBody
	public Object saveAuth() throws Exception{
		Map<String,String> result = new HashMap<String,String>();
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		PageData pd = this.getPageData();
		JSONArray dataJson = JSONArray.parseArray(pd.getString("AllInfo"));
		String flag = "0";
		String userId = pd.getString("userId");
		String type = pd.getString("type");
		if(type=="org"||type.equals("org")){
			//机构
			//删除已授权
			userService.deleteAuthOrg(userId);
			for (int i = 0; i < dataJson.size(); i++) {
		    	  Map<String,Object> map = new HashMap<String,Object>();
		        JSONObject jsonObject = dataJson.getJSONObject(i);
		        	map.put("USER_ID",userId);
		        	map.put("ORG_ID",jsonObject.get("id"));
		        	userService.saveOrgAuth(map); 	//执行保存		
		    }
			}else if(type=="pro"||type.equals("pro")){
			//产品
			//删除已授权
			userService.deleteAuthPro(userId);
			for (int i = 0; i < dataJson.size(); i++) {
		    	  Map<String,Object> map = new HashMap<String,Object>();
		        JSONObject jsonObject = dataJson.getJSONObject(i);
		        	map.put("USER_ID",userId);
		        	map.put("PRO_ID",jsonObject.get("id"));
		        	userService.saveproAuth(map); 	//执行保存		
		    }
			}else{
			PageData pdd = new PageData();
			//判断是否关联查询员角色
			String[] listRoleId = new String[dataJson.size()];
			for (int i = 0; i < dataJson.size(); i++) {
		        JSONObject jsonObject = dataJson.getJSONObject(i);
		        	pdd.put("USER_ID",userId);
		        	listRoleId[i]=jsonObject.get("id").toString();
		    }
			List<String> list = userService.findQueryRole(listRoleId);
			//含有查询员角色
			if(list.size()>0){
				//查询当前用户是否有个人和企业查询
				pd.put("USER_ID", userId);
				PageData userPd = userService.findById(pd);	
				//初始化查询次数
				try{//个人
					if(userPd.get("USERNAME_PERBANK")!=null){
						PersonInquiryService.updateQueryCount(userId,userPd.getString("USERNAME"),"1");
					}
					
					//企业
					if(userPd.get("USERNAME_PERBANK_ORG")!=null){
						PersonInquiryService.updateQueryCount(userId,userPd.getString("USERNAME"),"2");
					}
				}catch(Exception e){
					logger.error(e.getMessage());
				}
				
				//查询当前用户是否含有人行账户
				pd = userService.findById(pdd);
				if((pd.get("USERNAME_PERBANK")!=null&&!"".equals(pd.getString("USERNAME_PERBANK")))||(pd.get("USERNAME_PERBANK_ORG")!=null&&!"".equals(pd.getString("USERNAME_PERBANK_ORG")))){
					flag="0";
				}else{
					flag="1";
				}
			}
			
			if("0".equals(flag)){
				//角色
				//删除已授权
				userService.deleteAuthRole(userId);
				for (int i = 0; i < dataJson.size(); i++) {
			    	  Map<String,Object> map = new HashMap<String,Object>();
			        JSONObject jsonObject = dataJson.getJSONObject(i);
			        	map.put("USER_ID",userId);
			        	map.put("ROLE_ID",jsonObject.get("id"));
			        	userService.saveRoleAuth(map); 	//执行保存		
			    }
			}
		}
		result.put("flag", flag);
		return result;
	//	mv.addObject("flag", flag);
//		mv.addObject("msg","success");
//		mv.addObject("msg","failed");
//		mv.setViewName("save_result");
//		return mv;
	}
	
	/**保存用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveU")
	public ModelAndView saveU() throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		ModelAndView mv = this.getModelAndView();
		
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		PageData pd = this.getPageData();
		pd.put("USER_ID", this.get32UUID());	//ID 主键
		pd.put("COMPANY", company); 
		pd.put("LAST_LOGIN", "");				//最后登录时间
//		pd.put("IP", "");						//IP
		pd.put("STATE", "0");					//状态
		pd.put("SKIN", "default");
		pd.put("RIGHTS", "");
		pd.put("LOCK_STATUS", "1");
		pd.put("UPDATE_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pwdRuleConfigService.checkPass("")).toString());	//密码加密
		if(null == userService.findByUsername(pd)){	//判断用户名是否存在
			userService.saveU(pd); 					//执行保存
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**判断用户名是否存在
	 * @return
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public Object hasU(){
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
			if(userService.findByUsername(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断邮箱是否存在
	 * @return
	 */
	@RequestMapping(value="/hasE")
	@ResponseBody
	public Object hasE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUE(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断编码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasN")
	@ResponseBody
	public Object hasN(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(userService.findByUN(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**去修改用户页面  zy
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditU")
	public ModelAndView goEditU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd = this.getPageData();
		//String userId = pd.get("USER_ID").toString();
//		String fx = pd.getString("fx");//顶部修改个人资料
//		if("head".equals(fx)){
//			mv.addObject("fx", "head");
//		}else{
//			mv.addObject("fx", "user");
//		}
//		pd.put("ROLE_ID", "1");
//		pd.put("COMPANY", company);
//		pd.put("USER_ID", USERID);
//		Page page = new Page();
//		page.setPd(pd);
//		List<Role> roleList = roleService.listAllRolesByPId(page);	//列出所有系统用户角色
		//pd.put("USER_ID", userId);
//		PageData pdd = userService.findPolicy(pd);
//		if(pdd!=null){
//			mv.addObject("flag", "Y");
//		}else{
//			mv.addObject("flag", "N");
//		}
 		pd = userService.findById(pd);								//根据ID读取
 		//查询当前用户的渠道信息
 		PageData pd1 = channelService.queryChannelById(pd);
		pd.put("COMPANY", company); 
 		List<PageData> channelList = channelService.queryChannel(pd);  //所有渠道信息
 		if(pd1!=null){
 			int count = 0;
 			for(int i=0;i<channelList.size();i++){
 	 			if(!String.valueOf(pd1.get("CHANNEL_ID")).equals(String.valueOf(channelList.get(i).get("CHANNEL_ID")))){
 	 				count++;
 	 			}
 	 		}
 			if(count==channelList.size()||channelList.size()==0){
 				channelList.add(pd1);
 			}
 		}
 		
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("channelList", channelList);
		//mv.addObject("roleList", roleList);
		return mv;
	}
	
	
	/**查看用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/view")
	public ModelAndView view() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd = userService.findByUserId(pd);						//根据ID读取
		mv.setViewName("system/user/user_view");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去修改用户页面(在线管理页面打开)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditUfromOnline")
	public ModelAndView goEditUfromOnline() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
//		pd.put("ROLE_ID", "1");
//		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色
		pd = userService.findByUsername(pd);						//根据ID读取
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
//		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**
	 * 校验密码规则  hzw
	 */
	@RequestMapping(value="/pwdCheck",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object pwdCheck() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"校验密码规则");
		PwdRuleCheck pwdRuleCheck = new PwdRuleCheck();
		//返回信息
		Map<String,String> map = new HashMap<String,String>();
		String msg = null;
		//获取页面传入值
		PageData pd = this.getPageData();
		String password = pd.getString("password");
		//查询用户密码
		PageData pdUser = userService.findById(pd);
		//查询密码规则并校验
		pd = pwdRuleConfigService.list(pd);
		msg = pwdRuleCheck.checkPassword(pd,password);
		if(msg!=null&&!"".equals(msg)){
			map.put("result", "fail");
			map.put("msg", msg);
		}else{
			//判断是否与原密码相同
			String pwd = new SimpleHash("SHA-1", pdUser.getString("USERNAME"), password).toString();
			if(pwd.equals(pdUser.getString("PASSWORD"))){
				msg ="新密码与原密码不能相同!";
				map.put("result", "fail");
				map.put("msg", msg);
			}else{
				map.put("result", "success");
			}
		}
		
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 修改用户  zy
	 */
	@RequestMapping(value="/editU")
	public ModelAndView editU() throws Exception{
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改ser");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("PASSWORD") != null && !"".equals(pd.getString("PASSWORD"))){
			pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString());
		}
		if("1".equals(pd.getString("LOCK_STATUS"))){
			pd.put("ERR_TIMES", "0");
		}
		userService.editU(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 批量删除
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteAllU")
	@ResponseBody
	public Object deleteAllU() throws Exception {
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除user");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String USER_IDS = pd.getString("USER_IDS");
		if(null != USER_IDS && !"".equals(USER_IDS)){
			String ArrayUSER_IDS[] = USER_IDS.split(",");
			userService.deleteAllU(ArrayUSER_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**导出用户信息到EXCEL
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		Page page = new Page();
		PageData pd = this.getPageData();
		Org curOrg = (Org) session.getAttribute(USERID+Const.SESSION_ORG);
		if(curOrg!=null){
			pd.put("orgId", curOrg.getOrgId());
		}
		pd.put("COMPANY", company); 
		pd.put("curUser", user.getUSERNAME());
		pd.put("curComp", "admin"+company);
		pd.put("USER_ID", USERID);
		try{
		//	if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
				String keywords = pd.getString("keywords");				//关键词检索条件
				if(null != keywords && !"".equals(keywords)){
					pd.put("keywords", keywords.trim());
				}
				String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
				String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
				if(lastLoginStart != null && !"".equals(lastLoginStart)){
					pd.put("lastLoginStart", lastLoginStart+" 00:00:00");
				}
				if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
					pd.put("lastLoginEnd", lastLoginEnd+" 00:00:00");
				} 
				Map<String,Object> dataMap = new HashMap<String,Object>();
				List<String> titles = new ArrayList<String>();
				titles.add("用户名"); 		//1
				titles.add("姓名");			//2
				//titles.add("柜员号");		//3
				titles.add("所属部门");		//3
				titles.add("所属机构");		//4
				titles.add("手机");			//5
				titles.add("邮箱");			//6
				titles.add("人行征信登录账号(个人)");//7
				titles.add("人行征信登录账号(企业)");//8
				titles.add("是否线上用户");//9
				titles.add("最近登录");		//10
				titles.add("IP地址");	//11
				titles.add("MAC地址");	//12
				titles.add("用户状态");	//13
				titles.add("渠道编号");	//14
				dataMap.put("titles", titles);
				page.setPd(pd);
				List<PageData>	userList = userService.OutUsers(page);	//列出用户列表
					
				//将userList中的数据字典列转为中文导出  
				PageData dict = new PageData();				
				dict.put("PARENT_ID", "0");
				PageData parent_ssbm = new PageData();
				dict.put("DICT_CODE", "DeptCode");
				parent_ssbm = dictionariesService.findByBianma(dict);//所属部门
				PageData code = new PageData();
				code.put("PARENT_ID", parent_ssbm.getString("DICTIONARIES_ID"));
				for(PageData p_user:userList){						
					code.put("DICT_CODE",p_user.getString("DEPT_CODE"));
					PageData p = new PageData();
					p = dictionariesService.findByBianma(code);
					p_user.put("DEPT_CODE", p.getString("NAME"));//所属部门
					//用户状态
					if(("0").equals(p_user.getString("LOCK_STATUS"))){
						p_user.put("LOCK_STATUS", "无效");//
					}else if(("1").equals(p_user.getString("LOCK_STATUS"))){
						p_user.put("LOCK_STATUS", "正常");//
					}else if(("2").equals(p_user.getString("LOCK_STATUS"))){
						p_user.put("LOCK_STATUS", "睡眠");//
					}else if(("3").equals(p_user.getString("LOCK_STATUS"))){
						p_user.put("LOCK_STATUS", "锁定");//
					}
					//是否线上用户
					if(("0").equals(p_user.getString("IS_ONLINE_USER"))){
						p_user.put("IS_ONLINE_USER", "否");
					}else if(("1").equals(p_user.getString("IS_ONLINE_USER"))){
						p_user.put("IS_ONLINE_USER", "是");
					}
				}				
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<userList.size();i++){
					PageData vpd = new PageData();
					vpd.put("var1", userList.get(i).get("USERNAME"));		//1
					vpd.put("var2", userList.get(i).get("NAME"));			//2
					//vpd.put("var3", userList.get(i).get("TELLER_NUMBER"));			//3
					vpd.put("var3", userList.get(i).get("DEPT_CODE"));		//3
					vpd.put("var4", userList.get(i).get("ORGNAME"));		//4
					vpd.put("var5", userList.get(i).get("PHONE"));		//5
					vpd.put("var6", userList.get(i).get("EMAIL"));		//6
					vpd.put("var7", userList.get(i).get("USERNAME_PERBANK"));	//7
					vpd.put("var8", userList.get(i).get("USERNAME_PERBANK_ORG"));	//8
					vpd.put("var9", userList.get(i).get("IS_ONLINE_USER"));	//9
					vpd.put("var10", userList.get(i).get("LAST_LOGIN"));	//10
					vpd.put("var11", userList.get(i).get("IP"));	//11
					vpd.put("var12", userList.get(i).get("MAC"));	//12
					vpd.put("var13", userList.get(i).get("LOCK_STATUS"));	//13
					vpd.put("var14", userList.get(i).get("CHANNEL_ID"));	//14
					varList.add(vpd);
				}
				dataMap.put("varList", varList);
				ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
				mv = new ModelAndView(erv,dataMap);
		//	}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/user/uploadexcel");
		return mv;
	}
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "Users.xls", "Users.xls");
	}
	
	/**从EXCEL导入到数据库
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	@ResponseBody
	public Object readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String COMPANY = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		PageData pd = new PageData();
		pd.put("COMPANY", COMPANY);
		String RuserName="";
		String CuserName="";
		String msg = "error";
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "userexcel");							//执行上传
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);		//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			/*存入数据库操作======================================*/
			String initPas = pwdRuleConfigService.checkPass("");
			List<String> listUserCode = userService.findUserCode(pd);
			pd.put("LAST_LOGIN", "");
			pd.put("IP", "");
			pd.put("SKIN", "default");
			pd.put("PWD_ALTER_TIME", "");
			pd.put("STATE", "0");
			pd.put("LOCK_STATUS", "1");
			for(int i=0;i<listPd.size();i++){
				if(listPd.get(i).getString("var6").toString()==COMPANY||COMPANY.equals(listPd.get(i).getString("var6").toString())||listPd.get(i).getString("var6").toString()==""||listPd.get(i).getString("var6").toString().equals("")){
					int num=0;
					for(int j=0;j<listUserCode.size();j++){
						if(listPd.get(i).getString("var0").toString()==listUserCode.get(j).toString()||listUserCode.get(j).toString().equals(listPd.get(i).getString("var0").toString())){
							num++;
							RuserName+=listPd.get(i).getString("var0").toString()+";";
						}
					}
					if(num==0&&(listPd.get(i).getString("var0").toString()!=""&&!listPd.get(i).getString("var0").toString().equals(""))){
						pd.put("USER_ID", this.get32UUID());
						pd.put("USERNAME", listPd.get(i).getString("var0"));
						pd.put("NAME", listPd.get(i).getString("var1"));
						pd.put("PHONE", listPd.get(i).getString("var2"));
						pd.put("EMAIL", listPd.get(i).getString("var3"));
						pd.put("TELLER_NUMBER", listPd.get(i).getString("var4"));
						pd.put("DEPT_CODE", listPd.get(i).getString("var5"));
						if(listPd.get(i).getString("var6").toString()==""||listPd.get(i).getString("var6").toString().equals("")){
							pd.put("COMPANY", COMPANY);
						}else{
							pd.put("COMPANY", listPd.get(i).getString("var6"));
						}
						pd.put("USERNAME_PERBANK", listPd.get(i).getString("var7"));//人行登录编码（个人）
						pd.put("USERNAME_PERBANK_ORG", listPd.get(i).getString("var8"));//人行登录编码（企业）
						if(listPd.get(i).getString("var9").equals("是")){
							pd.put("IS_ONLINE_USER", "1");//否线上查询用户(0:否,1:是)
						}else if(listPd.get(i).getString("var9").equals("否")){
							pd.put("IS_ONLINE_USER", "0");//否线上查询用户(0:否,1:是)
						}
						pd.put("CHANNEL_ID", listPd.get(i).getString("var10"));
						pd.put("PASSWORD",  new SimpleHash("SHA-1", listPd.get(i).getString("var0"), initPas).toString());
						userService.saveU(pd);
					}
				}else{
					CuserName+=listPd.get(i).getString("var0").toString()+";";
				}
			}
			msg= "success";
		}
		if(RuserName.length()>0){
			RuserName+="已经存在,上传失败！";
			msg = "uInfo";
			map.put("RuserName",RuserName);
		}
		if(CuserName.length()>0){
			CuserName+="等用户法人不是当前法人,上传失败！";
			RuserName+=CuserName;
			msg = "uInfo";
			map.put("RuserName",RuserName);
		}
		map.put("msg",msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	/**解锁重置密码
	 * @return
	 */
	@RequestMapping(value="/unLock")
	@ResponseBody
	public Object unLock(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		try{
			pd.put("ERR_TIMES","0");
			pd.put("LOCK_STATUS","1");
			pd.put("PASSWORD",new SimpleHash("SHA-1", pd.getString("USERNAME"), pwdRuleConfigService.checkPass("")).toString());
			userService.updateUnLock(pd);
		} catch(Exception e){
			errInfo = "false";
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
}
