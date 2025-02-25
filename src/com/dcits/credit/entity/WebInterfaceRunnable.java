package com.dcits.credit.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.dcits.credit.controller.rest.test.Test_Out;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.PersonInterfaceWebSer.PersonWebSerManager;
import com.dcits.credit.service.rest.QueryComInterfaceManager;
import com.dcits.credit.util.interfaceCredit.WebInterfaceServer;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;

public class WebInterfaceRunnable implements Runnable{
	private static Logger logger = Logger.getLogger(Test_Out.class);
	private PageData pd;
	private String authType;
    private IndAppReManager indAppReService;
    private EntAppReManager entAppReService;
    private QueryComInterfaceManager queryComInterfaceService;
    private PersonWebSerManager personWebSerService;
	
    public WebInterfaceRunnable(PageData pd,String authType,IndAppReManager indAppReService,EntAppReManager entAppReService,QueryComInterfaceManager queryComInterfaceService,PersonWebSerManager personWebSerService){	
    	this.pd=pd;
    	this.authType=authType;
    	this.indAppReService=indAppReService;
    	this.entAppReService=entAppReService;
    	this.queryComInterfaceService=queryComInterfaceService;
    	this.personWebSerService=personWebSerService;
    }
    
    public void run() {  
    	WebInterfaceServer.interfaceReportSave(pd, authType, indAppReService, entAppReService,queryComInterfaceService,personWebSerService);
		logger.debug("接口已经完成"+new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));
    }  
	
}
