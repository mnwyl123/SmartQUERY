package com.dcits.credit.schedul;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContextEvent;

import com.dcits.platform.util.Logger;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.creditReportInquiry.ImportInfoManager;
import com.dcits.credit.service.creditReportInquiry.impl.ImportInfoService;
import com.dcits.credit.service.personObjection.PersonObjectionManager;
import com.dcits.credit.service.schedul.SchedulManager;
import com.dcits.credit.util.web.WebServiceServer;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.PageData;
import com.google.common.util.concurrent.Runnables;

/**
 * 重要信息提示
 * @author wangwme
 *
 */
public class SchedulImportInfoTask implements Runnable{
	private static Logger logger = Logger.getLogger(SchedulImportInfoTask.class);
	private int week;
	ServletContextEvent sce;
	private ImportInfoManager importInfoService;
//	private PageData pd;
//    private IndAppReManager indAppReService;
//    private EntAppReManager entAppReService;
//	public SchedulImportInfoTask(ServletContextEvent sce,int schedualWeek){
//	this.sce = sce;
	public SchedulImportInfoTask(int schedualWeek,ServletContextEvent sce){
		this.week = schedualWeek;
		this.sce = sce;
	}
//	public SchedulImportInfoTask(int schedualWeek,PageData pd,IndAppReManager indAppReService,EntAppReManager entAppReService){
//		this.week = schedualWeek;
//		this.pd = pd;
//		this.indAppReService = indAppReService;
//		this.entAppReService = entAppReService;
//	}
	public void run() {
		boolean isEnt = false;
        if(week==week()){
        	isEnt = true;
        }
        importInfoService = (ImportInfoManager) WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean("ImportInfoService"); 
		try {			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			logger.debug("当前执行的时间是"+sdf.format(new Date()));
			//爬虫请求重要信息提示页面
			if(isEnt){
				//企业
				logger.debug("=============企业重要信息提示============");
				WebServiceServer.importInfo_test("2",importInfoService);//去人行查询重要信息提示
			}
			//个人
			logger.debug("=============个人重要信息提示============");
			WebServiceServer.importInfo_test("1",importInfoService);//去人行查询重要信息提示
			logger.debug("run "+System.currentTimeMillis());
		} catch (Exception e) {
			logger.error("定时任务线程错误！！！--------------------");
			logger.error(e.getMessage(),e);
		}
	}
	
	private void importInfo_test() {
		// TODO Auto-generated method stub
		
	}

	/**
     * 获取星期几
     * @return
     */
    public static int week(){
    	String[] arr = new String[]{"星期一","星期二","星期三","星期四","星期五","星期六","星期日"};
    	String week = DateUtil.getAfterDayWeek("0");
    	for(int i=0;i<arr.length;i++){
    		if(week.equals(arr[i])){
    			return i+1;
    		}
    	}
    	return 7;
    }
	
	
}
