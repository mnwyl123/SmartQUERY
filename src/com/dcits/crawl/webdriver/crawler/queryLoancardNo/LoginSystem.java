package com.dcits.crawl.webdriver.crawler.queryLoancardNo;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.PasswordOper;
import com.dcits.crawl.util.Util;

import net.sf.json.JSONObject;

/**
 * 由登录界面进入到中证码查询界面
 * @author zhangyy
 * 01-正常  02-查询异常 03-配置文件读取异常 04-人行查询失败 07-密码错误/用户不存在 08-账号被停用 09-账号被锁定 10-密码过期 11-机构代码错误
 * 
 */
public class LoginSystem {

	private static Logger logger = Logger.getLogger(LoginSystem.class);
		//main方法
		public static void main(String[] args){
			PageData pd = new PageData();
			/*//调用爬虫
			JSONObject json = getWebInfo(pd);
			JSONArray arr = JSONArray.fromObject(json.getString("resultData"));
			for(int i=0;i<arr.size();i++){
				System.out.println(arr.getJSONObject(i).getString("SdepOrgCode"));
			}*/
		}

	//登录系统及中间页面处理
	public static JSONObject getWebInfo(PageData pd){
		JSONObject jsonReturn = new JSONObject();
		String ipStr = "";
		try{
			//读取配置文件
			ipStr = BaseController.getServerInfo().getString("URL3");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			jsonReturn.put("errorcode", "02");
			jsonReturn.put("errormsg", "配置文件读取异常");
			logger.debug("查看报告返回报文："+jsonReturn);
			return jsonReturn;
		}
		
		Response response = null;
		Map<String, String> cookies = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		try {
			//登陆
			logger.info("查询中证码登录...........");
			map.put("orgCode", pd.getString("ORGCODE"));
			map.put("userid", pd.getString("USERNAME"));
			map.put("password", PasswordOper.decode(pd.getString("PASSWORD")));
			String url = ipStr + "logon.do";
			response = Util.queryContentOfCharset(url, map, cookies,Method.POST,"GBK");
			if(response.statusCode() != 200){
				logger.info("登录系统时,网络请求异常" + response.statusCode());
				jsonReturn.put("errorcode", "04");
				jsonReturn.put("errormsg", "人行连接超时");
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}
			if (response.body().contains("密码错误")) {
				logger.info("密码错误。  密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "密码错误");
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}else if (response.body().contains("用户不存在")) {
				logger.info("用户不存在。 用户名："+ pd.getString("USERNAME")+" 密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				jsonReturn.put("errorcode", "07");
				jsonReturn.put("errormsg", "用户不存在");
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}else if (response.body().contains("帐号被停用")) {
				logger.info("帐号被停用。 用户名："+ pd.getString("USERNAME"));
				jsonReturn.put("errorcode", "08");
				jsonReturn.put("errormsg", "帐号被停用");
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}else if (response.body().contains("用户被锁定")) {
				logger.info("用户被锁定。 用户名："+ pd.getString("USERNAME"));
				jsonReturn.put("errorcode", "09");
				jsonReturn.put("errormsg", "用户被锁定");
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}else if (response.body().contains("密码已经过期")) {
				logger.info("******************密码过期******************");
				jsonReturn.put("errorcode", "10");
				jsonReturn.put("errormsg", "密码已经过期");
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}else if (response.body().contains("机构代码错误")) {
				logger.info("机构代码错误。 机构代码："+ pd.getString("ORGCODE"));
				jsonReturn.put("errorcode", "11");
				jsonReturn.put("errormsg", "机构代码错误");
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}
			logger.info("查询中证码登录成功...............................");
			cookies = response.cookies();
			url = ipStr + "orgBaseInfoQueryOnlineAction.do?typecode=loacard";
			map.clear();
			
			//机构信用代码
			if(pd.get("CreditCode")!=null&&!"null".equals(String.valueOf(pd.get("CreditCode")))){
				map.put("creditcode", pd.getString("CreditCode"));
			}else{
				map.put("creditcode", "");
			}
			
			//中征码
			if(pd.get("LoanCardNo")!=null&&!"null".equals(String.valueOf(pd.get("LoanCardNo")))){
				map.put("loancardno", pd.getString("LoanCardNo"));
			}else{
				map.put("loancardno", "");
			}
			//组织机构代码
			if(pd.get("SdepOrgCode")!=null&&!"null".equals(String.valueOf(pd.get("SdepOrgCode")))){
				map.put("sdeporgcode", pd.getString("SdepOrgCode"));
			}else{
				map.put("sdeporgcode", "");
			}
			//登记注册类型
			if(pd.get("RegisterType")!=null&&!"null".equals(String.valueOf(pd.get("RegisterType")))){
				map.put("registertype", pd.getString("RegisterType"));
			}else{
				map.put("registertype", "");
			}
			//登记注册号
			if(pd.get("RegisterCode")!=null&&!"null".equals(String.valueOf(pd.get("RegisterCode")))){
				map.put("registercode", pd.getString("RegisterCode"));
			}else{
				map.put("registercode", "");
			}
			//纳税人识别号（国税）
			if(pd.get("SdepNationalTaxCode")!=null&&!"null".equals(String.valueOf(pd.get("SdepNationalTaxCode")))){
				map.put("sdepnationaltaxcode", pd.getString("SdepNationalTaxCode"));
			}else{
				map.put("sdepnationaltaxcode", "");
			}
			//纳税人识别号（地税）
			if(pd.get("SdeplandTaxCode")!=null&&!"null".equals(String.valueOf(pd.get("SdeplandTaxCode")))){
				map.put("sdeplandtaxcode", pd.getString("SdeplandTaxCode"));
			}else{
				map.put("sdeplandtaxcode", "");
			}
			//查询原因
			map.put("queryreason", "3");
			map.put("attribute", "0");
			map.put("searchType", "1");
			map.put("type", "");
			map.put("typecode", "loacard");
			
			try{
				response = Util.queryContentOfCharset(url,  map, cookies,Method.POST,"GBK");
				if(response.statusCode() != 200){
					logger.info("中证码查询失败,网络请求异常" + response.statusCode());
					jsonReturn.put("errorcode", "04");
					jsonReturn.put("errormsg", "中证码查询失败,网络请求异常");
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
			}catch(Exception e){
				logger.info("中证码查询失败，页面跳转失败" + response.statusCode());
				jsonReturn.put("errorcode", "04");
				jsonReturn.put("errormsg", "中证码查询失败,页面跳转失败");
				logger.debug("查看报告返回报文："+jsonReturn);
				return jsonReturn;
			}
			try{
				//爬取页面数据
				/*WebDriver dr = WebDriverInfo.getWebDriver();
				String url = "file:///C:/Users/HP/Desktop/Info/02.html";
				dr.get(url);
				WaitTime.waitForLoad(dr);
				String pageCode = dr.getPageSource();
				dr.quit();*/
				Document document = Jsoup.parse(response.body());
				if(document.toString().contains("机构信用代码")&&document.toString().contains("组织机构代码")){
					jsonReturn = new QueryData().crawlerInfo(document);
					//正在爬取
					if(jsonReturn.size()==0){
						JSONObject jsonReturn1 = new JSONObject();
						jsonReturn1.put("errorcode", "02");
						jsonReturn1.put("errormsg", "查询异常");
						logger.debug("查看报告返回报文："+jsonReturn1);
						return jsonReturn1;
					}else{
						//正常获取
						jsonReturn.put("errorcode", "01");
						jsonReturn.put("errormsg", "查询正常");
						logger.debug("查看报告返回报文："+jsonReturn);
						return jsonReturn;
					}
				}else if(document.toString().contains("系统中无此中征码信息")){
					jsonReturn.put("errorcode", "13");
					jsonReturn.put("errormsg", "系统中无此中征码信息");
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}else{
					jsonReturn.put("errorcode", "14");
					jsonReturn.put("errormsg", "输入的查询编码不正确");
					logger.debug("查看报告返回报文："+jsonReturn);
					return jsonReturn;
				}
			}catch(Exception e){
				jsonReturn.put("errorcode", "04");
				jsonReturn.put("errormsg", "中证码查询失败");
				logger.debug("查看报告返回报文："+jsonReturn);
				logger.info(e);
				return jsonReturn;
			}
			
		} catch (Exception e) {
			jsonReturn.put("errorcode", "04");
			jsonReturn.put("errormsg", "中证码查询失败");
			logger.debug("查看报告返回报文："+jsonReturn);
			logger.info(e);
			return jsonReturn;
		}
	}
}
