package com.dcits.credit.controller.numReadInquiry;

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
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
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
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.numInquiry.NumReadInquiryManager;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.util.ClawerInterfaceServer;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ThreadCrawler;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileUpload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.UuidUtil;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 数字解读征信查询申请
 * 创建人：gaoshenga
 * 创建时间：2019-02-23
 */
@Controller
@RequestMapping(value="/queryNumRead")
public class NumReadInquiryController extends BaseController {
	
	String menuUrl = "queryNumRead/list.do"; //菜单地址(权限用)
	@Resource(name="NumReadInquiryService")
	private NumReadInquiryManager NumReadInquiryService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="entAppReService")
	private EntAppReManager entAppReService;
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
//			NumReadInquiryService.saveReport(pd);
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("save_result");
		mv.addObject("pd", pd);
		return mv;
	}
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(HttpServletRequest request,
			@RequestParam(value="CREDENTIALS_TYPE",required=false) String CREDENTIALS_TYPE,//证件类型
			@RequestParam(value="CREDENTIALS_NO",required=false) String CREDENTIALS_NO,//证件号码
			@RequestParam(value="CLIENT_NAME",required=false) String CLIENT_NAME,//客户姓名
			@RequestParam(value="QUERY_REASON",required=false) String QUERY_REASON,//查询原因
			@RequestParam(value="CHECK_SYS_ID",required=false) String CHECK_SYS_ID,//授权审核人
			@RequestParam(value="PRODUCE_DATE",required=false) String PRODUCE_DATE//产品时间
			){
		logBefore(logger, Jurisdiction.getUsername()+"新增queryNumRead");
		ModelAndView mv = this.getModelAndView(); 
		PageData pd = this.getPageData();
		String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
		pd.put("DATA_DATE",date);
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		String ORG_CODE=org.getOrgCode();
		String ORG_ID=org.getOrgId();
		PageData map=new PageData();
		String id=UuidUtil.get64UUID();
      //获得配置文件配置信息
        PageData serverInfo=new PageData();
		pd.put("ID", id);
		pd.put("USER_SYS_ID", USERID);//用户系统ID
		pd.put("ORG_ID", ORG_ID);//用户机构ID
		String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
		pd.put("APPLICATION_TIME",APPLICATION_TIME);//申请时间
		pd.put("STATUS", "00");//状态 00待提交
		pd.put("MAC", getMac());//mac地址
		request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		pd.put("IP", ip);//ip地址
		pd.put("CLIENT_TYPE", '1');//客户类型(1:个人2:企业)
		pd.put("CLIENT_NAME", CLIENT_NAME.trim());//客户名称
		pd.put("CREDENTIALS_TYPE", CREDENTIALS_TYPE);//证件类型
		pd.put("CREDENTIALS_NO", CREDENTIALS_NO);//证件号码
		pd.put("QUERY_REASON", QUERY_REASON);//查询原因
		pd.put("CHECK_SYS_ID", CHECK_SYS_ID);//授权审核人
		pd.put("PRODUCE_DATE", PRODUCE_DATE);//产品时间
		pd.put("CHANNEL_NO", "01");//渠道编号：01 前置系统页面录入
		try{
		//保存信息表
		NumReadInquiryService.save(pd);
		//保存流程表
		NumReadInquiryService.saveToFs(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
			//System.out.println(e);
		}
		//查询次数加1
		try{
			pd.put("USER_ID", USERID);
			pd.put("USER_TYPE", "1");
			NumReadInquiryService.updateQuery(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.addObject("msg","success");                                                                                                                                                                                                                                                                                                                                                                
		mv.setViewName("save_result");
		return mv;
	}
	// 获取MAC地址
	public String getMac(){ 
		String sMAC = ""; 
			Formatter formatter = new Formatter(); 
		  try{ 
		      InetAddress address = InetAddress.getLocalHost(); 
		      NetworkInterface ni = NetworkInterface.getByInetAddress(address); 
		      byte[] mac = ni.getHardwareAddress(); 
		      
		      for (int i = 0; i < mac.length; i++) { 
		          sMAC = formatter.format(Locale.getDefault(), "%02X%s", mac[i], 
		                  (i < mac.length - 1) ? "-" : "").toString(); 
		      } 
		  }catch(Exception e){ 
		      e.printStackTrace(); 
		  }finally{
			  formatter.close();
		  }
		  return sMAC;
	} 
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"列表CreditInquiry");
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
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("COMPANY", company);
		pd.put("USER_SYS_ID", USERID);
		pd.put("ORG_ID", ORG_ID);
		pd.put("isHistory", "0");
		page.setPd(pd);
		List<PageData>varList=new ArrayList<PageData>();
		try{
		varList = NumReadInquiryService.list(page);
		}catch(Exception e){
			logger.error(e.getMessage());
			//System.out.println(e);
		}
		//查询次数判断及初始化
		String queryTime = NumReadInquiryService.updateQueryCount(USERID,user.getUSERNAME(),"1");
		mv.setViewName("credit/numReadInquiry/numReadInquiry_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("queryTime", queryTime);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("credit/numReadInquiry/numReadInquiry_add");
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		String ORG_CODE="";
		try{
			ORG_CODE=org.getOrgCode();
		}catch(Exception e){
			logger.error(e);
			ORG_CODE="";
		}
		pd.put("ORG_CODE",ORG_CODE);
		pd.put("WARRANT_MATURITY_DATE", "20991231");
		//审核人员列表
		List<PageData> checkUserList=new ArrayList<PageData>();
		try{
		checkUserList=NumReadInquiryService.findCheckUserList(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		pd.put("CREDENTIALS_TYPE", "0");
		pd.put("QUERY_REASON", "02");
		pd.put("QUERY_TYPE", "0");
		mv.addObject("checkUserList", checkUserList);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	/**去修改提交信息页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEditC(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
		pd = NumReadInquiryService.findById(pd);	
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		String ORG_CODE="";
		try{
			ORG_CODE=org.getOrgCode();
		}catch(Exception e){
			logger.error(e);
			ORG_CODE="";
		}
		pd.put("ORG_CODE", ORG_CODE);
		//审核人员列表
		List<PageData> checkUserList=new ArrayList<PageData>();
		try{
		 checkUserList=NumReadInquiryService.findCheckUserList(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/numReadInquiry/numReadInquiry_edit");
		mv.addObject("checkUserList", checkUserList);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去修改页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goRevise")
	public ModelAndView goRevise(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
		pd = NumReadInquiryService.findById(pd);	
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		String ORG_CODE=org.getOrgCode();
		pd.put("ORG_CODE", ORG_CODE);
		List<PageData> checkUserList=new ArrayList<PageData>();
		//审核人员列表
		try {
			checkUserList=NumReadInquiryService.findCheckUserList(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String ID = pd.getString("ID");
		mv.setViewName("credit/numReadInquiry/numReadInquiry_add");
		mv.addObject("checkUserList", checkUserList);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(HttpServletRequest request,
			@RequestParam(value="CREDENTIALS_TYPE",required=false) String CREDENTIALS_TYPE,//证件类型
			@RequestParam(value="CREDENTIALS_NO",required=false) String CREDENTIALS_NO,//证件号码
			@RequestParam(value="CLIENT_NAME",required=false) String CLIENT_NAME,//客户姓名
			@RequestParam(value="QUERY_REASON",required=false) String QUERY_REASON,//查询原因
			@RequestParam(value="CHECK_SYS_ID",required=false) String CHECK_SYS_ID,//授权审核人
			@RequestParam(value="PRODUCE_DATE",required=false) String PRODUCE_DATE,//产品时间
			@RequestParam(value="ID",required=false) String ID
			){
		logBefore(logger, Jurisdiction.getUsername()+"修改查询申请");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("ID", ID);
		pd.put("CLIENT_TYPE", '1');//客户类型(1:个人2:企业)
		pd.put("CLIENT_NAME", CLIENT_NAME.trim());//客户名称
		pd.put("CREDENTIALS_TYPE", CREDENTIALS_TYPE);//证件类型
		pd.put("CREDENTIALS_NO", CREDENTIALS_NO);//证件号码
		pd.put("QUERY_REASON", QUERY_REASON);//查询原因
		pd.put("CHECK_SYS_ID", CHECK_SYS_ID);//授权审核人
		pd.put("PRODUCE_DATE", PRODUCE_DATE);//产品时间
		pd.put("CHANNEL_ID", 01);//渠道编号：01 前置系统页面录入
		try{
		NumReadInquiryService.update(pd);
		NumReadInquiryService.updateFs(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 删除
	 * @param ID
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String ID){
		logBefore(logger, Jurisdiction.getUsername()+"删除查询申请");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		String errInfo = "success";
		try{
		NumReadInquiryService.delete(pd);	//删除个人查询申请信息表
		NumReadInquiryService.deleteFs(pd); //删除流程表
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 提交申请
	 * @param ID
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/goSubmit")
	@ResponseBody
	public Object goSubmit(@RequestParam String ID){
		logBefore(logger, Jurisdiction.getUsername()+"提交查询申请");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		String errInfo = "success";
		pd.put("STATUS", "01");
		try{
		NumReadInquiryService.updateStatus(pd);	//提交申请
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 批量提交申请
	 * @param ID
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/goSubmitBatch")
	@ResponseBody
	public Object goSubmitBatch(){
		logBefore(logger, Jurisdiction.getUsername()+"提交查询申请");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		String errInfo = "success";
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			for(int i=0;i<ArrayDATA_IDS.length;i++){
				String id=ArrayDATA_IDS[i];
				pd.put("ID", id);
				pd.put("STATUS", "01");
				try {
					NumReadInquiryService.updateStatus(pd);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	//提交申请
				pd.put("msg", "ok");
			}
		}else{
			pd.put("msg", "no");
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 失败重查
	 * @param ID
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/goApplyAgain")
	@ResponseBody
	public Object goApplyAgain(@RequestParam String ID){
		logBefore(logger, Jurisdiction.getUsername()+"重新提交查询");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		String errInfo = "success";
		//pd.put("STATUS", "01");
		try{
			//查询查询员登录名
 			PageData data = indAppReService.getQueryUserInfo(pd);
 			pd = NumReadInquiryService.findById(pd);
 			pd.putAll(data);
 			if(!"2".equals(String.valueOf(pd.get("INTERNAL")))&&String.valueOf(pd.get("INTERNAL")).length()>30){//行内查询
				CompressUtils.downAndUploadFile(pd, String.valueOf(pd.get("INTERNAL")), "1", String.valueOf(pd.get("REPORT_ID")), indAppReService, entAppReService);
			}else{//人行查询
				ClawerInterfaceServer.WxSave(pd, "1",indAppReService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
			}
 		    /*//查询明细表需要的
 			PageData detail = indAppReService.QueryDetail(pd.getString("ID"));
 			//向明细表中插入数据
 			indAppReService.saveDetail(detail);*/
 			//调用线程，启动爬虫
 			/*Thread crawStart = new ThreadCrawler(pd,true,indAppReService);
 			crawStart.start();*/
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 丢弃数据
	 * @param ID
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/goDelete")
	@ResponseBody
	public Object goDelete(@RequestParam String ID){
		logBefore(logger, Jurisdiction.getUsername()+"提交丢弃数据");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		String errInfo = "success";
		try{
			NumReadInquiryService.updateDStatus(pd);	//丢弃数据
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			errInfo = "error";
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
}
