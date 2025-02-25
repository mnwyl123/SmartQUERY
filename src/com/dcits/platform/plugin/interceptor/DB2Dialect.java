package com.dcits.platform.plugin.interceptor;


public class DB2Dialect extends Dialect {

	@Override
	public String getLimitString(String sql, int offset, int limit) {
		 sql = sql.trim();
		 StringBuffer pagingSelect = new StringBuffer(sql.length() + 100);
		 pagingSelect.append("select a.* from ( ");
		 pagingSelect.append(" select row_number() over () as row_number,b.* from (");
		 pagingSelect.append(sql);
		 pagingSelect.append(" ) b ) a ");
		 pagingSelect.append(" where a. row_number >"+offset);
		 pagingSelect.append(" fetch first "+(offset + limit)+" rows only");
		  
		 return pagingSelect.toString();
	}

}
