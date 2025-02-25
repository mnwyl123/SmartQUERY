package com.dcits.credit.controller.costManage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.costManage.CostManageService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

/**
 * 费用管理Controller
 * 1：费用对账  2：费用分摊明细
 * @author wangwenming
 *
 */
@Controller
@RequestMapping(value="/costManage")
public class CostManageController extends BaseController{
	
	@Resource(name="costManageService")
	private CostManageService service;
	private RoleAuthFactory roleAtuhFactory;
	/**
	 * 获取带有用户名的PageData
	 */
	public PageData getPublicPageData(){
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		PageData pd = getPageData();
		pd.put("COMPANY", company);
		//pd.put("USERCODE", userInfo.getUSERNAME());
		//pd.put("ORGID", userInfo.getOrg().getOrgId());
		if(pd.get("QUERYTIME")==null || "".equals(pd.get("QUERYTIME"))){
			//获取当前日期的前一个月
			Calendar ca = Calendar.getInstance();
			ca.add(Calendar.MONTH,-1);
			String date = new SimpleDateFormat("yyyy-MM").format(ca.getTime());
			pd.put("QUERYTIME", date);
			
		}
		return pd;
	}
	//通过用户所在机构的id 获取 机构名称及所有下属机构名称
	public List<String> GetAllOrgNameByOrgID(){
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		List<String> list = null;
		String org_id="";
		PageData pd = new PageData();
		pd.put("COMPANY", company);
		pd.put("org_id", org_id);
		try {
			list = service.getAllOrgNameByOrgID(pd);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return list;
	}
	/**
	 * 费用对账列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getCRlistPage")
	public ModelAndView getCRlistPage(Page page){
		ModelAndView mv = getModelAndView();
		PageData pd = getPageData();
		//权限
		Session session = Jurisdiction.getSession();
		User userInfo = (User)Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		if(pd.get("START_DATE")==null || "".equals(pd.get("START_DATE"))){
			//获取当前日期的前一个月
			Calendar ca = Calendar.getInstance();
			ca.add(Calendar.MONTH,-1);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(ca.getTime());
			pd.put("START_DATE", date);
			
		}
		if(pd.get("END_DATE")==null || "".equals(pd.get("END_DATE"))){
			Calendar ca = Calendar.getInstance();
			String date = new SimpleDateFormat("yyyy-MM-dd").format(ca.getTime());
			pd.put("END_DATE", date);
			
		}
		if(pd.get("product_id")!=null) {
			pd.put("product_id", pd.get("product_id"));
		}
		//pd.put("START_DATE", pd.getString("START_DATE").substring(0, 7));
		//pd.put("END_DATE", pd.getString("END_DATE").substring(0, 7));
		
//		if(pd.get("QUERYTIME")==null || "".equals(pd.get("QUERYTIME"))){
//			//获取当前日期的前一个月
//			Calendar ca = Calendar.getInstance();
//			ca.add(Calendar.MONTH,-1);
//			String date = new SimpleDateFormat("yyyy-MM").format(ca.getTime());
//			pd.put("QUERYTIME", date);
//			
//		}
//		//数据日期返现到界面格式：yyyy-mm
//		if(!(pd.get("QUERYTIME")==null || "".equals(pd.get("QUERYTIME")))){
//			pd.put("QUERYTIME", pd.getString("QUERYTIME").substring(0, 7));
//		}
		page.setPd(pd);
		PageData pageD = new PageData();
		List<String> orgList = new ArrayList<String>();
		try {
			orgList = service.getAllProduct();
			pageD = service.getCRlistPage(page);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		mv.addObject("orgList",orgList);
		mv.setViewName("credit/costManage/costReconcilation_list");
		mv.addObject("pd",pd);
		mv.addObject("crObject",pageD);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	/**
	 * 费用对账计算
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/updateCR")
	@ResponseBody
	public Object updateCR(){
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = getPublicPageData();
		try {
			String PERQUERYCOST = pd.getString("PERQUERYCOST");
			String ORGQUERYCOST = pd.getString("ORGQUERYCOST");
			if(!PERQUERYCOST.equals("")) {
				List<PageData> date_per = service.findByFindTime_per(pd);
				if(date_per.size()>0){
					service.updateCR_per(pd);
				}else{
					service.saveCR_per(pd);
				}
			}
			if(!ORGQUERYCOST.equals("")) {
				List<PageData> date_org = service.findByFindTime_org(pd);
				
				if(date_org.size()>0){
					service.updateCR_org(pd);
				}else{
					service.saveCR_org(pd);
				}
			}
			//service.updateCR(pd);
			map.put("msg", "success");
		} catch (Exception e) {
			map.put("msg", "error");
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 费用分摊明细
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getCSDlistPage")
	public ModelAndView getCSDlistPage(Page page){
		ModelAndView mv = getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		PageData pd = getPageData();
		pd.put("COMPANY", company);
		if(pd.get("START_DATE")==null || "".equals(pd.get("START_DATE"))){
			//获取当前日期的前一个月
			Calendar ca = Calendar.getInstance();
			ca.add(Calendar.MONTH,-1);
			String date = new SimpleDateFormat("yyyy-MM-dd").format(ca.getTime());
			pd.put("START_DATE", date);
			
		}
		if(pd.get("END_DATE")==null || "".equals(pd.get("END_DATE"))){
			Calendar ca = Calendar.getInstance();
			String date = new SimpleDateFormat("yyyy-MM-dd").format(ca.getTime());
			pd.put("END_DATE", date);
			
		}
		if(pd.get("product_id")!=null) {
			pd.put("product_id", pd.get("product_id"));
		}
//		pd.put("START_DATE", pd.getString("START_DATE").substring(0, 7));
//		pd.put("END_DATE", pd.getString("END_DATE").substring(0, 7));
//		if(pd.get("QUERYTIME")==null || "".equals(pd.get("QUERYTIME"))){
//			//获取当前日期的前一个月
//			Calendar ca = Calendar.getInstance();
//			ca.add(Calendar.MONTH,-1);
//			String date = new SimpleDateFormat("yyyy-MM").format(ca.getTime());
//			pd.put("QUERYTIME", date);
//			
//		}
		page.setPd(pd);
		List<PageData> list = new ArrayList<PageData>();
		List<String> orgList = new ArrayList<String>();
		String org_id="";
		pd.put("org_id", org_id);
		try {
			orgList = service.getAllProduct();
			list = service.getCSDlistPage(page);
			/*if(list.size()==0){
				list = service.getCSDlistPageHis(page);
			}*/
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/costManage/costShareDetail_list");
		//数据日期返现到界面格式：yyyy-mm
		if(!(pd.get("QUERYTIME")==null || "".equals(pd.get("QUERYTIME")))){
			pd.put("QUERYTIME", pd.getString("QUERYTIME").substring(0, 7));
		}
		//添加权限
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		//添加页面上的合计信息
		int ORGQUERYCNT_SUM = 0;//企业合计
		int PERQUERYCNT_SUM = 0;//个人合计
		if(list.size()!=0){
			for(PageData pd_tmp:list) {
				if(pd_tmp.get("ORGQUERYCNT")!=null){
					ORGQUERYCNT_SUM=ORGQUERYCNT_SUM+Integer.parseInt(String.valueOf(pd_tmp.get("ORGQUERYCNT")));	
				}
				if(pd_tmp.get("PERQUERYCNT")!=null){
					PERQUERYCNT_SUM=PERQUERYCNT_SUM+Integer.parseInt(String.valueOf(pd_tmp.get("PERQUERYCNT")));	
				}
			}
		}
		//返回信息
		mv.addObject("pd",pd);
		mv.addObject("count_com",ORGQUERYCNT_SUM);
		mv.addObject("count_per",PERQUERYCNT_SUM);
		mv.addObject("csdList",list);
		mv.addObject("orgList",orgList);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
}
