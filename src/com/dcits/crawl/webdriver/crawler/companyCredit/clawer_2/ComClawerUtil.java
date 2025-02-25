package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_2;

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
import com.dcits.crawl.service.crawler.CompanyCrawlerManager;


import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.StringUtil;
public class ComClawerUtil extends Thread{
	private static Logger logger = Logger.getLogger(ComClawerUtil.class);
//	public static void main(String[] args) {
//		Map<String, String> map = new HashMap<String, String>();
//		// comParseHtml(map,"",null,null);
//	}
	private Map<String, String> data; 
	private String htmlStr; 
	private CrawlIndAppReManager indAppReService;
	private CompanyCrawlerManager companyCrawlerService;

	public  ComClawerUtil(Map<String, String> data, String htmlStr, CrawlIndAppReManager indAppReService,
			CompanyCrawlerManager companyCrawlerService){
		this.data=data;
		this.companyCrawlerService=companyCrawlerService;
		this.htmlStr=htmlStr;
		this.indAppReService=indAppReService;
	}
	
	@Override
	public void run() {
		try {
			comParseHtml();
		} catch (Exception e) {
			logger.error("爬虫数据解析入库异常");
			logger.error(e);
			e.printStackTrace();
		}
	}

	/**
	 * 企业页面解析
	 * 
	 * @param data
	 *            里面需要报告里面没有的参数
	 * @param companyCrawlerService
	 *            执行数据库的service 查询机构代码(EA01BI01)
	 */
	@SuppressWarnings("unused")
	public void comParseHtml() throws Exception {
		//// String htmlStr = null;
		// try {
		//// htmlStr =
		//// XmlParseUtil.readXmlFile("C:/Users/hp/Desktop/js/js/company.html",
		//// "utf-8");
		// htmlStr =
		//// XmlParseUtil.readXmlFile("C:/Users/hp/Desktop/桌面文件/征信/新建文件夹/company_test.html",
		//// "utf-8");
		//// System.out.println(htmlStr);
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		String ID = data.get("ID").toString();
		String report_id = ""; // 报告编号
		Document document = Jsoup.parse(htmlStr.toString());
		PageData pd = new PageData();

		String flag = null;
		// try{
		// 查得报告
		flag = "05";
		// try {
		List<Element> eles = document.getElementsByClass("m-repbody");
		int bgbz = -1; // 报告标志
		int sfbz = -1; // 身份标识
		int yyts = -1; // 异议提示
		int bgsm = -1; // 报告说明
		int jbxx = -1; // 基本信息
		int xxgy = -1; // 信息概要
		int xdjlmx = -1; // 信贷记录明细
		int fxdjlmx = -1;// 非信贷记录明细
		int ggjlmx = -1;// 公共记录明细
		int cwbb = -1;// 财务报表
		int smjyybzxx = -1;//声明及异议标注信息
		int count = 0;
		for (int i = 0; i < eles.size(); i++) {
			Element ele = eles.get(i);
			String str = ele.getElementsByClass("t1").toString();
			if (i == 0) {
				if (ele.toString().contains("报告编号") && ele.toString().contains("报告时间")) {
					bgbz = i;
					count++;
				}
			}
			if (str.length() > 0) {
				if (str.contains("身份标识")) {
					sfbz = i;
					count++;
				} else if (str.contains("异议提示")) {
					yyts = i;
					count++;
				} else if (str.contains("报告说明")) {
					bgsm = i;
					count++;
				} else if (str.contains("基本信息")) {
					String att = ele.attributes().get("class");
					if (att.contains("secondPage")) {
						jbxx = i;
						count++;
					}
				} else if (str.contains("信息概要")) {
					xxgy = i;
					count++;
				} else if (str.contains("非信贷记录明细")) {
					fxdjlmx = i;
					count++;
				} else if (str.contains("信贷记录明细")) {
					xdjlmx = i;
					count++;
				} else if (str.contains("公共记录明细")) {
					ggjlmx = i;
					count++;
				} else if (str.contains("财务报表")) {
					cwbb = i;
					count++;
				}else if (str.contains("声明及异议标注信息")) {
					smjyybzxx = i;
					count++;
				}
				if (count > 10) {
					break;
				}
			}
		}
		ElementParseUtil parseUtil = new ElementParseUtil(companyCrawlerService);
		// 报告头(报告头由1-报告标志2-身份标识3-异议提示4-报告说明，共4部分组成)
		report_id = parseUtil.reportHead(eles, bgbz, sfbz, yyts, bgsm, data.get("QUERY_ORG_CODE"));
		if (StringUtil.isEmpty(report_id)) {
			updateStatus(flag, indAppReService, ID, report_id);// flag="05" 未查得
		} // throw new Exception("基本信息(baseInfo)入库时，report_id为空");
//		if (report_id != null) {
//			flag = "06";
//			// 更新信息表中状态(未查得/报告生成)
//			updateStatus(flag, indAppReService, ID, report_id);
//		}
		// 基本信息
		parseUtil.baseInfo(eles, jbxx, report_id);
		// 信息概要
		parseUtil.summary(eles, xxgy, report_id);

		// 非信贷记录明细
		parseUtil.noLoanSummary(eles, fxdjlmx, report_id);

		// 公共记录明细
		parseUtil.publicInfo(eles, ggjlmx, report_id);

		//声明及异议标注信息
		parseUtil.DeclareAndDissent(eles, smjyybzxx, report_id);
		// 财务报表单元此处不解析

		// 评级信息
		List<Element> pjxx_eles = document.getElementsByClass("t1");
		for (int i = 0; i < pjxx_eles.size(); i++) {
			if (pjxx_eles.get(i).text().contains("评级信息")) {
				parseUtil.ratingInfo(pjxx_eles, i, report_id);
			}
		}
		// 信贷记录明细
		parseUtil.loadDetail(eles, xdjlmx, report_id);

		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		// }catch(Exception e){
		// e.printStackTrace();
		// }

		// 将数据库中存入的本次报告中的数据字典列由中文转为CODE（二代专用）
		updateDictCode(indAppReService, report_id);
		// 将数据库中存入的本次报告中的数据字典列由中文转为CODE存到列2中（一二代通用）
		oneDictToTwo(indAppReService, report_id);
		if (report_id != null) {
			flag = "06";
			// 更新信息表中状态(未查得/报告生成)
			updateStatus(flag, indAppReService, ID, report_id);
		}
	}

