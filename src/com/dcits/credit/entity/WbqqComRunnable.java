package com.dcits.credit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.ClawerInterfaceServer;
import com.dcits.credit.util.crawler.personCredit.WebCrawler;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;

public class WbqqComRunnable implements Runnable{
    private static Logger logger = Logger.getLogger(WbqqComRunnable.class);
    private PageData pd;
    private String type;
    private IndAppReManager indAppReService;
	public WbqqComRunnable(PageData pd,String type,IndAppReManager indAppReService){	
	     this.pd=pd;
    	 this.type=type;
    	 this.indAppReService=indAppReService;
    }
    @Override  
    public void run() {  
//    	ClawerInterfaceServer.WxSave(pd, type,indAppReService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
		logger.debug("爬虫完成"+new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
    }  
      
}  