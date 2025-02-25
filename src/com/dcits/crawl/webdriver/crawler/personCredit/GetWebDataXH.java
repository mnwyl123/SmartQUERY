package com.dcits.crawl.webdriver.crawler.personCredit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;



/**
 * 解析xml文件
 * @author zhangyy
 *
 */
public class GetWebDataXH {

	private static Logger logger = Logger.getLogger(GetWebData.class);
	
	//爬取网页数据
  	public List<PageData> getWebInfo(List<Element> eles ,int start,Map<String,String> fields){
  		//存放爬取的数据
  		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
  		List<Map<String, String>> listRecord = new ArrayList<Map<String, String>>();
  		//说明/声明/标注
  		List<Map<String, String>> listInstruction = new ArrayList<Map<String, String>>();
  		//特殊交易类型
  		List<Map<String, String>> listSpceTrad = new ArrayList<Map<String, String>>();
  		String RecordTime = ""; //记录还款记录
  		String overTime = "";   //记录逾期或透支记录
		boolean isRecord = false;  //标记是否有还款记录
		if(!fields.isEmpty()){
			for(int i=start+1;i<eles.size();i++){
	  			//对于贷款、贷记卡以及准贷记卡明细，其中某一项有可能没有table
	  			if(eles.get(i).text().trim().contains("商业银行“")){
	  				break;
	  			}
	  			////logger.info("第i个元素的内容"+i+eles.get(i));
	  			////logger.info("第i+1个元素的内容"+i+1+eles.get(i+1));
	  			//提取table标签中的内容
				Elements ee = eles.get(i).select("TR>TD>TABLE");
				Elements ele = eles.get(i).select("TR>TD>DIV>TABLE");
				
				////logger.info(ee);
				////logger.info(ele);
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
						Map<String,String> fieldKey1 = new HashMap<String,String>();
						Map<String,String> fieldKey2 = new HashMap<String,String>();
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
							if((rows.get(j).text().contains("编号")&&!rows.get(j+1).text().contains("编号"))||(!rows.get(j).text().contains("贷款笔数")&&(rows.get(j).text().contains("机构说明")||rows.get(j).text().contains("本人声明")||rows.get(j).text().contains("异议标注")||rows.get(j).text().contains("特殊交易类型")))){
								rowNum = j;  //用于记录表头所在行
								flag = true;
								if(!rows.get(j).text().contains("贷款笔数")&&(rows.get(j).text().contains("机构说明")||rows.get(j).text().contains("本人声明")||rows.get(j).text().contains("异议标注")||rows.get(j).text().contains("特殊交易类型"))){
									lastPayReocrd=false;
								}
								if(lastPayReocrd){  //电信缴费记录
									fieldKey.put(cols1.get(0).text().replaceAll(" ", "").trim(), cols2.get(0).text().trim());
									String record = getPayReocrd(cols2);
									fieldKey.put(cols1.get(1).text().replaceAll(" ", "").trim(), record);
								}if(!rows.get(j).text().contains("贷款笔数")&&(rows.get(j).text().contains("机构说明")||rows.get(j).text().contains("本人声明")||rows.get(j).text().contains("异议标注")||rows.get(j).text().contains("特殊交易类型"))){
									if(cols1.equals(cols2)){
										cols2 = rows.get(j+1).select("TD");
									}
									for(int t=0;t<cols2.size();t++){
										String st = cols1.get(t).text().replaceAll(" ", "").trim();
										/*if(st.contains("添加日期")){
											st = cols1.get(t-1).text().replaceAll(" ", "").trim()+st;
										}*/
										if(rows.get(j).text().contains("特殊交易类型")){
											fieldKey2.put(st, cols2.get(t).text().trim());
										}else{
											fieldKey1.put(st, cols2.get(t).text().trim());
										}
									}
									
								}else{  //其它数据
									for(int t=0;t<cols2.size();t++){
										fieldKey.put(cols1.get(t).text().replaceAll(" ", "").trim(), cols2.get(t).text().trim());
									}
								}
								listSpceTrad.add(fieldKey2);
								listInstruction.add(fieldKey1);
								list.add(fieldKey);
								j++;
							}else{
								if(flag){    //多行数据
									cols1 = rows.get(rowNum).select("TD");
									if(!rows.get(j).text().contains("贷款笔数")&&(rows.get(j).text().contains("机构说明")||rows.get(j).text().contains("本人声明")||rows.get(j).text().contains("异议标注")||rows.get(j).text().contains("特殊交易类型"))){
										lastPayReocrd=false;
									}
									if(lastPayReocrd){ //电信缴费记录
										fieldKey.put(cols1.get(0).text().replaceAll(" ", "").trim(), cols2.get(0).text().trim());
										String record = getPayReocrd(cols2);
										fieldKey.put(cols1.get(1).text().replaceAll(" ", "").trim(), record);
									}if(!rows.get(j).text().contains("贷款笔数")&&(rows.get(rowNum).text().contains("机构说明")||rows.get(rowNum).text().contains("本人声明")||rows.get(rowNum).text().contains("异议标注")||rows.get(rowNum).text().contains("特殊交易类型"))){
										for(int t=0;t<cols2.size();t++){
											String st = cols1.get(t).text().replaceAll(" ", "").trim();
											/*if(st.contains("添加日期")){
												st = cols1.get(t-1).text().replaceAll(" ", "").trim()+st;
											}*/
											if(rows.get(j).text().contains("特殊交易类型")){
												fieldKey2.put(st, cols2.get(t).text().trim());
											}else{
												fieldKey1.put(st, cols2.get(t).text().trim());
											}
										}
									}else{ //其它数据
										for(int t=0;t<cols2.size();t++){
											fieldKey.put(cols1.get(t).text().replaceAll(" ", "").trim(), cols2.get(t).text().trim());
										}
									}
									listSpceTrad.add(fieldKey2);
									listInstruction.add(fieldKey1);
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
											j--;
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
  	  	  		//说明/声明/标注
  	  	  		for(int i=0;i<listInstruction.size();i++){
  	  	  			list.add(listInstruction.get(i));
  	  	  		}
  	  	  		//特殊交易
  	  	  		for(int i=0;i<listSpceTrad.size();i++){
  	  	  			list.add(listSpceTrad.get(i));
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
						String INSTRUCTION_TYPE="";
						if(key.equals("本人声明")){
							if(name.equals("异议标注")){
								INSTRUCTION_TYPE="1";
								pd.put(str, map.get(key));
								pd.put("INSTRUCTION_TYPE", INSTRUCTION_TYPE);
							}	
						}
						if(key.equals("贷款机构说明")||key.equals("发卡机构说明")){
							if(name.equals("异议标注")){
								INSTRUCTION_TYPE="0";
								pd.put(str, map.get(key));
								pd.put("INSTRUCTION_TYPE", INSTRUCTION_TYPE);
							}		
						}
						/*if(key.equals("异议标注")||key.equals("发卡机构说明")){
							if(name.equals("异议标注")){
								INSTRUCTION_TYPE="0";
								pd.put(str, map.get(key));
								pd.put("INSTRUCTION_TYPE", INSTRUCTION_TYPE);
							}		
						}*/
						if(key==name||key.equals(name)){
							if(key.equals("异议标注")){
								INSTRUCTION_TYPE="2";
								pd.put(str, map.get(key));
								pd.put("INSTRUCTION_TYPE", INSTRUCTION_TYPE);
							}else{
								pd.put(str, map.get(key));
							}
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
//		//logger.info("*****************************************************************************");
//		for(int i=0;i<listPd.size();i++){
//			PageData pp = listPd.get(i);
//			Iterator iter = pp.keySet().iterator();
//			while(iter.hasNext()){
//				String ss = (String) iter.next();
//				//logger.info(ss+"////"+pp.getString(ss));
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
  	
  	//爬取网页数据(报告基本信息和被查询人基本信息)
  	public List<PageData> getWebInfoBasic(Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		if(!fields.isEmpty()){
			Elements eleone = eles.select("TR");
			if(!eleone.isEmpty()){
				List<Element> rowsone = eleone.select("TH");
				List<Element> rowsone2 = eleone.select("TD");
				for(int ii=0;ii<rowsone.size();ii++){
					fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii+2).text());
				}
			}
  		}
  		PageData pd = new PageData();
		for(String key:fieldKeyone.keySet()){
			for(String str:fields.keySet()){
				String name = fields.get(str);
				if(name.equals(key)){
					pd.put(str, fieldKeyone.get(key));
				}	
			}
		}
		listPd.add(pd);
		return listPd;
  	}
  	
  	//爬取网页数据(身份信息)
  	public List<PageData> getWebInfoPerBasic(Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		if(!fields.isEmpty()){
  			Elements eleonet = eles.select("TABLE");
			Elements eleonet0 = eleonet.get(0).select("TR");
//			System.out.println("1--"+eleonet.get(0));
//			System.out.println("11--"+eleonet0);
			Elements eleonet1 = eleonet.get(1).select("TR");
//			System.out.println("2--"+eleonet.get(1));
//			System.out.println("22--"+eleonet1);
			Elements eleonet2 = eleonet.get(2).select("TR");
//			System.out.println("3--"+eleonet.get(2));
//			System.out.println("33--"+eleonet2);
			Element eleone0 = eleonet0.get(0);
			Element eleone1 = eleonet0.get(1);
			if(!eleonet0.isEmpty()){
				List<Element> rowsone = eleone0.select("TH");
				List<Element> rowsone2 = eleone1.select("TD");
				for(int ii=0;ii<rowsone.size();ii++){
					fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
				}
			}
			Element eleone2 = eleonet1.get(0);
			Element eleone3 = eleonet1.get(1);
			if(!eleonet1.isEmpty()){
				List<Element> rowsone = eleone2.select("TH");
				List<Element> rowsone2 = eleone3.select("TD");
				for(int ii=0;ii<rowsone.size();ii++){
					fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
				}
			}
			Element eleone4 = eleonet2.get(0);
			Element eleone5 = eleonet2.get(1);
			if(!eleonet2.isEmpty()){
				List<Element> rowsone = eleone4.select("TH");
				List<Element> rowsone2 = eleone5.select("TD");
				for(int ii=0;ii<rowsone.size();ii++){
					fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
				}
			}
  		}
  		PageData pd = new PageData();
  		long startReq = System.currentTimeMillis();
		for(String key:fieldKeyone.keySet()){
			for(String str:fields.keySet()){
				
				String name = fields.get(str);
				if(name.equals(key)){
					pd.put(str, fieldKeyone.get(key));
				}	
			}
		}
		listPd.add(pd);
		
		return listPd;
  	}
  	
  	//爬取网页数据(配偶信息)
  	public List<PageData> getWebInfoPerSpou(Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		if(!fields.isEmpty()){
			Elements eleonet = eles.select("TABLE");
			for(int i=0;i<eleonet.size();i++){
				if(eleonet.get(i).select("TR").get(0).select("TH").get(0).text().contains("姓名")){
					Elements eleonet3 = eleonet.get(i).select("TR");
					Element eleone0 = eleonet3.get(0);
					Element eleone1 = eleonet3.get(1);
					if(!eleonet3.isEmpty()){
						List<Element> rowsone = eleone0.select("TH");
						List<Element> rowsone2 = eleone1.select("TD");
						for(int ii=0;ii<rowsone.size();ii++){
							fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
						}
					}
				}
			}
			
  		}
  		PageData pd = new PageData();
  		long startReq = System.currentTimeMillis();
		for(String key:fieldKeyone.keySet()){
			for(String str:fields.keySet()){
				String name = fields.get(str);
				if(name.equals(key)){
					pd.put(str, fieldKeyone.get(key));
				}	
			}
		}
		listPd.add(pd);
		return listPd;
  	}
  	
  	//爬取网页数据(居住信息)
  	public List<PageData> getWebInfoLive(Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		if(!fields.isEmpty()){
			Elements eleonet = eles.select("TABLE");
			long startReq = System.currentTimeMillis();
			for(int i=0;i<eleonet.size();i++){
				if(eleonet.get(i).select("TR").get(0).select("TH").get(1).text().contains("居住地址")){
					Element eleonet4 = eleonet.get(i);
					List<Element> rowsone3 = eleonet4.select("TR");
					Element eleone0 = rowsone3.get(0);
					Element eleone1 = rowsone3.get(0);
					for(int j=0;j<rowsone3.size()-1;j++){
						eleone0 = rowsone3.get(0);
						eleone1 = rowsone3.get(j+1);
						if(!rowsone3.isEmpty()){
							List<Element> rowsone = eleone0.select("TH");
							List<Element> rowsone2 = eleone1.select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
							}
						}
						PageData pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
					}
				}
			}
  		}
  		
		return listPd;
  	}
  	
  	//爬取网页数据(职业信息)
  	public List<PageData> getWebInfoCareer(Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		long startReq = System.currentTimeMillis();
  		if(!fields.isEmpty()){
			Elements eleonet = eles.select("TABLE");
			for(int i=0;i<eleonet.size();i++){
				if(eleonet.get(i).select("TR").get(0).select("TH").get(1).text().contains("工作单位")){
					Element eleonet5 = eleonet.get(i);
					Element eleonet6 = eleonet.get(i+1);
					List<Element> rowsone5 = eleonet5.select("TR");
					List<Element> rowsone6 = eleonet6.select("TR");
					Element eleone50 = rowsone5.get(0);
					Element eleone51 = rowsone5.get(0);
					Element eleone60 = rowsone6.get(0);
					Element eleone61 = rowsone6.get(0);
					for(int j=0;j<rowsone5.size()-1;j++){
						eleone50 = rowsone5.get(0);
						eleone51 = rowsone5.get(j+1);
						eleone60 = rowsone6.get(0);
						eleone61 = rowsone6.get(j+1);
						if(!rowsone5.isEmpty()){
							List<Element> rowsone = eleone50.select("TH");
							List<Element> rowsone2 = eleone51.select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
							}
						}
						if(!rowsone6.isEmpty()){
							List<Element> rowsone = eleone60.select("TH");
							List<Element> rowsone2 = eleone61.select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
							}
						}
						PageData pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						//logger.info("--4PerBasicpd--"+pd);
						listPd.add(pd);
						
					}
				}
			}
  		}
		return listPd;
  	}
  	
  	//爬取网页数据(公共信息明细)
  	public List<PageData> getWebInfoPublicDetail(int no,Element eles ,int start, Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		PageData pd = new PageData();
  		if(!fields.isEmpty()){
			Elements eleone3 = eles.select("TABLE");
			for(int i=0;i<eleone3.size();i++){
				List<Element> rowsone = eleone3.get(i).select("TR");
				if(no==1&&rowsone.get(0).select("TH").get(1).text().contains("主管税务机关")){
					for(int j=1;j<rowsone.size();j++){
						List<Element> rows1 = rowsone.get(0).select("TH");
						List<Element> rows2 = rowsone.get(j).select("TH,TD");
						for(int ii=0;ii<rows1.size();ii++){
							fieldKeyone.put(rows1.get(ii).text().replace(" ", ""), rows2.get(ii).text());
						}
						//logger.info("--581p--"+fieldKeyone);
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
					}
					//logger.info("--581pt--"+listPd);
				}else if(no==2&&rowsone.get(0).select("TH").get(1).text().contains("立案法院")){
					List<Element> rowsnext = eleone3.get(i+1).select("TR");
					Element eleone50 = rowsone.get(0);
					Element eleone51 = rowsone.get(0);
					Element eleone60 = rowsnext.get(0);
					Element eleone61 = rowsnext.get(0);
					for(int j=0;j<rowsone.size()-1;j++){
						eleone50 = rowsone.get(0);
						eleone51 = rowsone.get(j+1);
						eleone60 = rowsnext.get(0);
						eleone61 = rowsnext.get(j+1);
						if(!rowsone.isEmpty()){
							List<Element> rowsone1 = eleone50.select("TH");
							List<Element> rowsone2 = eleone51.select("TD");
							for(int ii=0;ii<rowsone1.size();ii++){
								fieldKeyone.put(rowsone1.get(ii).text(), rowsone2.get(ii).text());
							}
						}
						if(!rowsnext.isEmpty()){
							List<Element> rowsone1 = eleone60.select("TH");
							List<Element> rowsone2 = eleone61.select("TD");
							for(int ii=0;ii<rowsone1.size();ii++){
								fieldKeyone.put(rowsone1.get(ii).text(), rowsone2.get(ii).text());
							}
						}
						//logger.info("--59p--"+fieldKeyone);
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						//logger.info("--59pt--"+pd);
						listPd.add(pd);
						
					}
					//logger.info("--59listPd--"+listPd);
				}else if(no==3&&rowsone.get(0).select("TH").get(1).text().contains("执行法院")){
					List<Element> rowsnext = eleone3.get(i+1).select("TR");
					Element eleone50 = rowsone.get(0);
					Element eleone51 = rowsone.get(0);
					Element eleone60 = rowsnext.get(0);
					Element eleone61 = rowsnext.get(0);
					for(int j=0;j<rowsone.size()-1;j++){
						eleone50 = rowsone.get(0);
						eleone51 = rowsone.get(j+1);
						eleone60 = rowsnext.get(0);
						eleone61 = rowsnext.get(j+1);
						if(!rowsone.isEmpty()){
							List<Element> rowsone1 = eleone50.select("TH");
							List<Element> rowsone2 = eleone51.select("TD");
							for(int ii=0;ii<rowsone1.size();ii++){
								fieldKeyone.put(rowsone1.get(ii).text(), rowsone2.get(ii).text());
							}
						}
						if(!rowsnext.isEmpty()){
							List<Element> rowsone1 = eleone60.select("TH");
							List<Element> rowsone2 = eleone61.select("TD");
							for(int ii=0;ii<rowsone1.size();ii++){
								fieldKeyone.put(rowsone1.get(ii).text(), rowsone2.get(ii).text());
							}
						}
						//logger.info("--60p--"+fieldKeyone);
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						//logger.info("--60pt--"+pd);
						listPd.add(pd);
						
					}
					//logger.info("--60listPd--"+listPd);
				}else if(no==4&&rowsone.get(0).select("TH").get(1).text().contains("处罚机构")){
					for(int j=1;j<rowsone.size();j++){
						List<Element> rows1 = rowsone.get(0).select("TH");
						List<Element> rows2 = rowsone.get(j).select("TH,TD");
						for(int ii=0;ii<rows1.size();ii++){
							fieldKeyone.put(rows1.get(ii).text(), rows2.get(ii).text());
						}
						//logger.info("--61p--"+fieldKeyone);
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
					}
					//logger.info("--61pt--"+listPd);
				}else if(no==5&&rowsone.get(0).select("TH").get(1).text().contains("参缴日期")){
					for(int j=0;j<rowsone.size()/2;j++){
						if(!rowsone.isEmpty()){
							List<Element> rowsone1 = rowsone.get(2*j+0).select("TH");
							List<Element> rowsone2 = rowsone.get(2*j+1).select("TD");
							for(int ii=0;ii<rowsone1.size();ii++){
								fieldKeyone.put(rowsone1.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
						}
					}
					//logger.info("--62p--"+fieldKeyone);
					for(String key:fieldKeyone.keySet()){
						for(String str:fields.keySet()){
							String name = fields.get(str);
							if(name.equals(key)){
								pd.put(str, fieldKeyone.get(key));
							}	
						}
					}
					listPd.add(pd);
					//logger.info("--62pt--"+listPd);
				}else if(no==6&&rowsone.get(0).select("TH").get(1).text().contains("人员类别")){
					for(int j=1;j<rowsone.size();j++){
						List<Element> rows1 = rowsone.get(0).select("TH");
						List<Element> rows2 = rowsone.get(j).select("TH,TD");
						for(int ii=0;ii<rows1.size();ii++){
							fieldKeyone.put(rows1.get(ii).text().replace(" ", ""), rows2.get(ii).text());
						}
						//logger.info("--63p--"+fieldKeyone);
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
					}
					//logger.info("--63pt--"+listPd);
				}else if(no==7&&rowsone.get(0).select("TH").get(1).text().contains("执业资格名称")){
					for(int j=1;j<rowsone.size();j++){
						List<Element> rows1 = rowsone.get(0).select("TH");
						List<Element> rows2 = rowsone.get(j).select("TH,TD");
						for(int ii=0;ii<rows1.size();ii++){
							fieldKeyone.put(rows1.get(ii).text(), rows2.get(ii).text());
						}
						//logger.info("--64p--"+fieldKeyone);
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
					}
					//logger.info("--64pt--"+listPd);
				}else if(no==8&&rowsone.get(0).select("TH").get(1).text().contains("奖励机构")){
					for(int j=1;j<rowsone.size();j++){
						List<Element> rows1 = rowsone.get(0).select("TH");
						List<Element> rows2 = rowsone.get(j).select("TH,TD");
						for(int ii=0;ii<rows1.size();ii++){
							fieldKeyone.put(rows1.get(ii).text(), rows2.get(ii).text());
						}
						//logger.info("--65p--"+fieldKeyone);
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
					}
					//logger.info("--65pt--"+listPd);
				}
			}
		}
  		//logger.info("--公listPd--"+listPd);
		return listPd;
  	}
  	
//  	//爬取网页数据(欠税信息)
//  	public List<PageData> getPerOweTaxes(List<Element> eles ,int start, int index, Map<String,String> fields){
//  		List<PageData> listPd = new ArrayList<PageData>();
//  		Map<String,String> fieldKeyone = new HashMap<String,String>();
//  		//logger.info("--欠税信息--");
//  		//logger.info("--欠税信息fields--"+fields.size());
//  		if(!fields.isEmpty()){
//			Elements eleone3 = eles.get(start).select("TABLE");
//			for(int i=0;i<eleone3.size();i++){
//				Element eleone = eleone3.get(i+index-1);
//				//logger.info("--欠税信息Basic--"+eleone);
//				List<Element> rowsone3 = eleone.select("TR>TH");
//				List<Element> rowsone6 = eleone.select("TR>TD");
//				for(int ii=0;ii<rowsone3.size();ii++){
//					fieldKeyone.put(rowsone3.get(ii).text(), rowsone6.get(ii).text());
//				}
//				PageData pd = new PageData();
//				for(String key:fieldKeyone.keySet()){
//					for(String str:fields.keySet()){
//						String name = fields.get(str);
//						if(name.equals(key)){
//							pd.put(str, fieldKeyone.get(key));
//						}	
//					}
//				}
//				//logger.info("--欠税信息PerBasicpd--"+pd);
//				listPd.add(pd);
//			}
//		}
//  		//logger.info("--欠税信息listPd--"+listPd);
//		return listPd;
//  	}
  	
  	//爬取网页数据(征信中心说明/异议标注/查询记录信息)
  	public List<PageData> getWebInfoQueryDetail(Element eles ,int start, Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		if(!fields.isEmpty()){
			Elements eleone3 = eles.select("TABLE>TBODY>TR");
			for(int i=0;i<eleone3.size()-1;i++){
				List<Element> rowsone3 = eleone3.get(0).select("TH");
				List<Element> rowsone6 = eleone3.get(i+1).select("TD");
				for(int ii=0;ii<rowsone3.size();ii++){
					fieldKeyone.put(rowsone3.get(ii).text(), rowsone6.get(ii).text());
				}
				PageData pd = new PageData();
				for(String key:fieldKeyone.keySet()){
					for(String str:fields.keySet()){
						String name = fields.get(str);
						if(name.equals(key)){
							pd.put(str, fieldKeyone.get(key));
						}	
					}
				}
				//logger.info("--查询PerBasicpd--"+pd);
				listPd.add(pd);
			}
		}
  		//logger.info("--查询listPd--"+listPd);
		return listPd;
  	}
  	
  	//爬取网页数据(信贷概要)
  	public List<PageData> getWebInfoSummary(int no,Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		PageData pd = new PageData();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		Map<String,String> fieldKeyone3 = new HashMap<String,String>();
  		//logger.info("--信贷概要--");
  		//logger.info("--信贷概要fields--"+fields.size());
  		if(!fields.isEmpty()){
			Elements eleone3 = eles.select("TABLE>TBODY");
			for(int i=0;i<eleone3.size();i++){
				List<Element> rowsone0 = eleone3.get(i).select("TR");
				if(rowsone0.size()==3){
					if(no==3){
						if(rowsone0.get(0).select("TH").get(0).text().contains("非循环")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
							}
							//logger.info("--33pt--"+fieldKeyone);
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
						}
					}else if(no==4){
						if(rowsone0.get(0).select("TH").get(0).text().equals("贷记卡账户信息汇总")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							//logger.info("--34pt--"+fieldKeyone);
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
							
						}
					}else if(no==5){
						if(rowsone0.get(0).select("TH").get(0).text().contains("最近")){
							List<Element> rows1 = rowsone0.get(1).select("TD");
							List<Element> rows2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rows1.size();ii++){
								fieldKeyone.put(rows1.get(ii).text().replace(" ", "")+ii, rows2.get(ii).text());
							}
							pd = new PageData();
//							if(listPd.size()!=0){
//								pd = listPd.get(0);
//							}
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
							//logger.info("--41pt--"+listPd);
						}
					}else if(no==22){
						if(rowsone0.get(0).select("TH").get(0).text().contains("呆账")){
							List<Element> rows0 = rowsone0.get(0).select("TH");
							List<Element> rows1 = rowsone0.get(1).select("TH,TD");
							List<Element> rows2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rows1.size();ii++){
								fieldKeyone.put(rows1.get(ii).text(), rows2.get(ii).text());
							}
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
						}
					}else if(no==31){
						if(rowsone0.get(0).select("TH").get(0).text().contains("循环额度")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							//logger.info("--34pt--"+fieldKeyone);
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
						}
					}else if(no==32){
						if(rowsone0.get(0).select("TH").get(0).text().equals("循环贷账户信息汇总")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							//logger.info("--34pt--"+fieldKeyone);
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
						}
					}else if(no==33){
						if(rowsone0.get(0).select("TH").get(0).text().equals("准贷记卡账户信息汇总")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							//logger.info("--34pt--"+fieldKeyone);
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
							//logger.info("--71pt--"+listPd);
						}
					}
				}else if(rowsone0.size()==2){
//					if(no==5){
//						if(rowsone0.get(0).select("TH").get(0).text().contains("上一次查询日期")){
//						List<Element> rows0 = rowsone0.get(0).select("TH");
//						List<Element> rows1 = rowsone0.get(1).select("TD");
//						fieldKeyone.put("上一次查询日期", rows1.get(0).text());
//						fieldKeyone.put("上一次查询机构代码", rows1.get(1).text());
//						fieldKeyone.put("上一次查询原因", rows1.get(2).text());
//						//logger.info("--51pt--"+fieldKeyone);
//						PageData pd = new PageData();
//						for(String key:fieldKeyone.keySet()){
//							for(String str:fields.keySet()){
//								String name = fields.get(str);
//								if(name.equals(key)){
//									pd.put(str, fieldKeyone.get(key));
//								}
//							}
//						}
//						listPd.add(pd);
//						//logger.info("--51pt--"+listPd);
//						}
//					}
//					else 
					if(no==6){
						if(rowsone0.get(0).select("TH").get(0).text().contains("数字解读")){
						List<Element> rows0 = rowsone0.get(0).select("TH");
						List<Element> rows1 = rowsone0.get(1).select("TD");
						for(int ii=0;ii<rows1.size();ii++){
							fieldKeyone.put(rows0.get(ii).text(), rows1.get(ii).text());
						}
						//logger.info("--52pt--"+fieldKeyone);
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}
							}
						}
						listPd.add(pd);
						}
					}
				}else if(rowsone0.size()==5&&rowsone0.get(0).select("TH").get(0).text().contains("被追偿信息汇总")){
					if(no==21){
						for(int j=2;j<rowsone0.size();j++){
							List<Element> rows1 = rowsone0.get(1).select("TH");
							List<Element> rows2 = rowsone0.get(j).select("TH,TD");
							for(int ii=0;ii<rows1.size();ii++){
								fieldKeyone.put(rows1.get(ii).text(), rows2.get(ii).text());
							}
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}	
								}
							}
							listPd.add(pd);
						}
						//logger.info("--54pt--"+listPd);
					}
				}else if(rowsone0.size()==4){
					if(no==7){
						listPd = new ArrayList<PageData>();
						for(int j=2;j<rowsone0.size();j++){
							List<Element> rows1 = rowsone0.get(1).select("TH");
							List<Element> rows2 = rowsone0.get(j).select("TH,TD");
							for(int ii=0;ii<rows1.size();ii++){
								fieldKeyone.put(rows1.get(ii).text(), rows2.get(ii).text());
							}
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}	
								}
							}
							listPd.add(pd);
						}
						//logger.info("--56pt--"+listPd);
					}
				}else if(rowsone0.size()==6){
					if(no==8){
						listPd = new ArrayList<PageData>();
						for(int j=2;j<rowsone0.size();j++){
							List<Element> rows1 = rowsone0.get(1).select("TH");
							List<Element> rows2 = rowsone0.get(j).select("TH,TD");
							for(int ii=0;ii<rows1.size();ii++){
								fieldKeyone.put(rows1.get(ii).text(), rows2.get(ii).text());
							}
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}	
								}
							}
							listPd.add(pd);
						}
						//logger.info("--57pt--"+listPd);
					}
				}else if(rowsone0.size()==7){
					if(no==2){
						for(int j=2;j<rowsone0.size();j++){
							List<Element> rows1 = rowsone0.get(1).select("TH");
							List<Element> rows2 = rowsone0.get(j).select("TH,TD");
							for(int ii=0;ii<rows1.size();ii++){
								fieldKeyone.put(rows1.get(ii).text(), rows2.get(ii).text());
							}
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}	
								}
							}
							listPd.add(pd);
						}
						//logger.info("--37pt--"+listPd);
					}
				}else if(rowsone0.size()==9){
					if(no==34){
						List<Element> rows4 = rowsone0.get(4).select("TH,TD");
						List<Element> rows8 = rowsone0.get(8).select("TH,TD");
						pd = new PageData();
						fieldKeyone.put("借款人身份类别", "为个人");
						fieldKeyone.put("还款责任类型", "担保责任");
						fieldKeyone.put("账户数", rows4.get(0).text());
						fieldKeyone.put("还款责任金额", rows4.get(1).text());
						fieldKeyone.put("余额", rows4.get(2).text());
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						pd = new PageData();
						fieldKeyone = new HashMap<String,String>();
						fieldKeyone.put("借款人身份类别", "为个人");
						fieldKeyone.put("还款责任类型", "其他相关还款责任");
						fieldKeyone.put("账户数", rows4.get(3).text());
						fieldKeyone.put("还款责任金额", rows4.get(4).text());
						fieldKeyone.put("余额", rows4.get(5).text());
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						pd = new PageData();
						fieldKeyone = new HashMap<String,String>();
						fieldKeyone.put("借款人身份类别", "为企业");
						fieldKeyone.put("还款责任类型", "担保责任");
						fieldKeyone.put("账户数", rows8.get(0).text());
						fieldKeyone.put("还款责任金额", rows8.get(1).text());
						fieldKeyone.put("余额", rows8.get(2).text());
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						pd = new PageData();
						fieldKeyone = new HashMap<String,String>();
						fieldKeyone.put("借款人身份类别", "为企业");
						fieldKeyone.put("还款责任类型", "其他相关还款责任");
						fieldKeyone.put("账户数", rows8.get(3).text());
						fieldKeyone.put("还款责任金额", rows8.get(4).text());
						fieldKeyone.put("余额", rows8.get(5).text());
						
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						//logger.info("--55pt--"+listPd);
					}
				}else if(rowsone0.size()==8){
					if(no==1){
						List<Element> rows0 = rowsone0.get(0).select("TH,TD");
						List<Element> rows1 = rowsone0.get(1).select("TH,TD");
						List<Element> rows2 = rowsone0.get(2).select("TH,TD");
						List<Element> rows3 = rowsone0.get(3).select("TH,TD");
						List<Element> rows4 = rowsone0.get(4).select("TH,TD");
						List<Element> rows5 = rowsone0.get(5).select("TH,TD");
						List<Element> rows6 = rowsone0.get(6).select("TH,TD");
						List<Element> rows7 = rowsone0.get(7).select("TH,TD");
						
						fieldKeyone.put("业务大类", rows1.get(0).text());
						fieldKeyone.put("业务类型", rows1.get(1).text());
						fieldKeyone.put("账户数", rows1.get(2).text());
						fieldKeyone.put("首笔业务发放月份", rows1.get(3).text());
						
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						fieldKeyone.put("业务大类", rows1.get(0).text());
						fieldKeyone.put("业务类型", rows2.get(0).text());
						fieldKeyone.put("账户数", rows2.get(1).text());
						fieldKeyone.put("首笔业务发放月份", rows2.get(2).text());
						
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						fieldKeyone.put("业务大类", rows1.get(0).text());
						fieldKeyone.put("业务类型", rows3.get(0).text());
						fieldKeyone.put("账户数", rows3.get(1).text());
						fieldKeyone.put("首笔业务发放月份", rows3.get(2).text());
						
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						fieldKeyone.put("业务大类", rows4.get(0).text());
						fieldKeyone.put("业务类型", rows4.get(1).text());
						fieldKeyone.put("账户数", rows4.get(2).text());
						fieldKeyone.put("首笔业务发放月份", rows4.get(3).text());
						
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						fieldKeyone.put("业务大类", rows4.get(0).text());
						fieldKeyone.put("业务类型", rows5.get(0).text());
						fieldKeyone.put("账户数", rows5.get(1).text());
						fieldKeyone.put("首笔业务发放月份", rows5.get(2).text());
						
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						fieldKeyone.put("业务大类", rows6.get(0).text());
						fieldKeyone.put("业务类型", rows6.get(1).text());
						fieldKeyone.put("账户数", rows6.get(2).text());
						fieldKeyone.put("首笔业务发放月份", rows6.get(3).text());
						
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						
						fieldKeyone.put("业务大类", rows7.get(0).text());
						fieldKeyone.put("业务类型", rows7.get(0).text());
						fieldKeyone.put("账户数", rows7.get(1).text());
						fieldKeyone.put("首笔业务发放月份", rows7.get(2).text());
						
						pd = new PageData();
						for(String key:fieldKeyone.keySet()){
							for(String str:fields.keySet()){
								String name = fields.get(str);
								if(name.equals(key)){
									pd.put(str, fieldKeyone.get(key));
								}	
							}
						}
						listPd.add(pd);
						//logger.info("--39pt--"+listPd);
					}
				}
					
			}
  		}
  		//logger.info("--信贷概要listPd--"+listPd);
  		//logger.info("--信贷概要listPdsize--"+listPd.size());
		return listPd;
  	}
  	
  	//爬取网页数据(信贷明细)
  	public List<List<PageData>> getWebInfoLoan(int no,Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		List<List<PageData>> listListPd = new ArrayList<List<PageData>>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		Map<String,String> fieldKeyone2 = new HashMap<String,String>();
  		int flag = 0;
  		int count = 1001;
  		int count1 = 2001;
  		int count2 = 3001;
  		int countCard = 4001;
  		int countCard1 = 5001;
  		PageData pd = new PageData();
  		
  		if(!fields.isEmpty()){
			Elements eleone3 = eles.select("TABLE>TBODY");
			for(int i=0;i<eleone3.size();i++){
				List<Element> rowsone0 = eleone3.get(i).select("TR");
				if(!rowsone0.isEmpty()){
					if(no==1){
						if(rowsone0.size()==4&&rowsone0.get(0).select("TH").get(0).text().contains("管理")){
							listPd = new ArrayList<PageData>();
							pd = new PageData();
							fieldKeyone = new HashMap<String,String>();
							for(int j=0;j<rowsone0.size()/2;j++){
								if(!rowsone0.isEmpty()){
									List<Element> rowsone = rowsone0.get(2*j+0).select("TH");
									List<Element> rowsone2 = rowsone0.get(2*j+1).select("TD");
									for(int ii=0;ii<rowsone.size();ii++){
										fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
									}
								}
							}
//							pd.put("SERIAL", count);
							count++;
						}else if(rowsone0.size()>1&&rowsone0.get(1).select("TH,TD").size()>1&&rowsone0.get(1).select("TH,TD").get(1).text().contains("五级分类")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
						}
						else if(rowsone0.size()>1&&rowsone0.get(0).select("TH").get(0).text().contains("当前逾期期数")){
							flag = 1;
							List<Element> rowsone = rowsone0.get(0).select("TH");
							List<Element> rowsone2 = rowsone0.get(1).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
						}
						else if(rowsone0.size()>1&&rowsone0.get(0).select("TH").get(0).text().contains("的还款记录")){
							if(flag==1){
								for(int j=1;j<(rowsone0.size()-2)/2+1;j++){
									for(int k=1;k<13;k++){
										fieldKeyone2.put("月份", rowsone0.get(2*j).select("TH,TD").get(0).text()+"-"+rowsone0.get(1).select("TH").get(k).text());
										fieldKeyone2.put("还款状态", rowsone0.get(2*j).select("TH,TD").get(k).text());
										fieldKeyone2.put("逾期总额", rowsone0.get(2*j+1).select("TH,TD").get(k-1).text());
										PageData pdSub = new PageData();
										for(String key:fieldKeyone2.keySet()){
											for(String str:fields.keySet()){
												String name = fields.get(str);
												if(name.equals(key)){
													pdSub.put(str, fieldKeyone2.get(key));
												}
											}
										}
//										pdSub.put("SERIAL", count);
										listPd.add(pdSub);
									}
								}
								flag = 0;
								listListPd.add(listPd);
							}
							
						}
						
					}else if(no==2){
						if(rowsone0.size()==2&&rowsone0.get(0).select("TH,TD").size()>=7&&rowsone0.get(0).select("TH").get(6).text().contains("业务种类")){
							listPd = new ArrayList<PageData>();
							pd = new PageData();
							fieldKeyone = new HashMap<String,String>();
							List<Element> rowsone = rowsone0.get(0).select("TH");
							List<Element> rowsone2 = rowsone0.get(1).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
							}
							pd.put("SERIAL", countCard);
							countCard++;
						}else if(rowsone0.size()==3&&rowsone0.get(1).select("TH").size()>2&&rowsone0.get(1).select("TH").get(2).text().contains("已用额度")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
						}else if(rowsone0.size()==2&&rowsone0.get(0).select("TH").get(0).text().contains("账单日")){
							flag = 2;
							List<Element> rowsone = rowsone0.get(0).select("TH");
							List<Element> rowsone2 = rowsone0.get(1).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
						}else if(rowsone0.size()>2&&rowsone0.get(0).select("TH").get(0).text().contains("的还款记录")){
							if(flag==2){
								for(int j=1;j<(rowsone0.size()-2)/2+1;j++){
									for(int k=1;k<13;k++){
										fieldKeyone2.put("月份", rowsone0.get(2*j).select("TH,TD").get(0).text()+"-"+rowsone0.get(1).select("TH").get(k).text());
										fieldKeyone2.put("还款状态", rowsone0.get(2*j).select("TH,TD").get(k).text());
										fieldKeyone2.put("逾期总额", rowsone0.get(2*j+1).select("TH,TD").get(k-1).text());
										PageData pdSub = new PageData();
										for(String key:fieldKeyone2.keySet()){
											for(String str:fields.keySet()){
												String name = fields.get(str);
												if(name.equals(key)){
													pdSub.put(str, fieldKeyone2.get(key));
												}
											}
										}
										pdSub.put("SERIAL", countCard);
										listPd.add(pdSub);
									}
									
								}
								flag = 0;
								listListPd.add(listPd);
							}
						}else if(rowsone0.size()==1){
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
							listListPd.add(listPd);
						}
					}else if(no==4){
						if(rowsone0.size()==4&&rowsone0.get(0).select("TH").get(0).text().contains("管理")){
							listPd = new ArrayList<PageData>();
							pd = new PageData();
							for(int j=0;j<rowsone0.size()/2;j++){
								if(!rowsone0.isEmpty()){
									List<Element> rowsone = rowsone0.get(2*j+0).select("TH");
									List<Element> rowsone2 = rowsone0.get(2*j+1).select("TD");
									for(int ii=0;ii<rowsone.size();ii++){
										fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
									}
								}
							}
							pd.put("SERIAL", count1);
							count1++;
						}else if(rowsone0.size()>1&&rowsone0.get(1).select("TH,TD").size()>=2&&rowsone0.get(1).select("TH,TD").get(1).text().contains("五级分类")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
						}
						else if(rowsone0.size()>1&&rowsone0.get(0).select("TH").get(0).text().contains("当前逾期期数")){
							flag = 4;
							List<Element> rowsone = rowsone0.get(0).select("TH");
							List<Element> rowsone2 = rowsone0.get(1).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
						}
						else if(rowsone0.size()>1&&rowsone0.get(0).select("TH").get(0).text().contains("的还款记录")){
							if(flag==4){
								for(int j=1;j<(rowsone0.size()-2)/2+1;j++){
									for(int k=1;k<13;k++){
										fieldKeyone2.put("月份", rowsone0.get(2*j).select("TH,TD").get(0).text()+"-"+rowsone0.get(1).select("TH").get(k).text());
										fieldKeyone2.put("还款状态", rowsone0.get(2*j).select("TH,TD").get(k).text());
										fieldKeyone2.put("逾期总额", rowsone0.get(2*j+1).select("TH,TD").get(k-1).text());
										PageData pdSub = new PageData();
										for(String key:fieldKeyone2.keySet()){
											for(String str:fields.keySet()){
												String name = fields.get(str);
												if(name.equals(key)){
													pdSub.put(str, fieldKeyone2.get(key));
												}
											}
										}
										pdSub.put("SERIAL", count1);
										listPd.add(pdSub);
									}
								}
								flag = 0;
								listListPd.add(listPd);
							}
							
						}
					}else if(no==5){
						if(rowsone0.size()==4&&rowsone0.get(0).select("TH").get(0).text().contains("管理")){
							listPd = new ArrayList<PageData>();
							pd = new PageData();
							for(int j=0;j<rowsone0.size()/2;j++){
								if(!rowsone0.isEmpty()){
									List<Element> rowsone = rowsone0.get(2*j+0).select("TH");
									List<Element> rowsone2 = rowsone0.get(2*j+1).select("TD");
									for(int ii=0;ii<rowsone.size();ii++){
										fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
									}
								}
							}
							pd.put("SERIAL", count2);
							count2++;
						}else if(rowsone0.size()>1&&rowsone0.get(1).select("TH,TD").size()>=2&&rowsone0.get(1).select("TH,TD").get(1).text().contains("五级分类")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
						}
						else if(rowsone0.size()>1&&rowsone0.get(0).select("TH").get(0).text().contains("当前逾期期数")){
							flag = 5;
							List<Element> rowsone = rowsone0.get(0).select("TH");
							List<Element> rowsone2 = rowsone0.get(1).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
						}
						else if(rowsone0.size()>1&&rowsone0.get(0).select("TH").get(0).text().contains("的还款记录")){
							if(flag==5){
								for(int j=1;j<(rowsone0.size()-2)/2+1;j++){
									for(int k=1;k<13;k++){
										fieldKeyone2.put("月份", rowsone0.get(2*j).select("TH,TD").get(0).text()+"-"+rowsone0.get(1).select("TH").get(k).text());
										fieldKeyone2.put("还款状态", rowsone0.get(2*j).select("TH,TD").get(k).text());
										fieldKeyone2.put("逾期总额", rowsone0.get(2*j+1).select("TH,TD").get(k-1).text());
										PageData pdSub = new PageData();
										for(String key:fieldKeyone2.keySet()){
											for(String str:fields.keySet()){
												String name = fields.get(str);
												if(name.equals(key)){
													pdSub.put(str, fieldKeyone2.get(key));
												}
											}
										}
										pdSub.put("SERIAL", count2);
										listPd.add(pdSub);
									}
								}
								flag = 0;
								listListPd.add(listPd);
							}
						}
					}else if(no==6){
						if(rowsone0.size()==2&&rowsone0.get(0).select("TH").size()>=7&&rowsone0.get(0).select("TH").get(6).text().contains("担保方式")){
							listPd = new ArrayList<PageData>();
							pd = new PageData();
							List<Element> rowsone = rowsone0.get(0).select("TH");
							List<Element> rowsone2 = rowsone0.get(1).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
							}
							pd.put("SERIAL", countCard1);
							countCard1++;
						}else if(rowsone0.size()==3&&rowsone0.get(1).select("TH").size()>=2&&rowsone0.get(1).select("TH").get(1).text().contains("透支余额")){
							flag = 3;
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
						}else if(rowsone0.size()>1&&rowsone0.get(0).select("TH").get(0).text().contains("的还款记录")){
							if(flag==3){
								for(int j=1;j<(rowsone0.size()-2)/2+1;j++){
									for(int k=1;k<13;k++){
										fieldKeyone2.put("月份", rowsone0.get(2*j).select("TH,TD").get(0).text()+"-"+rowsone0.get(1).select("TH").get(k).text());
										fieldKeyone2.put("还款状态", rowsone0.get(2*j).select("TH,TD").get(k).text());
										fieldKeyone2.put("逾期总额", rowsone0.get(2*j+1).select("TH,TD").get(k-1).text());
										PageData pdSub = new PageData();
										for(String key:fieldKeyone2.keySet()){
											for(String str:fields.keySet()){
												String name = fields.get(str);
												if(name.equals(key)){
													pdSub.put(str, fieldKeyone2.get(key));
												}
											}
										}
										pdSub.put("SERIAL", countCard1);
										listPd.add(pdSub);
									}
									
								}
								flag = 0;
								listListPd.add(listPd);
							}
						}
					}
				}
			}
  		}
		return listListPd;
  	}
  	
  	//爬取网页数据(被追偿信息明细)
  	public List<PageData> getWebInfoAssetsDisposal(int no,Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		List<List<PageData>> listListPd = new ArrayList<List<PageData>>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		Map<String,String> fieldKeyone2 = new HashMap<String,String>();
  		int flag = 0;
  		int count = 1001;
  		int countCard = 2001;
  		
  		if(!fields.isEmpty()){
			Elements eleone3 = eles.select("TABLE>TBODY");
			//logger.info("--eleone3.size()--"+eleone3.size());
			for(int i=0;i<eleone3.size();i++){
				List<Element> rowsone0 = eleone3.get(i).select("TR");
				//logger.info("--i--"+rowsone0.size());
				if(!rowsone0.isEmpty()){
					if(no==3){
						if(rowsone0.size()==2&&rowsone0.get(0).select("TH").get(0).text().contains("管理")
								&&rowsone0.get(0).select("TH").get(2).text().contains("债权接收日期")){
							List<Element> rowsone = rowsone0.get(0).select("TH");
							List<Element> rowsone2 = rowsone0.get(1).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
							}
							//logger.info("--4hang--"+fieldKeyone);
						}else if(rowsone0.size()==3&&(rowsone0.get(2).select("TH,TD").get(0).text().contains("结束")||
								rowsone0.get(2).select("TH,TD").get(0).text().contains("催收"))){
							PageData pd = new PageData();
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
							//logger.info("--3hang--"+fieldKeyone);
						}
					}
				}
			}
  		}
  		System.out.println("cui"+listPd);
		return listPd;
  	}
  	//爬取网页数据(相关还款责任明细)
  	public List<PageData> getWebInfoPerRepayer(int no,Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		List<List<PageData>> listListPd = new ArrayList<List<PageData>>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		Map<String,String> fieldKeyone2 = new HashMap<String,String>();
  		int flag = 0;
  		int count = 1001;
  		int countCard = 2001;
  		PageData pd = new PageData();
  		if(!fields.isEmpty()){
			Elements eleone3 = eles.select("TABLE>TBODY");
			//logger.info("--eleone3.size()--"+eleone3.size());
			for(int i=0;i<eleone3.size();i++){
				List<Element> rowsone0 = eleone3.get(i).select("TR");
				//logger.info("--i--"+rowsone0.size());
				if(!rowsone0.isEmpty()){
					if(no==7){
						//logger.info("wgx2");
						if(rowsone0.size()==2&&rowsone0.get(0).select("TH").get(0).text().contains("管理")
								&&rowsone0.get(0).select("TH,TD").size()>2&&rowsone0.get(0).select("TH").get(2).text().contains("开立日期")){
							List<Element> rowsone = rowsone0.get(0).select("TH");
							List<Element> rowsone2 = rowsone0.get(1).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
							}
							//logger.info("--4hang--"+fieldKeyone);
						}else if(rowsone0.size()>2&&rowsone0.get(1).select("TH,TD").size()>2&&rowsone0.get(1).select("TH,TD").get(2).text().contains("还款状态")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							pd.put("PD03AD08","个人");
							listPd.add(pd);
							//logger.info("--3hang--"+fieldKeyone);
						}else if(rowsone0.size()>2&&rowsone0.get(1).select("TH,TD").size()>2&&rowsone0.get(1).select("TH,TD").get(2).text().contains("逾期月数")){
							List<Element> rowsone = rowsone0.get(1).select("TH");
							List<Element> rowsone2 = rowsone0.get(2).select("TD");
							for(int ii=0;ii<rowsone.size();ii++){
								fieldKeyone.put(rowsone.get(ii).text().replace(" ", ""), rowsone2.get(ii).text());
							}
							pd = new PageData();
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							pd.put("PD03AD08","企业");
							listPd.add(pd);
							//logger.info("--3hang--"+fieldKeyone);
						}
					}
				}
			}
  		}
		return listPd;
  	}
  	
    //爬取网页数据(授信协议)
  	public List<PageData> getWebInfoCredBase(int no,Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		List<List<PageData>> listListPd = new ArrayList<List<PageData>>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		Map<String,String> fieldKeyone2 = new HashMap<String,String>();
  		int flag = 0;
  		int count = 1001;
  		int countCard = 2001;
  		PageData pd = new PageData();
  		if(!fields.isEmpty()){
			Elements eleone3 = eles.select("TABLE>TBODY");
			//logger.info("--eleone3.size()--"+eleone3.size());
			for(int i=0;i<eleone3.size();i++){
				List<Element> rowsone0 = eleone3.get(i).select("TR");
				//logger.info("--i--"+rowsone0.size());
				if(!rowsone0.isEmpty()){
					if(no==8){
						if(rowsone0.size()==4&&rowsone0.get(0).select("TH").size()>1&&rowsone0.get(0).select("TH").get(1).text().contains("授信协议标识")){
							pd = new PageData();
							fieldKeyone = new HashMap<String,String>();
							for(int j=0;j<rowsone0.size()/2;j++){
								if(!rowsone0.isEmpty()){
									List<Element> rowsone = rowsone0.get(2*j+0).select("TH");
									List<Element> rowsone2 = rowsone0.get(2*j+1).select("TD");
									for(int ii=0;ii<rowsone.size();ii++){
										fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
									}
								}
							}
							for(String key:fieldKeyone.keySet()){
								for(String str:fields.keySet()){
									String name = fields.get(str);
									if(name.equals(key)){
										pd.put(str, fieldKeyone.get(key));
									}
								}
							}
							listPd.add(pd);
							//logger.info("--4hang--"+fieldKeyone);
						}
					}
				}
			}
  		}
		return listPd;
  	}
  	//爬取网页数据(后付费记录信息)
  	public List<PageData> getAfterPayInfo(Element eles ,int start,Map<String,String> fields){
  		List<PageData> listPd = new ArrayList<PageData>();
  		Map<String,String> fieldKeyone = new HashMap<String,String>();
  		if(!fields.isEmpty()){
			Elements eleonet = eles.select("TABLE");
			for(int i=0;i<eleonet.size();i++){
				if(eleonet.get(i).select("TR").size()==2&&eleonet.get(i).select("TR").get(0).select("TH").get(0).text().contains("机构名称")){
					Elements eleonet3 = eleonet.get(i).select("TR");
					Element eleone0 = eleonet3.get(0);
					Element eleone1 = eleonet3.get(1);
					if(!eleonet3.isEmpty()){
						List<Element> rowsone = eleone0.select("TH");
						List<Element> rowsone2 = eleone1.select("TD");
						for(int ii=0;ii<rowsone.size();ii++){
							fieldKeyone.put(rowsone.get(ii).text(), rowsone2.get(ii).text());
						}
					}
					PageData pd = new PageData();
					for(String key:fieldKeyone.keySet()){
						for(String str:fields.keySet()){
							String name = fields.get(str);
							if(name.equals(key)){
								pd.put(str, fieldKeyone.get(key));
							}	
						}
					}
					listPd.add(pd);
				}
			}
  		}
		//logger.info("--58pt--"+listPd);
		return listPd;
  	}
  	
    //爬取网页数据(电信缴费记录)
  	public List<PageData> getWebTelInfo(List<Element> eles ,int start,Map<String,String> fields){
  		//存放爬取的数据
  		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
  		List<Map<String, String>> listRecord = new ArrayList<Map<String, String>>();
  		int k=0;
		if(!fields.isEmpty()){
			for(int i=start+1;i<eles.size();i++){
	  			////logger.info("第i个元素的内容"+i+eles.get(i));
	  			////logger.info("第i+1个元素的内容"+i+1+eles.get(i+1));
	  			//提取table标签中的内容
				Elements ee = eles.get(i).select("TR>TD>TABLE");
				Elements ele = eles.get(i).select("TR>TD>DIV>TABLE");
				
				////logger.info(ee);
				////logger.info(ele);
				if(!ee.isEmpty()||!ele.isEmpty()){
					if(ee.isEmpty()){
						ee = ele;
					}
					List<Element> rows = ee.select("TR");
					boolean flag = false;  //区分单行数据/多行数据
					//boolean moreTitle = false;  //区分是否含大表头
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
						//判断是否含有最近24个月电信缴费记录
						if(rows.get(j).text().contains("最近24个月缴费记录")){
							lastPayReocrd = true;
						}
						//上一行不为表头，再取出相邻的下一行数据
						if(!flag&&lineNum==0){
							cols2 = rows.get(j+1).select("TD");
						}
						if(cols1.size()==cols2.size()||lastPayReocrd){
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
								}
							}
						}
						k++;
					}
					i=i+k+1;
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
				listPd.add(pd);
			}
			
		}
//		//logger.info("*****************************************************************************");
//		for(int i=0;i<listPd.size();i++){
//			PageData pp = listPd.get(i);
//			Iterator iter = pp.keySet().iterator();
//			while(iter.hasNext()){
//				String ss = (String) iter.next();
//				//logger.info(ss+"////"+pp.getString(ss));
//			}
//		}
		return listPd;
  	}
}
