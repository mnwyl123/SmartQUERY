package com.dcits.crawl.webdriver.crawler;

import java.io.File;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.dcits.platform.util.Logger;

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
		    
		    System.out.println(matcher.group(1));
		    System.out.println(matcher.group(2));
		    System.out.println(matcher.group(3));
		}
	}
	
	//删除本地文件及文件夹
	public static void deleteDirectory(String path){
		if(!path.endsWith(File.separator)){
			path = path+File.separator;
		}
		File dirFile = new File(path);
		if((!dirFile.exists())||(!dirFile.isDirectory())){
			return;
		}
		File[] files = dirFile.listFiles();
		for(int i=0;i<files.length;i++){
			//删除子文件
			if(files[i].isFile()){
				File file = new File(files[i].getAbsolutePath());
				if(file.exists()&&file.isFile()){
					try{
						file.delete();
					}catch(Exception e){
						logger.error("本地临时文件删除失败："+file.getName()+e.getMessage(),e);
					}
				}
			}else if(files[i].isDirectory()){//删除子目录
				deleteDirectory(files[i].getAbsolutePath());
			}
		}
		//删除当前目录
		try{
			dirFile.delete();
		}catch(Exception e){
			logger.error("本地临时文件删除失败："+dirFile.getName()+e.getMessage(),e);
		}
	}
	public static void main(String[] args){
		/*String path = "D:\\exec\\b250326789cc40de806c680092c8090f8386fe8cd8394bb4a7ec1bfbe028de58";
		deleteDirectory(path);
		System.out.println("删除完成");*/
	}
}
