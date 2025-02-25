package com.dcits.credit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.util.ClawerInterfaceServer;
import com.dcits.platform.util.PageData;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class WbqqRunnable implements Runnable{
    private final static Log logger = LogFactory.getLog(WbqqRunnable.class);
    private PageData pd;
    private String type;
    private IndAppReManager indAppReService;
    //private int taskNum;
	//private PersonCrawlerManager personCrawlerService;  
	//private IDataSubmissionService iDataSubmissionService;
	
    //public WbqqRunnable(PageData pd,IndAppReManager indAppReService,PersonCrawlerManager personCrawlerService,IDataSubmissionService iDataSubmissionService){
    	//this.taskNum=taskNum;
	public WbqqRunnable(PageData pd,String type,IndAppReManager indAppReService){	
	     this.pd=pd;
    	 this.type=type;
    	 this.indAppReService=indAppReService;
    	//this.personCrawlerService=personCrawlerService;
    	//this.iDataSubmissionService=iDataSubmissionService;
    }
    @Override  
    public void run() {  
		//WebCrawler webCrawler=new WebCrawler();
//    	ClawerInterfaceServer.WxSave(pd, type,indAppReService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
		//webCrawler.startCrawler(indAppReService,personCrawlerService,pd,iDataSubmissionService);
		logger.debug("爬虫完成"+new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
    }  
      
}  