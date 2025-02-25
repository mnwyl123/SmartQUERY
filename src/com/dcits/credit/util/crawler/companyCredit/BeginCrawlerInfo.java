package com.dcits.credit.util.crawler.companyCredit;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.WebDriver;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.crawler.CompanyCrawlerManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;


/**
 * 企业信用报告中数据爬取
 * @author zhangyy
 *
 */
public class BeginCrawlerInfo {

	private static Logger logger = Logger.getLogger(BeginCrawlerInfo.class);
	
	public void crawlerInfo(WebDriver dr,EntAppReManager entAppReService,CompanyCrawlerManager companyCrawlerService,PageData pd,IndAppReManager indAppReService){
		String ID = pd.getString("ID");
		String pageCode = dr.getPageSource().replaceAll(" ", "");
		Document document = Jsoup.parse(pageCode);
		String reportId="";
		String flag ="05";  //06表示报告生成，05表示未查得
		//获取报告编号
		reportId = getReportId(document.getElementsByTag("table").first());
		//查得报告
		if(!"".equals(reportId)){
			flag = "06";
			//保存页面源码
			new SavePageInfo().savePage(dr,pd);
			//更新信息表中状态(未查得/报告生成)
			updateStatus(flag,entAppReService,indAppReService,ID,reportId);
			List<Element> eles = document.getElementsByTag("table");
			
			int reportInfoStart = 0;
			int personInfoStart = 0;  //基本信息开始位置
			int infoSummStart = 0;  //信息概要开始位置
			int creditDetaStart = 0;  //信息记录明细开始位置
			int pubDetaStart = 0;   //公共记录明细开始位置
			int declearStart = 0;    //声明信息明细开始位置
			int count = 0;
			for(int i=0;i<eles.size();i++){
				Element ele = eles.get(i);
				String str = ele.text().trim();
				if(str.length()>0){
					if(str.contains("报告说明")){
						reportInfoStart=i;
						count++;
					}else if(str=="基本信息"||str.equals("基本信息")){
						personInfoStart=i;
						count++;
					}else if(str.contains("信息概要")){
						List<Element> cols = ele.select("tr>td");
						for(int j=0;j<cols.size();j++){
							str=cols.get(j).text().trim();
							if(str=="信息概要"||str.equals("信息概要")){
								infoSummStart=i;
								count++;
								break;
							}
						}
					}else if(str.contains("信贷记录明细")){
						creditDetaStart=i;
						count++;
					}else if(str=="公共信息明细"||str.equals("公共信息明细")){
						pubDetaStart=i;
						count++;
					}else if(str=="声明信息明细"||str.equals("声明信息明细")){
						declearStart=i;
						count++;
					}else if(count==6){
						break;
					}
				}
			}
			//爬取报告信息
			if(reportInfoStart>0){
				getReportInfo(reportId, reportInfoStart, eles, companyCrawlerService);
			}
			
			//爬取基本信息
			if(personInfoStart>0){
				new BaseInfo().getBaseInfo(reportId, personInfoStart, eles, companyCrawlerService);
			}
			
			//爬取概要信息
			if(infoSummStart>0){
				new SummaryInfo().getSummaryInfo(reportId, infoSummStart, eles, companyCrawlerService);
			}
			
			//爬取信息记录明细
			if(creditDetaStart>0){
				new DetailInfo().getDetailInfo(reportId, creditDetaStart, eles, companyCrawlerService);
			}
			
			//爬取公共记录明细
			if(pubDetaStart>0){
				new PubRecordInfo().getPubDetailInfo(reportId, pubDetaStart, eles, companyCrawlerService);
			}
			
			//爬取声明信息明细
			if(declearStart>0){
				new DeclareRecordInfo().getBaseInfo(reportId, declearStart, eles, companyCrawlerService);
			}
			
		}
		if(flag.equals("05")){
			//更新信息表中状态(未查得/报告生成)
			updateStatus(flag,entAppReService,indAppReService,ID,reportId);
		}
		//关闭浏览器
		dr.quit();
	}
		
	//获取报告ID
	private String getReportId(Element element){
		String reportId = "";
		try{
			List<Element> cols = element.select("tr>td");
			for(int j=0;j<cols.size();j++){
				if(cols.get(j).text().trim().contains("NO.")){
					reportId = cols.get(j).text().trim().substring(3, cols.get(j).text().trim().length());
					break;
				}
			}
		}catch(Exception e){
			logger.info("查询失败");
			logger.error(e.getMessage());
		}
		return reportId;
	}
	
	//更新信息表中状态
	@Transactional
	public void updateStatus(String flag,EntAppReManager entAppReService,IndAppReManager indAppReService,String ID,String reportId){
		///更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
		try {
			PageData pd = new PageData();
			pd.put("ID", ID);
			pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("STATUS", flag);
			pd.put("REPORT_ID", reportId);
			//更新状态表
			indAppReService.updateCheck(pd);
			if("06".equals(flag)||"06"==flag){
				pd.put("IS_GET", "1");
			}else{
				pd.put("IS_GET", "0");
			}
			//更新明细表
			entAppReService.UpdateCDetailCheck(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	//获取报告基本信息
	private void getReportInfo(String reportId,int startNum,List<Element> eles,CompanyCrawlerManager companyCrawlerService){
		Map<String,String> map = new HashMap<String,String>();
		String sqlI = "INSERT INTO COM_REPORT_INFO (REPORT_ID,ORG_CODE,CHINA_CREDIT_CODE,REPORT_DATE,QUERY_REASON,QUERY_OPERATOR)";  //拼接sql
		String sqlValue = "('"+reportId+"',";    //字段值
		Element ele = eles.get(startNum+1);
		if(ele.hasText()){
			List<Element> rows = ele.select("tr");
			int rowNum = 0;
			for(int i=0;i<rows.size();i++){
				String str = rows.get(i).text().trim();
				if(str.contains("机构信用代码")){
					rowNum = i;
					break;
				}
			}
			for(int i=rowNum;i<rows.size();i++){
				List<Element> cols = rows.get(i).select("td");
				for(int j=0;j<cols.size()/2;j++){
					sqlValue=sqlValue+"'"+cols.get(j*2+1).text().trim()+"',";
				}
			}
			sqlI = sqlI+" VALUES "+sqlValue.substring(0, sqlValue.length()-1)+")";
			//入库
			map.put("creatSql", sqlI);
			try {
				companyCrawlerService.saveInfo(map);
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("企业报告信息入库失败！");
			}
		}
	}
}
