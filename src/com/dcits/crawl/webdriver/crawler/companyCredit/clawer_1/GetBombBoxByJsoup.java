package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_1;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.nodes.Document;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.Util;

/**
 * 获取弹出框
 * @author zhangyy
 *
 */
public class GetBombBoxByJsoup {

	private static Logger logger = Logger.getLogger(GetBombBoxByJsoup.class);	
	
	//捕获excel下载
	public String getExcel(Document document,Map<String, String> cookies,String type,Map<String, String> map){
		String pageCode = "";
		try{
			String url = "reportInfoWindows.do";
			map.put("loancardno", document.getElementById("loancardcode").attr("value"));
			map.put("loancardcode", document.getElementById("loancardcode").attr("value"));
			map.put("searchreason", document.getElementById("searchReason").attr("value"));
			map.put("searchreasoncode",document.getElementById("searchReasonCode").attr("value"));
			map.put("editiontype", document.getElementById("reportcode").attr("value"));
			map.put("creditcode", document.getElementById("creditcode").attr("value"));
			map.put("reqFlag", "1");
			if("02".equals(type)||"03".equals(type)){ //利润表、现金流量表
				map.put("userId",document.getElementById("userId").attr("value"));
				map.put("financename", document.getElementById("financename").attr("value"));
				map.put("financecode", document.getElementById("financecode").attr("value"));
			}
			//请求资源文件
			pageCode = getExcelByJsoup(cookies,map,url,"get");
			
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			logger.error("excel下载参数获取异常!");
		}
		return pageCode;
	}
	
