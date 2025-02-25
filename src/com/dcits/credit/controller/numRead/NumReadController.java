package com.dcits.credit.controller.numRead;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.HeaderParam;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.http.entity.ContentType;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.shiro.session.Session;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.QuerySet.numberReadParamManager;
import com.dcits.credit.service.numRead.NumReadService;
import com.dcits.credit.util.ImportExportData;
import com.dcits.credit.util.MySAXHandler;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ReadExcel;
import com.dcits.credit.util.ThreadNumRead;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.FileUpload;
import com.dcits.platform.util.FileZip;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.icfcc.batch.ui.PreConditionCheck;

/**
 * 数字解读controller
 * 
 * @author wangwenming
 *
 */
@Controller
@RequestMapping(value = "/createReport")
public class NumReadController extends BaseController {

	@Resource(name = "numReadService")
	private NumReadService numReadService;
	@Resource(name="numberReadParamService")
	private numberReadParamManager service;
	private RoleAuthFactory roleAtuhFactory;

	/**
	 * 报文生成列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getReoprtList")
	public ModelAndView getReportList(Page page) {
		ModelAndView mv = getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 权限
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID + Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		pd.put("USERCODE", userInfo.getUSERNAME());
		pd.put("menuId", menuId);
		page.setPd(pd);
		List<PageData> reports = new ArrayList<PageData>();
		try {
			reports = numReadService.getReportList(page);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/numRead/createReport_list");
		mv.addObject("reports", reports);
		mv.addObject("pd", pd);
		mv.addObject("QX", roleAtuhFactory.getHC(roleIds, menuId));
		return mv;
	}

	/**
	 * 弹出新增窗口
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAddR")
	public ModelAndView goAddU() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("REQUEST_NO", findReportMaxId() + 1);
		mv.setViewName("credit/numRead/createReport_edit");
		mv.addObject("msg", "saveR");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 报文最大id
	 * 
	 * @return
	 */
	public int findReportMaxId() {
		try {
			return numReadService.findReportMaxId();
		} catch (Exception e) {
			return 999;
		}
	}

