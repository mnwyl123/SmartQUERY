package com.dcits.platform.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringUtil implements ApplicationContextAware{

	protected static ApplicationContext applicationContext = null;

	public static Object getBean(String beanName) {
		return applicationContext.getBean(beanName);
	}

	/**
	 * @param applicationContext
	 *            the applicationContext to set
	 */
	public void setApplicationContext(
			ApplicationContext applicationContext) {
		SpringUtil.applicationContext = applicationContext;
	}

	/**
	 * @return the applicationContext
	 */
	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

}
