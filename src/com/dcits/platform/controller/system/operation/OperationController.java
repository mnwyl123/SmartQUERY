package com.dcits.platform.controller.system.operation;



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
//import com.dcits.netty.client.util.AdapterUtil;
//import com.dcits.netty.util.service.Protocol;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.StringUtil;
import com.dcits.platform.util.Tools;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 说明：日志
 * 创建人：huangzwf
 * 创建时间：2016-11-22
 */
@Controller
@RequestMapping(value="/operation")
public class OperationController extends BaseController {
	
	@Resource(name="operationService")
	private OperationManager operationService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"日志列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"operMenuIdSession", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"operMenuIdSession");
		}
		
		//用服务的方式，以下可以替换掉
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
		String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
		if(lastLoginStart != null && !"".equals(lastLoginStart)){
			pd.put("lastLoginStart", lastLoginStart);
		}
		if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
			pd.put("lastLoginEnd", lastLoginEnd);
		}
		page.setPd(pd);

		List<PageData>	varList = operationService.list(page);

		//pyj start add 调服务的方式
//		AdapterUtil adapterUtil = new AdapterUtil();
		//参数map
//		Map para = new HashMap();
		//当前页的参数，有分页的话，必须有此参数 
		//step 1 start
//		String currentPage = (String)pd.get("page.currentPage") ;
//		para.put("currentPage", 0);
//		if(!StringUtil.isEmpty((String)pd.get("page.currentPage"))){
//			para.put("currentPage", (String)pd.get("page.currentPage"));
//		}
		//step 1 end
		//其他参数
//		if(null != keywords && !"".equals(keywords)){
//			para.put("keywords", keywords);
//		}
//		if(lastLoginStart != null && !"".equals(lastLoginStart)){
//			para.put("lastLoginStart", lastLoginStart);
//		}
//		if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
//			para.put("lastLoginEnd", lastLoginEnd);
//		}
		//调用服务
//		Protocol protocol = adapterUtil.protocolSend("dmpar", "queryAllDmparListPage",para);
		//得到服务的返回值
//		List<Map<String,Object>>  varList = protocol.getTable("allDmpar");
		//得到分页返回值  有分页时必须处理   
		//step 1 start
//		Map<String, Object> data = protocol.getData("page");
//		page.setTotalResult(Integer.parseInt((String)data.get("totalResult")));
//		page.setTotalPage(Integer.parseInt((String)data.get("totalPage")));
//		page.setTotalResult(Integer.parseInt((String)data.get("totalResult")));
//		page.setCurrentPage(Integer.parseInt((String)data.get("currentPage")));
		//step 2 end
		//pyj end
		
		mv.setViewName("system/operation/operation_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));		//按钮权限
		return mv;
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出日志到excel");
		ModelAndView mv = new ModelAndView();
		PageData pd = this.getPageData();
		Map<String, String> params = new HashMap<String, String>();
		
		//检索条件start
		String keywords = pd.getString("keywords");				
		if(null != keywords && !"".equals(keywords)){
			params.put("keywords", keywords.trim());
		}
		String lastLoginStart = pd.getString("lastLoginStart");	//开始时间
		String lastLoginEnd = pd.getString("lastLoginEnd");		//结束时间
		if(lastLoginStart != null && !"".equals(lastLoginStart)){
			params.put("lastLoginStart", lastLoginStart);
		}
		if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
			params.put("lastLoginEnd", lastLoginEnd);
		}
		//检索条件end
		
		//excel表头
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("日志流水号");	//1
		titles.add("用户编码");	//2
		titles.add("用户名");	//3
		titles.add("用户所属机构");	//4
		titles.add("IP地址");	//5
		titles.add("MAC地址");	//6
		titles.add("访问url");	//7
		titles.add("操作时间");	//8
		titles.add("具体操作描述");	//9
		dataMap.put("titles", titles);
		
		List<Map<String, String>> varOList = operationService.excelExport(params);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("LOG_ID"));	    //1
			vpd.put("var2", varOList.get(i).get("USERNAME"));	    //2
			vpd.put("var3", varOList.get(i).get("NAME"));	//3
			vpd.put("var4", varOList.get(i).get("ORG"));	    //4
			vpd.put("var5", varOList.get(i).get("IP"));	    //5
			vpd.put("var6", varOList.get(i).get("MAC"));	//6
			vpd.put("var7", varOList.get(i).get("OPERATION_URL"));	    //7
			vpd.put("var8", varOList.get(i).get("OPERATION_TIME"));	    //8
			vpd.put("var9", varOList.get(i).get("OPERATION_DESC"));	//9
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
}
