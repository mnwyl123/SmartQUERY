package com.dcits.crawl.util;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.log4j.Logger;

  
public class FileTool {  
	private static Logger logger = Logger.getLogger(FileTool.class);
    /** 
     * Description: 向FTP服务器上传文件 
     * @Version      1.0 
     * @param url FTP服务器hostname 
     * @param port  FTP服务器端口 
     * @param username FTP登录账号 
     * @param password  FTP登录密码 
     * @param path  FTP服务器保存目录 
     * @param filename  上传到FTP服务器上的文件名 
     * @param input   输入流 
     * @return 成功返回true，否则返回false * 
     */  
    public static boolean uploadFile(String url,// FTP服务器hostname  
            int port,// FTP服务器端口  
            String username, // FTP登录账号  
            String password, // FTP登录密码  
            String path, // FTP服务器保存目录  
            String filename, // 上传到FTP服务器上的文件名  
            InputStream input // 输入流  
    ){  
        boolean success = false;  
        FTPClient ftp = new FTPClient();  
        ftp.setControlEncoding("GBK");  
        try {  
            int reply;  
            ftp.connect(url, port);// 连接FTP服务器  
            // 如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器  
            ftp.login(username, password);// 登录  
            reply = ftp.getReplyCode();  
            if (!FTPReply.isPositiveCompletion(reply)) {  
                ftp.disconnect();  
                return success;  
            }  
            ftp.setFileType(FTPClient.BINARY_FILE_TYPE);  
            ftp.makeDirectory(path);  
            ftp.changeWorkingDirectory(path);  
            ftp.storeFile(filename, input);  
            input.close();  
            ftp.logout();  
            success = true;  
        } catch (IOException e) {  
        	logger.info(e.getMessage());
        } finally {  
            if (ftp.isConnected()) {  
                try {  
                    ftp.disconnect();  
                } catch (IOException ioe) {  
                	logger.info(ioe.getMessage());
                }  
            }  
        }  
        return success;  
    }  
  
    /** 
     * 将本地文件上传到FTP服务器上 * 
     */  
    public static void upLoadFromProduction(String url,// FTP服务器hostname  
            int port,// FTP服务器端口  
            String username, // FTP登录账号  
            String password, // FTP登录密码  
            String path, // FTP服务器保存目录  
            String filename, // 上传到FTP服务器上的文件名  
            String orginfilename // 输入流文件名  
       ) {  
        try {  
            FileInputStream in = new FileInputStream(new File(orginfilename));  
            boolean flag = uploadFile(url, port, username, password, path,filename, in); 
            int i=0;
            while(!flag){
            	i++;
            	if(i==3) break;
            	flag = uploadFile(url, port, username, password, path,filename, in);  
            }
            System.out.println(flag);  
        } catch (Exception e) {  
        	logger.info(e.getMessage());
        }  
    }
    /**
     * 服务器上文件复制
     * @param args
     */
    public static void copyFile(String url,// FTP服务器hostname  
            int port,// FTP服务器端口  
            String username, // FTP登录账号  
            String password, // FTP登录密码  
            String destPath, // 目标文件夹目录  
            String sourtPath  //源文件夹
      ){
         FTPClient ftp = new FTPClient();  
         ftp.setControlEncoding("GBK");  
         try {  
             int reply;  
             ftp.connect(url, port);// 连接FTP服务器  
             // 如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器  
             ftp.login(username, password);// 登录  
             reply = ftp.getReplyCode();  
             if (!FTPReply.isPositiveCompletion(reply)) {  
                 ftp.disconnect();  
                 return;
             }  
             ftp.setBufferSize(1024);
             ByteArrayOutputStream fos = new ByteArrayOutputStream();
             ftp.setFileType(FTPClient.BINARY_FILE_TYPE);  
             ftp.retrieveFile(sourtPath, fos);
             ByteArrayInputStream in = new ByteArrayInputStream(fos.toByteArray());
             ftp.storeFile(destPath, in);
             fos.close();  
             in.close();
             ftp.logout();  
         } catch (IOException e) {  
        	 logger.info(e.getMessage());
         } finally {  
             if (ftp.isConnected()) {  
                 try {  
                     ftp.disconnect();  
                 } catch (IOException ioe) {  
                	 logger.info(ioe.getMessage());
                 }  
             }  
         }  
    }
     //测试  
    public static void main(String[] args) {  
          
    	copyFile("10.202.17.53", 21, "hadoop", "111111", "data/2017071212300000002/2017071212300000002.html","data/20170713000100000004/20170713000100000004.html");  
    }  
}