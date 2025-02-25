package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_2;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.util.NetSignUtil;
import com.dcits.crawl.util.PasswordOper;
import com.dcits.crawl.util.Util;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONNull;
import net.sf.json.JSONObject;

public class ComCertId {
	
	private static Logger logger = Logger.getLogger(ComCertId.class);
	
	public JSONObject getComCertID(CrawlIndAppReManager indAppReService,CrawlEntAppReManager entAppReService,PageData pd){
		/**进入登录界面*/
		String url="";
		String status="";
		String message="";
		Response response = null;
		Response response1 = null;
		Map<String, String> cookies = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();		
		try {
			PageData serverInfo=new PageData();
			serverInfo = BaseController.getServerInfo();
			//一、登录页面
			PageData web_user = new PageData();
			web_user.put("type", "2");
			PageData  webInfo = new PageData();
			web_user.put("USERNAME", pd.getString("USERNAME"));			
			webInfo = indAppReService.findWebCrawlerInfoByCertName(web_user);
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
			url = serverInfo.getString("URL_COM")+new Date().getTime();
			response = Util.queryContentOfCharset(url, map, cookies,Method.POST,"UTF-8");
			//处理登录失败的情况
			if(response.statusCode() != 200){
				logger.info("登录系统时,网络请求异常" + response.statusCode());
				System.out.println("登录系统时,网络请求异常" + response.statusCode());
				return null;
			}
			if (response.body().contains("密码错误")) {
				logger.info("密码错误。  密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("密码错误。  密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				//如果密码错误，将人行账户状态置为0锁定状态
				pd.put("PERBANK_STATUS", "0");
				indAppReService.updateCreditStatus(pd);
				return null;
			}else if (response.body().contains("用户不存在")) {
				logger.info("用户不存在。 用户名："+ pd.getString("USERNAME")+" 密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				System.out.println("用户不存在。 用户名："+ pd.getString("USERNAME")+" 密码："+PasswordOper.decode(pd.getString("PASSWORD")));
				return null;
			}else if (response.body().contains("帐号被停用")) {
				logger.info("帐号被停用。 用户名："+ pd.getString("USERNAME"));
				System.out.println("帐号被停用。 用户名："+ pd.getString("USERNAME"));
				return null;
			}else if (response.body().contains("用户被锁定")) {
				logger.info("用户被锁定。 用户名："+ pd.getString("USERNAME"));
				System.out.println("用户被锁定。 用户名："+ pd.getString("USERNAME"));
				return null;
			}else if (response.body().contains("密码已经过期")) {
				logger.info("******************密码过期******************");
				System.out.println("******************密码过期******************");
				return null;
			}else if (response.body().contains("机构代码错误")) {
				logger.info("机构代码错误。 机构代码："+ pd.getString("ORGCODE"));
				System.out.println("机构代码错误。 机构代码："+ pd.getString("ORGCODE"));
				return null;
			}else if(response.body().contains("证书验签失败")){
				logger.info("证书验签失败："+ pd.getString("USERNAME"));
				System.out.println("证书验签失败："+ pd.getString("USERNAME"));
				return null;
			}
			//登录成功
			logger.info(pd.getString("USERNAME")+"登录成功...............................");
			cookies = response.cookies();
			//获取页面动态token
			url = serverInfo.getString("URL_TOKEN");
			response = Util.queryContentOfCharset(url, map, cookies,Method.GET,"UTF-8");
			JSONObject json_token =  JSONObject.fromObject(response.body());
			
			//获取企业ID getInstList
			url = serverInfo.getString("URL_CRET");
			map1.put("protocolID","");
			map1.put("entCertID","");
			map1.put("csrfToken",json_token.getString("token"));
			map1.put("backUrl","");
			if(pd.getString("SdepOrgCode") != null && !"".equals(pd.getString("SdepOrgCode"))){
				map1.put("orgInstCode",pd.getString("SdepOrgCode"));//组织机构代码
			}else if(pd.getString("SocialCredit") != null && !"".equals(pd.getString("SocialCredit"))){
				map1.put("uniformSocialCredCode",pd.getString("SocialCredit"));//统一社会信用代码
			}else if(pd.getString("RegisterType") != null && !"".equals(pd.getString("RegisterType")) && pd.getString("RegisterCode") != null && !"".equals(pd.getString("RegisterCode"))){
				PageData pDict_code = new PageData();
				//信用报告版本
				pDict_code.put("dict_name", "otherIdentityTypeID");
				pDict_code.put("o_code", pd.getString("RegisterType"));	
				PageData p_code=indAppReService.findWebCrawlerDictByCode(pDict_code);
				map1.put("otherIdentityTypeID",p_code.getString("C_CODE"));//其他身份标识类型
				map1.put("otherIdentityCode",pd.getString("RegisterCode"));//其他身份标识号码
			}
			response = Util.queryContentOfCharset(url, map1, cookies,Method.POST,"UTF-8");
			JSONObject json =  JSONObject.fromObject(response.body());
			
			if(json.get("companyList").equals(JSONNull.getInstance())){
				JSONObject failJson = new JSONObject();
				failJson.put("errorcode", "00");
				failJson.put("errormsg", "无该企业信息");
				return failJson;
			}else{
				JSONArray jsonArray =  (JSONArray) json.get("companyList");
				JSONObject json1 = (JSONObject) jsonArray.get(0);					
				
				url = serverInfo.getString("URL_CRET1");
				map1.put("entCertID", json1.getString("entCertId"));
				response = Util.queryContentOfCharset(url, map1, cookies,Method.POST,"UTF-8");
				String pageCode = response.body();
				//解析页面
				
				Document document = Jsoup.parse(pageCode);
				Elements table =  document.getElementsByTag("table");
				//存放返回结果数据
				JSONObject returnJson = new JSONObject();
				List<Map<String,String>> ListMap = new ArrayList<Map<String,String>>();
				if(table.get(0).text().contains("中征码")&&table.get(0).text().contains("机构信用代码")){
					Elements trs = table.get(0).select("tr");
					Map<String,String> pd1 = new HashMap<String,String>();
					pd1.put("OrgName", trs.get(0).select("td").text().trim());
					pd1.put("LoanCardNo", trs.get(1).select("td").text().trim());
					pd1.put("SocialCredit", trs.get(2).select("td").text().trim());//统一社会信用代码
					pd1.put("SdepOrgCode", trs.get(3).select("td").text().trim());//组织机构代码
					pd1.put("CreditCode", trs.get(4).select("td").text().trim());//机构信用代码
					pd1.put("BusinessNum", trs.get(5).select("td").text().trim());//工商注册号
					pd1.put("SocialGroupNo", trs.get(6).select("td").text().trim());//社会团体登记号
					pd1.put("PublicNum", trs.get(7).select("td").text().trim());//机关和事业单位登记号
					pd1.put("CivilNo", trs.get(8).select("td").text().trim());//民办非企业登记号
					pd1.put("Other", trs.get(9).select("td").text().trim());//其他
					pd1.put("FundNo", trs.get(10).select("td").text().trim());//基金会登记号
					pd1.put("ReligionNo", trs.get(11).select("td").text().trim());//宗教证书登记号
					pd1.put("SdeplandTaxCode", trs.get(12).select("td").text().trim());//纳税人识别号（地税）
					pd1.put("SdepNationalTaxCode", trs.get(13).select("td").text().trim());//纳税人识别号（国税）						
					ListMap.add(pd1);
					pd1.put("CLAWER_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					returnJson.element("resultData", JSONArray.fromObject(ListMap).toString().replace("null", "\"\""));	
					
					//数据入库
					entAppReService.saveLoanNo(pd1);
					returnJson.put("errorcode", "01");
				}
				return returnJson;			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
