package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_1;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.crawl.service.EnterAppReview.CrawlEntAppReManager;
import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;
import com.dcits.crawl.util.FileTool;
import com.dcits.crawl.util.PathUtil;
import com.dcits.crawl.webdriver.crawler.CompressUtils;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;


/**
 * 企业信用报告中数据爬取
 * @author zhangyy
 *
 */
public class BeginCrawlerInfo {

	private static Logger logger = Logger.getLogger(BeginCrawlerInfo.class);
	
	public void crawlerInfo(String pageCode,CrawlEntAppReManager entAppReService,CompanyCrawlerManager companyCrawlerService,PageData pd,CrawlIndAppReManager indAppReService,Map<String, String> cookies){
		String ID = pd.getString("ID");
		pageCode = pageCode.replaceAll(" ", "");
		Document document = Jsoup.parse(pageCode);
		String reportId="";
		String flag ="05";  //06表示报告生成，05表示未查得
		
		//保存页面源码
		String nowTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		pd.put("nowTime", nowTime);
		new SavePageInfo().savePage(document.toString(),pd);

		//获取报告编号
		reportId = getReportId(document.getElementsByTag("table").first());
		//查得报告
		if(!"".equals(reportId)){
			flag = "06";
			
			try{
				//处理打印附件功能按钮
				new GetBombBoxByJsoup().printDocument(cookies, document,pd);
				
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
					String str = ele.text().replace(String.valueOf((char)160), "").trim();
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
				int numCount = 0;
				//爬取报告信息
				if(reportInfoStart>0){
					getReportInfo(reportId, reportInfoStart, eles, companyCrawlerService);
				}
				
				//爬取基本信息
				if(personInfoStart>0){
					BaseInfo bf = new BaseInfo(cookies,document,pd,reportId,companyCrawlerService,eles);
					bf.getBaseInfo(personInfoStart);
				}
				
				//爬取概要信息
				if(infoSummStart>0){
					//先解析并提前概要综述中信息
					Element ele = eles.get(infoSummStart);
					List<Element> rows = ele.select("tr");
					for(int j=0;j<rows.size();j++){
						String str = rows.get(j).text().replace(String.valueOf((char)160), "").trim();
						if(str.contains("信息主体")){
							getLoanRegExInfo(reportId,str,companyCrawlerService);
							break;
						}
					}
					
					//解析概要数据
					SummaryInfo sf = new SummaryInfo(reportId,companyCrawlerService, eles);
					sf.getSummaryInfo(infoSummStart);
				}
				
				//爬取信息记录明细
				if(creditDetaStart>0){
					DetailInfo df = new DetailInfo(cookies,document,pd,reportId,companyCrawlerService, eles);
					numCount = df.getDetailInfo(creditDetaStart, numCount);
				}
				//爬取公共记录明细
				if(pubDetaStart>0){
					PubRecordInfo pr = new PubRecordInfo(cookies,document,pd,reportId,companyCrawlerService, eles);
					pr.getPubDetailInfo(pubDetaStart,numCount);
				}
				
				//爬取声明信息明细
				if(declearStart>0){
					DeclareRecordInfo dr = new DeclareRecordInfo(reportId,companyCrawlerService, eles);
					dr.getBaseInfo(declearStart);
				}
			}catch(Exception e){
				logger.error("企业解析报错："+e.getMessage(), e);
			}
			//更新信息表中状态(未查得/报告生成)
			updateStatus(flag,entAppReService,indAppReService,ID,reportId);
		}
		
		String ftpPath = pd.getString("ftpPath")+ID;
		String path = PathUtil.getClasspath() + Const.FILEPATHIMG + File.separator+ID;  //文件路径
		String zipFileName=ID+".zip";
		String zipPasswd=ID.substring(0,6);
		if(flag.equals("05")){
			//更新信息表中状态(未查得/报告生成)
			updateStatus(flag,entAppReService,indAppReService,ID,reportId);
		}else{
			//压缩及上传,压缩弹出框
			try{
				//判断文件夹是否存在
				File file = new File(path+"\\"+nowTime);
				if(file.exists()){
					CompressUtils.zip(path+"\\"+nowTime,path+"\\"+zipFileName,true,zipPasswd);
				}
			}catch(Exception e){
				logger.error(e.getMessage(),e);
			}
		}
		//上传
		try{
			new FileTool().upLoadFromProduction(pd.getString("IP"), Integer.parseInt(pd.getString("port")), pd.getString("LoginName"), pd.getString("LoginPass"), ftpPath, zipFileName,path+"/"+zipFileName);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		//删除本地文件
		try{
		//	Util.deleteDirectory(path);
		}catch(Exception e){
			logger.error("本地临时文件删除失败："+ID+e.getMessage(),e);
		}
	}
		
	//获取报告ID
	private String getReportId(Element element){
		String reportId = "";
		try{
			List<Element> cols = element.select("tr>td");
			for(int j=0;j<cols.size();j++){
				if(cols.get(j).text().trim().contains("NO.")){
					reportId = cols.get(j).text().replace(String.valueOf((char)160), "").trim().substring(3, cols.get(j).text().trim().length());
					break;
				}
			}
		}catch(Exception e){
			logger.info("查询失败");
			logger.error(e.getMessage(),e);
		}
		return reportId;
	}
	
	//更新信息表中状态
	@Transactional
	public void updateStatus(String flag,CrawlEntAppReManager entAppReService,CrawlIndAppReManager indAppReService,String ID,String reportId){
		///更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
		try {
			PageData pd = new PageData();
			pd.put("ID", ID);
			pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("STATUS", flag);
			pd.put("REPORT_ID", reportId);
			if("06".equals(flag)||"06"==flag){
				pd.put("IS_GET", "1");
				pd.put("RESULTCODE", "AAA000");
			} else {
				pd.put("IS_GET", "0");
				pd.put("RESULTCODE", "");
			}
			//更新状态表
			indAppReService.updateCheck(pd);
			//更新明细表
			entAppReService.UpdateCDetailCheck(pd);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
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
				String str = rows.get(i).text().replace(String.valueOf((char)160), "").trim();
				if(str.contains("机构信用代码")){
					rowNum = i;
					break;
				}
			}
			for(int i=rowNum;i<rows.size();i++){
				List<Element> cols = rows.get(i).select("td");
				for(int j=0;j<cols.size()/2;j++){
					sqlValue=sqlValue+"'"+cols.get(j*2+1).text().replace(String.valueOf((char)160), "").trim()+"',";
				}
			}
			sqlI = sqlI+" VALUES "+sqlValue.substring(0, sqlValue.length()-1)+")";
			//入库
			map.put("creatSql", sqlI);
			try {
				companyCrawlerService.saveInfo(map);
			} catch (Exception e) {
				logger.error(e.getMessage(),e);
				logger.info("企业报告信息入库失败！");
			}
		}
	}
	
