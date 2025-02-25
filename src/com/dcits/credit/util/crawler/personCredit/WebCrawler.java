package com.dcits.credit.util.crawler.personCredit;

import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.crawler.WaitTime;
import com.dcits.credit.util.crawler.WebDriverInfo;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

/**
 * 由登录界面进入到信用报告查询界面
 * @author zhangyy
 *
 */
public class WebCrawler {

	private static Logger logger = Logger.getLogger(WebCrawler.class);
	public static void main(String[] args){
		PageData pd = new PageData();
		//需要传递的相关信息
		pd.put("USERNAME", "xacb52");
		pd.put("PASSWORD", "x12345678");
		pd.put("CLIENT_NAME", "王洋");
		pd.put("CREDENTIALS_TYPE", "0");
		pd.put("CREDENTIALS_NO", "61273119790405001X");
		pd.put("QUERY_REASON", "01");
		pd.put("QUERY_TYPE", "0");
		pd.put("QUERY_VERSION", "30");
		//用户登录
		IndAppReManager indAppReService = null;
		PersonCrawlerManager personCrawlerService = null;
		IDataSubmissionService iDataSubmissionService = null;
		new WebCrawler().startCrawler(indAppReService,personCrawlerService,pd,iDataSubmissionService);
	}
	public void startCrawler(IndAppReManager indAppReService,PersonCrawlerManager personCrawlerService,PageData pd,IDataSubmissionService iDataSubmissionService) {
		pd.put("QUERY_TYPE", "0");
		pd.put("QUERY_VERSION", "30");
		//加载浏览器驱动
		WebDriver dr = WebDriverInfo.getWebDriver();
		
		try{
			//读取对应人行登录用户密码
			PageData LoginInfo = indAppReService.getLoginInfo(pd);
			pd.put("USERNAME", LoginInfo.getString("CREDIT_CODE"));
			pd.put("PASSWORD", PasswordOper.decode(LoginInfo.getString("CURRENT_PASSWORD")));
			
			//读取配置文件
			pd.put("URL", BaseController.getServerInfo().getString("URL"));
			pd.put("IP", BaseController.getServerInfo().getString("IP"));
			pd.put("port", BaseController.getServerInfo().getString("port"));
			pd.put("LoginName", BaseController.getServerInfo().getString("LoginName"));
			pd.put("ftpPath", BaseController.getServerInfo().getString("ftpPath"));
			pd.put("LoginPass", PasswordOper.decode(BaseController.getServerInfo().getString("LoginPass")));
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		
		//用户登录
		userLogin(dr,pd,personCrawlerService,indAppReService,iDataSubmissionService);
	}
	//进入登录界面
	private static void userLogin(WebDriver dr,PageData pd,PersonCrawlerManager personCrawlerService,IndAppReManager indAppReService,IDataSubmissionService iDataSubmissionService){
		//进入系统首页
		String url = "http://9.88.47.3/credituniontest/login.jsp";
		//String url = pd.getString("URL");
		//url = "file:///C:/Users/HP/Desktop/Info/01.htm";
		dr.get(url);
		WaitTime.waitForLoad(dr);
		//等待页面加载完成
		WaitTime.waitLoadTime(dr,5);
		
		//进入用户登录
		intoQuery(dr,pd,personCrawlerService,indAppReService,dr.getCurrentUrl(),iDataSubmissionService);
	}
	
	//用户登录并进入条件输入界面
	private static void intoQuery(WebDriver dr,PageData pd,PersonCrawlerManager personCrawlerService,IndAppReManager indAppReService,String beforeUrl,IDataSubmissionService iDataSubmissionService){
		/**进入登录界面*/
		try{
			//登录系统
			dr.findElement(By.name("userid")).sendKeys(pd.getString("USERNAME"));
			dr.findElement(By.name("password")).sendKeys(pd.getString("PASSWORD"));
			Actions builder = new Actions(dr);
			Action mouseOverLogin = builder.moveToElement(dr.findElement(By.name("B1"))).click().build();
			mouseOverLogin.perform();
			WaitTime.waitTime(dr, 2);
			//判断是否跳转成功
			getResult(beforeUrl,dr);

			/**直接跳过中间页面，访问报告*/
			 String url = "http://9.88.47.3/credituniontest/queryAction.do?username="+pd.getString("CLIENT_NAME")+"&certype="+
					 pd.getString("CREDENTIALS_TYPE")+"&cercode="+pd.getString("CREDENTIALS_NO")+"&queryreason="+
					 pd.getString("QUERY_REASON")+"&vertype="+pd.getString("QUERY_VERSION")+"&idauthflag="+
					 pd.getString("QUERY_TYPE")+"&policetype=0";
			//url = "file:///C:/Users/HP/Desktop/Info/04.HTML";
			dr.get(url);
			WaitTime.waitForLoad(dr);
			
			//等待页面加载完成
			WaitTime.waitLoadTime(dr,3);
			//进行页面信息爬虫
			CrawlerInfo cl = new CrawlerInfo();
			cl.crawlerInfo(dr,personCrawlerService,indAppReService,pd);
			
			//调用报文报送方法
			try{
				iDataSubmissionService.sendSubmissionData(pd.getString("ID"),"1");
			}catch(Exception e1){
				logger.info("报文报送异常!");
				logger.error(e1.getMessage());
			}
		}catch(Exception e){
			dr.quit();
			logger.error(e.getMessage());
		}
//		//点击菜单
//		Actions action = new Actions(dr);//divoCMenu0_0
//		action.moveToElement(dr.findElement(By.id("mMenu1"))).build().perform();//鼠标移动至一级菜单(待核准信息管理)
//		WaitTime.waitTime(dr, 5, By.id("mmenudiv1"));
//		//WaitTime.threadWait(2000);
//		WebElement ele = dr.findElement(By.id("mmenudiv1"));
//		List<WebElement> eleList = ele.findElements(By.tagName("td"));
//		WebElement menu = null;
//		for (WebElement webElement : eleList) {
//			if ("银行版信用报告查询".equals(webElement.getText().trim())) {
//				menu = webElement;
//				break;
//			}
//		}
//		
//		if (menu != null) {
//			action.moveToElement(menu).click().build().perform();//鼠标移动至一级菜单(待核准信息管理)
//			WaitTime.waitForLoad(dr);
//			WaitTime.waitTime(dr, 10);
//			//判断是否跳转成功
//			getResult(beforeUrl,dr);
//			//等待页面加载完成
//			WaitTime.waitLoadTime(dr,5);
//			logger.info("登录系统成功");
//			//触发精确查询事件
//			setQueryKey queryKey = new setQueryKey();
//			queryKey.ClickQuery(dr,pd,personCrawlerService,indAppReService,beforeUrl);
//		} else {
//			logger.info(dr.getCurrentUrl());
//			logger.info("页面加载");
//		}
	}

	//判断页面是否跳转完成
	public static void getResult(String url,WebDriver dr){
		int i=0;
		while(true){
			if(i==2){
				break;
			}
			if(url.equals(dr.getCurrentUrl())){
				WaitTime.threadWait(3000);
				i++;
			}else{
				break;
			}
		}
	}
}
