package com.dcits.credit.controller.creditAcctManage;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.creditAcctManage.CreditAcctManageManager;
import com.dcits.credit.util.ClawerInterfaceServer;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.UserUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

import net.sf.json.JSONObject;
/** 
 * 类名称：征信账户管理
 * 创建人：FH 
 * 创建时间：
 * @version
 */
@Controller
@RequestMapping(value="/CreditAcctManage")
public class CreditAcctManageController extends BaseController {

	String menuUrl = "CreditAcctManage/list.do"; //菜单地址(权限用)
	@Resource(name="CreditAcctManageService")
	private CreditAcctManageManager CreditAcctManageService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表CreditAcctManage");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		Org curOrg = (Org) session.getAttribute(USERID+Const.SESSION_ORG);
		String menuId = pd.getString("menuId");
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData> varList = CreditAcctManageService.list(page);	//
		mv.setViewName("credit/creditAcctManage/creditAcctManage_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
		return mv;
	}
	//跳转到修改人行密码
	@RequestMapping(value="/toPwdUpdate")
	public ModelAndView toPwdUpdate(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		mv.setViewName("credit/creditAcctManage/pwdUpdate");
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
		return mv;
	}
	//修改人行密码
	@RequestMapping(value="/pwdUpdate")
	public ModelAndView pwdUpdate(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			pd.put("COMPANY", UserUtil.getCurrUser().getCOMPANY());
			page.setPd(pd);
			CreditAcctManageService.pwdUpdate(pd);				
			List<PageData>	varList = CreditAcctManageService.list(page);	//
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String USERID = user.getUSER_ID();
			List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
			String menuId = pd.getString("menuId");
			mv.addObject("varList", varList);
			mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			logger.error("人行修改密码失败！");
		}
		return mv;
	}
	/**去人行测试输入的密码是否正确
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/testPwd")
	@ResponseBody
	public Object testPwd(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
        String result = ClawerInterfaceServer.TestPwd(pd, indAppReService);
        String msg = null;
        Map<String, String> map = new HashMap<>();
        if(result==null){
        	msg = "测试密码失败";
        }else{ 	
        	JSONObject json = JSONObject.fromObject(result);
        	if(json.getString("message")==null||("").equals(json.getString("message"))){
        		msg = "测试密码失败";
        	}else{
        		msg = json.getString("message");
        	}     
        }      
        map.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map);
	}	
	
	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增征信用户");
//		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORG_ID", this.get32UUID());	//主键
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		Boolean flag = (Boolean) session.getAttribute(user.getUSER_ID()+"isCompany");
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		String CURRENT_PASSWORD=(String) pd.get("CURRENT_PASSWORD");
		pd.put("CURRENT_PASSWORD",PasswordOper.encode(CURRENT_PASSWORD));
		String startDate=pd.getString("START_DATE"); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date dt = sdf.parse(startDate);
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(dt);
		//rightNow.add(Calendar.MONTH, 2);// 日期加3个月
		rightNow.add(Calendar.DAY_OF_YEAR,58);//日期加58天
		Date dt1 = rightNow.getTime();
		String reStr = sdf.format(dt1);
		pd.put("PWD_EXPIRES_DATE", reStr);
		pd.put("PERBANK_STATUS", "1");
		CreditAcctManageService.save(pd);		
//		mv.addObject("msg","success");
//		mv.setViewName("save_result");
		return pd;
	}
	
	/**
	 * 删除
	 * @param ORG_ID
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String CREDIT_CODE) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除征信用户");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		pd.put("COMPANY", company);
		String errInfo = "success";
		try {
			CREDIT_CODE = java.net.URLDecoder.decode(
					pd.get("CREDIT_CODE").toString(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//CREDIT_CODE=new String(CREDIT_CODE.getBytes("iso-8859-1"),"utf-8");
		pd.put("CREDIT_CODE", CREDIT_CODE);		
		PageData creditPd =  CreditAcctManageService.findById(pd);
		CreditAcctManageService.delete(pd);	//执行删除账户表
		if(("0").equals(creditPd.getString("IS_WEB"))){
			//删除接口用户
			CreditAcctManageService.deletePerBank(pd);
		}else{
			//删除爬虫用户
			CreditAcctManageService.deleteWeb2(pd);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(){
		logBefore(logger, Jurisdiction.getUsername()+"修改征信用户");
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");	
		PageData pd = this.getPageData();
		pd.put("COMPANY", company);
		try {
			CreditAcctManageService.update(pd);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
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
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		pd.put("COMPANY", company);
		//mv.addObject("pd",pd);
		mv.setViewName("credit/creditAcctManage/creditAcctManage_add");
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
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		PageData pd = this.getPageData();
		pd.put("COMPANY", company);		
		String CREDIT_CODE="";
		try {
			CREDIT_CODE = java.net.URLDecoder.decode(
					pd.get("CREDIT_CODE").toString(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pd.put("CREDIT_CODE", CREDIT_CODE);
		pd = CreditAcctManageService.findById(pd);	//根据ID读取
		mv.addObject("pd",pd);
		mv.setViewName("credit/creditAcctManage/creditAcctManage_edit");
		mv.addObject("msg", "edit");
		return mv;
	}	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	/**判断账号是否存在
	 * @return
	 */
	@RequestMapping(value="/hasID")
	@ResponseBody
	public Object hasID(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		pd.put("COMPANY", company); 
		try{
			if(CreditAcctManageService.findById(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
			errInfo = "error";
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/updateCREDITSTATUS")
	@ResponseBody
	public Object updateCREDITSTATUS(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		pd.put("COMPANY", company);
		if(pd.getString("ISUSE").equals("YES")){
			pd.put("PERBANK_STATUS", "1");
		}else{
			pd.put("PERBANK_STATUS", "0");
		}
		try{
			indAppReService.updateCREDITSTATUS(pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
			errInfo = "error";
			map.put("msg", "系统异常，联系管理员");
		}
		map.put("result", errInfo);				//返回结果
		map.put("msg", "成功");//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/updateISWHITE")
	@ResponseBody
	public Object updateISWHITE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		pd.put("COMPANY", company);
		if(pd.getString("ISWHITE").equals("YES")){
			pd.put("ISWHITE", "1");
		}else{
			pd.put("ISWHITE", "0");
		}
		try{
			indAppReService.updateISWHITE(pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
			errInfo = "error";
			map.put("msg", "系统异常，联系管理员");
		}
		map.put("result", errInfo);		
		map.put("msg", "成功");//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
}
