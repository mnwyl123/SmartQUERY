package com.dcits.common;

/**
 * 线程设置使用哪个数据源
 * 
 * @author meng.chunxia
 * 
 */
public class DbContextHolder {
	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();

	public static void setDbType(String dbType) {
		contextHolder.set(dbType);
	}

	public static String getDbType() {
		return contextHolder.get();
	}

	public static void clearDbType() {
		contextHolder.remove();
	}
}
