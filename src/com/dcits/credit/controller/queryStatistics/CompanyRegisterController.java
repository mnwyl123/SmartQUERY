package com.dcits.credit.controller.queryStatistics;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.queryStatistics.CompanyRegisterManager;
import com.dcits.credit.service.queryStatistics.PersonRegisterManager;
import com.dcits.credit.service.queryStatistics.impl.PersonRegisterService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 说明：企业征信查询登记簿
 * 创建人：  
 * 创建时间：2017-06-30
 */
@Controller
@RequestMapping(value="/CompanyRegister")
public class CompanyRegisterController extends BaseController {
	
	String menuUrl = "CompanyRegister/list.do"; //菜单地址(权限用)
	
	@Resource(name="CompanyRegisterService")
	private CompanyRegisterManager CompanyRegisterService;
	@Resource(name="PersonRegisterService")
	private PersonRegisterManager PersonRegisterService;
	@Resource(name="orgService")
	private OrgManager orgService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表CompanyRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		String menuId = pd.getString("menuId");
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERID", null);
		}else{
			pd.put("USERID", USERID);
		}
		pd.put("company", company);
		if(pd.getString("sign")==null){
			pd.put("sign", "1");		
		}
		if(pd.getString("APPLICATION_TIME")==null){
			String systime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			pd.put("APPLICATION_TIME", systime);
		}
		String COMPANY_NAME = pd.getString("COMPANY_NAME");
		String CHINA_CREDIT_CODE = pd.getString("CHINA_CREDIT_CODE");
		if(COMPANY_NAME != null&&!COMPANY_NAME.equals("")) {
			COMPANY_NAME = DESUtil.encrypt("enhjeA==", COMPANY_NAME);
			pd.put("COMPANY_NAME", COMPANY_NAME);
		}
		if(CHINA_CREDIT_CODE != null&&!CHINA_CREDIT_CODE.equals("")) {
			CHINA_CREDIT_CODE = DESUtil.encrypt("enhjeA==", CHINA_CREDIT_CODE);
			pd.put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		}
		page.setPd(pd);
		List<PageData>	varList = CompanyRegisterService.list(page);	//
		if(varList.size()==0){
			varList = CompanyRegisterService.listHis(page);
		}
		if(COMPANY_NAME != null&&!COMPANY_NAME.equals("")) {
			COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
			pd.put("COMPANY_NAME", COMPANY_NAME);
		}
		if(CHINA_CREDIT_CODE != null&&!CHINA_CREDIT_CODE.equals("")) {
			CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
			pd.put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		}
		mv.setViewName("credit/queryStatistic/companyRegister_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
		return mv;
	}

	/**查看影像资料
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/view")
	public ModelAndView getPerHistoryInfo(){
		PageData appInfo = new PageData();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData>	varList = null;
		String URL ;
		String dUrl  ;
		String CHANNEL_QUERY_NO = pd.getString("CHANNEL_QUERY_NO")  ;
		if(CHANNEL_QUERY_NO == null||CHANNEL_QUERY_NO.equals("")){
			try{
				varList = PersonRegisterService.findStatusViewById(pd);
			}catch(Exception e){
				logger.error(e.getMessage());
			}
		}else{
			try{
				varList = PersonRegisterService.findViewById(pd);
			}catch(Exception e){
				logger.error(e.getMessage());
			}
		}

		if(varList != null) {
			int size = varList.size();
			for(int i=0;i<size;i++) {
				URL = varList.get(i).getString("APPLICATION_URL");
				if(!URL.startsWith("https%")) {
					try {
						dUrl = URLDecoder.decode(URL, "utf-8");
						varList.get(i).put("APPLICATION_URL", dUrl);
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						logger.error(e.getMessage());
					}
				}
			}
		}

		mv.setViewName("credit/queryStatistic/view_Info");
		mv.addObject("pd", pd);
		mv.addObject("varList", varList);
		mv.addObject("appInfo", appInfo);
		return mv;
	}

	/* *//**去详情页面
	 * @param
	 * @throws Exception
	 *//*
	@RequestMapping(value="/goDetail")
	public ModelAndView goEdit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> varList =CompanyRegisterService.detailList(page);	
		mv.setViewName("credit/queryStatistic/CompanyRegisterDetail_list");
		mv.addObject("varList", varList);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	*/
	/**导出企业查询信息到EXCEL
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
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERID", null);
		}else{
			pd.put("USERID", USERID);
		}
		pd.put("company", company);
		if(pd.getString("sign")==null){
			pd.put("sign", "1");
		}
		if(pd.getString("APPLICATION_TIME")==null){
			String systime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			pd.put("APPLICATION_TIME", systime);
		}
		String COMPANY_NAME = pd.getString("COMPANY_NAME");
		String CHINA_CREDIT_CODE = pd.getString("CHINA_CREDIT_CODE");
		if(COMPANY_NAME != null&&!COMPANY_NAME.equals("")) {
			COMPANY_NAME = DESUtil.encrypt("enhjeA==", COMPANY_NAME);
			pd.put("COMPANY_NAME", COMPANY_NAME);
		}
		if(CHINA_CREDIT_CODE != null&&!CHINA_CREDIT_CODE.equals("")) {
			CHINA_CREDIT_CODE = DESUtil.encrypt("enhjeA==", CHINA_CREDIT_CODE);
			pd.put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		}
		page.setPd(pd);
		try{
		//	if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
				String keywords = pd.getString("keywords");				//关键词检索条件
				if(null != keywords && !"".equals(keywords)){
					pd.put("keywords", keywords.trim());
				}
				Map<String,Object> dataMap = new HashMap<String,Object>();
				List<String> titles = new ArrayList<String>();
				titles.add("序号");
				titles.add("客户名称"); 		//1
				titles.add("企业中征码/个人证件类型及证件号码");			//2
				titles.add("查询原因");			//3
				titles.add("查询申请人");			//4
				titles.add("内部授权人");			//5
				titles.add("查询员");		//6
				titles.add("是否打印信用报告");
				titles.add("查询日期");	//7
				titles.add("业务办理状态");		//8
				titles.add("是否查得");	//9
				titles.add("备注");
				dataMap.put("titles", titles);
				//查询原因转码
				PageData pd1=new PageData();
				pd1.put("DIC_CODE", "EntFindReason");
				List<PageData> findReasonList= PersonRegisterService.findcredType(pd1);
				Map<Object, Object> findReasonMap= new HashMap<Object,Object>();
				for (int i = 0; i < findReasonList.size(); i++) {
					Map<String,Object> findReasonMap1 = findReasonList.get(i);
					findReasonMap.put(findReasonMap1.get("DICT_CODE"), findReasonMap1.get("NAME"));
				}
				List<PageData> registerList = CompanyRegisterService.list(page);
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<registerList.size();i++){
					PageData vpd = new PageData();
					String NO=i+1+"";
					vpd.put("var1", NO);
					vpd.put("var2", registerList.get(i).get("COMPANY_NAME"));		//1
					vpd.put("var3", registerList.get(i).get("CHINA_CREDIT_CODE"));			//2
					//vpd.put("var4", registerList.get(i).get("QUERY_REASON"));			//3
					vpd.put("var4", (String)findReasonMap.get(registerList.get(i).get("QUERY_REASON")));//3
					vpd.put("var5", registerList.get(i).get("CUST_MANAGER"));		//4
					vpd.put("var6", registerList.get(i).get("CHECK_SYS_NAME"));		//5
					vpd.put("var7",registerList.get(i).get("USER_NAME"));	//6
					vpd.put("var8", registerList.get(i).get("IS_PRINT"));
					vpd.put("var9", registerList.get(i).get("APPLICATION_TIME"));	 		//7
					vpd.put("var10",registerList.get(i).get("STATUS"));	//8
					vpd.put("var11", registerList.get(i).get("IS_GET"));	 		//9
					vpd.put("var12", registerList.get(i).get("REMARKS"));	 		//10
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
	/**去添加备注
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goRemark")
	public ModelAndView goEditC() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("credit/queryStatistic/personRegister_edit");
		mv.addObject("msg", "CompanyRegister");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 保存备注
	 */
	@RequestMapping(value="/editC")
	public ModelAndView editU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		CompanyRegisterService.save(pd);
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
