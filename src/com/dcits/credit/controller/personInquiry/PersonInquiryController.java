package com.dcits.credit.controller.personInquiry;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Formatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.WebServiceRunnable_Counter;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.ProductService.ProductManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.rest.PerCreditInterfaceManage;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.PasswordOper;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.FTPClientUtil;
import com.dcits.platform.util.FileUpload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;
import com.dcits.platform.util.UuidUtil;
import com.dcits.platform.util.role.RoleAuthFactory;

/**
 * 个人征信查询申请 创建人：liyanay 创建时间：2017-06-26
 */
@Controller
@RequestMapping(value = "/CreditInquiry")
public class PersonInquiryController extends BaseController {

	String menuUrl = "CreditInquiry/list.do"; // 菜单地址(权限用)
	@Resource(name = "PersonInquiryService")
	private PersonInquiryManager PersonInquiryService;
	@Resource(name = "indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name = "personCrawlerService")
	private PersonCrawlerManager personCrawlerService;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name = "entAppReService")
	private EntAppReManager entAppReService;
	@Resource(name = "productService")
	private ProductManager productService;
	@Resource(name = "dataSubmissionService")
	private IDataSubmissionService iDataSubmissionService;
	@Resource(name = "userService")
	private UserManager userService;
	@Autowired
	private PerCreditInterfaceManage perCreditInterfaceManage;
	@Resource(name = "crawlIndAppReService")
	private CrawlIndAppReManager crawlIndAppReService;
	@Resource(name = "crawlPersonCrawlerService")
	private com.dcits.crawl.service.crawler.PersonCrawlerManager crawlPersonCrawlerService;
	@Resource(name = "crawlDataSubmissionService")
	private com.dcits.crawl.service.dataSubmission.IDataSubmissionService crawlDataSubmissionService;
	@Resource(name = "crawlEntAppReService")
	private CrawlEntAppReManager crawlEntAppReService;
	@Resource(name = "crawlCompanyCrawlerService")
	private CompanyCrawlerManager crawlCompanyCrawlerService;
	ThreadPoolExecutor executor = new ThreadPoolExecutor(1, 1,
			Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
			new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))));

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save(HttpServletRequest request,
			@RequestParam(value = "WARRANT", required = false) MultipartFile file1,
			@RequestParam(value = "LOAN_APPLICATION", required = false) MultipartFile file2,
			@RequestParam(value = "IDENTITY_DOCUMENT", required = false) MultipartFile file3,
			@RequestParam(value = "CREDENTIALS_TYPE", required = false) String CREDENTIALS_TYPE,
			@RequestParam(value = "CREDENTIALS_NO", required = false) String CREDENTIALS_NO,
			@RequestParam(value = "CLIENT_NAME", required = false) String CLIENT_NAME,
			@RequestParam(value = "QUERY_REASON", required = false) String QUERY_REASON,
			@RequestParam(value = "QUERY_VERSION", required = false) String QUERY_VERSION,
			@RequestParam(value = "WARRANT_MATURITY_DATE", required = false) String WARRANT_MATURITY_DATE,
			@RequestParam(value = "QUERY_TYPE", required = false) String QUERY_TYPE,
			@RequestParam(value = "CUST_MANAGER", required = false) String CUST_MANAGER,
			@RequestParam(value = "CHECK_SYS_ID", required = false) String CHECK_SYS_ID,
			@RequestParam(value = "IS_WX_CHECK", required = false) String IS_WX_CHECK,
			@RequestParam(value = "PRO_ID", required = false) String PRO_ID,
			@RequestParam(value = "SHFS", required = false) String SHFS,
			@RequestParam(value = "RLSB", required = false) String RLSB) {
		logBefore(logger, Jurisdiction.getUsername() + "新增CreditInquiry");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
		pd.put("DATA_DATE", date);
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org = (Org) session.getAttribute(USERID + Const.SESSION_ORG);
		String ORG_CODE = org.getOrgCode();
		String ORG_ID = org.getOrgId();
		PageData map = new PageData();
		/*
		 * try{ map = PersonInquiryService.findId(pd); }catch(Exception e){
		 * logger.error(e.getMessage()); } String maxId="";
		 * if(map!=null&&map.get("FIND_ID")!=null&&!map.equals("")){
		 * maxId=(map.getString("FIND_ID")).toString();
		 * maxId="00000000"+maxId.toString();
		 * maxId=maxId.substring(maxId.length()-8,maxId.length()); }else{
		 * maxId="00000001"; } String id=date+ORG_CODE+maxId;
		 */
		String id = UuidUtil.get64UUID();
		// String path="data/"+id;
		String finalFileName1 = "WARRANT";
		String finalFileName2 = "LOAN_APPLICATION";
		String finalFileName3 = "IDENTITY_DOCUMENT";
//		String path = PathUtil.getClasspath() + Const.FILEPATHIMG;
		// 获得配置文件配置信息
		PageData serverInfo = new PageData();
		try {
			String ftpPath=serverInfo.getString("ftpPath");
	 		String path=PathUtil.getClasspath(null).replaceAll("WEB-INF/classes/../../", "") + Const.FILEPATHIMG+id;	//文件上传路径UploadFile
			serverInfo = BaseController.getServerInfo();
			// uploadpic(file1,path,finalFileName1,serverInfo,id);
			// uploadpic(file2,path,finalFileName2,serverInfo,id);
			// uploadpic(file3,path,finalFileName3,serverInfo,id);
			String WARRANT = uploadVideo(file1, path, finalFileName1, serverInfo, id);
			String LOAN_APPLICATION = uploadVideo(file2, path, finalFileName2, serverInfo, id);
			String IDENTITY_DOCUMENT = uploadVideo(file3, path, finalFileName3, serverInfo, id);
			//上传至FTP
			/*FTPClientUtil fTPClientUtil = new FTPClientUtil();
			fTPClientUtil.open();
			fTPClientUtil.changeDir(ftpPath);
	    	fTPClientUtil.put(path, id, ftpPath);
	    	fTPClientUtil.close();*/
	    	
			pd.put("WARRANT", WARRANT);
			// 流水号
			pd.put("ID", id);
			// 类型
			pd.put("TYPE_NO", "01");
			// 地址
			pd.put("ADDRESS_INFO", WARRANT);
			perCreditInterfaceManage.updateByChannel(pd);

			pd.put("LOAN_APPLICATION", LOAN_APPLICATION);
			// 流水号
			pd.put("ID", id);
			// 类型
			pd.put("TYPE_NO", "02");
			// 地址
			pd.put("ADDRESS_INFO", LOAN_APPLICATION);
			perCreditInterfaceManage.updateByChannel(pd);

			pd.put("IDENTITY_DOCUMENT", IDENTITY_DOCUMENT);
			// 流水号
			pd.put("ID", id);
			// 类型
			pd.put("TYPE_NO", "03");
			// 地址
			pd.put("ADDRESS_INFO", IDENTITY_DOCUMENT);
			perCreditInterfaceManage.updateByChannel(pd);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		pd.put("ID", id);
		pd.put("USER_SYS_ID", USERID);// 用户系统ID
		pd.put("ORG_ID", ORG_ID);// 用户机构ID
		String APPLICATION_TIME = new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME", APPLICATION_TIME);// 申请时间
		pd.put("STATUS", "00");// 状态 00待提交
		pd.put("MAC", getMac());// mac地址
		request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {
			ip = request.getRemoteAddr();
		} else {
			ip = request.getHeader("x-forwarded-for");
		}
		pd.put("IP", ip);// ip地址
		if ((file1 == null || file1.isEmpty()) && (file2 == null || file2.isEmpty())
				&& (file3 == null || file3.isEmpty())) {
			pd.put("ANNEX", "2");// 没有附件
		} else {
			pd.put("ANNEX", "1");// 有附件
		}
		String CHECK_USER_ID = CHECK_SYS_ID.substring(0, CHECK_SYS_ID.indexOf("-"));
		String CHECK_USER_NAME = CHECK_SYS_ID.substring(CHECK_USER_ID.length() + 1, CHECK_SYS_ID.length());
		pd.put("CLIENT_TYPE", '1');// 客户类型(1:个人2:企业)
		pd.put("CLIENT_NAME", DESUtil.encrypt("enhjeA==", CLIENT_NAME.trim()));// 客户名称
		pd.put("CREDENTIALS_TYPE", CREDENTIALS_TYPE);// 证件类型
		pd.put("CREDENTIALS_NO", DESUtil.encrypt("enhjeA==", CREDENTIALS_NO));// 证件号码
		pd.put("CLNO", CREDENTIALS_NO.substring(0, 6));
		pd.put("WARRANT_MATURITY_DATE", WARRANT_MATURITY_DATE);// 授权书到期日
		pd.put("QUERY_REASON", QUERY_REASON);// 查询原因
		pd.put("QUERY_VERSION", QUERY_VERSION);// 查询版本
		pd.put("QUERY_TYPE", QUERY_TYPE);// 查询类型
		pd.put("CUST_MANAGER", CUST_MANAGER.trim());// 客户经理
		pd.put("CHECK_SYS_ID", CHECK_USER_ID);// 授权审核人
		pd.put("IS_WX_CHECK", IS_WX_CHECK);// 是否微信审核
		pd.put("CHANNEL_NO", "01");// 渠道编号：01 前置系统页面录入
		pd.put("PRO_ID", PRO_ID);// 产品编号
		pd.put("USEPERSON", CLIENT_NAME);
		pd.put("MQNAME", CUST_MANAGER.trim());
		pd.put("YMQNAME", CHECK_USER_NAME);
		pd.put("SQTIME", APPLICATION_TIME);
		pd.put("SHFS", SHFS);
		pd.put("YWSHS", UuidUtil.get32UUID());
		if (CREDENTIALS_NO.substring(0, 2).equals("22")) {
			pd.put("SFYD", "1");
		} else {
			pd.put("SFYD", "0");
		}
		pd.put("RLSB", RLSB);
		pd.put("IS_USE", "1");
		try {
			PersonInquiryService.save(pd);
			PersonInquiryService.saveToFs(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		// 查询次数加1
		try {
			pd.put("USER_ID", USERID);
			pd.put("USER_TYPE", "1");
			PersonInquiryService.updateQuery(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	// 文件上传
	public void uploadpic(MultipartFile file, String path, String finalFileName, PageData serverInfo, String id) {
		FileTool filetool = new FileTool();
		if (null != file && !file.isEmpty()) {
			String ftpPassword = PasswordOper.decode(serverInfo.getString("LoginPass"));
			String fileName = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf("."));
			String extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			// finalFileName=finalFileName+".jpg"; 亿联银行不用ftp服务器
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + id; // 文件上传路径
			fileName = FileUpload.fileUp(file, filePath, fileName); // 将文件复制到本地（ftp上传）
			fileName = FileUpload.fileUp(file, filePath, finalFileName); // 将文件复制到本地（亿联银行）
			// filetool.upLoadFromProduction(serverInfo.getString("IP"),Integer.parseInt(serverInfo.getString("port")),
			// serverInfo.getString("LoginName"), ftpPassword, path,
			// finalFileName,filePath+"/"+fileName);

		}
	}

	/**
	 * 将资料上传影像平台
	 * 
	 * @param file
	 * @param path
	 * @param finalFileName
	 * @param serverInfo
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public String uploadVideo(MultipartFile file, String path, String finalFileName, PageData serverInfo, String id)
			throws Exception {
		String result = "";
		if (null != file && !file.isEmpty()) {
			// String urlStr = serverInfo.getString("URL_VIDEOS"); //url
			// URL url = new URL(urlStr);
			String fileName = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf("."));
			String extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String filePath = PathUtil.getClasspath(null).replaceAll("WEB-INF/classes/../../", "") + Const.FILEPATHIMG
					+ id; // 文件上传路径UploadFile
			fileName = FileUpload.fileUp(file, filePath, finalFileName); // 将文件复制到本地（亿联银行）
			filePath = PathUtil.PathAddress() + Const.FILEPATHIMG + id; // 前端访问文件路径
			String str = file.getOriginalFilename();
			String[] sts = str.split("\\.");
			result = filePath + File.separator + finalFileName + "."+sts[1];
			// File fileIn = new File(filePath+File.separator+fileName);
			// String base64 = FileToBase64.fileToBase64(fileIn);
			// JSONObject json = new JSONObject();
			// json.put("tranCode", "2001");
			// json.put("sysId", "SGC");
			// json.put("operId", id);
			// json.put("fileName", fileName);
			// json.put("fileType", extName.substring(1));
			// json.put("busiNo", id);
			// json.put("isOcr", "0");
			// json.put("base64", base64);
			// String data = json.toString();
			// JSONObject jsonRespons =
			// JSONObject.fromObject(FileUpload.UploadFile(data, url));
			// result = jsonRespons.getString("fileUrl");
			// delFile(filePath);//删除本地文件夹
		}
		return result;
	}

	// 获取MAC地址
	public String getMac() {
		String sMAC = "";
		Formatter formatter = new Formatter();
		try {
			InetAddress address = InetAddress.getLocalHost();
			NetworkInterface ni = NetworkInterface.getByInetAddress(address);
			byte[] mac = ni.getHardwareAddress();

			for (int i = 0; i < mac.length; i++) {
				sMAC = formatter.format(Locale.getDefault(), "%02X%s", mac[i], (i < mac.length - 1) ? "-" : "")
						.toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			formatter.close();
		}
		return sMAC;
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) {
		logBefore(logger, Jurisdiction.getUsername() + "列表CreditInquiry");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		String ORG_ID = "";
		List<String> roleIds = new ArrayList<String>();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		try {
			Org org = (Org) session.getAttribute(USERID + Const.SESSION_ORG);
			ORG_ID = org.getOrgId();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		String company = (String) session.getAttribute(USERID + Const.SESSION_COMPANY);
		roleIds = (List<String>) session.getAttribute(USERID + Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if (menuId != null && !menuId.equals(null)) {
			session.setAttribute(USERID + "menuFunGroup", menuId);
		} else {
			menuId = (String) session.getAttribute(USERID + "menuFunGroup");
		}
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		pd.put("company", company);
		pd.put("USERID", USERID);
		pd.put("ORG_ID", ORG_ID);
		pd.put("isHistory", "0");
		String CLIENT_NAME = pd.getString("CLIENT_NAME");
		String CREDENTIALS_NO = pd.getString("CREDENTIALS_NO");
		if (CLIENT_NAME != null && !CLIENT_NAME.equals("")) {
			CLIENT_NAME = DESUtil.encrypt("enhjeA==", CLIENT_NAME);
			pd.put("CLIENT_NAME", CLIENT_NAME);
		}
		if (CREDENTIALS_NO != null && !CREDENTIALS_NO.equals("")) {
			CREDENTIALS_NO = DESUtil.encrypt("enhjeA==", CREDENTIALS_NO);
			pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		page.setPd(pd);
		List<PageData> varList = new ArrayList<PageData>();
		try {
			varList = PersonInquiryService.list(page);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		if (CLIENT_NAME != null && !CLIENT_NAME.equals("")) {
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			pd.put("CLIENT_NAME", CLIENT_NAME);
		}
		if (CREDENTIALS_NO != null && !CREDENTIALS_NO.equals("")) {
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		int size = varList.size();
		for (int i = 0; i < size; i++) {
			CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
			varList.get(i).put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		// 查询次数判断及初始化
		String queryTime = PersonInquiryService.updateQueryCount(USERID, user.getUSERNAME(), "1");
		mv.setViewName("credit/personInquiry/personInquiry_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("queryTime", queryTime);
		mv.addObject("QX", roleAtuhFactory.getHC(roleIds, menuId));
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("credit/personInquiry/personInquiry_add");
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org = (Org) session.getAttribute(USERID + Const.SESSION_ORG);
		String ORG_CODE = "";
		try {
			ORG_CODE = org.getOrgCode();
			pd.put("ORG_CODE", ORG_CODE);
		} catch (Exception e) {
			logger.error(e);
			ORG_CODE = "";
		}
		pd.put("WARRANT_MATURITY_DATE", "20991231");
		// 审核人员列表
		List<PageData> checkUserList = new ArrayList<PageData>();
		List<PageData> prolist = new ArrayList<PageData>();
		try {
			pd.put("USERID", USERID);
			prolist = userService.getProByUserId(pd);
			checkUserList = PersonInquiryService.findCheckUserList(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		try {
			PageData PdOrg = PersonInquiryService.findOrgNameByCode(ORG_CODE);
			pd.put("ORG_NAME", PdOrg.getString("NAME"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		pd.put("CREDENTIALS_TYPE", "0");
		pd.put("QUERY_REASON", "02");
		pd.put("QUERY_TYPE", "0");
		mv.addObject("checkUserList", checkUserList);
		mv.addObject("prolist", prolist);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去修改提交信息页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEditC() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = PersonInquiryService.findById(pd);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		String CLIENT_NAME = pd.getString("CLIENT_NAME");
		String CREDENTIALS_NO = pd.getString("CREDENTIALS_NO");
		CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
		CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
		pd.put("CLIENT_NAME", CLIENT_NAME);
		pd.put("CREDENTIALS_NO", CREDENTIALS_NO);

		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org = (Org) session.getAttribute(USERID + Const.SESSION_ORG);
		String ORG_CODE = "";
		try {
			ORG_CODE = org.getOrgCode();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			ORG_CODE = "";
		}
		pd.put("ORG_CODE", ORG_CODE);
		// 审核人员列表
		List<PageData> checkUserList = new ArrayList<PageData>();
		try {
			checkUserList = PersonInquiryService.findCheckUserList(pd);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		mv.setViewName("credit/personInquiry/personInquiry_edit");
		mv.addObject("checkUserList", checkUserList);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去修改页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goRevise")
	public ModelAndView goRevise() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = PersonInquiryService.findById(pd);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		String CLIENT_NAME = pd.getString("CLIENT_NAME");
		String CREDENTIALS_NO = pd.getString("CREDENTIALS_NO");
		CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
		CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
		pd.put("CLIENT_NAME", CLIENT_NAME);
		pd.put("CREDENTIALS_NO", CREDENTIALS_NO);

		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org = (Org) session.getAttribute(USERID + Const.SESSION_ORG);
		String ORG_CODE = org.getOrgCode();
		pd.put("ORG_CODE", ORG_CODE);
		pd.put("ORG_NAME", org.getOrgName());
		List<PageData> checkUserList = new ArrayList<PageData>();
		List<PageData> prolist = new ArrayList<PageData>();
		// 审核人员列表
		try {
			pd.put("USERID", USERID);
			prolist = userService.getProByUserId(pd);
			checkUserList = PersonInquiryService.findCheckUserList(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String ID = pd.getString("ID");
		// 下载图片到本地
		File file = new File(
				PathUtil.getClasspath(null).replaceAll("WEB-INF/classes/../../", "") + Const.FILEPATHIMG + ID);
		if (!file.exists()) {
			// 获得配置文件配置信息
			PageData serverInfo;
			try {
				serverInfo = BaseController.getServerInfo();
				String ftpPath = serverInfo.getString("ftpPath");
				String path = PathUtil.getClasspath(null).replaceAll("WEB-INF/classes/../../", "") + Const.FILEPATHIMG
						+ ID; // 文件上传路径UploadFile
				String QUERY_NO = pd.getString("QUERY_NO");
				// 下载FTP
				FTPClientUtil fTPClientUtil = new FTPClientUtil();
				fTPClientUtil.open();
				fTPClientUtil.changeDir(ftpPath);
				fTPClientUtil.get(ftpPath + QUERY_NO, path);
				fTPClientUtil.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*
		 * //获得配置文件配置信息 PageData serverInfo=new PageData(); try { serverInfo =
		 * BaseController.getServerInfo(); } catch (IOException e1) { // TODO
		 * Auto-generated catch block e1.printStackTrace(); }
		 * serverInfo.put("LoginPass",
		 * PasswordOper.decode(serverInfo.getString("LoginPass"))); List<String>
		 * fileNameList = new ArrayList<String>(); Random random=new Random();
		 * fileNameList.add((random.nextInt(999-100+1)+100)+"WARRANT.jpg");
		 * fileNameList.add((random.nextInt(999-100+1)+100)+
		 * "LOAN_APPLICATION.jpg");
		 * fileNameList.add((random.nextInt(999-100+1)+100)+
		 * "IDENTITY_DOCUMENT.jpg"); String ftpPath =
		 * serverInfo.getString("ftpPath")+ID; String localPath =
		 * PathUtil.getClasspath() + Const.FILEPATHIMG + ID; //文件路径 try{
		 * //将服务器上图片下载到本地 FtpUtil.downloadFtpFile1(serverInfo.getString("IP"),
		 * serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),
		 * Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath,
		 * fileNameList); }catch(Exception e){ logger.error(e.getMessage()); }
		 * for(int i=0;i<fileNameList.size();i++){ String
		 * fileName=fileNameList.get(i); File file=new
		 * File(localPath+"/"+fileName); if(file.length()>0){
		 * pd.put(fileName.substring(3,fileName.length()-4), ID+"/"+fileName); }
		 * }
		 */

		mv.setViewName("credit/personInquiry/personInquiry_add");
		mv.addObject("checkUserList", checkUserList);
		mv.addObject("prolist", prolist);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit(HttpServletRequest request,
			@RequestParam(value = "WARRANT", required = false) MultipartFile file1,
			@RequestParam(value = "LOAN_APPLICATION", required = false) MultipartFile file2,
			@RequestParam(value = "IDENTITY_DOCUMENT", required = false) MultipartFile file3,
			@RequestParam(value = "CREDENTIALS_TYPE", required = false) String CREDENTIALS_TYPE,
			@RequestParam(value = "CREDENTIALS_NO", required = false) String CREDENTIALS_NO,
			@RequestParam(value = "CLIENT_NAME", required = false) String CLIENT_NAME,
			@RequestParam(value = "QUERY_REASON", required = false) String QUERY_REASON,
			@RequestParam(value = "QUERY_VERSION", required = false) String QUERY_VERSION,
			@RequestParam(value = "WARRANT_MATURITY_DATE", required = false) String WARRANT_MATURITY_DATE,
			@RequestParam(value = "QUERY_TYPE", required = false) String QUERY_TYPE,
			@RequestParam(value = "CUST_MANAGER", required = false) String CUST_MANAGER,
			@RequestParam(value = "CHECK_SYS_ID", required = false) String CHECK_SYS_ID,
			@RequestParam(value = "IS_WX_CHECK", required = false) String IS_WX_CHECK,
			@RequestParam(value = "ID", required = false) String ID) {
		logBefore(logger, Jurisdiction.getUsername() + "修改查询申请");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String finalFileName1 = "WARRANT";
		String finalFileName2 = "LOAN_APPLICATION";
		String finalFileName3 = "IDENTITY_DOCUMENT";
		String path1 = PathUtil.getClasspath() + Const.FILEPATHIMG;
		PageData serverInfo = new PageData();
		String WARRANT = "";
		String LOAN_APPLICATION = "";
		String IDENTITY_DOCUMENT = "";
		try {
			String ftpPath=serverInfo.getString("ftpPath");
     		String path=PathUtil.getClasspath(null).replaceAll("WEB-INF/classes/../../", "") + Const.FILEPATHIMG+ID;	//文件上传路径UploadFile
			serverInfo = BaseController.getServerInfo();
			if (file1.getSize() > 0) {
				WARRANT = uploadVideo(file1, path1, finalFileName1, serverInfo, ID);
			}
			if (file2.getSize() > 0) {
				LOAN_APPLICATION = uploadVideo(file2, path1, finalFileName2, serverInfo, ID);
			}
			if (file3.getSize() > 0) {
				IDENTITY_DOCUMENT = uploadVideo(file3, path1, finalFileName3, serverInfo, ID);
			}
			//上传至FTP
			/*FTPClientUtil fTPClientUtil = new FTPClientUtil();
    		fTPClientUtil.open();
    		fTPClientUtil.changeDir(ftpPath);
        	fTPClientUtil.put(path, ID, ftpPath);
        	fTPClientUtil.close();*/
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// 获得配置文件配置信息
		try {
			serverInfo = BaseController.getServerInfo();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		String path = serverInfo.getString("ftpPath") + ID;
		String CHECK_USER_ID = CHECK_SYS_ID.substring(0, CHECK_SYS_ID.indexOf("-"));
		pd.put("ID", ID);
		pd.put("CLIENT_TYPE", '1');// 客户类型(1:个人2:企业)
		pd.put("CLIENT_NAME", DESUtil.encrypt("enhjeA==", CLIENT_NAME.trim()));// 客户名称
		pd.put("CREDENTIALS_TYPE", CREDENTIALS_TYPE);// 证件类型
		pd.put("CREDENTIALS_NO", DESUtil.encrypt("enhjeA==", CREDENTIALS_NO));// 证件号码
		pd.put("WARRANT_MATURITY_DATE", WARRANT_MATURITY_DATE);// 授权书到期日
		pd.put("QUERY_REASON", QUERY_REASON);// 查询原因
		pd.put("QUERY_VERSION", QUERY_VERSION);// 查询版本
		pd.put("QUERY_TYPE", QUERY_TYPE);// 查询类型
		pd.put("CUST_MANAGER", CUST_MANAGER.trim());// 客户经理
		pd.put("CHECK_SYS_ID", CHECK_USER_ID);// 授权审核人
		pd.put("IS_WX_CHECK", IS_WX_CHECK);// 是否微信审核
		pd.put("CHANNEL_ID", 01);// 渠道编号：01 前置系统页面录入
		pd.put("WARRANT", WARRANT);
		pd.put("LOAN_APPLICATION", LOAN_APPLICATION);
		pd.put("IDENTITY_DOCUMENT", IDENTITY_DOCUMENT);
		try {
			PersonInquiryService.update(pd);
			PersonInquiryService.updateFs(pd);
			// uploadpic(file1,path,finalFileName1,serverInfo,ID);
			// uploadpic(file2,path,finalFileName2,serverInfo,ID);
			// uploadpic(file3,path,finalFileName3,serverInfo,ID);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param ID
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Object delete(@RequestParam String ID) {
		logBefore(logger, Jurisdiction.getUsername() + "删除查询申请");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID + "sessionComp");
		String errInfo = "success";
		try {
			PersonInquiryService.delete(pd); // 删除个人查询申请信息表
			PersonInquiryService.deleteFs(pd); // 删除流程表
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 提交申请
	 * 
	 * @param ID
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goSubmit")
	@ResponseBody
	public Object goSubmit(@RequestParam String ID) {
		logBefore(logger, Jurisdiction.getUsername() + "提交查询申请");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = this.getPageData();
		String errInfo = "success";
		pd.put("STATUS", "01");
		try {
			PersonInquiryService.updateStatus(pd); // 提交申请
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 批量提交申请
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goSubmitBatch")
	@ResponseBody
	public Object goSubmitBatch() {
		logBefore(logger, Jurisdiction.getUsername() + "提交查询申请");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = this.getPageData();
		String errInfo = "success";
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			for (int i = 0; i < ArrayDATA_IDS.length; i++) {
				String id = ArrayDATA_IDS[i];
				pd.put("ID", id);
				pd.put("STATUS", "01");
				try {
					PersonInquiryService.updateStatus(pd);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // 提交申请
				pd.put("msg", "ok");
			}
		} else {
			pd.put("msg", "no");
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 失败重查
	 * 
	 * @param ID
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goApplyAgain")
	@ResponseBody
	public Object goApplyAgain(@RequestParam String ID) {
		logBefore(logger, Jurisdiction.getUsername() + "重新提交查询");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = this.getPageData();
		String errInfo = "success";
		// pd.put("STATUS", "01");
		try {
			// 查询查询员登录名
			PageData data = indAppReService.getQueryUserInfo(pd);
			pd = PersonInquiryService.findById(pd);
			pd.putAll(data);
			if (!"2".equals(String.valueOf(pd.get("INTERNAL"))) && String.valueOf(pd.get("INTERNAL")).length() > 30) {// 行内查询
				CompressUtils.downAndUploadFile(pd, String.valueOf(pd.get("INTERNAL")), "1",
						String.valueOf(pd.get("REPORT_ID")), indAppReService, entAppReService);
			} else {// 人行查询
				// ClawerInterfaceServer.WxSave(pd,
				// "1",indAppReService,crawlIndAppReService,crawlPersonCrawlerService,
				// crawlDataSubmissionService,
				// crawlEntAppReService,crawlCompanyCrawlerService);
				WebServiceRunnable_Counter webServiceTask = new WebServiceRunnable_Counter(pd, "1", indAppReService,
						entAppReService, iDataSubmissionService, crawlIndAppReService, crawlPersonCrawlerService,
						crawlDataSubmissionService, crawlEntAppReService, crawlCompanyCrawlerService);
				executor.execute(webServiceTask);
			}
			/*
			 * //查询明细表需要的 PageData detail =
			 * indAppReService.QueryDetail(pd.getString("ID")); //向明细表中插入数据
			 * indAppReService.saveDetail(detail);
			 */
			// 调用线程，启动爬虫
			/*
			 * Thread crawStart = new ThreadCrawler(pd,true,indAppReService);
			 * crawStart.start();
			 */
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 丢弃数据
	 * 
	 * @param ID
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goDelete")
	@ResponseBody
	public Object goDelete(@RequestParam String ID) {
		logBefore(logger, Jurisdiction.getUsername() + "提交丢弃数据");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = this.getPageData();
		String errInfo = "success";
		try {
			PersonInquiryService.updateDStatus(pd); // 丢弃数据
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			errInfo = "error";
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 删除文件
	 * 
	 * @param path
	 */
	private void delFile(String path) {
		try {
			if (!StringUtil.isEmpty(path)) {
				File file = new File(path);
				if (file.exists()) {
					if (file.isFile()) {
						file.delete();
					} else if (file.isDirectory()) {
						File[] arrFile = file.listFiles();
						for (File fi : arrFile) {
							delFile(fi.getAbsolutePath());
						}
						file.delete();
					}
				}
			}
		} catch (Exception e) {
			logger.error("提交个人申请删除图片文件夹.delFile方法出错", e);
		}
	}
}
