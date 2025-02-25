package com.dcits.credit.clawer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Attributes;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dcits.credit.service.crawler.CompanyCrawlerManager;
import com.dcits.credit.util.ObjectUtil;
import com.dcits.credit.util.XmlParseUtil;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.StringUtil;

public class ComClawerUtil {

	public static void main(String[] args){	
		Map<String,String> map = new HashMap<String,String>();
		comParseHtml(map,null);
	}
	
	/**
	 * 企业页面解析
	 * @param data 里面需要报告里面没有的参数
	 * @param companyCrawlerService 执行数据库的service
	 * 查询机构代码(EA01BI01)
	 */
	@SuppressWarnings("unused")
	public static void comParseHtml(Map<String,String> data,CompanyCrawlerManager companyCrawlerService){	
		String htmlStr = null;
		try {
			htmlStr = XmlParseUtil.readXmlFile("C:/Users/lenovo/Desktop/js/company2.html", "utf-8");
 		} catch (Exception e) {
			e.printStackTrace();
		} 
		String report_id="";  //报告编号
		Document document = Jsoup.parse(htmlStr.toString());	
		PageData pd = new PageData();
		
		String flag = null;
		try{
			//查得报告
			flag = "06";
			try {
				List<Element> eles = document.getElementsByClass("m-repbody");
				int bgbz = -1; //报告标志
				int sfbz = -1; //身份标识
				int yyts = -1;  //异议提示
				int bgsm = -1; //报告说明
				int jbxx = -1;  //基本信息
				int xxgy = -1;  //信息概要
				int xdjlmx = -1; //信贷记录明细
				int fxdjlmx = -1;//非信贷记录明细
				int ggjlmx = -1;//公共记录明细
				int cwbb = -1;//财务报表
				int count = 0;
				for(int i=0;i<eles.size();i++){
					Element ele = eles.get(i);
					String str = ele.getElementsByClass("t1").toString();
					if(i==0){
						if(ele.toString().contains("报告编号") && ele.toString().contains("报告时间")){
							bgbz=i;
							count++;
						}
					}
					if(str.length()>0){
						if(str.contains("身份标识")){
							sfbz=i;
							count++;
						}else if(str.contains("异议提示")){
							yyts=i;
							count++;
						}else if(str.contains("报告说明")){
							bgsm=i;
							count++;
						}else if(str.contains("基本信息")){
							String att = ele.attributes().get("class");
							if(att.contains("secondPage")){
								jbxx=i;
								count++;
							}
						}else if(str.contains("信息概要")){
							xxgy=i;
							count++;
						}else if(str.contains("非信贷记录明细")){
							fxdjlmx=i;
							count++;
						}else if(str.contains("信贷记录明细")){
							xdjlmx=i;
							count++;
						}else if(str.contains("公共记录明细")){
							ggjlmx=i;
							count++;
						}else if(str.contains("财务报表")){
							cwbb=i;
							count++;
						}
						if(count>9){
							break;
						}
					}
				}
				ElementParseUtil parseUtil = new ElementParseUtil(companyCrawlerService);
				//报告头(报告头由1-报告标志2-身份标识3-异议提示4-报告说明，共4部分组成)
				report_id = parseUtil.reportHead(eles,bgbz,sfbz,yyts,bgsm,data.get("QUERY_ORG_CODE"));
				if(StringUtil.isEmpty(report_id)) throw new Exception("基本信息(baseInfo)入库时，report_id为空");
				//基本信息
				parseUtil.baseInfo(eles, jbxx,report_id);
				//信息概要
				parseUtil.summary(eles, xxgy, report_id);

				//信贷记录明细
				parseUtil.loadDetail(eles, xdjlmx, report_id);
				
				//非信贷记录明细
				parseUtil.noLoanSummary(eles, fxdjlmx, report_id);
				
				//公共记录明细
				parseUtil.publicInfo(eles, ggjlmx, report_id);
				
				//财务报表单元此处不解析
				
				//评级信息
				List<Element> pjxx_eles = document.getElementsByClass("t1");
				for(int i=0;i<pjxx_eles.size();i++){
					if(pjxx_eles.get(i).text().contains("评级信息")){
						parseUtil.ratingInfo(pjxx_eles,i, report_id);
					}
				}
				
				Element last = document.select("table").last();
				Elements ths = last.select("th");
				if(ths.size()==3 && ths.text().indexOf("评级日期")>-1){
					for(int j=1; j<ths.size(); j++){
						
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}		
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//第二个大单元，没有循环，没有编号 （有跨行跨列）
	private static void getLoanSummaryCHNName(Element element,PageData pd_repbody,String report_id){		
		List<Element> th = null;
		List<Element> td = null;
		for(int j_t2=1;j_t2<=element.getElementsByClass("t2").size();j_t2++){
			//通过t2标签来截取一个页面显示小单元 即一个主表+子表（一、）
			String element_start = element.getElementsByClass("t2").get(j_t2-1).text();
			String element_end = null;
			if(j_t2==element.getElementsByClass("t2").size()){
				element_end = "</table>";
			}else{
				element_end = element.getElementsByClass("t2").get(j_t2).text();
			}	
			String element_table = element.toString();
			//截取html显示的第一个小单元
			String element_t = element_table.substring(element_table.indexOf(element_start), 
					element_table.lastIndexOf(element_end));
			Document document1 = Jsoup.parse(element_t);
			PageData pd_t2 = new PageData();//每一个页面显示上的table的所有pd
			int list_count=0;
			int sub=element_start.toString().lastIndexOf("）");
			element_start = element_start.toString().substring(sub+1, element_start.toString().length()).trim(); 
			Element table = null;
			//将主表中每一个小table的td和th串成map
			for(int i=0;i<document1.getElementsByTag("TABLE").size();i++){
				String list_name = null;
				Elements elements_TH = new Elements();
				List<PageData> list = null;
				table = document1.getElementsByTag("TABLE").get(i);//第几个表	
				//信贷交易信息提示单元未声明业务大类
				if(element_start.contains("信贷交易信息提示")){
					Element colspan_ele = table.select("TR").first().getElementsByAttribute("colspan").first().clone();
					colspan_ele.text("业务大类");
					elements_TH = table.select("TR").first().getElementsByTag("TH");
					elements_TH.add(0, colspan_ele);//列标题
					list_name="信贷交易提示信息";
				}else if(table.select("TR").first().select("TH").size()==1){
					list_name = table.select("TR").first().text().trim();
					table.select("TR").first().remove();
					elements_TH = table.select("TR").first().getElementsByTag("TH");
				}
				Elements elements_TD = new Elements();
				Elements rowspan_eles = new Elements(); 
				//将合计信息提前加入到最终的pd中，并将其删除
				if(table.select("TR").last().getElementsByTag("TH").hasText()
						&&table.select("TR").last().select("TH").first().text().equals("合计")){
					
					Element counts = null; 
					counts = table.select("TR").last();
					table.select("TR").last().remove();
					pd_t2.put(element_start+"-账户数合计", counts.select("TD").first().text().trim());
				}	
				//拿到除了第一行标题之外的所有th和td
				for(int j=1;j<table.select("TR").size();j++){
					if(table.select("TR").get(j).getElementsByAttribute("rowspan").hasText())
						rowspan_eles.add(table.select("TR").get(j).getElementsByAttribute("rowspan").first());
					Elements elements1 = table.select("TR").get(j).getElementsByTag("TH");
					elements1.addAll(table.select("TR").get(j).getElementsByTag("TD"));
					elements_TD.addAll(elements1);
				} 
				//将拿到的th和td按照普通方式存起来
				for(int t=0;t<rowspan_eles.size();t++){
					int rows = Integer.parseInt(String.valueOf(rowspan_eles.get(t).attr("rowspan")));
				    for(int r=1;r<rows;r++){
				    	elements_TD.add((elements_TD.indexOf(rowspan_eles.get(t))+elements_TH.size()*r), 
				    			rowspan_eles.get(t));
				    }
					
				}
				
				//将th和td转化成map
				
				//将th和td转化成list/map
				List<PageData> elements_pd = null;
				PageData element_pd = new PageData();
				try {
					if(elements_TH.size()/elements_TD.size()==1){
						element_pd = ObjectUtil.ElementToMap(elements_TH, elements_TD);
						element_pd.put("REPORT_ID", report_id);
						pd_t2.put(list_name, element_pd);//子表
					}else{
						elements_pd = ObjectUtil.ElementsToList(elements_TH,elements_TD);
						for(PageData p : elements_pd){
							p.put("REPORT_ID", report_id);
						}
					}		
				} catch (Exception e) {
					// TODO Auto-generated catch block						
					e.printStackTrace();
				}
				//将数量等信息添加进最终的pd中
				boolean isCount = false;
				for(Element e:elements_TH){
					if(e.select("TH").text().trim().equals("业务类型")||e.select("TH").text().trim().equals("账户类型")){
						isCount = true;
						if(isCount){
							pd_t2.put(element_start+"-"+e.select("TH").text().trim()+"数量", elements_pd.size());
							pd_t2.put(list_name, elements_pd);//子表
						}
						break;
					}
				}									
			}
			pd_repbody.put(element_start, pd_t2);
		}
	}
	
	private static void colsPutToMap(PageData pd,Map<String, Object> map){
		for(String key:map.keySet()){
			pd.put(key, map.get(key));
		}	
	}
	//第一个大单元，没有循环，没有编号
	private static void getBasicCHNName(Element element,PageData pd_repbody,String report_id){		
		List<Element> th = null;
		List<Element> td = null;
		for(int j_t2=1;j_t2<=element.getElementsByClass("t2").size();j_t2++){
			//通过t2标签来截取一个页面显示小单元 即一个主表+子表（一、）
			String element_start = element.getElementsByClass("t2").get(j_t2-1).text();
			String element_end = null;
			if(j_t2==element.getElementsByClass("t2").size()){
				element_end = "</table>";
			}else{
				element_end = element.getElementsByClass("t2").get(j_t2).text();
			}	
			String element_table = element.toString();
			//截取html显示的第一个小单元
			String element_t = element_table.substring(element_table.indexOf(element_start), 
					element_table.lastIndexOf(element_end));
			Document document1 = Jsoup.parse(element_t);
			PageData pd_t2 = new PageData();//每一个页面显示上的table的所有pd
			int list_count=0;
			Element table = null;
			//将主表中每一个小table的td和th串成map
			for(int i=0;i<document1.getElementsByTag("TABLE").size();i++){
				PageData map = null;
				List<PageData> list = null;
				table = document1.getElementsByTag("TABLE").get(i);//第几个表
				th = table.select("TH");//列名
				td = table.select("TD");//数据
				if(td.size()/th.size()==1){
					try {
						map = ObjectUtil.ElementToMap(th, td);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					map.put("REPORT_ID", report_id);
					if(map.containsKey("编号")){
				    	map.remove("编号");
				    	
				    	colsPutToMap(pd_t2,map);
				    }else{
				    	colsPutToMap(pd_t2,map);
				    }
				}else{
					try {
						list = ObjectUtil.ElementToList(th, td);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					for(Map<String, Object> p : list){
						p.put("REPORT_ID", report_id);
					}
					if(pd_t2.size()==0){
						pd_t2.put("sub"+list_count, list);
						list_count++;
					}else{
						if(list.get(0).containsKey("编号")){
							for(Object key:pd_t2.keySet()){	
								if(key.toString().contains("sub")){
									for(Map<String, Object> list_iteator:list){
										List<PageData> pd_t2List = (List<PageData>) pd_t2.get(key);
										for(PageData pdlist_tmp:pd_t2List){
											if(pdlist_tmp.containsKey("编号")){
												if(list_iteator.get("编号").equals(pdlist_tmp.get("编号").toString())){
													colsPutToMap(pdlist_tmp,list_iteator);
												}
											}
										}	
									}
								}
							}
							if(!pd_t2.containsKey("sub0")){
								pd_t2.put("sub"+list_count, list);
								list_count++;
							}
							
						}else{
							pd_t2.put("sub"+list_count, list);
							list_count++;
						
						}
					}		
				}
			}
			//去掉不需要的编号
			for(Object key:pd_t2.keySet()){	
				if(key.toString().contains("sub")){
					List<PageData> pd_t2List = (List<PageData>) pd_t2.get(key);
					for(PageData pdlist_tmp:pd_t2List){
						if(pdlist_tmp.containsKey("编号")){
							pdlist_tmp.remove("编号");
						}
					}	
				}
			}
			int sub=element_start.toString().lastIndexOf("）");
			element_start = element_start.toString().substring(sub+1, element_start.toString().length()).trim(); 
			pd_repbody.put(element_start, pd_t2);//将t2标签下的小单元添加到大单元中,并将小单元的名称赋给一个pd		    
		}
	}
	
}
