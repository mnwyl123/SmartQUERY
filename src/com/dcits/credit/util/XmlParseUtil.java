package com.dcits.credit.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.dcits.platform.util.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.dcits.platform.util.PageData;
import com.dcits.platform.util.StringUtil;

import net.sf.json.JSONObject;

public class XmlParseUtil{
	private final static Logger logger = Logger.getLogger(XmlParseUtil.class);
	public static Map<String,String> allCol = null;
	public static Map<String,String> allTab = null;
	public static List<String> serialList = TableInfoUtil.serialList();
	static int serial = 1000;
	static Set<String> errXmlTag = new HashSet<String>();
	
	public static void main(String[] args) throws Exception{
		long sdate = System.currentTimeMillis();
		String path = "C:\\Users\\lenovo\\Desktop\\";
		String xml = XmlParseUtil.readXmlFile(path+"个人.xml", "UTF-8");
//		PageData parseXml = PersonWebSerUtil.parseXml(xml,"UTF-8");
//		String xx = parseXml.getString("ReportMessage");
//		System.out.println(xml);
		PageData toPd = xmlToPd(xml,"1");
		if(errXmlTag.size()>0){
			logger.debug(errXmlTag.toString());
		}else{
			logger.debug(JSONObject.fromObject(toPd));
		}
		logger.debug("用时"+(System.currentTimeMillis()-sdate)+"毫秒");
	}
	
	/**
	 * xml到pd
	 * @param authType 1-个人  2-企业
	 * @throws Exception 
	 */
	public static PageData xmlToPd(String xml,String authType) throws Exception{
		PageData toPd = new PageData();
		PageData pd = parseXmlToPd(xml);
		dowithPd(pd);
		String report_id = null;
		if("1".equals(authType)){
			report_id = getValue(pd,new String[]{"PRH","PA01","PA01A","PA01AI01"}); //报告编号
		}else if("2".equals(authType)){
			report_id = getValue(pd,new String[]{"EAA","EA01","EA01A","EA01AI01"}); //报告编号
		}else{
			throw new Exception("参数客户类型不正确！");
		}
		putData(toPd,pd);
		//将所有的表加入report_id
		//随机生成报告编号start（测试环境下来后删掉此部分）
//		report_id = new BigDecimal(report_id).add(new BigDecimal(new Date().getTime()+"")).toString();
		//随机生成报告编号end
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
		logger.debug("authType +++++++++++++++++++++++++++++++++++"+ authType );
		//将PER_BASIC从list转为map存进topd（特殊情况）		
		if("1".equals(authType)){
			PageData per_basic_Map = new PageData();
			logger.debug("PER_BASIC +++++++++++++++++++++++++++++++++++"+ toPd.get("PER_BASIC") );
			List<Map<String, String>> per_basic = null;
			if(toPd.get("PER_BASIC").toString().endsWith("]")) {
				per_basic =  (List<Map<String, String>>) toPd.get("PER_BASIC");
			}else {
				per_basic =  new ArrayList<Map<String, String>>();
				per_basic.add((Map<String, String>)toPd.get("PER_BASIC"));
			}
			String SERIAL = per_basic.get(0).get("SERIAL");
			for(Map<String, String> obj:per_basic){
				for(String obj_string:obj.keySet()) {
					if(!obj_string.equals("SERIAL")){
						per_basic_Map.put(obj_string , obj.get(obj_string));						
					}
						
				}
				
			}
			per_basic_Map.put("SERIAL", SERIAL);
			toPd.put("PER_BASIC", per_basic_Map);
		}		
		return toPd;
	}
	/**
	 * xml到pd(接口用)
	 * @param pd
	 * @param authType 1-个人  2-企业
	 * @throws Exception 
	 */
	public static PageData xmlToPdInterface(String xml,String authType) throws Exception{
		PageData toPd = new PageData();
		PageData pd = parseXmlToPd(xml);
		dowithPd(pd);
		String report_id = null;
		if("1".equals(authType)){
			report_id = getValue(pd,new String[]{"PRH","PA01","PA01A","PA01AI01"}); //报告编号
		}else if("2".equals(authType)){
			report_id = getValue(pd,new String[]{"EAA","EA01","EA01A","EA01AI01"}); //报告编号
		}else{
			throw new Exception("参数客户类型不正确！");
		}
		toPd.put("REPORT_ID",report_id);
		putData(toPd,pd);
		return toPd;
	}
	
