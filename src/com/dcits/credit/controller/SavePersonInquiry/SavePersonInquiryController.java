package com.dcits.credit.controller.SavePersonInquiry;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.dcits.platform.util.*;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.SavePersonInquiry.SavePersonInquiry;
import com.dcits.credit.util.PasswordOper;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 企业征信查询申请
 * 创建人：gaoshenga
 * 创建时间：2018-05-16
 */
@Controller
@RequestMapping(value="/SavePersonInquiryController")
public class SavePersonInquiryController extends BaseController {
	private static Logger logger = Logger.getLogger(SavePersonInquiryController.class);
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name="savePersonInquiry")
	private SavePersonInquiry savePersonInquiry;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="orgService")
	private OrgManager orgService;
	/**管理员审核历史列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listHistory")
	public ModelAndView listHistoryAppRe(Page page){
		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
  		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("USER_ID", USERID);
		String clientNo="2";
		//权限查询
 		String menuId = pd.getString("menuId");
        List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		Map<String,String> map = roleAtuhFactory.getHC(roleIds,menuId);
		
		//查询当前用户机构编码
		try {
			//存放列表数据信息
			List<PageData> listInfo = new ArrayList<PageData>();
			//默认客户类型为企业1:个人;2:企业
			String clientType="EntAppReHistorylistPage";
			if(pd.get("CLIENT_TYPE")!=null){
				if(pd.get("CLIENT_TYPE").toString()=="1"||pd.get("CLIENT_TYPE").toString().equals("1")){
					clientType = "IndAppReHistorylistPage";
					clientNo="1";
				}
			}
			page.setPd(pd);
			listInfo = savePersonInquiry.listHistoryRe(page,clientType);
			if(listInfo.size()==0){
				if(pd.get("CLIENT_TYPE")==null||pd.get("CLIENT_TYPE").toString()==""||pd.get("CLIENT_TYPE").toString().equals("")){
					clientType = "IndAppReHistorylistPage";
					listInfo = savePersonInquiry.listHistoryRe(page,clientType);
					clientNo="1";
				}
			}
			List<Org> orgList = orgService.listAllOrgByCompany(company);
			mv.addObject("orgList",orgList);
			pd.put("CLIENT_TYPE", clientNo);
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/DateChange/DateChange_list");
		mv.addObject("QX",map);
		return mv;
	}
	/**管理员去修改页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goReviseG")
	public ModelAndView goReviseGo(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		//查询该笔详细信息
		try{
			pd = savePersonInquiry.findByIdAndAdress(pd);	
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
   		String client_type = pd.getString("CLIENT_TYPE");
   		pd.put("CLIENT",client_type);
		
		String ID = pd.getString("ID");
 		//获得配置文件配置信息
 		PageData serverInfo=new PageData();
		try {
			serverInfo = BaseController.getServerInfo();
		} catch (IOException e1) {
			logger.error(e1.getMessage(),e1);
		}
		serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
        List<String> fileNameList = new ArrayList<String>();
        Random random=new Random();
		///////取状态值，未审核
        String status = pd.getString("STATUS");
		if("00".equals(status)){
			String FILEADDRESS = pd.getString("FILEADDRESS");
			///取FILEADDRESS路径图片
			fileNameList.add((random.nextInt(999-100+1)+100)+"WARRANT.jpg");
	        fileNameList.add((random.nextInt(999-100+1)+100)+"LOAN_APPLICATION.jpg");
	        if("1".equals(client_type)){
	        	fileNameList.add((random.nextInt(999-100+1)+100)+"IDENTITY_DOCUMENT.jpg");
	        }else{
	        	fileNameList.add((random.nextInt(999-100+1)+100)+"business_licence.jpg");
	        }
	        String ftpPath = serverInfo.getString("ftpPath")+FILEADDRESS;  
	        String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + FILEADDRESS;  //文件路径
	        try{
	        	//将服务器上图片下载到本地
	 	        FtpUtil.downloadFtpFile1(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath, fileNameList); 
	        }catch(Exception e){
	        	logger.error(e.getMessage());
	        }
	        for(int i=0;i<fileNameList.size();i++){
	        	String fileName=fileNameList.get(i);
	        	File file=new File(localPath+File.separator+fileName);
	        	if(file.length()>0){
	        		pd.put(fileName.substring(3,fileName.length()-4), FILEADDRESS+File.separator+fileName);
	        	}
	        }
		}else{  
			String FILEADDRESS = pd.getString("FILEADDRESS");
			///取FILEADDRESS路径图片
			fileNameList.add((random.nextInt(999-100+1)+100)+"WARRANT.jpg");
	        fileNameList.add((random.nextInt(999-100+1)+100)+"LOAN_APPLICATION.jpg");
	        if("1".equals(client_type)){
	        	fileNameList.add((random.nextInt(999-100+1)+100)+"IDENTITY_DOCUMENT.jpg");
	        }else{
	        	fileNameList.add((random.nextInt(999-100+1)+100)+"business_licence.jpg");
	        }
	        String ftpPath = serverInfo.getString("ftpPath")+FILEADDRESS;  
	        String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + FILEADDRESS;  //文件路径
	        try{
	        	//将服务器上图片下载到本地
	 	        FtpUtil.downloadFtpFile1(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath, fileNameList); 
	        }catch(Exception e){
	        	logger.error(e.getMessage());
	        }
	        for(int i=0;i<fileNameList.size();i++){
	        	String fileName=fileNameList.get(i);
	        	File file=new File(localPath+File.separator+fileName);
	        	if(file.length()>0){
	        		pd.put(fileName.substring(3,fileName.length()-4), FILEADDRESS+File.separator+fileName);
	        	}
	        }
		}/*else if("01".equals(status)){  //审核通过
        	fileNameList.add((random.nextInt(999-100+1)+100)+"WARRANT.jpg");
            fileNameList.add((random.nextInt(999-100+1)+100)+"LOAN_APPLICATION.jpg");
            if("1".equals(client_type)){
	        	fileNameList.add((random.nextInt(999-100+1)+100)+"IDENTITY_DOCUMENT.jpg");
	        }else{
	        	fileNameList.add((random.nextInt(999-100+1)+100)+"business_licence.jpg");
	        }
            String ftpPath = serverInfo.getString("ftpPath")+ID;  
            String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  //文件路径
            try{
            	//将服务器上图片下载到本地
     	        FtpUtil.downloadFtpFile1(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath, fileNameList); 
            }catch(Exception e){
            	logger.error(e.getMessage());
            }
            for(int i=0;i<fileNameList.size();i++){
            	String fileName=fileNameList.get(i);
            	File file=new File(localPath+File.separator+fileName);
            	if(file.length()>0){
            		pd.put(fileName.substring(3,fileName.length()-4), ID+File.separator+fileName);
            	}
            }
		}*/
		mv.setViewName("credit/DateChange/DateChange_add");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存审核信息
	 * @return 
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value="/saveCheck")
	public ModelAndView saveCheck(){
		logBefore(logger, Jurisdiction.getUsername()+"审核员审核");
		ModelAndView mv = this.getModelAndView();
   		PageData pd = this.getPageData();
   		//获取客户类型
   		String client_type = pd.getString("CLIENT_TYPE");
   		//获取审核时间
 		pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
 		String STATUS = pd.getString("STATUS");
 		try{
 			String fileName = pd.getString("FILEADDRESS");
 			//如果审核员同意
 			if(STATUS.equals("01")){
 				//读取配置文件信息
 				PageData serverInfo=new PageData();
 				try {
 					serverInfo = BaseController.getServerInfo();
 				} catch (IOException e1) {
 					logger.error(e1.getMessage(),e1);
 				}
 				
 				//1.修改原文件名   在文件名+时间的字符串       2.将新文件下面的图片复制到原文件下。
 				String SourcePath =serverInfo.getString("ftpPath")+pd.getString("ID");
 				String TargetPath=serverInfo.getString("ftpPath")+fileName+"/";
 		        String finalFileName1="WARRANT";
 		        String finalFileName2="LOAN_APPLICATION";
 		        String finalFileName3="IDENTITY_DOCUMENT";
 		        if("2".equals(client_type)){  //企业
 		    	  finalFileName3="business_licence";
 		        }
 				Date d = new Date();
 				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
 				String str = sdf.format(d);
 		 		
 		 		serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
 		 		//重命名文件名
 				renameFile(serverInfo.getString("IP"),Integer.parseInt(serverInfo.getString("port")), serverInfo.getString("LoginName"),
 						serverInfo.getString("LoginPass"), SourcePath, finalFileName1+".jpg",finalFileName1+"_"+str+".jpg");
 				renameFile(serverInfo.getString("IP"),Integer.parseInt(serverInfo.getString("port")), serverInfo.getString("LoginName"),
 						serverInfo.getString("LoginPass"), SourcePath, finalFileName2+".jpg",finalFileName2+"_"+str+".jpg");
 				renameFile(serverInfo.getString("IP"),Integer.parseInt(serverInfo.getString("port")), serverInfo.getString("LoginName"),
 						serverInfo.getString("LoginPass"), SourcePath, finalFileName3+".jpg",finalFileName3+"_"+str+".jpg");
 				SourcePath+="/";
 		        String finalFileName11="WARRANT"+".jpg";
 		        String finalFileName22="LOAN_APPLICATION"+".jpg";
 		        String finalFileName33="IDENTITY_DOCUMENT"+".jpg";
 		       if("2".equals(client_type)){  //企业
 		    	  finalFileName33="business_licence"+".jpg";
  		        }
				FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),
						serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),finalFileName11, finalFileName11, TargetPath,SourcePath);
				FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),
						serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),finalFileName22, finalFileName22, TargetPath,SourcePath);
				FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),
						serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),finalFileName33, finalFileName33, TargetPath,SourcePath);
 	 			savePersonInquiry.updateRecord(pd);
 			}else if(STATUS.equals("02")){
 				//更新数据库状态
 	 			savePersonInquiry.updateRecord(pd);
 			}
	        //删除本地临时文件夹
            String localPath1 = PathUtil.getClasspath() + Const.FILEPATHIMG +fileName+File.separator;  //文件路径
            String localPath2 = PathUtil.getClasspath() + Const.FILEPATHIMG +pd.getString("ID");  //文件路径
            deleteDirectory(localPath1);
            deleteDirectory(localPath2);
 		}catch(Exception e){
 			logger.error(e.getMessage(),e);
 		}
 		mv.setViewName("save_result");
		return mv;
	}
	
	/******************************以下为查询员操作功能**********************************************/
	/**企业修改页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goReviseCompany")
	public ModelAndView goReviseCompany(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String status = "00";
		//判断是否已经提交申请
		List<PageData> checkUserList=new ArrayList<PageData>();
		try {
			checkUserList=savePersonInquiry.findCheckUserList(pd);
			if(checkUserList.size()==0){//未提交
				pd = savePersonInquiry.findCompanyById(pd);	
				pd.put("STATUS", status);
			}else{//已提交
				pd.putAll(checkUserList.get(0));
				status = pd.getString("STATUS");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		String ID = pd.getString("ID");
 		//获得配置文件配置信息
 		PageData serverInfo=new PageData();
		try {
			serverInfo = BaseController.getServerInfo();
		} catch (IOException e1) {
			logger.error(e1.getMessage(),e1);
		}
 		serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
        List<String> fileNameList = new ArrayList<String>();
        Random random=new Random();
        if(checkUserList.size()==0){//未提交||"02".equals(status)
        	fileNameList.add((random.nextInt(999-100+1)+100)+"WARRANT.jpg");
            fileNameList.add((random.nextInt(999-100+1)+100)+"LOAN_APPLICATION.jpg");
            fileNameList.add((random.nextInt(999-100+1)+100)+"business_licence.jpg");
            String ftpPath = serverInfo.getString("ftpPath")+ID;  
            String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  //文件路径
            try{
            	//将服务器上图片下载到本地
     	        FtpUtil.downloadFtpFile1(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath, fileNameList); 
            }catch(Exception e){
            	logger.error(e.getMessage(),e);
            }
            for(int i=0;i<fileNameList.size();i++){
            	String fileName=fileNameList.get(i);
            	File file=new File(localPath+File.separator+fileName);
            	if(file.length()>0){
            		pd.put(fileName.substring(3,fileName.length()-4), ID+File.separator+fileName);
            	}
            }
		}else{//已提交
			String FILEADDRESS = checkUserList.get(0).getString("FILEADDRESS");
			fileNameList.add((random.nextInt(999-100+1)+100)+"WARRANT.jpg");
            fileNameList.add((random.nextInt(999-100+1)+100)+"LOAN_APPLICATION.jpg");
            fileNameList.add((random.nextInt(999-100+1)+100)+"business_licence.jpg");
            String ftpPath = serverInfo.getString("ftpPath")+FILEADDRESS;  
            String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + FILEADDRESS;  //文件路径
            try{
            	//将服务器上图片下载到本地
     	        FtpUtil.downloadFtpFile1(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath, fileNameList); 
            }catch(Exception e){
            	logger.error(e.getMessage());
            }
            for(int i=0;i<fileNameList.size();i++){
            	String fileName=fileNameList.get(i);
            	File file=new File(localPath+File.separator+fileName);
            	if(file.length()>0){
            		pd.put(fileName.substring(3,fileName.length()-4), FILEADDRESS+File.separator+fileName);
            	}
            }
		}
		mv.setViewName("credit/editPerson/saveCompany_edit");
		mv.addObject("checkUserList", checkUserList);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	
	/**去个人页面添加申请
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goRevise")
	public ModelAndView goRevise(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();		
		List<PageData> checkUserList=new ArrayList<PageData>();
		String status = "00";
		try {
			checkUserList=savePersonInquiry.findCheckUserList(pd);
			if(checkUserList.size()==0){//未提交
				pd = savePersonInquiry.findById(pd);
				if(pd==null){
					pd = savePersonInquiry.findByIdHis(pd);
				}
				pd.put("STATUS", status);
			}else{
				pd.putAll(checkUserList.get(0));
				status = pd.getString("STATUS");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		String ID = pd.getString("ID");
 		//获得配置文件配置信息
 		PageData serverInfo=new PageData();
		try {
			serverInfo = BaseController.getServerInfo();
		} catch (IOException e1) {
			logger.error(e1.getMessage(),e1);
		}
 		serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
        List<String> fileNameList = new ArrayList<String>();
        Random random=new Random();
        if(checkUserList.size()==0){//未提交
        	fileNameList.add((random.nextInt(999-100+1)+100)+"WARRANT.jpg");
            fileNameList.add((random.nextInt(999-100+1)+100)+"LOAN_APPLICATION.jpg");
            fileNameList.add((random.nextInt(999-100+1)+100)+"IDENTITY_DOCUMENT.jpg");
            String ftpPath = serverInfo.getString("ftpPath")+ID;  
            String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  //文件路径
            try{
            	//将服务器上图片下载到本地
     	        FtpUtil.downloadFtpFile1(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath, fileNameList); 
            }catch(Exception e){
            	logger.error(e.getMessage());
            }
            for(int i=0;i<fileNameList.size();i++){
            	String fileName=fileNameList.get(i);
            	File file=new File(localPath+File.separator+fileName);
            	if(file.length()>0){
            		pd.put(fileName.substring(3,fileName.length()-4), ID+File.separator+fileName);
            	}
            }
        }else{//已提交
			String FILEADDRESS = checkUserList.get(0).getString("FILEADDRESS");
			fileNameList.add((random.nextInt(999-100+1)+100)+"WARRANT.jpg");
            fileNameList.add((random.nextInt(999-100+1)+100)+"LOAN_APPLICATION.jpg");
            fileNameList.add((random.nextInt(999-100+1)+100)+"IDENTITY_DOCUMENT.jpg");
            String ftpPath = serverInfo.getString("ftpPath")+FILEADDRESS;  
            String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + FILEADDRESS;  //文件路径
            try{
            	//将服务器上图片下载到本地
     	        FtpUtil.downloadFtpFile1(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath, fileNameList); 
            }catch(Exception e){
            	logger.error(e.getMessage());
            }
            for(int i=0;i<fileNameList.size();i++){
            	String fileName=fileNameList.get(i);
            	File file=new File(localPath+File.separator+fileName);
            	if(file.length()>0){
            		pd.put(fileName.substring(3,fileName.length()-4), FILEADDRESS+File.separator+fileName);
            	}
            } 
        }
		mv.setViewName("credit/editPerson/savePerson_edit");
		mv.addObject("checkUserList", checkUserList);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	/**保存公司信息到数据库
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveCompany")
	public ModelAndView saveCompany(HttpServletRequest request,
			@RequestParam(value="WARRANT",required=false)MultipartFile file1,
			@RequestParam(value="LOAN_APPLICATION",required=false) MultipartFile file2,
			@RequestParam(value="IDENTITY_DOCUMENT",required=false) MultipartFile file3,
			@RequestParam(value="EDIT_REASON",required=false) String EDIT_REASON,
			@RequestParam(value="ID",required=false) String ID,
			@RequestParam(value="WARRANT1",required=false)String oldWarrant,
			@RequestParam(value="LOAN_APPLICATION1",required=false) String oldLoad,
			@RequestParam(value="IDENTITY_DOCUMENT1",required=false) String oldIde
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改查询申请");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
        String finalFileName1="WARRANT";
        String finalFileName2="LOAN_APPLICATION";
        String finalFileName3="business_licence";
      //获得配置文件配置信息
 		PageData serverInfo = BaseController.getServerInfo();
		pd.put("ID", ID);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String str = sdf.format(d);
		try{
			//查询查询员信息
			PageData pdSave  = savePersonInquiry.findCompanyById(pd);
			String fileName = str+"_"+pdSave.getString("USER_SYS_ID");
			
			//判断是否已经提交申请
			List<PageData> checkUserList=new ArrayList<PageData>();
			checkUserList=savePersonInquiry.findCheckUserList(pd);
			if(checkUserList.size()!=0&&"00".equals(checkUserList.get(0).getString("STATUS"))){//已提交
				fileName = checkUserList.get(0).getString("FILEADDRESS");	
			}else if(checkUserList.size()!=0 &&!"00".equals(checkUserList.get(0).getString("STATUS"))){
				ID = checkUserList.get(0).getString("FILEADDRESS"); //前一次文件夹名
			}
			String path=serverInfo.getString("ftpPath")+fileName;
			//申请提交时间
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//将查询的数据信息插入数据库
			String ClientType = "2";//客户类型：企业
			pdSave.put("CLIENT_TYPE", ClientType);
			pdSave.put("STATUS", "00");
			pdSave.put("EDIT_REASON", EDIT_REASON);//修改原因、
			pdSave.put("FILEADDRESS", fileName);
			pdSave.put("APPLICATION_TIME", sdf.format(d));
			if(checkUserList.size()==0||!"00".equals(checkUserList.get(0).getString("STATUS"))){
				savePersonInquiry.insertInto(pdSave);
			}else{
				//更新状态为待审核
				savePersonInquiry.updateCRecord(pdSave);
			}
			//上传图片
			uploadpic(file1,path,finalFileName1,serverInfo,fileName,ID,oldWarrant);
	        uploadpic(file2,path,finalFileName2,serverInfo,fileName,ID,oldLoad);
	        uploadpic(file3,path,finalFileName3,serverInfo,fileName,ID,oldIde);
	        //删除本地临时文件夹
            String localPath1 = PathUtil.getClasspath() + Const.FILEPATHIMG + fileName;  //文件路径
            String localPath2 = PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  //文件路径
            deleteDirectory(localPath1);
            deleteDirectory(localPath2);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		
		mv.addObject("pd", pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}


	/**保存个人业务
	 * @author gaoshenga
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView edit(HttpServletRequest request,
			@RequestParam(value="WARRANT",required=false)MultipartFile file1,
			@RequestParam(value="LOAN_APPLICATION",required=false) MultipartFile file2,
			@RequestParam(value="IDENTITY_DOCUMENT",required=false) MultipartFile file3,
			@RequestParam(value="EDIT_REASON",required=false) String EDIT_REASON,
			@RequestParam(value="ID",required=false) String ID,
			@RequestParam(value="WARRANT1",required=false)String oldWarrant,
			@RequestParam(value="LOAN_APPLICATION1",required=false) String oldLoad,
			@RequestParam(value="IDENTITY_DOCUMENT1",required=false) String oldIde
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改查询申请");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
        String finalFileName1="WARRANT";
        String finalFileName2="LOAN_APPLICATION";
        String finalFileName3="IDENTITY_DOCUMENT";
      //获得配置文件配置信息
 		PageData serverInfo = BaseController.getServerInfo();
		pd.put("ID", ID);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String str = sdf.format(d);
		try{
			//查询查询员信息
			PageData pdSave  = savePersonInquiry.findById(pd);
			String fileName = str+"_"+pdSave.getString("USER_SYS_ID");
			//判断是否已经提交申请
			List<PageData> checkUserList=new ArrayList<PageData>();
			checkUserList=savePersonInquiry.findCheckUserList(pd);
			if(checkUserList.size()!=0&&"00".equals(checkUserList.get(0).getString("STATUS"))){//已提交
				fileName = checkUserList.get(0).getString("FILEADDRESS");	
			}else if(checkUserList.size()!=0 &&!"00".equals(checkUserList.get(0).getString("STATUS"))){
				ID = checkUserList.get(0).getString("FILEADDRESS");//前一次文件夹名
			}
			String path1=serverInfo.getString("ftpPath")+fileName;	//将查询的数据信息插入数据库
			//申请提交时间
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String ClientType = "1";//客户类型：个人
			pdSave.put("CLIENT_TYPE", ClientType);
			pdSave.put("STATUS", "00");
			pdSave.put("EDIT_REASON", EDIT_REASON);//修改原因、
			pdSave.put("FILEADDRESS", fileName);
			pdSave.put("APPLICATION_TIME", sdf.format(d));
			if(checkUserList.size()==0||!"00".equals(checkUserList.get(0).getString("STATUS"))){
				savePersonInquiry.insertInto(pdSave);
			}else{
				//更新状态为待审核
				savePersonInquiry.updateCRecord(pdSave);
			}
			//上传图片
			uploadpic(file1,path1,finalFileName1,serverInfo,fileName,ID,oldWarrant);
	        uploadpic(file2,path1,finalFileName2,serverInfo,fileName,ID,oldLoad);
	        uploadpic(file3,path1,finalFileName3,serverInfo,fileName,ID,oldIde);
	        //删除本地临时文件夹
            String localPath1 = PathUtil.getClasspath() + Const.FILEPATHIMG + fileName;  //文件路径
            String localPath2 = PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  //文件路径
            deleteDirectory(localPath1);
            deleteDirectory(localPath2);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		
		mv.addObject("pd", pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}

	//文件上传
    public void uploadpic(MultipartFile file,String path,String finalFileName,PageData serverInfo,String id,String OldId,String oldName){
        FileTool filetool=new FileTool();
        if (null != file && !file.isEmpty()) {			
			String ftpPassword =  PasswordOper.decode(serverInfo.getString("LoginPass")); 
			String fileName = file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf("."));
			String extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			finalFileName=finalFileName+".jpg";
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG+id;	//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, fileName);			//执行上传
			filetool.upLoadFromProduction(serverInfo.getString("IP"),Integer.parseInt(serverInfo.getString("port")), serverInfo.getString("LoginName"), ftpPassword, path, finalFileName,filePath+File.separator+fileName);
		}else{
			String ftpPassword =  PasswordOper.decode(serverInfo.getString("LoginPass")); 
			String fileName = oldName.replaceAll(OldId, "");
			fileName = fileName.replaceAll("/", "").replaceAll("\\\\", "");
			finalFileName=finalFileName+".jpg";
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG+OldId;	//文件上传路径
			filetool.upLoadFromProduction(serverInfo.getString("IP"),Integer.parseInt(serverInfo.getString("port")), serverInfo.getString("LoginName"), ftpPassword, path, finalFileName,filePath+File.separator+fileName);
			
		}
	}
		    
	    
	/**
	 * 修改服务器上面的文件
	 */
	private static FTPClient ftpClient = new FTPClient();
	public static boolean renameFile(String url,// FTP服务器hostname  
	        int port,// FTP服务器端口  
	        String username, // FTP登录账号  
	        String password, // FTP登录密码  
	        String path,
	        String sourceFileName,String targetName) throws IOException {  
	  FTPClient ftpClient = new FTPClient(); 
		  	boolean flag =false;
		  	
		  	if(ftpClient!=null){
		  		try{
		  		  int reply;  
				  ftpClient.connect(url, port);// 连接FTP服务器  
		          // 如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器  
				  ftpClient.login(username, password);// 登录  
		          reply = ftpClient.getReplyCode();  
		          if (!FTPReply.isPositiveCompletion(reply)) {  
		        	  ftpClient.disconnect();  
		              return false;
		          }
		          	ftpClient.changeWorkingDirectory(path); 
		  			flag = ftpClient.rename(sourceFileName, targetName);
		  		}catch(IOException e){
		  			e.printStackTrace();
		  			closeCon();
		  		}
		  	}
		  	return flag; 
	}

	public static void closeCon(){
		if(ftpClient !=null){
			if(ftpClient.isConnected()){
				try{
					ftpClient.logout();
					ftpClient.disconnect();
				}catch(IOException e){
					logger.error(e.getMessage(),e);
				}
			}
		}
	}
	
  	/**
  	 * 删除本地文件和文件夹
  	 * @param path
  	 */
	public void deleteDirectory(String path){
		if(!path.endsWith(File.separator)){
			path = path+File.separator;
		}
		File dirFile = new File(path);
		if((!dirFile.exists())||(!dirFile.isDirectory())){
			return;
		}
		File[] files = dirFile.listFiles();
		for(int i=0;i<files.length;i++){
			//删除子文件
			if(files[i].isFile()){
				File file = new File(files[i].getAbsolutePath());
				if(file.exists()&&file.isFile()){
					try{
						file.delete();
					}catch(Exception e){
						logger.error("本地临时文件删除失败："+file.getName()+e.getMessage(),e);
					}
				}
			}else if(files[i].isDirectory()){//删除子目录
				deleteDirectory(files[i].getAbsolutePath());
			}
		}
		//删除当前目录
		try{
			dirFile.delete();
		}catch(Exception e){
			logger.error("本地临时文件删除失败："+dirFile.getName()+e.getMessage(),e);
		}
	}


}
