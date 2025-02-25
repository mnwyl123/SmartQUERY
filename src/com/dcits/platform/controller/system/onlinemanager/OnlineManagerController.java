package com.dcits.platform.controller.system.onlinemanager;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 类名称：在线管理列表
 * 创建人：FH 
 * 创建时间：2015-05-25
 */
@Controller
@RequestMapping(value="/onlinemanager")
public class OnlineManagerController extends BaseController {
	
	String menuUrl = "onlinemanager/list.do"; //菜单地址(权限用)
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(){
		logBefore(logger, "列表OnlineManager");
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		PageData pd = this.getPageData();
		
		pd.put("COMPANY", user.getCOMPANY());
		pd.put("isC", "0");
		if ((Boolean) session.getAttribute(USERID+"isCompany")) {
			pd.put("isC", "1");
		}
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"OnlineMenuIdSession", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"OnlineMenuIdSession");
		}
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/onlinemanager/onlinemanager_list");
		mv.addObject("pd",pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
