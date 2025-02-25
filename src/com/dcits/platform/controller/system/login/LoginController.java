package com.dcits.platform.controller.system.login;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.FirstPageStatis.FirstPageStatisManager;
import com.dcits.credit.service.MacheChange.MacheChangeManager;
import com.dcits.credit.service.queryWarn.QueryWarnService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.system.Menu;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.appuser.AppuserManager;
import com.dcits.platform.service.system.buttonrights.ButtonrightsManager;
import com.dcits.platform.service.system.company.CompanyManager;
import com.dcits.platform.service.system.fhbutton.FhbuttonManager;
import com.dcits.platform.service.system.menu.MenuManager;
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.service.system.pwdRuleConfig.pwdRuleConfigManager;
import com.dcits.platform.service.system.role.RoleManager;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PwdRuleCheck;
import com.dcits.platform.util.RightsHelper;
import com.dcits.platform.util.Tools;
import com.dcits.platform.util.tree.TreeEntity;
/**
 * 总入口
 * @author pengyj 
 * 修改日期：2015/11/2
 */
@Controller
public class LoginController extends BaseController {

	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="companyService")
	private CompanyManager companyService;
	@Resource(name="orgService")
	private OrgManager orgService;
	@Resource(name="operationService")
	private OperationManager operationService;
	@Resource(name="pwdRuleConfigService")
	private pwdRuleConfigManager pwdRuleConfigService;
	@Resource(name="statisService")
	private FirstPageStatisManager statisService;
	@Resource(name="macheService")
	private MacheChangeManager macheService;
	
	/**访问登录页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_toLogin")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/index/login");
		mv.addObject("pd",pd);
		return mv;
	}
	/**
	 * 修改初始密碼 hzw
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login_Pwdchange", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login_goPwdchange() throws Exception {
		logBefore(logger, "修改初始密碼");
		PwdRuleCheck pwdRuleCheck = new PwdRuleCheck();
		// 创建返回集合
		Map<String, String> map = new HashMap<String, String>();
		// 获取页面数据
		PageData pd = this.getPageData();
		// 校验密码规则
		String msg = null;
		String password = pd.getString("InitPwd");
		PageData pwdRule = pwdRuleConfigService.list(pd);
		if(password==pwdRule.get("INITIAL_PASSWORD").toString()||password.equals(pwdRule.get("INITIAL_PASSWORD").toString())){
			map.put("result", "false");
			map.put("msg", "密码不能与初始密码相同");
		}else{
			msg = pwdRuleCheck.checkPassword(pwdRule, password);
			if (msg != null && !"".equals(msg)) {
				map.put("result", "fail");
				map.put("msg", msg);
			} else {
				// 密码加密
				if (password != null && !"".equals(password)) {
					pd.put("PASSWORD", new SimpleHash("SHA-1", pd.get("USERNAME").toString(),
							password).toString());
				}

				//判断用户是第一次登录还是修改密码
				PageData pdUser = userService.findById(pd);
				if(!"".equals(String.valueOf(pdUser.get("IP")))&&!"null".equals(String.valueOf(pdUser.get("IP")))&&!"".equals(String.valueOf(pdUser.get("MAC")))&&!"null".equals(String.valueOf(pdUser.get("MAC")))){//修改密码
					//判断是否与原密码相同
					String pwd = new SimpleHash("SHA-1", pdUser.getString("USERNAME"), password).toString();
					if(pwd.equals(pdUser.getString("PASSWORD"))){
						msg ="新密码与原密码不能相同!";
						map.put("result", "fail");
						map.put("msg", msg);
					}else{
						userService.editPwd(pd);
						map.put("result", "success");
					}
				}else{ //用户第一次登录系统
					//获取当前登录机器IP和MAC地址
					HttpServletRequest request = this.getRequest();
					String ip = "";
					if (request.getHeader("x-forwarded-for") == null) {  
						ip = request.getRemoteAddr();  
				    }else{
				    	ip = request.getHeader("x-forwarded-for");  
				    }
					pd.put("IP", ip);
					// 更新用户密码及mac和ip
					userService.ChangeInitPwd(pd);
					map.put("result", "success");
				}
			}
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_login" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		Session session = Jurisdiction.getSession();
		PageData pd = this.getPageData();
		String USERID="";
		String USERName="";
		String errInfo = "";
		String ip = "";
		String MAC ="";//登录机器的MAC地址
		StringBuffer operResult = new StringBuffer();
		operResult.append("登录失败");
		User curUser = null;
		//获得配置文件配置信息
		String isValiteIP = BaseController.getPropertiesValue("isValiteIP");
		if("true".equals(isValiteIP)||"true"==isValiteIP){
			//获取当前登录用户
			curUser = (User) session.getAttribute(Const.SESSION_USER);
		}
		String KEYDATA[] = pd.getString("KEYDATA").split(",dcits,");
		if(curUser ==null){
			if(null != KEYDATA&&KEYDATA.length == 4){
				String USERNAME = KEYDATA[0];	//登录过来的用户名
				String COMPANY = KEYDATA[1];    //登录过来的法人
				String PASSWORD  = KEYDATA[2];	//登录过来的密码
				MAC = KEYDATA[3];
				String ERR_TIMES="";
				
				pd.put("USERNAME", USERNAME);
				String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();	//密码加密
				pd.put("PASSWORD", passwd);
				if(COMPANY=="null"||COMPANY.equals("null")){
					//根据用户名和密码查询法人
					try {
						List<String> com= userService.findCompCode(pd);
						if(com.size()>0){
							COMPANY = com.get(0).toString();
						}
					} catch (Exception e) {
						logger.error(e.getMessage());
					}
				}
				if(COMPANY=="null"||COMPANY.equals("null")){
					operResult.append(",缺少法人信息");
					errInfo = "comInfo";	
				}else{
					pd.put("COMPANY", COMPANY);
					
					//查询用户是否锁定
					String LockStatus = userService.checkLock(pd);
					if(LockStatus!=null){
						//查询密码规则
						PageData pwdRule = pwdRuleConfigService.list(pd);
						int maxErrTime = Integer.parseInt(String.valueOf(pwdRule.get("MAX_ERROR_LOGON")));
						if(LockStatus.equals("0")||LockStatus=="0"){
							errInfo = "novalid";
							operResult.append(",用户是无效用户");
						}else if(LockStatus.equals("3")||LockStatus=="3"){
							errInfo = "lock";
							operResult.append(",用户被锁定");
						}else{
							//首先根据用户名和法人查询错误次数，检验该用户是否能够登陆
							ERR_TIMES = userService.checkErrTime(pd);
							if(ERR_TIMES==null){
								ERR_TIMES="0";
							}
							if(Integer.parseInt(ERR_TIMES)>=maxErrTime){
								pd.put("LOCK_STATUS", "3");
								userService.LockUser(pd);   //锁定用户
								errInfo = "OutTimes"; 				//判断用户输入错误次数是否超过上限
								logBefore(logger, USERNAME+"密码错误次数超过上限");
							}else{
								User user = userService.getUserByNameAndPwd(pd);	//根据用户名和密码去读取用户信息
								if(user != null){
									//获取当前机器ip
									HttpServletRequest request = this.getRequest();
									if (request.getHeader("x-forwarded-for") == null) {  
										ip = request.getRemoteAddr();  
								    }else{
								    	ip = request.getHeader("x-forwarded-for");  
								    }
									USERID = user.getUSER_ID().toString();
									USERName = user.getUSERNAME();
									
									if(errInfo!="OutTimes"&&!errInfo.equals("OutTimes")){
										 //验证用户是否需要修改密码,密码为初始密码则需要修改-----------------
								        String initPass = String.valueOf(pwdRule.get("INITIAL_PASSWORD"));
								        if(initPass.equals(PASSWORD)){
								        	errInfo = "InitPwd";
								    		map.put("USERID", USERID);
								    		map.put("USERName", USERName);
								    		map.put("MAC", MAC);
								        }else if(!queryPwdTime(Integer.parseInt(String.valueOf(pwdRule.get("EFFECT_DAYS"))),user.getUPDATE_TIME())){//校验密码是否到期
								        	//密码过期处理
								        	errInfo = "overDay";
								        	map.put("USERID", USERID);
								    		map.put("USERName", USERName);
								    		map.put("MAC", MAC);
								        }else{
								        	//验证该用户是否是审核查询权限的用户
								        	boolean flag = approvalQuery(user,MAC,ip);
											if(flag){
												pd.put("LAST_LOGIN",DateUtil.getTime().toString());
												pd.put("NAME", USERID);
												pd.put("USER_ID", user.getUSER_ID().toString());
												userService.updateLastLogin(pd);
												session.setAttribute(USERID+Const.SESSION_COMPANY, COMPANY);	
												session.setAttribute(Const.SESSION_USER, user);			//把用户信息放session中
												session.removeAttribute(Const.SESSION_SECURITY_CODE);	//清除登录验证码的session
												//讲用户角色加入session
							                	List<String> roleIds = menuService.getRoleIdsByUserName(user.getUSERNAME(), user.getCOMPANY());
							                	session.setAttribute(USERID+Const.SESSION_ROLE_RIGHTS, roleIds);
							                	pd.put("COMPANY", user.getCOMPANY());
										        //查询机构信息，通过USER_ID查到ORG_ID,再由ORG_ID和COMPANY查询机构名称
										        List<Org> OrgList = orgService.getOrgByUserId(pd);	//根据用户名和密码去读取用户信息
										        if(OrgList.size() >0){
										        	pd.put("ORG", OrgList.get(0).getName());
										        	session.setAttribute(USERID+Const.SESSION_ORG, OrgList.get(0));
										        	session.setAttribute(USERID+Const.SESSION_ORGS, OrgList);
										        	user.setOrg(OrgList.get(0));
										        }
										      //shiro加入身份验证
												Subject subject = SecurityUtils.getSubject(); 
											    UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
											    try{
											    	subject.login(token);
											    	//清除错误次数
													userService.clearErrTime(pd);
											    }catch(AuthenticationException e) { 
											    	operResult.append(",身份验证失败！");
											    	errInfo = "paserror";
												 }
											}else{
												operResult.append(",登录机器不正确！");
										    	errInfo = "MacError";
										    	map.put("USERID", USERID);
									    		map.put("USERName", USERName);
									    		map.put("company", user.getCOMPANY());
									    		map.put("oldMAC", user.getMAC());
									    		map.put("oldIP", user.getIP());
									    		map.put("newMAC", MAC);
									    		map.put("newIP", ip);
											}
								        }
								        if(errInfo ==""||("").equals(errInfo)){
								        	operResult.delete(0, operResult.length());
								        	operResult.append("登录成功");
											errInfo = "success";					//验证成功
											logBefore(logger, USERNAME+"登录系统");
								        }
									}
								}else{
									//更改密码输入错误次数,通过用户名和法人去验证-------------
									ERR_TIMES = Integer.toString((Integer.parseInt(ERR_TIMES)+1));
									operResult.append(",登录密码错误");
									errInfo = "paserror";
									pd.put("ERR_TIMES", ERR_TIMES);
									this.checkUserValidity(pd);	
									//用户名或密码有误
									logBefore(logger, USERNAME+"登录信息错误");
								}
							}
						}
					}else{
						operResult.append(",缺少法人信息");
						errInfo = "comInfo";	
					}
				}	
			}else{
				if(KEYDATA.length == 3){
					operResult.append(",缺少参数");
					errInfo = "oper";	//缺少参数
				}else{
					operResult.append(",缺少参数");
					errInfo = "error";	//缺少参数
				}
			}
		}else{
			operResult.append(",本机已有用户登录");
			errInfo = "hasU";	//缺少参数
		}
		if(pd.get("USERNAME")!=null){
			pd.put("IP", ip);
			pd.put("OPERATION_TIME",  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("OPERATION_DESC", operResult.toString());
//			pd.put("MAC", operationService.getMac(ip));
			pd.put("MAC", MAC);
			pd.put("LOG_ID", this.get32UUID());
			if(USERID!=""&&!USERID.equals("")){
				session.setAttribute(USERID+Const.SESSION_LoginInfo, pd);
			}
			operationService.addLog(pd);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**访问系统首页
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/main/{changeMenu}")
	@SuppressWarnings("unchecked")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
			if (user != null) {
				String USERNAME = user.getUSERNAME();
				String USERID = user.getUSER_ID();
				session.setAttribute(USERID+Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
				List<TreeEntity> menuList = menuService.getMenuByUserName(USERNAME, user.getCOMPANY());
				session.setAttribute(USERID+Const.SESSION_menuList, menuList);
				//this.getRemortIP(USERID);	//更新登录IP
				mv.setViewName("system/index/main");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			}else {
				mv.setViewName("system/index/login");//session失效后跳转登录页面
			}
		} catch(Exception e){
			mv.setViewName("system/index/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/index/tab";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/login_default")
	public ModelAndView defaultPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		PageData pd = new PageData();
		pd.put("USER_ID", user.getUSER_ID());
		pd.put("COMPANY", user.getCOMPANY());
		String userType="0"; //0:其他用户，1:管理员用户,2:查询员用户,3:审核员用户
		
		//判断当前登录用户类型(管理员、审核员、查询员)
		try {
			if(userService.findUserType(user.getUSERNAME())!=null){
				userType = "1";
			}else if(userService.findPolicy(pd)!=null){
				userType = "2";
			}else if(userService.findCheckPolicy(pd)!=null){
				userType = "3";
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
			logger.info("用户类型判断异常!");
		}		
		pd.put("userType", userType);
		if(!"0".equals(userType)){
			List<Integer> perRecordDataList = new ArrayList<Integer>();  //存放个人15天统计值
			List<String> ReocrdDateList = new ArrayList<String>();  //存放时间
			List<Integer> comRecordDataList = new ArrayList<Integer>();//存放企业15天统计值
			
			//获取最近15天时间
			SimpleDateFormat bard = new SimpleDateFormat("dd");
			List<String> AlldateList = new ArrayList<String>();
			Date date = new Date();
			for(int i=14;i>=0;i--){
				AlldateList.add(bard.format(addDate(date,-i)));
			}
			/********预警*******/
			int surgeInEarlysum = 0;//查询激增情况预警
			int failPercent = 0;//查询失败占比过大情况预警
			int shorttime = 0;//短时间内对同一客户多次查询情况预警
			
			String QUERYTIME = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			pd.put("QUERYTIME", QUERYTIME);
			User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
			pd.put("USER_ID", userInfo.getUSER_ID());
			pd.put("COMPANY", userInfo.getCOMPANY());
			pd.put("USERNAME", userInfo.getUSERNAME());
			surgeInEarlysum = statisService.surgeInEarlylistPage(pd).size();
			failPercent = statisService.failPercentToLargelistPage(pd).size();
			shorttime = statisService.shorttimelistPage(pd).size();
			
			pd.put("surgeInEarlysum", surgeInEarlysum);
			pd.put("failPercent", failPercent);
			pd.put("shorttime", shorttime);
			/********个人*******/
			int perSum = 0; //个人总的查询次数/审核次数
			int perSus = 0; //个人查询成功次数/审核通过次数
			int PmCheck = 0; //待审核
			int PmSubmit = 0;  //待提交
			try{
				//个人查询统计
				pd.put("TYPE", "1");  //个人
				List<PageData> perQueryCheckSum = new ArrayList<PageData>();
				if("3".equals(userType)){//审核员
					perQueryCheckSum = statisService.checkSum(pd);
				}else{//查询员或管理员()
					perQueryCheckSum = statisService.StatisQuerySum(pd);
				}
				if(perQueryCheckSum!=null){
					perSum = Integer.parseInt(perQueryCheckSum.get(0).get("SUM").toString());
					perSus = Integer.parseInt(perQueryCheckSum.get(1).get("SUM").toString());
					//最近15天个人查询记录
					List<PageData> perQueryCheckRecode = new ArrayList<PageData>();
					if("3".equals(userType)){//审核员
						perQueryCheckRecode = statisService.checkLastCount(pd);
					}else{//查询员或管理员
						perQueryCheckRecode = statisService.queryLastCount(pd);
					}
					for(int i=0;i<AlldateList.size();i++){
						int num = perQueryCheckRecode.size();
						String nTime = AlldateList.get(i);
						for(int j=0;j<perQueryCheckRecode.size();j++){
							String time = bard.format(perQueryCheckRecode.get(j).get("TIME"));
							if(nTime.equals(time)){
								ReocrdDateList.add(time);
								perRecordDataList.add(Integer.parseInt(perQueryCheckRecode.get(j).get("SUM").toString()));
								break;
							}else{
								num--;
							}
						}
						if(num==0){
							ReocrdDateList.add(nTime);
							perRecordDataList.add(0);
						}
					}
					//本月查询详情
					List<PageData> queryDetail = new ArrayList<PageData>();
					if("3".equals(userType)){ //审核员
						queryDetail = statisService.checkDetail(pd);
					}else{ //查询员或管理员
						queryDetail = statisService.queryDetail(pd);
					}
					PmCheck = Integer.parseInt(queryDetail.get(0).get("SUM").toString());
					PmSubmit = Integer.parseInt(queryDetail.get(1).get("SUM").toString());
				}else{
					for(int i=0;i<AlldateList.size();i++){
						ReocrdDateList.add(AlldateList.get(i));
						perRecordDataList.add(0);
					}
				}
			}catch(Exception e){
				logger.error(e.getMessage());
				for(int i=0;i<AlldateList.size();i++){
					String nTime = AlldateList.get(i);
					ReocrdDateList.add(nTime);
					perRecordDataList.add(0);
				}
			}
			pd.put("perSum", perSum);  //个人总的查询次数/审核次数
			pd.put("perSus", perSus);   //个人查询成功次数/审核通过次数
			
			if("3".equals(userType)){ //审核员
				pd.put("perFail", perSum-perSus);   //审核未通过次数
				pd.put("PmFail", perSum-perSus); //失败
			}else{
				pd.put("perFail", perSum-perSus);   //个人查询失败次数
				pd.put("PmFail", perSum-perSus); //失败
			}
			//本月查询详情(个人)
			pd.put("PmSucess", perSus); //成功
			pd.put("PmCheck", PmCheck);  //待审核()
			pd.put("PmSubmit", PmSubmit);  //待提交
			
			
			/********企业*******/
			int comSum = 0; //企业总的查询次数/审核次数
			int comSus = 0; //企业查询成功次数/审核通过次数
			int CmCheck = 0; //待审核
			int CmSubmit = 0;  //待提交
			
			try{
				//企业查询统计
				pd.put("TYPE", "2");  //企业
				List<PageData> comQueryCheckSum = new ArrayList<PageData>();
				if("3".equals(userType)){//审核员
					comQueryCheckSum = statisService.checkSum(pd);
				}else{//查询员或管理员
					comQueryCheckSum = statisService.StatisQuerySum(pd);
				}
				if(comQueryCheckSum!=null){
					comSum = Integer.parseInt(comQueryCheckSum.get(0).get("SUM").toString());
					comSus = Integer.parseInt(comQueryCheckSum.get(1).get("SUM").toString());
					//最近一个月企业查询记录
					List<PageData> comQueryCheckRecode = new ArrayList<PageData>();
					if("3".equals(userType)){//审核员
						comQueryCheckRecode = statisService.checkLastCount(pd);
					}else{//查询员或管理员
						comQueryCheckRecode = statisService.queryLastCount(pd);
					}
					for(int i=0;i<AlldateList.size();i++){
						int num = comQueryCheckRecode.size();
						String nTime = AlldateList.get(i);
						for(int j=0;j<comQueryCheckRecode.size();j++){
							String time = bard.format(comQueryCheckRecode.get(j).getString("TIME"));
							if(nTime.equals(time)){
								comRecordDataList.add(Integer.parseInt(comQueryCheckRecode.get(j).get("SUM").toString()));
								break;
							}else{
								num--;
							}
						}
						if(num==0){
							comRecordDataList.add(0);
						}
					}
					//本月查询详情
					List<PageData> queryDetail = new ArrayList<PageData>();
					if("3".equals(userType)){//审核员
						queryDetail = statisService.checkDetail(pd);
					}else{//查询员或管理员
						queryDetail = statisService.queryDetail(pd);
					}
					CmCheck = Integer.parseInt(queryDetail.get(0).get("SUM").toString());
					CmSubmit = Integer.parseInt(queryDetail.get(1).get("SUM").toString());
				}else{
					for(int i=0;i<AlldateList.size();i++){
						comRecordDataList.add(0);
					}
				}
			}catch(Exception e){
				logger.error(e.getMessage());
				ReocrdDateList.clear();
				for(int i=0;i<AlldateList.size();i++){
					String nTime = AlldateList.get(i);
					ReocrdDateList.add(nTime);
					comRecordDataList.add(0);
				}
			}
			
			//企业
			pd.put("comSum", comSum);   //企业总的查询次数
			pd.put("comSus", comSus);   //企业查询成功次数/审核通过次数
			if("3".equals(userType)){ //审核员
				pd.put("comFail", comSum-comSus);    //审核未通过
				pd.put("CmFail", comSum-comSus);  //失败
			}else{
				pd.put("comFail", comSum-comSus);    //企业查询失败次数
				pd.put("CmFail", comSum-comSus);  //失败
			}
			//本月查询详情(企业)
			pd.put("CmSucess", comSus);  //成功
			pd.put("CmCheck", CmCheck);  //待审核
			pd.put("CmSubmit", CmSubmit);  //待提交
			
			mv.addObject("QueryRecodeTime",ReocrdDateList);
			mv.addObject("perQueryRecode",perRecordDataList);
			mv.addObject("comQueryRecode",comRecordDataList);
		}
		
		mv.addObject("pd",pd);
		if("3".equals(userType)){//审核员
			mv.setViewName("system/index/default_check");
		}else if("0".equals(userType)){  //其他用户
			String name = user.getNAME();
			pd.put("userCount", Integer.parseInt(userService.getUserCount("").get("USERCOUNT").toString()));
			pd.put("name", name);
			mv.setViewName("system/index/default_Nom");
		}else{//查询员或管理员
			mv.setViewName("system/index/default");
		}
		return mv;
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		String USERNAME = Jurisdiction.getUsername();	//当前登录的用户名
		logBefore(logger, USERNAME+"退出系统");
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		PageData pd = (PageData) session.getAttribute(USERID+Const.SESSION_LoginInfo);

		//清除用户密码错误次数
		try {
			 pd.put("USER_ID", user.getUSER_ID());
			userService.clearErrTime(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		pd = this.getPageData();
		//用户正常退出
		if(pd.get("msg")==null||pd.get("msg").equals(null)){
			try {
				operationService.operationLog("", "退出系统");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//清除session
			clearSession(session,USERID);
		}else{
			//强制已登录(同名)用户退出
			if(pd.get("msg").toString()!="1"&&!pd.get("msg").toString().equals("1")){
				try {
					operationService.operationLog("", "强制退出系统");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				USERID = pd.get("USER_ID").toString();
				//清除session
				clearSession(session,USERID);
			}else{
				try {
					operationService.operationLog("", "已有用户在本机登录,退出系统");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}		
		pd.put("msg", pd.getString("msg"));
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/index/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/** 更新登录用户的IP
	 * @param USERNAME
	 * @throws Exception
	 */
	public void getRemortIP(String USER_ID) throws Exception {  
		PageData pd = new PageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		pd.put("USER_ID", USER_ID);
		pd.put("IP", ip);
		userService.saveIP(pd);
	}  
	
	/**查询法人
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login_findC", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ? extends Object> findC(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		//获取用户名
		PageData pd = this.getPageData();	
		//根据用户名查询法人(多法人)
		List<PageData> userList=new ArrayList<PageData>();
		List<PageData> companyList=new ArrayList<PageData>();
		try {
			userList = userService.findCompCodeByUsername(pd);
		} catch (Exception e) {
			logger.equals(e.getMessage());
		}
		List<String> codeList = new ArrayList<String>();
		if(userList.size()>0){
			for(int i=0;i<userList.size();i++){
				codeList.add(userList.get(i).getString("COMPANY"));
			}
			try {
				companyList = companyService.findByCompCodeList(codeList);
				Map<String,String> map = new HashMap<String,String>();
				for(int i=0;i<companyList.size();i++){
					map.put(companyList.get(i).getString("COMP_CODE"), companyList.get(i).getString("COMP_NAME"));
				}
				modelMap.put("result", map);
			} catch (Exception e) {
				logger.equals(e.getMessage());
			}
		}
		return modelMap;
	}
	public void checkUserValidity(PageData pd){
		//错误次数加1
		try {
			userService.addErrorTime(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//清除session
	private void clearSession(Session session,String USERID){
		session.removeAttribute(USERID+Const.SESSION_LoginInfo);
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(USERID+Const.SESSION_ORG);
    	session.removeAttribute(USERID+Const.SESSION_ORGS);
		session.removeAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(USERID+Const.SESSION_menuList);
		session.removeAttribute(USERID+Const.SESSION_QX);
		session.removeAttribute(USERID+Const.SESSION_userpds);
		session.removeAttribute(USERID+Const.SESSION_USERNAME);
		session.removeAttribute(USERID+Const.SESSION_USERROL);
		session.removeAttribute("changeMenu");
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject(); 
		subject.logout();
	}
	
	//审批查询登录ip和mac验证
	private boolean approvalQuery(User user,String mac,String ip){
		PageData pd = new PageData();
		pd.put("USER_ID", user.getUSER_ID());
 		boolean flag = true;
		//如果当前是super或法人用户，则不用验证
		try {
			if(userService.findUserType(user.getUSERNAME())!=null){
				return true;
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
			logger.info("用户类型判断异常!");
		}
		//查询登录用户是否是审核查询权限的用户(通过角色名称中是否含有MAC)
		try {
			pd = userService.findPolicy(pd);
			if(pd!=null){
//				//获取当前登录机器IP和MAC地址
//				HttpServletRequest request = this.getRequest();
//				String ip = "";
//				if (request.getHeader("x-forwarded-for") == null) {  
//					ip = request.getRemoteAddr();  
//			    }else{
//			    	ip = request.getHeader("x-forwarded-for");  
//			    }
				String userMac = user.getMAC();
				//mac = operationService.getMac(ip).replaceAll("-", ":");
				//判断ip和mac是否相等
				if(mac==userMac||mac.equals(userMac)){
					if(ip==user.getIP()||ip.equals(user.getIP())){
						flag =  true;
					}else{
						flag =  false;
					}
				}else{
					flag =  false;
				}
			}
		} catch (Exception e1) {
			logger.info(e1.getMessage());
			logger.info("用户审核查询权限验证异常!");
		}
		return flag;
	}
	
	//加减天数
	public static Date addDate(Date date,long day){
		long time = date.getTime();
		day = day*24*60*60*1000;
		time+=day;
		return new Date(time);
	}
	/**
	 * 查询员机器变更，提交变更申请
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login_MacheChange", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login_MacheChange() throws Exception {
		logBefore(logger, "提交变更申请");
		// 创建返回集合
		Map<String, String> map = new HashMap<String, String>();
		// 获取页面数据
		PageData pd = this.getPageData();
		
		String msg = "";
		String info = "";
		//向机器变更申请表中插入数据
		try{
			pd.put("ID", this.get32UUID());
			pd.put("STATUS", "0");
			//查询表中是否已有待审批的申请
			if(macheService.queryRecord(pd)==null){
				macheService.InsertRecord(pd);
				msg="success";
			}else{
				msg ="errHas";
				info = "请勿重复提交变更申请!";
			}
			
		}catch(Exception e){
			logger.error(e.getMessage());
			msg="error";
			info = "变更申请提交失败!";
		}
		map.put("msg", msg);
		map.put("info", info);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	//校验密码是否到期
	private boolean queryPwdTime(long days,Date lastDate){
		Boolean flag = true;
		if(lastDate==null){
			flag = false;
		}else{
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				lastDate = dateFormat.parse(dateFormat.format(lastDate)); //获取最后一次修改密码时间
				long time = lastDate.getTime();
				days = days*24*60*60*1000;
				time+=days;
				lastDate = new Date(time);  
				//获取当前时间
				Date currDate = dateFormat.parse(dateFormat.format(new Date()));
				//比较时间，相等返回0；lastDate小于currDate返回-1；否则返回1
				int result = lastDate.compareTo(currDate);
				if(result<0){
					flag = false;
				}
			} catch (ParseException e) {
				logger.error(e.getMessage(),e);
			}
		}
		return flag;
	}
	
}
