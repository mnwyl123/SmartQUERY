package com.dcits.crawl.webdriver.crawler;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

public class WaitTime {
	/**
	 * 判断页面是否加载完成
	 * @param driver
	 */
	public static void waitForLoad(WebDriver dr) {
	    ExpectedCondition<Boolean> pageLoad= new
	        ExpectedCondition<Boolean>() {
	            public Boolean apply(WebDriver driver) {
	            	//System.out.println(((JavascriptExecutor)driver).executeScript("return document.readyState"));
	                return ((JavascriptExecutor)driver).executeScript("return document.readyState").equals("complete");
	            }
	        };
	    WebDriverWait wait = new WebDriverWait(dr, 10);
	    wait.until(pageLoad);
	}
	
	/**
	 * @param i 等待时间
	 * @param dr
	 */
	public static void waitTime(WebDriver dr,int i){
		dr.manage().timeouts().implicitlyWait(i, TimeUnit.SECONDS);// 此处默认等待i秒
	}
	
	/**
	 * @param b 等待加载元素
	 * @param i 等待时间
	 * @param dr
	 */
	public static void waitTime(WebDriver dr,int i, final By b){
		WebDriverWait wait = new WebDriverWait(dr,i); 
		wait.until(new ExpectedCondition<WebElement>() {
			@Override
			public WebElement apply(WebDriver d) {
				return d.findElement(b);
			}
		}).isDisplayed();
	}
	
	/**
	 * 线程等待
	 */
	public static void threadWait(int i){
		try {
			Thread.sleep(i);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//判断页面是否加载完成，若加载完成，则等待i秒
	public static void waitLoadTime(WebDriver dr,int i){
		 ExpectedCondition<Boolean> pageLoad= new
			ExpectedCondition<Boolean>() {
				 public Boolean apply(WebDriver driver) {
				       //System.out.println(((JavascriptExecutor)driver).executeScript("return document.readyState"));
				      return ((JavascriptExecutor)driver).executeScript("return document.readyState").equals("complete");
				  }
			 };
		 WebDriverWait wait = new WebDriverWait(dr, 10);
		 wait.until(pageLoad);
		 //页面加载完成后等待i秒
		 dr.manage().timeouts().implicitlyWait(i, TimeUnit.SECONDS);// 此处默认等待i秒
	}
}