	//正则提取概要综述信息
	private static void getLoanRegExInfo(String reportId,String str,CompanyCrawlerManager companyCrawlerService){
		str = str.replaceAll(" ", "");
		String flag = "0";
		// 正常版报告正则表达式规则
		String regEx="信息主体于(\\d{4})年首次有信贷交易记录，报告期内，共在(\\d*)家金融机构办理过信贷业务，目前在(\\d*)家金融机构的业务仍未结清，当前负债余额为(.*)，不良和违约负债余额为(.*)。";
		String regEx1="信息主体于(\\d{4})年首次有信贷交易记录，报告期内，共在(\\d*)家金融机构办理过信贷业务，目前在(\\d*)家金融机构的业务仍未结清，当前负债余额为(.*)，不良和违约负债余额为(.*)。目前，报告中共有(\\d*)条报数机构说明、(\\d*)条征信中心标注、(\\d*)条信息主体声明。";
		String regEx2="信息主体未与金融机构发生过信贷关系。目前，报告中共有(\\d*)条报数机构说明、(\\d*)条征信中心标注、(\\d*)条信息主体声明。";
		String regEx3="信息主体于(\\d{4})年首次有信贷交易记录，报告期内，共在(\\d*)家金融机构办理过信贷业务，目前均已结清。";
		String regEx4="信息主体于(\\d{4})年首次有信贷交易记录，报告期内，共在(\\d*)家金融机构办理过信贷业务，目前均已结清。目前，报告中共有(\\d*)条报数机构说明、(\\d*)条征信中心标注、(\\d*)条信息主体声明。";
		if(str.contains("未与金融机构发生过信贷关系")){
			regEx = regEx2;
			flag = "2";
		}else if(str.contains("报数机构说明")&&str.contains("当前负债余额")){
			regEx = regEx1;
			flag = "1";
		}else if(str.contains("目前均已结清")&&!str.contains("报数机构说明")){
			regEx = regEx3;
			flag = "3";
		}else if(str.contains("目前均已结清")&&str.contains("报数机构说明")){
			regEx = regEx4;
			flag = "4";
		}
		StringBuffer keys = new StringBuffer();
		keys.append("INSERT INTO COM_INFO_SUMMARY (REPORT_ID");
		StringBuffer values = new StringBuffer();
		values.append("'"+reportId+"'");
		// 编译正则表达式
	    Pattern pattern = Pattern.compile(regEx);
	    boolean success = false;
	    try{
	    	Matcher matcher = pattern.matcher(str);
	 	    while(matcher.find()){
	 	    	success = true;
	 	    	if("0".equals(flag)){
	 	    		keys.append(",FIRST_TRADE_YEAR");
	 	    		keys.append(",RELATION_ORG");
	 	    		keys.append(",UNCLEAR_ORG");
	 	    		keys.append(",CURRENT_DEBT");
	 	    		keys.append(",OVER_DEBT");
	 	    		values.append(",'"+matcher.group(1)+"'");
	 	    		values.append(",'"+matcher.group(2)+"'");
	 	    		values.append(",'"+matcher.group(3)+"'");
	 	    		values.append(",'"+matcher.group(4)+"'");
	 	    		values.append(",'"+matcher.group(5)+"'");
	 	    	}else if("1".equals(flag)){
	 	    		keys.append(",FIRST_TRADE_YEAR");
	 	    		keys.append(",RELATION_ORG");
	 	    		keys.append(",UNCLEAR_ORG");
	 	    		keys.append(",CURRENT_DEBT");
	 	    		keys.append(",OVER_DEBT");
	 	    		keys.append(",ORG_NUM");
	 	    		keys.append(",CREDIT_FLAG_NUM");
	 	    		keys.append(",INFO_STATEMENT_NUM");
	 	    		values.append(",'"+matcher.group(1)+"'");
	 	    		values.append(",'"+matcher.group(2)+"'");
	 	    		values.append(",'"+matcher.group(3)+"'");
	 	    		values.append(",'"+matcher.group(4)+"'");
	 	    		values.append(",'"+matcher.group(5)+"'");
	 	    		values.append(",'"+matcher.group(6)+"'");
	 	    		values.append(",'"+matcher.group(7)+"'");
	 	    		values.append(",'"+matcher.group(8)+"'");
	 	    	}else if("2".equals(flag)){
	 	    		keys.append(",ORG_NUM");
	 	    		keys.append(",CREDIT_FLAG_NUM");
	 	    		keys.append(",INFO_STATEMENT_NUM");
	 	    		values.append(",'"+matcher.group(1)+"'");
	 	    		values.append(",'"+matcher.group(2)+"'");
	 	    		values.append(",'"+matcher.group(3)+"'");
	 	    	}else if("3".equals(flag)){
	 	    		keys.append(",FIRST_TRADE_YEAR");
	 	    		keys.append(",RELATION_ORG");
	 	    		values.append(",'"+matcher.group(1)+"'");
	 	    		values.append(",'"+matcher.group(2)+"'");
	 	    	}else if("4".equals(flag)){
	 	    		keys.append(",FIRST_TRADE_YEAR");
	 	    		keys.append(",RELATION_ORG");
	 	    		keys.append(",ORG_NUM");
	 	    		keys.append(",CREDIT_FLAG_NUM");
	 	    		keys.append(",INFO_STATEMENT_NUM");
	 	    		values.append(",'"+matcher.group(1)+"'");
	 	    		values.append(",'"+matcher.group(2)+"'");
	 	    		values.append(",'"+matcher.group(3)+"'");
	 	    		values.append(",'"+matcher.group(4)+"'");
	 	    		values.append(",'"+matcher.group(5)+"'");
	 	    	}
	 	    }
	 	    
	 	   if(success){
	 		  Map<String,String> map = new HashMap<String,String>();
		 	   keys.append(") VALUES (");
		 	   keys.append(values.toString()+")");
				//入库
				map.put("creatSql", keys.toString());
				try {
					companyCrawlerService.saveInfo(map);
				} catch (Exception e) {
					logger.error(e.getMessage(),e);
					logger.info("企业概要综述信息入库失败！");
				}
	 	   }
	    }catch(Exception e){
	    	logger.error(e.getMessage(),e);
	    	System.out.println(e.getMessage());
	    }
	}
}
