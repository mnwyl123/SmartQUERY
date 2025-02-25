package com.dcits.credit.util.collectFileTransfer;

import java.io.File;

import com.dcits.platform.util.PathUtil;
/**
 * 加载资源文件方式初始化文件传输组件
 *
 */
public class CollectFileTransfer{
	
/*	enum bizType{
		
		COLLECT,//数据采集
		REPORT  //信用报告查询
		
	}
	enum orderFlag{
		FALSE  //无顺序要求
	}*/
	/**
	 * 初始化文件传输组件接口
	 * @param configPath 资源文件路径
	 * @return clfFileTransfer  文件传输组件对象
	 */
	public static String collectFileTransfer(String configPath){
		return null;	
	}
	/**
	 * 添加查询请求文件
	 * @param encFile
	 * @return 已添加查询请求文件数量
	 */
	public static Integer addFile(File encFile){
		int i = 0;
		return i;
	}
	/**
	 * 上传查询请求文件
	 */
	public static String upload(String str){
		String respStr = "";
		return respStr;
	}
	/**
	 * 下载数据反馈报文接口
	 * @return
	 */
	public static String download(String str){
		String respReportPath =  PathUtil.getClasspath()+"\\uploadFiles\\numRead\\个人信用报告数字解读查询结果文件.xml";
		return respReportPath;
	}
}
