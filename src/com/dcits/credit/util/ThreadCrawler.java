package com.dcits.credit.util;

import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.util.ClawerInterfaceServer;
import com.dcits.platform.util.PageData;


public class ThreadCrawler extends Thread{
	private boolean flag = false;
	private PageData pd;
	private IndAppReManager indAppReService;
	public ThreadCrawler(PageData pd,boolean flag,IndAppReManager indAppReService){
		this.pd = pd;
		this.flag = flag;
		this.indAppReService=indAppReService;
	}
	
	public void run(){
		if(flag){ //个人爬虫
			//启动爬虫
//	 		ClawerInterfaceServer.WxSave(pd, "1",indAppReService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
		}else{ //企业爬虫
			//启动爬虫
//	 		ClawerInterfaceServer.WxSave(pd, "2",indAppReService,crawlIndAppReService,crawlPersonCrawlerService, crawlDataSubmissionService, crawlEntAppReService,crawlCompanyCrawlerService);
		}
		
	}
}
