package com.dcits.credit.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.ClawerInterfaceServer;
import com.dcits.credit.util.crawler.personCredit.WebCrawler;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;

public class WbqqInnerRunnable implements Runnable{
	private final static Logger logger = Logger.getLogger(WbqqInnerRunnable.class);
	private String flag;
	private PageData pd;
	private String internal;
	private String report_id;
	private IndAppReManager indAppReService;
	private EntAppReManager entAppReService;
	public static boolean poolflag = false;
	public WbqqInnerRunnable(PageData pd,String internal,String flag,String report_id,IndAppReManager indAppReService,EntAppReManager entAppReService){
		this.pd = pd;
		this.flag = flag;
		this.internal = internal;
		this.report_id = report_id;
		this.indAppReService = indAppReService;
		this.entAppReService = entAppReService;
		poolflag = false;
	}
    @Override  
    public void run() {  
    	CompressUtils.downAndUploadFile(pd, internal,flag,report_id,indAppReService,entAppReService);
		logger.debug("行内报告copy完成"+new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
    }  
}  