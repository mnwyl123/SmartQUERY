package com.dcits.credit.entity;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import com.dcits.platform.util.Const;
import com.dcits.platform.util.PathUtil;
  
  
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
            logger.info("FTP的IP地址可能错误，请正确配置。");
            logger.error(e.getMessage(),e);
        } catch (IOException e) {
            logger.info("FTP的端口错误,请正确配置。");
            logger.error(e.getMessage(),e);
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
            	 //if(!localFile.exists()){
            		 OutputStream os = new FileOutputStream(localFile);  
                     ftpClient.retrieveFile(fileNameList.get(i), os);  
                     os.close();
            	// }
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
    public static void downloadFtpFile1(String ftpHost, String ftpUserName,  
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
             String fileName=fileNameList.get(i);
           	 File localFile = new File(localPath + File.separatorChar + fileNameList.get(i)); 
           	 if(!localFile.exists()){
           		 OutputStream os = new FileOutputStream(localFile);  
                    ftpClient.retrieveFile(fileName.substring(3, fileName.length()), os);  
                    os.close();
           	 }
           }
            /*for(int i=0;i<fileNameList.size();i++){
            	 File localFile = new File(localPath + File.separatorChar + fileNameList.get(i)); 
            	 if(!localFile.exists()){
            		 OutputStream os = new FileOutputStream(localFile);  
                     ftpClient.retrieveFile(fileNameList.get(i), os);  
                     os.close();
            	 }
            }*/
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
    /**
    *  检验指定路径的文件是否存在ftp服务器中
    * @param ftpHost--指定绝对路径的文件
    * @param ftpUserName--ftp服务器登陆用户名
    * @param ftpPassword--ftp服务器登陆密码
    * @param ftpPort--ftp的端口号
    * @return
    */

    public static List<String> isFTPFileExist(String ftpHost, String ftpUserName,  
            String ftpPassword, int ftpPort, String ftpPath,  
            List<String> fileNameList){
    	FTPClient ftpClient = null;  
    	List<String> listName = new ArrayList<String>();
        try {  
        	List<String> listType = new ArrayList<String>();
        	listType.add(".jpg");
        	listType.add(".jpeg");
        	listType.add(".png");
        	listType.add(".bmp");
        	listType.add(".zip");
            ftpClient = getFTPClient(ftpHost, ftpUserName, ftpPassword, ftpPort);  
            ftpClient.setControlEncoding("UTF-8"); // 中文支持   
            ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);  
            ftpClient.enterLocalPassiveMode();  
            ftpClient.changeWorkingDirectory(ftpPath);
            // 检验文件是否存在
            for(int i=0;i<fileNameList.size();i++){
            	String fileName=fileNameList.get(i);
            	for(int j=0;j<listType.size();j++){
            		String name = fileName+listType.get(j);
            		InputStream is = ftpClient.retrieveFileStream(name);
            		if((j==listType.size())&&(is == null || ftpClient.getReplyCode() == FTPReply.FILE_UNAVAILABLE)){
    	                return listName;
    	            }
    	            if(is != null){
    	                is.close();
    	                ftpClient.completePendingCommand();
    	                listName.add(name);
    	                break;
    	            }
            	}
            }
            return listName;
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ftpClient != null){
                try {
                	ftpClient.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return listName;
    }
    
    /**
     *  检验指定路径的文件是否存在ftp服务器中 （zip专用）
     * @param ftpHost--指定绝对路径的文件
     * @param ftpUserName--ftp服务器登陆用户名
     * @param ftpPassword--ftp服务器登陆密码
     * @param ftpPort--ftp的端口号
     * @return
     */

     public static boolean isFTPFileExist_zip(String ftpHost, String ftpUserName,  
             String ftpPassword, int ftpPort, String ftpPath,  
             String fileName){
     	FTPClient ftpClient = null;  
     	String returnName = null;
         try {  
             ftpClient = getFTPClient(ftpHost, ftpUserName, ftpPassword, ftpPort);  
             ftpClient.setControlEncoding("UTF-8"); // 中文支持   
             ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);  
             ftpClient.enterLocalPassiveMode();  
             ftpClient.changeWorkingDirectory(ftpPath);
             // 检验文件是否存在
             InputStream is = ftpClient.retrieveFileStream(fileName);
             if(is == null || ftpClient.getReplyCode() == FTPReply.FILE_UNAVAILABLE){
            	 return false;
             }
             if(is != null){
            	 is.close();
            	 ftpClient.completePendingCommand();
             }
             return true;
         } catch (Exception e) {
             e.printStackTrace();
         }finally{
             if(ftpClient != null){
                 try {
                 	ftpClient.disconnect();
                 } catch (IOException e) {
                     e.printStackTrace();
                 }
             }
         }
         return true;
     }
    //测试  
    /*public static void main(String[] args) {  
    	String ftpHost = "10.202.18.45";  
        String ftpUserName = "zxqz";  
        String ftpPassword = "111111";  
        int ftpPort = 21; 
        ///home/zxqz/data/e266aadfb124402ba56adbadfc9424d533ed6478984e4e4fae782b9eb2a4479a
        String ftpPath = "data/e266aadfb124402ba56adbadfc9424d533ed6478984e4e4fae782b9eb2a4479a";  
        List<String> fileNameList = new ArrayList<String>();
        fileNameList.add("WARRANT.jpg");
        fileNameList.add("LOAN_APPLICATION.jpg");
        fileNameList.add("IDENTITY_DOCUMENT.jpg"); 
        if(FtpUtil.isFTPFileExist(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath,fileNameList).size()==0){
        	System.out.println("文件不存在");
        }else{
        	System.out.println("文件存在");
        }; 
    }  */
  
}  