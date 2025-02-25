package com.dcits.crawl.util.interceptor;

public abstract class Dialect {
	public static enum Type {
		MYSQL, ORACLE, DB2 ,PHOENIX
	}

	public abstract String getLimitString(String sql, int skipResults,
			int maxResults);
}
