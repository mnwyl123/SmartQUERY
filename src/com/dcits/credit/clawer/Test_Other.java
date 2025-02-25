package com.dcits.credit.clawer;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dcits.credit.controller.rest.util.MyRejectedExecutionHandler;
import com.dcits.credit.entity.WebServiceRunnable_XmlToHtml;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.util.ObjectUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

public class Test_Other {
	
	private static Logger logger = Logger.getLogger(Test_Other.class);
	
	public static void main(String[] args){	
		try {	
			ThreadPoolExecutor executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize1")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize1")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime1")), TimeUnit.SECONDS,
		            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue1"))),new MyRejectedExecutionHandler());
		    IndAppReManager indAppService = null;
			WebServiceRunnable_XmlToHtml web = new WebServiceRunnable_XmlToHtml(new PageData(),indAppService);
			int i=0;
			String workQueue=BaseController.getPoolInfo().getString("workQueue1");
			int queue = Integer.parseInt(workQueue);
			while(i<100){
				executor.execute(web);				
				i++; 
				if(executor.getQueue().size()>=queue-1){
					 try {
						 logger.debug("&&&&&&&&&&&&&&&&&&&&&&&"+executor.getQueue().size()+"&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
							Thread.sleep(10000);//暂时休眠10秒
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							logger.error(e.getMessage(),e);
						}
				}
				if(i==50)
					logger.debug("*********"+executor.getQueue().size()+"***********");
			}	
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
		}
		
}	
	
	
	
	
	
	public static void main_other(String[] args){		
		
		File file = new File("F:/桌面文件夹/新建文件夹/中国人民银行征信中心222_files/征信222.html");
		StringBuffer lines= new StringBuffer();
		FileInputStream in = null;
		InputStreamReader is = null;
		BufferedReader br = null;
		try{
			in = new FileInputStream(file);
			is = new InputStreamReader(in,"utf-8");
			br = new BufferedReader(is);
			String line_tmp=br.readLine();
			while(line_tmp!=null){
				lines.append(line_tmp);
				line_tmp=br.readLine();
			  }
		}catch (Exception e1) {
			e1.printStackTrace();
		}finally{
			try {
				br.close();
				is.close();
				in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(),e);
			}	
		} 
		  
		String report_id="HDN000000001";  
		Document document = Jsoup.parse(lines.toString());		
		PageData pd = new PageData();
		try{
			//获取报告头体
			Element element = document.getElementsByClass("m-repbody").get(0);//第一个大单元
			String element_table = element.toString();
			
			PageData pd_repbody= new PageData();//第一个大单元中所有的pd		
			//第一个大单元pd处理
			getBasicCHNName(element,pd_repbody,report_id);
			element = document.getElementsByClass("m-repbody").get(1);//第二个大单元
			//第二个大单元pd处理
			getLoanSummaryCHNName(element,pd_repbody,report_id);
			
			
			logger.debug("");
					
//					.getElementsByClass("t2").get(0);//第一张表 身份信息			
//			List<PageData> tabColList = indAppReService.findTabColClawerByTag("1");
//			List<Element> rows = element.select("TR");
//			pd = getTileInfo(rows);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
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
