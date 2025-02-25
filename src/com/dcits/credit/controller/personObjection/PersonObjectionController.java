package com.dcits.credit.controller.personObjection;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.apache.shiro.session.Session;
import org.jsoup.nodes.Document;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.entity.ObjectItemForm;
import com.dcits.credit.service.personObjection.PersonObjectionManager;
import com.dcits.credit.service.queryStatistics.PersonRegisterManager;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.ObjXmlParseUtilPerson;
import com.dcits.credit.util.ObjectUtil;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.UserUtil;
import com.dcits.credit.util.sm3.SM3Digest;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.controller.system.cache.CacheController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.service.system.org.impl.OrgService;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;
import com.dcits.platform.util.UuidUtil;
import com.dcits.platform.util.role.RoleAuthFactory;

import net.sf.json.JSONObject;


/**
 * @author wangguoxing
 *  创建时间： 2019年1月15日上午9:57:58
 */
@Controller
@RequestMapping(value="/personObjection")
public class PersonObjectionController extends BaseController {
	
	@Resource(name="PersonObjectionService")
	private PersonObjectionManager PersonObjectionService;
	@Resource(name="orgService")
	private OrgManager orgService;
	
	
	/**待核查列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listToCheck")
	public ModelAndView listToCheck(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		User user = UserUtil.getCurrUser();
		String company = user.getCOMPANY();
		pd.put("company", company);
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USER_ID", null);
		}else{
			pd.put("USER_ID", user.getUSER_ID());
		}				
		List<PageData>	varList = null;
		List<PageData> orgs = null;
		try {			
			//机构
			pd.put("COMPANY", user.getCOMPANY()); //法人
			if(UserUtil.CurrUserIsAdmin()){
				mv.addObject("admin","1");
				if(pd.get("ORG_NAME")!=null&&!pd.get("ORG_NAME").equals("")){
					String Org_id=orgService.findOrgIdByOrgName((String)pd.get("ORG_NAME"));
					pd.put("ORG_ID",Org_id);
				}
				orgs = PersonObjectionService.findOrgByCompany(company);
				mv.addObject("orgs", orgs);
			}else{
				mv.addObject("admin","0");
				pd.put("ORG_ID", user.getOrg().getOrgId());
				pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
				
			}
			page.setPd(pd);
			varList = PersonObjectionService.listToCheckMainlistPage(page);
		} catch (Exception e) {
			logger.error("personObjection.listToCheck方法出错！",e);
		}
		mv.setViewName("credit/objection/personObjectionToCheck");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("orgs", orgs);
		return mv;
	}
	/**
	 * 分配异议处理机构
	 */
	@RequestMapping(value="/batchUpdateObjOrg")
	@ResponseBody
	public Object distributeObjOrg(ObjectItemForm objectItem){
		Map<String,String> map = new HashMap<String,String>();
		try {
			PersonObjectionService.batchUpdateOrg(objectItem.getobjectItem());
			map.put("msg", "异议处理机构分配成功");
		} catch (Exception e) {
			map.put("msg", "异议处理机构分配失败");
			logger.info(e.getMessage());
		}
		return map;
	}
	
