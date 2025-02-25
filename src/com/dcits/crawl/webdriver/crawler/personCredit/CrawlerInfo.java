package com.dcits.crawl.webdriver.crawler.personCredit;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.crawl.service.crawler.PersonCrawlerManager;
import com.dcits.crawl.util.FileTool;
import com.dcits.crawl.util.PathUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;

/**
 * 信用报告中数据爬取
 * @author zhangyy
 *
 */
public class CrawlerInfo  extends Thread{

	private static Logger logger = Logger.getLogger(CrawlerInfo.class);
	private PageData serverInfo; 
	private String pageCode; 
	private CrawlIndAppReManager indAppReService;
	private PersonCrawlerManager personCrawlerService;

	public  CrawlerInfo(String pageCode,PersonCrawlerManager personCrawlerService,
			CrawlIndAppReManager indAppReService,PageData serverInfo){
		this.pageCode=pageCode;
		this.personCrawlerService=personCrawlerService;
		this.serverInfo=serverInfo;
		this.indAppReService=indAppReService;
	}
	
	@Override
	public void run() {
		try {
			crawlerInfo();
		} catch (Exception e) {
			logger.error("爬虫数据解析入库异常");
			logger.error(e);
			e.printStackTrace();
		}
	}
	public void crawlerInfo(){
		String ID = serverInfo.getString("ID");
		pageCode = pageCode.replaceAll("　", "").replace(" ", "");
		Document document = Jsoup.parse(pageCode);
		String reportId="";
		String flag ="05";  //06表示报告生成，05表示未查得
		PageData pd = new PageData();
		try{
			//获取报告头体
			Element titles = document.getElementsByTag("TABLE").first();
			System.out.println("-----"+titles);
			List<Element> rows = titles.select("TR>TD,TR>TH");
			pd = getTileInfo(rows);
		}catch(Exception e){
			logger.error(e.getMessage());
			logger.info("爬虫失败!");
		}
		
		
		//保存页面源码
//		savePageCode(document.toString(),serverInfo);
		
		//报告生成，则继续爬虫
		if(pd.get("REPORT_ID")!=null){  //表示查得信息
			flag = "06";
			//更新信息表中状态(未查得/报告生成)
			reportId = pd.getString("REPORT_ID");
			updateStatus(flag,indAppReService,ID,reportId);
			//20220621,往后的解析暂时注释掉
			/*List<Element> eles = document.getElementsByTag("DIV");
//			System.out.println("----"+eles.get(5));
//			System.out.println("--geshu--"+eles.size());
//			System.out.println("--neirong--"+eles.get(6).text());
//			System.out.println("--neirong2--"+eles.get(6).text().trim().substring(1).trim());
			int secTableStartNum = 0;  //table开始
			int identityStartNum =0;   //基本信息开始
			int creditStartNum=0;    //信息概要开始
			int tradeStartNum=0;    //交易信息开始
			int notTradeStartNum=0;    //非信贷交易信息明细开始
			int pubInfoStartNum=0;    //公共信息开始
			int queryStartNum=0;      //查询记录开始
			int declareStartNum=0;   //本人声明开始
			int centerDeclareStartNum=0;   //征信中心说明开始
			int objectTagStartNum=0;    //异议标注开始
			for(int i=0;i<eles.size();i++){
				Element ele = eles.get(i);
				String str = ele.text().trim();
				if(str.length()>2 && !"".equals(str)){
//					System.out.println("--in if--"+str);
					if(str.substring(1).trim()=="个人基本信息"||str.substring(1).trim().equals("个人基本信息")){
						identityStartNum=i;
						System.out.println("---identityStartNum--------"+identityStartNum);
					}else if(str.substring(1).trim()=="信息概要"||str.substring(1).trim().equals("信息概要")){
						creditStartNum=i;
						System.out.println("------概要-----"+creditStartNum);
					}else if(str.substring(1).trim()=="信贷交易信息明细"||str.substring(1).trim().equals("信贷交易信息明细")){
						tradeStartNum=i;
						System.out.println("------明细-----"+tradeStartNum);
					}else if(str.substring(1).trim()=="非信贷交易信息明细"||str.substring(1).trim().equals("非信贷交易信息明细")){
						notTradeStartNum=i;
						System.out.println("------非信贷交易信息明细-----"+notTradeStartNum);
					}else if(str.substring(1).trim()=="公共信息明细"||str.substring(1).trim().equals("公共信息明细")){
						pubInfoStartNum=i;
						System.out.println("-----公共------"+pubInfoStartNum);
					}else if(str.substring(1).trim()=="征信中心说明"||str.substring(1).trim().equals("征信中心说明")){
						centerDeclareStartNum=i;
						System.out.println("-----------"+centerDeclareStartNum);
					}else if(str.substring(1).trim()=="异议标注"||str.substring(1).trim().equals("异议标注")){
						objectTagStartNum=i;
						System.out.println("-----------"+objectTagStartNum);
					}else if(str.substring(1).trim()=="查询记录"||str.substring(1).trim().equals("查询记录")){
						queryStartNum=i;
						System.out.println("-----------"+queryStartNum);
					}
//					else if(str.substring(1).trim()=="本人声明"||str.substring(1).trim().equals("本人声明")){
//						declareStartNum=i;
//						
//					}
					
					else if(str.length()>7 && str.substring(0,6).trim()=="个人信用报告"|| str.length()>7 && str.substring(0,6).trim().equals("个人信用报告")){
						secTableStartNum=4;
						
						System.out.println("-----个人信用报告------"+secTableStartNum);
					}
//					else if(str.contains("报告说明")){
//						break;
//					}
				}
			}
			
			//查询报告信息
			//提取用户名、证件类型等信息,并将报告信息入库
			pd = getUserName(eles,secTableStartNum,pd,personCrawlerService);
			if(identityStartNum!=0){
				//获取个人基本信息
				new IdentityInfo().getIdentityInfo(pd,identityStartNum,eles,personCrawlerService);
			}else{
				try {
					personCrawlerService.savePersonIdentity(pd);
				} catch (Exception e) {
					logger.error(e.getMessage());
					logger.info("用户身份入库失败！");
				}
			}
			
			if(creditStartNum!=0){
				//获取信息概要
				new LoanSummaryInfo().getInfoSummary(creditStartNum,eles,reportId,personCrawlerService);
			}
			if(tradeStartNum!=0){
				//获取信贷交易明细信息
				new LoanDetailInfo().getLoanDetailInfo(tradeStartNum, eles, reportId,personCrawlerService,serverInfo.getString("QUERY_REASON"));
			}
			if(notTradeStartNum!=0){
				//获取非信贷交易信息明细
				new LoanDetailInfo().getNotLoanDetailInfo(notTradeStartNum, eles, reportId,personCrawlerService,serverInfo.getString("QUERY_REASON"));
			}
			if(pubInfoStartNum!=0){
				//获取公共信息明细
				new PubInfoDetail().getPubInfoDetail(pubInfoStartNum, eles, reportId,personCrawlerService);
			}
			if(centerDeclareStartNum!=0){
				//获取征信中心说明
				new QueryRecord().getCenterStatement(reportId,eles,personCrawlerService,centerDeclareStartNum);
			}
			if(objectTagStartNum!=0){
				//获取异议标注
				new QueryRecord().getStatement(reportId,eles,personCrawlerService,objectTagStartNum);
			}
			if(queryStartNum!=0){
				//获取查询记录
				new QueryRecord().getQueryRecord(queryStartNum, eles, reportId,personCrawlerService,serverInfo.getString("QUERY_REASON"));
			}*/
//			if(declareStartNum!=0){
//				//获取本人声明
//				new QueryRecord().getDeclareObject(reportId, eles, personCrawlerService, declareStartNum,"PER_STATEMENT", "本人声明","3","1");
//			}
			
		}
		/*//更新信息表中状态(未查得/报告生成)
		updateStatus(flag,indAppReService,ID,reportId);
		//将数据库中存入的本次报告中的数据字典列由中文转为CODE（二代专用）
		updateDictCode(indAppReService,reportId);
		//将数据库中存入的本次报告中的数据字典列由中文转为CODE存到列2中（一二代通用）
		oneDictToTwo(indAppReService,reportId);*/
	}
	
