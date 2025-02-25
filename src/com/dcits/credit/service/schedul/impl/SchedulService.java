package com.dcits.credit.service.schedul.impl;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.schedul.SchedulManager;

/** 
 * 定时器service
 * 创建人：wangwme
 * 创建时间：2019-01-21
 */
@Service("schedulService")
public class SchedulService implements SchedulManager{

	@Override
	public void test() {
		System.out.println("===================================");
	}
	
}

