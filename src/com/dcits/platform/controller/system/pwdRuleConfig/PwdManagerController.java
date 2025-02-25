package com.dcits.platform.controller.system.pwdRuleConfig;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.pwdRuleConfig.pwdRuleConfigManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 类名称：密码规则配置
 * 创建人：huangzwf
 * 创建时间：2016-11-25
 */
@Controller
@RequestMapping(value="/pwdRuleConfig")
public class PwdManagerController extends BaseController {
	
	String menuUrl = "pwdRuleCofig/list.do"; //菜单地址(权限用)
	@Resource(name="pwdRuleConfigService")
	private pwdRuleConfigManager pwdRuleConfigService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/list")
	public ModelAndView list() throws Exception{
		logBefore(logger, "菜单pwdRuleConfig");
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"pwdSession", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"pwdSession");
		}
		pd = pwdRuleConfigService.list(pd);
		mv.setViewName("system/pwdRuleConfig/pwdRuleConfig");
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改pwdRuleConfig");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		StringBuffer rule = new StringBuffer();
		if("on".equals(pd.getString("lowercase"))){
			rule.append("lowercase,");
		}
		if("on".equals(pd.getString("number"))){
			rule.append("number,");
		}
		if("on".equals(pd.getString("capital"))){
			rule.append("capital,");
		}
		if("on".equals(pd.getString("specialCharacter"))){
			rule.append("specialCharacter,");
		}
		pd.put("rules", rule.toString().substring(0, rule.length()-1));
		try{
			pwdRuleConfigService.edit(pd);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
