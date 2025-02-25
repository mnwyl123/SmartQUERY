package com.dcits.credit.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import com.dcits.platform.util.*;
import org.apache.commons.io.FileUtils;
import com.dcits.platform.controller.system.cache.CacheController;
  
public class XmlToHtml {
	private final static Logger logger = Logger.getLogger(XmlToHtml.class);
//	public static Map<String,Map<String,String>> allDicName = null; //外层key：字典编号，里面key：字典编码
	public static Map<String,Map<String,String>> allDicName = ObjectUtil.dicMap(null); //外层key：字典编号，里面key：字典编码
	public static String encoding = null;
	
  
    @SuppressWarnings("static-access")
	public static void main(String[] args) throws Exception { 
    	long sdate = System.currentTimeMillis();
    	encoding = "UTF-8";
		String path = "D:\\yilian\\20200115上线版本";
		XmlToHtml xh = new XmlToHtml();
		String fromHtmlath = xh.convertXmlToHtml(path+"111.xml","1");
		String toHtmlath = "D:\\yilian\\20200115上线版本\\5个人单笔查询结果报文.html";
		dictHtml(toHtmlath,fromHtmlath,"","zhangsan");
		logger.debug("用时"+(System.currentTimeMillis()-sdate)/1000+"秒");
    }  
    /**
     * 
     * 将xml形式的征信报告转化成html形式的征信报告
     * @param xmlFilePath
     * @param authType 授权查询类型(1:个人授权; 2:企业授权)
     * @return
     */
	public static synchronized String convertXmlToHtml(String xmlFilePath, String authType) throws Exception{
		logger.debug("*******************开始转化报告，执行convertXmlToHtml方法*******************");
		String resultPath = null; 
		String xslFileName = null;
		String htmlFileName = PathUtil.getClasspath() + Const.HTML  + "tmp"+DateUtil.getSdftimesS()+(int) Math.floor(Math.random()*1000) + ".html";
		
		if (authType.equals("1")) {
			xslFileName = PathUtil.getClasspath() + Const.XSL + "XMLtoTHML_P_new.xsl";
		} else {
			xslFileName = PathUtil.getClasspath() + Const.XSL + "XMLtoTHML_E.xsl";
		}
		File xmlFile = new File(xmlFilePath);
		File htmlFile = new File(htmlFileName);
		InputStreamReader xmlReader = new InputStreamReader(new FileInputStream(xmlFile),encoding);
		OutputStreamWriter htmlWriter = new OutputStreamWriter(new FileOutputStream(htmlFile),encoding);
		
		TransformerFactory tFac = TransformerFactory.newInstance();
		Source xslSource = new StreamSource(xslFileName);
		Transformer t = tFac.newTransformer(xslSource);
		Source source = new StreamSource(xmlReader);
		Result result = new StreamResult(htmlWriter);
		t.transform(source, result);
		try {
			htmlWriter.flush();
			xmlReader.close();
			htmlWriter.close();
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		resultPath = htmlFileName;
		return resultPath;
	}
    /**
     * 替换html中的字典
     * @param toHtmlPath
     * @param fromHtmlPath
     * @return
     * @throws Exception
     */
    public static boolean dictHtml(String toHtmlPath,String fromHtmlPath,String id,String findName) throws Exception{
    	File fromfile = new File(fromHtmlPath);
    	File toFile = new File(toHtmlPath);
    	FileUtil.writeFile(toHtmlPath, "",encoding);
    	String content = FileUtils.readFileToString(fromfile,encoding);
    	//content = content.replace("张三提供", findName);
    	String regexp = "<span name=\"\\d{4}\">[a-zA-Z0-9]{1,}</span>";
    	Pattern p = Pattern.compile(regexp);
    	Matcher m = p.matcher(content);
    	while(m.find()){
    		String group = m.group();
    		content = content.replaceAll(group, findDicNumAndCode(group));
//    		System.out.println(group + "----" + findDicNumAndCode(group));
    	}
    	//替换id的标记（xsl文件里面id的标记为：a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163）
    	content = content.replace("a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163", id);
    	OutputStream os = new FileOutputStream(toFile);
    	os.write(content.getBytes("GBK"));
    	os.flush();
    	os.close();
    	return true;
    }
    /**
     * 生成查无此人的html报告(个人)
     * @param filePath
     * @return
     * @throws Exception
     */
    public static boolean createHtml_per(String filePath,PageData pd) throws Exception{
    	List<Map<String, String>> listMap = CacheController.getListMap("CRED_TYPE_PER");
		Map<String,String> dicMap = ObjectUtil.listToMap2(listMap, "key", "value");
    	//替换模板的目标数据
    	String systemUserName, name, idtype, idnum, flow_id = null;
    	systemUserName = pd.getString("QUERY_NAME");
    	name = pd.getString("CLIENT_NAME");
    	idtype = pd.getString("ID_TYPE");
    	idnum = pd.getString("ID_NUM");
    	flow_id = pd.getString("ID");
    	
    	String modelPath = PathUtil.getClasspath() + Const.FILEPATHFILE + "AAA001_P.html"; //模板路径
    	File fromfile = new File(modelPath);
    	File toFile = new File(filePath);   	
    	encoding="GBK";
    	FileUtil.writeFile(filePath, "",encoding);
    	String content = FileUtils.readFileToString(fromfile,encoding); //模板内容
    	content = content.replace("张三提供", systemUserName+"提供"); //替换水印
    	content = content.replace("李四", name); //客户名称
		content = content.replace("身份证", dicMap.get(idtype)); //证件类型
		content = content.replace("371701198904116037", idnum); //证件号码
    	content = content.replace("a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163", flow_id); //流程id，为了记录打印次数
    	OutputStream os = new FileOutputStream(toFile);
    	os.write(content.getBytes("GBK"));
    	os.flush();
    	os.close();
    	return true;
    }
    /**
     * 生成查无此人的html报告(企业)
     * @param filePath
     * @return
     * @throws Exception
     */
    public static boolean createHtml_com(String filePath,PageData pd) throws Exception{
//    	String systemUserName, name, idtype, idno, flow_id = null;
//    	systemUserName = pd.getString("SYSTEM_USERNAME");
//    	name = pd.getString("NAME");
//    	idtype = pd.getString("IDTYPE");
//    	idno = pd.getString("IDNO");
//    	flow_id = pd.getString("FLOW_ID");
    	
    	String modelPath = PathUtil.getClasspath() + Const.FILEPATHFILE + "AAA001_E.html";
    	File fromfile = new File(modelPath);
    	File toFile = new File(filePath);
    	encoding = "GBK";
    	FileUtil.writeFile(filePath, "",encoding);
    	String content = FileUtils.readFileToString(fromfile,encoding);
//    	content = content.replace("张三提供", systemUserName+"提供");
//    	content = content.replace("李四", name);
//    	List<Map<String, String>> listMap = CacheController.getListMap("CRED_TYPE");
//		Map<String,String> dicMap = ObjectUtil.listToMap2(listMap, "key", "value");
//		content = content.replace("身份证", dicMap.get(idtype));
//		content = content.replace("371701198904116037", idno);
//    	content = content.replace("a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163", flow_id);
    	OutputStream os = new FileOutputStream(toFile);
    	os.write(content.getBytes("GBK"));
    	os.flush();
    	os.close();
    	return true;
    }
    
    /**
     * 解析含有字典编号和字典编码的字符串，根据解析到的数据获取数据字典值
     * @param spanContent
     * @return
     * @throws Exception 
     */
    private static String findDicNumAndCode(String spanContent){
    	try {
			if(!StringUtil.isEmpty(spanContent) && spanContent.contains("<span name=")){
				if("2019".equals(spanContent.substring(spanContent.indexOf("\"")+1,spanContent.lastIndexOf("\"")))){
//					System.out.println(11);
				}
				String name = findDicName(
						spanContent.substring(spanContent.indexOf("\"")+1,spanContent.lastIndexOf("\"")),
						spanContent.substring(spanContent.indexOf(">")+1,spanContent.lastIndexOf("<"))
						);
				if(name != null){
					return name;
				}else{
					return spanContent.substring(spanContent.indexOf(">")+1,spanContent.lastIndexOf("<"));
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
    	return spanContent.substring(spanContent.indexOf(">")+1,spanContent.lastIndexOf("<"));
    }
    /**
     * 根据字典编号和字典编码获取字典值
     * @param num
     * @param code
     * @return
     * @throws Exception
     */
    private static String findDicName(String num,String code) throws Exception{
    	if(allDicName.get(num) instanceof Map){
    		return allDicName.get(num).get(code);
    	}else{
    		return null;
    	}
    }
    
    
}  