package com.dcits.credit.entity;

import java.util.List;
import com.dcits.credit.util.CopyFileServer;
import com.dcits.platform.util.PageData;

//ftp上影像资料搬运队列接口
public class WbCopyFileRunnable implements Runnable{  
	private PageData serverInfo;  //ftp登录信息
    private String cardNo;  //证件号码
    private List<String> listName;  //文件名
    private String sourtPath;  //影像原始路径
    private String destPath;  //影像目的路径
    private String type;  //客户类型
    public static boolean flag = false;
	public WbCopyFileRunnable(PageData serverInfo,String cardNo,List<String> listName,String sourtPath,String destPath,String type){	
	    this.serverInfo = serverInfo;
	    this.cardNo = cardNo;
	    this.listName = listName;
	    this.sourtPath = sourtPath;
	    this.destPath = destPath;
	    this.type = type;
	    flag = false;
    }
    @Override  
    public void run() {  
    	if("1".equals(type)){  //个人
    		CopyFileServer.CopyPerFile(serverInfo,cardNo,listName,sourtPath,destPath);
    	}else{  //企业
    		CopyFileServer.CopyComFile(serverInfo,cardNo,listName,sourtPath,destPath);
    	}
    	
    }  
      
}  