	// 将数据库中存入的本次报告中的数据字典列由中文转为CODE存到列2中（一二代通用）
	public static void oneDictToTwo(CrawlIndAppReManager indAppReService, String report_id) {
		PageData pd = new PageData();
		pd.put("type", "COM");
		try {
			List<PageData> tabColList = new ArrayList<PageData>();
			tabColList = indAppReService.findAllTabName2(pd);
			List<PageData> tabColEncrypt = new ArrayList<PageData>();
			tabColEncrypt = indAppReService.findEncryptTabName2(pd);
			String updateSql = null;
			String selectSql = null;
			for (PageData tabCol : tabColList) {
				boolean isEncrypt = false;
				for (PageData tabCol_en : tabColEncrypt) {
					if (tabCol.getString("TABLE_NAME").equals(tabCol_en.getString("TABLE_NAME"))
							&& tabCol.getString("COLUMN_NAME").equals(tabCol_en.getString("COLUMN_NAME"))) {
						isEncrypt = true;
						break;
					}
				}
				if (isEncrypt) {
					selectSql = "select " + tabCol.getString("COLUMN_NAME") + " from " + tabCol.getString("TABLE_NAME")
							+ " where report_id = '" + report_id + "'" + " group by " + tabCol.getString("COLUMN_NAME");
				} else {
					selectSql = "select " + tabCol.getString("COLUMN_NAME") + " from " + tabCol.getString("TABLE_NAME")
							+ " where report_id = '" + report_id + "'" + " group by " + tabCol.getString("COLUMN_NAME");
				}
				PageData sqlPd = new PageData();
				sqlPd.put("creatSql", selectSql.toString());
				List<PageData> dictDataList = new ArrayList<PageData>();
				dictDataList = indAppReService.selectInfo(sqlPd);
				for (PageData dictData : dictDataList) {
					String[] d_nums = tabCol.getString("ID").split(",");
					for (String d_num : d_nums) {
						PageData code = new PageData();
						code.put("D_NUM", d_num);
						if (isEncrypt) {
							code.put("NAME",
									DESUtil.decrypt("enhjeA==", dictData.getString(tabCol.getString("COLUMN_NAME"))));
						} else {
							code.put("NAME", dictData.getString(tabCol.getString("COLUMN_NAME")));
						}
						PageData pd_tmp = new PageData();
						pd_tmp = indAppReService.findCodeByName(code);
						// 中文转成CODE更新到字段2上
						if (pd_tmp != null) {
							if (isEncrypt) {
								String CODE = DESUtil.encrypt("enhjeA==", pd_tmp.getString("CODE"));
								updateSql = "update " + tabCol.getString("TABLE_NAME") + " set "
										+ tabCol.getString("COLUMN_NAME") + "2" + "= '" + CODE + "'"
										+ " where report_id = '" + report_id + "'" + " and "
										+ tabCol.getString("COLUMN_NAME") + "='"
										+ dictData.getString(tabCol.getString("COLUMN_NAME")) + "'";
							} else {
								updateSql = "update " + tabCol.getString("TABLE_NAME") + " set "
										+ tabCol.getString("COLUMN_NAME") + "2" + "='" + pd_tmp.getString("CODE") + "'"
										+ " where report_id = '" + report_id + "'" + " and "
										+ tabCol.getString("COLUMN_NAME") + "='"
										+ dictData.getString(tabCol.getString("COLUMN_NAME")) + "'";
							}
						} else {
							// 原本的CODE也更新到字段2上
							if (isEncrypt) {
								updateSql = "update " + tabCol.getString("TABLE_NAME") + " set "
										+ tabCol.getString("COLUMN_NAME") + "2" + "= '"
										+ dictData.getString(tabCol.getString("COLUMN_NAME")) + "'"
										+ " where report_id = '" + report_id + "'" + " and "
										+ tabCol.getString("COLUMN_NAME") + "= '"
										+ dictData.getString(tabCol.getString("COLUMN_NAME")) + "'";
							} else {
								updateSql = "update " + tabCol.getString("TABLE_NAME") + " set "
										+ tabCol.getString("COLUMN_NAME") + "2" + "='"
										+ dictData.getString(tabCol.getString("COLUMN_NAME")) + "'"
										+ " where report_id = '" + report_id + "'" + " and "
										+ tabCol.getString("COLUMN_NAME") + "='"
										+ dictData.getString(tabCol.getString("COLUMN_NAME")) + "'";
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

	// 将数据库中存入的本次报告中的数据字典列由中文转为CODE
	public static void updateDictCode(CrawlIndAppReManager indAppReService, String reportId) {
		PageData pd = new PageData();
		pd.put("type", "COM");
		List<PageData> tabNameList = new ArrayList<PageData>();
		List<PageData> tabColEncrypt = new ArrayList<PageData>();
		try {
			tabColEncrypt = indAppReService.findEncryptTabName(pd);
			tabNameList = indAppReService.findTabNameByType(pd);
			for (PageData tabName : tabNameList) {
				List<PageData> tabColList = new ArrayList<PageData>();
				tabColList = indAppReService.findDictByTabName(tabName);
				String updateSql = null;
				for (PageData tabCol : tabColList) {
					boolean isEncrypt = false;
					for (PageData tabCol_en : tabColEncrypt) {
						if (tabCol.getString("TABLE_NAME").equals(tabCol_en.getString("TABLE_NAME"))
								&& tabCol.getString("COLUMN_NAME").equals(tabCol_en.getString("COLUMN_NAME"))) {
							isEncrypt = true;
							break;
						}
					}
					StringBuffer selectSql = new StringBuffer();
					selectSql.append("select ");
					if (isEncrypt) {
						selectSql.append(tabCol.getString("COLUMN_NAME"));
					} else {
						selectSql.append(tabCol.getString("COLUMN_NAME"));
					}
					selectSql.append(" from " + tabCol.getString("TABLE_NAME"));
					selectSql.append(
							" where report_id = '" + reportId + "' group by " + tabCol.getString("COLUMN_NAME"));
					PageData sqlPd = new PageData();
					sqlPd.put("creatSql", selectSql.toString());
					List<PageData> dictDataList = new ArrayList<PageData>();
					dictDataList = indAppReService.selectInfo(sqlPd);
					for (PageData dictData : dictDataList) {
						PageData code = new PageData();
						code.put("D_NUM", tabCol.getString("D_NUM"));
						if (isEncrypt) {
							code.put("NAME",
									DESUtil.decrypt("enhjeA==", dictData.getString(tabCol.getString("COLUMN_NAME"))));
						} else {
							code.put("NAME", dictData.getString(tabCol.getString("COLUMN_NAME")));
						}
						PageData pd_tmp = new PageData();
						pd_tmp = indAppReService.findCodeByName(code);
						//
						if (pd_tmp != null) {
							if (isEncrypt) {// 需要加密的字段
								String CODE = DESUtil.encrypt("enhjeA==", pd_tmp.getString("CODE"));
								updateSql = "update " + tabName.getString("TABLE_NAME") + " set "
										+ tabCol.getString("COLUMN_NAME") + "= '" + CODE + "'" + " where report_id='"
										+ reportId + "'" + " and " + tabCol.getString("COLUMN_NAME") + "='"
										+ dictData.getString(tabCol.getString("COLUMN_NAME")) + "'";
							} else {
								updateSql = "update " + tabName.getString("TABLE_NAME") + " set "
										+ tabCol.getString("COLUMN_NAME") + "='" + pd_tmp.getString("CODE") + "'"
										+ " where report_id='" + reportId + "'" + " and "
										+ tabCol.getString("COLUMN_NAME") + "='"
										+ dictData.getString(tabCol.getString("COLUMN_NAME")) + "'";
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

	@Transactional
	public static void updateStatus(String flag, CrawlIndAppReManager indAppReService, String ID, String reportId) {
		// 更新信息表中状态(未查得/报告生成)-------------------------------------------------------------------
		try {
			PageData pd = new PageData();
			pd.put("ID", ID);
			pd.put("CHECK_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("QUERY_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			pd.put("STATUS", flag);
			pd.put("REPORT_ID", reportId);
			
			// 更新状态表
			
			if ("06".equals(flag) || "06" == flag) {
				pd.put("IS_GET", "1");
				pd.put("RESULTCODE", "AAA000");
			} else {
				pd.put("IS_GET", "0");
				pd.put("RESULTCODE", "");
			}
			indAppReService.updateCheck(pd);
			// 更新明细表
			 indAppReService.UpdateDetailCheck(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void colsPutToMap(PageData pd, Map<String, Object> map) {
		for (String key : map.keySet()) {
			pd.put(key, map.get(key));
		}
	}


}
