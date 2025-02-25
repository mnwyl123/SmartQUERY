package com.dcits.credit.controller.EntObjectAddRemark;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import com.dcits.credit.controller.SavePersonInquiry.SavePersonInquiryController;
import com.dcits.platform.util.*;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.sql.visitor.functions.Substring;
import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.entity.ObjectItemForm;
import com.dcits.credit.service.EntObjectRemark.EntObjectManager;
import com.dcits.credit.service.personObjection.PersonObjectionManager;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.FileToBase64;
import com.dcits.credit.util.ObjXmlParseUtil;
import com.dcits.credit.util.ObjXmlParseUtilPerson;
import com.dcits.credit.util.ObjectUtil;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.UserUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.controller.system.cache.CacheController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.role.RoleAuthFactory;

import net.sf.json.JSONObject;


/** 
 * 类名称：entObjectRemark
 * 创建人：gaosheng
 * 时间：2019-02-26
 * @version
 */
@Controller
@RequestMapping(value="/entObjectRemark")
public class EntObjectAddController extends BaseController {
	private static Logger logger = Logger.getLogger(EntObjectAddController.class);
	@Resource(name="entObjectService")
	private EntObjectManager entObjectService;
	@Resource(name="PersonObjectionService")
	private PersonObjectionManager PersonObjectionService;

	
	/**1.获取企业待核查异议事项
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView listToCheck(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"列表EntObjectAddController");
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
		page.setPd(pd);
		List<PageData>	varList = null;
		List<PageData> orgs = null;
		try {
			//机构
			pd.put("COMPANY", user.getCOMPANY()); //法人
			if(UserUtil.CurrUserIsAdmin()){
				mv.addObject("admin","1");
				orgs = entObjectService.findOrgByCompany(company);
				mv.addObject("orgs", orgs);
			}else{
				mv.addObject("admin","0");
				pd.put("ORG_ID", user.getOrg().getOrgId());
				pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
			}
			varList = entObjectService.listToCheckMainlistPage(page);
		} catch (Exception e) {
			logger.error("EntObjectAddController.listToCheck方法出错！",e);
		}
		mv.setViewName("credit/EntObjectRemark/EntObjectionToCheck");
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
			entObjectService.batchUpdateOrg(objectItem.getobjectItem());
			map.put("msg", "异议处理机构分配成功");
		} catch (Exception e) {
			map.put("msg", "异议处理机构分配失败");
			logger.info(e.getMessage());
		}
		return map;
	}
	/**异议信息
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listSubToCheck")
	public ModelAndView listSubToCheck(Page page){
		
		logBefore(logger, Jurisdiction.getUsername()+"列表EntObjectAddController");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> varList = null;
		try {
			varList = entObjectService.listToCheckSublistPage(page);
		} catch (Exception e) {
			logger.error("personObjection.listSubToCheck方法出错！",e);
		}
		mv.setViewName("credit/EntObjectRemark/EntObjInfo");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	/**历史信息
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listSubLastToCheck")
	public ModelAndView listSubLastToCheck(Page page){
		
		logBefore(logger, Jurisdiction.getUsername()+"列表EntObjectAddController");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	varList = null;
		try {
			varList = entObjectService.listToCheckSubLastlistPage(page);
		} catch (Exception e) {
			logger.error("personObjection.listSubLastToCheck方法出错！",e);
		}
		mv.setViewName("credit/EntObjectRemark/EntHistoryInfo");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 下载附件附件信息
	 * @param response
	 */
	@RequestMapping(value="/downloadAttr")
	public void downloadMS(HttpServletResponse response){
		String filepath = null;
		try {
			HttpServletRequest request = this.getRequest();
			request.setCharacterEncoding("UTF-8");
		    filepath = request.getParameter("filepath");
			String fileFTPpath = request.getParameter("fileFTPPath");
			File file = new File(filepath);
			File fileFTP = new File(fileFTPpath);
			if(file.exists()){
				String realname = "file.zip";
				if(filepath.contains("/")){
					realname = filepath.substring(filepath.lastIndexOf("/")+1);
				}else{
					realname = filepath.substring(filepath.lastIndexOf("\\")+1);
				}
				FileDownload.fileDownload(response, filepath, realname);
				delFileDir(fileFTP);//删除服务器的目录
			}
		} catch (Exception e) {
			logger.error("EntObjectAddController.downloadAttr方法出错！",e);
			logger.error(e.getMessage(),e);
		}
	}
	/**
	 * 查看附件是否存在
	 */
	@RequestMapping(value="/isExists")
	@ResponseBody
	public Object findAttr(){
		String enclosureName = null;
		String enclosurePath = null;
		Map<String,String> map = new HashMap<String,String>();
		try {
			PageData pd = this.getPageData();
			String flow_id = pd.getString("ID").split("_")[0];
			 enclosureName = pd.getString("ID").split("_")[1]+".zip";
			 enclosurePath = PathUtil.getClasspath() + Const.OBJ_ENCLOSURE + 
					flow_id+"/";//服务器上面的地址
			List<String> fileNameList = new ArrayList<String>();
			pd.put("OBJCHECKID", enclosureName.substring(0,enclosureName.lastIndexOf(".")));
			pd.put("ID", flow_id);
			fileNameList.add(enclosureName.substring(0,enclosureName.lastIndexOf(".")));//检查的时候的用的文件名	
			PageData serverInfo = BaseController.getServerInfo();
			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
			List<String> listName=FtpUtil.isFTPFileExist(
					serverInfo.getString("IP"), 
					serverInfo.getString("LoginName"),
					serverInfo.getString("LoginPass"),
					Integer.parseInt(serverInfo.getString("port")),
					serverInfo.getString("ftpObjAttPath_download") + flow_id+"/",
					fileNameList);
			fileNameList.remove(enclosureName.substring(0,enclosureName.lastIndexOf(".")));
			fileNameList.add(enclosureName);
			if(listName.size()>0){
				FtpUtil.downloadFtpFile(
						serverInfo.getString("IP"), 
						serverInfo.getString("LoginName"),
						serverInfo.getString("LoginPass"),
						Integer.parseInt(serverInfo.getString("port")),
						serverInfo.getString("ftpObjAttPath_download") + flow_id + "/",
						enclosurePath, 
						fileNameList);
				logger.debug("解压zip文件");
				String zipPath = enclosurePath+enclosureName.substring(0,enclosureName.lastIndexOf("."))+"zip";
				CompressUtils.unZip(enclosurePath+enclosureName,zipPath,enclosureName.substring(0,6));
				map.put("msg", "Y");
				map.put("filePath", zipPath+"/"+enclosureName);
				map.put("fileFTPPath", PathUtil.getClasspath() + Const.OBJ_ENCLOSURE +flow_id);
			}else{
				PageData findAttrBy = entObjectService.findAttrBy(pd);
				if(findAttrBy != null){
					map.put("msg", findAttrBy.getString("RESULTDESC"));
				}else{
					map.put("msg", "查询失败！");
				}
			}
		} catch (Exception e) {
			logger.error("EntObjectAddController.isExists方法出错！",e);
			map.put("msg", "系统异常，请联系系统管理员！");
		}finally {
			delFile(enclosurePath+enclosureName);
		}  
		return map;
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
			String password = PasswordOper.decode(pd.getString("LoginPass"));// FTP登录密码
			String path = pd.getString("ftpObjAttPath_download")+OBJITEMINF_id+"/"; // FTP服务器保存目录
 	        localPath = PathUtil.getClasspath() +Const.HTML+OBJITEMINF_id+"/";  //文件路径
 	        try{
 	        	//将服务器上文件下载到本地
 	 	        FtpUtil.downloadFtpFile(url, username,password, port, path, localPath, fileNameList); 	        
 	 	        logger.error("------------------下载成功，正在解压---------------"+localPath+filename);
 	 	        CompressUtils.unZip(localPath+filename,localPath,OBJITEMINF_id.substring(0,6));
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
		String filename = OBJITEMINF_id+".html";
		String path = null;
		try {		
				path = PathUtil.getClasspath() + Const.HTML+OBJITEMINF_id+"/"+filename;
				FileDownload.fileDownload(response, path, filename);
				File file = new File(path);
				if (file.exists()) {
					file.delete();
				}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}finally{
			delFile(path);
			delFile_Dir(PathUtil.getClasspath() + Const.HTML+OBJITEMINF_id+"/"+OBJITEMINF_id);
			delFile_Dir(PathUtil.getClasspath() + Const.HTML+OBJITEMINF_id);
		}
	}
	/**
	 * 2.反馈企业异议事项核查结果
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listObjTransRecord")
	public ModelAndView listObjTransRecord(Page page){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
		User user = UserUtil.getCurrUser();
		String company = user.getCOMPANY();
		pd.put("company", company);
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USER_ID", null);
		}else{
			pd.put("USER_ID", user.getUSER_ID());
		}
		if(UserUtil.CurrUserIsAdmin()){
			mv.addObject("admin","1");
		}else{
			mv.addObject("admin","0");
			pd.put("ORG_ID", user.getOrg().getOrgId());
			pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
			
		}
		try{
			List<PageData> listInfo = new ArrayList<PageData>();
			page.setPd(pd);
			//查询信息
			listInfo = entObjectService.listObjTransRecord(page);
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/EntObjectRemark/EntListObjTransRecord");
		return mv;
	}
	/**跳转到上报页面
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
			String ID = pd.getString("ID");
			pd = entObjectService.findCheckResultBy(pd);
			if("1".equals(type)){
				//企业异议事项核查结果上报
				mv.setViewName("credit/EntObjectRemark/EntObjectionToCheckResult_report");
			}else if("2".equals(type)){
				//个人异议事项更正结果上报
				mv.setViewName("credit/EntObjectRemark/EntObjectionCorrect_report");
			}
		} catch (Exception e) {
			logger.error("personObjection.goCheckResultReport方法出错！",e);
		}
		mv.addObject("pd", pd);
		return mv;
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
			entObjectService.saveCheckResult(pd); //保存
			map.put("msg", "保存成功！");
			String btn_type = String.valueOf(pd.get("BTN_TYPE")); //1-保存并上报 2-保存 3-上报
			if(!"2".equals(btn_type)){
				//上报
				map.put("msg", "待核查结果保存成！");
				logger.debug("上报结果保存成功,开始调用人行结果上报");
				PageData requestPerPd = getRequestPerPd();
				pd.putAll(requestPerPd);
				//生成报文
				String requestXml = ObjXmlParseUtil.dealWithReportCheckResult(pd);
				//人行返回报文
				String reponseXml = ObjXmlParseUtil.responseXmlCheckResult(requestXml);
				//数据落库
				PageData pdXmlMain =new PageData();
				pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,pd.getString("ID"));
				pdXmlMain.put("REPORT_TYPE", "3");
				pdXmlMain.put("OBJCHECKID", pd.getString("OBJCHECKID"));
				pdXmlMain.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				PageData ObjectPd = entObjectService.selectObjectID(pdXmlMain);
				if("0".equals(String.valueOf(ObjectPd.get("COUNTOBJECTID")))){
					entObjectService.toCheckObjectionResult(pdXmlMain);//保存数据库
				}else{
					entObjectService.toCheckObjectionUpdate(pdXmlMain);//修改
				}
				logger.debug("待核查结果上报人行成功！");
				map.put("msg", "上报成功！");
			}
		} catch (Exception e) {
			map.put("msg", "上报失败！");
			logger.error("EntObjectAddController.toCheckResultReport方法出错！",e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 3.保存异议核查结果信息
	 * @param request
	 * @param file1
	 * @param IS_WX_CHECK
	 * @return
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(HttpServletRequest request,
		    @RequestParam(value="multiUploadFile",required=false)MultipartFile file,
			@RequestParam(value="CORRECTDESC",required=false) String CORRECTDESC,
			@RequestParam(value="CORRECTRESULT",required=false) String CORRECTRESULT,
			@RequestParam(value="OBJCHECKNUM",required=false) String OBJCHECKNUM,
			@RequestParam(value="OBJCHECKID",required=false) String OBJCHECKID,
			@RequestParam(value="BTN_TYPE",required=false) String BTN_TYPE,
			@RequestParam(value="ID",required=false) String ID){
			logBefore(logger, Jurisdiction.getUsername()+"新增CreditInquiry");
			ModelAndView mv = this.getModelAndView();
			Map<String,String> map = new HashMap<String,String>();
			map.put("msg", "保存失败！");
			String fileName = file.getOriginalFilename();
			PageData pd = this.getPageData();
			pd.put("FILE", fileName);
			pd.put("CORRECTDESC", CORRECTDESC);
			pd.put("CORRECTRESULT", CORRECTRESULT);
			pd.put("OBJCHECKNUM", OBJCHECKNUM);
			pd.put("OBJCHECKID", OBJCHECKID);
			pd.put("ID", ID);
			pd.put("BTN_TYPE", BTN_TYPE);
			File file1 = null;
			File file2 = null;	
			String file_Path ="";
			String localPath = "";
			String att_name = "";
			try {
				if(!file.isEmpty()){
				    file_Path = PathUtil.getClasspath()+Const.FILEPATHFILE+ID +"/"+file.getOriginalFilename();
					correctUploadEnclosure(file,ID);
					file2 = new File(file_Path);
				}else{
					PageData pd_tmp = PersonObjectionService.findCheckResultBy(pd);
					if(pd_tmp!=null){								
						if(pd_tmp.getString("CORRECT_ENCLOSUREINF")!=null && !pd_tmp.getString("CORRECT_ENCLOSUREINF").equals("")){
							pd.put("FILE", pd_tmp.getString("CORRECT_ENCLOSUREINF"));
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
						        
						        CompressUtils.unZip(localPath+"/"+ID+".zip", localPath+"/"+ID, att_name.substring(0, 6));
						        file1 = new File(localPath+"/"+ID+"/"+att_name);	
							}
						}
					}
				}
				entObjectService.correctCheckResult(pd); //保存
				map.put("msg", "保存成功！");
				String btn_type = String.valueOf(pd.get("BTN_TYPE")); //1-保存并上报 2-保存 3-上报
				if(!"2".equals(btn_type)){
					//上报
					map.put("msg", "待核查结果保存成！");
					logger.debug("上报结果保存成功,开始调用人行结果上报");
					PageData requestPerPd = getRequestPerPd();
					pd.putAll(requestPerPd);
					String requestXml="";
					if(file1!=null){
						//生成报文
						requestXml = ObjXmlParseUtil.dealWithReportCorrect(file1,pd);
					}else{
						//生成报文
						requestXml = ObjXmlParseUtil.dealWithReportCorrect(file2,pd);
					}
					//人行返回报文
					String reponseXml = ObjXmlParseUtil.SaveXmlCorrect(requestXml);
					//数据落库
					PageData pdXmlMain =new PageData();
					pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,pd.getString("ID"));
					pdXmlMain.put("REPORT_TYPE", "4");
					pdXmlMain.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
					pdXmlMain.put("OBJCHECKID", pd.getString("OBJCHECKID"));
					PageData ObjectPd = entObjectService.selectObjectID(pdXmlMain);
					if("0".equals(String.valueOf(ObjectPd.get("COUNTOBJECTID")))){
						entObjectService.toCheckObjectionResult(pdXmlMain);//保存
					}else{
						entObjectService.toCheckObjectionUpdate(pdXmlMain);//修改
					}
					logger.debug("待核查结果上报人行成功！");
					map.put("msg", "上报成功！");
				}
			} catch (Exception e) {
				map.put("msg", "上报失败！");
				logger.error("EntObjectAddController.toCheckResultReport方法出错！",e);
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
	 * 3.反馈企业异议事项更正结果
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listObjTransCorrect")
	public ModelAndView listObjTransCorrect(Page page){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		try{
			String username = user.getUSERNAME();
			if(username.startsWith("admin")){
				pd.put("USER_ID", null);
			}else{
				pd.put("USER_ID", user.getUSER_ID());
			}
			if(UserUtil.CurrUserIsAdmin()){
				mv.addObject("admin","1");
				pd.put("COMPANY", user.getCOMPANY());
			}else{
				pd.put("USERNAMER", user.getUSERNAME());
				mv.addObject("admin","0");
				pd.put("ORG_ID", user.getOrg().getOrgId());
				pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
				
			}
			List<PageData> listInfo = new ArrayList<PageData>();
			page.setPd(pd);
			//查询信息
			listInfo = entObjectService.listObjTransCorrect(page);
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/EntObjectRemark/EntObjectionCorrect");
		return mv;
	}
	//4.查询企业异议事项更正结果接受情况  
	@RequestMapping(value="/listObjTransRecCor")
	public ModelAndView listObjTransRecCor(Page page){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		List<PageData> listInfo = new ArrayList<PageData>();
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USER_ID", null);
		}else{
			pd.put("USER_ID", user.getUSER_ID());
		}
		if(UserUtil.CurrUserIsAdmin()){
			pd.put("COMPANY", user.getCOMPANY());
			mv.addObject("admin","1");
		}else{
			mv.addObject("admin","0");
			pd.put("USERNAMER", user.getUSERNAME());
			pd.put("ORG_ID", user.getOrg().getOrgId());
			pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
		}
		page.setPd(pd);
		try{
			//查询信息
			listInfo = entObjectService.listObjTransRecCor(page);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/EntObjectRemark/EntObjectionCorrectAccept");
		mv.addObject("pd", pd);
		mv.addObject("listInfo", listInfo);
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
				String requestXml = ObjXmlParseUtil.dealWithReportResultRec(pd);
				//人行返回报文
				String reponseXml = ObjXmlParseUtil.responseXmlResultRec(requestXml);
				//数据落库
				PageData pdXmlMain =new PageData();
				pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,pd.getString("ID"));
				pdXmlMain.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				pdXmlMain.put("OBJCHECKID", pd.getString("OBJCHECKID"));
				PageData ObjectPd = entObjectService.selectObjectCorrectID(pdXmlMain);
				if("0".equals(String.valueOf(ObjectPd.get("COUNTOBJECTID")))){
					entObjectService.saveResultToObjectionCorrectAccept(pdXmlMain);//保存
				}else{
					entObjectService.updateResultToObjectionCorrectAccept(pdXmlMain);//修改
				}
			    logger.debug("更正结果接受情况查询成功！");
				map.put("msg", "查询成功！");
		} catch (Exception e) {
			logger.error("personObjection.toCheckResultReport方法出错！",e);
		}
		return map;
	}
	/**
	 * 添加企业异议标注
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listObjAddRemark")
	public ModelAndView listObjAddRemark(Page page){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		List<PageData> listInfo = null;
		try{
			if(UserUtil.CurrUserIsAdmin()){
				//法人
				pd.put("COMPANY", user.getCOMPANY());
				mv.addObject("admin","1");
			}else{
				pd.put("USERNAMER", user.getUSERNAME());
				mv.addObject("admin","0");
			}
			String username = user.getUSERNAME();
			if(username.startsWith("admin")){
				pd.put("USER_ID", null);
			}else{
				pd.put("USER_ID", user.getUSER_ID());
			}
			if(UserUtil.CurrUserIsAdmin()){
				mv.addObject("admin","1");
			}else{
				mv.addObject("admin","0");
				pd.put("ORG_ID", user.getOrg().getOrgId());
				pd.put("ORG_NAME", user.getOrg().getName()); //机构名称
			}
				listInfo = new ArrayList<PageData>();
				page.setPd(pd);
				//查询信息
				listInfo = entObjectService.listObjAddRemark(page);
				List<Map<String, String>> listMap = CacheController.getListMap("EntinfoCategroy");
				Map<String,String> dicMap = ObjectUtil.listToMap2(listMap, "key", "value");
				for(PageData pdChange : listInfo){
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
				mv.addObject("pd", pd);
				mv.addObject("listInfo", listInfo);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/EntObjectRemark/EntObjectionAddPersonLabel");
		mv.addObject("varList", listInfo);
		if(listInfo.size()==0){
			pd.put("listSizeIsNull", "1");
		}
		mv.addObject("pd", pd);
		return mv;
	}
	/**企业标注添加页面
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
			List<Map<String, String>> listMap = CacheController.getListMap("EntinfoCategroy");
			mv.addObject("dict", listMap);
			if(pd != null && pd.containsKey("ID") && pd.getString("ID") != null){
				pd = entObjectService.findAddRemarkBy(pd);
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
			logger.error("EntObjectRemark.goAddPersonLabel方法出错！",e);
		}
		mv.setViewName("credit/EntObjectRemark/EntObjectionAddPersonLabel_report");
		mv.addObject("pd", pd);
		return mv;
	} 
	/**企业标注保存方法
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
			pd.put("CLIENT_TYPE", "2");
			pd.put("ORG_ID", username.startsWith("admin") ? "" : user.getOrg().getOrgId());
			/*----根据获取的参数数据向企业异议信息表中添加数据-------*/
			try {
				entObjectService.saveToObjectionInfoSix(pd);
			} catch (Exception e) {
				logger.error(e.getMessage(),e);
			}
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			entObjectService.saveToFs(pd);
			String btn_type = pd.getString("BTN_TYPE");
			if(!"2".equals(btn_type)){
				//上报
				logger.debug("添加个人标注保存成功,开始调用人行结果上报");
				PageData requestPerPd = getRequestPerPd();
				pd.putAll(requestPerPd);
				//生成报文
				String requestXml = ObjXmlParseUtil.dealWithReportAddAnnotation(pd);
				//人行返回报文
				String reponseXml = ObjXmlParseUtil.responseXmlAddAnnotation(requestXml);
				//数据落库
				PageData pdXmlMain =new PageData();
				pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,id);
				pdXmlMain.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				PageData pd_tmp = PersonObjectionService.find_AddRemarkBy(pdXmlMain);
				if(pd_tmp==null){
					entObjectService.saveResultToAddLabel(pdXmlMain);
				}else{
					entObjectService.updateResultToAddLabel(pdXmlMain);
				}
				logger.debug("更正结果上报人行成功！");
			}
		} catch (Exception e) {
			logger.error("personObjection.addPersonLabel方法出错！",e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	} 
	/**修改企业标注信息
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
			entObjectService.updatePersonLabel(pd);
			String btn_type = pd.getString("BTN_TYPE");
			if(!"2".equals(btn_type)){
				//上报
				logger.debug("添加个人标注保存成功,开始调用人行结果上报");
				PageData requestPerPd = getRequestPerPd();
				pd.putAll(requestPerPd);
				pd.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				//生成报文
				pd.put("DATA_OCCUR_ORG_CODE", pd.getString("DATA_PROVIDER_ORG_CODE"));
				String requestXml = ObjXmlParseUtil.dealWithReportAddAnnotation(pd);
				//人行返回报文
				String reponseXml = ObjXmlParseUtil.responseXmlAddAnnotation(requestXml);
				//数据落库
				PageData pdXmlMain =new PageData();
				pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,pd.getString("ID"));
				pdXmlMain.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
				PageData pd_tmp = PersonObjectionService.find_AddRemarkBy(pdXmlMain);
				if(pd_tmp==null){
					entObjectService.saveResultToAddLabel(pdXmlMain);
				}else{
					entObjectService.updateResultToAddLabel(pdXmlMain);
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
	/**
	 * 7.删除企业标注
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/listObjDelete")
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
			varList = entObjectService.listDeletePersonLabellistPage(page);
			List<Map<String, String>> listMap = CacheController.getListMap("EntinfoCategroy");
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
		mv.setViewName("credit/EntObjectRemark/EntObjectionDeletePersonLabel");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	/**删除企业标注
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteEntLabel")
	@ResponseBody
	public Object deletePersonLabel(){
		Map<String,String> map = new HashMap<String,String>();
		map.put("msg", "删除失败！");
		try {
			PageData pd = this.getPageData();
			PageData requestPerPd = getRequestPerPd();
			pd.putAll(requestPerPd);
			//生成报文
			String requestXml = ObjXmlParseUtil.dealWithReportDeleAnnotation(pd);
			//人行返回报文
			String reponseXml = ObjXmlParseUtil.responseXmlDeleAnnotation(requestXml);
			//数据落库
			PageData pdXmlMain =new PageData();
			pdXmlMain = ObjXmlParseUtilPerson.parseXmlSimple(reponseXml,pd.getString("ID"));
			entObjectService.deleteEntLabel(pdXmlMain);
			map.put("msg", "删除成功！");
		} catch (Exception e) {
			logger.error("personObjection.deletePersonLabel方法出错！",e);
		}
		return map;
	}
	/**
	 * 上传附件
	 * @return
	 * @throws IOException 
	 */
	@SuppressWarnings("static-access")
	public void correctUploadEnclosure(MultipartFile file,String flow_id) throws Exception{
		
		String fileName = file.getOriginalFilename();//文件名
		if(StringUtil.isEmpty(fileName)) throw new Exception("系统异常，报错方法为correctUploadEnclosure");
		PageData serverInfo = BaseController.getServerInfo();
		serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));//密码解密
		String fileName_dest = fileName.substring(0,fileName.indexOf("."));
		String file_Path = PathUtil.getClasspath()+Const.FILEPATHFILE+flow_id +"/"+file.getOriginalFilename();//本地文件夹
		String file_Path_zip = PathUtil.getClasspath()+Const.FILEPATHFILE+flow_id +"/zip/"+flow_id+".zip";//压缩地址
		try {	
			File f =  new File(file_Path);
			if(!f.exists()){
				new File(PathUtil.getClasspath()+Const.FILEPATHFILE+flow_id +"/").mkdir();
				f.createNewFile();
			}
			file.transferTo(f);
		CompressUtils.zip(file_Path,file_Path_zip, true, file.getOriginalFilename().substring(0, 6));			
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
			logger.error(e.getMessage(),e);
		}finally {
			delFile(file_Path_zip);
			delFile(file_Path);
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
		        CompressUtils.unZip(localPath+"/"+id+".zip", localPath+"/"+id, att_name.substring(0, 6));
		    }
		    FileDownload.fileDownload(response,PathUtil.getClasspath()+Const.FILEPATHIMG+id+"/"+id+"/"+att_name, att_name);
		    String pathStr = PathUtil.getClasspath() + Const.FILEPATHIMG + id;//删除服务器地址
		    File delFile = new File(pathStr);
		    delFileDir(delFile);
		} catch (Exception e) {
			logger.error("URL=entObjectRemark.downloadAtt()方法出错",e);
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
			pd.put("ID", pd.getString("ID"));
			entObjectService.delAtt(pd);
			map.put("msg", "success");
		} catch (Exception e) {
			logger.info(e.getMessage());
			map.put("msg", "error");
		}
		return map;
	}
	/**
	 * 获取个人拼接请求报文所需要的基础信息
	 * @return
	 */
	private PageData getRequestPerPd(){
		PageData pd = new PageData();
		try {
			 pd = PersonObjectionService.findComBankInfo();
		} catch (Exception e) {
			logger.error("异议处理定时任务出错",e);
			logger.error(e.getMessage(),e);
		}
		return pd;
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
	 * 删除目录
	 */
	public static void delFileDir(File dir){
		try {
			if(!dir.exists())
				throw new NullPointerException("the dir is null");
			if(dir.isFile()||dir.list()==null){
				dir.delete();
				logger.info("删除了"+dir.getName());
			}else{
				File[] files = dir.listFiles();
				for(File a : files){
					delFileDir(a);
				}
				dir.delete();
				logger.info("删除了"+dir.getName());
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
}
