package com.dcits.credit.util.crawler.companyCredit;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.junit.Assert;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.Select;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.crawler.CompanyCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.crawler.WaitTime;
import com.dcits.credit.util.crawler.WebDriverInfo;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

/**
 * 由登录界面进入到企业信用报告查询界面
 * @author zhangyy
 *
 */
public class ComWebCrawler {

	private static Logger logger = Logger.getLogger(ComWebCrawler.class);
	//main方法
	public static void main(String[] args){
		PageData pd = new PageData();
		//加载浏览器驱动
		WebDriver dr = WebDriverInfo.getWebDriver();
		pd.put("ID", "test");
		//用户登录
		EntAppReManager entAppReService = null;
		CompanyCrawlerManager companyCrawlerService = null;
		IndAppReManager indAppReService = null;
		IDataSubmissionService iDataSubmissionService =null;
		pd.put("USERNAME", "002002");
		pd.put("PASSWORD", "12345678");
		pd.put("ORGCODE", "79103141005");
		pd.put("ORG_CODE", "G1061010100736350U");
		pd.put("QUERY_REASON", "01");
		pd.put("URL", "http://9.88.47.3/webroottest/");
		//调用爬虫
		getWebInfo(dr,pd,entAppReService,companyCrawlerService,indAppReService,iDataSubmissionService);
	}
	
