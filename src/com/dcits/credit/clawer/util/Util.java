package com.dcits.credit.clawer.util;

import java.io.IOException;
import java.util.Map;

import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;

public class Util {
	
	private static String userAg = "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0";
	private static String accept = "image/jpeg, image/gif, image/pjpeg, application/x-ms-application, application/xaml+xml, application/x-ms-xbap, */*";
	
	/**
	 * jsoup
	 * @param url 请求地址
	 * @param map 请求参数
	 * @param cookies 
	 * @param med 请求方法
	 * @return
	 * @throws IOException
	 */
	
	public static Response queryContent(String url, Map<String, String> map,Map<String, String> cookies,Method med) throws IOException{
		Response response = Jsoup.connect(url).userAgent(userAg).data(map).method(med)
				.header("Accept", accept)
				.header("Accept-Encoding","gzip, deflate")
				.header("Accept-Language", "zh-CN")
				.header("Cache-Control","no-cache")
				.header("Connection", "keep-alive")
				.header("Host", "9.88.47.3")
//				.header("Host", "21.5.250.1")
				//.header("Content-Type","text/html; charset=gb2312")
				/*.header("Referer",refUrl)
				.header("Content-Length",len)*/
				.header("Content-Type","application/x-www-form-urlencoded")
				.header("UA-CPU","AMD64")
				.header("X-Requested-With","XMLHttpRequest")
				.cookies(cookies)
				.maxBodySize(0)
				.timeout(90000).ignoreContentType(true).execute();
		return response;
	}
	
	/**
	 * 可设置编码格式的jsoup请求
	 * @param url
	 * @param map
	 * @param cookies
	 * @param med
	 * @param charset
	 * @return
	 * @throws IOException
	 */
	public static Response queryContentOfCharset(String url, Map<String, String> map,Map<String, String> cookies,Method med,String charset) throws IOException{
		Response response = Jsoup.connect(url).userAgent(userAg).data(map).method(med)
				.header("Accept", accept)
				.header("Accept-Encoding","gzip, deflate")
				.header("Accept-Language", "zh-CN")
				.header("Cache-Control","max-age=0")
				.header("Connection", "keep-alive")
				.header("Host", "9.88.47.3")
//				.header("Host", "21.5.250.1")
				//.header("Content-Type","text/html; charset=gb2312")
				/*.header("Referer",refUrl)
				.header("Content-Length",len)*/
				.header("Upgrade-Insecure-Requests","1")
				.header("If-Modified-Since","Sun, 03 Mar 2019 09:54:14 GMT")
				.header("If-None-Match","5ed2-5832d9f69f487")
				.header("Content-Type","application/x-www-form-urlencoded")
				.header("UA-CPU","AMD64")
				.header("X-Requested-With","XMLHttpRequest")
				.cookies(cookies)
				.postDataCharset(charset)
				.maxBodySize(0)
				.timeout(90000).ignoreContentType(true).execute();
		return response;
	}
	/**
	 * 带参数的get请求
	 * @param url
	 * @param map
	 * @param cookies
	 * @param med
	 * @param charset
	 * @return
	 * @throws IOException
	 */
	public static Response queryContentByGet(String url,Map<String, String> cookies,Method med,String charset) throws IOException{
		Response response = Jsoup.connect(url).userAgent(userAg).method(med)
				.header("Accept", accept)
				.header("Accept-Encoding","gzip, deflate")
				.header("Accept-Language", "zh-CN")
				.header("Cache-Control","no-cache")
				.header("Connection", "keep-alive")
				.header("Host", "9.88.47.3")
//				.header("Host", "21.5.250.1")
				//.header("Content-Type","text/html; charset=gb2312")
				/*.header("Referer",refUrl)
				.header("Content-Length",len)*/
				.header("Content-Type","application/x-www-form-urlencoded")
				.header("UA-CPU","AMD64")
				.header("X-Requested-With","XMLHttpRequest")
				.cookies(cookies)
				.postDataCharset(charset)
				.maxBodySize(0)
				.timeout(90000).ignoreContentType(true).execute();
		return response;
	}
	  
	/**
	 * 可设置编码格式的jsoup请求excel
	 * @param url
	 * @param map
	 * @param cookies
	 * @param med
	 * @param charset
	 * @return
	 * @throws IOException
	 */
	public static Response queryExcelContentOfCharset(String url, Map<String, String> map, Map<String, String> cookies,Method med, String charset) throws IOException {
		userAg = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727)";
		Response response = Jsoup.connect(url).userAgent(userAg).data(map).method(med)
				.header("Accept", "*/*")
				.header("Accept-Encoding","gzip, deflate")
				.header("Accept-Language", "zh-CN")
				.header("Cache-Control","no-cache")
				.header("Connection", "Keep-Alive")
				.header("Host", "9.88.47.3")
//				.header("Host", "21.5.250.1")
				//.header("Content-Type","text/html; charset=gb2312")
				/*.header("Referer",refUrl)
				.header("Content-Length",len)*/
				.header("Content-Type","application/x-www-form-urlencoded")
				.header("UA-CPU","AMD64")
				.header("X-Requested-With","XMLHttpRequest")
				.cookies(cookies)
				.maxBodySize(0)
				.postDataCharset(charset)
				.timeout(90000).ignoreContentType(true).execute();
		return response;
	}
}
