package com.dcits.crawl.webdriver.crawler.queryLoancardNo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.dcits.platform.util.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * 爬取中证码
 * @author zhangyy
 *
 */
public class QueryData {

	private static Logger logger = Logger.getLogger(QueryData.class);
	
	public JSONObject crawlerInfo(Document document){
		//存放返回结果数据
		JSONObject returnJson = new JSONObject();
		List<Map<String,String>> ListMap = new ArrayList<Map<String,String>>();
		//解析页面并将中证码入库
		List<Element> eles = document.getElementsByTag("table");
		Element ele = null;
		boolean flag = false;
		//提取数据结果table
		for(int i=0;i<eles.size();i++){
			ele = eles.get(i);
			String str = ele.text().replace(String.valueOf((char)160), "").trim();
			if(str.contains("机构信用代码")&&str.contains("中征码")){
				flag = true;
				break;
			}
		}
		//提取结果数据
		if(flag){
			List<Element> rows = ele.select("tr");
			for(int i=0;i<rows.size();i++){
				String str = rows.get(i).text().replace(String.valueOf((char)160), "").trim();
				if(!str.contains("机构信用代码")&&!str.contains("中征码")){
					Map<String,String> pd = new HashMap<String,String>();
					List<Element> cols = rows.get(i).select("td");
					if(cols.size()==8){
						pd.put("OrgName", cols.get(0).text().replace(String.valueOf((char)160), "").trim());
						pd.put("LoanCardNo", cols.get(1).text().replace(String.valueOf((char)160), "").trim());
						pd.put("SocialCredit", cols.get(2).text().replace(String.valueOf((char)160), "").trim());
						pd.put("SdepOrgCode", cols.get(3).text().replace(String.valueOf((char)160), "").trim());
						pd.put("CreditCode", cols.get(4).text().replace(String.valueOf((char)160), "").trim());
						pd.put("BusinessNum", cols.get(5).text().replace(String.valueOf((char)160), "").trim());
						pd.put("SocialGroupNo", cols.get(6).text().replace(String.valueOf((char)160), "").trim());
						pd.put("PublicNum", cols.get(7).text().replace(String.valueOf((char)160), "").trim());
						pd.put("CivilNo", cols.get(8).text().replace(String.valueOf((char)160), "").trim());
						pd.put("FundNo", cols.get(9).text().replace(String.valueOf((char)160), "").trim());
						pd.put("Other", cols.get(10).text().replace(String.valueOf((char)160), "").trim());
						pd.put("ReligionNo", cols.get(11).text().replace(String.valueOf((char)160), "").trim());
						pd.put("SdeplandTaxCode", cols.get(12).text().replace(String.valueOf((char)160), "").trim());
						pd.put("SdepNationalTaxCode", cols.get(13).text().replace(String.valueOf((char)160), "").trim());
						ListMap.add(pd);
					}
				}
			}
		}
		returnJson.element("resultData", JSONArray.fromObject(ListMap).toString().replace("null", "\"\""));
		return returnJson;
	}
}
