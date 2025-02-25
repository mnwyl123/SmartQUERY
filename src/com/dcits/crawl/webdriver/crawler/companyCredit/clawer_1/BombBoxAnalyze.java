package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_1;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.PathUtil;
import com.dcits.crawl.util.UuidUtil;

/**
 * 解析弹出框
 * @author zhangyy
 *
 */
public class BombBoxAnalyze {

	private static Logger logger = Logger.getLogger(BombBoxAnalyze.class);
	
	//页面弹出框解析,flag用于标记调用哪一个方法
	public int downLoadExcel(Document doc,Map<String, String> cookies,Element ele,PageData pd,String type,int numCount){
		try{
			Map<String, String> map = new HashMap<String,String>();
			List<Element> rows = ele.select("table").select("tr");
			for(int t=0;t<rows.size();t++){
				//获取当前行的列
				List<Element> cols = rows.get(t).select("td");
				for(int k=0;k<cols.size();k++){
					List<Element> ss = cols.get(k).getElementsByTag("a");
					for(int h=0;h<ss.size();h++){
						numCount++;
						String str = ss.get(h).attr("onclick");
						if("".equals(str)){ //判断onclick是否包含在span标签中
							List<Element> span = ss.get(h).getElementsByTag("span");
							if(span.size()>0){
								str = span.get(0).attr("onclick");
							}
						}
						String pageInfo = "";
						//解析需要传递的参数值
						if(!"".equals(str)){
							String[] list = str.replaceAll("'", "").split(",");
							try{
								map.put("loancardcode", list[0].split("\\(")[1]);
								map.put("reportyear", list[1]);
								map.put("reporttype", list[2]);
								map.put("reporttypesubsection",list[3]);
								map.put("maincredit",list[4]);
								map.put("blockcode", list[5]);
								map.put("borrowcode", list[6].split("\\)")[0]);
								//请求弹出框数据
								pageInfo = new GetBombBoxByJsoup().getExcel(doc,cookies,type,map);
							}catch(Exception e){
								logger.error(e.getMessage(), e);
							}
							//点击事件
							if (!"".equals(pageInfo)) {
								try{
									//保存弹出页面
									SavePopPage("exce"+String.valueOf(numCount),pageInfo,pd,"E");
								}catch(Exception e){
									logger.error(e.getMessage(), e);
								}
							}else{
								logger.info("excel下载失败!");
							}
						}
					}
				}
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			logger.error("捕获页面弹出框异常!");
		}
		return numCount;
	}
	
	//页面弹出框解析,flag用于标记调用哪一个方法
	public int onClickWindow(Document doc,Map<String, String> cookies,Element eles,String reportId,Map<Integer,String> listSerial,CompanyCrawlerManager companyCrawlerService,String type,String settle,String sql,int numCount,PageData pd){
		
		try{
			String[] strs = settle.split(",");
			List<Element> rows = eles.select("table").select("tr");
			for(int t=0;t<rows.size();t++){
				//获取当前行的流水号
				String serial_no = "";
				try{
					if("B".equals(type)||"E".equals(type)){  //对外担保
						serial_no = listSerial.get(t);  //获取本行数据的流水号
					}else{
						if("D".equals(type)){ //公共明细
							serial_no = listSerial.get(0);  //获取本行数据的流水号
						}else if(strs[2].contains("1")){ //查看正常结清类业务单独生成流水号
							serial_no = UuidUtil.get32UUID();  //流水号
						}else if(strs[2].contains("0")&&strs[1].contains("01")&&(strs[0].contains("05")||strs[0].contains("06")||strs[0].contains("07")||strs[0].contains("08"))){ //(未结清类业务明细,票据贴现、银承、信用证、保函)
							serial_no = listSerial.get(t);  //流水号
						}else{
							serial_no = listSerial.get(t);  //获取本行数据的流水号
						}
					}
				}catch(Exception e){
					logger.error(e.getMessage(),e);
				}
				
				//获取当前行的列
				List<Element> cols = rows.get(t).select("td");
				for(int k=0;k<cols.size();k++){
					String lable = "A";
					List<Element> ss = cols.get(k).getElementsByTag("a");
					if(ss.size()==0){  //input标签
						lable = "In";
						ss = cols.get(k).getElementsByTag("input");
					}
					for(int h=0;h<ss.size();h++){
						numCount++;
						String str = ss.get(h).attr("onclick");
						if("".equals(str)){  //判断onclick是否包含在span标签中
							List<Element> span = ss.get(h).getElementsByTag("span");
							if(span.size()>0){
								str = span.get(0).attr("onclick");
							}
						}
						String pageInfo = "";
						//解析需要传递的参数值
						if(!"".equals(str)){
							try{
								//请求弹出框数据
								pageInfo = new GetBombBoxByJsoup().getMethod(doc,cookies,type,str);
							}catch(Exception e){
								logger.error(e.getMessage(), e);
							}
						}
						//点击事件
						if (!"".equals(pageInfo)) {
							//保存弹出页面
							SavePopPage(lable+String.valueOf(numCount),pageInfo,pd,"H");
							//解析页面
							try{
								if("A".equals(type)){//(未结清弹出框)(解析担保、历史记录、展期)
									analyzeWindow(pageInfo,reportId,serial_no,companyCrawlerService);
								}else if("B".equals(type)){  //(解析对外担保主业务)
									analyzeGuarteeWindow(pageInfo,reportId,serial_no,companyCrawlerService);
								}else if("C".equals(type)){  //(解析查看正常结清类业务,未结清正常类业务明细[票据贴现、银承、信用证、保函])
									analyzeClearWindow(pageInfo,sql,reportId,serial_no,companyCrawlerService,settle);
								}else if("D".equals(type)){  //解析公共记录明细
									analyzePublicWindow(pageInfo,reportId,serial_no,companyCrawlerService);
								}else if("E".equals(type)){//由资产管理公司处置的债务、担保及第三方代偿的债务、欠息、垫款
									//弹出框布局不清楚，入库动作暂时不做
									analyzeOtherWindow(pageInfo,sql,reportId,serial_no,companyCrawlerService);
								}
							}catch(Exception e){
								logger.error(e.getMessage(), e);
							}
						}else{
							logger.info(" 弹出页面获取失败!");
						}
					}
				}
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			logger.error("捕获页面弹出框异常!");
		}
		return numCount;
	}
	
	//解析弹出窗口(未结清弹出框)(解析担保、历史记录、展期)
	private void analyzeWindow(String pageInfo,String reportId,String serial_no,CompanyCrawlerManager companyCrawlerService){
		//解析页面
		Document document = Jsoup.parse(pageInfo);
		List<Element> eles = document.getElementsByTag("tr").select("table");
		//爬取数据
		for(int i=0;i<eles.size();i++){
			//存放table表头
			String tableTile = "";
			//存放爬取的数据
			String sqlV = "";
			Element ee = eles.get(i);
			String type = "";
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				if(rows.size()>2){
					type = rows.get(0).text();
					tableTile = rows.get(1).text();
					String pledgeType = "";
					if(type.contains("抵押物信息")){
						pledgeType = "01";
					}else if(type.contains("质押物信息")){
						pledgeType = "02";
					}
					for(int t=2;t<rows.size();t++){
						List<Element> cols = rows.get(t).select("td");
						String sqlValue = "'"+reportId+"','"+serial_no+"',";
						if(type.contains("抵押物信息")||type.contains("质押物信息")){
							sqlValue = "'"+reportId+"','"+serial_no+"','"+pledgeType+"',";
							for(int j=0;j<cols.size();j++){
								sqlValue = sqlValue+"'"+cols.get(j).text().replace(String.valueOf((char)160), "").trim()+"',";
							}
						}else{
							for(int j=0;j<cols.size();j++){
								sqlValue = sqlValue+"'"+cols.get(j).text().replace(String.valueOf((char)160), "").trim()+"',";
							}
						}
						if(cols.size()>0){
							sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION ALL";
						}
					}
				}
			}
			if(!"".equals(sqlV)){
				String sql = "INSERT INTO COM_INNER_BUSS_NOR_HIS_RECORD(REPORT_ID,SERIAL_NO,BUSS_OCCUR_DATE,BALANCE_CHANGE_DATE,BALANCE,FIVE_TYPE)";
				if(type.contains("保证人信息")){
					sql = "INSERT INTO COM_WAS_GUAR(REPORT_ID,SERIAL_NO,GUARANTOR,GUAR_DATE,CURRENCY,GUAR_SUM,GUAR_STYLE)";
				}else if(type.contains("抵押物信息")){
					sql = "INSERT INTO COM_PLEDGE(REPORT_ID,SERIAL_NO,PLEDGE_TYPE,PLEDGE_OWNER,PLEDGE_SPECIES,CURRENCY,ASSESS_SUM,ASSESS_DATE,GUAR_SUM)";
				}else if(type.contains("质押物信息")){
					sql = "INSERT INTO COM_PLEDGE(REPORT_ID,SERIAL_NO,PLEDGE_TYPE,PLEDGE_OWNER,PLEDGE_SPECIES,CURRENCY,ASSESS_SUM,GUAR_SUM)";
				}
				//判断是否展期数据
				if(tableTile.contains("展期起始")&&tableTile.contains("展期到期")){
					sql = "INSERT INTO COM_EXTEND_DETAIL(REPORT_ID,SERIAL_NO,EXTEND_START_DATE,EXTEND_END_DATE,EXTEND_SUM)";
				}
				sql = sql+sqlV.substring(0, sqlV.length()-9);
				try{
					Map<String,String> map = new HashMap<String,String>();
					//数据入库
					map.put("creatSql", sql);
					companyCrawlerService.saveInfo(map);
				}catch(Exception e){
					logger.error(e.getMessage(), e);
					logger.error(type+"解析数据入库失败！");
				}
			}
			
		}
		
	}
	
	//解析弹出窗口(解析对外担保主业务)
	private void analyzeGuarteeWindow(String pageInfo,String reportId,String serial_no,CompanyCrawlerManager companyCrawlerService){
		//解析页面
		Document document = Jsoup.parse(pageInfo);
		List<Element> eles = document.getElementsByTag("tr").select("table");
		if(eles.size()>0){
			String typeName = "";
			//存放业务类型编号
			String bussType = "";
			//存放table表头行内容
			String tableTile = "";
			//存放爬取的数据
			String sqlV = "";
			Element ee = eles.get(0);
			if(ee.hasText()){
				List<Element> rows = ee.select("tr");
				if(rows.size()>2){
					typeName = rows.get(0).text();
					if(typeName.contains("贷款")&&!typeName.contains("类贷款")){
						bussType = "01";
					}else if(typeName.contains("类贷款")){
						bussType = "02";
					}else if(typeName.contains("贸易融资")){
						bussType = "03";
					}else if(typeName.contains("保理")){
						bussType = "04";
					}else if(typeName.contains("票据贴现")){
						bussType = "05";
					}else if(typeName.contains("银承")){
						bussType = "06";
					}else if(typeName.contains("信用证")){
						bussType = "07";
					}else if(typeName.contains("保函")){
						bussType = "08";
					}
					tableTile = rows.get(1).text();
					for(int t=2;t<rows.size();t++){
						String sqlValue = "'"+reportId+"','"+serial_no+"','"+bussType+"',";
						List<Element> cols = rows.get(t).select("td");
						for(int j=0;j<cols.size();j++){
							sqlValue = sqlValue+"'"+cols.get(j).text().replace(String.valueOf((char)160), "").trim()+"',";
						}
						if(cols.size()>0){
							sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION ALL";
						}
					}
				}
			}
			////爬取其他table中的数据
			if(!"".equals(tableTile)){
				for(int i=1;i<eles.size();i++){
					 ee = eles.get(i);
					if(ee.hasText()){
						List<Element> rows = ee.select("tr");
						for(int t=0;t<rows.size();t++){
							String sqlValue = "'"+reportId+"','"+serial_no+"','"+bussType+"',";
							List<Element> cols = rows.get(t).select("td");
							for(int j=0;j<cols.size();j++){
								sqlValue = sqlValue+"'"+cols.get(j).text().replace(String.valueOf((char)160), "").trim()+"',";
							}
							if(cols.size()>0){
								sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION ALL";
							}
						}
					}
				}
			}
			
			if(!"".equals(sqlV)){
				//贷款、贸易融资
				String sql = "INSERT INTO COM_EXTER_GUAR(REPORT_ID,SERIAL_NO,MAIN_BUSS_TYPE,CURRENCY,GUAR_SUM,GUAR_BALANCE,START_DATE,END_DATE,FIVE_TYPE,CONTRACT_VALID)";
				if(tableTile.contains("业务种类")){//类贷款
					sql = "INSERT INTO COM_EXTER_GUAR(REPORT_ID,SERIAL_NO,MAIN_BUSS_TYPE,MINOR_BUSS_TYPE,CURRENCY,GUAR_SUM,GUAR_BALANCE,START_DATE,END_DATE,FIVE_TYPE,CONTRACT_VALID)";
				}
				if("06".equals(bussType)||"07".equals(bussType)||"08".equals(bussType)){  //保函、信用证、银承
					sql = "INSERT INTO COM_EXTER_GUAR(REPORT_ID,SERIAL_NO,MAIN_BUSS_TYPE,CURRENCY,GUAR_SUM,START_DATE,END_DATE,FIVE_TYPE)";
				}else if("06".equals(bussType)||"07".equals(bussType)||"08".equals(bussType)){//保理
					sql = "INSERT INTO COM_EXTER_GUAR(REPORT_ID,SERIAL_NO,MAIN_BUSS_TYPE,CURRENCY,GUAR_SUM,START_DATE,END_DATE,GUAR_BALANCE,FIVE_TYPE)";
				}
				
				sql = sql+sqlV.substring(0, sqlV.length()-9);
				try{
					Map<String,String> map = new HashMap<String,String>();
					//数据入库
					map.put("creatSql", sql);
					companyCrawlerService.saveInfo(map);
				}catch(Exception e){
					logger.error(e.getMessage(), e);
					logger.error("外担保主业务页面解析数据入库失败！");
				}
			}
		}
	}
	
	//解析弹出窗口(解析查看正常结清类业务,未结清正常类业务明细[票据贴现、银承、信用证、保函])
	private void analyzeClearWindow(String pageInfo,String sql,String reportId,String serial_no,CompanyCrawlerManager companyCrawlerService,String settle){
		//解析页面
		Document document = Jsoup.parse(pageInfo);
		List<Element> eles = document.getElementsByTag("table");
		if(eles.size()>0){
			//存放爬取的数据
			String sqlV = "";
			//爬取数据
			for(int i=1;i<eles.size();i++){
				Element ee = eles.get(i);
				if(ee.hasText()){
					List<Element> rows = ee.select("tr");
					for(int t=1;t<rows.size();t++){
						String sqlValue = "'"+reportId+"','"+serial_no+"',";
						List<Element> cols = rows.get(t).select("td");
						for(int j=0;j<cols.size();j++){
							sqlValue = sqlValue+"'"+cols.get(j).text().replace(String.valueOf((char)160), "").trim()+"',";
						}
						if(cols.size()>0){
							sqlV = sqlV +" SELECT "+sqlValue+"'"+settle+"' FROM DUAL UNION ALL";
						}
					}
				}
			}
			if(!"".equals(sqlV)){
				sql = sql+sqlV.substring(0, sqlV.length()-9);
				try{
					Map<String,String> map = new HashMap<String,String>();
					//数据入库
					map.put("creatSql", sql);
					companyCrawlerService.saveInfo(map);
				}catch(Exception e){
					logger.error(e.getMessage(), e);
					logger.error("明细页面解析数据入库失败！");
				}
			}
		}
	}
	//解析弹出窗口(由资产管理公司处置的债务、担保及第三方代偿的债务、欠息、垫款)
	private void analyzeOtherWindow(String pageInfo,String sql,String reportId,String serial_no,CompanyCrawlerManager companyCrawlerService){
		//解析页面
		Document document = Jsoup.parse(pageInfo);
		List<Element> eles = document.getElementsByTag("table");
		if(eles.size()>0){
			//存放爬取的数据
			String sqlV = "";
			//爬取数据
			for(int i=1;i<eles.size();i++){
				Element ee = eles.get(i);
				if(ee.hasText()){
					List<Element> rows = ee.select("tr");
					for(int t=1;t<rows.size();t++){
						String sqlValue = "'"+reportId+"','"+serial_no+"',";
						List<Element> cols = rows.get(t).select("td");
						for(int j=0;j<cols.size();j++){
							sqlValue = sqlValue+"'"+cols.get(j).text().replace(String.valueOf((char)160), "").trim()+"',";
						}
						if(cols.size()>0){
							sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION ALL";
						}
					}
				}
			}
			if(!"".equals(sqlV)&&!"".equals(sql)){
				//String sql = "INSERT INTO COM_OUTER_BUSS_DETAIL(REPORT_ID,SERIAL_NO,CURRENCY,BUSS_SUM,START_DATE,STOP_DATE,MARGIN_PERCENT,FIVE_TYPE)";
				sql = sql+sqlV.substring(0, sqlV.length()-9);
				try{
					Map<String,String> map = new HashMap<String,String>();
					//数据入库
					map.put("creatSql", sql);
					companyCrawlerService.saveInfo(map);
				}catch(Exception e){
					logger.error(e.getMessage(), e);
					logger.error("明细解析数据入库失败！");
				}
			}
		}
	}
	//解析弹出窗口(解析公共记录明细)
	private void analyzePublicWindow(String pageInfo,String reportId,String serial_no,CompanyCrawlerManager companyCrawlerService){
		//解析页面
		Document document = Jsoup.parse(pageInfo);
		List<Element> eles = document.getElementsByTag("table");
		if(eles.size()>0){
			//存放爬取的数据
			String sqlV = "";
			//爬取数据
			for(int i=1;i<eles.size();i++){
				Element ee = eles.get(i);
				if(ee.hasText()){
					List<Element> rows = ee.select("tr");
					for(int t=1;t<rows.size();t++){
						String sqlValue = "'"+reportId+"','"+serial_no+"',";
						List<Element> cols = rows.get(t).select("td");
						for(int j=0;j<cols.size();j++){
							sqlValue = sqlValue+"'"+cols.get(j).text().replace(String.valueOf((char)160), "").trim()+"',";
						}
						if(cols.size()>0){
							sqlV = sqlV +" SELECT "+sqlValue.substring(0, sqlValue.length()-1)+" FROM DUAL UNION ALL";
						}
					}
				}
			}
			if(!"".equals(sqlV)){
				String sql = "INSERT INTO COM_PUBLIC_INFO_DETAIL(REPORT_ID,SERIAL_NO,STATIC_DATE,CUR_SHOULD_PAY,CUR_ACTUAL_PAY,PAY_STATUS,TOTAL_ARREAR_SUM)";
				sql = sql+sqlV.substring(0, sqlV.length()-9);
				try{
					Map<String,String> map = new HashMap<String,String>();
					//数据入库
					map.put("creatSql", sql);
					companyCrawlerService.saveInfo(map);
				}catch(Exception e){
					logger.error(e.getMessage(), e);
					logger.error("公共明细解析数据入库失败！");
				}
			}
		}
	}
	//保存页面,flag标记是excel还是html
	public void SavePopPage(String name,String str,PageData pd,String flag){
		String ID = pd.getString("ID");
		String path = PathUtil.getClasspath() + Const.FILEPATHIMG + ID+ File.separator+pd.getString("nowTime");  //文件路径
		String fileName = name+".html";
		String code = "GBK";
		if("E".equals(flag)){
			fileName = name+".xls";
			code = "ISO-8859-1";
		}
		PrintWriter out = null;
		try {
			File file = new File(path);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(path,fileName);
			if(!file.exists()){
				file.createNewFile();
			}
			out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),code)));
			out.write(str);
			out.flush();
		} catch (IOException e) {
			logger.error(e.getMessage());
		}finally{
			out.close();
		}
	}
}
