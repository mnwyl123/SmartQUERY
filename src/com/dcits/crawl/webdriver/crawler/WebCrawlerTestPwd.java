package com.dcits.crawl.webdriver.crawler;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.openqa.selenium.WebDriver;

import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.util.NetSignUtil;
import com.dcits.crawl.util.PasswordOper;
import com.dcits.crawl.util.Util;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

/**
 * 由登录界面进入到信用报告查询界面
 * @author zhangyy
 *
 */
public class WebCrawlerTestPwd {

	private static Logger logger = Logger.getLogger(WebCrawlerTestPwd.class);

	//webdriver方式
	@SuppressWarnings("static-access")
	public static String getByWebDriver(PageData pd,CrawlIndAppReManager indAppReService){
		/**进入登录界面*/
		String pageCode="";
		String status="";
		String message="";
		String url = null;
		Response response = null;
		Map<String, String> cookies = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();
		try{	
			//登录页面			
			PageData web_user = new PageData();
			web_user.put("USERNAME", pd.getString("USERNAME"));
			PageData  webInfo = indAppReService.findWebCrawlerInfoByCertName(web_user);
			map.put("local_cpu", webInfo.getString("LOCAL_CPU"));
			map.put("local_disk", webInfo.getString("LOCAL_DISK"));
			map.put("local_network", webInfo.getString("LOCAL_NETWORK"));
			map.put("username", webInfo.getString("USER_CODE"));
			map.put("password", webInfo.getString("USER_PWD"));
			//对征信用户名进行数字签名
			web_user.put("reportMessage", webInfo.getString("USER_CODE"));
			web_user.put("subject", webInfo.getString("subject"));
			String sign = NetSignUtil.generateBondMsgSign(web_user);
			//放入请求参数中
			map.put("signinfo", sign);
			
			PageData serverInfo=new PageData();
			serverInfo = BaseController.getServerInfo();
			
			url = serverInfo.getString("URL_PER")+new Date().getTime();
			response = Util.queryContentOfCharset(url, map, cookies,Method.POST,"UTF-8");			
			//处理登录失败的情况
			if(response.statusCode() != 200){
				logger.info("登录系统时,网络请求异常" + response.statusCode());
				System.out.println("登录系统时,网络请求异常" + response.statusCode());
				return "登录系统时,网络请求异常";
			}
			if (response.body().contains("密码错误")) {
				logger.info("密码错误。  密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("密码错误。  密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				//如果密码错误，将人行账户状态置为0锁定状态
				pd.put("PERBANK_STATUS", "0");
				indAppReService.updateCreditStatus(pd);
				return "密码错误";
			}else if (response.body().contains("用户名不存在")) {
				logger.info("用户名不存在。 用户名："+ pd.getString("USERNAME")+" 密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("用户名不存在。 用户名："+ pd.getString("USERNAME")+" 密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				return "用户不存在";
			}else if (response.body().contains("帐号被停用")) {
				logger.info("帐号被停用。 用户名："+ pd.getString("USERNAME"));
				System.out.println("帐号被停用。 用户名："+ pd.getString("USERNAME"));
				return "帐号被停用";
			}else if (response.body().contains("用户被锁定")) {
				logger.info("用户被锁定。 用户名："+ pd.getString("USERNAME"));
				System.out.println("用户被锁定。 用户名："+ pd.getString("USERNAME"));
				return "用户被锁定";
			}else if (response.body().contains("密码已经过期")) {
				logger.info("******************密码过期******************");
				System.out.println("******************密码过期******************");
				return "密码已经过期";
			}else if (response.body().contains("机构代码错误")) {
				logger.info("机构代码错误。 机构代码："+ pd.getString("ORGCODE"));
				System.out.println("机构代码错误。 机构代码："+ pd.getString("ORGCODE"));
				return "机构代码错误";
			}else if(response.body().contains("证书验签失败")){
				logger.info("证书验签失败："+ pd.getString("USERNAME"));
				System.out.println("证书验签失败："+ pd.getString("USERNAME"));
				return "证书验签失败";
			}
			//登录成功
			logger.info(pd.getString("ID")+"登录成功...............................");		
			cookies = response.cookies();
			if(cookies!=null)
				message = "登录成功";
		}catch(Exception e){
			logger.info("密码测试异常");			
			logger.error(e.getMessage(),e);
		}

		return message;	
	}

	
	//判断页面是否跳转完成
	public static void getResult(String url,WebDriver dr){
		int i=0;
		while(true){
			if(i==2){  //登录失败
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
