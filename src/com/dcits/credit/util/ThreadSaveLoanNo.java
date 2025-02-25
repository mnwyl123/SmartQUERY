package com.dcits.credit.util;

import java.util.List;
import com.dcits.credit.service.rest.CompanyInterfaceService;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;

//保存人行中证码查询结果
public class ThreadSaveLoanNo extends Thread{
	protected Logger logger = Logger.getLogger(ThreadSaveLoanNo.class);
	
	private CompanyInterfaceService CompanyService ;
	private List<PageData> listPd;
	public ThreadSaveLoanNo(List<PageData> listPd,CompanyInterfaceService CompanyService){
		this.CompanyService = CompanyService;
		this.listPd = listPd;
	}
	
	public void run(){
		for(int i=0;i<listPd.size();i++){
			try{
				CompanyService.saveLoanNo(listPd.get(i));
			}catch(Exception e){
				logger.error(e.getMessage(), e);
			}
		}
	}
}