	/**子表列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listSubToCheck")
	public ModelAndView listSubToCheck(Page page){
		
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> varList = null;
		try {
			varList = PersonObjectionService.listToCheckSublistPage(page);
		} catch (Exception e) {
			logger.error("personObjection.listSubToCheck方法出错！",e);
		}
		mv.setViewName("credit/objection/personObjectionToCheckSub");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**二级子表列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listSubLastToCheck")
	public ModelAndView listSubLastToCheck(Page page){
		
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	varList = null;
		try {
			varList = PersonObjectionService.listToCheckSubLastlistPage(page);
		} catch (Exception e) {
			logger.error("personObjection.listSubLastToCheck方法出错！",e);
		}
		mv.setViewName("credit/objection/personObjectionToCheckSubLast");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	/**待核查附件列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listToCheckEnclosure")
	public ModelAndView listToCheckEnclosure(Page page){
		
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("company", company);
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERNAMEINF", null);
		}else{
			pd.put("USERNAMEINF", username);
		}
		page.setPd(pd);
		List<PageData> varList = null;
		try {
			varList = PersonObjectionService.listToCheckEnclosurelistPage(page);
		} catch (Exception e) {
			logger.error("personObjection.listToCheckEnclosure方法出错！",e);
		}
		mv.setViewName("credit/objection/personObjectionToCheckEnclosure");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 查看附件是否存在
	 */
	@RequestMapping(value="/isExists")
	@ResponseBody
	public Object findAttr(){
		Map<String,String> map = new HashMap<String,String>();
		String enclosureName = null;
		String enclosurePath = null;
		try {
			PageData pd = this.getPageData();
			String flow_id = pd.getString("ID").split("_")[0];
			String obj_id = pd.getString("ID").split("_")[1] ;
			pd.put("ID", flow_id);
			pd.put("OBJCHECKID", obj_id);
			enclosureName = obj_id+".zip";
			enclosurePath = PathUtil.getClasspath() + Const.OBJ_ENCLOSURE + 
					flow_id+"/";
			List<String> fileNameList = new ArrayList<String>();
			fileNameList.add(enclosureName);
			PageData serverInfo = BaseController.getServerInfo();
			//密码解密
			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
			boolean is_exists=FtpUtil.isFTPFileExist_zip(
					serverInfo.getString("IP"), 
					serverInfo.getString("LoginName"),
					serverInfo.getString("LoginPass"), 
					Integer.parseInt(serverInfo.getString("port")), 
					serverInfo.getString("ftpObjAttPath_download") + flow_id,
					fileNameList.get(0));
			if(is_exists){
				FtpUtil.downloadFtpFile(
						serverInfo.getString("IP"), 
						serverInfo.getString("LoginName"),
						serverInfo.getString("LoginPass"), 
						Integer.parseInt(serverInfo.getString("port")) , 
						serverInfo.getString("ftpObjAttPath_download") + flow_id, 
						enclosurePath, 
						fileNameList);
				CompressUtils.unZip(enclosurePath+enclosureName,
						enclosurePath+obj_id+"/",enclosureName.substring(0,6));
				map.put("msg", "Y");
				map.put("filePath", enclosurePath+obj_id+"/"+enclosureName);
			}else{
				PageData findAttrBy = PersonObjectionService.findAttrBy(pd);
				if(findAttrBy != null){
					map.put("msg", findAttrBy.getString("RESULTDESC"));
				}else{
					map.put("msg", "查询失败！");
				}
			}
		} catch (Exception e) {
			logger.error("personObjection.isExists方法出错！",e);
			map.put("msg", "系统异常，请联系系统管理员！");
		}finally {
			delFile(enclosurePath+enclosureName);
		} 
		return map;
	}
	
