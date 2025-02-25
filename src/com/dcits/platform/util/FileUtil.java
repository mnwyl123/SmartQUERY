package com.dcits.platform.util;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;

/**	文件处理
*  创建人：  
 * 创建时间：2014年12月23日
 */
public class FileUtil {
	private static Logger logger = Logger.getLogger(FileUtil.class);
	public static void main(String[] args) {
//		String dirName = "d:/FH/topic/";// 创建目录
//		FileUtil.createDir(dirName);
		
//		String path = "E:\\apache-tomcat-7.0.70\\webapps\\SmartSense\\uploadFiles\\uploadImgs\\ae45fee3dc99431ca0378e79581de2c0b1632c7ea8f5451db55731067280f07d.xml";
//		writeFile(path,"222","UTF-8");
		String src = "C:/Users/gaoshenga/Desktop/ftp/6d2389faa44c4422a4a134336587d9000d867689c83b49369eed7373d15e1e04";
		delFileDemo(src);
	}
	
	
	/**获取文件大小 返回 KB 保留3位小数  没有文件时返回0
	 * @param filepath 文件完整路径，包括文件名
	 * @return
	 */
	public static Double getFilesize(String filepath){
		File backupath = new File(filepath);
		return Double.valueOf(backupath.length())/1000.000;
	}

	/**
	 * 创建目录
	 * @param destDirName
	 *            目标目录名
	 * @return 目录创建成功返回true，否则返回false
	 */
	public static boolean createDir(String destDirName) {
		File dir = new File(destDirName);
		if (dir.exists()) {
			return false;
		}
		if (!destDirName.endsWith(File.separator)) {
			destDirName = destDirName + File.separator;
		}
		// 创建单个目录
		if (dir.mkdirs()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 删除文件
	 * @param filePathAndName
	 *            String 文件路径及名称 如c:/fqf.txt
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	public static void delFile(String filePathAndName) {
		try {
			String filePath = filePathAndName;
			filePath = filePath.toString();
			java.io.File myDelFile = new java.io.File(filePath);
			myDelFile.delete();
		} catch (Exception e) {
			logger.debug("删除文件操作出错");
			logger.error(e.getMessage(),e);
		}
	}

	/**
	 * 读取到字节数组0
	 * @param filePath //路径
	 * @throws IOException
	 */
	public static byte[] getContent(String filePath) throws IOException {
		File file = new File(filePath);
		long fileSize = file.length();
		if (fileSize > Integer.MAX_VALUE) {
			logger.debug("file too big...");
			return null;
		}
		FileInputStream fi = new FileInputStream(file);
		byte[] buffer = new byte[(int) fileSize];
		try{
			int offset = 0;
			int numRead = 0;
			while (offset < buffer.length
					&& (numRead = fi.read(buffer, offset, buffer.length - offset)) >= 0) {
				offset += numRead;
			}
			// 确保所有数据均被读取
			if (offset != buffer.length) {
				throw new IOException("Could not completely read file " + file.getName());
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			fi.close();
		}
		return buffer;
	}

	/**
	 * 读取到字节数组1
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray(String filePath) throws IOException {

		File f = new File(filePath);
		if (!f.exists()) {
			throw new FileNotFoundException(filePath);
		}
		ByteArrayOutputStream bos = new ByteArrayOutputStream((int) f.length());
		BufferedInputStream in = null;
		try {
			in = new BufferedInputStream(new FileInputStream(f));
			int buf_size = 1024;
			byte[] buffer = new byte[buf_size];
			int len = 0;
			while (-1 != (len = in.read(buffer, 0, buf_size))) {
				bos.write(buffer, 0, len);
			}
			return bos.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(in!=null){
				in.close();
			}
			bos.close();
		}
	}

	/**
	 * 读取到字节数组2
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray2(String filePath) throws IOException {
		File f = new File(filePath);
		if (!f.exists()) {
			throw new FileNotFoundException(filePath);
		}
		FileChannel channel = null;
		FileInputStream fs = null;
		try {
			fs = new FileInputStream(f);
			channel = fs.getChannel();
			ByteBuffer byteBuffer = ByteBuffer.allocate((int) channel.size());
			while ((channel.read(byteBuffer)) > 0) {
				// do nothing
				// System.out.println("reading");
			}
			return byteBuffer.array();
		} catch (IOException e) {
			logger.error(e.getMessage(),e);
			throw e;
		} finally {
			if(channel!=null){
				channel.close();
			}
			if(fs!=null){
				fs.close();
			}
		}
	}

	/**
	 * Mapped File way MappedByteBuffer 可以在处理大文件时，提升性能
	 *
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray3(String filePath) throws IOException {

		FileChannel fc = null;
		RandomAccessFile rf = null;
		try {
			rf = new RandomAccessFile(filePath, "r");
			fc = rf.getChannel();
			MappedByteBuffer byteBuffer = fc.map(MapMode.READ_ONLY, 0,
					fc.size()).load();
			//System.out.println(byteBuffer.isLoaded());
			byte[] result = new byte[(int) fc.size()];
			if (byteBuffer.remaining() > 0) {
				// System.out.println("remain");
				byteBuffer.get(result, 0, byteBuffer.remaining());
			}
			return result;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(rf!=null){
				rf.close();
			}
			if(fc!=null){
				fc.close();
			}
		}
	}
	
	/**
	 * 将文件路径中去掉文件类型
	 * @param filePath 文件路径
	 * @return 去掉文件类型后的文件名
	 */
	public static String getFilePathRemoveFileType(String filePath){
		if(filePath!=null&&filePath.length()>1){
			int s = filePath.lastIndexOf(".");
			if(s>0){
				filePath = filePath.substring(0, s);
			}
		}
		return filePath;
	}


	/**
	 * 
	 * @param file
	 * @param content
	 */
    public static void writeFile(String filename,String content,String encoding){
    	try {
    		File file = new File(filename);
			if(!file.exists()){
				file.createNewFile();
			}
			FileOutputStream fos = new FileOutputStream(file);
			OutputStreamWriter osw = new OutputStreamWriter(fos,encoding);
			osw.write(content);
			osw.flush();
			osw.close();
			fos.close();
		} catch (IOException e) {
			logger.error("写入文件出错");
			logger.error(e.getMessage(),e);
		} 
    }
    
	private static void delFileDemo(String path){
		try {
			if(!StringUtil.isEmpty(path)){
				File file = new File(path);
				if(file.exists()){
					if(file.isFile()){
						file.delete();
					}else if(file.isDirectory()){
						File[] arrFile = file.listFiles();
						for(File fi : arrFile){
							delFileDemo(fi.getAbsolutePath());
						}
						file.delete();
					}
				}
			}
		} catch (Exception e) {
//			logger.error("IndAppReController.delFile方法出错",e);
		}
	}
}