	public static void putData(PageData toPd,PageData fromPd) throws Exception{
		for(Object obj : fromPd.keySet()){
			String key = (String) obj;
			Object val = fromPd.get(key);
			if(key.length()==3){//数据块
				if(val != null && objType(val)!=3){ //数据块不为空且不是String类型
					putData(toPd,(PageData) val);
				}
			}else if(key.length()==4){//信息单元
				if(val == null || objType(val)==3){ //数据块不为空且不是String类型
					continue;
				}
				if(objType(val)==1){
					pdToTable(toPd,(PageData) val);
				}else if(objType(val)==2){
					List<PageData> list = (List) val;
					for(PageData p : list){
						pdToTable(toPd,p);
					}
				}else{
					throw new Exception("xml报文解析出错！");
				}
			}
		}
	}
	/**
	 * 查看是否有子表
	 * @param pd
	 * @return
	 */
	public static boolean isHaveChild(PageData pd){
		String content = pd.toString().replaceAll(" ", "");
		String[] split = content.split("=|,|\\{|\\}");
	    for(String str :split){
	    	if(str != null && str.length()==6 && str.endsWith("H")){
	    		return true;
	    	}
	    }
	    return false;
	}
	
	/**
	 * 使用于pd里面一直是pd的格式
	 * @param pd 例如：PRH={PA01={PA01B={PA01BI01=440901197709194316}}}
	 * @param arr 例如：{"PRH","PA01","PA01B","PA01BI01"}
	 * @return 则返回值：440901197709194316，否则返回空
	 * @throws Exception 
	 */
	public static String getValue(PageData pd,String[] arr) throws Exception{
		String rtn = null;
		try {
			PageData tmp = new PageData();
			tmp = (PageData) pd.get(arr[0]);
			for(int i=1;i<arr.length;i++){
				if(i<arr.length-1){
					tmp = (PageData) tmp.get(arr[i]);
				}else{
					rtn = String.valueOf(tmp.get(arr[i])).replace("null","");
				}
			}
		} catch (Exception e) {
			throw new Exception("【获取值的方法出错，方法名称：getValue】");
		}
		return rtn;
	}
	
	/**
	 * 为了方便判断是否有子表，将子表信息是PageData类型的数据替换为List类型
	 * 例如转化前子表信息是："PC02KH":{"PC02KD02":"1"}，转化后是："PC02KH":[{"PC02KD02":"1"}]
	 * key值为6并且以"H"结尾的节点为循环节点，所以可能会出现多次，全部都以子表存放数据
	 * @param map
	 */
	private static void dowithPd(PageData pd){
		for(Object objKey : pd.keySet()){
			String key = (String) objKey;
			Object obj = pd.get(key);
			if(key.length()<6){
				if(objType(obj)==1){
					dowithPd((PageData) obj);
				}else if(objType(obj)==2){
					List<PageData> list = (List) obj;
					for(PageData p : list){
						dowithPd(p);
					}
				}
			}else if(key.length()==6 && key.endsWith("H")){
				if(objType(obj)==1){
					List<PageData> list = new ArrayList<PageData>();
					list.add((PageData) obj);
					pd.put(key, list);
				}
			}else{
				continue;
			}
		}
	}
	
