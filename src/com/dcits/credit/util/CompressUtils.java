package com.dcits.credit.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;
import net.sourceforge.lept4j.ILeptonica.FILE;

public class CompressUtils {
	private static Logger logger = Logger.getLogger(CompressUtils.class);
    /**
     * 解压加密的压缩文件
     * @param zipfile
     * @param dest
     * @param passwd
     * @throws ZipException
     */
    public static void unZip(String zipfile,String dest,String passwd) throws ZipException{
        ZipFile zfile=new ZipFile(zipfile);
//        zfile.setFileNameCharset("GBK");//在GBK系统中需要设置
        if(!zfile.isValidZipFile()){
            throw new ZipException("压缩文件不合法，可能已经损坏！");
        }
        File file=new File(dest);
        if(file.isDirectory() && !file.exists()){
            file.mkdirs();
        }
        if(zfile.isEncrypted()){
            zfile.setPassword(passwd.toCharArray());
        }
        zfile.extractAll(dest);
    }
    
public static String getFile2(String path, String charse) {
		
	    //读取行,临时存值.
	    String line = null;
	    //记录行号.
	    int lineNumber = 0;
	    //装入文件全部内容的builder.
	    StringBuilder result = new StringBuilder();
	    //不解释了- -.
	    BufferedReader br = null;
	    try {
	        br = new BufferedReader(new InputStreamReader(new FileInputStream(path), charse));
	        //循环取出行.
	        while ((line = br.readLine()) != null) {
	            //拼装行到最后结果 new String(line.getBytes(),"utf-8")这句是要点,把你读取过来的内容按照UTF-8重新编码.
	            result.append(new String(line.getBytes()));
	        }
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        //关闭BufferedReader *重要
	        if (br != null) {
	            try {
	                br.close();
	            } catch (IOException e) {
	            }
	        }
	    }
	    //打印最后结果到控制台.
	    return result.toString();
	}
/*    public static void main(String[] args) throws ZipException {
		String src = "E:/apache-tomcat-7.0.70/webapps/SmartSense/WEB-INF/classes/../../uploadFiles/uploadImgs/8c26cc20cdd448f99edec5a7fdb840b84df73419ba894d3aab9cf500f926e6bd.html";
		String dest = "E:/apache-tomcat-7.0.70/webapps/SmartSense/WEB-INF/classes/../../uploadFiles/uploadImgs/8c26cc20cdd448f99edec5a7fdb840b84df73419ba894d3aab9cf500f926e6bd.zip";
		String passwd = "8c26cc";
		String src1 ="C:/Users/hp/Desktop/"; 
		String dest1 ="C:/Users/hp/Desktop/067e8648d42140e5a72e6ed1603d3fb5839b57a0246e4455a9e615d084bcd979.zip";
//		zip(src1,dest1,true,passwd);
//		zip(src,dest,true,passwd);
//		String dest2 = "C:/Users/hp/Desktop/01234567890123456789.zip";
//		String src2 = "C:/Users/hp/Desktop/5555";
		unZip(dest1,src1,"067e86");
	}*/
    
