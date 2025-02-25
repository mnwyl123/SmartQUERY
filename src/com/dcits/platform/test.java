package com.dcits.platform;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dcits.credit.util.CompressUtils;

import net.lingala.zip4j.exception.ZipException;

public class test {

	
	public static void main(String args[]){
		SimpleDateFormat df = new SimpleDateFormat("HH");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()
//		File f = new File("E://FTP2");
//		if(f.isDirectory()){
//			File[] fs = f.listFiles();
//			for(File file : fs){
//				try {
////					CompressUtils.unZip("E://FTP/"+file.getName(),"E://FTP",file.getName().substring(0,6));
//					String zipPasswd=file.getName().substring(0,6);
//					CompressUtils.zip("E://FTP2//"  + file.getName(),"E://FTP3//"+ file.getName()+".zip", true, zipPasswd); 
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
	}
}