	/**
	 * 下载附件
	 * @param response
	 */
	@RequestMapping(value="/downloadAttr")
	public void downloadMS(HttpServletResponse response){
		String filepath = null;
		try {
			HttpServletRequest request = this.getRequest();
			request.setCharacterEncoding("UTF-8");
			filepath = request.getParameter("filepath");
			File file = new File(filepath);
			if(file.exists()){
				String realname = "file.zip";
				if(filepath.contains("/")){
					realname = filepath.substring(filepath.lastIndexOf("/")+1);
				}else{
					realname = filepath.substring(filepath.lastIndexOf("\\")+1);
				}
				FileDownload.fileDownload(response, filepath, realname);
			}
		} catch (Exception e) {
			logger.error("personObjection.downloadAttr方法出错！",e);
			logger.error(e.getMessage(),e);
		}finally {
			delFile(filepath);
			if(filepath!=null){
				String path1 = filepath.substring(0,  filepath.lastIndexOf("/"));
				String path2 = path1.substring(0,  path1.lastIndexOf("/"));
				delFile_Dir(path1);
				delFile_Dir(path2);
			}		
		}
	} 
	
	
	/**
	 * 异议事项信息下载
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/download_ITEMINF")
	@ResponseBody
	public Object download_ITEMINF() {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData p = this.getPageData();
		String OBJITEMINF_id = p.getString("OBJITEMINF");
		String filename = OBJITEMINF_id+".zip";
		String msg = "success";
		String localPath = null;
		//需要下载的文件名
		List<String> fileNameList = new ArrayList<String>();
        fileNameList.add(filename);
		try {
			//下载到应用所在目录
			PageData pd = getServerInfo();
			String url = pd.getString("IP"); // FTP服务器hostname
			int port = Integer.parseInt(pd.getString("port")); // FTP服务器端口
			String username = pd.getString("LoginName"); // FTP登录账号
			String password = PasswordOper.decode(pd.getString("LoginPass")); // FTP登录密码
			String path = pd.getString("ftpObjAttPath_download")+OBJITEMINF_id+"/"; // FTP服务器保存目录
			localPath = PathUtil.getClasspath() +Const.HTML+OBJITEMINF_id+"/";  //文件路径
 	        try{
 	        	//将服务器上文件下载到本地
 	 	        FtpUtil.downloadFtpFile(url, username,password, port, path, localPath, fileNameList);
 	 	        //解压zip文件 	 	        
 	 	        logger.error("------------------下载成功，正在解压---------------"+localPath+filename);
 	 	        CompressUtils.unZip(localPath+filename,localPath+OBJITEMINF_id,OBJITEMINF_id.substring(0,6));
 	        }catch(Exception e){
 	        	logger.error(e.getMessage());
 	        	msg = "error";
 	        }
		} catch (Exception e) {
			logger.info(e.getMessage());
			msg = "error";
		}finally{
			delFile(localPath+filename);
		}
		map.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 下载异议事项信息
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/downloadlocal_ITEMINF")
	public void downloadlocal_ITEMINF(HttpServletResponse response) {
		PageData pd = this.getPageData();
		String OBJITEMINF_id = pd.getString("OBJITEMINF");
		//zip文件已解压，直接下载html文件
		String filename = OBJITEMINF_id+".html";
		String path = null;
		try{	
			path = PathUtil.getClasspath() + Const.HTML+OBJITEMINF_id+"/"+OBJITEMINF_id+"/";
			FileDownload.fileDownload(response, path+filename, filename);
			File file = new File(path);
			if (file.exists()) {
				file.delete();
			}	
		}catch (Exception e) {
			logger.info(e.getMessage());
		}finally{
			delFile(path);
			delFile_Dir(PathUtil.getClasspath() + Const.HTML+OBJITEMINF_id+"/"+OBJITEMINF_id);
			delFile_Dir(PathUtil.getClasspath() + Const.HTML+OBJITEMINF_id);
		}
	}

	
	/**待核查结果列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listToCheckResult")
	public ModelAndView listToCheckResult(Page page){
		
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("company", company);
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERNAMEINF", null);
		}else{
			pd.put("USERNAMEINF", username);
		}
		if(UserUtil.CurrUserIsAdmin()){
			mv.addObject("admin","1");
		}else{
			mv.addObject("admin","0");
			pd.put("ORG_ID", user.getOrg().getOrgId());
			pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
			
		}
		page.setPd(pd);
		List<PageData>	varList = null;
		try {
			varList = PersonObjectionService.listToCheckResultlistPage(page);
		} catch (Exception e) {
			logger.error("personObjection.listToCheckResult方法出错！",e);
		}
		mv.setViewName("credit/objection/personObjectionToCheckResult");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	/**跳转到上报页面
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/goCheckResultReport")
	public ModelAndView goCheckResultReport(){
		logBefore(logger, Jurisdiction.getUsername()+"列表goCheckResultReport");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(UserUtil.CurrUserIsAdmin()){
			mv.addObject("admin","1");
		}else{
			mv.addObject("admin","0");
		}
		try {
			String type = pd.getString("TYPE");
			pd = PersonObjectionService.findCheckResultBy(pd);
			if("1".equals(type)){
				//个人异议事项核查结果上报
				mv.setViewName("credit/objection/personObjectionToCheckResult_report");
			}else if("2".equals(type)){
				//个人异议事项更正结果上报
				mv.setViewName("credit/objection/personObjectionCorrect_report");
			}
		} catch (Exception e) {
			logger.error("personObjection.goCheckResultReport方法出错！",e);
		}
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 获取个人拼接请求报文所需要的基础信息
	 * @return
	 * @throws Exception 
	 */
	private PageData getRequestPerPd() throws Exception{
		PageData pd = PersonObjectionService.findPerBankInfo();
		String per_password = PasswordOper.decode(pd.getString("PER_PASSWORD")); //人行个人账户密码解密
		String com_password = PasswordOper.decode(pd.getString("COM_PASSWORD"));
		if(per_password == null || per_password.equals(""))
		{
			pd.put("PER_PASSWORD", per_password); //人行个人账户密码SM3加密
		}
		else
		{
			pd.put("PER_PASSWORD", SM3Digest.SM3OfUpper(per_password)); //人行个人账户密码SM3加密
		}
		if(per_password == null || per_password.equals(""))
		{
			pd.put("COM_PASSWORD", com_password);//人行企业账户密码SM3加密
		}
		else
		{
			pd.put("COM_PASSWORD", SM3Digest.SM3OfUpper(com_password));//人行企业账户密码SM3加密
		}
		pd.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
		return pd;
	}
	/**待核查结果上报
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/toCheckResultReport")
	public ModelAndView toCheckResultReport(){
		ModelAndView mv = this.getModelAndView();
		Map<String,String> map = new HashMap<String,String>();
		map.put("msg", "保存失败！");
		logBefore(logger, Jurisdiction.getUsername()+"列表toCheckResultReport");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			/**
			 * 报告类型（1-获取个人待核查异议事项 
			 * 2-获取个人待核查异议事项附件信息 
			 * 3-反馈个人异议事项核查结果 
			 * 4-反馈个人异议事项更正结果 
			 * 5-查询个人异议事项更正结果接受情况 
			 * 6-添加个人标注 
			 * 7-删除个人标注）
			 */
			PersonObjectionService.saveCheckResult(pd); //保存
			map.put("msg", "保存成功！");
			String btn_type = String.valueOf(pd.get("BTN_TYPE")); //1-保存并上报 2-保存 3-上报
			if(!"2".equals(btn_type)){
				//上报
				map.put("msg", "待核查结果保存成！");
				logger.debug("上报结果保存成功,开始调用人行结果上报");
				PageData requestPerPd = getRequestPerPd();
				pd.putAll(requestPerPd);
				//生成报文
				String requestXml = ObjXmlParseUtilPerson.concatMessageObjectionResult(pd);
				//人行返回报文
				String reponseXml = ObjXmlParseUtilPerson.responseXmlResult(requestXml);
				//数据落库
				PageData pdXmlMain =new PageData();
				pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,pd.getString("ID"));
				pdXmlMain.put("REPORT_TYPE", "3");
				pdXmlMain.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				pdXmlMain.put("OBJCHECKID", pd.getString("OBJCHECKID"));
				pdXmlMain.put("ID",pd.getString("ID"));
				PageData pd_tmp=PersonObjectionService.findObjectionResultBy(pdXmlMain);
				if(pd_tmp==null){
					PersonObjectionService.toCheckObjectionResult(pdXmlMain); //新增
				}else{
					PersonObjectionService.updateObjectionResultBy(pdXmlMain);//更新
				}
				logger.debug("待核查结果上报人行成功！");
				map.put("msg", "上报成功！");
			}
		} catch (Exception e) {
			map.put("msg", "上报失败！");
			logger.error("personObjection.toCheckResultReport方法出错！",e);
		}
