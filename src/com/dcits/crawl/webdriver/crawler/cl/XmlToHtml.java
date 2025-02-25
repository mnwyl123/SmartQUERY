package com.dcits.crawl.webdriver.crawler.cl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
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

import org.apache.commons.io.FileUtils;

import com.dc.bicenter.util.DateUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.PathUtil;
import com.dcits.platform.util.StringUtil;



  
public class XmlToHtml {  
	
//	public static Map<String,Map<String,String>> allDicName = null; //外层key：字典编号，里面key：字典编码
	public static Map<String,Map<String,String>> allDicName = ObjectUtil.dicMap(null); //外层key：字典编号，里面key：字典编码
	public static String encoding = null;
	public static Map<String, String> dictMap = new HashMap<String, String>();
  
    @SuppressWarnings("static-access")
	public static void main(String[] args) throws Exception { 
    	long sdate = System.currentTimeMillis();
    	encoding = "UTF-8";
		String path = "C:\\Users\\lenovo\\Desktop\\";
		XmlToHtml xh = new XmlToHtml();
		String fromHtmlath = "";//xh.convertXmlToHtml(path+"个人.xml","1");
		String toHtmlath = "C:\\Users\\lenovo\\Desktop\\个人单笔查询结果报文.html";
		dictHtml(toHtmlath,fromHtmlath,"","小张");
		System.out.println("用时"+(System.currentTimeMillis()-sdate)/1000+"秒");
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
    	content = content.replace("张三提供", findName+"提供");
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
     * @param name
     * @param idtype
     * @param idno
     * @return
     * @throws Exception
     */
    public static boolean createHtml_per(String filePath,PageData pd) throws Exception{
    	dictMap.put("0","身份证");
    	dictMap.put("1","户口簿");
    	dictMap.put("10","身份证");
    	dictMap.put("2","护照");
    	dictMap.put("20","军人身份证件");
    	dictMap.put("3","军官证");
    	dictMap.put("4","士兵证");
    	dictMap.put("5","港澳居民来往内地通行证");
    	dictMap.put("6","台湾同胞来往内地通行证");
    	dictMap.put("7","临时身份证");
    	dictMap.put("8","外国人居留证");
    	dictMap.put("9","警官证");
    	dictMap.put("A","香港身份证");
    	dictMap.put("B","澳门身份证");
    	dictMap.put("C","台湾身份证");
    	dictMap.put("X","其他证件");
		Map<String,String> dicMap = dictMap;
    	String systemUserName, name, idtype, idnum, flow_id = null;
    	systemUserName = pd.getString("USERNAME");
    	name = pd.getString("CLIENT_NAME");
    	idtype = pd.getString("CREDENTIALS_TYPE");
    	idnum = pd.getString("CREDENTIALS_NO");
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
     * @param name
     * @param idtype
     * @param idno
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
    	encoding="GBK";
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
			e.printStackTrace();
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