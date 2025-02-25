package com.dcits.crawl.webdriver.crawler.personCredit;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.dcits.platform.util.Const;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.PathUtil;


/**
 * 解析xml文件
 * @author zhangyy
 *
 */
public class ReadXmlUtil {

	private static Logger logger = Logger.getLogger(ReadXmlUtil.class);
	
	public static void main(String[] args){
		List<PageData> map = readXml1();
		map.toString();
	}
	//递归解析XML文件
    public static List<PageData> readXml1(){
    	//存放各个字段映射关系
    	List<PageData> pdList = new ArrayList<PageData>();
    	//存放结尾字段
    	SAXReader reader = new SAXReader();
		try {
			String localPath = PathUtil.getClasspath() + Const.FILEPATHFILE+"/COLUMN2.XML";  //文件路径
			Document document = reader.read(new File(localPath));
			Element root = document.getRootElement();
			
	    	 //遍历当前元素(在此是根元素)的子元素 
			Iterator iter = root.elementIterator();
	        for (Iterator it = iter; it.hasNext();) { 
	            Element ele = (Element) it.next(); 	            
	            //获取当前元素的属性值 
	            PageData pdData = new PageData();
	            pdData.put("NAME", ele.attributeValue("NAME"));
	            pdData.put("TABLE", ele.attributeValue("TABLE"));
	            pdData.put("NAME2", ele.attributeValue("NAME2"));
	            pdData.put("TABLE2", ele.attributeValue("TABLE2"));
	            pdList.add(pdData);
	        }  
		} catch (DocumentException e) {
			logger.info("配置文件读取失败!");
			logger.error(e.getMessage());
		}
		return pdList;
    }
	
	//递归解析XML文件
    public static Map<String,String> readXml(String name,String title){
    	//存放各个字段映射关系
    	Map<String,String> Listfield = new HashMap<String,String>();
    	//存放结尾字段
    	Map<String,String> endfields = new HashMap<String,String>();
    	SAXReader reader = new SAXReader();
		try {
			String localPath = PathUtil.getClasspath() + Const.FILEPATHFILE+"/WEB.XML";  //文件路径
			//		String localPath ="D:\\WEB.XML";
			Document document = reader.read(new File(localPath));
			Element root = document.getRootElement();
			
	    	 //遍历当前元素(在此是根元素)的子元素 
			Iterator iter = root.elementIterator();
	        for (Iterator it = iter; it.hasNext();) { 
	            Element ele = (Element) it.next(); 
	            
	            //获取当前元素的NAME、LEVEL和ID属性值 
	            String tableName = ele.attributeValue("NAME"); 
	            String value = ele.attributeValue("VALUE");
	            if((tableName==name||tableName.equals(name))&&(value.trim()==title||value.trim().equals(title))){
	            	 //获取当前元素下的所有字段
	                Element fields = ele.element("FIELDS"); 
	                
	                //遍历当前元素的子元素及字段及中文名 
	                for (Iterator list = fields.elementIterator(); list.hasNext();) { 
	                    Element field = (Element) list.next(); 
	                    String fieldName = field.attributeValue("CODE"); 
	                    String fieldValue = field.getTextTrim(); 
	                    Listfield.put(fieldName, fieldValue);
	                } 
	            }
	        }
		} catch (DocumentException e) {
			logger.info("配置文件读取失败!");
			logger.error(e.getMessage());
		}
		return Listfield;
    }
  //递归解析XML文件
    public static Map<String,String> readXmlXH(String name,String title){
    	//存放各个字段映射关系
    	Map<String,String> Listfield = new HashMap<String,String>();
    	//存放结尾字段
    	Map<String,String> endfields = new HashMap<String,String>();
    	SAXReader reader = new SAXReader();
		try {
			String localPath = PathUtil.getClasspath() + Const.FILEPATHFILE+"/WEBXH.XML";  //文件路径
			//		String localPath ="D:\\WEB.XML";
			Document document = reader.read(new File(localPath));
			Element root = document.getRootElement();
			
	    	 //遍历当前元素(在此是根元素)的子元素 
			Iterator iter = root.elementIterator();
	        for (Iterator it = iter; it.hasNext();) { 
	            Element ele = (Element) it.next(); 
	            
	            //获取当前元素的NAME、LEVEL和ID属性值 
	            String tableName = ele.attributeValue("NAME"); 
	            String value = ele.attributeValue("VALUE");
	            if((tableName==name||tableName.equals(name))&&(value.trim()==title||value.trim().equals(title))){
	            	 //获取当前元素下的所有字段
	                Element fields = ele.element("FIELDS"); 
	                
	                //遍历当前元素的子元素及字段及中文名 
	                for (Iterator list = fields.elementIterator(); list.hasNext();) { 
	                    Element field = (Element) list.next(); 
	                    String fieldName = field.attributeValue("CODE"); 
	                    String fieldValue = field.getTextTrim(); 
	                    Listfield.put(fieldName, fieldValue);
	                } 
	            }
	        }
		} catch (DocumentException e) {
			logger.info("配置文件读取失败!");
			logger.error(e.getMessage());
		}
		return Listfield;
    }
}
