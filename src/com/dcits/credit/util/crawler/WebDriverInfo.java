package com.dcits.credit.util.crawler;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.DesiredCapabilities;

public class WebDriverInfo {

	//加载浏览器驱动
	public static WebDriver getWebDriver(){
		//IE
		System.setProperty("webdriver.ie.driver","exec/IEDriverServer.exe");
		DesiredCapabilities ieCapabilities = DesiredCapabilities.internetExplorer();
		ieCapabilities.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
		WebDriver dr = new InternetExplorerDriver(ieCapabilities);
		//谷歌
//		System.setProperty("webdriver.chrome.driver","exec/chromedriver.exe");
//		WebDriver dr = new ChromeDriver();
		//浏览器窗口最大化
		//	dr.manage().window().maximize();
		return dr;
	}
}