	public void startComCrawler(IndAppReManager indAppReService,EntAppReManager entAppReService,CompanyCrawlerManager companyCrawlerService,PageData pd,IDataSubmissionService iDataSubmissionService) {
		//加载浏览器驱动
		WebDriver dr = WebDriverInfo.getWebDriver();
		try{
			//读取对应人行登录用户密码
			PageData data = entAppReService.getOrgCode(pd);
			pd.putAll(data);
			//读取配置文件
			pd.put("URL", BaseController.getServerInfo().getString("URL1"));
			pd.put("IP", BaseController.getServerInfo().getString("IP"));
			pd.put("port", BaseController.getServerInfo().getString("port"));
			pd.put("LoginName", BaseController.getServerInfo().getString("LoginName"));
			pd.put("ftpPath", BaseController.getServerInfo().getString("ftpPath"));
			pd.put("LoginPass", PasswordOper.decode(BaseController.getServerInfo().getString("LoginPass")));
			//用户登录
			getWebInfo(dr,pd,entAppReService,companyCrawlerService,indAppReService,iDataSubmissionService);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}

	//登录系统及中间页面处理
	public static void getWebInfo(WebDriver dr,PageData pd,EntAppReManager entAppReService,CompanyCrawlerManager companyCrawlerService,IndAppReManager indAppReService,IDataSubmissionService iDataSubmissionService){
		//String url = pd.getString("URL");
		String url ="file:///C:/Users/HP/Desktop/Info/com.html";
		//String url = pd.getString("URL");
		//String url ="http://9.88.47.3/webroottest/";
		dr.get(url);
		WaitTime.waitForLoad(dr);
		try{
			/*//等待页面加载完成
			WaitTime.waitLoadTime(dr,1);
			//登录系统
			dr.findElement(By.name("orgCode")).sendKeys(pd.getString("ORGCODE"));
			dr.findElement(By.name("userid")).sendKeys(pd.getString("USERNAME"));
			dr.findElement(By.name("password")).sendKeys(PasswordOper.decode(pd.getString("PASSWORD")));
			Actions builder = new Actions(dr);
			Action mouseOverLogin = builder.moveToElement(dr.findElement(By.className("input-button"))).click().build();
			mouseOverLogin.perform();
			//判断是否跳转成功
			WaitTime.waitLoadTime(dr,1);
			
			//加载主页面
			//url = "http://9.88.47.3/webroottest/index_info.jsp?callstyle=message";
			dr.get(url);
			WaitTime.waitForLoad(dr);
			//等待页面加载完成
			WaitTime.waitLoadTime(dr,2);
			
			//点击事件，进行右侧页面切换
			dr.switchTo().frame(dr.findElement(By.name("contents")));
			Document document = Jsoup.parse(dr.getPageSource());
			List<Element> eles = document.getElementsByTag("TABLE");
			int rowNum = 0;
			for(int i=0;i<eles.size();i++){
				String str = eles.get(i).text();
				if(str.contains("一般企业信用报告")){
					rowNum = i;
					break;
				}
			}
			List<WebElement> Listtable = dr.findElements(By.tagName("TABLE"));
			List<WebElement> list = Listtable.get(rowNum).findElements(By.cssSelector("TR>TD>A"));
			for(int i=0;i<list.size();i++){
				String str = list.get(i).getText();
				if(str.contains("一般企业信用报告")){
					list.get(i).click();
					break;
				}
			}
			
			//获取右侧条件输入页面
			dr.switchTo().defaultContent();
			dr.switchTo().frame(dr.findElement(By.name("main")));
			
			if("10".equals(pd.getString("TYPE"))){
				//机构信用代码
				dr.findElement(By.name("creditcode")).sendKeys(pd.getString("CODE"));
			}
			if("11".equals(pd.getString("TYPE"))){
				//中征码
				dr.findElement(By.name("loancardno")).sendKeys(pd.getString("CODE"));
			}
			if("12".equals(pd.getString("TYPE"))){
				//组织机构代码
				dr.findElement(By.name("corpno")).sendKeys(pd.getString("CODE"));
			}
			List<String> listType = new ArrayList<String>();
			listType.add("01");
			listType.add("02");
			listType.add("03");
			listType.add("04");
			listType.add("05");
			listType.add("06");
			listType.add("07");
			listType.add("08");
			listType.add("99");
			if(listType.contains(pd.getString("TYPE"))){
				//登记注册类型
				WebElement cerType = dr.findElement(By.name("regitypecode"));
				new Select(cerType).selectByValue(pd.getString("TYPE"));
				//登记注册码
				dr.findElement(By.name("frgcorpno")).sendKeys(pd.getString("CODE"));
			}
			if("13".equals(pd.getString("TYPE"))){
				//纳税人识别号(国税)
				dr.findElement(By.name("gsregino")).sendKeys(pd.getString("CODE"));
			}
			if("14".equals(pd.getString("TYPE"))){
				//纳税人识别号(地税)
				dr.findElement(By.name("dsregino")).sendKeys(pd.getString("CODE"));
			}
			if(pd.get("QUERY_REASON")!=null){
				//查询版本
				WebElement QueryType = dr.findElement(By.name("type"));
				new Select(QueryType).selectByValue("20");
				WaitTime.waitTime(dr, 1);
				//查询原因
				WebElement QueryReason = dr.findElement(By.name("searchreason"));
				new Select(QueryReason).selectByValue(pd.getString("QUERY_REASON"));
				
				//点击查询按钮
				builder = new Actions(dr);
				Action mouseOverQuery = builder.moveToElement(dr.findElement(By.id("querybutton"))).click().build();
				mouseOverQuery.perform();
				WaitTime.threadWait(1000);
				//弹出确认框进行确认
				Alert alert = dr.switchTo().alert();
				alert.accept();
				WaitTime.waitForLoad(dr);
				//等待页面加载完成
				WaitTime.waitLoadTime(dr,3);
				
				try{
					//爬取页面数据
					new BeginCrawlerInfo().crawlerInfo(dr, entAppReService, companyCrawlerService, pd,indAppReService);
				}catch(Exception e){
					logger.error(e.getMessage());
				}
				
				dr.quit();
				//调用报文报送方法
				try{
					iDataSubmissionService.sendSubmissionData(pd.getString("ID"),"2");
				}catch(Exception e1){
					logger.info("报文报送异常!");
					logger.error(e1.getMessage());
				}
			}*/
			try{
				//爬取页面数据
				new BeginCrawlerInfo().crawlerInfo(dr, entAppReService, companyCrawlerService, pd,indAppReService);
			}catch(Exception e){
				logger.error(e.getMessage());
			}
			
			dr.quit();
		}catch(Exception e){
			logger.error(e.getMessage());
			dr.quit();
		}
	}
	//更新信息表中状态
	@Transactional
	public static void updateStatus(String flag,IndAppReManager indAppReService,String ID,String type){
		///更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
		try {
			PageData pd = new PageData();
			pd.put("ID", ID);
			//pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			//pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("STATUS", flag);
			//pd.put("REPORT_ID", reportId);
			//更新状态表
			indAppReService.updateStatus(pd);
		} catch (Exception e) {
			logger.info("更新状态失败");
			logger.error(e.getMessage());
		}
	}
}
