package com.dcits.credit.controller.numReadAppReview;

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

import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.NumReadReview.NumReadManager;
import com.dcits.credit.service.QueryDateOperatorService.QueryDateOperatorManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.NumReadInterfaceUtil;
import com.dcits.credit.util.NumXmlParseUtil;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.UserUtil;
import com.dcits.credit.util.collectFileTransfer.CollectFileTransfer;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.UuidUtil;
import com.dcits.platform.util.role.RoleAuthFactory;




/** 
 * 类名称：NumReveiewController
 * 创建人：gaoshenga
 * 说明：数字解读审核
 * @version
 */
@Controller
@RequestMapping(value="/checkNumRead")
public class NumReveiewController extends BaseController {
	@Resource(name="numReadReService")
	private NumReadManager numReadReService;
	@Resource(name="personCrawlerService")
	private PersonCrawlerManager personCrawlerService;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="dataSubmissionService")
	private IDataSubmissionService iDataSubmissionService;
	@Resource(name="queryDateService")
	private QueryDateOperatorManager queryDateService;
	@Resource(name="entAppReService")
	private EntAppReManager entAppReService;
	ThreadPoolExecutor executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))));
	private Map<String,String> colOfTab = null;
	
	/**待审核信息列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listIndAppRe")
	public ModelAndView listIndAppRe(Page page){
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
			List<String> userOrgId = numReadReService.getUserOrgID(pd);
			//存放列表数据信息
			List<PageData> listInfo = new ArrayList<PageData>();
			if(userOrgId.size()>0){
				pd.put("ORG_ID", userOrgId.get(0).toString());
				page.setPd(pd);
				//查询待审核信息
				listInfo = numReadReService.listIndAppRe(page);
			}
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/NumReadReview/indAppReview_list");
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
 		try{
 			//查询用户申请部门编码
 	  		String DEPT_CODE = numReadReService.getUserDepart(pd);
 	 		//查询用户机构
 	  		String org_name = numReadReService.getUserOrg(pd);
 	 		//查询客户信息
 	 		PageData appInfo = numReadReService.getAppCheck(pd);
 	 		String ID = pd.getString("ID");
 	 		
 	 		//获得配置文件配置信息
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
 	 	        FtpUtil.downloadFtpFile(serverInfo.getString("IP"), serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"), Integer.parseInt(serverInfo.getString("port")), ftpPath, localPath, fileNameList); 
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
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
 		mv.setViewName("credit/NumReadReview/AppReview_Info");
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
	 			numReadReService.updateCheck(pd);
				return pd;
			}
			PageData appInfo = numReadReService.getAppCheck(pd);
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
			appInfo = numReadReService.findByInfo(appInfo);
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
// 	 			PageData appInfo = numReadReService.getAppCheck(pd);
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
// 				appInfo = numReadReService.findByInfo(appInfo);
// 	 			if(appInfo!=null&&appInfo.get("ID")!=null){
// 	 				internal = String.valueOf(appInfo.get("ID"));
// 	 				report_id = String.valueOf(appInfo.get("REPORT_ID"));
// 	 			}
// 	 			/*************end**************/
//
// 	 			//查询明细表需要的
// 	 			detail = numReadReService.QueryDetail(pd.getString("ID"));
// 	 			//向明细表中插入数据
// 	 			numReadReService.saveDetail(detail);
// 			}
//// 			审核不通过，更改流程状态表中审核人名称、审核时间、状态、审核不通过原因
// 			numReadReService.updateCheck(pd);
// 			
// 			//审核通过
// 	 		if((status=="02"||status.equals("02"))&&(internal=="2"||internal.equals("2"))){
// 	 			//查询查询员登录名
// 	 			PageData data = numReadReService.getQueryUserInfo(pd);
// 	 			pd.putAll(data);
// 	 			
// 	 			//调用线程，启动爬虫
// 	 			/*Thread crawStart = new ThreadCrawler(pd,true,numReadReService);
// 	 			crawStart.start();*/
// 	 			WbqqRunnable WbqqTask = new WbqqRunnable(pd,"1",numReadReService);
//			    executor.execute(WbqqTask);
// 	 		}else if((status=="02"||status.equals("02"))&&internal!="2"&&!internal.equals("2")){
//				try{
//					//更新行内/人行字段
//	 	 			pd.put("INTERNAL", internal);
//		 			numReadReService.updateInner(pd);
//				}catch(Exception e){
//					logger.error(e.getMessage(),e);
//				}
//				//行内查询
//				Thread innerCraw = new ThreadInnerCrawler(pd, internal,"1",report_id,numReadReService,entAppReService);
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
 		pd.put("QUERY_TIME", "");
 		try{
 			String internal = pd.getString("INTERNAL");
 			String report_id = "";  //报告编号
 			//查询明细表需要的
 			detail = numReadReService.QueryDetail(pd.getString("ID"));
 			//向明细表中插入数据
 			numReadReService.saveDetail(detail);
// 			审核不通过，更改流程状态表中审核人名称、审核时间、状态、审核不通过原因
 			numReadReService.updateCheck(pd);
 			//审核通过
 	 		if("2".equals(internal)){
 	 			//查询查询员登录名
// 	 			PageData data = numReadReService.getQueryInfo(pd);
// 	 			pd.putAll(data);
// 	 			data.put("REQ_REPORT", PersonWebSerUtil.webConcatPerson(data));
 	 			//通过人行接口查询报告
// 	 			WebServiceRunnable webServiceTask = new WebServiceRunnable(pd,"1",numReadReService,entAppReService);
// 	 			executor.execute(webServiceTask);
 	 		}else{
				try{
					//更新行内/人行字段
	 	 			pd.put("INTERNAL", internal);
		 			numReadReService.updateInner(pd);
				}catch(Exception e){
					logger.error(e.getMessage(),e);
				}
				//行内查询
//				Thread innerCraw = new ThreadInnerCrawler(pd, internal,"1",report_id,numReadReService,entAppReService);
//				innerCraw.start();
 	 		}
 		}catch(Exception e){
 			logger.error(e.getMessage(),e);
 		}
 		mv.setViewName("save_result");
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
		//文件名
		String FileName = "";
		PageData queryUser = new PageData();
		//申请人的ID
		PageData pdID = new PageData();
		String ReportData = "";
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
 			int a = 1;
 			if(null != IDS && !"".equals(IDS)&&null!=Inner&&!"".equals(Inner)){
 				//审核不通过，更改流程状态表中审核人名称、审核时间、状态、审核不通过原因
 				pd.put("STATUS", "02");
 				String ArrayIDS[] = IDS.split(",");
 				String ArrayInner[] = Inner.split(";");
 				List<PageData> list = new ArrayList<PageData>();
 				for(int i=0;i<ArrayInner.length;i++){
 					String report_id = "";  //报告编号
 					//爬虫参数
 					PageData data = new PageData();
 					String dest = ArrayIDS[i];
 					data.put("ID",dest);
 					data.putAll(pd);
 					//更新状态
 					numReadReService.updateCheck(data);
 					///查询拼接报文需要的数据
	 	 			PageData detail = numReadReService.QueryDetail(dest);
	 	 			//RequestId
	 	 			detail.put("REQUESTID", a);
	 	 			a++;
	 	 			ReportData += NumXmlParseUtil.CreatRequestStr(detail);
	 	 			//更新ID
	 	 			numReadReService.UpdateID(detail);
	 	 			list.add(detail);
	 				//查询查询员登录名
	 		 		queryUser = numReadReService.getQueryUserInfo(data);
 				}
 				//生成请求报文文件，并且返回文件名
 	 			FileName = NumXmlParseUtil.CreatFileTXT(ReportData);
 	 			for(int j=0;j<ArrayInner.length;j++){
 	 				String dest = ArrayIDS[j];
 	 				pdID.put("ID", dest);
 	 				pdID.put("FILENAME_REQUEST", FileName);
 	 				//更新文件名
 					numReadReService.UpdateFileName(pdID);
 	 			}
 			}
 			//将请求文件上传人行接口
 			String upload = CollectFileTransfer.upload(null);
 			//人行的用户名密码
 			PageData pAcc = new PageData();
 			pAcc = numReadReService.QueryAccInfo(queryUser);
 			PageData pdata = new PageData();
 			pdata.put("FILENAME", FileName);
 			pdata.putAll(pAcc);
 			pdata.putAll(queryUser);
 			String id=UuidUtil.get64UUID();
 			pdata.put("ID", id);
 			String reqReport = NumReadInterfaceUtil.CreatReport(pdata);//生成文件处理状态请求报文
 			numReadReService.SaveRequestInfo(pdata);//保存请求信息
 			String responseReport = NumReadInterfaceUtil.ResponseNumReadXml(reqReport);//返回查询文件处理状态结果报文
 			//解析报文信息
 			PageData pdReport = NumXmlParseUtil.parseXml(responseReport,id);//解析返回xml
 			//更新数字解读表信息
 			numReadReService.UpdateResponseInfo(pdReport);//得到文件名进行更新
 			String fileName = pdReport.getString("FileName");//拿到文件信息名
 			//调用人行接口 下载文件,得到文件地址
 			String strPath = CollectFileTransfer.download(fileName);
 			String strReponse = NumReadInterfaceUtil.ResponsePath(strPath);//返回的xml报文信息
 			List<PageData> pdXml = NumXmlParseUtil.XmlToListData(strReponse,FileName);//解析xml报文信息
 			//将返回数据保存数据库
 			try {
 				for(PageData pdList :pdXml){
 					numReadReService.UpdateResponseData(pdList);
 				}
 			} catch (Exception e) {
 				logger.error(e.getMessage());
 			}
 			//解析报文信息
