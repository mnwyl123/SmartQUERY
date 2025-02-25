package com.dcits.crawl.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.log4j.Logger;

import Decoder.BASE64Decoder;


public class PasswordOper {
	private static Logger logger = Logger.getLogger(PasswordOper.class);
	
	public static void main(String[] args){
		String str="ftpuser";
		String dd = PasswordOper.encode(str);
		System.out.println(dd);
		str = "eDAxMjM0NTY3OA==";
		String cc = PasswordOper.decode(str);
		System.out.println(cc);
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
	
	//解密
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
