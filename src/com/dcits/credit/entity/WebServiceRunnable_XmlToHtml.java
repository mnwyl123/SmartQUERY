package com.dcits.credit.entity;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.management.loading.PrivateClassLoader;

import org.openqa.selenium.server.browserlaunchers.Sleeper;

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.util.ClawerInterfaceServer;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.ObjectUtil;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.XmlParseUtil;
import com.dcits.credit.util.XmlToHtml;
import com.dcits.credit.util.web.WebServerXmlToH;
import com.dcits.credit.util.web.WebServiceServer;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileUtil;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;

public class WebServiceRunnable_XmlToHtml implements Runnable{

	private PageData pd;
    private IndAppReManager indAppReService;
    
    public WebServiceRunnable_XmlToHtml(PageData pd,IndAppReManager indAppReService){	
    	this.pd=pd;
    	this.indAppReService=indAppReService;   
    }
   
    public void run() { 
    	//调用解析方法   	
    	WebServerXmlToH.XMLToHtml(pd, indAppReService);	
	}

}
