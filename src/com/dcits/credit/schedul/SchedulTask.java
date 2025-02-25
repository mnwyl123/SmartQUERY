package com.dcits.credit.schedul;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.dcits.platform.util.Logger;


/**
 * 定时任务
 * @author wangwme
 *
 */
public class SchedulTask implements Runnable{
	private static Logger logger = Logger.getLogger(SchedulTask.class);
	private boolean isEnt;
	public SchedulTask(boolean isEnt){
		this.isEnt = isEnt;
	}
	
	public void run() {
		
		try {			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			logger.debug("当前执行的时间是"+sdf.format(new Date()));
			//爬虫请求重要信息提示页面
			if(isEnt){
				//企业
			}
			//个人
			
			logger.debug("run "+System.currentTimeMillis());
		} catch (Exception e) {
			logger.error("定时任务线程错误！！！--------------------");
			logger.error(e.getMessage(),e);
		}
	}
	
	
}
