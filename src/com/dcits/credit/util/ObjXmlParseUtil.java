package com.dcits.credit.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.dcits.platform.util.*;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import com.dcits.credit.util.sm3.SM3Digest;

/**
 * 异议报文解析工具
 *
 */
public class ObjXmlParseUtil {
	private final static Logger logger = Logger.getLogger(ObjXmlParseUtil.class);
	public static void main(String[] args) throws Exception {
		String path = "C:\\Users\\hp\\Desktop\\获取企业待核查异议事项附件信息应答报文.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
//		System.out.println(xml);
		parseXmlM(xml);
	}
	/**
	 * 1.解析获取企业待核查异议事项应答报文
	 * @return
	 * @throws Exception
	 */
	public static String SaveXml() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\获取企业待核查异议事项应答报文.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 *2. 解析获取企业待核查异议事项附件信息应答报文
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlAudInfo() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\获取企业待核查异议事项附件信息应答报文.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 3.反馈企业异议事项核查结果
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlCheckResult() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\反馈企业异议事项核查结果.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 4.反馈企业异议事项更正结果
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlCorrect() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\反馈企业异议事项核查结果.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 5.反馈企业异议事项更正结果
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlResultRec() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\查询企业异议事项更正结果接受情况应答报文样例.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 6.反馈企业异议事项更正结果
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlAddAnnotation() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\企业标注应答报文样例.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	/**
	 * 7.反馈企业异议事项更正结果
	 * @return
	 * @throws Exception
	 */
	public static String SaveXmlDeleAnnotation() throws Exception{
		String path = PathUtil.getClasspath()+"\\uploadFiles\\objections\\反馈企业异议事项核查结果.xml";
		String xml = XmlParseUtil.readXmlFile(path, "GBK");
		return xml;
	}
	
