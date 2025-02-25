package com.dcits.credit.controller.rest.util;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

import com.dcits.credit.entity.WbCopyFileRunnable;
import com.dcits.credit.entity.WebServiceRunnable;
import com.dcits.credit.util.WbqqInnerRunnable;

public class MyRejectedExecutionHandler implements RejectedExecutionHandler {

	@Override
	public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
		if(r instanceof WebServiceRunnable){
			WebServiceRunnable runnable = (WebServiceRunnable) r;
			runnable.flag = true;
		}else if(r instanceof WbCopyFileRunnable){
			WbCopyFileRunnable runnable = (WbCopyFileRunnable) r;
			runnable.flag = true;
		}else if(r instanceof WbqqInnerRunnable){
			WbqqInnerRunnable runnable = (WbqqInnerRunnable) r;
			runnable.poolflag = true;
		}
	}

}
