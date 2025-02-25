package com.dcits.credit.util.interfaceCredit;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.PersonInterfaceWebSer.PersonWebSerManager;
import com.dcits.credit.service.rest.QueryComInterfaceManager;
import com.dcits.credit.util.ObjectUtil;
import com.dcits.credit.util.XmlParseUtil;
import com.dcits.credit.util.XmlToHtml;
import com.dcits.platform.util.PageData;
/**
 * 
 * 人行返回接口数据落库
 *
 */
public class WebInterfaceServer{
	
	private static Logger logger = Logger.getLogger(WebInterfaceServer.class);
    private static Map<String,String> colOfTab = null;
    private static String encoding = "GBK";
    
	/**
	 * 数据落库
	 * @param queryData
	 * @param authType
	 * @param indAppReService
	 * @param entAppReService
	 */
    @SuppressWarnings("static-access")
	public static void interfaceReportSave(PageData queryData,String authType,
			IndAppReManager indAppReService,EntAppReManager entAppReService,
			QueryComInterfaceManager queryComInterfaceService,PersonWebSerManager personWebSerService){
		String report_id = null;
		try {
			List<PageData> reportTabAndCol = indAppReService.findReportTabAndCol();
			List<String> dicList = indAppReService.queryXmlDic();
			XmlParseUtil.allCol = ObjectUtil.listToMap(reportTabAndCol, "XML_TAG", "COLUMN_NAME");
			XmlParseUtil.allTab = ObjectUtil.listToMap(reportTabAndCol, "XML_TAG", "TABLE_NAME");
			XmlToHtml.allDicName = ObjectUtil.dicMap(dicList);
			XmlToHtml.encoding = encoding;
			String xml = queryData.getString("XML");
			String id = queryData.getString("ID");
			//解析xml报文并落库
			PageData pd = XmlParseUtil.xmlToPd(xml,authType);
			List<String> tabNameList = new ArrayList<String>();
			for(Object obj : pd.keySet()){
				tabNameList.add((String) obj);
			}
			List<PageData> tabColList = indAppReService.queryColOfTab(tabNameList);
			colOfTab = ObjectUtil.listToMap(tabColList, "TAB", "COL");
			StringBuffer sql = new StringBuffer();
			for(Object obj : pd.keySet()){
				sql.replace(0, sql.length(), "");
				String tab_name = (String) obj;
				Object tab_val = pd.get(tab_name);
				if(tab_val instanceof PageData){
					PageData data = (PageData) tab_val;
					if(report_id==null) report_id = data.getString("REPORT_ID");
					sql.append(dataToSQL(data,tab_name));
				}else if(tab_val instanceof List){
					List<PageData> data = (List) tab_val;
					sql.append(dataToSQL(data,tab_name));
				}else{
					logger.error("解析人行返回的xml文件得到的数据，表名为【"+tab_name+"】的数据类型不是PageData或者List的形式，请检查！！");
				}
				indAppReService.publicSave(sql.toString());
			}
			if("1".equals(authType)){
				//更新请求信息表数据
				personWebSerService.updatePersonInfo(queryData);
				//更新流程表
				personWebSerService.updateFs(queryData);
			}else{
				//更新状态表
				queryComInterfaceService.updateFlowTable(queryData);
				//更新信息表
				queryComInterfaceService.updateComInfo(queryData);	
			}

		} catch (Exception e) {
			logger.error("【接口保存报文出错】",e);
			e.printStackTrace();
		}
	}

	/**
	 * 将简单pd转化为sql
	 * @param pd
	 * @param tab_name
	 * @return
	 */
	private static String dataToSQL(PageData data,String tab_name){
		String cols = colOfTab.get(tab_name);
		StringBuffer sql = new StringBuffer("insert into "+tab_name+"("+cols+") values (");
		String[] arrCols = cols.split(",");
		for(int i=0;i<arrCols.length;i++){
			if(i>0) sql.append(",");
			sql.append("'"+String.valueOf(data.get(arrCols[i])).replace("null", "")+"'");
		}
		sql.append(")");
		return sql.toString();       
	}
	/**
	 * 将List转化为sql
	 * @param pd
	 * @param tab_name
	 * @return
	 */
	private static String dataToSQL(List<PageData> data,String tab_name){
		String cols = colOfTab.get(tab_name);
		StringBuffer sql = new StringBuffer("insert into "+tab_name+"("+cols+") ");
		String[] arrCols = cols.split(",");
		int n=0;
		for(PageData pd : data){
			if(n>0) sql.append(" union all ");
			sql.append(" select ");
			for(int i=0;i<arrCols.length;i++){
				if(i>0) sql.append(",");
				sql.append("'"+String.valueOf(pd.get(arrCols[i])).replace("null", "")+"'");
			}
			sql.append(" from dual ");
			n++;
		}
		return sql.toString();       
	}

	
}
