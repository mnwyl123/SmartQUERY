package com.dcits.crawl.InterfaceServer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Queue;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.crawl.service.dataSubmission.IDataSubmissionService;
import com.dcits.crawl.webdriver.crawler.WebCrawlerTestPwd;
import com.dcits.crawl.webdriver.crawler.companyCredit.clawer_2.ComCertId;
import com.dcits.crawl.webdriver.crawler.companyCredit.clawer_2.ComWebCrawler;
import com.dcits.crawl.webdriver.crawler.personCredit.WebCrawler;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;

import net.sf.json.JSONObject;

/**
 * 个人征信信用卡中心接口 创建人：zhangyy 创建时间：2017-06-26
 */
//@Service("interfaceServerController")
//@Path("/ClawerServer")
public class InterfaceServerController extends BaseController {
	private static Logger logger = Logger.getLogger(InterfaceServerController.class);

	private CrawlIndAppReManager crawlIndAppReService;
	private PersonCrawlerManager crawlPersonCrawlerService;
	private IDataSubmissionService crawlDataSubmissionService;
	private CrawlEntAppReManager crawlEntAppReService;
	private CompanyCrawlerManager crawlCompanyCrawlerService;

	
	public InterfaceServerController(CrawlIndAppReManager crawlIndAppReService,PersonCrawlerManager crawlPersonCrawlerService, IDataSubmissionService crawlDataSubmissionService,
	    	 CrawlEntAppReManager crawlEntAppReService,CompanyCrawlerManager crawlCompanyCrawlerService){
		
    	this.crawlIndAppReService= crawlIndAppReService;
    	this.crawlPersonCrawlerService=crawlPersonCrawlerService;
    	this.crawlDataSubmissionService=crawlDataSubmissionService;
    	this.crawlEntAppReService=crawlEntAppReService;
    	this.crawlCompanyCrawlerService=crawlCompanyCrawlerService;
	}
	
	
	private static Queue<WebCrawler> PERSENQUEUE = new LinkedBlockingQueue<WebCrawler>(100);
	private static Queue<ComWebCrawler> COMQUEUE = new LinkedBlockingQueue<ComWebCrawler>(100);
	private static ThreadPoolExecutor comExecutor = null;
	// 个人
//	@POST
//	@Path("/queryPerson")
	public void queryPerson(PageData pd) {
//		JSONObject jsonData = new JSONObject();
		try {
//			BufferedReader reader = null;
//			// 读取请求结果
//			try {
//				reader = new BufferedReader(new InputStreamReader(is, "utf-8"));
//			} catch (UnsupportedEncodingException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			String lines = "";
//			try {
//				lines = reader.readLine();
//			} catch (IOException e1) {
//				logger.error(e1);
//			}
//			logger.info("lines" + "+++++++++++++++++++++++" + lines);
//			PageData pd = new PageData();
			// 验证参数(查询条件信息，查询ID)
//			jsonData = JSONObject.fromObject(lines);
			pd.put("CLIENT_NAME", pd.getString("CLIENT_NAME"));
			pd.put("CREDENTIALS_TYPE", pd.getString("CREDENTIALS_TYPE"));
			pd.put("CREDENTIALS_NO", pd.getString("CREDENTIALS_NO"));
			pd.put("QUERY_REASON", pd.getString("QUERY_REASON"));
			pd.put("USERNAME", pd.getString("USERNAME"));
			pd.put("ID", pd.getString("ID"));
			pd.put("QUERY_VERSION", pd.getString("QUERY_VERSION"));
			pd.put("QUERY_TYPE", pd.getString("QUERY_TYPE"));
			logger.info("验证参数完成" + "+++++++++++++++++++++++");
			try {
				// 为后续解析完成之后顺带获取其返回对应第三方接口json做准备
				PageData channelPd = crawlIndAppReService.findChannelInfoById(pd);
				if (channelPd != null && !channelPd.isEmpty()) {
					pd.put("CHANNEL_ID", channelPd.getString("CHANNEL_ID"));
					pd.put("CHANNEL_QUERY_NO", channelPd.getString("CHANNEL_QUERY_NO"));
					pd.put("QUERY_NO", channelPd.getString("CHANNEL_QUERY_NO"));
				}
				logger.info("为后续解析完成之后顺带获取其返回对应第三方接口json做准备完成" + "+++++++++++++++++++++++");
				// 审核通过，调用爬虫
				if(pd.getString("INTERFACE")!=null&&pd.getString("INTERFACE").equals("queryRequestFast")){
					pd.put("LEVEL", "1");
				}else{
					pd.put("LEVEL", "0");
				}
				String INCREMENT_ID = UuidUtil.get64UUID();
				pd.put("INCREMENT_ID", INCREMENT_ID);
				crawlIndAppReService.insertCompanySelectQueue(pd);
				
				//先确定线程池对象是否存在,存在直接创建线程,不存在先创建线程池
				if(comExecutor == null) {
					PageData comPoolPd = BaseController.getPropertiesByFileName("comThreadPoolConfig.properties");
					int corePoolSize = Integer.parseInt(comPoolPd.getString("crawlcorePoolSize"));
					int maximumPoolSize = Integer.parseInt(comPoolPd.getString("crawlmaximumPoolSize"));
					int keepAliveTime = Integer.parseInt(comPoolPd.getString("crawlkeepAliveTime"));
					int workQueueCount = Integer.parseInt(comPoolPd.getString("crawlworkQueueCount")); //100
					synchronized (InterfaceServerController.class){
						if(comExecutor == null) {
							comExecutor = new ThreadPoolExecutor(corePoolSize, maximumPoolSize, keepAliveTime, TimeUnit.SECONDS , new ArrayBlockingQueue(workQueueCount));
						}						
					}	
				}
				

				WebCrawler cw = new WebCrawler(pd,crawlIndAppReService,crawlEntAppReService,crawlCompanyCrawlerService,crawlDataSubmissionService,crawlPersonCrawlerService);
				comExecutor.execute(cw);
//				String pageBody = "";
//				WebCrawler personCraw = new WebCrawler();
//				InterfaceServerController.PERSENQUEUE.offer(personCraw);
//				while (WebCrawler.getFlag() == true) {
//					Thread.sleep(1000);
//				}
//				personCraw = InterfaceServerController.PERSENQUEUE.poll();
//				WebCrawler.setFlag(true);
//				// personCraw.startCrawler(indAppReService,personCrawlerService,pd,iDataSubmissionService);
//				pageBody = personCraw.getByWebDriver(pd, crawlPersonCrawlerService, crawlIndAppReService, crawlDataSubmissionService);
//				if (pageBody != "" && !pageBody.equals(pd.getString("ID"))) {
//					jsonData.put("html", pageBody);
//				}
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
		} catch (Exception e) {
			logger.error(e);
		}
//		logger.info("爬虫返回" + jsonData);
//		return jsonData;
	}

	// //企业
	// @POST
	// @Path("/queryCompany")
	public void queryCompany(PageData pd) {
		// JSONObject jsonData = new JSONObject();
		try {
			// BufferedReader reader=null;
			// try {
			// reader = new BufferedReader(new InputStreamReader(
			// is, "utf-8"));
			// } catch (UnsupportedEncodingException e1) {
			// logger.error(e1);
			// }
			// String lines="";
			// try {
			// lines = reader.readLine();
			// } catch (IOException e1) {
			// logger.error(e1);
			// }
			// // 读取请求结果
			// PageData pd = new PageData();

			// jsonData = JSONObject.fromObject(lines);
			// 验证参数
			pd.put("USER_ID", pd.getString("USER_ID"));
			pd.put("ID", pd.getString("ID"));
			pd.put("USERNAME", pd.getString("USERNAME"));
			if (("10").equals(pd.getString("TYPE"))) {
				// 中征码
				pd.put("signCode", pd.getString("CODE"));
			} else if (("20").equals(pd.getString("TYPE"))) {
				// 统一社会信用代码
				pd.put("uniformSocialCredCode", pd.getString("CODE"));
			} else if (("30").equals(pd.getString("TYPE"))) {
				// 组织机构代码
				pd.put("orgInstCode", pd.getString("CODE"));
			} else if (pd.getString("TYPE") != null && !("").equals(pd.getString("TYPE"))
					&& !("null").equals(pd.getString("TYPE"))) {
				// 其他证件类型
				pd.put("otherIdentityTypeID", pd.getString("TYPE"));// 其他证件类型
				pd.put("otherIdentityCode", pd.getString("CODE"));// 其他证件号码
			}
			pd.put("queryReasonID", pd.getString("QUERY_REASON"));
			try {
				// 为后续解析完成之后顺带获取其返回对应第三方接口json做准备
				PageData channelPd = crawlIndAppReService.findChannelInfoById(pd);
				if (channelPd != null && !channelPd.isEmpty()) {
					pd.put("CHANNEL_ID", channelPd.getString("CHANNEL_ID"));
					pd.put("CHANNEL_QUERY_NO", channelPd.getString("CHANNEL_QUERY_NO"));
					pd.put("QUERY_NO", channelPd.getString("CHANNEL_QUERY_NO"));
				}
				// 审核通过，调用爬虫
				//先将id与用户名关联的信息插入到表中,作为队列加锁使用
				crawlIndAppReService.insertCompanySelectQueue(pd);
				
				//先确定线程池对象是否存在,存在直接创建线程,不存在先创建线程池
				if(comExecutor == null) {
					PageData comPoolPd = BaseController.getPropertiesByFileName("comThreadPoolConfig.properties");
					int corePoolSize = Integer.parseInt(comPoolPd.getString("crawlcorePoolSize"));
					int maximumPoolSize = Integer.parseInt(comPoolPd.getString("crawlmaximumPoolSize"));
					int keepAliveTime = Integer.parseInt(comPoolPd.getString("crawlkeepAliveTime"));
					int workQueueCount = Integer.parseInt(comPoolPd.getString("crawlworkQueueCount"));
					synchronized (InterfaceServerController.class){
						if(comExecutor == null) {
							comExecutor = new ThreadPoolExecutor(corePoolSize, maximumPoolSize, keepAliveTime, TimeUnit.SECONDS , new ArrayBlockingQueue(workQueueCount));
						}						
					}	
				}
				
				ComWebCrawler cw = new ComWebCrawler(pd,crawlIndAppReService,crawlEntAppReService,crawlCompanyCrawlerService,crawlDataSubmissionService);
				comExecutor.execute(cw);
//				ComWebCrawler cw = new ComWebCrawler(pd);
//				InterfaceServerController.COMQUEUE.offer(cw);
//				while (ComWebCrawler.getFlag() == true) {
//					Thread.sleep(1000);
//				}
//				cw = InterfaceServerController.COMQUEUE.poll();
//				ComWebCrawler.setFlag(true);
//				pageBody = cw.startComCrawler(indAppReService, entAppReService, companyCrawlerService, cw.getPageData(),
//						iDataSubmissionService);
//				if (pageBody != "" && !pageBody.equals(pd.getString("ID"))) {
//					pd.put("html", pageBody);
//				}
			} catch (Exception e) {
				logger.error(e);
			}
		} catch (Exception e) {
			logger.error(e);
		}
		// return jsonData;
	}

	// 查询中证码
//	@POST
//	@Path("/queryLoanCardNo")
	public JSONObject queryLoanCardNo(InputStream is) {
		JSONObject jsonData = new JSONObject();
		try {
			BufferedReader reader = null;
			try {
				reader = new BufferedReader(new InputStreamReader(is, "utf-8"));
			} catch (UnsupportedEncodingException e1) {
				logger.error(e1);
			}
			String lines = "";
			try {
				lines = reader.readLine();
				// 读取请求结果
				PageData pd = new PageData();

				jsonData = JSONObject.fromObject(lines);
				// 验证参数
				pd.put("ORGCODE", String.valueOf(jsonData.get("ORGCODE")));
				pd.put("USERNAME", String.valueOf(jsonData.get("USERNAME")));
				pd.put("PASSWORD", String.valueOf(jsonData.get("PASSWORD")));
				// pd.put("USERID", String.valueOf(jsonData.get("USERID")));
				pd.put("SocialCredit", String.valueOf(jsonData.get("SocialCredit")));
				// pd.put("LoanCardNo",
				// String.valueOf(jsonData.get("LoanCardNo")));
				pd.put("SdepOrgCode", String.valueOf(jsonData.get("SdepOrgCode")));
				pd.put("RegisterType", String.valueOf(jsonData.get("RegisterType")));
				pd.put("RegisterCode", String.valueOf(jsonData.get("RegisterCode")));
				/*
				 * pd.put("SdepNationalTaxCode",
				 * String.valueOf(jsonData.get("SdepNationalTaxCode")));
				 * pd.put("SdeplandTaxCode",
				 * String.valueOf(jsonData.get("SdeplandTaxCode")));
				 */
				// 审核通过，调用爬虫
				// LoginSystem query = new LoginSystem();
				// jsonData = query.getWebInfo(pd);
				ComCertId comCertId = new ComCertId();
				jsonData = comCertId.getComCertID(crawlIndAppReService, crawlEntAppReService, pd);

			} catch (IOException e1) {
				logger.error(e1);
			}
		} catch (Exception e) {
			logger.error(e);
		}
		return jsonData;
	}

	// 个人
//	@POST
//	@Path("/pwdTest")
	public JSONObject pwdTest(InputStream is) {
		JSONObject jsonData = new JSONObject();
		try {
			BufferedReader reader = null;
			// 读取请求结果
			try {
				reader = new BufferedReader(new InputStreamReader(is, "utf-8"));
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String lines = "";
			try {
				lines = reader.readLine();
			} catch (IOException e1) {
				logger.error(e1);
			}
			PageData pd = new PageData();
			// 验证参数(查询条件信息，查询ID)
			jsonData = JSONObject.fromObject(lines);
			pd.put("USERNAME", jsonData.getString("USERNAME"));
			try {
				// 审核通过，调用爬虫
				WebCrawlerTestPwd testPwd = new WebCrawlerTestPwd();
				String message = testPwd.getByWebDriver(pd, crawlIndAppReService);
				jsonData.put("message", message);
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
		} catch (Exception e) {
			logger.error(e);
		}
		logger.info("爬虫返回" + jsonData);
		return jsonData;
	}
}
