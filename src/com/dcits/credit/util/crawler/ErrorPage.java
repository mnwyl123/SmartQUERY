package com.dcits.credit.util.crawler;


import com.dcits.platform.util.Logger;

public class ErrorPage {
	private final static Logger logger = Logger.getLogger(ErrorPage.class);
	/**
	 * 对于404页面的处理
	 * @param str
	 */
   public static boolean bagPage(String str){
	   if("400 Bad request".equals(str.trim()) || str.trim().contains("504")){
		   logger.error("访问超时");
		   return true;
	   }
	   return false;
   }
   
}
