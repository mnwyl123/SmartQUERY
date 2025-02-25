package com.dcits.credit.util;

import java.util.List;

import com.dcits.credit.service.numRead.NumReadService;
import com.dcits.platform.util.PageData;


public class ThreadNumRead extends Thread{
	private List<PageData> list;
	private String filename;
	private NumReadService numReadService;
	private PageData pd;
	private String flag;
	public ThreadNumRead(List<PageData> list,String filename,NumReadService numReadService,PageData pd,String flag){
		this.list = list;
		this.filename = filename;
		this.numReadService = numReadService;
		this.pd = pd;
		this.flag = flag;
	}
	
	public void run(){
		if("0".equals(flag)){ //数据入库
			ReadExcel.InsertData(list,filename,numReadService);
		}else{  //删除本地临时文件
			ReadExcel.deleteFile(pd, filename);
		}
	}
}
