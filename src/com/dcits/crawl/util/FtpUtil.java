package com.dcits.crawl.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
  
  
public class FtpUtil {  
  
    private final static Log logger = LogFactory.getLog(FtpUtil.class);  
  
    /** 
     * 获取FTPClient对象 
     * 
     * @param ftpHost 
     *            FTP主机服务器 
     * @param ftpPassword 
     *            FTP 登录密码 
     * @param ftpUserName 
     *            FTP登录用户名 
     * @param ftpPort 
     *            FTP端口 默认为21 
     * @return 
     */  
    public static FTPClient getFTPClient(String ftpHost, String ftpUserName,  
            String ftpPassword, int ftpPort) {  
        FTPClient ftpClient = new FTPClient();  
        try {  
            ftpClient = new FTPClient();  
            ftpClient.connect(ftpHost, ftpPort);// 连接FTP服务器  
            ftpClient.login(ftpUserName, ftpPassword);// 登陆FTP服务器  
            if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {  
                logger.info("未连接到FTP，用户名或密码错误。");  
                ftpClient.disconnect();  
            } else {  
                logger.info("FTP连接成功。");  
            }  
        } catch (SocketException e) {  
            e.printStackTrace();  
            logger.info("FTP的IP地址可能错误，请正确配置。");  
        } catch (IOException e) {  
            e.printStackTrace();  
            logger.info("FTP的端口错误,请正确配置。");  
        }  
        return ftpClient;  
    }  
  
    /* 
     * 从FTP服务器下载文件 
     *  
     * @param ftpHost FTP IP地址 
     *  
     * @param ftpUserName FTP 用户名 
     *  
     * @param ftpPassword FTP用户名密码 
     *  
     * @param ftpPort FTP端口 
     *  
     * @param ftpPath FTP服务器中文件所在路径 格式： ftptest/aa 
     *  
     * @param localPath 下载到本地的位置 格式：H:/download 
     *  
     * @param fileName 文件名称 
     */  
    public static void downloadFtpFile(String ftpHost, String ftpUserName,  
            String ftpPassword, int ftpPort, String ftpPath, String localPath,  
            List<String> fileNameList) {  
  
        FTPClient ftpClient = null;  
  
        try {  
            ftpClient = getFTPClient(ftpHost, ftpUserName, ftpPassword, ftpPort);  
            ftpClient.setControlEncoding("UTF-8"); // 中文支持   
            ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);  
            ftpClient.enterLocalPassiveMode();  
            ftpClient.changeWorkingDirectory(ftpPath); 
            File file = new File(localPath);
            if(!file.exists()){
            	file.mkdir();
            }
            for(int i=0;i<fileNameList.size();i++){
            	 File localFile = new File(localPath + File.separatorChar + fileNameList.get(i)); 
            	/* if(!localFile.exists()){*/
            		 OutputStream os = new FileOutputStream(localFile);  
                     ftpClient.retrieveFile(fileNameList.get(i), os);  
                     os.close();
            	 /*}*/
            }
            ftpClient.logout();  
  
        } catch (FileNotFoundException e) {  
            logger.info("没有找到" + ftpPath + "文件");  
            logger.info(e.getMessage()); 
        } catch (SocketException e) {  
            logger.info("连接FTP失败.");  
            logger.info(e.getMessage()); 
        } catch (IOException e) {  
            logger.info("文件读取错误。");  
            logger.info(e.getMessage()); 
        }  
    }  
    
  /*  //测试  
    public static void main(String[] args) {  
    	String ftpHost = "10.202.18.45";  
        String ftpUserName = "zxqz";  
        String ftpPassword = "111111";  
        int ftpPort = 21;  
        String ftpPath = "data/20170818300300000002";  
        String localPath = PathUtil.getClasspath() + Const.FILEPATHIMG + "20170818300300000002";   
        List<String> fileNameList = new ArrayList<String>();
        fileNameList.add("WARRANT.jpg");
        fileNameList.add("LOAN_APPLICATION.jpg");
        fileNameList.add("IDENTITY_DOCUMENT.jpg"); 
        FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileNameList); 
    }  */
  
}  