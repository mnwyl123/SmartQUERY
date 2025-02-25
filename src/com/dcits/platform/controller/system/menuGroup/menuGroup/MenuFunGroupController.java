package com.dcits.platform.controller.system.menuGroup.menuGroup;

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
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.menuGroup.menuGroup.MenuFunGroupManager;
import com.dcits.platform.service.system.menuGroup.menuGroupmx.MenuFunGroupMxManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.Tools;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 说明：菜单功能组
 * 创建人：huangzwf
 * 创建时间：2016-11-22
 */
@Controller
@RequestMapping(value="/menuGroup")
public class MenuFunGroupController extends BaseController {
	
	String menuUrl = "menuGroup/list.do"; //菜单地址(权限用)
	@Resource(name="MenuFunGroupService")
	private MenuFunGroupManager MenuFunGroupService;
	
	@Resource(name="MenuFunGroupmxService")
	private MenuFunGroupMxManager MenuFunGroupmxService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增menuFunGroup");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		//pd.put("FUN_GROUP_ID", this.get32UUID());	//主键
		MenuFunGroupService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws NumberFormatException 
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete() throws NumberFormatException, Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除menuFunGroup");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		String errInfo = "success";
		//判读资源是否被使用
		if(Integer.parseInt(MenuFunGroupmxService.findMenuCount(pd).get("NUM").toString()) > 0){
			errInfo = "error";
		}else if(Integer.parseInt(MenuFunGroupmxService.findCount(pd).get("ZS").toString()) > 0){
			errInfo = "false";
		}else{
			MenuFunGroupService.delete(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"修改menuFunGroup");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		MenuFunGroupService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表MenuFunGroup");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"MenuGroupMenuIdSession", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"MenuGroupMenuIdSession");
		}
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = MenuFunGroupService.list(page);	//列出FunGroup列表
		mv.setViewName("system/menuGroup/menuGroup/MGroup_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("system/menuGroup/menuGroup/MGroup_add");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
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
		pd = MenuFunGroupService.findById(pd);	//根据ID读取
		mv.setViewName("system/menuGroup/menuGroup/MGroup_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除menuFunGroup");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = this.getPageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		String msgInfo = "ok";
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			//循环删除
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				pd.put("FUN_GROUP_ID", ArrayDATA_IDS[i].trim().toString());
				//判读资源是否被使用
				if(Integer.parseInt(MenuFunGroupmxService.findMenuCount(pd).get("NUM").toString()) > 0){
					msgInfo = "error";
					break;
				}
				//判断资源是否有明细
				if(Integer.parseInt(MenuFunGroupmxService.findCount(pd).get("ZS").toString()) > 0){
					msgInfo = "false";
					break;
				}
			}
			if(msgInfo=="ok"||msgInfo.equals("ok")){
				MenuFunGroupService.deleteAll(ArrayDATA_IDS);
			}
		}else{
			msgInfo = "no";
		}
		map.put("result", msgInfo);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出menuFunGroup到excel");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("功能组名称");	//1
		titles.add("功能组英文名称");	//2
		titles.add("功能组描述");	//3
		dataMap.put("titles", titles);
		List<PageData> varOList = MenuFunGroupService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("FUN_GROUP_NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("FUN_GROUP_NAME_EN"));	    //2
			vpd.put("var3", varOList.get(i).getString("FUN_GROUP_DESC"));	//3
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	/**保存修改
	 * @return
	 */
	@RequestMapping(value="/editSave")
	@ResponseBody
	public Object editSave(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		try {
			MenuFunGroupService.edit(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断组ID是否存在
	 * @return
	 */
	@RequestMapping(value="/hasID")
	@ResponseBody
	public Object hasID(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		try{
			//查询该组ID是否存在
			pd = MenuFunGroupService.findById(pd);
			if(pd!=null&&!pd.equals(null)){
				errInfo = "false";
			}
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
}
