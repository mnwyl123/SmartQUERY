package com.dcits.platform.controller.system.dictionaries;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.dictionaries.DictionariesManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

/**
 * 说明：数据字典 创建人： 创建时间：2015-12-16
 */
@Controller
@RequestMapping(value = "/dictionaries")
public class DictionariesController extends BaseController {

	String menuUrl = "dictionaries/list.do"; // 菜单地址(权限用)
	@Resource(name = "dictionariesService")
	private DictionariesManager dictionariesService;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name = "userService")
	private UserManager userService;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增Dictionaries");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("DICTIONARIES_ID", this.get32UUID()); // 主键
		dictionariesService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param DICTIONARIES_ID
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Object delete(@RequestParam String DICTIONARIES_ID) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除Dictionaries");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = this.getPageData();
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID);
		String errInfo = "success";
		if (dictionariesService.listSubDictByParentId(DICTIONARIES_ID).size() > 0) {// 判断是否有子级，是：不允许删除
			errInfo = "false";
		} else {
			pd = dictionariesService.findById(pd);// 根据ID读取
			if (null != pd.get("TBSNAME") && !"".equals(pd.getString("TBSNAME"))) {
				String[] table = pd.getString("TBSNAME").split(",");
				for (int i = 0; i < table.length; i++) {
					pd.put("thisTable", table[i]);
					try {
						if (Integer.parseInt(dictionariesService.findFromTbs(pd).get("ZS").toString()) > 0) {// 判断是否被占用，是：不允许删除(去排查表检查字典表中的编码字段)
							errInfo = "false";
							break;
						}
					} catch (Exception e) {
						logger.error(e.toString(), e);
						errInfo = "false2";
						break;
					}
				}
			}
		}
		if ("success".equals(errInfo)) {
			dictionariesService.delete(pd); // 执行删除
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改Dictionaries");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		dictionariesService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表Dictionaries");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID + Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if (menuId == null || menuId.equals(null)) {
			// 根据菜单名称查询最顶层节点
			menuId = (String) session.getAttribute(USERID + "DictMenuIdSession");
		}
		String keywords = pd.getString("keywords"); // 检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		String DICTIONARIES_ID = null == pd.get("DICTIONARIES_ID") ? "" : pd.get("DICTIONARIES_ID").toString();
		if (null != pd.get("id") && !"".equals(pd.get("id").toString())) {
			DICTIONARIES_ID = pd.get("id").toString();
		}
		
		if(pd.get("parentId")!=null){
			DICTIONARIES_ID = pd.getString("parentId");
		}
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID); // 上级ID
		page.setPd(pd);
		List<PageData> varList = dictionariesService.list(page); // 列出Dictionaries列表
		mv.addObject("pd", dictionariesService.findById(pd)); // 传入上级所有信息
		mv.addObject("DICTIONARIES_ID", DICTIONARIES_ID); // 上级ID
		mv.setViewName("system/dictionaries/dictionaries_list");
		mv.addObject("varList", varList);
		mv.addObject("QX", roleAtuhFactory.getHC(roleIds, menuId)); // 按钮权限
		return mv;
	}

	/**
	 * 显示列表ztree
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/listAllDict")
	public ModelAndView listAllDict(Model model, String DICTIONARIES_ID) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String ID = pd.getString("menuId");
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		if (ID != null && !ID.equals(null)) {
			session.setAttribute(USERID + "DictMenuIdSession", ID);
		} else {
			ID = (String) session.getAttribute(USERID + "DictMenuIdSession");
		}
		if (DICTIONARIES_ID == null) {
			DICTIONARIES_ID = "0";
		}
		try {
			JSONArray arr = JSONArray.fromObject(dictionariesService.listAllDict("0"));
			String json = arr.toString();
			json = json.replaceAll("DICTIONARIES_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name")
					.replaceAll("subDict", "nodes").replaceAll("hasDict", "checked").replaceAll("treeurl", "url");
			model.addAttribute("zTreeNodes", json);
			mv.addObject("DICTIONARIES_ID", DICTIONARIES_ID);
			mv.addObject("pd", pd);
			mv.addObject("ID", ID);
			mv.setViewName("system/dictionaries/dictionaries_ztree");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String DICTIONARIES_ID = null == pd.get("DICTIONARIES_ID") ? "" : pd.get("DICTIONARIES_ID").toString();
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID); // 上级ID
		PageData pds = dictionariesService.findById(pd);
		if (pds == null) {
			pd.put("PARENT_ID", "0");
		} else {
			pd.put("PARENT_ID", pds.getString("DICTIONARIES_ID"));
		}
		mv.addObject("pd", pd);
		mv.addObject("pds", pds); // 传入上级所有信息
		mv.addObject("DICTIONARIES_ID", DICTIONARIES_ID); // 传入ID，作为子级ID用
		mv.setViewName("system/dictionaries/dictionaries_edit");
		mv.addObject("msg", "save");
		return mv;
	}

	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String DICTIONARIES_ID = pd.getString("DICTIONARIES_ID");
		String url = pd.getString("url");
		pd = dictionariesService.findById(pd); // 根据ID读取
		pd.put("url", url);
		mv.addObject("pd", pd); // 放入视图容器
		pd.put("DICTIONARIES_ID", pd.get("PARENT_ID").toString()); // 用作上级信息
		mv.addObject("pds", dictionariesService.findById(pd)); // 传入上级所有信息
		mv.addObject("DICTIONARIES_ID", pd.get("PARENT_ID").toString()); // 传入上级ID，作为子ID用
		pd.put("DICTIONARIES_ID", DICTIONARIES_ID); // 复原本ID
		mv.setViewName("system/dictionaries/dictionaries_edit");
		mv.addObject("msg", "edit");
		return mv;
	}

	/**
	 * 判断编码是否存在
	 * 
	 * @return
	 */
	@RequestMapping(value = "/hasBianma")
	@ResponseBody
	public Object hasBianma() {
		Map<String, String> map = new HashMap<String, String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			if (dictionariesService.findByBianma(pd) != null) {
				errInfo = "error";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo); // 返回结果
		return AppUtil.returnObject(new PageData(), map);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
}
