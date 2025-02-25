package com.dcits.credit.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.dcits.platform.util.*;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * 数字解读报文解析工具
 *
 */
public class NumXmlParseUtil {
	private static Logger logger = Logger.getLogger(NumXmlParseUtil.class);
/*	public static void main(String[] args) throws Exception {
		String path = "C:\\Users\\hp\\Desktop\\个人信用报告数字解读查询结果文件.xml";
		String xml = readXmlFile(path, "utf-8");
		//截取特定字符串
		List<PageData> listPd = new ArrayList<PageData>();
		//输出的List
		List<PageData> listRePd = new ArrayList<PageData>();
		PageData ps = new PageData();
		listPd = SubStr(xml);
		for(PageData pd :listPd){
			String data = String.valueOf(pd.get("strXml"));
			ps = ParseNumRead(data);
			listRePd.add(ps);
		}
		System.out.println(listRePd);

	}*/
	/**
	 * 读TxT文件以List<PageData>返回
	 * @param xmlStr
	 * @return
	 */
	public static List<PageData> XmlToListData(String xmlStr,String FileName){
		//截取特定字符串
		List<PageData> listPd = new ArrayList<PageData>();
		//输出的List
		List<PageData> listRePd = new ArrayList<PageData>();
		PageData ps = new PageData();
		listPd = SubStr(xmlStr);
		try {
			for(PageData pd :listPd){
				String data = String.valueOf(pd.get("strXml"));
				ps = ParseNumRead(data,FileName);
				listRePd.add(ps);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return listRePd;
	}
	/**
	 * 读取xml文件
	 * @param path
	 * @return
	 * @throws Exception
	 */
	public static String readXmlFile(String path,String encoding) throws Exception{
		StringBuffer sb = new StringBuffer();
		try {
			
			InputStream is = new FileInputStream(path);
			String line;
			BufferedReader reader = new BufferedReader(new InputStreamReader(is,encoding));
			line = reader.readLine();
			while(line != null){
				sb.append(line);
				sb.append("\n");
				line = reader.readLine();
			}
			reader.close();
			is.close();
			
		} catch (Exception e) {
			;
		}
		return sb.toString();

	}
	public static void main(String[] args) throws Exception {
		String path  = "C:\\Users\\hp\\Desktop\\查询文件处理状态结果报文1.txt";
		try {
			String str = "33333333333333";
			BufferedWriter out = 
					new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path,true),"UTF-8"));
			out.write(str+"\r\n");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<PageData> SubStr(String xml){
		List<PageData> list = new ArrayList<PageData>();
		
 		String str1 = xml.substring(xml.indexOf("<"));
		String[] splitStr = str1.split("</Document>");
		int a = 1;
		for(String str:splitStr){
			PageData pd = new PageData();
			if("\n".equals(str)){
				continue;
			}
			str+="</Document>";
			pd.put("ID", a);
			pd.put("strXml", str);
			list.add(pd);
			a++;
		}
		return list;
	}
	/**
	 * 生成数字解读批量查询请求文件
	 */
	public static String CreatFileTXT(String str){
		String FileName = "HBF0000000001120160301F5010010";
		String path = PathUtil.getClasspath()+"\\uploadFiles\\numTxt\\"+FileName+".txt";
//		String path  = "C:\\Users\\hp\\Desktop\\查询文件处理状态结果报文1.txt";
		try {
			String strHead = reportHead();
			String strData = str;
			BufferedWriter out = 
					new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path,true),"UTF-8"));
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return FileName;
	}
	/**
	 * 生成请求字符串
	 * @return
	 */
	public static String CreatRequestStr(PageData pd) {
		StringBuffer sb = new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<Document>");
			sb.append("<Msg>");
			sb.append("<RequestId>"+String.valueOf(pd.get("REQUESTID")));
			sb.append("</RequestId>");
			sb.append("<OriginateOrgCode>"+pd.getString("ORIGINATEORGCODE"));
			sb.append("</OriginateOrgCode>");
			sb.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE"));
			sb.append("</OriginateUserCode>");
			sb.append("<Name>"+pd.getString("CLIENT_NAME"));
			sb.append("</Name>");
			sb.append("<IDType>"+pd.getString("CREDENTIALS_TYPE"));
			sb.append("</IDType>");
			sb.append("<IDNum>"+pd.getString("CREDENTIALS_NO"));
			sb.append("</IDNum>");
			sb.append("<QueryReason>"+pd.getString("QUERY_REASON"));
			sb.append("</QueryReason>");
			sb.append("<ServiceCode>"+pd.getString("SERVICECODE"));
			sb.append("</ServiceCode>");
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
//			sb.append("<ProductDate>"+pd.getString("PRODUCTDATE"));
			try{
			sb.append("<ProductDate>"+fmt.format(fmt.parse(pd.get("PRODUCTDATE").toString())));
			}catch(Exception e ) {
				logger.debug(e);
			}
			sb.append("</ProductDate>");
			sb.append("</Msg>");
			sb.append("</Document>"+"\r\n");
		return sb.toString();
	}
	
	public static PageData ParseNumRead(String xml,String FileName) throws Exception{
		List<PageData> list = parseXmlNumRead(xml);
		String[] strArray = new String[list.size()-1];
		PageData pdData = new PageData();
		int i = 0;
		for(PageData pd :list){
			pd.put("FILENAME", FileName);
			if(pd.containsKey("Factor")){
				strArray[i] = String.valueOf(pd.getString("Factor"));
				i++;
			}else{
				pdData.putAll(pd);
			}
		}
		StringBuffer sb = new StringBuffer();
		for(int j =0;j<strArray.length;j++){
			sb.append(strArray[j]+",");
		}
		if(!"".equals(sb.toString())){//todo   null
			String Factor = sb.toString();
			Factor = Factor.substring(0,Factor.length()-1);
			pdData.put("FACTORRECS", Factor);
		}
		return pdData;
	}
	public static List<PageData> parseXmlNumRead(String xml) throws Exception{
		PageData pd = null;
		xml = xml.substring(xml.indexOf("<"));
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		PageData mainPd = (PageData) childNode(root.elements("Msg"),null); //主表信息
		List<PageData> listSub = (List) childNode(root.element("Msg").elements("FactorRecs"),null);
		listSub.add(mainPd);
		return listSub;
	}
	/**
	 * 解析返回查询状态
	 * @param xml
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static PageData parseXml(String xml,String id) throws Exception{
		xml = xml.substring(xml.indexOf("<"));
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
//		String mainId = id;
		PageData mainPd = (PageData) childNode(root.elements("Msg"),null); //主表信息
		mainPd.put("ID", id);
		return mainPd;
	}
	public static Object childNode(List<Element> elementList,String mainTabId) throws Exception{
		List<PageData> returnList = new ArrayList<PageData>();
		if(StringUtil.isEmpty(mainTabId)){
			for(Element element : elementList){
				returnList.add(getChildNode(element));
			}
		}else{
			for(Element element : elementList){
				//主表
				PageData mainPd = getChildNode(element); 
				//主表id值
				String mainIdVal = String.valueOf(mainPd.get(mainTabId)).replace("null", "");
				if("".equals(mainIdVal)){
					throw new Exception("主表ID的值为空，请检查主表ID的参数是否正确！");
				}
				List<Element> cList = element.elements();
				//子表
				for(Element el : cList){
					if(el.elements().size() != 0){
						PageData subPd = getChildNode(el);
						subPd.put(mainTabId, mainIdVal);
						putSubToMain(mainPd,subPd,el.getName());
					}
				}
				returnList.add(mainPd);
			}
		}
		if(returnList.size()==1){
			return returnList.get(0);
		}
		return returnList;
	}
	
	public static PageData getChildNode(Element element){
		PageData pd = new PageData();
		List<Element> cList = element.elements();
		for(Element el : cList){
			if(el.elements().size() == 0){
				pd.put(el.getName(), el.getText());
			}
		}
		return pd;
	}
	
	public static void putSubToMain(PageData mainTab,PageData subTab,String key) throws Exception{
		if(mainTab.containsKey(key)){
			Object obj = mainTab.get(key);
			if(obj instanceof List){
				List<PageData> list = (List) obj;
				list.add(subTab);
			}else if(obj instanceof PageData){
				List<PageData> list = new ArrayList<PageData>();
				list.add((PageData) obj);
				list.add(subTab);
				mainTab.put(key, list);
			}else{
				throw new Exception("传入子表的key["+key+"]值错误或者主表有错误的值!");
			}
		}else{
			mainTab.put(key, subTab);
		}
	}
	/**
	 * 报文头
	 * @return
	 */
	public static String reportHead(){
		String reportH = "B2.0.0HBF00000000011AH00000000000120160301123118G1512016030100000001000000000000";
		return reportH;
	}
	
}