//		return map;
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**更正结果列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listCorrect")
	public ModelAndView listCorrect(Page page){
		
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("company", company);
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERNAMEINF", null);
		}else{
			pd.put("USERNAMEINF", username);
			pd.put("ORG_ID", user.getOrg().getOrgId());
			pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
		}
		if(UserUtil.CurrUserIsAdmin()){
			mv.addObject("admin","1");
		}else{
			mv.addObject("admin","0");
			pd.put("ORG_ID", user.getOrg().getOrgId());
			pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
		}
		page.setPd(pd);
		List<PageData>	varList = null;
		try {
			varList = PersonObjectionService.listCorrectlistPage(page);
		} catch (Exception e) {
			logger.error("personObjection.listCorrect方法出错！",e);
		}
		mv.setViewName("credit/objection/personObjectionCorrect");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**更正结果上报
	 * @throws Exception
	 */
	@RequestMapping(value="/correctResultReport")
	public ModelAndView correctResultReport(
			@RequestParam(value="multiUploadFile",required=false) MultipartFile file,
			@RequestParam(value="ID",required=false) String ID,
			@RequestParam(value="BTN_TYPE",required=false) String BTN_TYPE,
			@RequestParam(value="OBJCHECKID",required=false) String OBJCHECKID,
			@RequestParam(value="OBJCHECKNUM",required=false) String OBJCHECKNUM,
			@RequestParam(value="CORRECTRESULT",required=false) String CORRECTRESULT,
			@RequestParam(value="CORRECTDESC",required=false) String CORRECTDESC
			){
		logBefore(logger, Jurisdiction.getUsername()+"列表correctResultReport");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		String localPath = "";
		String att_name = "";
		String file_Path ="";
		try {
			/**
			 * 报告类型（1-获取个人待核查异议事项 
			 * 2-获取个人待核查异议事项附件信息 
			 * 3-反馈个人异议事项核查结果 
			 * 4-反馈个人异议事项更正结果 
			 * 5-查询个人异议事项更正结果接受情况 
			 * 6-添加个人标注 
			 * 7-删除个人标注）
			 */
			pd.put("ID",ID);
			pd.put("BTN_TYPE", BTN_TYPE);
			pd.put("OBJCHECKID", OBJCHECKID);
			pd.put("OBJCHECKNUM", OBJCHECKNUM);
			pd.put("CORRECTRESULT", CORRECTRESULT);
			pd.put("CORRECTDESC", CORRECTDESC);
			pd.put("CORRECT_ENCLOSUREINF", file.getOriginalFilename());
			File file1 = null;
			File file2 = null;			
			//将附件上传到ftp			
			if(!file.isEmpty()){
			    file_Path = PathUtil.getClasspath()+Const.FILEPATHFILE+ID +"/"+file.getOriginalFilename();
				correctUploadEnclosure(file,ID);
				file2 = new File(file_Path);
			}else{
				PageData pd_tmp = PersonObjectionService.findCheckResultBy(pd);
				if(pd_tmp!=null){								
					if(pd_tmp.getString("CORRECT_ENCLOSUREINF")!=null && !pd_tmp.getString("CORRECT_ENCLOSUREINF").equals("")){
						pd.put("CORRECT_ENCLOSUREINF", pd_tmp.getString("CORRECT_ENCLOSUREINF"));
						if(!"2".equals(BTN_TYPE)){
							att_name = pd_tmp.getString("CORRECT_ENCLOSUREINF");
							//判断文件是否存在
							PageData serverInfo = getServerInfo();
						    String ftpHost =serverInfo.getString("IP");  
					        String ftpUserName =serverInfo.getString("LoginName");  
					        String ftpPassword =  PasswordOper.decode(serverInfo.getString("LoginPass"));  
					        int ftpPort =  Integer.parseInt(serverInfo.getString("port"));  
					        String ftpPath =serverInfo.getString("ftpObjAttPath_upload")+ID+"/";  
					        localPath =PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  
					        List<String> fileList = new ArrayList<String>();		       
					        fileList.add(ID+".zip");
					        FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileList); 
					        
					        CompressUtils.unZip(localPath+"/"+ID+".zip", localPath+"/"+ID, ID.substring(0, 6));
					        file1 = new File(localPath+"/"+ID+"/"+att_name);	
						}
					}
				}
			}			
			PersonObjectionService.saveCorrectResult(pd); //保存
			
			if(!"2".equals(BTN_TYPE)){
				//上报
				logger.debug("更正结果上报结果保存成功,开始调用人行结果上报");
				PageData requestPerPd = getRequestPerPd();
				pd.putAll(requestPerPd);
				String requestXml="";
				if(file1!=null){
					//生成报文
					 requestXml = ObjXmlParseUtilPerson.concatObjectionCorrect(file1,pd);
				}else{
					//生成报文
					 requestXml = ObjXmlParseUtilPerson.concatObjectionCorrect(file2,pd);
				}
				
				//人行返回报文
				String reponseXml = ObjXmlParseUtilPerson.responseXmlCorrect(requestXml);
				//数据落库
				PageData pdXmlMain =new PageData();
				pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,ID);
				pdXmlMain.put("REPORT_TYPE", "4");
				pdXmlMain.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				pdXmlMain.put("OBJCHECKID", OBJCHECKID);
				pdXmlMain.put("ID",ID);
				PageData pd_tmp=PersonObjectionService.findObjectionResultBy(pdXmlMain);
				if(pd_tmp==null){
					PersonObjectionService.toCheckObjectionResult(pdXmlMain); //新增
				}else{
					PersonObjectionService.updateObjectionResultBy(pdXmlMain);//更新
				}
				logger.debug("更正结果上报人行成功！");
			}			
		} catch (Exception e) {
			logger.error("personObjection.correctResultReport方法出错！",e);
		}finally{
			delFile(localPath+"/"+ID+".zip");
			delFile(localPath+"/"+ID+"/"+att_name);
			delFile(file_Path);
			delFile_Dir(localPath+"/"+ID+"/");
			delFile_Dir(localPath);
		}	
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 删除文件夹
	 * @param path
	 */
	@SuppressWarnings("unused")
	private  void delFile_Dir(String path){
		try {
			if(!StringUtil.isEmpty(path)){
				File file = new File(path);
				if(file.isDirectory()){
					file.delete();
					}
				}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
	/**
	 * 更正结果上传附件
	 * @return
	 * @throws IOException 
	 */
	@SuppressWarnings("static-access")
	public void correctUploadEnclosure(MultipartFile file,String flow_id) throws Exception{
		
		String fileName = file.getOriginalFilename();	
		if(StringUtil.isEmpty(fileName)) throw new Exception("系统异常，报错方法为correctUploadEnclosure");
		//将异议处理相关附件上传至ftp
		//保存附件信息
		PageData serverInfo = BaseController.getServerInfo();
		//密码解密
		serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
		String fileName_dest = fileName.substring(0,fileName.indexOf("."));
		String file_Path = PathUtil.getClasspath()+Const.FILEPATHFILE+flow_id +"/"+file.getOriginalFilename();
		String file_Path_zip = PathUtil.getClasspath()+Const.FILEPATHFILE+flow_id +"/zip/"+flow_id+".zip";
		try {	
		File f =  new File(file_Path);
		if(!f.exists()){
			new File(PathUtil.getClasspath()+Const.FILEPATHFILE+flow_id +"/").mkdir();
			f.createNewFile();
		}
//		MultipartFile file_copy = null;
		file.transferTo(f);
		CompressUtils.zip(file_Path,file_Path_zip, true, flow_id.substring(0, 6));			
		new FileTool().upLoadFromProduction(serverInfo.getString("IP"), 
				Integer.parseInt(serverInfo.getString("port")), 
				serverInfo.getString("LoginName"), 
				serverInfo.getString("LoginPass"), 
				serverInfo.getString("ftpObjAttPath_upload")+flow_id,
				flow_id+".zip",
				file_Path_zip
				);		
		} catch (Exception e) {
			logger.error("更正结果上传附件到ftp出错");
			logger.debug(e.getMessage(),e);
		}finally {
			delFile(file_Path_zip);
			delFile_Dir(PathUtil.getClasspath()+Const.FILEPATHFILE+flow_id +"/zip/");
		}
	}
	/**
	 * 删除文件
	 * @param path
	 */
	private void delFile(String path){
		try {
			if(!StringUtil.isEmpty(path)){
				File file = new File(path);
				if(file.exists()){
					if(file.isFile()){
						file.delete();
					}else if(file.isDirectory()){
						File[] arrFile = file.listFiles();
						for(File fi : arrFile){
							delFile(fi.getAbsolutePath());
						}
						file.delete();
					}
				}
			}
		} catch (Exception e) {
			logger.error("SchedulObjTask.delFile方法出错",e);
			logger.error(e.getMessage(),e);
		}
	}		
	
	/**
	 * 附件下载
	 * @param response
	 */
	@RequestMapping(value="downloadAtt")
	public void downloadAtt(HttpServletResponse response){
		PageData pd = this.getPageData();
		PageData serverInfo;
		try {
			String id = pd.getString("ID");
			String att_name = pd.getString("CORRECT_ENCLOSUREINF");//此处为带后缀的文件名
			serverInfo = getServerInfo();
			String filePath=Const.FILEPATHIMG+id+"/"+att_name;
			 String fileName_dest = att_name.substring(0,att_name.indexOf("."));
		    //判断文件是否存在
		    File file = new File(PathUtil.getClasspath() + filePath);		   
		    if(!file.exists()){
		    	String ftpHost =serverInfo.getString("IP");  
		        String ftpUserName =serverInfo.getString("LoginName");  
		        String ftpPassword =  PasswordOper.decode(serverInfo.getString("LoginPass"));  
		        int ftpPort =  Integer.parseInt(serverInfo.getString("port"));  
		        String ftpPath =serverInfo.getString("ftpObjAttPath_upload")+id+"/";  
		        String localPath =PathUtil.getClasspath() + Const.FILEPATHIMG + id;  
		        List<String> fileList = new ArrayList<String>();		       
		        fileList.add(id+".zip");
		        FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileList); 
		        
		        CompressUtils.unZip(localPath+"/"+id+".zip", localPath+"/"+id, id.substring(0, 6));
		    }
		    FileDownload.fileDownload(response,PathUtil.getClasspath()+Const.FILEPATHIMG+id+"/"+id+"/"+att_name, att_name);
		} catch (Exception e) {
			logger.error("URL=DistributeObjOrgController.downloadAtt()方法出错",e);
		}
	}
	/**
	 * 删除异议处理附件信息
	 * @return
	 */
	@RequestMapping(value="deleteAtt")
	@ResponseBody
	public Object deleteAtt(){
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = this.getPageData();
		try {
			PersonObjectionService.delAtt(pd);
			map.put("msg", "success");
		} catch (Exception e) {
			logger.info(e.getMessage());
			map.put("msg", "error");
		}
		return map;
	}
	
	/**更正结果接受列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listCorrectAccept")
	public ModelAndView listCorrectAccept(Page page){
		
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("company", company);
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERNAMEINF", null);
		}else{
			pd.put("USERNAMEINF", username);
			pd.put("ORG_ID", user.getOrg().getOrgId());
			pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
		}
		page.setPd(pd);
		List<PageData>	varList = null;
		try {
			varList = PersonObjectionService.listCorrectAcceptlistPage(page);
		} catch (Exception e) {
			logger.error("personObjection.listCorrectAccept方法出错！",e);
		}
		mv.setViewName("credit/objection/personObjectionCorrectAccept");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	/**更正结果接受情况查询
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/correctAcceptReport")
	@ResponseBody
	public Object correctAcceptReport(){
		logBefore(logger, Jurisdiction.getUsername()+"列表correctAcceptReport");
		Map<String,String> map = new HashMap<String,String>();
		map.put("msg", "查询失败！");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			/**
			 * 报告类型（1-获取个人待核查异议事项 
			 * 2-获取个人待核查异议事项附件信息 
			 * 3-反馈个人异议事项核查结果 
			 * 4-反馈个人异议事项更正结果 
			 * 5-查询个人异议事项更正结果接受情况 
			 * 6-添加个人标注 
			 * 7-删除个人标注）
			 */
				//上报
				logger.debug("开始调用人行接口查询更正结果接受情况");
				PageData requestPerPd = getRequestPerPd();
				pd.putAll(requestPerPd);
				pd.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				//生成报文
				String requestXml = ObjXmlParseUtilPerson.concatMessageEnclosureAndCorrectAccept(pd);
				//人行返回报文
				String reponseXml = ObjXmlParseUtilPerson.responseXmlCorrectAccept(requestXml);
				//数据落库
				PageData pdXmlMain =new PageData();
				pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,pd.getString("ID"));
				pdXmlMain.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				pdXmlMain.put("OBJCHECKID", pd.getString("OBJCHECKID"));
				PageData pd_tmp = PersonObjectionService.findResultToObjectionCorrectAcceptBy(pdXmlMain);
				if(pd_tmp == null){
					PersonObjectionService.saveResultToObjectionCorrectAccept(pdXmlMain);
				}else{
					PersonObjectionService.updateObjectionResultBy(pdXmlMain);				
				}
			    logger.debug("更正结果接受情况查询成功！");
				map.put("msg", "查询成功！");
		} catch (Exception e) {
			logger.error("personObjection.toCheckResultReport方法出错！",e);
		}
		return map;
	}
	
	/**添加个人标注列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listAddPersonLabel")
	public ModelAndView listAddPersonLabel(Page page){
		
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("company", company);
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERNAMEINF", null);
			mv.addObject("admin","1");
		}else{
			pd.put("USERNAMEINF", username);
			mv.addObject("admin","0");
		}
		page.setPd(pd);
		List<PageData>	varList = null;
		Map<String,String> dicMap = null;
		try {
			varList = PersonObjectionService.listAddPersonLabellistPage(page);
			List<Map<String, String>> listMap = CacheController.getListMap("infoCategroy");
			dicMap = ObjectUtil.listToMap2(listMap, "key", "value");
			for(PageData pdChange : varList){
				StringBuffer strBuff = new StringBuffer();
				String[] array = String.valueOf(pdChange.getString("LOCATEINFTYPE")).split(",");
				if(array.length==1 && array[0].equals("null")) continue;
				for(int i = 0; i<array.length; i++){
					String str = dicMap.get(array[i]);
					strBuff.append(","+str);
				}
				if(strBuff.toString().length()>0){
					pdChange.put("LOCATEINFTYPE", strBuff.toString().substring(1));
				}
			}
		} catch (Exception e) {
			logger.error("personObjection.listCorrectAccept方法出错！",e);
		}
		
		mv.setViewName("credit/objection/personObjectionAddPersonLabel");
		mv.addObject("varList", varList);
		if(varList.size()==0){
			pd.put("listSizeIsNull", "1");
		}
		mv.addObject("pd", pd);		
		return mv;
	}
	
	/**添加个人标注添加页面
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddPersonLabel")
	public ModelAndView goAddPersonLabel() {
		logBefore(logger, Jurisdiction.getUsername()+"新增页面goAddPersonLabel");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			if(UserUtil.CurrUserIsAdmin()){
				//法人
				mv.addObject("admin","1");
			}else{
				mv.addObject("admin","0");
			}
			List<Map<String, String>> listMap = CacheController.getListMap("infoCategroy");
			mv.addObject("dict", listMap);
			if(pd != null && pd.containsKey("ID") && pd.getString("ID") != null){
				pd = PersonObjectionService.findAddRemarkBy(pd);
				if(pd != null && !String.valueOf(pd.get("LOCATEINFTYPE")).equals("null")){
					//定位信息
					String[] locateinftypes = pd.getString("LOCATEINFTYPE").split(",");
					List<String> locateinftypes_list = Arrays.asList(locateinftypes);
					for(String locateinftype : locateinftypes){
						for(Map<String,String> map : listMap){
							if(String.valueOf(map.get("key")).equals(locateinftype)){
								map.put("checked", "true");
							}
						}
					}
				}
				mv.addObject("msg", "updatePersonLabel");
			}else{
				mv.addObject("msg", "addPersonLabel");
			}
		} catch (Exception e) {
			logger.error("personObjection.goAddPersonLabel方法出错！",e);
		}
		mv.setViewName("credit/objection/personObjectionAddPersonLabel_report");
		mv.addObject("pd", pd);
		return mv;
	} 
	/**添加个人标注
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/addPersonLabel")
	public ModelAndView addPersonLabel() {
		logBefore(logger, Jurisdiction.getUsername()+"新增addPersonLabel");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			//保存数据
			String locateInfType = pd.getString("LOCATEINFTYPE");
			if(StringUtil.isEmpty(locateInfType)){
				pd.put("LOCATEINFNM", "0");
			}else{
				String[] locateInfNm = locateInfType.split(",");
				pd.put("LOCATEINFNM", locateInfNm.length);
			}
			
			String id = UuidUtil.get64UUID();
			User user = UserUtil.getCurrUser();
			String username = user.getUSERNAME();
			if(!username.startsWith("admin")){
				String businessCode = user.getOrg().getORG_ID_PERBANK()
						+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()).substring(8);
				pd.put("BUSINESSCODE", businessCode);
			}
			pd.put("ID", id);
			pd.put("USER_SYS_ID", user.getUSER_ID());
			String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
			pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
			pd.put("QUERY_TIME",APPLICATION_TIME);//查询时间
			pd.put("CHECK_SYS_ID", "0");
			pd.put("STATUS", "02");//状态 02已审核
			pd.put("IP", user.getIP());
			pd.put("MAC", user.getMAC());
			pd.put("CLIENT_TYPE", "1");
			pd.put("ORG_ID", username.startsWith("admin") ? "" : user.getOrg().getOrgId());
			/*----根据获取的参数数据向个人异议信息表中添加数据-------*/
			PersonObjectionService.saveToObjectionInfoSix(pd);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			PersonObjectionService.saveToFs(pd);
			String btn_type = pd.getString("BTN_TYPE");
			if(!"2".equals(btn_type)){
				//上报
				logger.debug("添加个人标注保存成功,开始调用人行结果上报");
				PageData requestPerPd = getRequestPerPd();
				pd.putAll(requestPerPd);
				//生成报文
				String requestXml = ObjXmlParseUtilPerson.concatObjectionAddLabel(pd);
				//人行返回报文
				String reponseXml = ObjXmlParseUtilPerson.responseXmlAddLabel(requestXml);
				//数据落库
				PageData pdXmlMain =new PageData();
				pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,id);
				pdXmlMain.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				PersonObjectionService.saveResultToAddLabel(pdXmlMain);
				logger.debug("更正结果上报人行成功！");
			}
		} catch (Exception e) {
			logger.error("personObjection.addPersonLabel方法出错！",e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	} 
	/**修改个人标注信息
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/updatePersonLabel")
	public ModelAndView updatePersonLabel() {
		logBefore(logger, Jurisdiction.getUsername()+"修改updatePersonLabel");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			//保存数据
			String locateInfType = pd.getString("LOCATEINFTYPE");
			if(StringUtil.isEmpty(locateInfType)){
				pd.put("LOCATEINFNM", "0");
			}else{
				String[] locateInfNm = locateInfType.split(",");
				pd.put("LOCATEINFNM", locateInfNm.length);
			}
			/*----根据获取的参数数据向个人异议信息表中添加数据-------*/
			PersonObjectionService.updatePersonLabel(pd);
			String btn_type = pd.getString("BTN_TYPE");
			if(!"2".equals(btn_type)){
				//上报
				logger.debug("添加个人标注保存成功,开始调用人行结果上报");
				PageData requestPerPd = getRequestPerPd();
				pd.putAll(requestPerPd);
				pd.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				//生成报文
				pd.put("DATA_OCCUR_ORG_CODE", pd.getString("DATA_PROVIDER_ORG_CODE"));
				String requestXml = ObjXmlParseUtilPerson.concatObjectionAddLabel(pd);
				//人行返回报文
				String reponseXml = ObjXmlParseUtilPerson.responseXmlAddLabel(requestXml);
				//数据落库
				PageData pdXmlMain =new PageData();
				pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,pd.getString("ID"));
				pdXmlMain.put("USER_ID", pd.get("USER_ID"));
				PageData pd_tmp = PersonObjectionService.find_AddRemarkBy(pdXmlMain);
				if(pd_tmp==null){
					PersonObjectionService.saveResultToAddLabel(pdXmlMain);
				}else{
					PersonObjectionService.update_addRemark(pdXmlMain);
				}

				logger.debug("更正结果上报人行成功！");
			}
		} catch (Exception e) {
			logger.error("personObjection.updatePersonLabel方法出错！",e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	} 
	/**删除个人标注
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/deletePersonLabel")
	@ResponseBody
	public Object deletePersonLabel(){
		Map<String,String> map = new HashMap<String,String>();
		map.put("msg", "删除失败！");
		try {
			PageData pd = this.getPageData();
			PageData requestPerPd = getRequestPerPd();
			pd.putAll(requestPerPd);
			//生成报文
			String requestXml = ObjXmlParseUtilPerson.concatObjectionDeleteLabel(pd);
			//人行返回报文
			String reponseXml = ObjXmlParseUtilPerson.responseXmlDeleteLabel(requestXml);
			//数据落库
			PageData pdXmlMain =new PageData();
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,pd.getString("ID"));			
			PersonObjectionService.deletePersonLabel(pdXmlMain);
			pdXmlMain.put("USER_ID",UserUtil.getCurrUser().getUSER_ID());
			PersonObjectionService.update_UserId(pdXmlMain);
			map.put("msg", "删除成功！");
		} catch (Exception e) {
			logger.error("personObjection.deletePersonLabel方法出错！",e);
		}
		return map;
	}
	
	/**删除个人标注列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listDeletePersonLabel")
	public ModelAndView listDeletePersonLabel(Page page) {
		
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("company", company);
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERNAMEINF", null);
		}else{
			pd.put("USERNAMEINF", username);
		}
		page.setPd(pd);
		List<PageData>	varList = null;
		try {
			varList = PersonObjectionService.listDeletePersonLabellistPage(page);
			List<Map<String, String>> listMap = CacheController.getListMap("infoCategroy");
			Map<String,String> dicMap = ObjectUtil.listToMap2(listMap, "key", "value");
			for(PageData pdChange : varList){
				StringBuffer strBuff = new StringBuffer();
				String[] array = String.valueOf(pdChange.getString("LOCATEINFTYPE")).split(",");
				if(array.length==1 && array[0].equals("null")) continue;
				for(int i = 0; i<array.length; i++){
					String str = dicMap.get(array[i]);
					strBuff.append(","+str);
				}
				if(strBuff.toString().length()>0){
					pdChange.put("LOCATEINFTYPE", strBuff.toString().substring(1));
				}
			}
		} catch (Exception e) {
			logger.error("personObjection.listDeletePersonLabel方法出错！",e);
		}
		mv.setViewName("credit/objection/personObjectionDeletePersonLabel");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
