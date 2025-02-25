package com.dcits.credit.controller.historyInquiry;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.CheckHistoryReview.CheckHistoryManager;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.companyInquiry.CompanyInquiryManager;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.util.PasswordOper;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.role.RoleAuthFactory;


/** 
 * 类名称：HistoryInquiryController
 * 创建人：liyan
 * 说明：查询申请历史
 * @version
 */
@Controller
@RequestMapping(value="/HistoryInquery")
public class HistoryInquiryController extends BaseController {
	@Resource(name="PersonInquiryService")
	private PersonInquiryManager PersonInquiryService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name="historyService")
	private CheckHistoryManager historyService;
	@Resource(name="CompanyInquiryService")
	private CompanyInquiryManager companyInquiryService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**个人查询申请历史列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView listHistoryPerRe(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		String ORG_ID="";
		List<String> roleIds=new ArrayList<String>();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		try{
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		ORG_ID=org.getOrgId();
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"menuFunGroup", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"menuFunGroup");
		}
		pd.put("company", company);
		pd.put("USERID", USERID);
		pd.put("ORG_ID", ORG_ID);
		pd.put("isHistory", "0");
		
		String CLIENT_NAME = pd.getString("CLIENT_NAME");
		String CREDENTIALS_NO = pd.getString("CREDENTIALS_NO");
		if(CLIENT_NAME != null&&!CLIENT_NAME.equals("")) {
			CLIENT_NAME = DESUtil.encrypt("enhjeA==", CLIENT_NAME);
			pd.put("CLIENT_NAME", CLIENT_NAME);
		}
		if(CREDENTIALS_NO != null&&!CREDENTIALS_NO.equals("")) {
			CREDENTIALS_NO = DESUtil.encrypt("enhjeA==", CREDENTIALS_NO);
			pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		
		page.setPd(pd);
		List<PageData>varList=new ArrayList<PageData>();
		try{
			varList = PersonInquiryService.listHis(page);

		}catch(Exception e){
			logger.error(e.getMessage());
		}
		if(CLIENT_NAME != null&&!CLIENT_NAME.equals("")) {
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			pd.put("CLIENT_NAME", CLIENT_NAME);
		}
		if(CREDENTIALS_NO != null&&!CREDENTIALS_NO.equals("")) {
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		int size = varList.size();
		for(int i=0;i<size;i++) {
			CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
			varList.get(i).put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		mv.setViewName("credit/historyInquiry/HistoryPerReview_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
	/**详细信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getPerHistoryInfo")
	public ModelAndView getPerHistoryInfo(){
 		PageData appInfo = new PageData();
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
		pd = PersonInquiryService.findById(pd);
		if(pd==null){
			pd = PersonInquiryService.findByIdHis(pd);
		}
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		//System.out.println("------------------------1-------------------------------");
		String CLIENT_NAME = pd.getString("CLIENT_NAME");
		String CREDENTIALS_NO = pd.getString("CREDENTIALS_NO");
		CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
		CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
		pd.put("CLIENT_NAME", CLIENT_NAME);
		pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
		//System.out.println("------------------------2-------------------------------");
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		/*String ORG_CODE=org.getOrgCode();
		pd.put("ORG_CODE", ORG_CODE);*/
		List<PageData> checkUserList=new ArrayList<PageData>();
		//System.out.println("------------------------3-------------------------------");
		//审核人员列表
		try {
			//查询用户机构
	  	String org_name = indAppReService.getUserOrg(pd);
		//System.out.println("------------------------3.1-------------------------------");
	  	pd.put("ORG_CODE", org_name);
		//System.out.println("------------------------3.2-------------------------------");
		appInfo = historyService.getAppHistoryCheck(pd);
		//System.out.println("------------------------3.3-------------------------------");
 		PageData check = historyService.getCheckUserInfo(appInfo.getString("CHECK_SYS_ID"));
		String ID = pd.getString("ID");
		//System.out.println("------------------------3.4-------------------------------");
		//获得配置文件配置信息
	 	PageData serverInfo = BaseController.getServerInfo();
		//System.out.println("------------------------3.5-------------------------------");
        List<String> fileNameList = new ArrayList<String>();
        fileNameList.add("WARRANT.jpg");
        fileNameList.add("LOAN_APPLICATION.jpg");
        fileNameList.add("IDENTITY_DOCUMENT.jpg");
		//System.out.println("------------------------4-------------------------------");
      //获得配置文件配置信息
 		String ftpHost = serverInfo.getString("IP");  
        String ftpUserName = serverInfo.getString("LoginName");  
        String ftpPassword = PasswordOper.decode(serverInfo.getString("LoginPass"));  
        int ftpPort = Integer.parseInt(serverInfo.getString("port")); 
        String ftpPath = serverInfo.getString("ftpPath")+ID;  
        String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  //文件路径
		//System.out.println("------------------------5-------------------------------");
	  	try{
	  		//将服务器上图片下载到本地
			   // FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileNameList); 
	  		}catch(Exception e){
	  			logger.error(e.getMessage());
	  		}
	  		for(int i=0;i<fileNameList.size();i++){
	        	String fileName=fileNameList.get(i);
	        	File file=new File(localPath+"/"+fileName);
	        	if(file.length()>0){
	        		appInfo.put(fileName.substring(0,fileName.length()-4), ID+"/"+fileName);
	        	}else{
	        		appInfo.put(fileName.substring(0,fileName.length()-4), "0");
	        	}
	        }
			//System.out.println("------------------------6-------------------------------");
	  		appInfo.put("CHECK_SYS_NAME", check.getString("NAME"));
	  		mv.setViewName("credit/historyInquiry/HistoryPerReview_Info");
			mv.addObject("pd", pd);
			mv.addObject("appInfo", appInfo);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return mv;
	}
	
	/**企业查询申请历史列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listHistoryComRe")
	public ModelAndView listHistoryComRe(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		String ORG_ID="";
		List<String> roleIds=new ArrayList<String>();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		try{
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		ORG_ID=org.getOrgId();
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"menuFunGroup", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"menuFunGroup");
		}
		pd.put("company", company);
		pd.put("USERID", USERID);
		pd.put("ORG_ID", ORG_ID);
		pd.put("isHistory", "0");
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

			varList = companyInquiryService.listHis(page);

		}catch(Exception e){
			logger.error(e.getMessage());
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
		mv.setViewName("credit/historyInquiry/HistoryComReview_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
	/**详细信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getComHistoryInfo")
	public ModelAndView getComHistoryInfo(){
 		PageData appInfo = new PageData();
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			pd = companyInquiryService.findById(pd);
			if(pd==null){
				pd = companyInquiryService.findByIdHis(pd);
			}
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		String COMPANY_NAME = pd.getString("COMPANY_NAME");
		String CHINA_CREDIT_CODE = pd.getString("CHINA_CREDIT_CODE");
		COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
		CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
		pd.put("COMPANY_NAME", COMPANY_NAME);
		pd.put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		/*String ORG_CODE=org.getOrgCode();
		pd.put("ORG_CODE", ORG_CODE);*/
		List<PageData> checkUserList=new ArrayList<PageData>();
		//审核人员列表
		try {
		//查询用户机构
	  	String org_name = indAppReService.getUserOrg(pd);
	  	pd.put("ORG_CODE", org_name);
		appInfo = historyService.getEntHistoryCheck(pd);
		if(appInfo==null){
			appInfo = historyService.getEntHistoryCheckHis(pd);
		}
 		PageData check = historyService.getCheckUserInfo(appInfo.getString("CHECK_SYS_ID"));
		String ID = pd.getString("ID");
		//获得配置文件配置信息
	 	PageData serverInfo = BaseController.getServerInfo();
        List<String> fileNameList = new ArrayList<String>();
        fileNameList.add("WARRANT.jpg");
        fileNameList.add("LOAN_APPLICATION.jpg");
        fileNameList.add("business_licence.jpg");
      //获得配置文件配置信息
 		String ftpHost = serverInfo.getString("IP");  
        String ftpUserName = serverInfo.getString("LoginName");  
        String ftpPassword = PasswordOper.decode(serverInfo.getString("LoginPass"));  
        int ftpPort = Integer.parseInt(serverInfo.getString("port")); 
        String ftpPath = serverInfo.getString("ftpPath")+ID;  
        String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  //文件路径 
	  		try{
	  		//将服务器上图片下载到本地
//			    FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileNameList); 
	  		}catch(Exception e){
	  			logger.error(e.getMessage());
	  		}
	  		for(int i=0;i<fileNameList.size();i++){
	        	String fileName=fileNameList.get(i);
	        	File file=new File(localPath+"/"+fileName);
	        	if(file.length()>0){
	        		appInfo.put(fileName.substring(0,fileName.length()-4), ID+"/"+fileName);
	        	}else{
	        		appInfo.put(fileName.substring(0,fileName.length()-4), "0");
	        	}
	        }
	  		appInfo.put("CHECK_SYS_NAME", check.getString("NAME"));
	  		mv.setViewName("credit/historyInquiry/HistoryComReview_Info");
			mv.addObject("pd", pd);
			mv.addObject("appInfo", appInfo);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return mv;
	}
}