	//根据方法判断应该调用哪一个方法
	public String getMethod(Document document,Map<String, String> cookies,String type,String str){
		String pageCode = "";
		Map<String, String> map = new HashMap<String,String>();
		try{
			String[] listPara = str.replaceAll("'", "").split(",");
			String methodName = listPara[0].split("\\(")[0];
			if(methodName.contains("showLoanAssureeInfo")||methodName.contains("showFinancingAssureeInfo")||methodName.contains("showAssureeAssureeInfo")||methodName.contains("showLetterAssureeInfo")||methodName.contains("showPostalAssureeInfo")||methodName.contains("showGuaranteeletterAssureeInfo")){
				map.put("loancardno", listPara[0].split("\\(")[1]);	
				map.put("financecode", listPara[1]);	
				map.put("loancontractcode", listPara[2].split("\\)")[0]);
				map.put("reqFlag", "2");
				map.put("blockcode", "ASSUREEINFO_00");
				pageCode = getWindow1(document,cookies,map,methodName);
			}else if(methodName.contains("showLoanExtensionInfo")||methodName.contains("showFinancingExtensionInfo")){
				map.put("reqFlag", "3");	
				map.put("loancardno", listPara[0].split("\\(")[1]);	
				map.put("financecode", listPara[1]);
				map.put("operid", listPara[2].split("\\)")[0]);
				pageCode = getWindow1(document,cookies,map,methodName);
			}else if(methodName.contains("showEntaccountPublicHistory")||methodName.contains("showAccfundPublicHistory")||methodName.contains("showPublicPublicHistory")||methodName.contains("showPackInfoWindow")||methodName.contains("showHis")||methodName.contains("showWindows")||methodName.contains("showGuaWindow")||methodName.contains("showReport")){
				if(methodName.contains("showHis")){
					map.put("searchreason", document.getElementById("searchReason").attr("value"));
					map.put("searchreasoncode", document.getElementById("searchReasonCode").attr("value"));
					map.put("editiontype", document.getElementById("reportcode").attr("value"));
					map.put("creditcode", document.getElementById("creditcode").attr("value"));
				}else if(methodName.contains("showReport")){
					map.put("loancardcode_s", document.getElementById("loancardcode").attr("value"));
					map.put("reqid", document.getElementById("reqid").attr("value"));
				}
				pageCode = getWindow2(document,cookies,map,listPara);
			}else if(methodName.contains("showNormal")||methodName.contains("showBillDetail")||methodName.contains("showPostalDetail")||methodName.contains("showLetterDetail")||methodName.contains("showGuaranteeletterDetail")){
				map.put("obj", String.valueOf(new Object()));
				if(!methodName.contains("showNormal")){
					map.put("loancardcode", document.getElementById("loancardcode").attr("value"));	
					map.put("reportcode", document.getElementById("reportcode").attr("value"));
					map.put("source", "1");
					map.put("toporg", listPara[0].split("\\(")[1].split("\\)")[0]);
				}
				pageCode = getWindow3(document,cookies,map,listPara);
			}else if(methodName.contains("showLoanNor")||methodName.contains("showFinancingNor")||methodName.contains("showAssureeNor")||methodName.contains("showPostalNor")||methodName.contains("showLetterNor")||methodName.contains("showBillNor")||methodName.contains("showGuaranteeletterNor")){
				pageCode = getWindow4(document,cookies,map,methodName);
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return pageCode;
	}
	//捕获信贷明细中的弹框
	public String getWindow1(Document document,Map<String, String> cookies,Map<String, String> map,String methodName){
		String pageCode = "";
		try{
			String url = "reportInfoWindows.do";
			if(methodName.contains("showLoanAssureeInfo")){
				map.put("loankind", "1");
			}else if(methodName.contains("showFinancingAssureeInfo")){
				map.put("loankind", "4");
			}else if(methodName.contains("showAssureeAssureeInfo")){
				map.put("loankind", "2");
			}else if(methodName.contains("showLetterAssureeInfo")){
				map.put("loankind", "5");
			}else if(methodName.contains("showPostalAssureeInfo")){
				map.put("loankind", "7");
			}else if(methodName.contains("showGuaranteeletterAssureeInfo")){
				map.put("loankind", "6");
			}else if(methodName.contains("showLoanExtensionInfo")){
				map.put("blockcode", "EXTENSION_01");
			}else if(methodName.contains("showFinancingExtensionInfo")){
				map.put("blockcode", "EXTENSION_02");
			}
			//请求资源文件
			pageCode = getByJsoup(cookies,map,url,"get");
			
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return pageCode;
	}
	
	//捕获信贷明细中的弹框
	public String getWindow2(Document document,Map<String, String> cookies,Map<String, String> map,String[] listPara){
		String pageCode = "";
		try{
			String url = "showAllHistory.do";
			String methodName = listPara[0].split("\\(")[0];
			if(methodName.contains("showEntaccountPublicHistory")){
				map.put("loancardno", listPara[0].split("\\(")[1]);	
				map.put("sistype", listPara[1]);
				map.put("occureddate", listPara[2].split("\\)")[0]);
				map.put("type", "last24month");
				map.put("last24MonthType", "entaccount");
			}else if(methodName.contains("showAccfundPublicHistory")){
				map.put("loancardno", listPara[0].split("\\(")[1]);	
				map.put("occureddate", listPara[1].split("\\)")[0]);
				map.put("type", "last24month");
				map.put("last24MonthType", "accfund");
			}else if(methodName.contains("showPublicPublicHistory")){
				map.put("areacode", listPara[0].split("\\(")[1]);
				map.put("entaccountname", listPara[1]);
				map.put("businessmancode", listPara[2]);
				map.put("sistype", listPara[3]);
				map.put("payinfotype", listPara[4]);
				map.put("censusDate", listPara[5].split("\\)")[0]);
				map.put("type", "last24month");
				map.put("last24MonthType", "public");
			}else if(methodName.contains("showPackInfoWindow")){
				map.put("loancardno", listPara[0].split("\\(")[1]);
				map.put("type", listPara[1]);
				map.put("id", listPara[2]);
				map.put("loankindcode", listPara[3]);
				map.put("financecode", listPara[4].split("\\)")[0]);
			}else if(methodName.contains("showHis")){
				map.put("loancardno", listPara[0].split("\\(")[1]);
				map.put("financecode", listPara[1]);
				map.put("loancontractcode", listPara[2]);
				map.put("type", listPara[3]);
				map.put("id", listPara[4].split("\\)")[0]);
				map.put("loankindcode", listPara[5].split("\\)")[0]);
				map.put("blockcode", "ASSUREEINFO_00");
			}else if(methodName.contains("showWindows")){
				map.put("loancardno", listPara[0].split("\\(")[1]);
				map.put("financecode", listPara[1]);
				map.put("loancontractcode", listPara[2]);
				map.put("type", listPara[3]);
				map.put("id", listPara[4]);
				map.put("loankind", listPara[5].split("\\)")[0]);
				map.put("loankindcode", listPara[5].split("\\)")[0]);
				map.put("blockcode", "ASSUREEINFO_00");
			}else if(methodName.contains("showGuaWindow")){
				map.put("loancardno", listPara[0].split("\\(")[1]);
				map.put("type", listPara[1]);
				map.put("id", listPara[2]);
				map.put("toporg", listPara[3]);
				map.put("kind", listPara[4].split("\\)")[0]);
			}else if(methodName.contains("showReport")){
				map.put("type", listPara[0].split("\\(")[1]);
				map.put("code", listPara[1]);
				map.put("codeType", listPara[2].split("\\)")[0]);
				url = "professionAagainQuery.do";
			}
			//请求资源文件
			pageCode = getByJsoup(cookies,map,url,"get");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return pageCode;
	}
	
	//捕获信贷明细中的弹框
	public String getWindow3(Document document,Map<String, String> cookies,Map<String, String> map,String[] listPara){
		String pageCode = "";
		try{
			String url = "includeNormal.do";
			String methodName = listPara[0].split("\\(")[0];
			if(methodName.contains("showNormal")){
				map.put("loancardcode", listPara[0].split("\\(")[1]);	
				map.put("reportcode", listPara[1]);
				map.put("kindType", listPara[2].split("\\)")[0]);
				map.put("source", "3");
			}else if(methodName.contains("showBillDetail")){
				map.put("kindType", "3");
			}else if(methodName.contains("showPostalDetail")){
				map.put("kindType", "7");
			}else if(methodName.contains("showLetterDetail")){
				map.put("kindType", "5");
			}else if(methodName.contains("showGuaranteeletterDetail")){
				map.put("kindType", "6");
			}
			//请求资源文件
			pageCode = getByJsoup(cookies,map,url,"get");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return pageCode;
	}
	
	//捕获信贷明细中的弹框
	public String getWindow4(Document document,Map<String, String> cookies,Map<String, String> map,String methodName){
		String pageCode = "";
		try{
			String url = "simplequery/profession/creditdetail.jsp";
			if(methodName.contains("showLoanNor")){
				map.put("name", document.getElementById("loanpaid").text());
			}else if(methodName.contains("showFinancingNor")){
				map.put("name", document.getElementById("financingpaid").text());
			}else if(methodName.contains("showAssureeNor")){
				map.put("name", document.getElementById("assureepaid").text());
			}else if(methodName.contains("showPostalNor")){
				map.put("name", document.getElementById("postalpaid").text());
			}else if(methodName.contains("showLetterNor")){
				map.put("name", document.getElementById("letterpaid").text());
			}else if(methodName.contains("showBillNor")){
				map.put("name", document.getElementById("billpaid").text());
			}else if(methodName.contains("showGuaranteeletterNor")){
				map.put("name", document.getElementById("guaranteeletterpaid").text());
			}
			//请求资源文件
			pageCode = getByJsoup(cookies,map,url,"get");
			
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return pageCode;
	}
		
	//公共的请求方法html
	private String getByJsoup(Map<String, String> cookies,Map<String, String> map,String url,String methodType){
		String pageCode = "";
		//判别请求类型
		Method med = Method.GET;
		if("post".equals(methodType)){
			med = Method.POST;
		}
		try{
			url = BaseController.getServerInfo().getString("URL3") + url;
			Response response = Util.queryContentOfCharset(url,  map, cookies,med,"GBK");
			if(response.statusCode() != 200){
				logger.info("弹出页面获取失败" + response.statusCode());
			}else{
				pageCode = response.body();
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return pageCode;
	}
	
	//下载excel
	private String getExcelByJsoup(Map<String, String> cookies,Map<String, String> map,String url,String methodType){
		String pageCode = "";
		//判别请求类型
		Method med = Method.GET;
		if("post".equals(methodType)){
			med = Method.POST;
		}
		try{
			url = BaseController.getServerInfo().getString("URL3") + url;
			Response response = Util.queryExcelContentOfCharset(url,  map, cookies,med,"GBK");
			if(response.statusCode() != 200){
				logger.info("弹出页面获取失败" + response.statusCode());
			}else{
				byte[] bytes = response.bodyAsBytes();
				pageCode = new String(bytes,"ISO-8859-1");
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return pageCode;
	}
	
	//打印附件功能
	public void printDocument(Map<String, String> cookies, Document document,PageData pd){
		try{
			String url = "recordExpand.do";
			Map<String, String> map = new HashMap<String,String>();
			String loancardno = document.getElementById("loancardcode").attr("value");
			String searchreasoncode = document.getElementById("searchReasonCode").attr("value");
			String editiontype = document.getElementById("reportcode").attr("value");
			String creditCode = document.getElementById("creditcode").attr("value");
			map.put("loancardno", loancardno);
			map.put("searchreasoncode", searchreasoncode);
			map.put("editiontype", editiontype);
			map.put("creditCode", creditCode);
			map.put("kind", "3");
			//请求资源文件
			String pageCode = getByJsoup(cookies,map,url,"post");
			//请求弹出框
			map.clear();
			url = "includeNormal.do";
			map.put("loancardcode", loancardno);
			map.put("source", "2");
			map.put("reportcode", editiontype);
			pageCode = getByJsoup(cookies,map,url,"get");
			if(!"".equals(pageCode)){
				//对页面进行处理
				Document doc = Jsoup.parse(pageCode);
				doc.getElementById("loancardcode").val(loancardno);
				doc.getElementById("creditCode").val(creditCode);
				doc.getElementById("editiontype").val(editiontype);
				doc.getElementById("searchreason").val(searchreasoncode);
				doc.getElementById("upaidnormal").text("显示未结清正常类信息");
				doc.getElementById("paidnormal").text("显示已结清正常类信息");
				doc.getElementById("allnormal").text("显示全部");
				doc.getElementById("guanagenormal").text("显示对外担保主业务信息");
				pageCode = doc.toString();
				String ID = pd.getString("ID");
				//记录打印
				StringBuffer str = new StringBuffer();
				str.append("window.print\\(\\);");
				str.append("\\$.ajax\\(\\{");
				str.append("async:false,");
				str.append("cache:false,");
				str.append("data:\\{"+'"'+"ID"+'"'+":'"+ID+"'\\},");
				str.append("url:'../../../../PersonReportInquiry/isPrint.do',");
				str.append("type:"+'"'+"post"+'"');
				str.append(" \\}\\);");
				pageCode = pageCode.replaceAll("window.print\\(\\);", str.toString());
				str = new StringBuffer();
				str.append("<script src="+'"'+"../../../js/common/jquery-1.10.2.js"+'"'+"></script>");
				str.append("</body>");
				str.append("<script>");
				str.append("document.oncontextmenu = function\\(\\)\\{return false;\\}");
				str.append("</script>");
				pageCode = pageCode.replaceAll("</body>", str.toString());
				
				//保存
				new BombBoxAnalyze().SavePopPage("PrintDoc",pageCode,pd,"H");
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
	}
}
