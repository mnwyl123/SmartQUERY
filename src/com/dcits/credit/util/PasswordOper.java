package com.dcits.credit.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.log4j.Logger;

import Decoder.BASE64Decoder;

import com.dcits.credit.util.crawler.personCredit.CrawlerInfo;

public class PasswordOper {
	private static Logger logger = Logger.getLogger(PasswordOper.class);
	@SuppressWarnings("static-access")
	public static void main(String[] args){
		String str="Aa123456";
		String dd = PasswordOper.encode(str);
		System.out.println("加密后："+dd);
		String cc = PasswordOper.decode("TExZeHh1bDAyNkA=");
		System.out.println("解密后："+cc);
	}
	
	//加密
	public static String encode(String str){
		if(str==null)
			return null;
		String res = "";
		try {
			res = new sun.misc.BASE64Encoder().encode(str.getBytes("GBK"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage());
			logger.info("加密失败");
		}
		return res;
	}
	
	
	public static String decode(String str){
		if(str==null)
			return null;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			byte[] b = decoder.decodeBuffer(str);
			return new String(b,"GBK");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage());
			logger.info("解密失败");
			return null;
		}
	}
}
