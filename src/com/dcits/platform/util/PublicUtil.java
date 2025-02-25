package com.dcits.platform.util;

import java.net.InetAddress;
import java.net.UnknownHostException;

/** 
 * 说明：IP处理
 * 创建人：  
 * 修改时间：2014年9月20日
 * @version
 */
public class PublicUtil {
	private static Logger logger = Logger.getLogger(PublicUtil.class);
	public static void main(String[] args) {
		logger.debug("本机的ip=" + PublicUtil.getIp());
	}
	
	public static String getPorjectPath(){
		String nowpath = "";
		nowpath=System.getProperty("user.dir")+"/";
		
		return nowpath;
	}
	
	/**
	 * 获取本机访问地址
	 * @return
	 */
	public static String getIp(){
		String ip = "";
		try {
			InetAddress inet = InetAddress.getLocalHost();
			ip = inet.getHostAddress();
			//System.out.println("本机的ip=" + ip);
		} catch (UnknownHostException e) {
			logger.error(e.getMessage(),e);
		}
		
		return ip;
	}
	
}