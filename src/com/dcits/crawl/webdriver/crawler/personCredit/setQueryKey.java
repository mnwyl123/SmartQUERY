package com.dcits.crawl.webdriver.crawler.personCredit;

import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;

import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.webdriver.crawler.WaitTime;

/**
 * 信用报告查询界面，查询条件输入
 * @author zhangyy
 *
 */
public class setQueryKey {

	private static Logger logger = Logger.getLogger(setQueryKey.class);
	//触发查询事件
	public void ClickQuery(WebDriver dr,PageData pd,PersonCrawlerManager personCrawlerService,CrawlIndAppReManager indAppReService,String beforeUrl){
		//用户姓名
		dr.findElement(By.name("username")).sendKeys(pd.getString("CLIENT_NAME"));
		//证件类型
		List<WebElement> cerType = dr.findElements(By.name("certype"));
		for(WebElement cer : cerType){
			if(cer.getAttribute("value").equals(pd.getString("CREDENTIALS_TYPE"))){
				if(!cer.isSelected()){
					cer.click();
					Assert.assertTrue(cer.isSelected());
					break;
				}
			}
		}
		//证件号码
		dr.findElement(By.name("cercode")).sendKeys(pd.getString("CREDENTIALS_NO"));
		//查询原因
		List<WebElement> queryReason = dr.findElements(By.name("queryreason"));
		for(WebElement reson : queryReason){
			if(reson.getAttribute("value").equals(pd.getString("QUERY_REASON"))){
				if(!reson.isSelected()){
					reson.click();
					Assert.assertTrue(reson.isSelected());
					break;
				}
			}
		}
		//查询类型
		List<WebElement> idauthFlag = dr.findElements(By.name("idauthflag"));
		for(WebElement flag : idauthFlag){
			if(flag.getAttribute("value").equals(pd.getString("QUERY_TYPE"))){
				if(!flag.isSelected()){
					flag.click();
					Assert.assertTrue(flag.isSelected());
					break;
				}
			}
		}
		//信用报告版式
		List<WebElement> verType = dr.findElements(By.name("vertype"));
		for(WebElement ver : verType){
			if(ver.getAttribute("value").equals(pd.getString("QUERY_VERSION"))){
				if(!ver.isSelected()){
					ver.click();
					Assert.assertTrue(ver.isSelected());
					break;
				}
			}
		}
		
		//点击查询按钮
		Actions builder = new Actions(dr);
		//Query--精确查询；MQuery---模糊查询
		Action mouseOverQuery = builder.moveToElement(dr.findElement(By.name("Query"))).click().build();
		WaitTime.threadWait(3000);
		mouseOverQuery.perform();
		WaitTime.waitForLoad(dr);
		logger.info("正在生成报告");
		
		//等待页面加载完成
		WaitTime.waitLoadTime(dr,10);
		logger.info("报告生成完成");
		String currentHandle = dr.getWindowHandle();//当前主窗口句柄
		Set<String> handlesSet = dr.getWindowHandles();
		String otherHandle = "";
		for (String handle : handlesSet) {
			if (!currentHandle.equals(handle)) {
				otherHandle = handle;
				break;
			}
		}
		
		if (!"".equals(otherHandle)) {
			dr.switchTo().window(otherHandle);
			System.out.println(dr.getCurrentUrl());
			//进行页面信息爬虫
//			CrawlerInfo cl = new CrawlerInfo();
			//cl.crawlerInfo(dr,personCrawlerService,indAppReService,pd);
			dr.quit();
		}else{
			logger.info("报告获取失败!");
		}
	}
}