    public static void main(String[] args) throws ZipException {
	String src = "C:/Users/gaoshenga/Desktop/ftp";
	String dest = "C:/Users/gaoshenga/Desktop/ftp/6d2389faa44c4422a4a134336587d9000d867689c83b49369eed7373d15e1e04.zip";
//	String passwd = "8c26cc";
//	String src1 ="C:/Users/hp/Desktop/"; 
//	String dest1 ="C:/Users/hp/Desktop/067e8648d42140e5a72e6ed1603d3fb5839b57a0246e4455a9e615d084bcd979.zip";
//	zip(src1,dest1,true,passwd);
//	zip(src,dest,true,passwd);
//	String dest2 = "C:/Users/hp/Desktop/01234567890123456789.zip";
//	String src2 = "C:/Users/hp/Desktop/5555";
//	unZip(src,dest,true,"6d2389");
	unZip(dest,src,"6d2389");
}
    /**
     * 压缩文件且加密
     * @param src
     * @param dest
     * @param is
     * @param passwd
     */
    public static void zip(String src,String dest,boolean is,String passwd){
        File srcfile=new File(src);
        //创建目标文件
        String destname = buildDestFileName(srcfile, dest);
        ZipParameters par=new ZipParameters();
        par.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
        par.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
        if(passwd!=null){
            par.setEncryptFiles(true);
            par.setEncryptionMethod(Zip4jConstants.ENC_METHOD_STANDARD);
            par.setPassword(passwd.toCharArray());
        }
        try {
            ZipFile zipfile=new ZipFile(destname);
            if(srcfile.isDirectory()){
                if(!is){
                    File[] listFiles = srcfile.listFiles();
                    ArrayList<File> temp=new ArrayList<File>();
                    Collections.addAll(temp, listFiles);
                    zipfile.addFiles(temp, par);
                }
                zipfile.addFolder(srcfile, par);
            }else{
                zipfile.addFile(srcfile, par);
            }
        } catch (ZipException e) {
            e.printStackTrace();
        }


    }
    /**
     * 目标文件名称
     * @param srcfile
     * @param dest
     * @return
     */
    public static String buildDestFileName(File srcfile,String dest){
        if(dest==null){//没有给出目标路径时
            if(srcfile.isDirectory()){
                dest=srcfile.getParent()+File.separator+srcfile.getName()+".zip";
            }else{
                String filename=srcfile.getName().substring(0,srcfile.getName().lastIndexOf("."));
                dest=srcfile.getParent()+File.separator+filename+".zip";
            }
        }else{
            createPath(dest);//路径的创建
            if(dest.endsWith(File.separator)){
                String filename="";
                if(srcfile.isDirectory()){
                    filename=srcfile.getName();
                }else{
                    filename=srcfile.getName().substring(0, srcfile.getName().lastIndexOf("."));
                }
                dest+=filename+".zip";
            }
        }
        return dest;
    }
    /**
     * 路径创建
     * @param dest
     */
    private static void createPath(String dest){
        File destDir=null;
        String sep = null;
        if(dest.contains("/")){
        	sep = "/";
        }else if(dest.contains("\\")){
        	sep = "\\";
        }else {
        	sep = File.separator;
        }
//        if(dest.endsWith(File.separator)){
        if(dest.endsWith(sep)){
            destDir=new File(dest);//给出的是路径时
        }else{
//            if(dest.contains(File.separator)){
//        	destDir=new File(dest.substring(0,dest.lastIndexOf(File.separator)));
        	destDir=new File(dest.substring(0,dest.lastIndexOf(sep)));
        }
        if(!destDir.exists()){
            destDir.mkdirs();
        }
    }

//    public static void main(String[] args) throws ZipException{ 
//    	String zipfile="E:/work/SmartSense/WebRoot/uploadFiles/uploadImgs/7d4009149a72479da82a231227385c0932283177799043f1a574c6aa5c53c67c.zip";
//    	String dest="E:/work/SmartSense/WebRoot/uploadFiles/uploadImgs/111";
//    	//String dest="E:/work/SmartSense/WebRoot/uploadFiles/uploadImgs\\7d4009149a72479da82a231227385c0932283177799043f1a574c6aa5c53c67c.zip";
//        String passwd="7d4009";
//    	CompressUtils.unZip(zipfile,dest,passwd);
//    	//CompressUtils.zip("E:/work/SmartSense/WebRoot/uploadFiles/uploadImgs/7d4009149a72479da82a231227385c0932283177799043f1a574c6aa5c53c67c\\7d4009149a72479da82a231227385c0932283177799043f1a574c6aa5c53c67c.html", dest, true, passwd);
//	}
    
