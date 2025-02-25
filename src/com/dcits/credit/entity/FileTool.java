package com.dcits.credit.entity;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
//            input.close();  
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
            try {
				input.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
        }  
        return success;  
    }  
  
    /** 
     * 将本地文件上传到FTP服务器上 * 
     */  
    public static boolean upLoadFromProduction(String url,// FTP服务器hostname  
            int port,// FTP服务器端口  
            String username, // FTP登录账号  
            String password, // FTP登录密码  
            String path, // FTP服务器保存目录  
            String filename, // 上传到FTP服务器上的文件名  
            String orginfilename // 输入流文件名  
       ) {  
    	boolean flag = false;
        try {  
            FileInputStream in = new FileInputStream(new File(orginfilename));  
            flag = uploadFile(url, port, username, password, path,filename, in);  
            int i=0;
            while(!flag){
            	i++;
            	if(i==3) break;
            	flag = uploadFile(url, port, username, password, path,filename, in);  
            }
            logger.debug(flag);
        } catch (Exception e) {  
        	logger.error(e.getMessage(),e);
        }  
        return flag;
    }
    //测试将本地文件上传到ftp
/*    public static void main(String[] args) {
		String username = "weblogic";
		String password = "weblogic";
		String path = "credit2.0";
		String filename = "2.zip";
		String orginfilename = "C:\\Users\\hp\\Desktop\\ert.jpg";
		String url = "172.16.1.88";
		int port = 21;
		upLoadFromProduction(url, port, username, password, path, filename, orginfilename);
		
	}*/
    
    public static void main(String[] args) {
		String str = "9890890890.jsg";
		String stra  = str.substring(0,str.lastIndexOf("."));
		logger.debug(stra);
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
    /** 
	* 复制文件. 
	*  
	* @param sourceFileName 
	* @param targetFile 
	* @throws IOException 
	*/  
	public static void copyFile(String url,// FTP服务器hostname  
            int port,// FTP服务器端口  
            String username, // FTP登录账号  
            String password, // FTP登录密码  
            String sourceFileName,String targetName, String sourceDir, String targetDir) throws IOException {  
	  ByteArrayInputStream in = null;  
	  ByteArrayOutputStream fos = new ByteArrayOutputStream();  
	  FTPClient ftpClient = new FTPClient(); 
	  try {  
		  int reply;  
		  ftpClient.connect(url, port);// 连接FTP服务器  
          // 如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器  
		  ftpClient.login(username, password);// 登录  
          reply = ftpClient.getReplyCode();  
          if (!FTPReply.isPositiveCompletion(reply)) {  
        	  ftpClient.disconnect();  
              return;
          }  
          int num=appearNumber(sourceDir,"/");
          ftpClient.makeDirectory(targetDir);  
	      ftpClient.setBufferSize(1024 * 2);  
	      // 变更工作路径  
	      ftpClient.changeWorkingDirectory(sourceDir);  
	      // 设置以二进制流的方式传输  
	      ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);  
	      // 将文件读到内存中  
	      ftpClient.retrieveFile(new String(sourceFileName.getBytes("GBK"), "iso-8859-1"), fos);  
	      in = new ByteArrayInputStream(fos.toByteArray());  
	      if (in != null) {
	    	  for(int i=0;i<num;i++){
		    	  if(!ftpClient.changeWorkingDirectory("../")){
		        	  logger.error("工作空间1切换失败");
		          }
	    	  }
	          if(!ftpClient.changeWorkingDirectory(targetDir)){
	        	  logger.error("工作空间2切换失败");
	          }
	          ftpClient.storeFile(new String(targetName.getBytes("GBK"), "iso-8859-1"), in);  
	      }  
	  } finally {  
	      // 关闭流  
	      if (in != null) {  
	          in.close();  
	      }  
	      if (fos != null) {  
	          fos.close();  
	      }  
	  }  
	}
	/**
	 * 获取指定字符串出现的次数
	 * 
	 * @param srcText 源字符串
	 * @param findText 要查找的字符串
	 * @return
	 */
	public static int appearNumber(String srcText, String findText) {
	    int count = 0;
	    Pattern p = Pattern.compile(findText);
	    Matcher m = p.matcher(srcText);
	    while (m.find()) {
	        count++;
	    }
	    return count;
	}
     //测试  
    /*public static void main(String[] args) throws NumberFormatException, IOException {  
    	PageData serverInfo=new PageData();
    	String CREDENTIALS_NO="61272319680226723X";
    	String APPLICATION_TIME =new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date());
    	String CHANNEL_QUERY_NO="2017011910010000003";
    	String ID="adb1e29d1c034ba28502cc4925028e9c8db4827e522f4d0c88cbae1c5b75b9ba";
    	//获得配置文件配置信息
		try {
			serverInfo = BaseController.getServerInfo();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
		String sourtPath = serverInfo.getString("ftpPath1")+"088"+"/"+APPLICATION_TIME.substring(0,8)+"/"+CHANNEL_QUERY_NO+"/";
		String destPath = serverInfo.getString("ftpPath")+ID+"/";
    	//将图片搬到以ID命名的文件夹
		String orgainFileName="LOAN_"+CREDENTIALS_NO+".jpg";//贷款申请书（原始文件名称）
		String finalFileName="LOAN_APPLICATION"+".jpg";//贷款申请书
		FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		orgainFileName="WARR_"+CREDENTIALS_NO+".jpg";//授权书（原始文件名称）
		finalFileName="WARRANT"+".jpg";//贷款申请书
		FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
		orgainFileName="ID_"+CREDENTIALS_NO+".jpg";//身份证明文件（原始文件名称）
		finalFileName="IDENTITY_DOCUMENT"+".jpg";//身份证明文件
		FileTool.copyFile(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")),serverInfo.getString("LoginName"),serverInfo.getString("LoginPass"),orgainFileName, finalFileName, sourtPath,destPath);
    	//copyFile("10.202.18.45", 21, "zxqz", "111111", "data/2018011910010002/2018011910010002.html","data/2018011910010001/2018011910010001.html");  
    	try {
			copyFile("10.202.18.45", 21, "zxqz", "111111", "2018011910010001.html","2018011910010002.html","data/2018011910010001/","data/2018011910010002/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }  */
}