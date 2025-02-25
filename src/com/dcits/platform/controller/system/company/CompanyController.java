package com.dcits.platform.controller.system.company;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Department;
import com.dcits.platform.entity.system.MenuInfo;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.company.CompanyManager;
import com.dcits.platform.service.system.department.DepartmentManager;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.service.system.pwdRuleConfig.pwdRuleConfigManager;
import com.dcits.platform.service.system.role.RoleManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.FileUpload;
import com.dcits.platform.util.GetPinyin;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.ObjectExcelRead;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.Tools;

/** 
 * 类名称：UserController
 * 创建人：FH fhpengyj (pengyj)
 * 更新时间：2015年11月3日
 * @version
 */
@Controller
@RequestMapping(value="/company")
public class CompanyController extends BaseController {
	
	String menuUrl = "company/listCompany.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="companyService")
	private CompanyManager companyService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="pwdRuleConfigService")
	private pwdRuleConfigManager pwdRuleConfigService;
	
	/**显示法人列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listCompany")
	public ModelAndView listCompany(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		PageData pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
//		String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
//		String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
//		if(lastLoginStart != null && !"".equals(lastLoginStart)){
//			pd.put("lastLoginStart", lastLoginStart+" 00:00:00");
//		}
//		if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
//			pd.put("lastLoginEnd", lastLoginEnd+" 00:00:00");
//		} 
		pd.put("USERCODE", userInfo.getUSERNAME());
		page.setPd(pd);
		List<PageData>	companyList = companyService.listCompanys(page);	//列出用户列表
		mv.setViewName("system/company/company_list");
		mv.addObject("companyList", companyList);
		mv.addObject("pd", pd);
		return mv;
	}
	/**去新增法人页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddC")
	public ModelAndView goAddC()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/company/company_edit");
		mv.addObject("msg", "saveC");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存法人
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveC")
	public ModelAndView saveC() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USER_CODE", "admin"+pd.get("COMP_CODE"));
		pd.put("USER_ID", this.get32UUID());	//ID 主键
		pd.put("LAST_LOGIN", "");				//最后登录时间
		pd.put("IP", "");						//IP
		pd.put("SKIN", "default");
		pd.put("USERNAME", pd.get("USER_CODE"));
		pd.put("NAME", pd.get("COMP_NAME"));
		pd.put("COMPANY", pd.get("COMP_CODE"));
		pd.put("LOCK_STATUS", "1");
		pd.put("UPDATE_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		pd.put("PASSWORD", new SimpleHash("SHA-1", pd.get("USER_CODE"), pwdRuleConfigService.checkPass("")).toString());	//密码加密
		if((null == userService.findByUsername(pd))&&(null == companyService.findByCompCode(pd))){	//判断法人代码是否存在
			userService.saveU(pd); 					//执行保存
			companyService.saveC(pd);
//			//查询所需菜单，建立法人时建立对应菜单
//			List<MenuInfo> menus = menuService.getAllMenu("0");
//			//获取菜单最大ID
//			int MaxId = Integer.parseInt(menuService.findMaxId(pd).get("MID").toString()); 
//			for(int i=0;i<menus.size();i++){
//				String Id = String.valueOf(MaxId+1+i);
//				String parentId = menus.get(i).getParentId();
//				if(parentId !="0"&&!parentId.equals("0")){
//					menus.get(i).setParentId(String.valueOf(Integer.parseInt(parentId)+MaxId));
//				}
//				menus.get(i).setMenuId(Id);
//				String url = menus.get(i).getMenuUrl();
//				if(url !="#"&&!url.equals("#")){
//					if(url.contains("menuId")){
//						String[] s = url.split("menuId");
//						url = s[0];
//					}
//					if(url.contains("=")){
//						url += "&menuId="+Id;
//					}
//					if((url.substring(url.length()-1, url.length())).toString()=="?"||(url.substring(url.length()-1, url.length())).toString().equals("?")){
//						url += "menuId="+Id;
//					}else {
//						url += "?menuId="+Id;
//					}
//				}
//				menus.get(i).setMenuUrl(url);
//				menus.get(i).setCompany(pd.get("COMP_CODE").toString());
//			}
//			//建立对应菜单
//			companyService.buildMenu(menus);
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	/**去修改法人页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditC")
	public ModelAndView goEditC() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = companyService.findByCompCode(pd);			//根据comp_code在法人表中查找
		String user_id = userService.findByCompCodeandName(pd);		//根据法人代码和名称在用户表中查找
		pd.put("USER_ID", user_id);
		PageData pdd = userService.findById(pd);								//根据ID读取
		pd.putAll(pdd);
		mv.setViewName("system/company/company_edit");
		mv.addObject("msg", "editC");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 修改法人信息
	 */
	@RequestMapping(value="/editC")
	public ModelAndView editU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USER_CODE", "admin"+pd.get("COMP_CODE"));
		pd.put("USERNAME", pd.get("USER_CODE"));
		pd.put("NAME", pd.get("COMP_NAME"));
		//pd.put("PASSWORD", new SimpleHash("SHA-1", pd.get("COMP_NAME"), userService.checkPass("")).toString());	//密码加密
		if("1".equals(pd.getString("LOCK_STATUS"))){
			pd.put("ERR_TIMES", "0");
		}
		userService.editU(pd);	//执行修改
		companyService.editC(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**判断法人代码是否存在
	 * @return
	 */
	@RequestMapping(value="/hasC")
	@ResponseBody
	public Object hasC(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(companyService.findByCompCode(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**删除法人
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteC")
	public void deleteU(PrintWriter out) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		userService.deleteUC(pd);
		companyService.deleteC(pd);
		out.write("success");
		out.close();
	}
	/**
	 * 批量删除
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteAllC")
	@ResponseBody
	public Object deleteAllU() throws Exception {
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String COMP_CODES = pd.getString("COMP_CODES");
		if(null != COMP_CODES && !"".equals(COMP_CODES)){
			String ArrayCOMP_CODES[] = COMP_CODES.split(",");
			userService.deleteAllUC(ArrayCOMP_CODES);
			companyService.deleteAllC(ArrayCOMP_CODES);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
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
			String USER_ID = userService.findByCompCodeandName(pd);
			pd.put("USER_ID", USER_ID);
			pd.put("ERR_TIMES","0");
			pd.put("LOCK_STATUS","1");
			pd.put("PASSWORD",new SimpleHash("SHA-1", pd.getString("USER_CODE"), pwdRuleConfigService.checkPass("")).toString());
			userService.updateUnLock(pd);
		} catch(Exception e){
			errInfo = "false";
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
}
