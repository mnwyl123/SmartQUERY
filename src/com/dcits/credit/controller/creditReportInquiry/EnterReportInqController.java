package com.dcits.credit.controller.creditReportInquiry;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.creditReportInquiry.EnterReportInqManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 企业征信报告查询
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
@Controller
@RequestMapping(value="/EnterReportInquiry")
public class EnterReportInqController extends BaseController {
	
	String menuUrl = "EnterReportInquiry/list.do"; //菜单地址(权限用)
	@Resource(name="EnterReportInqService")
	private EnterReportInqManager EnterReportInqService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"列表CreditInquiry");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String ORG_ID="";
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		try{
			Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
			ORG_ID=org.getOrgId();
			}catch(Exception e){
				logger.error(e.getMessage());
		}
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"menuFunGroup", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"menuFunGroup");
		}
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("CLIENT_TYPE", "2");//企业
		pd.put("USERID", USERID);
		pd.put("ORG_ID", ORG_ID);
		
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
		List<PageData>varList=new ArrayList<PageData>();
		try{
			varList = EnterReportInqService.list(page);
			if(varList.size()==0){
				varList = EnterReportInqService.listHis(page);
			}
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		if(COMPANY_NAME != null&&!COMPANY_NAME.equals("")) {
			COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
			pd.put("COMPANY_NAME", COMPANY_NAME);
		}
		if(CHINA_CREDIT_CODE != null&&!CHINA_CREDIT_CODE.equals("")) {
			CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
			pd.put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		}
		int size = varList.size();
		for(int i=0;i<size;i++) {
			COMPANY_NAME = varList.get(i).getString("COMPANY_NAME");
			CHINA_CREDIT_CODE = varList.get(i).getString("CHINA_CREDIT_CODE");
			COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
			CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
			varList.get(i).put("COMPANY_NAME", COMPANY_NAME);
			varList.get(i).put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		}
		mv.setViewName("credit/creditReportInquiry/enterReportInq_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	/**查看征信报告
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value="/goEdit")
	@ResponseBody
	public Object goEditC() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		String ID=pd.getString("ID");
		String ftpHost = "10.202.17.53";  
        String ftpUserName = "hadoop";  
        String ftpPassword = "111111";  
        int ftpPort = 21;  
        String ftpPath = "data/"+ID;  
        String localPath = "E:/work/SmartSense/WebRoot/WEB-INF/uploadFiles/";  
        String fileName = ID+".html";  
        //FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileName); 
        String filePath="uploadFiles/"+fileName;
        map.put("filePath", filePath);				//返回结果
        map.put("result", "sucess");				//返回结果
		return AppUtil.returnObject(pd, map);
	}*/
	
}
