package com.dcits.credit.util;

import com.dcits.credit.util.ObjXmlParseUtilPerson;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.XmlParseUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

import Decoder.BASE64Decoder;

/**
 * 数字解读生成报文工具
 *
 */
public class NumReadInterfaceUtil {

	public String upload(String str){
		return null;
	}
	/**
	 * 报文头
	 * @return
	 */
	public static String reportHead(){
		String reportH = "B2.0.0HBF00000000011BH00000000000120160301123118F2012016030100000001000000000000";
		return reportH;
	}
	//拼接数字解读请求报文
	public static String CreatReport(PageData pd) throws Exception{
		PageData pro = BaseController.getPropertiesByFileName("ServiceCode.properties");
		StringBuffer strBuf = new StringBuffer();
		strBuf.append(reportHead());
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<Document>");
		strBuf.append("<Head>");
		strBuf.append("<QueryOrgCode>"+pd.getString("QUERYORGCODE")+"</QueryOrgCode>");
		strBuf.append("<UserCode>"+pd.getString("USERCODE")+"</UserCode>");
		strBuf.append("<Password>"+PasswordOper.decode(pd.getString("PASSWORD"))+"</Password>");
		strBuf.append("</Head>");
		strBuf.append("<Msg>");
		strBuf.append("<FileName>"+pd.getString("FILENAME")+"</FileName>");
		strBuf.append("</Msg>");
		strBuf.append("</Document>");
		strBuf.append(reportEnd());
		return strBuf.toString();
	}
	public static String reportEnd(){
		String reportEnd = "{S:UYWO7J9c3fAGKp7Mi81vjpW8QOWxRDLHU8iEwSVTY4VEgANAFrh3llSeBc3RKzILfQh:S}";
		return reportEnd;
	}
	/**
	 * 解析获取数字解读报文
	 * @return
	 * @throws Exception
	 */
	public static String ResponseNumReadXml(String str) throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\numRead\\查询文件处理状态结果报文.xml";
		String xml = XmlParseUtil.readXmlFile(path, "UTF-8");
		return xml;
	}
	/**
	 * 读取返回的xml文件
	 * @return
	 * @throws Exception
	 */
	public static String ResponsePath(String str) throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\numRead\\个人信用报告数字解读查询结果文件.xml";
		String xml = XmlParseUtil.readXmlFile(path, "UTF-8");
		return xml;
	}
	
	

	
}