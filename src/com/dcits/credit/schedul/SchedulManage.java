package com.dcits.credit.schedul;

import java.util.Calendar;
import java.util.Date;

import com.dcits.credit.service.EntObjectRemark.EntObjectManager;
import com.dcits.credit.service.personObjection.PersonObjectionManager;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;

public class SchedulManage {
	private static Logger logger = Logger.getLogger(SchedulManage.class);
	private long period = 24 * 60 * 60 * 1000; //间隔时间
	
//	private long period =  2 * 60 * 1000; //个人间隔时间 2分钟
	
	
    public SchedulManage(PersonObjectionManager service,EntObjectManager entObjectService) {  
//    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        logger.debug("当前开始执行时间为："+sdf.format(new Date()));
//        PageData pd = BaseController.getPropertiesByFileName("schedul.properties");
//        //延迟时间
//        long delay = delay(pd);
//		logger.debug("当前延迟时间为："+delay);
//        int schedualWeek = Integer.parseInt(String.valueOf(pd.get("WEEK"))); //配置每周几查询企业异议处理结果
////        ScheduledExecutorService importInfo_executor = Executors.newScheduledThreadPool(1);
////        importInfo_executor.scheduleAtFixedRate(new SchedulImportInfoTask(schedualWeek), delay, period, TimeUnit.MILLISECONDS);
////        importInfo_executor.scheduleAtFixedRate(new SchedulImportInfoTask(schedualWeek,sce), delay, period, TimeUnit.MILLISECONDS);
//        ScheduledExecutorService obj_executor = Executors.newScheduledThreadPool(1);
//		obj_executor.scheduleAtFixedRate(new SchedulObjTask(service,entObjectService), delay, period, TimeUnit.MILLISECONDS);
    } 
    
    /**
     * 延迟时间
     * @return
     */
    public static long delay(PageData pd){
    	long initDelay = 0;
    	String time = pd.getString("TIME");
    	
    	Calendar now = Calendar.getInstance();
    	now.setTime(new Date());
    	
    	Calendar dt= Calendar.getInstance();
    	dt.setTime(new Date());
    	dt.set(Calendar.HOUR_OF_DAY, Integer.parseInt(time.substring(0,2)));
    	dt.set(Calendar.MINUTE, Integer.parseInt(time.substring(3,5)));
    	dt.set(Calendar.MILLISECOND, Integer.parseInt(time.substring(6,8)));
    	
    	initDelay = dt.getTimeInMillis() - now.getTimeInMillis();
    	if(initDelay<0){
    		initDelay = 24 * 60 * 60 * 1000 - now.getTimeInMillis() + dt.getTimeInMillis();
    	}
    	return initDelay;
    }
    
    
	
}
