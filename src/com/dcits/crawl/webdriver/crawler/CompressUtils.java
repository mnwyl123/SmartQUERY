package com.dcits.crawl.webdriver.crawler;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;

public class CompressUtils {
    /**
     * 解压加密的压缩文件
     * @param zipfile
     * @param dest
     * @param passwd
     * @throws ZipException
     */
    public static void unZip(String zipfile,String dest,String passwd) throws ZipException{
        ZipFile zfile=new ZipFile(zipfile);
        zfile.setFileNameCharset("GBK");//在GBK系统中需要设置
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
//    private static void createPath(String dest){
//        File destDir=null;
//        if(dest.endsWith(File.separator)){
//            destDir=new File(dest);//给出的是路径时
//        }else{
//            destDir=new File(dest.substring(0,dest.lastIndexOf(File.separator)));
//        }
//        if(!destDir.exists()){
//            destDir.mkdirs();
//        }
//    }
    
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

    public static void main(String[] args) throws ZipException{ 
    	String zipfile="E:/work/SmartSense/WebRoot/uploadFiles/uploadImgs/7d4009149a72479da82a231227385c0932283177799043f1a574c6aa5c53c67c.zip";
    	String dest="E:/work/SmartSense/WebRoot/uploadFiles/uploadImgs/111";
    	//String dest="E:/work/SmartSense/WebRoot/uploadFiles/uploadImgs\\7d4009149a72479da82a231227385c0932283177799043f1a574c6aa5c53c67c.zip";
        String passwd="7d4009";
    	CompressUtils.unZip(zipfile,dest,passwd);
    	//CompressUtils.zip("E:/work/SmartSense/WebRoot/uploadFiles/uploadImgs/7d4009149a72479da82a231227385c0932283177799043f1a574c6aa5c53c67c\\7d4009149a72479da82a231227385c0932283177799043f1a574c6aa5c53c67c.html", dest, true, passwd);
	}
    
    /**
     * 在linux环境中执行指定 
     * @param str
     * @return
     */
    public static String exeCommand(String str){
    	InputStream in = null;
    	String result ="";
		try {
			Process pro = Runtime.getRuntime().exec(str);
			pro.waitFor();
			in = pro.getInputStream();
			BufferedReader read = new BufferedReader(new InputStreamReader(in));
			result = read.readLine();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return result;
    }
}
