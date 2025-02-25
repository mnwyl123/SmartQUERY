package com.dcits.crawl.webdriver.crawler;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

public class ExecuteJs {

	/**
	 * 弹出提示框
	 * @param dr
	 */
	public static void executeAlert(WebDriver dr,String str){
		JavascriptExecutor js = (JavascriptExecutor)dr;
		js.executeScript("alert(\""+str+"\")");
	}
	
	/**
	 * 测试未通过
	 * @param dr
	 */
	public static void executeJs(WebDriver dr){
		JavascriptExecutor js = (JavascriptExecutor)dr;
		js.executeScript("geetest.5.10.10.js");
	}
}
