package com.dcits.credit.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import cn.com.infosec.netsign.agent.PBCAgent2G;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;

public class ReportUtil extends BaseController{
	
	public static Map<String,String> reqParam = null; //请求报文需要的参数
	private static Logger logger = Logger.getLogger(ReportUtil.class);
	
	/**
	 * 报文头
	 * @param send_org_code 报文发送机构代码
	 * @param rece_org_code 报文接收机构代码
	 * @param report_type 报文类型
	 * @return
	 */
	public static String headInfo(String send_org_code,String rece_org_code,String report_type){
		String start_sign = "B"; //报文头起始标识
		String version = "2.0.0"; //报文格式版本号
		String nowTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //报文生成时间
		String report_sign = nowTime.substring(0,8)+nowTime.substring(6); //报文标识号
		String obligate = "0000000000"; //预留字段
		String end_sign = "\r\n"; //结束标识
		String headInfo = start_sign+version+send_org_code+rece_org_code+nowTime+report_type
				+report_sign+obligate+end_sign;
		return headInfo;
	}
	/**
	 * 数字解读批量查询请求文件报文头
	 * @return
	 */
	public static String headInfoBatch(PageData pd){
		String start_sign = "A"; //报文头起始标识1-1
		String version = "2.0.0"; //报文格式版本号2-6
		String send_org_code = pd.getString("request_org"); //报文发送机构代码7-20
		String nowTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //报文生成时间21-34
		String report_type = "F501"; //报文类型35-38
		String report_sign = String.format("%05d", pd.size()); //查询记录笔数
		String obligate = "0000000"; //预留字段
		String end_sign = "\r\n"; //结束标识
		String headInfoBatch = start_sign+version+send_org_code+nowTime+report_type
				+report_sign+obligate+end_sign;
		return headInfoBatch;
	}
	/**
	 * 数字解读批量查询请求文件文件名
	 * @return
	 */
	public static String fileNameBatch(PageData pd){
		String send_org_code = pd.getString("request_org"); //报文发送机构代码
		String nowTime = new SimpleDateFormat("yyyyMMdd").format(new Date()); //报文生成时间
		String report_type = "F501"; //报文类型35-38
		int Num = 1;
		String numFlow = String.format("%03d", Num);//流水号
		String flag = "0";
		Num++;
		String fileName = send_org_code+nowTime+report_type+numFlow+flag;
		return fileName;
	}
	/**
	 * 数字签名
	 * @return
	 */
	public static String numSignature(){
		return "{S:UYWO7J9c3fAGKp7Mi81vjpW8QOWxRDLHU8iEwSVTY4VEgANAFrh3llSeBc3RKzILfQh}\r\n";
	}
	

	
	public static String numSignature(String srcXml){
		String singedXml = "";
		logger.info("before signature :"+srcXml);
		byte[] origBytes = srcXml.getBytes();
		//String ip = "qm.sgc.yillion.bank";
		String ip = "10.188.0.45";
		int port = 50010;
		String password = ""; 
		String dn = "C=CN,O=PBCCRC,CN=e2da15d9-e487-4465-81fa-7d4fc9a4a5e3";//接口生产

//		String dn = "C=CN,O=PBCCRC,CN=af659489-d4d6-4bc8-b8e3-59480007df0a";//接口测试
		//String dn = "C=CN,O=PBCCRC,CN=ae1abfc7-1575-42b0-869d-149b1a52d68a";//生成
		//String dn = "CN=194e2cf1-6b37-4f9b-963c-c65e7e0f371b,O=PBCCRC,C=CN";//生成
		logger.info("starting signature: "+ip + dn + "++++++++++++++");
		PBCAgent2G  signServer = new PBCAgent2G();
//		signServer.setCheckIPAddress(true);
		signServer.isDebug(true);
		boolean flag = false;
		flag = signServer.openSignServer(ip, port, password);
		singedXml = signServer.dettachedSign(origBytes, dn);
		logger.info("after signature : "+singedXml);
		boolean close = false;
		close = signServer.closeSignServer();
		return singedXml;
	
	}
	
	
	
	
	public static void main(String[] args) {
		String headInfo = "89798786786";
		numSignature(headInfo);
	}
}
