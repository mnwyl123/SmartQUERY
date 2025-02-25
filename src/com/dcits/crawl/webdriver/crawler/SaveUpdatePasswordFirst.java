package com.dcits.crawl.webdriver.crawler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.PasswordOper;
import com.dcits.crawl.util.Util;
import com.dcits.crawl.util.XmlParseUtil;

import net.sf.json.JSONObject;

public class SaveUpdatePasswordFirst {

	private static Logger logger = Logger.getLogger(SaveUpdatePasswordFirst.class);
	
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		String pass = PasswordOper.decode("TFZVbXdraDI0OSo=");
		System.out.println(pass);
		
		String pageCode = "修改密码成功";
		System.out.println(pageCode.replace("\\u", "").toString());
		
		/*String pageCode = XmlParseUtil.readXmlFile("C:/Users/hp/Desktop/修改密码页.txt", "UTF-8");
		Document document = Jsoup.parse(pageCode);
		Elements eles = document.getElementsByAttributeValue("type", "hidden");
		System.out.println(eles.get(2).val());*/
	}

	public static String updatePWD(CrawlIndAppReManager indAppReService,PageData pd,Response responseUpPass){
		logger.info(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"**********密码修改开始*********");
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"**********密码修改开始*********");
		String new_password = "";
		PageData serverInfo=new PageData();
		String msg = "";
		try {	
			serverInfo = BaseController.getServerInfo();
			//查到所有到期密码的人行用户
			PageData result = indAppReService.findCreditAcctInfoByCode(pd);
			int num=0;
			//当前用户
			String username = result.getString("USERNAME");
			//当前密码
			String current_password = result.getString("CURRENT_PASSWORD");
			String oldPwd = PasswordOper.decode(current_password);
			//密码编号
			String pwd_code = result.getString("PWD_CODE");
			int pwd_int;
			if(pwd_code==null||("").equals(pwd_code)||("100").equals(pwd_code)){
				num++;
				pwd_code = String.valueOf(num);
			}else{
				pwd_int = Integer.parseInt(pwd_code);
				pwd_int++;
				pwd_code = String.valueOf(pwd_int);
			}
			//获取数据库中预存的密码根据密码编号
			result.put("pwd_code", pwd_code);
			PageData result_pwd = indAppReService.findPrePassByCode(result);
		    new_password=PasswordOper.decode(result_pwd.getString("PASSWORD"));
			Response response = null;	
			String url = "";
			Map<String, String> map = new HashMap<String, String>();
			Map<String, String> cookies = new HashMap<String, String>();	
			cookies = responseUpPass.cookies();
		    //getToken
		    url=serverInfo.getString("URL_TOKEN");
		    response = Util.queryContentOfCharset(url, map, cookies,Method.GET,"UTF-8");
		    JSONObject json =  JSONObject.fromObject(response.body());
		    //第一次修改密码页面
		    Document document = Jsoup.parse(responseUpPass.body());
			Elements eles = document.getElementsByTag("input");
			String backUrl = eles.get(0).val();
			String userID = eles.get(1).val();
		    //修改密码
		    url=serverInfo.getString("URL_FIRSTUPDATEPASSWORD");
			map.put("backUrl",backUrl );
			map.put("userID", userID);
			map.put("oldPassword", oldPwd);
			map.put("password", new_password);
			map.put("confirmPassword", new_password);
			map.put("csrfToken", json.getString("token"));
			//执行修改密码
			response = Util.queryContentOfCharset(url, map, cookies,Method.POST,"UTF-8");
			String pageCode=response.body();
			//js中汉字转unicode:&#x4fee;&#x6539;&#x5bc6;&#x7801;&#x6210;&#x529f;-->修改密码成功
			if(pageCode.contains("&#x4fee;&#x6539;&#x5bc6;&#x7801;&#x6210;&#x529f;")){
				result_pwd.put("PREVIOUS_PASSWORD", PasswordOper.encode(oldPwd));
				result_pwd.put("CURRENT_PASSWORD", PasswordOper.encode(new_password));
				result_pwd.put("EXPIRES_DATE", serverInfo.getString("EXPIRES_DATE"));
				result_pwd.put("USER_CODE", username);
				//将新密码落库
				indAppReService.updateCreditPass(result_pwd);
				logger.info(username+"密码修改成功");
		    	System.out.println(username+"密码修改成功");
		    	msg = "修改密码成功";
		    	logger.info(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"************密码修改完成*************");
				System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"************密码修改完成*************");
			}else{
				logger.info(username+"密码修改提交失败");
		    	System.out.println(username+"密码修改提交失败");
		    	msg = "修改密码失败";
			}
		}catch(Exception e){
			e.printStackTrace();
			msg = "修改密码失败";
		}
		return msg;
	}
}