	public static PageData parseXmlM(String xml) throws Exception{
		PageData pd = null;
		xml = xml.substring(xml.indexOf("<"));
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		//个人待核查异议事项应答报文
		String mainId = UuidUtil.get64UUID();
		PageData mainPd = (PageData) childNode(root.elements("Msg"),null); //主表信息
		mainPd.put("ID", mainId);
//		List<PageData> subTab = (List) childNode(root.element("Msg").elements("ToCheckInf"),"ObjCheckID");
//		for(PageData pd : subTab){
//			pd.put("ID", mainId);
//		}
//		System.out.println(mainPd);
		return mainPd;
//		System.out.println(subTab);
	}
	/**
	 * 解析1的指标信息
	 * @param xml
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static PageData parseXmlMain(String xml,String id) throws Exception{
		xml = xml.substring(xml.indexOf("<"));
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		//个人待核查异议事项应答报文
		String mainId = id;
		PageData mainPd = (PageData) childNode(root.elements("Msg"),null); //主表信息
		mainPd.put("ID", mainId);
		List<PageData> subTab = (List) childNode(root.element("Msg").elements("ToCheckInf"),"ObjCheckID");
		for(PageData pd : subTab){
			pd.put("ID", mainId);
		}
		return mainPd;
	}
	public static List<PageData> parseXmlSub(String xml, String id) throws Exception{
		xml = xml.substring(xml.indexOf("<"));
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		//个人待核查异议事项应答报文
		String mainId = id;
		PageData mainPd = (PageData) childNode(root.elements("Msg"),null); //主表信息
		mainPd.put("ID", mainId);
		List<PageData> subTab = (List) childNode(root.element("Msg").elements("ToCheckInf"),"ObjCheckID");
		for(PageData pd : subTab){
			pd.put("ID", mainId);
		}
		return subTab;
	}
	/**
	 * 解析2的主表信息
	 * @param xml
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static PageData parseXmlMaina(String xml,String id) throws Exception{
		xml = xml.substring(xml.indexOf("<"));
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		//个人待核查异议事项应答报文
		String mainId = id;
		PageData mainPd = (PageData) childNode(root.elements("Msg"),null); //主表信息
		mainPd.put("ID", mainId);
//		List<PageData> subTab = (List) childNode(root.element("Msg").elements("ToCheckInf"),"ObjCheckID");
//		for(PageData pd : subTab){
//			pd.put("ID", mainId);
//		}
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
	 * 1.拼接报文获取企业待核查异议事项
	 * @param pd
	 * @return
	 */
	public static String dealWithReport(PageData pd){
		StringBuffer  sb = new StringBuffer();
		sb.append(reportHead());
		sb.append("<xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<Document>");
		sb.append("<Head>");
		sb.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE"));
		sb.append("</DataProviderOrgCode>");
		sb.append("<UserCode>"+pd.getString("USERNAME_PERBANK_ORG"));
		sb.append("</UserCode>");
		sb.append("<Password>"+SM3Digest.SM3OfUpper(PasswordOper.decode(pd.getString("COM_PASSWORD"))));
		sb.append("</Password>");
		sb.append("</Head>");
		sb.append("<Msg>");
		sb.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE"));
		sb.append("</OriginateOrgCode>");
		sb.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE"));
		sb.append("</OriginateUserCode>");
		sb.append("<BeginDate>"+pd.getString("BEGIN_DATE"));
		sb.append("</BeginDate>");
		sb.append("<EndDate>"+pd.getString("END_DATE"));
		sb.append("</EndDate>");
		sb.append("</Msg>");
		sb.append("</Document>");
		String Submission = sb.toString();
		logger.debug(Submission);
		return Submission;
	}
	/**
	 * 获取企业待核查异议事项附件信息
	 * @param pd
	 * @return
	 */
	public static String dealWithReportAudInfo(PageData pd){
		StringBuffer strBuf = new StringBuffer();
		strBuf.append(reportHead());
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<Document>");
		strBuf.append("<Head>");
		strBuf.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE")+"</DataProviderOrgCode>");
		strBuf.append("<UserCode>"+pd.getString("USERNAME_PERBANK_ORG")+"</UserCode>");
		strBuf.append("<Password>"+SM3Digest.SM3OfUpper(PasswordOper.decode(pd.getString("COM_PASSWORD")))+"</Password>");
		strBuf.append("</Head>");
		strBuf.append("</Msg>");
		strBuf.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE")+"</OriginateOrgCode>");
		strBuf.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE")+"</OriginateUserCode>");
		strBuf.append("<ObjCheckID>"+pd.getString("OBJCHECKID")+"</ObjCheckID>");
		strBuf.append("</Msg>");
		strBuf.append("</Document>");
		return strBuf.toString();
	}
	/**
	 * 3.获取企业待核查异议事项附件信息
	 * @param pd
	 * @return
	 */
	public static String dealWithReportCheckResult(PageData pd){
		StringBuffer strBuf = new StringBuffer();
		strBuf.append(reportHead());
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<Document>");
		strBuf.append("<Head>");
		strBuf.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE")+"</DataProviderOrgCode>");
		strBuf.append("<UserCode>"+pd.getString("USERNAME_PERBANK_ORG")+"</UserCode>");
		strBuf.append("<Password>"+SM3Digest.SM3OfUpper(PasswordOper.decode(pd.getString("COM_PASSWORD")))+"</Password>");
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
	/**
	 * 4.获取企业异议更正事项
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public static String dealWithReportCorrect(File file1,PageData pd) throws Exception{
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
		strBuf.append("<UserCode>"+pd.getString("USERNAME_PERBANK_ORG")+"</UserCode>");
		strBuf.append("<Password>"+SM3Digest.SM3OfUpper(PasswordOper.decode(pd.getString("COM_PASSWORD")))+"</Password>");
		strBuf.append("</Head>");
		strBuf.append("</Msg>");
		strBuf.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE")+"</OriginateOrgCode>");
		strBuf.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE")+"</OriginateUserCode>");
		strBuf.append("<ObjCorrectID>"+pd.getString("OBJCHECKID")+"</ObjCorrectID>");
		strBuf.append("<CorrectResult>"+pd.getString("CORRECTRESULT")+"</CorrectResult>");
		strBuf.append("<EnclosureInf>"+enclosureInf);
		strBuf.append("</EnclosureInf>");
		strBuf.append("<CorrectDesc>"+pd.getString("CORRECTDESC")+"</CorrectDesc>");
		strBuf.append("</Msg>");
		strBuf.append("</Document>");
		String Submission = strBuf.toString();
		logger.debug(Submission);
		return Submission;
	}
	/**
	 * 查询企业异议事项更正结果接受情况
	 * @param pd
	 * @return
	 */
	public static String dealWithReportResultRec(PageData pd){
		//拼接发送人行的报文
		StringBuffer  sb = new StringBuffer();
		sb.append(reportHead());
		sb.append("<xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<Document>");
		sb.append("<Head>");
		sb.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE"));
		sb.append("</DataProviderOrgCode>");
		sb.append("<UserCode>"+pd.getString("USERNAME_PERBANK_ORG"));
		sb.append("</UserCode>");
		sb.append("<Password>"+SM3Digest.SM3OfUpper(PasswordOper.decode(pd.getString("COM_PASSWORD"))));
		sb.append("</Password>");
		sb.append("</Head>");
		sb.append("<Msg>");
		sb.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE"));
		sb.append("</OriginateOrgCode>");
		sb.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE"));
		sb.append("</OriginateUserCode>");
		sb.append("<ObjCheckID>"+pd.getString("OBJCHECKID"));
		sb.append("</ObjCheckID>");	
		sb.append("</Msg>");
		sb.append("</Document>");
		String Submission = sb.toString();
		logger.debug(Submission);
		return Submission;
	}
	//6.
	/**
	 * 查询企业异议事项更正结果接受情况
	 * @param pd
	 * @return
	 */
	public static String dealWithReportAddAnnotation(PageData pd){
		StringBuffer  sb = new StringBuffer();
		sb.append(reportHead());
		sb.append("<xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<Document>");
		sb.append("<Head>");
		sb.append("<DataProviderOrgCode>"+pd.getString("DATA_PROVIDER_ORG_CODE"));
		sb.append("</DataProviderOrgCode>");
		sb.append("<UserCode>"+pd.getString("USERNAME_PERBANK_ORG"));
		sb.append("</UserCode>");
		sb.append("<Password>"+SM3Digest.SM3OfUpper(PasswordOper.decode(pd.getString("COM_PASSWORD"))));
		sb.append("</Password>");
		sb.append("</Head>");
		sb.append("<Msg>");
		sb.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE"));
		sb.append("</OriginateOrgCode>");
		sb.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE"));
		sb.append("</OriginateUserCode>");
		sb.append("<EntName>"+pd.getString("ENTNAME"));
		sb.append("</EntName>");
		sb.append("<EntIDType>"+pd.getString("ENTIDTYPE"));
		sb.append("</EntIDType>");
		sb.append("<EntIDNum>"+pd.getString("ENTIDNUM"));
		sb.append("</EntIDNum>");
		sb.append("<BusinessCode>"+pd.getString("BUSINESSCODE"));
		sb.append("</BusinessCode>");
		sb.append("<LocateInfNm>"+String.valueOf(pd.get("LOCATEINFNM")));
		sb.append("</LocateInfNm>");
		String locateinftype = pd.getString("LOCATEINFTYPE");
		if(StringUtil.isEmpty(locateinftype)){
			sb.append("<LocateInf>");
			sb.append("<LocateInfType>");
			sb.append("");
			sb.append("</LocateInfType>");
			sb.append("</LocateInf>");
		}else{
			String[] array = pd.getString("LOCATEINFTYPE").split(",");
			for(int i = 0; i<array.length; i++){
				sb.append("<LocateInf>");
				sb.append("<LocateInfType>");
				sb.append(array[i]);
				sb.append("</LocateInfType>");
				sb.append("</LocateInf>");
			}
		}
		sb.append("<DataOccurOrgCode>"+pd.getString("DATA_OCCUR_ORG_CODE"));
		sb.append("</DataOccurOrgCode>");
		sb.append("<ObjDesc>"+pd.getString("OBJDESC"));
		sb.append("</ObjDesc>");
		sb.append("</Msg>");
		sb.append("</Document>");
		String Submission = sb.toString();
		return Submission;
	}
	/**7.删除企业标注
	 * 查询企业异议事项更正结果接受情况
	 * @param pd
	 * @return
	 */
	public static String dealWithReportDeleAnnotation(PageData pd){
		StringBuffer  sb = new StringBuffer();
		sb.append(reportHead());
		sb.append("<xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<Document>");
		sb.append("<Head>");
		sb.append("<DataProviderOrgCode>"+pd.getString("DATA_OCCUR_ORG_CODE"));
		sb.append("</DataProviderOrgCode>");
		sb.append("<UserCode>"+pd.getString("USERNAME_PERBANK_ORG"));
		sb.append("</UserCode>");
		sb.append("<Password>"+SM3Digest.SM3OfUpper(PasswordOper.decode(pd.getString("COM_PASSWORD"))));
		sb.append("</Password>");
		sb.append("</Head>");
		sb.append("<Msg>");
		sb.append("<OriginateOrgCode>"+pd.getString("ORIGINATE_ORG_CODE"));
		sb.append("</OriginateOrgCode>");
		sb.append("<OriginateUserCode>"+pd.getString("ORIGINATEUSERCODE"));
		sb.append("</OriginateUserCode>");
		sb.append("<ServiceReturnCode>"+pd.getString("SERVICERETURNCODE"));
		sb.append("</ServiceReturnCode>");
		sb.append("</Msg>");
		sb.append("</Document>");
		String Submission = sb.toString();
		logger.debug(Submission);
		return Submission;
	}
	/**
	 * 报文头
	 * @return
	 */
	public static String reportHead(){
		String reportH = "B2.0.0HBF00000000011AH00000000000120160301123118G1512016030100000001000000000000";
		return reportH;
	}
	/**
	 * 将请求报文发给人行接口，人行接口返回应答报文
	 * @param xml
	 * @return
	 * @throws Exception
	 */
	public static String responseXml(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtil.SaveXml();
		return responseReportXml;
	}
	public static String responseXmlAudInfo(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtil.SaveXmlAudInfo();
		return responseReportXml;
	}
	public static String responseXmlCheckResult(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtil.SaveXmlCheckResult();
		return responseReportXml;
	}
	public static String SaveXmlCorrect(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtil.SaveXmlCorrect();
		return responseReportXml;
	}
	public static String responseXmlResultRec(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtil.SaveXmlResultRec();
		return responseReportXml;
	}
	public static String responseXmlAddAnnotation(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtil.SaveXmlAddAnnotation();
		return responseReportXml;
	}
	public static String responseXmlDeleAnnotation(String xml) throws Exception{
		String responseReportXml = null;
		responseReportXml = ObjXmlParseUtil.SaveXmlDeleAnnotation();
		return responseReportXml;
	}
}
