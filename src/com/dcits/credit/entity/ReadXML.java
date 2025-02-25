package com.dcits.credit.entity;
import java.io.File;
import java.util.HashMap;  
import java.util.List;

import com.dcits.platform.util.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;  
import org.dom4j.Element;  
import org.dom4j.io.SAXReader;  

import com.dcits.platform.util.Const;
import com.dcits.platform.util.PathUtil;

public class ReadXML {
	 private static Logger logger = Logger.getLogger(ReadXML.class);
	 private static ReadXML xml = new ReadXML();  
     
	    /** 
	     * getXml:(读取xml文件。获取document树). <br/> 
	     * @author syzhao 
	     * @param xmlPath xml数字 
	     * @return Document 
	     * @since JDK 1.6 
	     */  
	    public static Document getXml(String xmlPath)  
	    {  
	        Document document = null;  
	        SAXReader reader = new SAXReader();    
	        try  
	        {  
	        	//document = reader.read(new File(xmlPath));
	        	document = reader.read(new File(xmlPath));
				logger.debug(document.toString());
	        }  
	        catch (DocumentException e)  
	        {
				logger.error("获取xml " + xmlPath + " 文件失败！");
				logger.error(e.getMessage(),e);;
	        }  
	        return document;  
	    }  
	      
	    /** 
	     * getSql:(获取xml中的sql语句). <br/> 
	     * @author syzhao 
	     * @param xmlPath xml路径 
	     * @param xpathExpression 元素路径 
	     * @return key：sql 
	     * @since JDK 1.6 
	     */  
	    public static HashMap<String, String> getSql(String xmlPath, String xpathExpression)  
	    {  
	        HashMap<String, String> map = new HashMap<String, String>();  
	       /* Document document=getXml(xmlPath);
	        List<Object> list = document.selectNodes(xpathExpression);  */
	        List<Object> list = getXml(xmlPath).selectNodes(xpathExpression);  
	        if (list != null && !list.isEmpty())  
	        {  
	              
	            for (Object object : list)  
	            {  
	                Element element = (Element)object;  
	                String sql = element.getTextTrim();  
	                String key = element.attributeValue("key").trim();  
	                map.put(key, sql);  
	            }  
	        }  
	        return map;  
	    }  
	    public static void main(String[] args)  
	    {  
	    	String localPath = PathUtil.getClasspath() + Const.FILEPATHFILE+"TEST.XML";  //文件路径  
	    	HashMap<String, String> map = ReadXML.getSql(localPath, "//template/sqltemplate");
	        logger.debug("map size :" + map.size());
	        for (String key : map.keySet())  
	        {
				logger.debug("key:" + key);
				logger.debug("value:" + map.get(key));
				logger.debug("-------------------------分割线----------------------");
	        }  
	          
	    }  
	}  

