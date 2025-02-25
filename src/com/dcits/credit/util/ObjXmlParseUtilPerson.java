package com.dcits.credit.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.web.multipart.MultipartFile;

import com.dcits.credit.util.sm3.SM3Digest;
import com.dcits.platform.util.DateUtil;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;

/**
 * 异议报文解析工具
 *
 */
public class ObjXmlParseUtilPerson {
	

	public static void main(String[] args) throws Exception {
		String path = "C:/Users/hp/Desktop/桌面文件/征信/新建文件夹/修改密码返回应答报文.txt";
		String xml = XmlParseUtil.readXmlFile(path, "UTF-8");
		PageData pdData=parseXmlUpdPWD(xml);
		pdData.get(null);
	}
	public static PageData parseXmlUpdPWD(String xml) throws Exception{
		xml = xml.substring(xml.indexOf("<"));
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		//个人待核查异议事项应答报文
		PageData mainPd = (PageData) childNode(root.elements("Msg"),null); //主表信息
		return mainPd;
	}

	public static PageData parseXmlComplex(String xml, String id) throws Exception{
		xml = xml.substring(xml.indexOf("<"));
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		//个人待核查异议事项应答报文
		PageData mainPd = (PageData) childNode(root.elements("Msg"),null); //主表信息
		mainPd.put("ID", id);
		List<PageData> subTab = (List) childNode(root.element("Msg").elements("ToCheckInf"),"ObjCheckID");
		for(PageData pd : subTab){
			pd.put("ID", id);
		}
		mainPd.put("ToCheckInf", subTab);
		return mainPd;
	}
	public static PageData parseXmlSimple(String xml, String id) throws Exception{
		xml = xml.substring(xml.indexOf("<"));
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		//个人待核查异议事项应答报文
		PageData mainPd = (PageData) childNode(root.elements("Msg"),null); //主表信息
		mainPd.put("ID", id);
		return mainPd;
	}
	/**
	 * 解析主表和子表，主表与子表通过mainTabId关联，所以每个子表下存放主表的id，即mainTabId
	 * @param elementList
	 * @param mainTabId
	 * @return
	 * @throws Exception
	 */
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
						putSubToMain(mainPd,subPd,"key_"+el.getName());
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
	//待核查异议事项
	public static String concatMessage(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append(reportHead());
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<Document>");
		strBuf.append("<Head>");
		strBuf.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE")+"</DataProviderOrgCode>");
		strBuf.append("<UserCode>"+pd.getString("USERNAME_PERBANK")+"</UserCode>");
		strBuf.append("<Password>"+SM3Digest.SM3OfUpper(PasswordOper.decode(pd.getString("PER_PASSWORD")))+"</Password>");
		strBuf.append("</Head>");
		strBuf.append("</Msg>");
		strBuf.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE")+"</OriginateOrgCode>");
		strBuf.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE")+"</OriginateUserCode>");
		strBuf.append("<BeginDate>"+pd.getString("BEGIN_DATE")+"</BeginDate>");
		strBuf.append("<EndDate>"+pd.getString("END_DATE")+"</EndDate>");
		strBuf.append("</Msg>");
		strBuf.append("</Document>");
		return strBuf.toString();
	}
	//待核查异议事项附件，异议事项更正结果接受情况
	public static String concatMessageEnclosureAndCorrectAccept(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append(reportHead());
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<Document>");
		strBuf.append("<Head>");
		strBuf.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE")+"</DataProviderOrgCode>");
		strBuf.append("<UserCode>"+pd.getString("USERNAME_PERBANK")+"</UserCode>");
		strBuf.append("<Password>"+SM3Digest.SM3OfUpper(PasswordOper.decode(pd.getString("PER_PASSWORD")))+"</Password>");
		strBuf.append("</Head>");
		strBuf.append("</Msg>");
		strBuf.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE")+"</OriginateOrgCode>");
		strBuf.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE")+"</OriginateUserCode>");
		strBuf.append("<ObjCheckID>"+pd.getString("OBJCHECKID")+"</ObjCheckID>");
		strBuf.append("</Msg>");
		strBuf.append("</Document>");
		return strBuf.toString();
	}
	//异议事项核查结果
	public static String concatMessageObjectionResult(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append(reportHead());
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<Document>");
		strBuf.append("<Head>");
		strBuf.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE")+"</DataProviderOrgCode>");
		strBuf.append("<UserCode>"+pd.getString("USERNAME_PERBANK")+"</UserCode>");
		strBuf.append("<Password>"+pd.getString("PER_PASSWORD")+"</Password>");
		strBuf.append("</Head>");
		strBuf.append("</Msg>");
		strBuf.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE")+"</OriginateOrgCode>");
		strBuf.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE")+"</OriginateUserCode>");
		strBuf.append("<PhoneNum>"+pd.getString("PHONENUM")+"</PhoneNum>");
		strBuf.append("<ObjCheckID>"+pd.getString("OBJCHECKID")+"</ObjCheckID>");
		strBuf.append("<ObjCheckNum>"+pd.getString("OBJCHECKNUM")+"</ObjCheckNum>");
		strBuf.append("<CheckResult>"+pd.getString("CHECKRESULT")+"</CheckResult>");
		strBuf.append("<CheckResultDesc>"+pd.getString("CHECKRESULTDESC")+"</CheckResultDesc>");
		strBuf.append("</Msg>");
		strBuf.append("</Document>");
		return strBuf.toString();
	}
	//异议事项更正结果
	public static String concatObjectionCorrect(File file1,PageData pd) throws Exception{
		String enclosureInf="";
		if(file1!=null){
			enclosureInf = FileToBase64.fileToBase64(file1);
		}
		StringBuffer strBuf = new StringBuffer();
		strBuf.append(reportHead());
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<Document>");
		strBuf.append("<Head>");
		strBuf.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE")+"</DataProviderOrgCode>");
		strBuf.append("<UserCode>"+pd.getString("USERNAME_PERBANK")+"</UserCode>");
		strBuf.append("<Password>"+pd.getString("PER_PASSWORD")+"</Password>");
		strBuf.append("</Head>");
		strBuf.append("</Msg>");
		strBuf.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE")+"</OriginateOrgCode>");
		strBuf.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE")+"</OriginateUserCode>");
		strBuf.append("<ObjCheckID>"+pd.getString("OBJCHECKID")+"</ObjCheckID>");
		strBuf.append("<CorrectResult>"+pd.getString("CORRECTRESULT")+"</CorrectResult>");
		strBuf.append("<EnclosureInf>"+enclosureInf+"</EnclosureInf>");
		strBuf.append("<CorrectDesc>"+pd.getString("CORRECTDESC")+"</CorrectDesc>");
		strBuf.append("</Msg>");
		strBuf.append("</Document>");
		return strBuf.toString();
	}
	//添加个人标注
	public static String concatObjectionAddLabel(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append(reportHead());
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<Document>");
		strBuf.append("<Head>");
		strBuf.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE")+"</DataProviderOrgCode>");
		strBuf.append("<UserCode>"+pd.getString("USERNAME_PERBANK")+"</UserCode>");
		strBuf.append("<Password>"+pd.getString("PER_PASSWORD")+"</Password>");
		strBuf.append("</Head>");
		strBuf.append("</Msg>");
		strBuf.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE")+"</OriginateOrgCode>");
		strBuf.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE")+"</OriginateUserCode>");
		strBuf.append("<Name>"+pd.getString("NAME")+"</Name>");
		strBuf.append("<IDType>"+pd.getString("IDTYPE")+"</IDType>");
		strBuf.append("<IDNum>"+pd.getString("IDNUM")+"</IDNum>");
		strBuf.append("<BusinessCode>"+pd.getString("BUSINESSCODE")+"</BusinessCode>");
		strBuf.append("<LocateInfNm>"+String.valueOf(pd.get("LOCATEINFNM"))+"</LocateInfNm>");
		String locateinftype = pd.getString("LOCATEINFTYPE");
		if(StringUtil.isEmpty(locateinftype)){
			strBuf.append("<LocateInf>");
			strBuf.append("<LocateInfType>");
			strBuf.append("");
			strBuf.append("</LocateInfType>");
			strBuf.append("</LocateInf>");
		}else{
			String[] array = pd.getString("LOCATEINFTYPE").split(",");
			for(int i = 0; i<array.length; i++){
				strBuf.append("<LocateInf>");
				strBuf.append("<LocateInfType>");
				strBuf.append(array[i]);
				strBuf.append("</LocateInfType>");
				strBuf.append("</LocateInf>");
			}
		}
		strBuf.append("<DataOccurOrgCode>"+pd.getString("DATA_OCCUR_ORG_CODE")+"</DataOccurOrgCode>");
		strBuf.append("<ObjDesc>"+pd.getString("OBJDESC")+"</ObjDesc>");
		strBuf.append("</Msg>");
		strBuf.append("</Document>");
		return strBuf.toString();
	}
	//删除个人标注
	public static String concatObjectionDeleteLabel(PageData pd) throws Exception{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append(reportHead());
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<Document>");
		strBuf.append("<Head>");
		strBuf.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE")+"</DataProviderOrgCode>");
		strBuf.append("<UserCode>"+pd.getString("USERNAME_PERBANK")+"</UserCode>");
		strBuf.append("<Password>"+pd.getString("PER_PASSWORD")+"</Password>");
		strBuf.append("</Head>");
		strBuf.append("</Msg>");
		strBuf.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE")+"</OriginateOrgCode>");
		strBuf.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE")+"</OriginateUserCode>");
		strBuf.append("<ServiceReturnCode>"+pd.getString("SERVICERETURNCODE")+"</ServiceReturnCode>");
		strBuf.append("</Msg>");
		strBuf.append("</Document>");
		return strBuf.toString();
	}
	/**
	 * 将请求报文发给人行接口，人行接口返回应答报文
	 * @param xml
	 * @return
	 * @throws Exception
	 */
	public static String responseXml(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtilPerson.SaveXml();
		return responseReportXml;
	}
	public static String responseXmlEnclosure(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtilPerson.SaveXmlEnclosure();
		return responseReportXml;
	}
	public static String responseXmlResult(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtilPerson.SaveXmlResult();
		return responseReportXml;
	}
	public static String responseXmlCorrect(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtilPerson.SaveXmlCorrect();
		return responseReportXml;
	}
	public static String responseXmlCorrectAccept(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtilPerson.SaveXmlCorrectAccept();
		return responseReportXml;
	}
	public static String responseXmlAddLabel(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtilPerson.SaveXmlAddLabel();
		return responseReportXml;
	}
	public static String responseXmlDeleteLabel(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtilPerson.SaveXmlDeleteLabel();
		return responseReportXml;
	}
	
	
	/**
	 * 1.解析获取个人异议应答报文
	 * @return
	 * @throws Exception
	 */
	public static String SaveXml() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\个人异议应答报文.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 2.解析获取个人异议附件应答报文
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlEnclosure() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\个人异议附件应答报文.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 3.解析获取个人异议结果应答报文
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlResult() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\个人异议结果应答报文.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 4.解析获取个人异议更正结果应答报文
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlCorrect() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\个人异议更正结果应答报文.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 5.解析获取个人异议更正结果接受应答报文
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlCorrectAccept() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\个人异议更正结果接受应答报文.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 6.解析获取添加个人标注应答报文
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlAddLabel() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\添加个人标注.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 7.解析获取删除个人标注应答报文
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlDeleteLabel() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\删除个人标注.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	
}