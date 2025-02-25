package com.dcits.credit.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.dcits.platform.util.PageData;
import com.dcits.platform.util.StringUtil;


public class EntXmlParseUtil {
	private final static Log logger = LogFactory.getLog(EntXmlParseUtil.class);
	public static Map<String,String> allCol = null;
	public static Map<String,String> allTab = null;
	static int serial = 1000;
	static List<String> repeatPXml = new ArrayList<String>();
	static{
			repeatPXml.add("ED01");
			repeatPXml.add("ED02");
			repeatPXml.add("ED03");
			repeatPXml.add("ED04");
			repeatPXml.add("ED05");
			repeatPXml.add("ED06");
			repeatPXml.add("ED07");
			repeatPXml.add("ED08");
			repeatPXml.add("ED09");
			repeatPXml.add("EE01");
			repeatPXml.add("EF01");
			repeatPXml.add("EF02");
			repeatPXml.add("EF03");
			repeatPXml.add("EF04");
			repeatPXml.add("EF05");
			repeatPXml.add("EF06");
			repeatPXml.add("EF07");
			repeatPXml.add("EF08");
			repeatPXml.add("EF09");
			repeatPXml.add("EF10");
			repeatPXml.add("EF11");
			repeatPXml.add("EF12");
			repeatPXml.add("EF13");
			repeatPXml.add("EF14");
			repeatPXml.add("EG01");
			repeatPXml.add("EG02");
			repeatPXml.add("EG03");
			repeatPXml.add("EG04");
			repeatPXml.add("EG05");
			repeatPXml.add("EG06");
			repeatPXml.add("EG07");
			repeatPXml.add("EG08");
			repeatPXml.add("EG09");
			repeatPXml.add("EG10");
			repeatPXml.add("EH01");
			repeatPXml.add("EI01");
	}
	static Set<String> errXmlTag = new HashSet<String>();
	public static void main(String[] args) throws Exception{
		String path = "C:\\Users\\hp\\Desktop\\xml格式企业信用报告.xml";
		String xmlStr = readXmlFile(path,"GBK");
		logger.debug(xmlStr);
	}
	/**
	 * 保存
	 * @param pd
	 * @throws Exception 
	 */
	public static PageData xmlToPd(String xml) throws Exception{
		String report_id = null;
		PageData pd = parseXmlToPd(xml);
		Map<String,Object> map = new HashMap<String,Object>();
		PageData toPd = new PageData();
		transPd(map,pd);
		report_id = String.valueOf(map.get("EA01AI01"));
		dowithMap(map);
		putData(toPd,map);
		//将所有的表加入report_id
		for(Object obj : toPd.keySet()){
			Object val = toPd.get(obj);
			if(objType(val)==1){
				PageData p = (PageData) val;
				p.put("REPORT_ID", report_id);
			}else if(objType(val)==2){
				List<PageData> list = (List) val;
				for(PageData p : list){
					p.put("REPORT_ID", report_id);
				}
			}
		}
		return toPd;
	}
	/**
	 * 为了方便判断是否有子表，将子表信息是PageData类型的数据替换为List类型
	 * 例如转化前子表信息是："PC02KH":{"PC02KD02":"1"}，转化后是："PC02KH":[{"PC02KD02":"1"}]
	 * key值为6并且以"H"结尾的节点为循环节点，所以可能会出现多次，全部都以子表存放数据
	 * @param map
	 */
	public static void dowithMap(Map<String,Object> map){
		for(String key : map.keySet()){
			Object obj = null;
			if(key.length()==8){
				continue;
			}else if(key.length()==6 && key.endsWith("H")){
				obj = map.get(key);
				if(objType(obj)==2){
					continue;
				}else if(objType(obj)==1){
					List<PageData> list = new ArrayList<PageData>();
					list.add((PageData) obj);
					map.put(key, list);
				}
			}
			obj = map.get(key);
			if(objType(obj) == 1){
				dowithMap((PageData) obj);
			}else if(objType(obj) == 2){
				List<PageData> list = (List) obj;
				for(PageData pd : list){
					dowithMap(pd);
				}
			}
		}
	}
	/**
	 * 将xml文件的数据以table_name作为key，以PageData或List作为value形式放入toPd
	 * @param toPd
	 * @param data
	 */
	@SuppressWarnings({ "unused", "unchecked" })
	public static void putData(PageData toPd,Map<String,Object> data){
		try {
			Set<String> errXmlTag = new TreeSet<String>(); //缺少的标签
			for(String key : data.keySet()){
				String strkey = (String) key;
				Object objVal = data.get(key);
				String tab_name = null;
				if(8 == key.length()){
					tab_name = allTab.get(key);
					if(StringUtil.isEmpty(tab_name)){
						errXmlTag.add(key);
						continue;
					}
					String col_name = allCol.get(key);
					if(StringUtil.isEmpty(col_name)){
						errXmlTag.add(key);
						continue;
					}
					String strVal = String.valueOf(objVal).replace("null","");
					if(toPd.containsKey(tab_name)){
						Object pObj = toPd.get(tab_name);
						if(objType(pObj) == 1){
							PageData p = (PageData) pObj;
							p.put(col_name, strVal);
						}else{
						}
					}else{
						PageData pd = new PageData();
						pd.put(col_name, strVal);
						toPd.put(tab_name, pd);
					}
				}else{
					if(repeatPXml.contains(strkey)){
						if(objType(objVal) == 2){ //List
							List<PageData> list = (List) objVal;
							for(PageData pd : list){
								pdToTable(toPd,pd);
							}
						}else{
							throw new Exception("个人xml报文解析出错！");
						}
					}else{
						if(objType(objVal)==2){ //objVal是List类型
							List<PageData> list = (List) objVal;
							for(PageData pd : list){
								saveSimplePd(toPd,pd);
							}
						}else{
							if(objType(objVal)==3){
								continue;
							}else{
								throw new Exception("出现没有注意到的结构！");
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 将pd转化为可以入库的表数据
	 * @param toPd
	 * @param fromPd
	 * @throws Exception 
	 */
	public static void pdToTable(PageData toPd,PageData fromPd) throws Exception{
		if(isContainList(fromPd)){
			/***
			 * 循环套循环形式
			 */
			//添加主表信息
			serial++;
			PageData mainPd = new PageData();
			StringBuffer tabName = new StringBuffer();
			mainTableSave(mainPd,fromPd,tabName);
			if(tabName.toString().equals("")){
				throw new Exception("解析主表出错");
			}else{
				mainPd.put("SERIAL", serial);
//				if("PER_BORROW_DETAIL".equals(tabName.toString())){
//					System.out.println(fromPd);
//				}
				addPdToHeadPd(toPd,mainPd,tabName.toString());
			}
			//添加子表信息
			subTableSave(toPd,fromPd,serial+"");
		}else{
			/**
			 * 简单循环
			 * fromPd形式例如：
			 * {"PD01A":{"PD01AD10":"xx"},"PD01B":{"PD01BR02":"yy"}}
			 */
			PageData pd = new PageData();
			noListToPd(pd,fromPd);
			saveSimplePd(toPd,pd);
		}
		
	}
	/**
	 * 将简单形式的fromPd的key改变为列名放入目标toPd里面
	 * 格式例如：{"PC02AS03":"xx","PC02AD02":"yy"}
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("rawtypes")
	public static void saveSimplePd(PageData toPd,PageData fromPd) throws Exception{
		int isHaveEightTag = 0; //判断是否有8位长度的标签，如果fromPd入下形式如{PE01ZH=},此种情况下，表名是空，但是是正常情况
		String tab_name = null;
		PageData pd = new PageData();
		for(Object key : fromPd.keySet()){
			if(!keyIsEight(key)){
				if("SERIAL".equals((String) key)){
					pd.put(key, fromPd.get(key));
				}else{
					continue;
				}
			}else{
				isHaveEightTag = 1;
				if(tab_name == null) tab_name = allTab.get(key);
				String col_name = allCol.get(key);
				if(StringUtil.isEmpty(col_name)){
					errXmlTag.add((String) key);
					continue;
				}
				pd.put(col_name,fromPd.get(key));
			}
		}
		if(tab_name != null){
			addPdToHeadPd(toPd,pd,tab_name);
		}else{
			if(isHaveEightTag != 0){
				throw new Exception("下列的标签没有对应的表名，请查证！【"+fromPd.keySet().toString()+"】");
			}
		}
	}
	/**
	 * 将表名为tab_name的存放列值的fromPd插入到目标toPd里面
	 * @param toPd
	 * @param pd
	 * @param tab_name
	 */
	public static void addPdToHeadPd(PageData toPd,PageData fromPd,String tab_name){
		if(toPd.containsKey(tab_name)){
			List<PageData> list = null;
			Object val = toPd.get(tab_name);
			if(objType(val)==1){
				list = new ArrayList<PageData>();
				list.add((PageData) val);
				list.add(fromPd);
				toPd.put(tab_name, list);
			}else if(objType(val)==2){
				list = (List) toPd.get(tab_name);
				list.add(fromPd);
			}
		}else{
			toPd.put(tab_name, fromPd);
		}
	}
	
	/**
	 * 保存主表信息到toPd
	 * @param toPd
	 * @param fromPd
	 * @throws Exception 
	 */
	public static void mainTableSave(PageData toPd,PageData fromPd,StringBuffer tabName) throws Exception {
		for(Object key : fromPd.keySet()){
			Object val = fromPd.get(key);
			if("".equals(val)) continue;
			if(val instanceof PageData){
				mainTableSave(toPd,(PageData) val,tabName);
			}else if(val instanceof List){
				continue;
			}else{
				if(keyIsEight(key)){
					if(tabName.toString().equals("")) tabName.append(allTab.get(key));
					String col_name = allCol.get(key);
					if(StringUtil.isEmpty(col_name)){
						errXmlTag.add((String) key);
						continue;
					}
					toPd.put(col_name, val);
				}else{
					if(!(((String)key).length()==6 && ((String)key).endsWith("H"))){
						throw new Exception("mainTableSave方法传入的参数格式不正确!");
					}
				}
			}
			
		}
	}
	
	/**
	 * 将fromPd里面的子表信息存起来
	 * @param toPd
	 * @param fromPd
	 * @throws Exception 
	 */
	public static void subTableSave(PageData toPd,PageData fromPd,String serial) throws Exception{
		for(Object key : fromPd.keySet()){
			Object val = fromPd.get(key);
			if(objType(val)==1){
				if(isContainList((PageData) val)){
					subTableSave(toPd,(PageData) val,serial);
				}else{
					continue;
				}
			}else if(objType(val)==2){
				if(((String) key).length()==6){ //最里面的循环的父标签为6位数标签
					List<PageData> list = (List) val;
					for(PageData pd : list){
						pd.put("SERIAL", serial);
						saveSimplePd(toPd,pd);
					}
				}else{
					throw new Exception("subTableSave方法传入的参数格式不正确!");
				}
			}else{
				continue;
			}
		}
	}
	
	/**
	 * 将不包含List的PageData转化为一个简单的pd
	 * 例如：{"PD01A":{"PD01AD10":"3"},"PD01B":{"PD01BR02":"2013-10-10"}}->{"PD01AD10":"3","PD01BR02":"2013-10-10"}
	 * @param toPd
	 * @param fromPd
	 */
	public static void noListToPd(PageData toPd,PageData fromPd) throws Exception{
		for(Object key : fromPd.keySet()){
			Object val = fromPd.get(key);
			if(keyIsEight(key)){
				toPd.put(key, val);
			}else{
				if(objType(val)==1){
					noListToPd(toPd,(PageData) val);
				}else if(objType(val)==2){
					throw new Exception("noListToPd方法传入的参数格式不正确，里面有List存在!");
				}
			}
		}
	}
	/**
	 * key值是否是8位
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public static boolean keyIsEight(Object obj) throws Exception{
		if(obj instanceof String){
			if(((String) obj).length()==8){
				return true;
			}else{
				return false;
			}
		}else{
			throw new Exception("keyIsEight方法传入参数格式错误!");
		}
	}
	
	/**
	 * pd里面是否含有List
	 * @param pd
	 * @return
	 */
	public static boolean isContainList(PageData pd){
		String strPd = pd.toString();
		if(strPd.contains("[")){
			return true;
		}
		return false ;
	}
	
	/**
	 * 将解析xml得到的pd转为可以直接获取元素值的map
	 * @param map
	 * @param pd
	 */
	public static void transPd(Map<String,Object> map,PageData pd){
		for(Object obj : pd.keySet()){
			String key = (String) obj;
			Object object = pd.get(key);
			if(objType(object) != 1){ //不是pd
				if(objType(object) == 2){
					List<PageData> list = (List) object;
					if(map.containsKey(key)){
						Object mapVal = map.get(key);
						if(objType(mapVal)==1){
							list.add((PageData) mapVal);
						}else if(objType(mapVal)==2){
							List<PageData> mapListVal = (List) mapVal;
							for(PageData pa : mapListVal){
								list.add(pa);
							}
						}
					}
					map.put(key, list);
				}
				map.put(key, object);
			}else{
				transPd(map,(PageData)object);
			}
		}
	}
	/**
	 * obj类型
	 * @param obj
	 * @return
	 */
	public static int objType(Object obj){
		if(obj instanceof PageData){
			return 1;
		}else if(obj instanceof List){
			return 2;
		}else if(obj instanceof String){
			return 3;
		}
		return 0;
	}
	
	/**
	 * 将xml类型的字符串解析为pd
	 * @param xml
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static PageData parseXmlToPd(String xml) throws Exception{
		PageData pd = new PageData();
		if(!xml.startsWith("<?xml version=")){
			xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+xml;
		}
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		elementToPd(pd,root.elements());
		return pd;
	}
	/**
	 * 将节点下的元素添加到pd里面，如果节点下有多条记录，则存为List<PageData>形式
	 * @param pd
	 * @param elements
	 */
	@SuppressWarnings("unchecked")
	public static void elementToPd(PageData pd,List<Element> elements){
		for(Element element : elements){
			if(element.elements().size() != 0){
				PageData childPd = new PageData();
				if(RepeatChild(element.elements()).size()>0){
					//有重复元素
					Set<String> RepeatSet = RepeatChild(element.elements());
					//重复元素
					for(String attrName : RepeatSet){
						String eightVal = null; //存放长度为8位但有重复元素的值，将此值以“|”连接到一块
						List<PageData> list = new ArrayList<PageData>();
						List<Element> li = element.elements(attrName);
						String key = attrName;
						for(Element el : li){
							if(attrName.length()==8){
								if(eightVal==null) eightVal = String.valueOf(el.getData()).replace("null", "");
								else eightVal += "|"+String.valueOf(el.getData()).replace("null", "");
								element.remove(el); //去掉重复的节点
								continue;
							}
							PageData p = new PageData();
							if(el.elements().size()>0){
								//重复元素有子节点
								elementToPd(p,el.elements());
								list.add(p);
								element.remove(el); //去掉重复的节点
							}else{
								key = element.getName();
								//重复元素没有子节点
								p.put(el.getName(), el.getData());
								list.add(p);
								element.remove(el); //去掉重复的节点
							}
						}
						if(attrName.length()==8){
							childPd.put(key, eightVal); 
						}else{
							childPd.put(key, list); //将重复元素存放为List<PageData>形式
						}
						
					}
					//不重复元素
					elementToPd(childPd,element.elements());
				}else{
					elementToPd(childPd,element.elements());
				}
				pd.put(element.getName(), childPd);
			}else{
				String name = element.getName();
				String val = String.valueOf(element.getData());
				pd.put(name, val);
			}
		}
	}
	/**
	 * 查找Element的子节点的重复元素的属性名称
	 * @param elements
	 * @return
	 */
	public static Set<String> RepeatChild(List<Element> elements){
		PageData pd = new PageData();
		Set<String> repeatNode = new HashSet<String>(); //重复元素
		for(Element element : elements){
			if(pd.containsKey(element.getName())){
				repeatNode.add(element.getName());
			}
			pd.put(element.getName(), null);
		}
		return repeatNode;
	}
	
	/**
	 * 读取xml文件
	 * @param path
	 * @return
	 * @throws Exception
	 */
	public static String readXmlFile(String path,String encoding) throws Exception{
		StringBuffer sb = new StringBuffer();
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
		return sb.toString();
	}	
	/*public static void main(String[] args) throws Exception{
		String path = "C:\\Users\\hp\\Desktop\\xml格式企业信用报告.xml";
		String xmlStr = readXmlFile(path);
		PageData pd = parseXmlToPd(xmlStr);
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String, PageData> toMap = new HashMap<String,PageData>();
		PageData toPd = new PageData();
	    transPd(map, pd);
		dowithMap(pd);
		saveData(toPd,map);
//		System.out.println(JSONObject.fromObject(map));
		System.out.println(JSONObject.fromObject(toPd));
//		System.out.println(map);
//		System.out.println(pd);
	}
	*//**
	 * 将xml文件的数据以table_name作为key，以PageData或List作为value形式放入toPd
	 * @param toPd
	 * @param data
	 *//*
	@SuppressWarnings({ "unused", "unchecked" })
	public static void saveData(PageData toPd,Map<String,Object> data){
		try {
			Set<String> errXmlTag = new TreeSet<String>(); //缺少的标签
			for(String key : data.keySet()){
				String strkey = (String) key;
				if("EB05B".equals(strkey)){
					System.out.println("001");
				}
				Object objVal = data.get(key);
				String tab_name = null;
				if(8 == key.length()){
					tab_name = allTab.get(key);
					if(StringUtil.isEmpty(tab_name)){
						errXmlTag.add(key);
						continue;
					}
					String col_name = allCol.get(key);
					String strVal = String.valueOf(objVal).replace("null","");
					if(toPd.containsKey(tab_name)){
						Object pObj = toPd.get(tab_name);
						if(objType(pObj) != 1){
//							System.out.println(pObj.toString());
//							System.out.println("list");
						}else{
							PageData p = (PageData) pObj;
							p.put(col_name, strVal);
						}
					}else{
						PageData pd = new PageData();
						pd.put(col_name, strVal);
						toPd.put(tab_name, pd);
					}
				}else{
					if(repeatPXml.contains(strkey)){
						if(objType(objVal) == 2){ //List
							List<PageData> list = (List) objVal;
							for(PageData pd : list){
								pdToTable(toPd,pd);
							}
						}else{
							throw new Exception("企业xml报文解析出错！");
						}
					}else{
						if(objType(objVal)==2){ //objVal是List类型
							List<PageData> list = (List) objVal;
							for(PageData pd : list){
								saveSimplePd(toPd,pd);
							}
						}else{
							if(objType(objVal)==3){
								continue;
							}else{
								throw new Exception("出现没有注意到的结构！");
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*//**
	 * 将pd转化为可以入库的表数据
	 * @param toPd
	 * @param fromPd
	 * @throws Exception 
	 *//*
	public static void pdToTable(PageData toPd,PageData fromPd) throws Exception{
		if(isContainList(fromPd)){
			*//***
			 * 循环套循环形式
			 *//*
			//添加主表信息
			serial++;
			PageData mainPd = new PageData();
			StringBuffer tabName = new StringBuffer();
			mainTableSave(mainPd,fromPd,tabName);
			if(tabName.toString().equals("")){
				throw new Exception("解析主表出错");
			}else{
				mainPd.put("SERIAL", serial);
				addPdToHeadPd(toPd,mainPd,tabName.toString());
			}
			//添加子表信息
			subTableSave(toPd,fromPd,serial+"");
		}else{
			*//**
			 * 简单循环
			 * fromPd形式例如：
			 * {"PD01A":{"PD01AD10":"xx"},"PD01B":{"PD01BR02":"yy"}}
			 *//*
			PageData pd = new PageData();
			noListToPd(pd,fromPd);
			saveSimplePd(toPd,pd);
		}
		
	}
	*//**
	 * pd里面是否含有List
	 * @param pd
	 * @return
	 *//*
	public static boolean isContainList(PageData pd){
		String strPd = pd.toString();
		if(strPd.contains("[")){
			return true;
		}
		return false ;
	}
	*//**
	 * 保存主表信息到toPd
	 * @param toPd
	 * @param fromPd
	 * @throws Exception 
	 *//*
	public static void mainTableSave(PageData toPd,PageData fromPd,StringBuffer tabName) throws Exception {
		for(Object key : fromPd.keySet()){
			Object val = fromPd.get(key);
			if("".equals(val)) continue;
			if(val instanceof PageData){
				mainTableSave(toPd,(PageData) val,tabName);
			}else if(val instanceof List){
				continue;
			}else{
				if(keyIsEight(key)){
					if(tabName.toString().equals("")) tabName.append(allTab.get(key));
					toPd.put(allCol.get(key), val);
				}else{
//					if(!(((String) key).length()==6 && ((String) key).endsWith("H"))){
//						throw new Exception("mainTableSave方法传入的参数格式不正确!");
//					}
					throw new Exception("mainTableSave方法传入的参数格式不正确!");
				}
			}
		}
	}
	*//**
	 * 将表名为tab_name的存放列值的fromPd插入到目标toPd里面
	 * @param toPd
	 * @param pd
	 * @param tab_name
	 *//*
	public static void addPdToHeadPd(PageData toPd,PageData fromPd,String tab_name){
		if(toPd.containsKey(tab_name)){
			List<PageData> list = null;
			Object val = toPd.get(tab_name);
			if(objType(val)==1){
				list = new ArrayList<PageData>();
				list.add((PageData) val);
				list.add(fromPd);
				toPd.put(tab_name, list);
			}else if(objType(val)==2){
				list = (List) toPd.get(tab_name);
				list.add(fromPd);
			}
		}else{
			toPd.put(tab_name, fromPd);
		}
	}
	*//**
	 * 将fromPd里面的子表信息存起来
	 * @param toPd
	 * @param fromPd
	 * @throws Exception 
	 *//*
	public static void subTableSave(PageData toPd,PageData fromPd,String serial) throws Exception{
		for(Object key : fromPd.keySet()){
			Object val = fromPd.get(key);
			if(objType(val)==1){
				if(isContainList((PageData) val)){
					subTableSave(toPd,(PageData) val,serial);
				}else{
					continue;
				}
			}else if(objType(val)==2){
				if(((String) key).length()==6){ //最里面的循环的父标签为6位数标签
					List<PageData> list = (List) val;
					for(PageData pd : list){
						pd.put("SERIAL", serial);
						saveSimplePd(toPd,pd);
					}
				}else{
					throw new Exception("subTableSave方法传入的参数格式不正确!");
				}
			}else{
				continue;
			}
		}
	}
	
	*//**
	 * 将不包含List的PageData转化为一个简单的pd
	 * 例如：{"PD01A":{"PD01AD10":"3"},"PD01B":{"PD01BR02":"2013-10-10"}}->{"PD01AD10":"3","PD01BR02":"2013-10-10"}
	 * @param toPd
	 * @param fromPd
	 *//*
	public static void noListToPd(PageData toPd,PageData fromPd) throws Exception{
		for(Object key : fromPd.keySet()){
			Object val = fromPd.get(key);
			if(keyIsEight(key)){
				toPd.put(key, val);
			}else{
				if(objType(val)==1){
					noListToPd(toPd,(PageData) val);
				}else if(objType(val)==2){
					throw new Exception("noListToPd方法传入的参数格式不正确，里面有List存在!");
				}
			}
		}
	}
	*//**
	 * 将简单形式的fromPd的key改变为列名放入目标toPd里面
	 * 格式例如：{"PC02AS03":"xx","PC02AD02":"yy"}
	 * @param pd
	 * @return
	 * @throws Exception 
	 *//*
	@SuppressWarnings("rawtypes")
	public static void saveSimplePd(PageData toPd,PageData fromPd) throws Exception{
		int isHaveEightTag = 0; //判断是否有8位长度的标签，如果fromPd入下形式如{PE01ZH=},此种情况下，表名是空，但是是正常情况
		String tab_name = null;
		PageData pd = new PageData();
		for(Object key : fromPd.keySet()){
			if(!keyIsEight(key)){
				if("SERIAL".equals((String) key)){
					pd.put(key, fromPd.get(key));
				}else{
					continue;
				}
			}else{
				isHaveEightTag = 1;
				if(tab_name == null) tab_name = allTab.get(key);
				pd.put(allCol.get(key),fromPd.get(key));
			}
		}
		if(tab_name != null){
			addPdToHeadPd(toPd,pd,tab_name);
		}else{
			if(isHaveEightTag != 0){
				throw new Exception("下列的标签没有对应的表名，请查证！【"+fromPd.keySet().toString()+"】");
			}
		}
	}
	*//**
	 * key值是否是8位
	 * @param obj
	 * @return
	 * @throws Exception
	 *//*
	public static boolean keyIsEight(Object obj) throws Exception{
		if(obj instanceof String){
			if(((String) obj).length()==8){
				return true;
			}else{
				return false;
			}
		}else{
			throw new Exception("keyIsEight方法传入参数格式错误!");
		}
	}

	*//**
	 * obj类型
	 * @param obj
	 * @return
	 *//*
	public static int objType(Object obj){
		if(obj instanceof PageData){
			return 1;
		}else if(obj instanceof List){
			return 2;
		}else if(obj instanceof String){
			return 3;
		}
		return 0;
	}
	*//**
	 * 将需要建立子表，单结构为pd的元素放入List里面
	 * @param map
	 *//*
	public static void dowithMap(Map<String,Object> map){
		for(String key : map.keySet()){
			Object obj = null;
			if(key.length()==8){
				continue;
			}else if(key.length()==6){
				if(key.endsWith("H")){
					obj = map.get(key);
					if(objType(obj)==2){
						continue;
					}else if(objType(obj)==1){
						List<PageData> list = new ArrayList<PageData>();
						list.add((PageData) obj);
						map.put(key, list);
					}
				}
			}
			obj = map.get(key);
			if(objType(obj) == 1){
				dowithMap((PageData) obj);
			}else if(objType(obj) == 2){
				List<PageData> list = (List) obj;
				for(PageData pd : list){
					dowithMap(pd);
				}
			}
		}
	}

	*//**
	 * 将解析xml得到的pd转为可以直接获取元素值的map
	 * @param map
	 * @param pd
	 *//*
	public static void transPd(Map<String,Object> map,PageData pd){
		for(Object obj : pd.keySet()){
			String key = (String) obj;
			Object object = pd.get(key);
			if(objType(object) != 1){ //不是pd
				if(objType(object) == 2){
					List<PageData> list = (List) object;
					if(map.containsKey(key)){
						Object mapVal = map.get(key);
						if(objType(mapVal)==1){
							list.add((PageData) mapVal);
						}else if(objType(mapVal)==2){
							List<PageData> mapListVal = (List) mapVal;
							for(PageData pa : mapListVal){
								list.add(pa);
							}
						}
					}
					map.put(key, list);
				}
				map.put(key, object);
			}else{
				transPd(map,(PageData)object);
			}
		}
	}
	*//**
	 * obj是否是PageData
	 * @param obj
	 * @return
	 *//*
	public static boolean isPd(Object obj){
		if(obj instanceof PageData){
			return true;
		}
		return false;
	}
	
	
	@SuppressWarnings("unchecked")
	public static PageData parseXmlToPd(String xml) throws Exception{
		PageData pd = new PageData();
		if(!xml.startsWith("<?xml version=")){
			xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+xml;
		}
		Document doc = DocumentHelper.parseText(xml);
		Element root = doc.getRootElement();
		elementToPd2(pd,root.elements());
		return pd;
	}
	
	
	@SuppressWarnings("unchecked")
	public static void elementToPd2(PageData pd,List<Element> elements){
		for(Element element : elements){
			if(element.elements().size() != 0){
				PageData childPd = new PageData();
				if(RepeatChild(element.elements()).size()>0){
					//有重复元素
					Set<String> RepeatSet = RepeatChild(element.elements());
					//重复元素
					for(String attrName : RepeatSet){
						List<PageData> list = new ArrayList<PageData>();
						List<Element> li = element.elements(attrName);
						String key = attrName;
						for(Element el : li){
							PageData p = new PageData();
							if(el.elements().size()>0){
								//重复元素有子节点
								elementToPd2(p,el.elements());
								list.add(p);
								element.remove(el); //去掉重复的节点
							}else{
								key = element.getName();
								//重复元素没有子节点
								p.put(el.getName(), el.getData());
								list.add(p);
								element.remove(el); //去掉重复的节点
							}
						}
						childPd.put(key, list); //将重复元素存放为List<PageData>形式
					}
					//不重复元素
					elementToPd2(childPd,element.elements());
				}else{
					elementToPd2(childPd,element.elements());
				}
				pd.put(element.getName(), childPd);
			}else{
				String name = element.getName();
				String val = String.valueOf(element.getData());
				pd.put(name, val);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public static void elementToPd(PageData pd,List<Element> elements){
		for(Element element : elements){
			if(element.elements().size() != 0){
				if(RepeatChild(element.elements()).size()>0){
					//有重复元素
					Set<String> RepeatSet = RepeatChild(element.elements());
					//重复元素
					for(String attrName : RepeatSet){
						List<PageData> list = new ArrayList<PageData>();
						List<Element> li = element.elements(attrName);
						if(attrName=="PD02BR02"){
							System.out.println(111);
						}
						String key = attrName;
						for(Element el : li){
							PageData p = new PageData();
							if(el.elements().size()>0){
								//重复元素有子节点
								elementToPd(p,el.elements());
								list.add(p);
								element.remove(el); //去掉重复的节点
							}else{
								key = element.getName();
								//重复元素没有子节点
								p.put(el.getName(), el.getData());
								list.add(p);
								element.remove(el); //去掉重复的节点
							}
						}
						pd.put(key, list); //将重复元素存放为List<PageData>形式
					}
					//不重复元素
					elementToPd(pd,element.elements());
				}else{
					elementToPd(pd,element.elements());
				}
			}else{
				String name = element.getName();
				String val = String.valueOf(element.getData());
				pd.put(name, val);
			}
		}
	}
	*//**
	 * 查找Element的子节点的重复元素的属性名称
	 * @param elements
	 * @return
	 *//*
	public static Set<String> RepeatChild(List<Element> elements){
		PageData pd = new PageData();
		Set<String> repeatNode = new HashSet<String>(); //重复元素
		for(Element element : elements){
			if(pd.containsKey(element.getName())){
				repeatNode.add(element.getName());
			}
			pd.put(element.getName(), null);
		}
		return repeatNode;
	}
	
	public static String readXmlFile(String path) throws Exception{
		StringBuffer sb = new StringBuffer();
		InputStream is = new FileInputStream(path);
		String line;
		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		line = reader.readLine();
		while(line != null){
			sb.append(line);
			sb.append("\n");
			line = reader.readLine();
		}
		reader.close();
		is.close();
		return sb.toString();
	}
	*//**
	 * 查找没有存在的xml标签
	 * @param set
	 * @param pd
	 *//*
	public static void noExists(Set<String> set,PageData pd){
	for(Object key : pd.keySet()){
		String k = (String) key;
		Object val = pd.get(k);
		if(val instanceof PageData){
			PageData p = (PageData) val;
			noExists(set,p);
		}else if(val instanceof List){
			List<PageData> list = (List) val;
			for(PageData pa : list){
				noExists(set,pa);
			}
		}else{
			if(!allCol.containsKey(k) && k.length()>=8){
				set.add(k);
			}
		}
	}
}	
	@SuppressWarnings({ "unused", "unchecked" })
	public static List<PageData> parseXmlOfString2(String xml){
		if(!xml.startsWith("<?xml version=")){
			xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+xml;
		}
		List<PageData> retList = new ArrayList<PageData>();
		String report_id = null;
		try {
			Document doc = DocumentHelper.parseText(xml);
			Element root = doc.getRootElement();
			report_id = root.element("PRH").element("PA01").element("PA01A").elementText("PA01AI01"); //报告编号
			PageData prh = PRH(root.element("PRH")); //报告头信息单元
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retList;
	}
	
	public static PageData PRH(Element element) throws Exception{
		
		return null;
	}*/
	

}
