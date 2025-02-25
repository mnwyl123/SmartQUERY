package com.dcits.credit.schedul;

import java.sql.DriverManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dcits.credit.service.EntObjectRemark.EntObjectManager;
import com.dcits.credit.service.personObjection.PersonObjectionManager;
import com.dcits.credit.service.personObjection.impl.PersonObjectionService;
import com.dcits.credit.service.schedul.SchedulManager;
   
   
public class SchedulListener implements ServletContextListener {  
   
    public void contextInitialized(ServletContextEvent sce) { 
//    	PersonObjectionManager service = (PersonObjectionManager) (new ClassPathXmlApplicationContext("classpath:spring/mvc-config.xml")).getBean("PersonObjectionService");
    	PersonObjectionManager service = (PersonObjectionManager) WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean("PersonObjectionService"); 
    	EntObjectManager entObjectService = (EntObjectManager) WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext()).getBean("entObjectService"); 
    	new SchedulManage(service,entObjectService);
    }  
    
    public void contextDestroyed(ServletContextEvent sce) {
    	try{
            while(DriverManager.getDrivers().hasMoreElements()){
                DriverManager.deregisterDriver(DriverManager.getDrivers().nextElement());
           }
        }catch(Exception e){
            e.printStackTrace();
        }
    }  
   
} 