	/**
	 * 将pd转化为可以入库的表数据
	 * @param toPd
	 * @param fromPd
	 * @throws Exception 
	 */
	private static void pdToTable(PageData toPd,PageData fromPd) throws Exception{
		if(isHaveChild(fromPd)){ //有子表
			/***
			 * 循环套循环形式
			 */
			//添加主表信息
			String serial_num = serial(fromPd); //编号
			PageData mainPd = new PageData();
			StringBuffer tabName = new StringBuffer();
			//logger.debug("mainPd +++++++++++++++++++++++++++++++++++"+ mainPd );
			//logger.debug("fromPd +++++++++++++++++++++++++++++++++++"+ fromPd );
			mainTableSave(mainPd,fromPd,tabName);
			//logger.debug("fromPd +++++++++++++++++++++++++++++++++++"+ tabName );
			if(tabName.toString().equals("")){
				throw new Exception("解析主表出错");
			}else{
				mainPd.put("SERIAL", serial_num);
				addPdToHeadPd(toPd,mainPd,tabName.toString());
			}
			//添加子表信息
			subTableSave(toPd,fromPd,serial_num);
		}else{ //无子表
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
	 * 获取编号
	 * @param pd
	 * @return
	 */
	public static String serial(PageData pd){
		String content = pd.toString().replaceAll(" ", "");
		String[] split = content.split("=|,|\\{|\\}");
	    for(int i=0;i<split.length;i++){
	    	if(serialList.contains(split[i])){
	    		//主表本身有serial字段，此时有对应的标签，取该值关联子表
	    		return split[i+1];
	    	}
	    }
	    serial++;
		return serial+"";
	}
	/**
	 * 将简单形式的fromPd的key改变为列名放入目标toPd里面
	 * 格式例如：{"PC02AS03":"xx","PC02AD02":"yy"}
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("rawtypes")
	private static void saveSimplePd(PageData toPd,PageData fromPd) throws Exception{
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
	private static void addPdToHeadPd(PageData toPd,PageData fromPd,String tab_name){
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
	private static void mainTableSave(PageData toPd,PageData fromPd,StringBuffer tabName) throws Exception {
		for(Object obj : fromPd.keySet()){
			String key = (String) obj;
			Object val = fromPd.get(key);
			if(val == null || "".equals(val.toString())){
				continue;
			}
			//logger.debug("allCol +++++++++++++++++++++++++++++++++++"+ allCol );
			//logger.debug("key +++++++++++++++++++++++++++++++++++"+ key );
			//logger.debug("val +++++++++++++++++++++++++++++++++++"+ val+ objType(val) );
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
					if(!(key.length()==6 && key.endsWith("H"))){
						//logger.debug("key="+key+";val="+val);
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
	private static void subTableSave(PageData toPd,PageData fromPd,String serial) throws Exception{
		for(Object key : fromPd.keySet()){
			Object val = fromPd.get(key);
			if(objType(val)==1){
				if(isContainList((PageData) val)){
					subTableSave(toPd,(PageData) val,serial);
				}else{
					continue;
				}
			}else if(objType(val)==2){
				try {
					if(((String) key).length()==6){ //最里面的循环的父标签为6位数标签
						List<PageData> list = (List) val;
						for(PageData pd : list){
							pd.put("SERIAL", serial);
							saveSimplePd(toPd,pd);
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
//				}else{
//					throw new Exception("subTableSave方法传入的参数格式不正确!");
//				}
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
	private static void noListToPd(PageData toPd,PageData fromPd) throws Exception{
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
	private static boolean keyIsEight(Object obj) throws Exception{
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
	private static boolean isContainList(PageData pd){
		String strPd = pd.toString();
		if(strPd.contains("[")){
			return true;
		}
		return false ;
	}
	
	/**
	 * obj类型
	 * @param obj
	 * @return
	 */
	private static int objType(Object obj){
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
	private static PageData parseXmlToPd(String xml) throws Exception{
		PageData pd = new PageData();
		if(!xml.startsWith("<?xml version=")){
			xml = "<?xml version=\"1.0\" encoding=\"GBK\"?>"+xml;
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
	private static void elementToPd(PageData pd,List<Element> elements){
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
				//pd.put(element.getName(), childPd);
				if(pd.containsKey(element.getName())) {
					Object repeateObj = pd.get(element.getName());
					if(objType(repeateObj)==1) {
						List<PageData> list = new ArrayList<PageData>();
						list.add((PageData)repeateObj);
						list.add(childPd);
					}else if(objType(repeateObj)==2) {
						List<PageData> list = (List<PageData>) repeateObj;
						list.add(childPd);
						pd.put(element.getName(), list);
					}
				}else {
					pd.put(element.getName(), childPd);
				}
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
	private static Set<String> RepeatChild(List<Element> elements){
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
			logger.error(e.getMessage(),e);
		}
		return sb.toString();

	}
	
//	/**
//	 * 保存
//	 * @param pd
//	 * @throws Exception 
//	 */
//	public static PageData xmlToPd(String xml) throws Exception{
//		String report_id = null;
//		PageData pd = parseXmlToPd(xml);
//		Map<String,Object> map = new HashMap<String,Object>();
//		PageData toPd = new PageData();
//		transPd(map,pd);
//		report_id = String.valueOf(map.get("PA01AI01"));
////		dowithMap(map);
//		putData(toPd,map);
//		//将所有的表加入report_id
//		for(Object obj : toPd.keySet()){
//			Object val = toPd.get(obj);
//			if(objType(val)==1){
//				PageData p = (PageData) val;
//				p.put("REPORT_ID", report_id);
//			}else if(objType(val)==2){
//				List<PageData> list = (List) val;
//				for(PageData p : list){
//					p.put("REPORT_ID", report_id);
//				}
//			}
//		}
//		return toPd;
//	}
	
	
//	/**
//	 * 将解析xml得到的pd转为可以直接获取元素值的map
//	 * @param map
//	 * @param pd
//	 */
//	private static void transPd(Map<String,Object> map,PageData pd){
//		for(Object obj : pd.keySet()){
//			String key = (String) obj;
//			Object object = pd.get(key);
//			if(objType(object) != 1){ //不是pd
//				if(objType(object) == 2){
//					List<PageData> list = (List) object;
//					if(map.containsKey(key)){
//						Object mapVal = map.get(key);
//						if(objType(mapVal)==1){
//							list.add((PageData) mapVal);
//						}else if(objType(mapVal)==2){
//							List<PageData> mapListVal = (List) mapVal;
//							for(PageData pa : mapListVal){
//								list.add(pa);
//							}
//						}
//					}
//					map.put(key, list);
//				}
//				map.put(key, object);
//			}else{
//				if(key.length()==6 && key.endsWith("H")){
//					List<PageData> list = new ArrayList<PageData>();
//					list.add((PageData) object);
//					map.put(key, list);
//				}else{
//					transPd(map,(PageData)object);
//				}
//			}
//		}
//	}
//	
//	/**
//	 * 将xml文件的数据以table_name作为key，以PageData或List作为value形式放入toPd
//	 * @param toPd
//	 * @param data
//	 */
//	@SuppressWarnings({ "unused", "unchecked" })
//	private static void putData(PageData toPd,Map<String,Object> data){
//		try {
//			Set<String> errXmlTag = new TreeSet<String>(); //缺少的标签
//			for(String key : data.keySet()){
//				String strkey = (String) key;
//				Object objVal = data.get(key);
//				String tab_name = null;
//				if(8 == key.length()){
//					if(key==null){
//						System.out.println(key);
//					}
//					tab_name = allTab.get(key);
//					if(StringUtil.isEmpty(tab_name)){
//						errXmlTag.add(key);
//						continue;
//					}
//					String col_name = allCol.get(key);
//					if(StringUtil.isEmpty(col_name)){
//						errXmlTag.add(key);
//						continue;
//					}
//					String strVal = String.valueOf(objVal).replace("null","");
//					if(toPd.containsKey(tab_name)){
//						Object pObj = toPd.get(tab_name);
//						if(objType(pObj) == 1){
//							PageData p = (PageData) pObj;
//							p.put(col_name, strVal);
//						}else{
//						}
//					}else{
//						PageData pd = new PageData();
//						pd.put(col_name, strVal);
//						toPd.put(tab_name, pd);
//					}
//				}else{
//					if(repeatPXml.contains(strkey)){
//						if(objType(objVal) == 2){ //List
//							List<PageData> list = (List) objVal;
//							for(PageData pd : list){
//								pdToTable(toPd,pd);
//							}
//						}else{
//							throw new Exception("个人xml报文解析出错！");
//						}
//					}else{
//						if(objType(objVal)==2){ //objVal是List类型
//							List<PageData> list = (List) objVal;
//							for(PageData pd : list){
//								saveSimplePd(toPd,pd);
//							}
//						}else{
//							if(objType(objVal)==3){
//								continue;
//							}else{
//								throw new Exception("出现没有注意到的结构！");
//							}
//						}
//					}
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

}
