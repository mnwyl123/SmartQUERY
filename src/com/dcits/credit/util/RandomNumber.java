package com.dcits.credit.util;

import java.util.Random;

import org.apache.log4j.Logger;

import com.dcits.credit.util.crawler.personCredit.CrawlerInfo;

/**
 * 生成随机数
 * @author HP
 *
 */
public class RandomNumber {
	private static Logger logger = Logger.getLogger(CrawlerInfo.class);
	//生成64位随机数
	public static String Create64Random(){
		StringBuffer sb = new StringBuffer();
		String res = "";
		Random r = new Random();
		for(int i=0;i<32;i++){
			int num = r.nextInt(10);
			sb.append(num);
		}
		try{
			res = new sun.misc.BASE64Encoder().encode(sb.toString().getBytes("GBK"));
		}catch(Exception e){
			logger.info("");
			logger.info(e.getMessage());
		}
		return res;
	}
}
