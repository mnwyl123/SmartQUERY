package com.dcits.credit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.util.ClawerInterfaceServer;
import com.dcits.credit.util.web.WebServiceServer;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
/**
 * 柜面爬虫线程
 * @author hp
 *
 */
public class WebServiceRunnable_Counter implements Runnable{
	private static Logger logger = Logger.getLogger(WebServiceRunnable_Counter.class);
	private PageData pd;
	private String authType;
    private IndAppReManager indAppReService;
    private EntAppReManager entAppReService;
    private IDataSubmissionService iDataSubmissionService;
    
    private CrawlIndAppReManager crawlIndAppReService;
	private PersonCrawlerManager crawlPersonCrawlerService;
	private com.dcits.crawl.service.dataSubmission.IDataSubmissionService crawlDataSubmissionService;
	private CrawlEntAppReManager crawlEntAppReService;
	private CompanyCrawlerManager crawlCompanyCrawlerService;
	
    public WebServiceRunnable_Counter(PageData pd,String authType,IndAppReManager indAppReService,EntAppReManager entAppReService,IDataSubmissionService iDataSubmissionService
    		,CrawlIndAppReManager crawlIndAppReService,PersonCrawlerManager crawlPersonCrawlerService, com.dcits.crawl.service.dataSubmission.IDataSubmissionService crawlDataSubmissionService,
       	 CrawlEntAppReManager crawlEntAppReService,CompanyCrawlerManager crawlCompanyCrawlerService){	
    	this.pd=pd;
    	this.authType=authType;
    	this.indAppReService=indAppReService;
    	this.entAppReService=entAppReService;
    	this.iDataSubmissionService = iDataSubmissionService;
    	
    	this.crawlIndAppReService= crawlIndAppReService;
    	this.crawlPersonCrawlerService=crawlPersonCrawlerService;
    	this.crawlDataSubmissionService=crawlDataSubmissionService;
    	this.crawlEntAppReService=crawlEntAppReService;
    	this.crawlCompanyCrawlerService=crawlCompanyCrawlerService;
    }
    
    public void run() { 
//    	boolean isTownCompany = indAppReService.isTownCompany(pd.getString("USERNAME"));
    	String flag = "";
    	boolean type = true;
    	if(authType.equals("2")){
    		flag = "ComQueryType";//企业查询模式
    	}else{
    		flag = "QueryType";//个人查询模式
    	}
    	type = indAppReService.findQueryType(flag);
    	if(type){
    		//接口
    		WebServiceServer.queryReportAndSave(pd, authType,indAppReService,entAppReService,iDataSubmissionService);
    		logger.debug("通过接口方式查询-true"+type);
    	}else{
    		//爬虫   现在爬虫接口没有调通便于测试先使用接口方式测试20191203
    		ClawerInterfaceServer.WxSave(pd, authType,indAppReService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);//此处柜面全走爬虫系统  --20190416
    		//WebServiceServer.queryReportAndSave(pd, authType,indAppReService,entAppReService,iDataSubmissionService);
			logger.debug("通过爬虫方式查询-false"+type);
    	}
		logger.debug("接口已经完成"+new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
    }  
    
	
}
