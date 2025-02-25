package com.dcits.credit.util;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;

//行内报告查询
public class ThreadInnerCrawler extends Thread{
	private static Logger logger = Logger.getLogger(ThreadInnerCrawler.class);
	private String flag;
	private PageData pd;
	private String internal;
	private String report_id;
	private IndAppReManager indAppReService;
	private EntAppReManager entAppReService;
	public ThreadInnerCrawler(PageData pd,String internal,String flag,String report_id,IndAppReManager indAppReService,EntAppReManager entAppReService){
		this.pd = pd;
		this.flag = flag;
		this.internal = internal;
		this.report_id = report_id;
		this.indAppReService = indAppReService;
		this.entAppReService = entAppReService;
	}
	
	public void run(){
		CompressUtils.downAndUploadFile(pd, internal,flag,report_id,indAppReService,entAppReService);
		logger.debug("行内报告copy完成"+new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
	}
}
