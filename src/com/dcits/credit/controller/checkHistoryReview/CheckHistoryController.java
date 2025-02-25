package com.dcits.credit.controller.checkHistoryReview;

import java.io.File;
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
import com.dcits.credit.util.PasswordOper;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.role.RoleAuthFactory;


/** 
 * 类名称：CheckHistoryController
 * 创建人：zhangyy
 * 说明：企业查询申请审核历史
 * @version
 */
@Controller
@RequestMapping(value="/HistoryAppRe")
public class CheckHistoryController extends BaseController {
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name="historyService")
	private CheckHistoryManager historyService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**审核历史列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listHistoryAppRe")
	public ModelAndView listHistoryAppRe(Page page){
		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
  		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		pd.put("USER_ID", USERID);
		String clientNo="2";
		//权限查询
 		String menuId = pd.getString("menuId");
        List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		Map<String,String> map = roleAtuhFactory.getHC(roleIds,menuId);
		
		String CLIENT_NAME = pd.getString("CLIENT_NAME");
		String CREDENTIALS_NO = pd.getString("CCODE");
		if(CLIENT_NAME != null&&!CLIENT_NAME.equals("")) {
			CLIENT_NAME = DESUtil.encrypt("enhjeA==", CLIENT_NAME);
			pd.put("CLIENT_NAME", CLIENT_NAME);
		}
		if(CREDENTIALS_NO != null&&!CREDENTIALS_NO.equals("")) {
			CREDENTIALS_NO = DESUtil.encrypt("enhjeA==", CREDENTIALS_NO);
			pd.put("CCODE", CREDENTIALS_NO);
		}
		//查询当前用户机构编码
		try {
			List<String> userOrgId = indAppReService.getUserOrgID(pd);
			//存放列表数据信息
			List<PageData> listInfo = new ArrayList<PageData>();
			if(userOrgId.size()>0){
				pd.put("ORG_ID", userOrgId.get(0).toString());
			
				//默认客户类型为企业1:个人;2:企业
				String clientType="EntAppReHistorylistPage";
				if(pd.get("CLIENT_TYPE")!=null){
					if(pd.get("CLIENT_TYPE").toString()=="1"||pd.get("CLIENT_TYPE").toString().equals("1")){
						clientType = "IndAppReHistorylistPage";
						clientNo="1";
					}
				}
				
				page.setPd(pd);
				listInfo = historyService.listHistoryRe(page,clientType);
				if(listInfo.size()==0){
					if(pd.get("CLIENT_TYPE")==null||pd.get("CLIENT_TYPE").toString()==""||pd.get("CLIENT_TYPE").toString().equals("")){
						clientType = "IndAppReHistorylistPage";
						listInfo = historyService.listHistoryRe(page,clientType);
						clientNo="1";
					}
				}
//				if(listInfo.size()==0){
//					//默认客户类型为企业1:个人;2:企业
//					 clientType="EntHisAppReHistorylistPage";
//					if(pd.get("CLIENT_TYPE")!=null){
//						if(pd.get("CLIENT_TYPE").toString()=="1"||pd.get("CLIENT_TYPE").toString().equals("1")){
//							clientType = "IndHisAppReHistorylistPage";
//							clientNo="1";
//						}
//					}
//					
//					page.setPd(pd);
//					listInfo = historyService.listHistoryRe(page,clientType);
//					if(listInfo.size()==0){
//						if(pd.get("CLIENT_TYPE")==null||pd.get("CLIENT_TYPE").toString()==""||pd.get("CLIENT_TYPE").toString().equals("")){
//							clientType = "IndHisAppReHistorylistPage";
//							listInfo = historyService.listHistoryRe(page,clientType);
//							clientNo="1";
//						}
//					}
//				}
			}
			if(CLIENT_NAME != null&&!CLIENT_NAME.equals("")) {
				CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
				pd.put("CLIENT_NAME", CLIENT_NAME);
			}
			if(CREDENTIALS_NO != null&&!CREDENTIALS_NO.equals("")) {
				CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
				pd.put("CCODE", CREDENTIALS_NO);
			}
			int size = listInfo.size();
			for(int i=0;i<size;i++) {
				CLIENT_NAME = listInfo.get(i).getString("CLIENT_NAME");
				CREDENTIALS_NO = listInfo.get(i).getString("CCODE");
				CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
				CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
				listInfo.get(i).put("CLIENT_NAME", CLIENT_NAME);
				listInfo.get(i).put("CCODE", CREDENTIALS_NO);
			}
			pd.put("CLIENT_TYPE", clientNo);
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/HistoryAppReview/HistoryReview_list");
		mv.addObject("QX",map);
		return mv;
	}
	
	/**详细信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getCheckInfo")
	public ModelAndView getCheckInfo(){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
  		
  		String ID = pd.getString("ID");
 		PageData appInfo = new PageData();
		
		try {
			//查询用户申请部门
			String DEPT_CODE = indAppReService.getUserDepart(pd);
			//查询用户机构
	  		String org_name = indAppReService.getUserOrg(pd);
	   		String client_type = pd.getString("CLIENT_TYPE");

	  		
	  		//获得配置文件配置信息
		 	PageData serverInfo = BaseController.getServerInfo();
	 		String ftpHost = serverInfo.getString("IP");  
	        String ftpUserName = serverInfo.getString("LoginName");  
	        String ftpPassword = PasswordOper.decode(serverInfo.getString("LoginPass"));  
	        int ftpPort = Integer.parseInt(serverInfo.getString("port")); 
	        
	        
	        String ftpPath = serverInfo.getString("ftpPath")+ID;  
	        String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  //文件路径 
				
			List<String> fileNameList = new ArrayList<String>();  //存放需要下载的图片名称
	  		if(client_type=="1"||client_type.equals("1")){
	  			
	  	        fileNameList.add("WARRANT.jpg");
	  	        fileNameList.add("LOAN_APPLICATION.jpg");
	  	        fileNameList.add("IDENTITY_DOCUMENT.jpg");
	  	       
	  			//查询客户信息
	  	 		appInfo = historyService.getAppHistoryCheck(pd);
	  	 		PageData check = historyService.getCheckUserInfo(appInfo.getString("CHECK_SYS_ID"));
	  	 		
	  	 		//查询审核人名称
	  	 		appInfo.put("CHECK_SYS_NAME", check.getString("NAME"));
	  	 		mv.setViewName("credit/HistoryAppReview/HistoryAppReview_Info");
	  		}else{
	  	        fileNameList.add("WARRANT.jpg");
	  	        fileNameList.add("LOAN_APPLICATION.jpg");
	  	        fileNameList.add("business_licence.jpg");
	  	        
	  			//查询企业信息
	  	 		appInfo = historyService.getEntHistoryCheck(pd);
	  	 		String COMPANY_NAME = appInfo.getString("COMPANY_NAME");
	  			String CHINA_CREDIT_CODE = appInfo.getString("CHINA_CREDIT_CODE");
	  			COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
	  			CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
	  			appInfo.put("COMPANY_NAME", COMPANY_NAME);
	  			appInfo.put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
	  	 		PageData check = historyService.getCheckUserInfo(appInfo.getString("CHECK_SYS_ID"));
	  	 		
	  	 		//查询审核人名称
	  	 		appInfo.put("CHECK_SYS_NAME", check.getString("NAME"));
	  	 		mv.setViewName("credit/HistoryAppReview/HistoryEntReview_Info");
	  		}
	  		
	  		try{
	  		//将服务器上图片下载到本地
			    FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileNameList); 
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
			mv.addObject("pd", pd);
			mv.addObject("DEPT_CODE", DEPT_CODE);
			mv.addObject("ORG_NAME", org_name);
			mv.addObject("appInfo", appInfo);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return mv;
	}
}
