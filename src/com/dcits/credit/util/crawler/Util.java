package com.dcits.credit.util.crawler;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.dcits.platform.util.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class Util {
	private static Logger logger = Logger.getLogger(Util.class);
	/**
	 * 判断元素是否存在
	 * @param driver
	 * @param selector
	 * @return
	 */
	public static boolean doesWebElementExist(WebDriver driver, By selector) {
		try {
			driver.findElement(selector);
			return true;
		} catch (NoSuchElementException e) {
			return false;
		}
	}
	
	public static void getImage (WebDriver dr,By div){
		
		List<WebElement> background_images= dr.findElements(div);
		
		for(WebElement background_image:background_images){
			
			
			// 正则表达式规则
			String regEx="background-image: url\\(\"(.*)\"\\); background-position: (.*)px (.*)px;";
			// 编译正则表达式
		    Pattern pattern = Pattern.compile(regEx);
		    
		    Matcher matcher = pattern.matcher(background_image.getAttribute("style"));

			logger.debug(matcher.group(1));
			logger.debug(matcher.group(2));
			logger.debug(matcher.group(3));
		}
	}
}
