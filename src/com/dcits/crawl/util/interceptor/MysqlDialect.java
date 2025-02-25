package com.dcits.crawl.util.interceptor;

public class MysqlDialect extends Dialect {
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.mybatis.extend.interceptor.IDialect#getLimitString(java.lang.String,
	 * int, int)
	 */
	@Override
	public String getLimitString(String sql, int offset, int limit) {
		sql = sql.trim();
		StringBuffer pagingSelect = new StringBuffer(sql.length() + 100);
		pagingSelect.append(sql);
		pagingSelect.append(" limit " + offset + " ," + limit);
		return pagingSelect.toString();
	}   
}
