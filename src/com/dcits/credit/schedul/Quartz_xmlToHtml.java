package com.dcits.credit.schedul;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import com.dcits.platform.util.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import com.dcits.credit.controller.rest.util.MyRejectedExecutionHandler;
import com.dcits.credit.entity.WebServiceRunnable_XmlToHtml;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

public class Quartz_xmlToHtml implements Job {
	private static Logger logger = Logger.getLogger(Quartz_xmlToHtml.class);
	@Autowired
	private IndAppReManager indAppReService;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	ThreadPoolExecutor executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize1")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize1")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime1")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue1"))),new MyRejectedExecutionHandler());
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		logger.info("*******************开始跑批*******************");
		try {
			PageData serverInfo = BaseController.getPoolInfo();
			String num = serverInfo.getString("workQueue1");
			String sql = "select ID,QUERY_NAME,TYPE FROM xml_to_html_table WHERE "
					+"rownum <= "+num+" order by QUERY_TIME";
			PageData pd = new PageData();
			pd.put("creatSql", sql);
			List<PageData> listPd = new ArrayList<>();
			listPd = indAppReService.selectInfo(pd);
			String currentdate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			currentdate = currentdate.substring(8, currentdate.length());
			String sdate=serverInfo.getString("sdate");
			String edate=serverInfo.getString("edate");
			String workQueue=serverInfo.getString("workQueue1");
			int queue = Integer.parseInt(workQueue);
			if((currentdate.compareTo(sdate)>=0 || currentdate.compareTo(edate)<=0) && listPd.size()>0) {
				for(PageData pd_tmp:listPd){
					//调线程
					WebServiceRunnable_XmlToHtml webServerXmlToH = new WebServiceRunnable_XmlToHtml(pd_tmp,indAppReService);
					executor.execute(webServerXmlToH);					
				}	
			}
			//删除历史表两天前的数据
			String deleteSql="delete from xml_to_html_table_his where sysdate-2>to_date(query_time,'yyyy-mm-dd hh24:mi:ss')";
			PageData pdSql = new PageData();
			pdSql.put("deleteSql", deleteSql);
			indAppReService.deleteInfo(pdSql);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		
	}
}
