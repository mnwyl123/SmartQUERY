package com.dcits.credit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

import net.sf.json.JSONObject;

import com.dcits.credit.service.dataSubmission.IDataSubmissionService;

public class WebServiceRunnable implements Runnable{
	private static Logger logger = Logger.getLogger(WebServiceRunnable.class);
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
    public static boolean flag = false;
	
    public WebServiceRunnable(PageData pd,String authType,IndAppReManager indAppReService,EntAppReManager entAppReService,IDataSubmissionService iDataSubmissionService
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
    	flag = false;
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
    	    //第三方接口不走爬虫
    		WebServiceServer.queryReportAndSave(pd, authType,indAppReService,entAppReService,iDataSubmissionService);
    	
    	}else{
    		//爬虫
    		ClawerInterfaceServer.WxSave(pd, authType,indAppReService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
    	}
		logger.debug("接口已经完成"+new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
    
    }
    
    public boolean saveExcutorInfo(String executor_type,String Type){
    	JSONObject json = JSONObject.fromObject(pd);
    	String pdStr = json.toString().replace("\"", "\\\""); 	
    	PageData excut = new PageData();
    	String id = UUID.randomUUID().toString();
    	excut.put("ID", id);
    	excut.put("executor_Type", executor_type);
    	excut.put("pdStr", pdStr);
    	excut.put("TYPE", Type);
		logger.debug("******************************pd_str**********************************");
		logger.debug(pdStr);
		logger.debug("******************************pd_str**********************************");
    	try {   		
			indAppReService.saveExcutorInfo(excut);
			return true;
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
    	return false;
    }
}
