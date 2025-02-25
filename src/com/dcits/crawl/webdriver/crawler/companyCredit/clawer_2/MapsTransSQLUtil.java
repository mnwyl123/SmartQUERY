package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_2;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.crawl.util.PathUtil;
import com.dcits.platform.util.StringUtil;
import com.dcits.crawl.webdriver.crawler.personCredit.ReadXmlUtil;


public class MapsTransSQLUtil {

	//页面解析的结构和表结构关联，得出入库sql
	public static String mapTransSQL(Map<String,String> htmlMap, String table_name,String report_id) throws Exception{
		table_name = table_name.toLowerCase();
		Map<String,String> dbMap = readXml(table_name);
		if(dbMap == null || dbMap.size()==0) {
			throw new Exception("uploadFiles/file/COMPANY.XML文件里面缺少表("+table_name+")结构");
		}
		String encryCols = dbMap.get("encryList"); 
		List<String> encryList = null; //加密字段
		if(encryCols != null){
			encryList = Arrays.asList(encryCols.split(","));
		}
		String cols = "";
		String vals = "";
		int i = 0;
		for(String col : dbMap.keySet()){
			String colComment = dbMap.get(col);
			if(htmlMap.containsKey(colComment)){
				String val = htmlMap.get(colComment);
				if(i>0){
					cols += ",";
					vals += ",";
				}
				cols += col;
				if(encryList != null && encryList.contains(col)){
					val = DESUtil.encrypt("enhjeA==", val);
					vals += "'"+val+"'";
				}else{
					vals += "'"+val+"'";
				}
				i++;
			}
		}
		String sql = null;
		if(!cols.equals("") || !vals.equals("")){
			sql = "insert into "+table_name+"("+cols+",report_id) values ("+vals+",'"+report_id+"')";
		}else{
			String throw_str = null;
			if(htmlMap == null || htmlMap.size()==0){
				throw_str = "入库表("+table_name+")失败，传入参数htmlMap为空，请检查";
			}else{
				throw_str = "入库表("+table_name+")失败，传入参数htmlMap不为空，但没有获取到对应的字段，请检查";
			}
			throw new Exception(throw_str);
		}
		return sql;
	}
	
	//页面解析的结构和表结构关联，得出入库sql
	public static String mapTransSQL_PER(Map<String,String> htmlMap,String table_name,String table_value,String report_id) throws Exception{		
		Map<String,String> dbMap = ReadXmlUtil.readXml(table_name,table_value);
		String encryCols = dbMap.get("encryList"); 
		List<String> encryList = null; //加密字段
		if(encryCols != null){
			encryList = Arrays.asList(encryCols.split(","));
		}
		String cols = "";
		String vals = "";
		int i = 0;
		for(String col : dbMap.keySet()){
			String colComment = dbMap.get(col);
			if(htmlMap.containsKey(colComment)){
				String val = htmlMap.get(colComment);
				if(i>0){
					cols += ",";
					vals += ",";
				}
				cols += col;
				if(encryList != null && encryList.contains(col)){
					val = DESUtil.encrypt("enhjeA==", val);
					vals += "'"+val+"'";
				}else{
					vals += "'"+val+"'";
				}
				i++;
			}
		}
		String sql = null;
		if(!cols.equals("") || !vals.equals("")){
			sql = "insert into "+table_name+"("+cols+",report_id) values ("+vals+",'"+report_id+"')";
		}else{
			String throw_str = null;
			if(htmlMap == null || htmlMap.size()==0){
				throw_str = "入库表("+table_name+")失败，传入参数htmlMap为空，请检查";
			}else{
				throw_str = "入库表("+table_name+")失败，传入参数htmlMap不为空，但没有获取到对应的字段，请检查";
			}
			throw new Exception(throw_str);
		}
		return sql;
	}	
	
	public static void main(String[] args) throws Exception {
		System.out.println(matchStr("注册资本折人民币合计899.10万1元","([1-9]\\d{1,}\\.\\d{1,})"));
	}
	
	//查找字符串
	public static String matchStr(String text,String regexp){
		Pattern p = Pattern.compile(regexp);
		Matcher m = p.matcher(text);
		if(m.groupCount()>0){
			m.find();
			return m.group();
		}
		return null;
	}
	
	//递归解析XML文件
    public static Map<String,String> readXml(String table_name) throws Exception{
    	if(StringUtil.isEmpty(table_name)) return null;
    	//存放各个字段映射关系
    	Map<String,String> Listfield = new HashMap<String,String>();
    	//存放加密字段
    	StringBuffer encryfields = new StringBuffer();
		try {
			String localPath = PathUtil.getClasspath() + Const.FILEPATHFILE+"COMPANY.XML";  //文件路径
			Document parse = Jsoup.parse(new File(localPath),"UTF-8");
			Elements eles = parse.select("table[name="+table_name+"] tr td");
			for(int i=0; i<eles.size(); i++){
				String col = eles.get(i).attr("code");
				String val = eles.get(i).text();
				String encry = eles.get(i).attr("encry");
				Listfield.put(col, val);
				if("true".equals(encry)){
					encryfields.append(","+col);
				}
			}
	        if(encryfields.length()>0){
	        	Listfield.put("encryList", encryfields.toString().substring(1));
	        }
//	        System.out.println(Listfield);
		} catch (Exception e) {
			throw new Exception("配置文件读取失败!",e);
		}
		return Listfield;
    }
	
}
