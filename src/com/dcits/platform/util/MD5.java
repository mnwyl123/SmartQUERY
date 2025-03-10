package com.dcits.platform.util;

import java.security.MessageDigest;
/** 
 * 说明：MD5处理
 * 创建人：  
 * 修改时间：2014年9月20日
 * @version
 */
public class MD5 {
	private static Logger logger = Logger.getLogger(MD5.class);
	public static String md5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			str = buf.toString();
		} catch (Exception e) {
			logger.error(e.getMessage(),e);

		}
		return str;
	}
	public static void main(String[] args) {
		logger.debug(md5("31119@ .com"+"123456"));
		logger.debug(md5("mj1"));
	}
}