// 			PageData pdReport = NumXmlParseUtil.parseXml(responseReport,id);//解析返回xml
 			
/* 			if(null != IDS && !"".equals(IDS)&&null!=Inner&&!"".equals(Inner)){
 				//审核不通过，更改流程状态表中审核人名称、审核时间、状态、审核不通过原因
 				pd.put("STATUS", "02");
 				String ArrayIDS[] = IDS.split(",");
 				String ArrayInner[] = Inner.split(";");
 				for(int i=0;i<ArrayInner.length;i++){
 					String report_id = "";  //报告编号
 					//爬虫参数
 					PageData data = new PageData();
 					String sour = ArrayInner[i];
 					String dest = ArrayIDS[i];
 					data.put("ID",dest);
 					data.putAll(pd);
 					//更新状态
 					numReadReService.updateCheck(data);
 					///查询拼接报文需要的数据
	 	 			PageData detail = numReadReService.QueryDetail(dest);
	 	 			//拼接报文
	 	 			NumXmlParseUtil.CreatFileTXT(list);
	 	 			//向明细表中插入数据
	 	 			numReadReService.saveDetail(detail);
	 	 			//查询查询员登录名
	 	 			PageData queryUser = numReadReService.getQueryUserInfo(data);
	 	 			//查询客户信息
	 	 	 		PageData appInfo = numReadReService.getAppCheck(data);
	 	 	 		data.putAll(queryUser);
	 	 	 		data.putAll(appInfo);
	 	 	 		appInfo.put("LIMT_DATE", limt_date);
	 	 			//根据条件查询该客户在一定时间内是否被查询过
	 				appInfo = numReadReService.findByInfo(appInfo);
	 	 			if(appInfo!=null&&appInfo.get("ID")!=null){
	 	 				sour = String.valueOf(appInfo.get("ID"));
	 	 				report_id = String.valueOf(appInfo.get("REPORT_ID"));
	 	 			}
		 	 			
 					if(sour=="2"||sour.equals("2")){  //人行查询
 		 	 			//调用线程，启动爬虫
// 						 WbqqRunnable WbqqTask = new WbqqRunnable(data,"1",numReadReService);
// 				        executor.execute(WbqqTask);
 					}else{  //行内查询
 						PageData pd1 = new PageData();
 						try{
 							//更新行内/人行字段
 	 		 	 			pd1.put("INTERNAL", sour);
 	 		 	 			pd1.put("ID", dest);
 	 			 			numReadReService.updateInner(pd1);
 						}catch(Exception e){
 							logger.error(e.getMessage(),e);
 						}
 						//调用线程，启动爬虫
//						WbqqInnerRunnable WbqqInnerTask = new WbqqInnerRunnable(pd1,sour,"1",report_id,numReadReService,entAppReService);
// 				        executor.execute(WbqqInnerTask);
 					}
 				}
 			}*/
 			pd.put("msg", "ok");
 		}catch(Exception e){
 			logger.error(e.getMessage());
 			//System.out.println(e);
 			pd.put("msg", "no");
 		}
 		return AppUtil.returnObject(pd, map);
	}
}
