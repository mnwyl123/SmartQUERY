package com.dcits.platform.plugin.interceptor;

import com.dcits.platform.util.Logger;

public class PhoenixDialect extends Dialect {
	private static Logger logger = Logger.getLogger(PhoenixDialect.class);
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
		logger.debug("-----------------------------------------------------进入--------------------------------------------------------");
		pagingSelect.append(" limit " + limit + "  offset  " + offset);
		return pagingSelect.toString();
	}   
}
