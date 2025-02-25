package com.dcits.common;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * 实现动态数据源配置
 * 
 * @author meng.chunxia
 * 
 */
public class DynamicDataSource extends AbstractRoutingDataSource {

	protected Object determineCurrentLookupKey() {
		
		return DbContextHolder.getDbType();
	}

}