	//将数据库中存入的本次报告中的数据字典列由中文转为CODE存到列2中（一二代通用）
	public static void oneDictToTwo(CrawlIndAppReManager indAppReService,String report_id){
		PageData pd = new PageData();
		pd.put("type", "COM");
		try {
			List<PageData> tabColList = new ArrayList<PageData>();
			tabColList = indAppReService.findAllTabName2(pd);
			List<PageData> tabColEncrypt = new ArrayList<PageData>();
			tabColEncrypt = indAppReService.findEncryptTabName2(pd);
			String updateSql = null;
			String selectSql = null;
			for(PageData tabCol:tabColList){
				boolean isEncrypt = false;
				for(PageData tabCol_en:tabColEncrypt){
					if(tabCol.getString("TABLE_NAME").equals(tabCol_en.getString("TABLE_NAME"))
							&&tabCol.getString("COLUMN_NAME").equals(tabCol_en.getString("COLUMN_NAME"))){
						isEncrypt=true;
						break;
					}
				}
				if(isEncrypt){
					selectSql = "select "+tabCol.getString("COLUMN_NAME")
				    +" from "+tabCol.getString("TABLE_NAME")
				    +" where report_id = '"+report_id+"'"
				    +" group by "+tabCol.getString("COLUMN_NAME");
				}else{
					selectSql = "select "+tabCol.getString("COLUMN_NAME")
				    +" from "+tabCol.getString("TABLE_NAME")
				    +" where report_id = '"+report_id+"'"
				    +" group by "+tabCol.getString("COLUMN_NAME");
				}	
				PageData sqlPd = new PageData();
				sqlPd.put("creatSql", selectSql.toString());
				List<PageData> dictDataList = new ArrayList<PageData>();
				dictDataList = indAppReService.selectInfo(sqlPd);
				for(PageData dictData : dictDataList){
					String[] d_nums = tabCol.getString("ID").split(",");
					for(String d_num:d_nums){
						PageData code = new PageData();
						code.put("D_NUM", d_num);
						if (isEncrypt) {
							code.put("NAME",
									DESUtil.decrypt("enhjeA==", dictData.getString(tabCol.getString("COLUMN_NAME"))));
						} else {
							code.put("NAME", dictData.getString(tabCol.getString("COLUMN_NAME")));
						}
						code.put("NAME", dictData.getString(tabCol.getString("COLUMN_NAME")));
						PageData pd_tmp = new PageData();
						pd_tmp=indAppReService.findCodeByName(code);
						//中文转成CODE更新到字段2上
						if(pd_tmp!=null){
							if(isEncrypt){
								String CODE = DESUtil.encrypt("enhjeA==", pd_tmp.getString("CODE"));
								updateSql="update "+tabCol.getString("TABLE_NAME")+" set "
							               +tabCol.getString("COLUMN_NAME")+"2"
								           +"= '"+CODE+"'"
								           +" where report_id = '"+report_id+"'"
								           +" and "+tabCol.getString("COLUMN_NAME")
								           +"= '"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'";
							}else{
								updateSql="update "+tabCol.getString("TABLE_NAME")+" set "
							               +tabCol.getString("COLUMN_NAME")+"2"
								           +"='"+pd_tmp.getString("CODE")+"'"
								           +" where report_id = '"+report_id+"'"
								           +" and "+tabCol.getString("COLUMN_NAME")
								           +"='"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'";
							}			
						}else{
							//原本的CODE也更新到字段2上
							if(isEncrypt){
								updateSql="update "+tabCol.getString("TABLE_NAME")+" set "
							               +tabCol.getString("COLUMN_NAME")+"2"
								           +"= '"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'"
								           +" where report_id = '"+report_id+"'"
								           +" and "+tabCol.getString("COLUMN_NAME")
								           +"= '"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'";
							}else{
								updateSql="update "+tabCol.getString("TABLE_NAME")+" set "
							               +tabCol.getString("COLUMN_NAME")+"2"
								           +"='"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'"
								           +" where report_id = '"+report_id+"'"
								           +" and "+tabCol.getString("COLUMN_NAME")
								           +"='"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'";
							}
						}
						sqlPd.put("updateSql", updateSql);
						indAppReService.updateInfo(sqlPd);
					}						
				}	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}
	//将数据库中存入的本次报告中的数据字典列由中文转为CODE
	public static void updateDictCode(CrawlIndAppReManager indAppReService,String reportId){
		PageData pd = new PageData();
		pd.put("type", "COM");
		List<PageData> tabNameList = new ArrayList<PageData>();
		List<PageData> tabColEncrypt = new ArrayList<PageData>();		
		try {
			tabColEncrypt = indAppReService.findEncryptTabName(pd);
			tabNameList = indAppReService.findTabNameByType(pd);		
			for(PageData tabName:tabNameList){
				List<PageData> tabColList = new ArrayList<PageData>();
				tabColList = indAppReService.findDictByTabName(tabName);
				String updateSql = null;							
				for(PageData tabCol:tabColList){
					boolean isEncrypt = false;
					for(PageData tabCol_en:tabColEncrypt){
						if(tabCol.getString("TABLE_NAME").equals(tabCol_en.getString("TABLE_NAME"))
								&&tabCol.getString("COLUMN_NAME").equals(tabCol_en.getString("COLUMN_NAME"))){
							isEncrypt=true;
							break;
						}
					}					
					StringBuffer selectSql =  new StringBuffer();
					selectSql.append("select ");
					if(isEncrypt){
						selectSql.append(tabCol.getString("COLUMN_NAME"));
					}else{
						selectSql.append(tabCol.getString("COLUMN_NAME"));
					}
					selectSql.append(" from "+tabCol.getString("TABLE_NAME"));
					selectSql.append(" where report_id = '"+reportId+"' group by "+tabCol.getString("COLUMN_NAME"));
					PageData sqlPd = new PageData();
					sqlPd.put("creatSql", selectSql.toString());
					List<PageData> dictDataList = new ArrayList<PageData>();
					dictDataList = indAppReService.selectInfo(sqlPd);
					for(PageData dictData : dictDataList){
						PageData code = new PageData();
						code.put("D_NUM", tabCol.getString("D_NUM"));
						if (isEncrypt) {
							code.put("NAME",
									DESUtil.decrypt("enhjeA==", dictData.getString(tabCol.getString("COLUMN_NAME"))));
						} else {
							code.put("NAME", dictData.getString(tabCol.getString("COLUMN_NAME")));
						}
						code.put("NAME", dictData.getString(tabCol.getString("COLUMN_NAME")));
						PageData pd_tmp = new PageData();
						pd_tmp=indAppReService.findCodeByName(code);
						//
						if(pd_tmp!=null){
							if(isEncrypt){//需要加密的字段
								String CODE = DESUtil.encrypt("enhjeA==", pd_tmp.getString("CODE"));
								updateSql="update "+tabName.getString("TABLE_NAME")+" set "
							               +tabCol.getString("COLUMN_NAME")
								           +"= '"+CODE+"'"
								           +" where report_id='"+reportId+"'"
								           +" and decrypt_dec("+tabCol.getString("COLUMN_NAME")
								           +")='"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'";
							}else{
								updateSql="update "+tabName.getString("TABLE_NAME")+" set "
							               +tabCol.getString("COLUMN_NAME")
								           +"='"+pd_tmp.getString("CODE")+"'"
								           +" where report_id='"+reportId+"'"
								           +" and "+tabCol.getString("COLUMN_NAME")
								           +"='"+dictData.getString(tabCol.getString("COLUMN_NAME"))+"'";
							}		
							sqlPd.put("updateSql", updateSql);
							indAppReService.updateInfo(sqlPd);
						}		
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	
	//获取报告头体  
	private  PageData getTileInfo(List<Element> list) throws Exception{
		PageData pd = new PageData();
		for(int t=0;t<list.size();t++){
			List<Element> cols = list.get(t).select("TD,TH");
//			System.out.println(t+"cols=:"+cols);
//			for(int j=0;j<cols.size();j++){
//				System.out.println(t+"cols.text=:"+cols.get(0).text());
				if(cols.get(0).text().contains("报告编号")){
					String reportId = cols.get(0).text().substring(5);
					pd.put("REPORT_ID", reportId);
				}
//				if(cols.get(0).text().contains("查询请求时间:")){
//					String queryTime = cols.get(0).text().substring(7);
//					pd.put("QUERY_TIME", queryTime);
//				}
				if(cols.get(0).text().contains("报告时间")){
					String reportTime = cols.get(0).text().substring(5);
					pd.put("REPORT_TIME", reportTime);
				}
//			}
		}
		return pd;
	}
	
//	WORK_STATUS NATIONALITY EMAIL
	
	//提取用户名、证件类型及证件号,并将报告信息入库
	@SuppressWarnings({ "unused", "unchecked" })
	private PageData getUserName(List<Element> eles ,int start,PageData data,PersonCrawlerManager personCrawlerService){
		//读取配置文件
		Map<String,String> fields = ReadXmlUtil.readXml("PER_QUERY_DETAIL", "查询信息");
		List<PageData> listpd = new GetWebData().getWebInfoBasic(eles, start, fields);
		if(listpd.size()>0){
			PageData pd=listpd.get(0);
			//给校验列赋值
//			String CHECK_CODE=pd.getString("CLIENT_NAME")+","+pd.getString("CREDENTIALS_TYPE")+","+pd.getString("CREDENTIALS_NO")+","+pd.getString("QUERY_OPERATOR")+","+pd.getString("QUERY_REASON");
//			CHECK_CODE=MD5.md5(CHECK_CODE);
//			pd.put("CHECK_CODE",CHECK_CODE);
			
			//data.putAll(listpd.get(0));
			data.putAll(pd);
		}
		try {
			personCrawlerService.saveReportInfo(data);
		} catch (Exception e) {
			logger.error(e.getMessage());
			logger.error("报告信息入库失败！");
		}
		return data;
	}

	//保存页面
	private void savePageCode(String pageCode,PageData pd){
//		String ID = pd.getString("ID");
		String ID = "201903281152";
		try {
			pageCode = pageCode.replaceAll(" ", "&nbsp;"); 
			pageCode = pageCode.replace("javascript:window.close()", "window.location.href=document.referrer;");
			pageCode = pageCode.replace("javascript:document.execCommand('print')", "printReport()");
			if(pd.get("REPORT_ID")==null||"".equals(pd.get("REPORT_ID"))){
				pageCode = pageCode.replace("width=96 height=36", "style='display:none;'");
				//pageCode = pageCode.replace("<IMG src="+"image/pic_r02.gif"+" width=2 height=2>", "&nbsp");
			}
			pageCode = pageCode.substring(0, pageCode.length()-14);
			StringBuffer str = new StringBuffer();
			str.append(pageCode);
			str.append("<script src="+'"'+"../../js/common/jquery-1.10.2.js"+'"'+"></script>");
			str.append("<SCRIPT>");
			str.append("function printReport(){");
			str.append(" javascript:document.execCommand('print');");
			str.append("$.ajax({");
			str.append("async:false,");
			str.append("cache:false,");
			str.append("data:{"+'"'+"ID"+'"'+":'"+ID+"'},");
			str.append("url:'../../../PersonReportInquiry/isPrint.do',");
			str.append("type:"+'"'+"post"+'"');
			str.append(" });");
			str.append("}");
			str.append("</SCRIPT>");
			str.append("</BODY>");
			str.append("<script>document.oncontextmenu = function(){return false;}</script>");
			str.append("</HTML>");
			pageCode = str.toString();
		} catch (Exception e1) {
			logger.info("页面字符替换失败！");
			logger.info(e1.getMessage());
		}
//		String ftpPath = pd.getString("ftpPath")+ID;
//		String path = PathUtil.getClasspath() + Const.FILEPATHFILE +ID;  //文件路径
//		String fileName = ID+".html";
		
		String ftpPath = "/weblogic/file/credit2.0/html/"+ID;
		String path = PathUtil.getClasspath() + Const.FILEPATHFILE +ID;  //文件路径
		String fileName = ID+".html";
		
		//addb by zz on 20170914
//		String zipFileName=ID+".zip";
//		String zipPasswd=ID.substring(0,6);
		
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
			out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"GBK")));
			out.write(pageCode);
			out.flush();
			//addb by zz on 20170915
//			logger.error("------------------"+path+"\\"+fileName);
//			logger.error("------------------"+path+"\\"+zipFileName);
//			logger.error("------------------"+zipPasswd);
			
			
//			CompressUtils.zip(path+"\\"+fileName,path+"\\"+zipFileName,true,zipPasswd);
		} catch (IOException e) {
			logger.error(e.getMessage());
		}finally{
			out.close();
		}
		try{
//			new FileTool().upLoadFromProduction(pd.getString("IP"), Integer.parseInt(pd.getString("port")), pd.getString("LoginName"), pd.getString("LoginPass"), ftpPath, zipFileName,path+"/"+zipFileName);
			new FileTool().upLoadFromProduction("98.11.52.35", Integer.parseInt("21"), "weblogic", "123456", ftpPath, fileName,path+"/"+fileName);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		//删除本地文件
//		try{
//			Util.deleteDirectory(path);
//		}catch(Exception e){
//			logger.error("本地临时文件删除失败："+ID+e.getMessage(),e);
//		}
	}
	
	//更新信息表中状态
	@Transactional
	public void updateStatus(String flag,CrawlIndAppReManager indAppReService,String ID,String reportId){
		//更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
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
			indAppReService.UpdateDetailCheck(pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}		
}