	/**
	 * 新增
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveR")
	public ModelAndView saveU() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String COMPANY = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", COMPANY);
		try {
			numReadService.saveReport(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("save_result");
		mv.addObject("pd", pd);
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
		mv.setViewName("credit/numRead/impReportExcel");
		// mv.setViewName("system/user/uploadexcel");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 弹出修改窗口
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEditR")
	public ModelAndView goEditU() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = getPageData();
		try {
			pd = numReadService.findReportById(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/numRead/createReport_edit");
		mv.addObject("msg", "updateR");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 修改
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateR")
	public ModelAndView updateU() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String COMPANY = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", COMPANY);
		try {
			numReadService.updateReport(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("save_result");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteR")
	public ModelAndView deleteR() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			numReadService.deleteReport(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("save_result");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 批量删除
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, Jurisdiction.getUsername() + "批量删除numRead");
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			try {
				if(pd.get("PRODUCE_DATE")!=null&&!"".equals(String.valueOf(pd.get("PRODUCE_DATE")))&&"id".equals(ArrayDATA_IDS[0])){
					//删除按时间筛选的数据
					numReadService.deleteAllData(pd);
				}else if("id".equals(ArrayDATA_IDS[0])){
					pd.put("PRODUCE_DATE", null);
					numReadService.deleteAllData(pd);
					//删除所有数据
				}else{
					//删除选中数据
					numReadService.deleteAll(ArrayDATA_IDS);
				}
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 数字解读查询列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
/*	@RequestMapping(value = "/numReadQueryList")
	public ModelAndView numReadQueryList(Page page) {
		ModelAndView mv = getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID + Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		pd.put("USERCODE", userInfo.getUSERNAME());
		page.setPd(pd);
		List<PageData> queryResult = new ArrayList<PageData>();
		try {
			queryResult = numReadService.numReadQueryList(page);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/numRead/numReadQuery_list");
		mv.addObject("queryResult", queryResult);
		mv.addObject("pd", pd);
		mv.addObject("QX", roleAtuhFactory.getHC(roleIds, menuId));
		return mv;
	}*/
	@RequestMapping(value = "/numReadQueryList")
	public ModelAndView numReadQueryList(Page page) {
		ModelAndView mv = getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID + Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		pd.put("USERCODE", userInfo.getUSERNAME());
		page.setPd(pd);
		List<PageData> queryResult = new ArrayList<PageData>();
		try {
			queryResult = numReadService.numReadQueryList(page);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/numRead/numReadQuery_list");
		mv.addObject("queryResult", queryResult);
		mv.addObject("pd", pd);
		mv.addObject("QX", roleAtuhFactory.getHC(roleIds, menuId));
		return mv;
	}

	/**
	 * 反馈解读查询列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/resultReadQueryList")
	public ModelAndView resultReadQueryList(Page page) {
		ModelAndView mv = getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID + Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		page.setPd(pd);
		List<PageData> queryResult = new ArrayList<PageData>();
		try {
			queryResult = numReadService.resultReadQueryList(page);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/numRead/resultReadQuery_list");
		mv.addObject("queryResult", queryResult);
		mv.addObject("pd", pd);
		mv.addObject("QX", roleAtuhFactory.getHC(roleIds, menuId));
		return mv;
	}

	/**
	 * 下载模版
	 * 
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/downExcel")
	public void downExcel(HttpServletResponse response) throws Exception {
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "numRead.xls", "数字解读模板.xls");
	}

	/**
	 * 验证身份证号码
	 * 
	 * @param mobiles
	 * @return
	 */
	public static boolean checkMobileNumber(String certno) {
		boolean flag = false;
		String regEx = "(^(\\d{6}(([1-9]\\d{3}((01|0[3-9])|(1[0-2]))((0[1-9])|([12]\\d)|(3[0-1])))|([1-9]\\d{3}02((0[1-9])|([12]\\d))))\\d{3}[0-9Xx])$)|(^(\\d{6}\\d{2}(((01|0[3-9]|1[0-2])((0[1-9])|([12]\\d)|(3[0-1])))|(02)(0[1-9]|[12]\\d))\\d{3})$)";
		Pattern pattern = Pattern.compile(regEx);
		Matcher matcher = pattern.matcher(certno);
		flag = matcher.matches();
		return flag;
	}

	// =============================错误数据前面的都入库了，后面的不入库==================================================
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
						Map<String,String> result = ReadExcel.InsertExcelContent(rs, startRow, dataRow, numReadService, REQUEST_NO, company);
						errCertno += result.get("errorCode");
					}else{
						int endRow = 1000;
						for(int i=0;i<num;i++){
							Map<String,String> result = ReadExcel.InsertExcelContent(rs, startRow, endRow, numReadService, REQUEST_NO, company);
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
				//wb = new XSSFWorkbook(file.getInputStream());
				CommonsMultipartFile cf = (CommonsMultipartFile) file;
				DiskFileItem fi = (DiskFileItem) cf.getFileItem();
				File ff = fi.getStoreLocation();
				List<String> listError = new ImportExportData(ff,numReadService,REQUEST_NO,company).getData();
				for(int i=0;i<listError.size();i++){  //不满足的身份证号
					errCertno += listError.get(i);
				}
				String path = ff.getAbsolutePath()+File.separator+ff.getName();
				//删除临时文件
				ReadExcel.deleteFile(path);
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
		map.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 报文生成
	 * 
	 * @return
	 */
	@RequestMapping(value = "/createReport")
	@ResponseBody
	public Object createReport() {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = this.getPageData();
		String[] ids = pd.getString("DATA_IDS").split(",");
		String extName = ".txt";
		String filename1 = getFilename();
		String filename = filename1 + extName;
		logger.debug("filename=========="+filename);
		String msg = "success";
		try{
			//文件路径
			String path = PathUtil.getClasspath() + Const.NUMREAD;
			logger.debug("path=========="+path);
			//查询需要生成报文的总记录数
			PageData Sum = new PageData();
			if(pd.get("PRODUCE_DATE")!=null&&!"".equals(String.valueOf(pd.get("PRODUCE_DATE")))&&"id".equals(ids[0])){
				Sum = numReadService.findReportSumByDate(pd);
			}else{
				Sum = numReadService.findReportSumByIds(ids);
			}
			int currentNo = 0;
			int totalNum = Integer.parseInt(String.valueOf(Sum.get("SUM")));
			boolean flag = WriterFileHead(path+filename,totalNum);
			if(flag){
				pd.put("currentNo", null);
				int num = totalNum/1000+1;
				for(int i=0;i<num;i++){
					List<PageData> list = new ArrayList<PageData>();
					if(flag){
						//写入报文体
						if(pd.get("PRODUCE_DATE")!=null&&!"".equals(String.valueOf(pd.get("PRODUCE_DATE")))&&"id".equals(ids[0])){
							pd.put("flag", "0");
							list = numReadService.findReportByDate(pd);  //按日期
						}else if("id".equals(ids[0])){
							pd.put("flag", "1");
							list = numReadService.findReportByDate(pd);  //全部
						}else{
							list = numReadService.findReportByIds(ids);  //已勾选的
						}
						if(list.size()>0){
							currentNo = Integer.parseInt(String.valueOf(list.get(list.size()-1).get("REQUEST_NO")));
							pd.put("currentNo", currentNo);
							//写入文件
							flag = WriterFileContent(list,path+filename);
							//向表中插入数据并更改表状态(线程)
							if(flag){
								ThreadNumRead thread = new ThreadNumRead(list,filename1 + ".enc",numReadService,pd,"0");
								thread.run();
							}
						}
					}else{
						msg = "error";
					}
				}
				//写入文件尾
				flag = WriterFileEnd(path+filename);
			}else{
				msg = "error";
			}
			if(flag){
				//读取配置文件
				PageData pdp = getServerInfo();
				pdp.put("filename", filename1 + ".enc");
				pdp.put("InputStreamPath", path + filename1 + ".enc");
				//压缩加密文件		20200305启用在配置文件中配置的方式，直接将相应文件放置在类路径下 numRead/文件夹下
//				String homedir = pdp.getString("homedir");
				String homedir = PathUtil.getClasspath()+"numRead"+File.separator;
				logger.debug("homedir=========="+homedir);
				PreConditionCheck prc = new PreConditionCheck(homedir);
				// 压缩
				if (prc.compressFile(path + filename, path + filename1 + ".tmp")) {
					logger.debug("压缩成功");
				} else {
					logger.debug("压缩失败");
					msg = "error";
				}
				// 加密
				if (prc.cryptMsg(path + filename1 + ".tmp", path + filename1 + ".enc")) {
					logger.debug("加密成功");
				} else {
					msg = "error";
				}
				//上传并删除本地文件
				//ThreadNumRead thread = new ThreadNumRead(null,path + filename1,null,pdp,"1");
				//thread.run();
				
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			msg = "error";
		}
		/*try {
			PageData pdp = getServerInfo();
			// String path =
			// pdp.getString("NR_localPath")+File.separatorChar+filename;
			String path = PathUtil.getClasspath() + Const.NUMREAD;
			pdp.put("filename", filename);
			pdp.put("InputStreamPath", path);
			if(pd.get("PRODUCE_DATE")!=null&&!"".equals(String.valueOf(pd.get("PRODUCE_DATE")))&&"id".equals(ids[0])){
				list = numReadService.findReportByDate(pd);
			}else{
				list = numReadService.findReportByIds(ids);
			}
			
			String xml = getReportBody(list);
			File txt = new File(path + filename);
			if (!txt.exists()) {
				txt.createNewFile();
			}
			// 报文生成到本地
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(txt),"UTF-8"));
			writer.write(xml);
			writer.close();
			FileOutputStream fos = new FileOutputStream(txt);
			fos.write(xml.getBytes());
			fos.close();
			// add by liyanay 20170925
			String homedir = pdp.getString("homedir");
			PreConditionCheck prc = new PreConditionCheck(homedir);
			// 压缩
			if (prc.compressFile(path + filename, path + filename1 + ".tmp")) {
				System.out.println("压缩成功");
			} else {
				System.out.println("压缩失败");
			}
			// 加密
			if (prc.cryptMsg(path + filename1 + ".tmp", path + filename1 + ".enc")) {
				System.out.println("加密成功");
			} else {
				System.out.println("加密失败");
			}
			filename = getFilename() + ".enc";
			// 记录生成报文的信息（报文名称，每个报文的请求编号）
			String sql = "insert into CIFM_NUMREADR_BATCH(BATCH_NAME,REQUEST_NO,COMPANY)";
			String str = "";
			for (PageData pdd : list) {
				str += " select '"+filename+"','"+String.valueOf(pdd.get("REQUEST_NO"))+"','"+pdd.getString("COMPANY")+"' FROM DUAL UNION ALL";
				//pdd.put("BATCH_NAME", filename);
			}
			sql = sql+str.substring(0, str.length()-9);
			Map<String,String> mapp = new HashMap<String,String>();
			mapp.put("creatSql", sql);
			//入库
			numReadService.saveInfo(mapp);
			//numReadService.saveCreateReportRecord(list);
			
			pdp.put("filename", filename);
			pdp.put("InputStreamPath", path + filename1 + ".enc");
			// 将生成的文件上传到FTP服务器上
			uploadFTP(pdp);
			map.put("msg", "success");
			//更新状态
			try{
				String[] listId = new String[list.size()];
				for(int i=0;i<list.size();i++){
					listId[i]=String.valueOf(list.get(i).get("REQUEST_NO"));
				}
				numReadService.updateStatus(listId);
			}catch(Exception e){
				logger.info(e.getMessage(),e);
			}
			// 删除本地文件
			txt.delete();
			File file = new File(path + filename1 + ".tmp");
			file.delete();
			File fileEnc = new File(path + filename1 + ".enc");
			fileEnc.delete();
		} catch (Exception e) {
			logger.info(e.getMessage(),e);
			map.put("msg", "error");
		}*/
		map.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 将本地文件上传到FTP服务器
	 * 
	 * @param pd
	 * @throws IOException
	 */
	public void uploadFTP(PageData pd) {
		String url = pd.getString("IP"); // FTP服务器hostname
		int port = Integer.parseInt(pd.getString("port")); // FTP服务器端口
		String username = pd.getString("LoginName"); // FTP登录账号
		String password = PasswordOper.decode(pd.getString("LoginPass")); // FTP登录密码
		String path = pd.getString("NR_ftpPath"); // FTP服务器保存目录
		String filename = pd.getString("filename"); // 上传到FTP服务器上的文件名
		String isPath = pd.getString("InputStreamPath");
		File file = new File(isPath);
		InputStream input;
		try {
			input = new FileInputStream(file);
			FileTool.uploadFile(url, port, username, password, path, filename, input);
		} catch (FileNotFoundException e) {
			logger.info(e.getMessage());
		}
	}

	/**
	 * 生成报文的文件名
	 */
	public String getFilename() {
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String name = null;
		String topOrgCode = null;
		String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String serials = null;
		String company = userInfo.getCOMPANY();
		logger.debug(company);
		try {
			// 登录用户的顶级机构在人行信用机构编码
			topOrgCode = numReadService.findTopOrgIdInPerBank(company);
			if (topOrgCode == null || topOrgCode.equals(null) || topOrgCode.equals("")) {
				topOrgCode = "D10052410H0001";
			}
			// 流水号（最大流水+1）
			serials = numReadService.findMaxSerialNum(date);
		} catch (Exception e) {
			logger.info(e.getMessage());
			topOrgCode = "D10052410H0001";
			serials = "999";
		}
		// change by liyan 20170925
		name = topOrgCode + date + "F" + serials + "0";
		return name;
	}

	/**
	 * 弹出解析报文页面
	 * 
	 * @return
	 */
	/*
	 * @RequestMapping(value="/goParseReport") public ModelAndView
	 * goParseReport(){ ModelAndView mv = this.getModelAndView(); User userInfo
	 * = (User)Jurisdiction.getSession().getAttribute("sessionUser"); PageData
	 * pd = this.getPageData(); mv.setViewName("credit/numRead/parseReport");
	 * mv.addObject("frOrg",userInfo.getOrg().getName()); mv.addObject("pd",pd);
	 * return mv; }
	 */
	/**
	 * 反馈报文上传
	 * 
	 * @return
	 */
	@RequestMapping(value = "/reportUpload")
	public ModelAndView reportUpload() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		// 添加权限
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID + Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		mv.setViewName("credit/numRead/reportUpload");
		try {
			mv.addObject("frOrg", user.getOrg().getName());
		} catch (Exception e) {
			logger.info(e.getMessage());
			mv.addObject("frOrg", null);
		}
		mv.addObject("pd", pd);
		mv.addObject("QX", roleAtuhFactory.getHC(roleIds, menuId));
		return mv;
	}

	/**
	 * 解析报文存进数据库
	 * 
	 * @return
	 */
	@RequestMapping(value = "/parseReport")
	@ResponseBody
	public Object parseReport(@RequestParam(value = "enc", required = false) MultipartFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		map.put("msg", "nofile");
		if (null != file && !file.isEmpty()) {
			String filename = file.getOriginalFilename();
			StringBuffer sb = new StringBuffer();
			String fileContent = new String();
			String line = null;
			String fileNameWithoutHZ = filename.substring(0,filename.lastIndexOf("."));
			try {
				//20200306新增逻辑：上传文件为.enc结尾的文件时进行解密解压
				if("enc".equals(filename.substring(filename.length()-3, filename.length()))){
					//存储在应用服务器临时文件夹中
					String filePath = PathUtil.getClasspath()+Const.NUMREAD;
					FileUpload.fileUp(file, filePath, fileNameWithoutHZ);
					String homedir = PathUtil.getClasspath()+"numRead"+File.separator;
					PreConditionCheck prc = new PreConditionCheck(homedir);
					// 解密
					if (prc.decryptMsg(filePath+fileNameWithoutHZ+".enc", filePath+fileNameWithoutHZ+".dec")) {
						System.out.println("解压缩成功");
						// 解压
						if (prc.deCompressFile(filePath+fileNameWithoutHZ+".dec", filePath+fileNameWithoutHZ+".txt")) {
							System.out.println("解密成功");
							
							//替换后续需要的参数值 filename，file
							//获取解密、解压后的txt文件，并且将其File类型转为 MultipartFile类型
							File newfile = new File(filePath+fileNameWithoutHZ+".txt");
							FileInputStream fileInputStream = new FileInputStream(newfile);
							file = new MockMultipartFile(newfile.getName(), newfile.getName(), ContentType.APPLICATION_OCTET_STREAM.toString(), fileInputStream);
							filename = file.getOriginalFilename();
							
						} else {
							System.out.println("解密失败");
							map.put("msg", "error_jm");
							return AppUtil.returnObject(new PageData(), map);
						}
					} else {
						System.out.println("解压缩失败");
						map.put("msg", "error_jy");
						return AppUtil.returnObject(new PageData(), map);
					}
				}
				int position = filename.lastIndexOf(".") - 1;
				String sucOrErr = filename.substring(position, position + 1);
				// 返回成功的报文
				if ("r".equals(sucOrErr)) {
					 // step 1: 获得SAX解析器工厂实例
			        SAXParserFactory factory = SAXParserFactory.newInstance();
			        // step 2: 获得SAX解析器实例
					try {
						SAXParser parser = factory.newSAXParser();
				        // step 3: 开始进行解析
				        // 传入待解析的文档的处理器
				        parser.parse(file.getInputStream(), new MySAXHandler(company,filename,numReadService));
					} catch (Exception e) {
						logger.info(e.getMessage());
						map.put("msg", "error");
					} 
					//parseSuccessReturn(fileContent, filename.substring(0, position + 1));
				}
				// 返回失败的报文
				if ("e".equals(sucOrErr)) {
					InputStream is = file.getInputStream();
					BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
					while ((line = br.readLine()) != null) {
						sb.append(line + "\r\n");
					}
					fileContent = sb.toString();
					br.close();
					parseErrorReturn(fileContent, filename.substring(0, position + 1));
				}
				map.put("msg", "success");
			} catch (Exception e) {
				logger.info(e.getMessage());
				map.put("msg", "error");
			}
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 报文下载
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/goreportDownload")
	public ModelAndView goreportDownload(Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID + Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if (pd.getString("REPORTDATE") != null) {
			pd.put("REPORTDATE", pd.getString("REPORTDATE").replace("-", ""));
		}
		page.setPd(pd);
		// 数据库获取的列表
		List<PageData> listOra = new ArrayList<PageData>();
		String orgName = null;
		try {
			PageData pdh = getServerInfo();
			listOra = numReadService.getReportRecordList(page);
			for (PageData p : listOra) {
				String filename = p.getString("BATCH_NAME");
				String filedate = filename.substring(14, 18) + "-" + filename.substring(18, 20) + "-"
						+ filename.substring(20, 22);
				p.put("REPORTDATE", filedate);
			}
			orgName = userInfo.getOrg().getName();
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/numRead/reportDownload");
		mv.addObject("frOrg", orgName);
		mv.addObject("pd", pd);
		mv.addObject("ftpList", listOra);
		mv.addObject("QX", roleAtuhFactory.getHC(roleIds, menuId));
		return mv;
	}

	/**
	 * 报文下载\报文批量下载
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reportDownload")
	@ResponseBody
	public Object reportDownload(HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData p = this.getPageData();
		String[] filename = p.getString("BATCH_NAME").split(",");
		try {
			PageData pd = getServerInfo();
			String ip = pd.getString("IP"); // FTP服务器hostname
			int port = Integer.parseInt(pd.getString("port")); // FTP服务器端口
			String username = pd.getString("LoginName"); // FTP登录账号
			String password = PasswordOper.decode(pd.getString("LoginPass")); // FTP登录密码
			String path = pd.getString("NR_ftpPath"); // FTP服务器保存目录
			String savePath = pd.getString("NR_localPath"); // 下载到本地的目录

			List<String> list = new ArrayList<String>();
			for (int i = 0; i < filename.length; i++) {
				list.add(filename[i]);
			}
			FtpUtil.downloadFtpFile(ip, username, password, port, path, savePath, list);
			map.put("msg", "success");
		} catch (Exception e) {
			logger.info(e.getMessage());
			map.put("msg", "error");
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 下載文件
	 * @return
	 */
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> downloadFile() {
		PageData p = this.getPageData();
		String fileName = p.getString("BATCH_NAME");
		byte[] body = numReadService.downloadFile(fileName);
		return numReadService.downloadResponse(body, fileName);
	}

	/**
	 * 报文下载\报文批量下载
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reportDownload1")
	@ResponseBody
	public Object reportDownload1(HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData p = this.getPageData();
		String[] filename = p.getString("BATCH_NAME").split(",");
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
			String path = pd.getString("NR_ftpPath"); // FTP服务器保存目录
 	        String localPath = PathUtil.getClasspath() + Const.NUMREAD;  //文件路径
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
		//将文件下载到本机器
		/*try{
		 if("success".equals(msg)){
	        	String httpUrl = "";
	   			String urls = request.getRequestURL().toString();
	   			String[] str = urls.split("createReport");
	   			if("".equals(str[0])){
	   				String httpIp = request.getRemoteAddr();
	   				int httpPort = request.getRemotePort();
	   				httpUrl = "http://"+httpIp+":"+httpPort+"SmartSense/";
	   			}else{
	   				httpUrl = str[0];
	   			}
	   			String nowPath = String.valueOf(p.get("PATH"));
			 //下载文件
				if (FileZip.zip(PathUtil.getClasspath() + Const.NUMREAD, PathUtil.getClasspath() + Const.NUMREAD+"numRead.zip")) {
					 下载代码 
					FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.NUMREAD+"numRead.zip", "numRead.zip");
				}
				// 删除ftp服务器下载到uploadFiles/numRead/下的文件
				File ff = new File(PathUtil.getClasspath() + Const.NUMREAD+"numRead.zip");
				if (ff.exists()) {
					ff.delete();
				}
	        }
		}catch(Exception e){
			logger.info(e.getMessage());
		}*/
		map.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 下载报文
	 * 
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/reportDownloadnum")
	public void reportDownloadnum(HttpServletResponse response) {
		PageData pd = this.getPageData();
		String[] BATCH_NAME = pd.getString("BATCH_NAME").split(",");
		try {
			for (int i = 0; i < BATCH_NAME.length; i++) {
				String path = PathUtil.getClasspath() + Const.NUMREAD + BATCH_NAME[i];
				FileDownload.fileDownload(response, path, BATCH_NAME[i]);
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
	}

	/**
	 * 报文下载界面单个文件删除/批量删除
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/reportDel")
	@ResponseBody
	public Object reportDel() throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData p = this.getPageData();
		String[] filename = p.getString("BATCH_NAME").split(",");

		PageData pd = getServerInfo();
		/*String url = pd.getString("IP"); // FTP服务器hostname
		int port = Integer.parseInt(pd.getString("port")); // FTP服务器端口
		String username = pd.getString("LoginName"); // FTP登录账号
		String password = PasswordOper.decode(pd.getString("LoginPass")); // FTP登录密码
		String path = pd.getString("NR_ftpPath"); // FTP服务器保存目录
		String savePath = pd.getString("NR_localPath"); // 下载到本地的目录

		FTPClient ftp = new FTPClient();*/
		try {
			/*int reply;
			// 连接服务器
			ftp.connect(url, port);
			// 登录
			ftp.login(username, password);
			// 判断是否成功
			reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
			}
			// 转换目录到path
			ftp.changeWorkingDirectory(path);
			FTPFile[] files = ftp.listFiles();
			// 删除ftp文件
			for (FTPFile file : files) {
				for (int i = 0; i < filename.length; i++) {
					if (file.getName().equals(filename[i])) {
						ftp.deleteFile(file.getName());
						break;
					}
				}
			}*/
			// 删除数据库信息
			for (int i = 0; i < filename.length; i++) {
				numReadService.deleteReportByFN(filename[i]);
			}
			map.put("msg", "success");
		} catch (Exception e) {
			logger.info(e.getMessage());
			map.put("msg", "error");
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 获取FTP服务器上的文件列表
	 * 
	 * @param pd
	 * @return
	 */
	public List<PageData> getFTPlist(PageData pd) {

		String url = pd.getString("IP"); // FTP服务器hostname
		int port = Integer.parseInt(pd.getString("port")); // FTP服务器端口
		String username = pd.getString("LoginName"); // FTP登录账号
		String password = PasswordOper.decode(pd.getString("LoginPass")); // FTP登录密码
		String path = pd.getString("NR_ftpPath"); // FTP服务器保存目录
		String savePath = pd.getString("NR_localPath"); // 下载到本地的目录

		List<PageData> list = new ArrayList<PageData>();

		FTPClient ftp = new FTPClient();
		try {
			int reply;
			// 连接服务器
			ftp.connect(url, port);
			// 登录
			ftp.login(username, password);
			// 判断是否成功
			reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
			}
			// 转换目录到path
			ftp.changeWorkingDirectory(path);
			FTPFile[] files = ftp.listFiles();
			for (FTPFile file : files) {
				PageData pdftp = new PageData();
				String filename = file.getName();
				String filedate = filename.substring(14, 18) + "-" + filename.substring(18, 20) + "-"
						+ filename.substring(20, 22);
				pdftp.put("REPORTNAME", filename);
				pdftp.put("REPORTDATE", filedate);
				list.add(pdftp);
				// System.out.println(filename + "----------" + filedate +
				// "-----------");
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		return list;

	}

	/**
	 * 解析报文发送成功返回的内容,并保存到数据库
	 * 
	 * @param xml
	 */
	public void parseSuccessReturn(String xml, String filename) {
		PageData pd = null;
		String factors = "";
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		try {
			SAXReader sr = new SAXReader();
			Document doc = sr.read(new ByteArrayInputStream(xml.getBytes("UTF-8")));
			// 获取根节点
			Element root = doc.getRootElement();
			// 接收方用户代码
			String responseUserCode = root.element("Head").element("ResponsePart").element("ResponseUserCode")
					.getStringValue();
			// 接收方机构代码
			String ResponseOrgCode = root.element("Head").element("ResponsePart").element("ResponseOrgCode")
					.getStringValue();
			// 获取根节点下的子节点<Msg>
			Element element = root.element("Msg");
			// 获取<Msg>下的多个子节点<BtResultMsg>
			List<Element> elements = element.elements("BtResultMsg");
			for (Element el : elements) {
				pd = new PageData();
				pd.put("USER_CODE", responseUserCode);
				pd.put("ORG_CODE", ResponseOrgCode);
				pd.put("RE_FILE_NAME", filename);
				pd.put("REQUEST_NO", el.element("RequestId").getStringValue());
				// 查询结果信息
				Element elr = el.element("ResultMsg");
				pd.put("RESULT_TYPE", elr.element("ResultType").getStringValue());
				pd.put("SCORE", elr.element("Score").getStringValue());
				List<Element> elfs = elr.element("Factors").elements("Factor");
				for (Element elf : elfs) {
					factors += "".equals(factors) ? elf.getStringValue() : "," + elf.getStringValue();
				}
				pd.put("FACTORS", factors);
				pd.put("POSITION", elr.element("Position").getStringValue());
				pd.put("SCORE_DATE", elr.element("ScoreDate").getStringValue());
				pd.put("COMPANY", company);
				// 保存到数据库
				numReadService.saveNumRead(pd);
				pd = null;
				factors = "";
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
	}

	/**
	 * 解析报文发送失败返回的内容,并保存到数据库
	 * 
	 * @param xml
	 */
	public void parseErrorReturn(String xml, String filename) {
		PageData pd = new PageData();
		Session session = Jurisdiction.getSession();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		try {
			SAXReader sr = new SAXReader();
			Document doc = sr.read(new ByteArrayInputStream(xml.getBytes("UTF-8")));
			// 获取根节点
			Element root = doc.getRootElement();
			// 接收方用户代码
			String responseUserCode = root.element("Head").element("ResponsePart").element("ResponseUserCode")
					.getStringValue();
			// 接收方机构代码
			String ResponseOrgCode = root.element("Head").element("ResponsePart").element("ResponseOrgCode")
					.getStringValue();
			pd.put("USER_CODE", responseUserCode);
			pd.put("ORG_CODE", ResponseOrgCode);
			// 获取根节点下的子节点<Head>下的<Desc>,获取反馈时间和报文总数
			Element element = root.element("Head").element("Desc");
			pd.put("RESPONSE_TIME", element.element("ResponseDate").getStringValue());
			pd.put("TOTAL_NUM", element.element("TotalNum").getStringValue());
			// 获取根节点下的子节点<Msg>,获取错误代码和错误信息
			Element el = root.element("Msg");
			pd.put("ERROR_CODE", el.element("ErrorCode").getStringValue());
			pd.put("ERROR_MSG", el.element("ErrorMsg").getStringValue());
			pd.put("RE_FILE_NAME", filename);
			pd.put("COMPANY", company);
			// 保存到数据库
			numReadService.saveResultRead(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
	}

	/**
	 * 将List<PageData>变为报文格式String
	 * 
	 * @param list
	 * @return
	 */
	public String getReportBody(List<PageData> list) {
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String company = userInfo.getCOMPANY();
		PageData pageData=new PageData();
		pageData.put("COMPANY", company);
		Page page = new Page();
		page.setPd(pageData);
		try {
			pageData = service.paramList(page).get(0);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			logger.info(e2.getMessage(),e2);
		}
		String topOrgId = null;
		String orgId = null;
		try {
			//orgId = userInfo.getOrg().getOrgId();
			topOrgId = numReadService.findTopOrgIdInPerBank(company);
		} catch (Exception e1) {
			logger.info(e1.getMessage(),e1);
			topOrgId = null;
		}
		StringBuffer sb = new StringBuffer();
		String ResponseOrgCode = null;
		String ResponseUserCode = null;
		try {
			ResponseOrgCode = getPropertiesValue("ResponseOrgCode");
			ResponseUserCode = getPropertiesValue("ResponseUserCode");
		} catch (IOException e) {
			logger.info(e.getMessage());
		}
		String dat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
		PageData pd = null;
		// 报文头部信息
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "\r\n");
		sb.append("<Cxf>" + "\r\n");
		sb.append("  <Head>" + "\r\n");
		sb.append("    <!-- 版本号 -->" + "\r\n");
		sb.append("    <Ver>1_0</Ver>" + "\r\n");
		sb.append("    <!-- 发起方 -->" + "\r\n");
		sb.append("    <RequestPart>" + "\r\n");
		sb.append("      <!-- 机构代码 -->" + "\r\n");
		sb.append("      <RequestOrgCode>" + topOrgId + "</RequestOrgCode>" + "\r\n");
		sb.append("      <!-- 用户代码 -->" + "\r\n");
		sb.append("      <RequestUserCode>" + pageData.getString("REQUEST_USER_CODE") + "</RequestUserCode>" + "\r\n");
		sb.append("    </RequestPart>" + "\r\n");
		sb.append("    <!-- 接收方 -->" + "\r\n");
		sb.append("    <ResponsePart>" + "\r\n");
		sb.append("      <!-- 机构代码 -->" + "\r\n");
		sb.append("      <ResponseOrgCode>" + ResponseOrgCode + "</ResponseOrgCode>" + "\r\n");
		sb.append("      <!-- 用户代码 -->" + "\r\n");
		sb.append("      <ResponseUserCode>" + ResponseUserCode + "</ResponseUserCode>" + "\r\n");
		sb.append("    </ResponsePart>" + "\r\n");
		sb.append("    <!-- 报文描述 -->" + "\r\n");
		sb.append("    <Desc>" + "\r\n");
		sb.append("      <!-- 产品类型 -->" + "\r\n");
		sb.append("      <ProductType>1000</ProductType>" + "\r\n");
		sb.append("      <!-- 请求报文时间 -->" + "\r\n");
		sb.append("      <RequestDate>" + dat + "</RequestDate>" + "\r\n");
		sb.append("      <!-- 报文总数 -->" + "\r\n");
		sb.append("      <TotalNum>" + list.size() + "</TotalNum>" + "\r\n");
		sb.append("    </Desc>" + "\r\n");
		sb.append("  </Head>" + "\r\n");
		// 报文体开始（请求查询信息）
		sb.append("  <Msg>" + "\r\n");
		for (int i = 0; i < list.size(); i++) {
			pd = list.get(i);
			sb.append("    <BtRequestMsg>" + "\r\n");
			sb.append("      <!--请求信息编号-->" + "\r\n");
			sb.append("      <RequestId>" + String.valueOf(pd.get("REQUEST_NO")) + "</RequestId>" + "\r\n");
			sb.append("      <!-- 个人信息项标识 -->" + "\r\n");
			sb.append("      <PersonalMark>" + "\r\n");
			sb.append("        <!-- 被查询人姓名 -->" + "\r\n");
			sb.append("        <Name>" + pd.getString("CLIENT_NAME") + "</Name>" + "\r\n");
			sb.append("        <!-- 被查询人证件类型-->" + "\r\n");
			sb.append("        <CertType>" + pd.getString("CREDENTIALS_TYPE") + "</CertType>" + "\r\n");
			sb.append("        <!--  被查询者证件号码-->" + "\r\n");
			sb.append("        <CertNo>" + pd.getString("CREDENTIALS_NO") + "</CertNo>" + "\r\n");
			sb.append("      </PersonalMark>" + "\r\n");
			sb.append("      <Desc>" + "\r\n");
			sb.append("        <!-- 产品时间 -->" + "\r\n");
			sb.append("        <ProductDate>" + pd.get("PRODUCE_DATE") + "</ProductDate>" + "\r\n");
			sb.append("      </Desc>" + "\r\n");
			sb.append("    </BtRequestMsg>" + "\r\n");
		}
		sb.append("  </Msg>" + "\r\n");
		// 报文体结束
		sb.append("  <SafetyMsg>" + "\r\n");
		sb.append("    预留" + "\r\n");
		sb.append("  </SafetyMsg>" + "\r\n");
		sb.append("</Cxf>");
		//logger.info(sb.toString());
		return sb.toString();
	}

	/**
	 * 根据证件类型获取映射值
	 * 
	 * @return
	 */
	public String getRealCerttype(String certtype) {
		try {
			return numReadService.getRealCerttype(certtype);
		} catch (Exception e) {
			logger.info(e.getMessage());
			return "";
		}
	}
	
	/*******************add by zhangyy****************************/
	/**
	 * 将文件头写入文件中
	 * 
	 * @param list
	 * @return
	 */
	public boolean WriterFileHead(String fileName,int totalNum) {
		boolean flag = true;
		StringBuffer sb = new StringBuffer();
		//查询上报用户代码
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String company = userInfo.getCOMPANY();
		PageData pageData=new PageData();
		pageData.put("COMPANY", company);
		Page page = new Page();
		page.setPd(pageData);
		try {
			pageData = service.paramList(page).get(0);
		} catch (Exception e2) {
			logger.info(e2.getMessage(),e2);
		}
		//查询上报机构代码
		String topOrgId = null;
		try {
			topOrgId = numReadService.findTopOrgIdInPerBank(company);
		} catch (Exception e1) {
			logger.info(e1.getMessage(),e1);
			topOrgId = null;
		}
		//接收方用户代码和机构代码
		String ResponseOrgCode = null;
		String ResponseUserCode = null;
		try {
			ResponseOrgCode = getPropertiesValue("ResponseOrgCode");
			ResponseUserCode = getPropertiesValue("ResponseUserCode");
		} catch (IOException e) {
			logger.info(e.getMessage());
		}
		String dat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
		// 报文头部信息
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "\r\n");
		sb.append("<Cxf>" + "\r\n");
		sb.append("  <Head>" + "\r\n");
		sb.append("    <!-- 版本号 -->" + "\r\n");
		sb.append("    <Ver>1_0</Ver>" + "\r\n");
		sb.append("    <!-- 发起方 -->" + "\r\n");
		sb.append("    <RequestPart>" + "\r\n");
		sb.append("      <!-- 机构代码 -->" + "\r\n");
		sb.append("      <RequestOrgCode>" + topOrgId + "</RequestOrgCode>" + "\r\n");
		sb.append("      <!-- 用户代码 -->" + "\r\n");
		sb.append("      <RequestUserCode>" + pageData.getString("REQUEST_USER_CODE") + "</RequestUserCode>" + "\r\n");
		sb.append("    </RequestPart>" + "\r\n");
		sb.append("    <!-- 接收方 -->" + "\r\n");
		sb.append("    <ResponsePart>" + "\r\n");
		sb.append("      <!-- 机构代码 -->" + "\r\n");
		sb.append("      <ResponseOrgCode>" + ResponseOrgCode + "</ResponseOrgCode>" + "\r\n");
		sb.append("      <!-- 用户代码 -->" + "\r\n");
		sb.append("      <ResponseUserCode>" + ResponseUserCode + "</ResponseUserCode>" + "\r\n");
		sb.append("    </ResponsePart>" + "\r\n");
		sb.append("    <!-- 报文描述 -->" + "\r\n");
		sb.append("    <Desc>" + "\r\n");
		sb.append("      <!-- 产品类型 -->" + "\r\n");
		sb.append("      <ProductType>1000</ProductType>" + "\r\n");
		sb.append("      <!-- 请求报文时间 -->" + "\r\n");
		sb.append("      <RequestDate>" + dat + "</RequestDate>" + "\r\n");
		sb.append("      <!-- 报文总数 -->" + "\r\n");
		sb.append("      <TotalNum>" + totalNum + "</TotalNum>" + "\r\n");
		sb.append("    </Desc>" + "\r\n");
		sb.append("  </Head>" + "\r\n");
		// 报文体开始（请求查询信息）
		sb.append("  <Msg>" + "\r\n");
		//写入文件
		File txt = new File(fileName);
		try{
			if (!txt.exists()) {
				txt.createNewFile();
			}
			// 报文生成到本地
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(txt),"UTF-8"));
			writer.write(sb.toString());
			writer.close();
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			flag = false;
		}
		return flag;
	}
	/**
	 * 将文件尾写入文件中
	 * 
	 * @param list
	 * @return
	 */
	public boolean WriterFileEnd(String fileName) {
		boolean flag = true;
		StringBuffer sb = new StringBuffer();
		sb.append("  </Msg>" + "\r\n");
		// 报文体结束
		sb.append("  <SafetyMsg>" + "\r\n");
		sb.append("    预留" + "\r\n");
		sb.append("  </SafetyMsg>" + "\r\n");
		sb.append("</Cxf>");
		//写入文件
		File txt = new File(fileName);
		try{
			if (!txt.exists()) {
				flag = false;
			}else{
				flag = appendMethod(fileName,sb.toString());
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			flag = false;
		}
		return flag;
	}
	/**
	 * 将List<PageData>变为报文格式String
	 * 
	 * @param list
	 * @return
	 */
	public boolean WriterFileContent(List<PageData> list,String fileName) {
		boolean flag = true;
		StringBuffer sb = new StringBuffer();
		PageData pd = new PageData();
		try{
			for (int i = 0; i < list.size(); i++) {
				pd = list.get(i);
				sb.append("    <BtRequestMsg>" + "\r\n");
				sb.append("      <!--请求信息编号-->" + "\r\n");
				sb.append("      <RequestId>" + String.valueOf(pd.get("REQUEST_NO")) + "</RequestId>" + "\r\n");
				sb.append("      <!-- 个人信息项标识 -->" + "\r\n");
				sb.append("      <PersonalMark>" + "\r\n");
				sb.append("        <!-- 被查询人姓名 -->" + "\r\n");
				sb.append("        <Name>" + pd.getString("CLIENT_NAME") + "</Name>" + "\r\n");
				sb.append("        <!-- 被查询人证件类型-->" + "\r\n");
				sb.append("        <CertType>" + pd.getString("CREDENTIALS_TYPE") + "</CertType>" + "\r\n");
				sb.append("        <!--  被查询者证件号码-->" + "\r\n");
				sb.append("        <CertNo>" + pd.getString("CREDENTIALS_NO") + "</CertNo>" + "\r\n");
				sb.append("      </PersonalMark>" + "\r\n");
				sb.append("      <Desc>" + "\r\n");
				sb.append("        <!-- 产品时间 -->" + "\r\n");
				sb.append("        <ProductDate>" + pd.get("PRODUCE_DATE") + "</ProductDate>" + "\r\n");
				sb.append("      </Desc>" + "\r\n");
				sb.append("    </BtRequestMsg>" + "\r\n");
			}
			//写入文件
			File txt = new File(fileName);
			if (!txt.exists()) {
				flag = false;
			}else{
				flag = appendMethod(fileName,sb.toString());
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			flag = false;
		}
		return flag;
	}
	//向文件末尾追加写入
	public boolean appendMethod(String fileName,String content){
		boolean flag = true;
		BufferedWriter writer = null;
		try{
			writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName,true),"UTF-8"));
			writer.write(content);
		}catch(Exception e){
			flag = false;
			logger.error(e.getMessage(), e);
		}finally{
			try {
				writer.close();
			} catch (IOException e) {
				logger.error(e.getMessage(), e);
			}
		}
		return flag;
	}
	
	/**
	 * 数字解读查询模块数据导出
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/exportData")
	@ResponseBody
	public Object exportData(HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = this.getPageData();
		User userInfo = (User) Jurisdiction.getSession().getAttribute("sessionUser");
		String company = userInfo.getCOMPANY();
		pd.put("COMPANY", company);
		String msg = "success";
		try{
			//导出数据
			msg = ReadExcel.exportData(pd,numReadService,response);
			if(msg.endsWith(".xlsx")||msg.endsWith(".zip")){
				map.put("name", msg);
				msg = "success";
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			msg = "error";
		}
		map.put("msg", msg);
		return AppUtil.returnObject(pd, map);
	}
	
	//下载excel
	@RequestMapping(value = "/downLoadData")
	public void downLoadData(HttpServletResponse response) {
		PageData pd = this.getPageData();
		String name = pd.getString("name");
		try {
			String path = PathUtil.getClasspath() + Const.NUMREAD +name;
			//下载
			FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.NUMREAD+name, name);
			// 删除ftp服务器下载到uploadFiles/numRead/下的文件
			File ff = new File(path);
			if (ff.exists()) {
				ff.delete();
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
	}
}
