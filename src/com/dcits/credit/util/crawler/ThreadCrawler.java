package com.dcits.credit.util.crawler;

import org.apache.log4j.Logger;

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.crawler.CompanyCrawlerManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.crawler.companyCredit.ComWebCrawler;
import com.dcits.credit.util.crawler.personCredit.CrawlerInfo;
import com.dcits.credit.util.crawler.personCredit.WebCrawler;
import com.dcits.platform.util.PageData;


public class ThreadCrawler extends Thread{
	private PersonCrawlerManager personCrawlerService;
	private IndAppReManager indAppReService;
	private CompanyCrawlerManager companyCrawlerService;
	private EntAppReManager entAppReService;
	private IDataSubmissionService iDataSubmissionService;
	private boolean flag = false;
	private PageData pd;
	public ThreadCrawler(EntAppReManager entAppReService,CompanyCrawlerManager companyCrawlerService,IndAppReManager indAppReService,PersonCrawlerManager perCrawlerService,PageData pd,boolean flag,IDataSubmissionService iDataSubmissionService){
		this.indAppReService = indAppReService;
		this.personCrawlerService = perCrawlerService;
		this.entAppReService = entAppReService;
		this.companyCrawlerService = companyCrawlerService;
		this.pd = pd;
		this.flag = flag;
		this.iDataSubmissionService = iDataSubmissionService;
	}
	
	public void run(){
		if(flag){ //个人爬虫
			//审核通过，调用爬虫
			WebCrawler personCraw = new WebCrawler();
			personCraw.startCrawler(indAppReService,personCrawlerService,pd,iDataSubmissionService);
		}else{ //企业爬虫
			ComWebCrawler cw = new ComWebCrawler();
			cw.startComCrawler(indAppReService,entAppReService,companyCrawlerService,pd,iDataSubmissionService);
		}
		
	}
}