    //copy文件方法
    public static void downAndUploadFile(PageData pd,String internal,String flag,String report_id,IndAppReManager indAppReService,EntAppReManager entAppReService){
    	String result = "06";
    	String ID = pd.getString("ID");
    	String zipPasswd=ID.substring(0,6);
    	//获得配置文件配置信息
 	 	PageData serverInfo = new PageData();
		try {
			serverInfo = BaseController.getServerInfo();
		} catch (IOException e) {
			result = "04";
			logger.error("行内查询失败!"+e.getMessage(), e);
		}
//		if(serverInfo!=null&&"06".equals(result)){
//			//密码解密
//			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
//			String ftpPath = serverInfo.getString("ftpPath")+ID;
//			//下载报告
//			String localPath =PathUtil.getClasspath() + Const.FILEPATHIMG; 
//			String zipFileName=internal+".zip";
//			String fileName = internal+".html"; 
//	        List<String> fileList = new ArrayList<String>();
//	        fileList.add(zipFileName);
//	        FtpUtil.downloadFtpFile(serverInfo.getString("IP"), 
//	        		                serverInfo.getString("LoginName"),
//	        		                serverInfo.getString("LoginPass"), 
//	        		                Integer.parseInt(serverInfo.getString("port")), 
//	        		                serverInfo.getString("ftpPath")+internal, 
//	        		                localPath, 
//	        		                fileList); 
//	        
//	        String nowTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
//	        //解压
//	        try {
//				unZip(localPath+zipFileName,localPath+ID+File.separator+nowTime,internal.substring(0,6));
//			} catch (Exception e1) {
//				logger.error("行内查询失败!"+e1.getMessage(),e1);
//				result = "04";
//			}
//	      //企业报告获取弹出框文件夹名
//	        String filesName = "2018010101";
//	        if("2".equals(flag)&&"06".equals(result)){
//		        try {
//	        		File file = new File(localPath+ID+File.separator+nowTime);
//	        		String[] filelist = file.list();
//	        		for(int i=0;i<filelist.length;i++){
//	        			File readfile = new File(localPath+ID+File.separator+nowTime+File.separator+filelist[i]);
//	        			if(readfile.isDirectory()){
//	        				filesName = readfile.getName();
//	        				break;
//	        			}
//	        		}
//				} catch (Exception e1) {
//					logger.error("行内查询失败!"+e1.getMessage(),e1);
//					result = "04";
//				}
//	    	}
//	        //重新命名
//	        String oldFilePath=localPath+ID+File.separator+nowTime+File.separator+"/"+internal+"/"+fileName;
//	        fileName = ID+".html";
//	        String newFilePath=localPath+ID+File.separator+nowTime+File.separator+"/"+ID+"/"+fileName;
//	        File newFilePath_dest = new File(localPath+ID+File.separator+nowTime+File.separator+"/"+ID+"/");
//	        if(!newFilePath_dest.exists()){
//	        	newFilePath_dest.mkdirs();
//	        }        
//	        File oldFile = new File(oldFilePath);
//	        File newFile = new File(newFilePath);
//	        oldFile.renameTo(newFile);
//	        //压缩文件
//	        zipFileName=ID+".zip";
//			try{
//				CompressUtils.zip(localPath+ID+File.separator+nowTime+File.separator+ID,localPath+ID+File.separator+nowTime+File.separator+zipFileName,true,zipPasswd);
//				//判断文件夹是否存在
//				File file = new File(localPath+ID+File.separator+nowTime+File.separator+filesName);
//				if(file.exists()){
//					CompressUtils.zip(localPath+ID+File.separator+nowTime+file.separator+filesName,localPath+ID+File.separator+nowTime+file.separator+zipFileName,true,zipPasswd);
//				}
//			}catch(Exception e){
//				logger.error("行内查询失败!"+e.getMessage(),e);
//				result = "04";
//			}
//			//上传
//			try{
//				new FileTool().upLoadFromProduction(serverInfo.getString("IP"), Integer.parseInt(serverInfo.getString("port")), serverInfo.getString("LoginName"), serverInfo.getString("LoginPass"), ftpPath, zipFileName,localPath+ID+File.separator+nowTime+File.separator+zipFileName);
//			}catch(Exception e){
//				logger.error("行内查询失败!"+e.getMessage(),e);
//				result = "04";
//			}
//		}
		//复制文件
		logger.debug("++++++++++++复制文件+++++++++");
		String localPath =PathUtil.getClasspath() + Const.FILEPATHIMG; 
		String fileNamexml = internal+".xml";
		String newFileNamexml = ID+".xml";
		String fileNamehtml = internal+".html";
		String newFileNamehtml = ID+".html";
		try {
			unZip(localPath+internal+".zip",localPath,internal.substring(0,6));
		} catch (ZipException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		String url1xml = localPath +internal+File.separator+fileNamexml;
		logger.debug("url1"+url1xml);
		String url2xml = localPath +ID+File.separator+newFileNamexml;
		logger.debug("url2"+url2xml);
		String url1html = localPath +internal+File.separator+fileNamehtml;
		logger.debug("url1"+url1html);
		String url2html = localPath +ID+File.separator+newFileNamehtml;
		logger.debug("url2"+url2html);
		File newFile = new File(localPath+ID);
		if(!newFile.exists()) {
			newFile.mkdirs();
		}
		FileInputStream inxml=null;
		FileOutputStream outxml=null;
		FileInputStream inhtml=null;
		FileOutputStream outhtml=null;
		try { 
			File file1xml = new File(url1xml);
			if(file1xml.exists()){
				inxml = new FileInputStream(new File(url1xml));
				outxml = new FileOutputStream(new File(url2xml));
				byte[] buff=new byte[10240];
				int n = 0;
				while((n=inxml.read(buff))!=-1) {
					outxml.write(buff,0,n);
				}
				outxml.flush();
				inxml.close();
				outxml.close();
			}
			File file1html = new File(url1html);
			if(file1html.exists()){
				inhtml = new FileInputStream(new File(url1html));
				outhtml = new FileOutputStream(new File(url2html));
				byte[] buff=new byte[10240];
				int n = 0;
				while((n=inhtml.read(buff))!=-1) {
					outhtml.write(buff,0,n);
				}
				outhtml.flush();
				inhtml.close();
				outhtml.close();
			}
		} catch (Exception e1) {
			logger.debug(e1);
		}finally{
			if(inxml!=null){
				try {
					inxml.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(outxml!=null){
				try {
					outxml.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(inhtml!=null){
				try {
					inhtml.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(outhtml!=null){
				try {
					outhtml.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		//压缩文件
		CompressUtils.zip(localPath+ID,localPath+ID+".zip",true,zipPasswd);
//		FileOutputStream fos=null;
//		try {
//			fos = new FileOutputStream(new File(localPath+ID+".zip"));
//			logger.debug("========================================开始压缩："+localPath+ID+".zip=======================================");
//		} catch (FileNotFoundException e1) {
//			logger.debug(e1);
//		}
//		logger.debug("========================================开始压缩=======================================");
//		 toZip(url2,fos,true);
//		logger.debug("========================================压缩结束=======================================");
		//更新表状态
		try{
			if("1".equals(flag)){ //个人
				updateStatus(result, entAppReService, indAppReService,ID, report_id,true);
			}else{//企业
				updateStatus(result, entAppReService, indAppReService, ID, report_id,false);
			}
		}catch(Exception e){
			logger.error("行内查询失败!"+e.getMessage(),e);
		}
    }
    //更新信息表中状态
  	@Transactional
  	public static void updateStatus(String flag,EntAppReManager entAppReService,IndAppReManager indAppReService,String ID,String reportId,Boolean fg){
  		///更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
  		try {
  			PageData pd = new PageData();
  			pd.put("ID", ID);
  			pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
  			pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
  			pd.put("STATUS", flag);
  			pd.put("REPORT_ID", reportId);
  			//更新状态表
  			indAppReService.updateCheck(pd);
  			if("06".equals(flag)||"06"==flag){
  				pd.put("IS_GET", "1");
  			}else{
  				pd.put("IS_GET", "0");
  			}
  			//更新明细表
  			if(fg){//个人
  	  			indAppReService.UpdateDetailCheck(pd);
  			}else{//企业
  	  			entAppReService.UpdateCDetailCheck(pd);
  			}
  			
  		} catch (Exception e) {
  			logger.error("行内查询失败!"+e.getMessage(),e);
  		}
  	}
//  	/**
//  	 * 
//  	 * @param srcDir  压缩文件夹路径
//  	 * @param out     压缩文件输出流
//  	 * @param KeepDirStructrue   是否保留原来的目录结构，true保留，false所有文件跑到压缩包根目录下（注意：不保留可能会出现同名文件，会压缩出错）
//  	 */
//  	
//  	public static void toZip(String srcDir,OutputStream out,boolean KeepDirStructrue) {
//  		
//  		ZipOutputStream zos=null;
//  		try{
//  			zos = new ZipOutputStream(out);
//  			File sourceFile = new File(srcDir);
//  			logger.debug("========================================压缩文件sourceFile："+sourceFile+"=======================================");
//  			compress(sourceFile,zos,sourceFile.getName(),KeepDirStructrue);
//  		}catch(Exception e) {
//  			logger.debug(e);
//  		}finally {
//  			if(zos!= null) {
//  				try {
//  					zos.close();
//  				}catch(Exception e) {
//  					logger.debug(e);
//  				}
//  			}
//  		}
//		
//  	}
//  	
//  	
//  	/***
//  	 * 
//  	 * @param sourceFile 源文件
//  	 * @param zos    zip输出流
//  	 * @param name   压缩后名称
//  	 * @param KeepDirStructrue   是否保留原来的目录结构，true保留，false所有文件跑到压缩包根目录下（注意：不保留可能会出现同名文件，会压缩出错）
//  	 */
//     private  static void compress(File sourceFile,ZipOutputStream zos,String name,boolean KeepDirStructrue) {
//    	 byte[] buff = new byte[2*1024]; 
//    	 if(sourceFile.isFile()) {
//    		 //向zip输出流添加一个zip实体，构造器中name为zip实体的文件名
//    		 try {
//				zos.putNextEntry(new ZipEntry(name));
//				int len;
//				FileInputStream in  = new FileInputStream(sourceFile);
//				while((len=in.read(buff))!=-1) {
//					zos.write(buff,0,len);
//				}
//				zos.closeEntry();
//				in.close();
//			} catch (IOException e) {
//			    logger.debug(e);
//			}
//    	 }
//     }
//  	
//  	
//  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
}
