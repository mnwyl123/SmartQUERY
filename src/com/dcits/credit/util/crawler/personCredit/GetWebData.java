package com.dcits.credit.util.crawler.personCredit;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dcits.platform.util.Const;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;


/**
 * 解析xml文件
 * @author zhangyy
 *
 */
public class GetWebData {

	private static Logger logger = Logger.getLogger(GetWebData.class);
	
    //爬取网页数据
  	public List<PageData> getWebInfo(List<Element> eles ,int start,Map<String,String> fields){
  		//存放爬取的数据
  		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
  		List<Map<String, String>> listRecord = new ArrayList<Map<String, String>>();
  		String RecordTime = ""; //记录还款记录
  		String overTime = "";   //记录逾期或透支记录
		boolean isRecord = false;  //标记是否有还款记录
		if(!fields.isEmpty()){
			for(int i=start+1;i<eles.size();i++){
	  			//对于贷款、贷记卡以及准贷记卡明细，其中某一项有可能没有table
	  			if(eles.get(i).text().trim().contains("商业银行“")){
	  				break;
	  			}
	  			//提取table标签中的内容
				Elements ee = eles.get(i).select("TR>TD>TABLE");
				Elements ele = eles.get(i).select("TR>TD>DIV>TABLE");
				if(!ee.isEmpty()||!ele.isEmpty()){
					if(ee.isEmpty()){
						ee = ele;
					}
					List<Element> rows = ee.select("TR");
					boolean flag = false;  //区分单行数据/多行数据
					boolean moreTitle = false;  //区分是否含大表头
					boolean lastPayReocrd = false;  //记录最近24个月电信缴费记录/贷款、贷记卡逾期记录以及准贷记卡透支记录
					int rowNum =0;  //记录表头位置
					int lineNum=0;
					for(int j=0;j<rows.size();j++){
						Map<String,String> fieldKey = new HashMap<String,String>();
						List<Element> cols1 = rows.get(j).select("TD");
						List<Element> cols2 = rows.get(j).select("TD"); 
						if(cols1.size()==0){
							break;
						}
						//表示可能是table中的第二个表头
						if(rows.get(j).text().contains("编号")){
							flag=false;
						}
						//判断是否是还款记录
						if(rows.get(j).text().contains("的还款记录")){
							isRecord = true;
						}
						//判断是否含有最近24个月电信缴费记录
						if(rows.get(j).text().contains("最近24个月缴费记录")||rows.get(j).text().contains("月的逾期记录")||rows.get(j).text().contains("以上的透支记录")){
							lastPayReocrd = true;
						}
						
						if(lineNum!=0&&!rows.get(j).text().contains("特殊交易类型")&&!rows.get(j).text().contains("贷款机构说明")){
							cols1 = rows.get(lineNum).select("TD");
							cols2 = rows.get(j).select("TD");
						}else{
							lineNum=0;
						}
						//上一行不为表头，再取出相邻的下一行数据
						if(!flag&&lineNum==0){
							cols2 = rows.get(j+1).select("TD");
						}
						if(cols1.size()==cols2.size()||isRecord||lastPayReocrd){
							if(rows.get(j).text().contains("编号")&&!rows.get(j+1).text().contains("编号")){
								rowNum = j;  //用于记录表头所在行
								flag = true;
								if(lastPayReocrd){  //电信缴费记录
									fieldKey.put(cols1.get(0).text().replaceAll(" ", "").trim(), cols2.get(0).text().trim());
									String record = getPayReocrd(cols2);
									fieldKey.put(cols1.get(1).text().replaceAll(" ", "").trim(), record);
								}else{  //其它数据
									for(int t=0;t<cols2.size();t++){
										fieldKey.put(cols1.get(t).text().replaceAll(" ", "").trim(), cols2.get(t).text().trim());
									}
								}
								list.add(fieldKey);
								j++;
							}else{
								if(flag){    //多行数据
									cols1 = rows.get(rowNum).select("TD");
									if(lastPayReocrd){ //电信缴费记录
										fieldKey.put(cols1.get(0).text().replaceAll(" ", "").trim(), cols2.get(0).text().trim());
										String record = getPayReocrd(cols2);
										fieldKey.put(cols1.get(1).text().replaceAll(" ", "").trim(), record);
									}else{ //其它数据
										for(int t=0;t<cols2.size();t++){
											fieldKey.put(cols1.get(t).text().replaceAll(" ", "").trim(), cols2.get(t).text().trim());
										}
									}
									list.add(fieldKey);
								}else{   //单行数据
									if(moreTitle){  ///含有大表头
										for(int t=0;t<cols2.size();t++){
											fieldKey.put(cols1.get(t).text().replaceAll(" ", "").trim()+t, cols2.get(t).text().trim());
										}
									}else if(isRecord){ //还款记录
										String strReocrd = "";
										RecordTime = cols1.get(0).text().replaceAll(" ", "").trim();
										for(int t=0;t<cols2.size();t++){
											strReocrd += cols2.get(t).text().trim(); 
				  	  					}
										//strReocrd = strReocrd.substring(0, strReocrd.length()-1);中间无逗号，不用去掉最后一位
										fieldKey.put("*"+cols1.get(0).text().replaceAll(" ", "").trim().substring(16), strReocrd);
										isRecord = false;
									}else if(lastPayReocrd){ //逾期或透支记录
										if(rows.get(j).text().contains("月的逾期记录")||rows.get(j).text().contains("以上的透支记录")){
											overTime = rows.get(j).text().trim();
											j--;
										}else if(rows.get(j).text().contains("逾期月份")||rows.get(j).text().contains("透支月份")){
											lineNum=j;
											Map<String,String> dat = new HashMap<String,String>();
											for(int t=0;t<cols2.size()/2;t++){
												String st = cols1.get(t).text().replaceAll(" ", "").trim();
												dat.put(st, cols2.get(t).text().trim());
											}
											listRecord.add(dat);
											if(cols2.size()>4){
												dat = new HashMap<String,String>();
												int n=0;
												for(int t=cols2.size()-1;t>=cols2.size()/2;t--){
													n++;
													String st = cols1.get(t).text().replaceAll(" ", "").trim();
													dat.put(st, cols2.get(t).text().trim());
													if(n==3){
														break;
													}
												}
												listRecord.add(dat);
											}
										}else if(lineNum!=0){
											Map<String,String> dat = new HashMap<String,String>();
											for(int t=0;t<cols2.size()/2;t++){
												String st = cols1.get(t).text().replaceAll(" ", "").trim();
												dat.put(st, cols2.get(t).text().trim());
											}
											listRecord.add(dat);
											if(cols2.size()>4){
												dat = new HashMap<String,String>();
												int n=0;
												for(int t=cols2.size()-1;t>=cols2.size()/2;t--){
													n++;
													String st = cols1.get(t).text().replaceAll(" ", "").trim();
													dat.put(st, cols2.get(t).text().trim());
													if(n==3){
														break;
													}
												}
												listRecord.add(dat);
											}
										}else{
											for(int t=0;t<cols2.size();t++){
												String st = cols1.get(t).text().replaceAll(" ", "").trim();
												if(st.contains("添加日期")){
													st = cols1.get(t-1).text().replaceAll(" ", "").trim()+st;
												}
												fieldKey.put(st, cols2.get(t).text().trim());
											}
										}
									}else{//单行正常表
										for(int t=0;t<cols2.size();t++){
											fieldKey.put(cols1.get(t).text().replaceAll(" ", "").trim(), cols2.get(t).text().trim());
										}
									}
									list.add(fieldKey);
									j++;
								}
							}
						}else{
							moreTitle = true;
//							//提取大表头列数和列名
						}
					}
					break;
				}else{
					break;
				}
			}
		}
  		if(list.size()>1){
  			//判断是否是多行数据
  			boolean flag = false;
  			Map<String,String> map1 = list.get(0);
  			for(String str:map1.keySet()){
  				if(str=="编号"||str.equals("编号")){
  					flag = true;
  					break;
  				}
  			}
  			List<Map<String, String>> list1 = new ArrayList<Map<String, String>>();
  			if(flag){  //处理多行数据
  				for(int i=0;i<list.size()/2;i++){
  	  	  			map1 = list.get(i);
  	  	  			String colNum = map1.get("编号");
  	  	  			Map<String,String> map2 = list.get(list.size()/2+i);
  	  	  			for(int j=list.size()/2;j<list.size();j++){
  	  	  				String colNum1 = list.get(j).get("编号");
  	  	  				if(colNum==colNum1||colNum.equals(colNum1)){
  	  	  					map2 = list.get(j);
	  	  	  				map1.putAll(map2);
	  	  	  				list1.add(map1);
  	  	  					break;
  	  	  				}
  	  	  			}
  	  	  		}
  				if(list1.size()>0){
  					list = list1;
  				}
  	  	  	}else{  //处理单行数据
  	  	  		Map<String,String> map = new HashMap<String,String>();
  	  	  		for(int i=0;i<list.size();i++){
  	  	  			map.putAll(list.get(i));
  	  	  		}
  	  	  		list.clear();
  	  	  		list.add(map);
  	  	  		//逾期或透支记录
  	  	  		for(int i=0;i<listRecord.size();i++){
  	  	  			list.add(listRecord.get(i));
  	  	  		}
  	  	  	}
  	  	}
  		
  		List<PageData> listPd = new ArrayList<PageData>();
		//将中文转为数据库字段
		if(fields!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				PageData pd = new PageData();
				Map<String,String> map = list.get(i);
				for(String key:map.keySet()){
					for(String str:fields.keySet()){
						String name = fields.get(str);
						if(key==name||key.equals(name)){
							pd.put(str, map.get(key));
							break;
						}
					}
				}
				//还款记录起止时间
				if(RecordTime!=""&&!RecordTime.equals("")){
					String[] listTime = RecordTime.split("-");
					pd.put("STATEBTIME", listTime[0]);
	  	  			pd.put("STATEETIME", listTime[1].replace("的还款记录", ""));
				}
				//逾期/透支起止时间
				if(overTime!=""&&!overTime.equals("")){
					String[] listTime = overTime.split("-");
					pd.put("OVERDUE_BDATE", listTime[0]);
					if(listTime[1].contains("的逾期记录")){
						pd.put("OVERDUE_EDATE", listTime[1].replace("的逾期记录", ""));
					}else{
						pd.put("OVERDUE_EDATE", listTime[1].replace("60天以上的透支记录", ""));
					}
				}
				listPd.add(pd);
			}
			
		}
//		System.out.println("*****************************************************************************");
//		for(int i=0;i<listPd.size();i++){
//			PageData pp = listPd.get(i);
//			Iterator iter = pp.keySet().iterator();
//			while(iter.hasNext()){
//				String ss = (String) iter.next();
//				System.out.println(ss+"////"+pp.getString(ss));
//			}
//		}
		return listPd;
  	} 
  	
  	//提取电信缴费记录
  	public String getPayReocrd(List<Element> cols2){
  		String record = "";
		for(int t=1;t<cols2.size();t++){
			record += cols2.get(t).text().trim(); 
		}
		//record = record.substring(0, record.length()-1);中间无逗号，不用去掉最后一位
		return record;
  	}
}
