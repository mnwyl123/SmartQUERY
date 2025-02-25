package com.dcits.credit.schedul;
import org.quartz.spi.TriggerFiredBundle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.scheduling.quartz.SpringBeanJobFactory;


public class XmlToHtmlJobFactory extends SpringBeanJobFactory {

	@Autowired    
	private AutowireCapableBeanFactory beanFactory;     
    
    @Override    
    protected Object createJobInstance(TriggerFiredBundle bundle) throws Exception {    
        //调用父类的方法    
        Object jobInstance = super.createJobInstance(bundle);    
        //进行注入    
        beanFactory.autowireBean(jobInstance);    
        return jobInstance;    
    }  
	
}
