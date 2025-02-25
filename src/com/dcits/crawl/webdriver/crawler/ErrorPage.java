package com.dcits.crawl.webdriver.crawler;

public class ErrorPage {
	
	/**
	 * 对于404页面的处理
	 * @param str
	 */
   public static boolean bagPage(String str){
	   if("400 Bad request".equals(str.trim()) || str.trim().contains("504")){
		   System.out.println("访问超时");
		   return true;
	   }
	   return false;
   }
   
}
