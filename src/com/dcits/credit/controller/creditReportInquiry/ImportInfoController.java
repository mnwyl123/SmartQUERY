package com.dcits.credit.controller.creditReportInquiry;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.lingala.zip4j.exception.ZipException;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.creditReportInquiry.ImportInfoManager;
import com.dcits.credit.service.creditReportInquiry.PersonReportInqManager;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.ImportExportData;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ReadExcel;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.FileUpload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 重要信息提示下载
 * 创建人：sunyra
 * 创建时间：2019-02-27
 */
@Controller
@RequestMapping(value="/ImportInfoInquiry")
public class ImportInfoController extends BaseController {
	
	String menuUrl = "ImportInfoInquiry/list.do"; //菜单地址(权限用)
	@Resource(name="ImportInfoService")
	private ImportInfoManager importInfoService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
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
		pd.put("CLIENT_TYPE", "1");//个人
		pd.put("USERID", USERID);
		pd.put("ORG_ID", ORG_ID);
		/*if (!"".equals(pd.get("QUERY_TIME")) && pd.get("QUERY_TIME") !=null) {
			//	and B.QUERY_TIME >=to_date( '#{pd.QUERY_TIME} 00:00:00','yyyy/MM/dd hh24:mi:ss') 
			//	and B.QUERY_TIME <=to_date( '#{pd.QUERY_TIME} 23:59:59','yyyy/MM/dd hh24:mi:ss') 
			pd.put("QUERY_TIME", "B.QUERY_TIME >=to_date('#{pd.QUERY_TIME} 00:00:00','yyyy/MM/dd hh24:mi:ss') and B.QUERY_TIME <=to_date('#{pd.QUERY_TIME} 23:59:59','yyyy/MM/dd hh24:mi:ss')");
		}*/
		page.setPd(pd);
		List<PageData>varList=new ArrayList<PageData>();
		try{
			varList = importInfoService.list(page);
			}catch(Exception e){
				logger.error(e.getMessage());
			}	
		mv.setViewName("credit/creditReportInquiry/ImportInfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
	//一代数据字典 字段 转到二代 字段2 中
	@RequestMapping(value="/oneDictToTwo")
	public void oneDictToTwo(Page page){
		try {
			List<PageData> tabColList = new ArrayList<PageData>();
//			tabColList = indAppReService.findAllTabName2();
			String updateSql = null;
			String selectSql = null;
			for(PageData tabCol:tabColList){
				selectSql = "select "+tabCol.getString("COLUMN_NAME")
				    +" from "+tabCol.getString("TABLE_NAME")
				    +" group by "+tabCol.getString("COLUMN_NAME");
				PageData sqlPd = new PageData();
				sqlPd.put("creatSql", selectSql.toString());
				List<PageData> dictDataList = new ArrayList<PageData>();
				dictDataList = indAppReService.selectInfo(sqlPd);
				for(PageData dictData : dictDataList){
					String[] d_nums = tabCol.getString("ID").split(",");
					for(String d_num:d_nums){
						PageData code = new PageData();
						code.put("D_NUM", d_num);
						code.put("NAME", dictData.getString(tabCol.getString("COLUMN_NAME")));
						PageData pd_tmp = new PageData();
						pd_tmp=indAppReService.findCodeByName(code);
						//中文转成CODE更新到字段2上
						if(pd_tmp!=null){
							updateSql="update "+tabCol.getString("TABLE_NAME")+" set "
						               +tabCol.getString("COLUMN_NAME")+"2"
							           +"='"+pd_tmp.getString("CODE")+"'"
							           +" where "+tabCol.getString("COLUMN_NAME")
							           +"='"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'";
							sqlPd.put("updateSql", updateSql);
							indAppReService.updateInfo(sqlPd);
						}else{
							//原本的CODE也更新到字段2上
							updateSql="update "+tabCol.getString("TABLE_NAME")+" set "
						               +tabCol.getString("COLUMN_NAME")+"2"
							           +"='"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'"
							           +" where "+tabCol.getString("COLUMN_NAME")
							           +"='"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'";
							sqlPd.put("updateSql", updateSql);
							indAppReService.updateInfo(sqlPd);	
						}		
					}						
				}	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(),e);
		}			
	}
	
	
	
	/**
	 * 报文下载\报文批量下载
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/download")
	@ResponseBody
	public Object download() {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData p = this.getPageData();
		String[] filename = p.getString("NAME").split(",");
		String msg = "success";
		//需要下载的文件名
		List<String> fileNameList = new ArrayList<String>();
        for(int i=0;i<filename.length;i++){
        	fileNameList.add(filename[i]);
        }
		try {
			//下载到应用所在目录
			PageData pd = getServerInfo();
			String url = pd.getString("IP"); // FTP服务器hostname
			int port = Integer.parseInt(pd.getString("port")); // FTP服务器端口
			String username = pd.getString("LoginName"); // FTP登录账号
			String password = PasswordOper.decode(pd.getString("LoginPass")); // FTP登录密码
			String path = pd.getString("ftpPath")+Const.IMPOR; // FTP服务器保存目录
 	        String localPath = PathUtil.getClasspath() + Const.IMPOR;  //文件路径
 	        try{
 	        	//将服务器上文件下载到本地
 	 	        FtpUtil.downloadFtpFile(url, username,password, port, path, localPath, fileNameList); 
 	        }catch(Exception e){
 	        	logger.error(e.getMessage());
 	        	msg = "error";
 	        }
		} catch (Exception e) {
			logger.info(e.getMessage());
			msg = "error";
		}
		map.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 下载报文
	 * 
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/downloadnum")
	public void reportDownloadnum(HttpServletResponse response) {
		PageData pd = this.getPageData();
		String[] filename = pd.getString("NAME").split(",");
		try {
			for (int i = 0; i < filename.length; i++) {
				String path = PathUtil.getClasspath() + Const.IMPOR + filename[i];
//				String path = "C:/Users/ASD/Desktop/ftp/"+filename[i];
				FileDownload.fileDownload(response, path, filename[i]);
				File file = new File(path);
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
	}

	
	
	
	/**删除
	 * @return
	 * @throws ZipException 
	 * @throws Exception
	 */
	@RequestMapping(value="/delImportInfo")
	public ModelAndView delImportInfo(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			importInfoService.delete(pd);
			importInfoService.deleteMessage(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 弹出导入窗口
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goImportExcel")
	public ModelAndView goImportExcel() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("credit/creditReportInquiry/importExcel");
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * /**从EXCEL导入到数据库
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/readExcel")
	@ResponseBody
	public Object readExcel(@RequestParam(value = "excel", required = false) MultipartFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
	
		String msg = "success";
		try {
			String errCertno = "";
			String filename = file.getOriginalFilename();
			String fileType = filename.substring(filename.lastIndexOf(".")+1,filename.length());
			Workbook wb = null;
			Sheet rs = null;
			int REQUEST_NO = findReportMaxId() + 1;
			if("xls".equals(fileType)){  //excel2003
				wb = new HSSFWorkbook(file.getInputStream());
				//获取页签数
				int sheetNum = wb.getNumberOfSheets();
				for(int t=0;t<sheetNum;t++){
					//获取第一个sheet，目前只支持一个sheet
					rs = wb.getSheetAt(t);
					//数据的行数
					int dataRow = rs.getLastRowNum();
					int num = dataRow/1000+1;
					int startRow = 2; //开始行数
					if(num==1){
						Map<String,String> result = ReadExcel.InsertExcelContent(rs, startRow, dataRow, importInfoService, REQUEST_NO, filename);
						errCertno += result.get("errorCode");
					}else{
						int endRow = 1000;
						for(int i=0;i<num;i++){
							Map<String,String> result = ReadExcel.InsertExcelContent(rs, startRow, endRow, importInfoService, REQUEST_NO, filename);
							REQUEST_NO = Integer.parseInt(result.get("request_no"));
							errCertno += result.get("errorCode");
							startRow = 1000*(i+1)+1;
							endRow = startRow+999;
							if(endRow>dataRow){
								endRow = dataRow;
							}
						}
					}
				}
			}else if("xlsx".equals(fileType)){ //excel2007之后版本
				CommonsMultipartFile cf = (CommonsMultipartFile) file;
				DiskFileItem fi = (DiskFileItem) cf.getFileItem();
				File ff = fi.getStoreLocation();
				List<String> listError = new ImportExportData(ff,importInfoService,REQUEST_NO,filename).getMessageData();
			}else{
				logger.error("读取的不是excel文件");
				msg = "Eerror";
			}
			
			if (!errCertno.equals("")) {
				map.put("errCertno", errCertno);
				msg = "error";
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
			msg = "Eerror";
		}
	     //获得配置文件配置信息
        PageData serverInfo=new PageData();
        try{
 		serverInfo = BaseController.getServerInfo();
        }catch(Exception e){
			logger.error(e.getMessage());
		}
		String path=serverInfo.getString("ftpPath")+file.getOriginalFilename(); 
// 		String path = "C:/Users/ASD/Desktop/ftp/";
 		uploadpic(file,path,file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf(".")),serverInfo);
		map.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 报文最大id
	 * 
	 * @return
	 */
	public int findReportMaxId() {
		try {
			return importInfoService.findReportMaxId();
		} catch (Exception e) {
			return 999;
		}
	}
	//文件上传
    public void uploadpic(MultipartFile file,String path,String finalFileName,PageData serverInfo){
        FileTool filetool=new FileTool();
        if (null != file && !file.isEmpty()) {			
				String ftpPassword =  PasswordOper.decode(serverInfo.getString("LoginPass")); 
				String fileName = file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf("."));
				String extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				String filePath = PathUtil.getClasspath() + Const.IMPOR;	//文件上传路径
//				String filePath = "C:/Users/ASD/Desktop/ftp/";
//				fileName = FileUpload.fileUp(file, filePath, fileName);			//将文件复制到本地（ftp上传）
				fileName = FileUpload.fileUp(file, filePath, finalFileName);	//将文件复制到本地（亿联银行）
			}
	}
    

	/**
	 * 获取信息详情
	 * 
	 * @return
	 */
    @RequestMapping(value = "/getImpCheck")
	public ModelAndView goCheck() {
    	ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		List<PageData>varList=new ArrayList<PageData>();
 		try{
 	 		varList=importInfoService.getMessageInfo(pd);
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
 		mv.setViewName("credit/creditReportInquiry/message_info");
		mv.addObject("varList", varList);
		return mv;
	}

}
