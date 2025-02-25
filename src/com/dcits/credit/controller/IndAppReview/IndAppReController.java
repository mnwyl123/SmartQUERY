package com.dcits.credit.controller.IndAppReview;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.entity.WbqqRunnable;
import com.dcits.credit.entity.WebServiceRunnable;
import com.dcits.credit.entity.WebServiceRunnable_Counter;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.QueryDateOperatorService.QueryDateOperatorManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ThreadInnerCrawler;
import com.dcits.credit.util.UserUtil;
import com.dcits.credit.util.WbqqInnerRunnable;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.user.UserManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;
import com.dcits.platform.util.role.RoleAuthFactory;




/** 
 * 类名称：IndAppReController
 * 创建人：zhangyy
 * 说明：个人查询申请审核
 * @version
 */
@Controller
@RequestMapping(value="/IndAppRe")
public class IndAppReController extends BaseController {
	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name="personCrawlerService")
	private PersonCrawlerManager personCrawlerService;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="dataSubmissionService")
	private IDataSubmissionService iDataSubmissionService;
	@Resource(name="queryDateService")
	private QueryDateOperatorManager queryDateService;
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
	private com.dcits.crawl.service.crawler.CompanyCrawlerManager crawlCompanyCrawlerService;
//	ThreadPoolExecutor executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
//            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))));
	ThreadPoolExecutor executor = new ThreadPoolExecutor(1,1,Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))));
	private Map<String,String> colOfTab = null;
	
	/**待审核信息列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listIndAppRe")
	public ModelAndView listIndAppRe(Page page){
 		ModelAndView mv = findData(page);
		return mv;
	}
	
	private ModelAndView findData(Page page){
		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		//权限查询
		String menuId = pd.getString("menuId");
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		Map<String,String> map = roleAtuhFactory.getHC(roleIds,menuId);
/*		//用于识别批量审核按钮是否被点击(为0表示已批量提交)
		if(pd.get("flag")==null){
			pd.put("flag", "1");
		}
*/		pd.put("USER_ID", USERID);
		try{
			//查询当前用户机构编码
			List<String> userOrgId = indAppReService.getUserOrgID(pd);
			//存放列表数据信息
			List<PageData> listInfo = new ArrayList<PageData>();
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
			if(userOrgId.size()>0){
				pd.put("ORG_ID", userOrgId.get(0).toString());
				page.setPd(pd);
				//查询待审核信息
				listInfo = indAppReService.listIndAppRe(page);
			}
			if(CLIENT_NAME != null&&!CLIENT_NAME.equals("")) {
				CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
				pd.put("CLIENT_NAME", CLIENT_NAME);
			}
			if(CREDENTIALS_NO != null&&!CREDENTIALS_NO.equals("")) {
				CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
				pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
			}
			int size = listInfo.size();
			for(int i=0;i<size;i++) {
				CLIENT_NAME = listInfo.get(i).getString("CLIENT_NAME");
				CREDENTIALS_NO = listInfo.get(i).getString("CREDENTIALS_NO");
				CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
				CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
				listInfo.get(i).put("CLIENT_NAME", CLIENT_NAME);
				listInfo.get(i).put("CREDENTIALS_NO", CREDENTIALS_NO);
			}
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/IndAppReview/indAppReview_list");
		mv.addObject("QX",map);
		return mv;
	}
	
	/**审核个人申请信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAppCheck")
	public ModelAndView goAppCheck(){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		List<PageData> prolist=new ArrayList<PageData>();
 		try{
 			//查询用户申请部门编码
 	  		String DEPT_CODE = indAppReService.getUserDepart(pd);
 	 		//查询用户机构
 	  		String org_name = indAppReService.getUserOrg(pd);
 	 		//查询客户信息
 	 		PageData appInfo = indAppReService.getAppCheck(pd);
 	 		
 	 		String CLIENT_NAME = appInfo.getString("CLIENT_NAME");
 			String CREDENTIALS_NO = appInfo.getString("CREDENTIALS_NO");
 			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
 			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
 			appInfo.put("CLIENT_NAME", CLIENT_NAME);
 			appInfo.put("CREDENTIALS_NO", CREDENTIALS_NO);
 			
 	 		//产品
 	 		pd.put("USERID",pd.getString("USER_SYS_ID"));
			prolist = userService.getProByUserId(pd);
 	 		String ID = pd.getString("ID");
/* 	 		//获得配置文件配置信息
 	 		PageData serverInfo = BaseController.getServerInfo();
 	 		serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
 	        
 	        List<String> fileNameList = new ArrayList<String>();
 	        fileNameList.add("WARRANT.jpg");
 	        fileNameList.add("LOAN_APPLICATION.jpg");
 	        fileNameList.add("IDENTITY_DOCUMENT.jpg");
 	        String ftpPath = serverInfo.getString("ftpPath")+ID;  

 	        String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + ID;  //文件路径
 	        try{
 	        	//将服务器上图片下载到本地
// 	 	        FtpUtil.downloadFtpFile(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath, fileNameList); 
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
 	        }*/
 	 		mv.addObject("prolist", prolist);
 			mv.addObject("pd", pd);
 			mv.addObject("DEPT_CODE", DEPT_CODE);
 			mv.addObject("ORG_NAME", org_name);
 			mv.addObject("appInfo", appInfo);
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
 		mv.setViewName("credit/IndAppReview/AppReview_Info");
		return mv;
	}
	/**
	 * 判断查询渠道
	 * 审核不通过，直接更改流程状态，结束本次操作
	 * @return
	 */
	@RequestMapping(value="/findInternal")
	@ResponseBody
	public Object findInternal(){
		PageData pd = this.getPageData();
		try {
			String internal = null;
			if(!"02".equals(pd.getString("STATUS"))){
				pd.put("INTERNAL", "9"); //审核不通过
				//审核不通过，更改流程状态表中审核人名称、审核时间、状态、审核不通过原因
	 			indAppReService.updateCheck(pd);
				return pd;
			}
			PageData appInfo = indAppReService.getAppCheck(pd);
			String CLIENT_NAME = appInfo.getString("CLIENT_NAME");
			String CREDENTIALS_NO = appInfo.getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			appInfo.put("CLIENT_NAME", CLIENT_NAME);
			appInfo.put("CREDENTIALS_NO", CREDENTIALS_NO);
			//根据条件查询该客户在一定时间内是否被查询过
			String org_id = UserUtil.getCurrOrg().getOrgId();
			String company = UserUtil.getCurrUser().getCOMPANY();
			PageData queryDate = new PageData();
			queryDate.put("ORG_ID", org_id); //增加机构条件
			queryDate.put("COMPANY", company);
			queryDate.put("PARA_TYPE", "1");
			queryDate = queryDateService.queryByTypeAndCompany(queryDate);
			if(queryDate!=null&&queryDate.get("LIMT_DATE")!=null){
				appInfo.put("LIMT_DATE", String.valueOf(queryDate.get("LIMT_DATE")));
			}else{
				appInfo.put("LIMT_DATE", "0");
			}
			CLIENT_NAME = DESUtil.encrypt("enhjeA==", CLIENT_NAME);
			appInfo.put("CLIENT_NAME", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.encrypt("enhjeA==", CREDENTIALS_NO);
			appInfo.put("CREDENTIALS_NO", CREDENTIALS_NO);
			appInfo = indAppReService.findByInfo(appInfo);
			if(appInfo!=null&&appInfo.get("ID")!=null){
				internal = String.valueOf(appInfo.get("ID"));
			}
			if(internal == null) pd.put("INTERNAL", "2"); //人行查询
			else pd.put("INTERNAL", internal); //行内查询
			return pd;
		} catch (Exception e) {
			logger.error("【URL=IndAppRe/findInternal方法报错，错误原因：】",e);
		}
		return pd;
	}
	
	/**保存审核信息
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
//	@Transactional
//	@RequestMapping(value="/saveAppCheck")
//	public ModelAndView saveAppCheck(){
//		ModelAndView mv = this.getModelAndView();
//   		PageData pd = this.getPageData();
//   		PageData detail = null;
//   		//获取审核时间
// 		pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
// 		pd.put("QUERY_TIME", "");
// 		try{
// 			String status = pd.getString("STATUS");   //审核状态
// 			String internal = "2";   //查询范围(人行/行内)
// 			String report_id = "";  //报告编号
// 			
// 			if("02".equals(status)){
// 				//查询判断该笔是否可以行内查询
// 				/*************start**************/
// 				//查询申请客户信息
// 	 			PageData appInfo = indAppReService.getAppCheck(pd);
// 				//查询当前法人的查询时间时长设置
// 				Session session = Jurisdiction.getSession();
// 	 			User user = (User)session.getAttribute(Const.SESSION_USER);
// 	 			String USERID = user.getUSER_ID();
// 	 			String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
// 	 			PageData queryDate = new PageData();
// 	 			queryDate.put("COMPANY", company);
// 	 			queryDate.put("PARA_TYPE", "1");
// 	 			queryDate = queryDateService.queryByTypeAndCompany(queryDate);
// 	 			if(queryDate!=null&&queryDate.get("LIMT_DATE")!=null){
// 	 				appInfo.put("LIMT_DATE", String.valueOf(queryDate.get("LIMT_DATE")));
// 	 			}else{
// 	 				appInfo.put("LIMT_DATE", "0");
// 	 			}
// 	 			//根据条件查询该客户在一定时间内是否被查询过
// 				appInfo = indAppReService.findByInfo(appInfo);
// 	 			if(appInfo!=null&&appInfo.get("ID")!=null){
// 	 				internal = String.valueOf(appInfo.get("ID"));
// 	 				report_id = String.valueOf(appInfo.get("REPORT_ID"));
// 	 			}
// 	 			/*************end**************/
//
// 	 			//查询明细表需要的
// 	 			detail = indAppReService.QueryDetail(pd.getString("ID"));
// 	 			//向明细表中插入数据
// 	 			indAppReService.saveDetail(detail);
// 			}
//// 			审核不通过，更改流程状态表中审核人名称、审核时间、状态、审核不通过原因
// 			indAppReService.updateCheck(pd);
// 			
// 			//审核通过
// 	 		if((status=="02"||status.equals("02"))&&(internal=="2"||internal.equals("2"))){
// 	 			//查询查询员登录名
// 	 			PageData data = indAppReService.getQueryUserInfo(pd);
// 	 			pd.putAll(data);
// 	 			
// 	 			//调用线程，启动爬虫
// 	 			/*Thread crawStart = new ThreadCrawler(pd,true,indAppReService);
// 	 			crawStart.start();*/
// 	 			WbqqRunnable WbqqTask = new WbqqRunnable(pd,"1",indAppReService);
//			    executor.execute(WbqqTask);
// 	 		}else if((status=="02"||status.equals("02"))&&internal!="2"&&!internal.equals("2")){
//				try{
//					//更新行内/人行字段
//	 	 			pd.put("INTERNAL", internal);
//		 			indAppReService.updateInner(pd);
//				}catch(Exception e){
//					logger.error(e.getMessage(),e);
//				}
//				//行内查询
//				Thread innerCraw = new ThreadInnerCrawler(pd, internal,"1",report_id,indAppReService,entAppReService);
//				innerCraw.start();
// 	 		}
// 		}catch(Exception e){
// 			logger.error(e.getMessage(),e);
// 		}
// 		mv.setViewName("save_result");
//		return mv;
//	}
	
	
	/**保存审核信息
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value="/saveAppCheck")
	public ModelAndView saveAppCheck(){
		ModelAndView mv = this.getModelAndView();
   		PageData pd = this.getPageData();
   		PageData detail = null;
   		//获取审核时间
 		pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
 		pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
 		try{
 			String internal = pd.getString("INTERNAL");
 			String report_id = "";  //报告编号
 			//查询明细表需要的
 			detail = indAppReService.QueryDetail(pd.getString("ID"));
 			//向明细表中插入数据
 			indAppReService.saveDetail(detail);
// 			审核不通过，更改流程状态表中审核人名称、审核时间、状态、审核不通过原因
 			indAppReService.updateCheck(pd);
 			pd.put("USERNAME", Jurisdiction.getUsername());
 			pd.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
 			//审核通过
 	 		if("2".equals(internal)){
 	 			//查询查询员登录名
// 	 			PageData data = indAppReService.getQueryInfo(pd);
// 	 			pd.putAll(data);
// 	 			data.put("REQ_REPORT", PersonWebSerUtil.webConcatPerson(data));
 	 			//通过人行接口查询报告
// 	 			WebServiceRunnable webServiceTask = new WebServiceRunnable(pd,"1",indAppReService,entAppReService,iDataSubmissionService);
// 	 			executor.execute(webServiceTask);
 	 			//调去柜面的线程
 	 			WebServiceRunnable_Counter webServiceTask = new WebServiceRunnable_Counter(pd,"1",indAppReService,entAppReService,iDataSubmissionService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
 	 			executor.execute(webServiceTask);
 	 		}else{
				try{
					//更新行内/人行字段
	 	 			pd.put("INTERNAL", "1");
		 			indAppReService.updateInner(pd);
				}catch(Exception e){
					logger.error(e.getMessage(),e);
				}
				//行内查询
				Thread innerCraw = new ThreadInnerCrawler(pd, internal,"1",report_id,indAppReService,entAppReService);
				innerCraw.start();
				pd.put("STATUS", "06");
				indAppReService.updateStatus(pd);
 	 		}
 		}catch(Exception e){
 			logger.error(e.getMessage(),e);
 		}
 		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 判断查询渠道(批量)
	 * 审核不通过，直接更改流程状态，结束本次操作（批量）
	 * @return
	 */
	@RequestMapping(value="/findInternalAll")
	@ResponseBody
	public Object findInternalAll(){
		PageData pd = this.getPageData();
		String message = "";
		try {
			String IDS = pd.getString("ids");
		    String INTERNALS = "";
 			if(null != IDS && !"".equals(IDS)){
 				String ArrayIDS[] = IDS.split(",");				
 				for(int i=0;i<ArrayIDS.length;i++){
 					pd.put("ID",ArrayIDS[i]);
 					String internal = null;			
 					PageData appInfo = indAppReService.getAppCheck(pd);
 					//根据条件查询该客户在一定时间内是否被查询过
 					String org_id = UserUtil.getCurrOrg().getOrgId();
 					String company = UserUtil.getCurrUser().getCOMPANY();
 					PageData queryDate = new PageData();
 					queryDate.put("ORG_ID", org_id); //增加机构条件
 					queryDate.put("COMPANY", company);
 					queryDate.put("PARA_TYPE", "1");
 					queryDate = queryDateService.queryByTypeAndCompany(queryDate);
 					
 					if(queryDate!=null&&queryDate.get("LIMT_DATE")!=null){
 						appInfo.put("LIMT_DATE", String.valueOf(queryDate.get("LIMT_DATE")));
 					}else{
 						appInfo.put("LIMT_DATE", "0");
 					}	
 					
 					PageData appInfo1 = indAppReService.findByInfo(appInfo);
 					if(appInfo1!=null&&appInfo1.get("ID")!=null){
 						internal = String.valueOf(appInfo1.get("ID"));
 						message = appInfo.getString("CLIENT_NAME")+","+message;                       
 					}
 					if(internal == null){
 						INTERNALS=INTERNALS+"2,";
 						pd.put("INTERNALS", INTERNALS); //人行查询
 					}else{
 						INTERNALS=INTERNALS+internal+",";
 						pd.put("INTERNALS", INTERNALS); //行内查询
 					} 
 				}		
 			}
			if(!message.equals(""))
				message=message.substring(0,message.length()-1)+"已存在本地近期报告，是否使用？";
		    pd.put("message", message);
			return pd;
		} catch (Exception e) {
			logger.error("【URL=IndAppRe/findInternal方法报错，错误原因：】",e);
		}
		return pd;
	}
	
	/**保存审核信息(批量)
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value="/saveAppCheckAll")
	public ModelAndView saveAppCheckAll(Page page){
   		PageData pd = this.getPageData();
   		PageData detail = null;
   		//获取审核时间
 		pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
 		pd.put("QUERY_TIME", "");
 		try{
 			String IDS = pd.getString("ids");
 			String INTERNALS = pd.getString("INTERNALS");
 			String is_inner = pd.getString("is_inner");
 			if(null != IDS && !"".equals(IDS)){
 				String ArrayIDS[] = IDS.split(",");
 				String ArrayInter[] = INTERNALS.split(",");
 				for(int i=0;i<ArrayIDS.length;i++){
 					String ID =ArrayIDS[i];
 					String internal = ArrayInter[i];					
 					String report_id = "";  //报告编号
 		 			//查询明细表需要的
 		 			detail = indAppReService.QueryDetail(ID);
 		 			//向明细表中插入数据
 		 			indAppReService.saveDetail(detail);
// 		 			审核不通过，更改流程状态表中审核人名称、审核时间、状态、审核不通过原因 	
 		 			PageData status = new PageData();
 		 			status.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
 		 			status.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
 		 			status.put("STATUS", "02");
 		 			status.put("CHECK_REJECT_RESON", "");
 		 			status.put("REPORT_ID", "");
 		 			status.put("ID", ID);
 		 			indAppReService.updateCheck(status);
 		 			pd.put("USERNAME", Jurisdiction.getUsername());
 		 			pd.put("USER_ID", UserUtil.getCurrUser().getUSER_ID());
 		 			pd.putAll(detail);
 		 			//审核通过
 		 	 		if("2".equals(internal)||is_inner.equals("0")){
 	 					PageData p = new PageData();
 	 					p.putAll(pd);
 		 	 			//调去柜面的线程
 		 	 			WebServiceRunnable_Counter webServiceTask = new WebServiceRunnable_Counter(p,"1",indAppReService,entAppReService,iDataSubmissionService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
 		 	 			executor.execute(webServiceTask);
						logger.debug("**************************i*********************");
						logger.debug(i);
						logger.debug("**************************i*********************");
 		 	 		}else{
 		 	 			PageData p = new PageData();
 	 					p.putAll(pd);
 						try{
 							//更新行内/人行字段
 			 	 			p.put("INTERNAL", internal);
 				 			indAppReService.updateInner(p);
 						}catch(Exception e){
 							logger.error(e.getMessage(),e);
 						}
 						//行内查询
 						Thread innerCraw = new ThreadInnerCrawler(p, internal,"1",report_id,indAppReService,entAppReService);
 						innerCraw.start();
 		 	 		}
 					
 				}
 			}	
 		}catch(Exception e){
 			logger.error(e.getMessage(),e);
 		}
 		ModelAndView mv = findData(page);
 		return mv;
	}
	
	
	/**批量审核
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value="/goCheckAll")
	@ResponseBody
	public Object goCheckAll(){
		Map<String,Object> map = new HashMap<String,Object>();
   		PageData pd = this.getPageData();
		//查询当前法人的查询时间时长设置
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		PageData queryDate = new PageData();
		queryDate.put("COMPANY", company);
		queryDate.put("PARA_TYPE", "1");
		String limt_date = "0";
		try {
			//判断当前法人是否设置了查询时长参数值
			queryDate = queryDateService.queryByTypeAndCompany(queryDate);
			if(queryDate!=null&&queryDate.get("LIMT_DATE")!=null){
				limt_date = String.valueOf(queryDate.get("LIMT_DATE"));
	 		}
		} catch (Exception e1) {
			logger.error(e1.getMessage(), e1);
		}
   		//获取审核时间
 		pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
 		pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
 		try{
 			String IDS = pd.getString("IDS");
 			String Inner = pd.getString("INTER");
 			if(null != IDS && !"".equals(IDS)&&null!=Inner&&!"".equals(Inner)){
 				//审核不通过，更改流程状态表中审核人名称、审核时间、状态、审核不通过原因
 				pd.put("STATUS", "02");
 				String ArrayIDS[] = IDS.split(",");
 				String ArrayInner[] = Inner.split(";");
 				//此处分离近期已有报告和未查过的报告
 				for(int i=0;i<ArrayInner.length;i++){
 					String report_id = "";  //报告编号
 					//爬虫参数
 					PageData data = new PageData();
 					String sour = ArrayInner[i];
 					String dest = ArrayIDS[i];
 					data.put("ID",dest);
 					data.putAll(pd);
 					indAppReService.updateCheck(data);
 					
 					///查询明细表需要的
	 	 			PageData detail = indAppReService.QueryDetail(dest);
	 	 			//向明细表中插入数据
	 	 			indAppReService.saveDetail(detail);
	 	 			
	 	 			//查询查询员登录名
	 	 			PageData queryUser = indAppReService.getQueryUserInfo(data);
	 	 			
	 	 			//查询客户信息
	 	 	 		PageData appInfo = indAppReService.getAppCheck(data);
	 	 	 		data.putAll(queryUser);
	 	 	 		data.putAll(appInfo);
	 	 	 		
	 	 	 		appInfo.put("LIMT_DATE", limt_date);
	 	 			//根据条件查询该客户在一定时间内是否被查询过
	 				appInfo = indAppReService.findByInfo(appInfo);
	 	 			if(appInfo!=null&&appInfo.get("ID")!=null){
	 	 				sour = String.valueOf(appInfo.get("ID"));
	 	 				report_id = String.valueOf(appInfo.get("REPORT_ID"));
	 	 			}
	 	 			if(sour=="2"||sour.equals("2")){  //人行查询

	 	 			}
 				}
 				
 				
 				for(int i=0;i<ArrayInner.length;i++){
 					String report_id = "";  //报告编号
 					//爬虫参数
 					PageData data = new PageData();
 					String sour = ArrayInner[i];
 					String dest = ArrayIDS[i];
 					data.put("ID",dest);
 					data.putAll(pd);
 					indAppReService.updateCheck(data);
 					
 					///查询明细表需要的
	 	 			PageData detail = indAppReService.QueryDetail(dest);
	 	 			//向明细表中插入数据
	 	 			indAppReService.saveDetail(detail);
	 	 			
	 	 			//查询查询员登录名
	 	 			PageData queryUser = indAppReService.getQueryUserInfo(data);
	 	 			
	 	 			//查询客户信息
	 	 	 		PageData appInfo = indAppReService.getAppCheck(data);
	 	 	 		data.putAll(queryUser);
	 	 	 		data.putAll(appInfo);
	 	 	 		
	 	 	 		appInfo.put("LIMT_DATE", limt_date);
	 	 			//根据条件查询该客户在一定时间内是否被查询过
	 				appInfo = indAppReService.findByInfo(appInfo);
	 	 			if(appInfo!=null&&appInfo.get("ID")!=null){
	 	 				sour = String.valueOf(appInfo.get("ID"));
	 	 				report_id = String.valueOf(appInfo.get("REPORT_ID"));
	 	 			}
		 	 			
 					if(sour=="2"||sour.equals("2")){  //人行查询
 		 	 			//调用线程，启动爬虫
 						WebServiceRunnable_Counter webServiceTask = new WebServiceRunnable_Counter(pd,"1",indAppReService,entAppReService,iDataSubmissionService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
 		 	 			executor.execute(webServiceTask);
 					}else{  //行内查询
 						PageData pd1 = new PageData();
 						try{
 							//更新行内/人行字段
 	 		 	 			pd1.put("INTERNAL", sour);
 	 		 	 			pd1.put("ID", dest);
 	 			 			indAppReService.updateInner(pd1);
 						}catch(Exception e){
 							logger.error(e.getMessage(),e);
 						}
 						//调用线程，启动爬虫
						WbqqInnerRunnable WbqqInnerTask = new WbqqInnerRunnable(pd1,sour,"1",report_id,indAppReService,entAppReService);
 				        executor.execute(WbqqInnerTask);
 					}
 				}
 			}
 			pd.put("msg", "ok");
 		}catch(Exception e){
 			logger.error(e.getMessage());
 			pd.put("msg", "no");
 		}
 		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 删除文件
	 * @param path
	 */
	private  void delFile(String path){
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
			logger.error("提交个人申请删除图片文件夹.delFile方法出错",e);
		}
	}
}
