package com.dcits.crawl.webdriver.crawler;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
public class HtmlForXml {
	
		private String OUTPUT_CHARSET = "GBK";
		private PrintStream output = null;
		private Document doc = null;

		/**
		 * 
		 * @param inputFile
		 * @param outputFile
		 * @param encoding
		 * @throws UnsupportedEncodingException
		 * @throws FileNotFoundException
		 */
		public HtmlForXml(final String inputFile, final String outputFile,
				final String encoding) throws Exception {

			if (encoding != null && encoding.length() > 0)
				OUTPUT_CHARSET = encoding;

			File file = new File(inputFile);
			if (file.exists() && file.isFile()) {

				doc = Jsoup.parse(new File(inputFile), "UTF-8");
				File outFile = new File(outputFile);
				if (outFile.exists() && outFile.isFile())
					outFile.delete();
				output = new PrintStream(new FileOutputStream(outFile, true), true,
						OUTPUT_CHARSET);
			}

		}

		/**
		 * 将标题和文本写到xml文件.
		 * 
		 * @param title
		 *            标题
		 * @param text
		 *            文本
		 * @return boolean
		 */
		public boolean outputXml(final String title, String text) {
			StringBuffer msg = new StringBuffer();
			if (text != null && text.length() > 0) {
				text = text.replace(" ", "");
				msg.append("<");
				msg.append(title);
				msg.append(">");
				msg.append(text);
				msg.append("</");
				msg.append(title);
				msg.append(">");
				output.println(msg.toString());
			}
			return true;
		}
		
		
		
		public boolean outputXml11(final String title, String text) {
			StringBuffer msg = new StringBuffer();
				msg.append("<");
				msg.append(title);
				msg.append(">");
				msg.append(text);
				msg.append("</");
				msg.append(title);
				msg.append(">");
				output.println(msg.toString());
			return true;
		}

		/**
		 * 将标题和文本写到xml文件.
		 * 
		 * @param title
		 *            标题
		 * @param text
		 *            文本
		 * @return boolean
		 */
		public boolean outputXml5(final String title, String text) {
			StringBuffer msg = new StringBuffer();
			//if (text != null && text.length() > 0) {
				text = text.replace(" ", "");
				msg.append("<");
				msg.append(title);
				msg.append(">");
				msg.append(text);
				msg.append("</");
				msg.append(title);
				msg.append(">");
				output.println(msg.toString());
			//}
			return true;
		}

		/**
		 * 将文本写到xml文件.
		 * 
		 * @param xml
		 * @return boolean
		 */
		public boolean outputXml(final String xml) {
			output.println(xml);
			return true;
		}

		/**
		 * 将标题和文本写到xml文件.
		 * 
		 * @param title
		 *            标题
		 * @param text
		 *            文本
		 * @return boolean
		 */
		public boolean outputXml3(final String title, String text) {
			StringBuffer msg = new StringBuffer();
			if (text != null && text.length() > 0) {
				text = text.replace(" ", "");
				msg.append("<");
				msg.append(title);
				msg.append(">");
				msg.append(text);
				msg.append("</");
				msg.append(title);
				msg.append(">");
				output.println(msg.toString());
			}
			return true;
		}

		/**
		 * 个人信用报告头部及摘要
		 */
		public void getHeader() {
			// 信用报告头部 ReportHeader
			Elements rhs = doc.select("table:eq(1):has(tr:eq(0))");
			Elements tds = rhs.select("td");
			if (tds != null && tds.size() > 0) {
				//outputXml("\t\t<PA01>");
					//outputXml("\t\t\t<PA01A>");
				for (int i = 0; i < tds.size(); i++) {
					Element e = tds.get(i);
					if (i == 0) {
						outputXml("ReportNo", e.ownText().split("：")[1]);

					} else if (i == 1) {
						StringBuffer msg = new StringBuffer();
						msg.append("<");
						msg.append("RptTmStmp");
						msg.append(">");
						msg.append(e.ownText().substring(e.ownText().indexOf("：") + 1));
						msg.append("</");
						msg.append("RptTmStmp");
						msg.append(">");
						output.println(msg.toString());
					}
				}
					//outputXml("\t\t\t</PA01A>");
			}
			Elements destds1 = rhs.select("tr:eq(2)");
			Elements destds = destds1.select("td");
			if (destds != null && destds.size() > 0) {
				//outputXml("\t\t\t<PA01B>");
				for (int i = 0; i < destds.size(); i++) {
					Element e = destds.get(i);
					if (i == 0) {
						outputXml("CstNm", e.ownText());

					} else if (i == 1) {
						outputXml("IdentTp", e.ownText());

					} else if (i == 2) {
						outputXml("IdentId", e.ownText());

					} else if (i == 3) {
						outputXml("OprtId", e.ownText());
						
					} else if (i == 4) {
						outputXml("QryTp", e.ownText());
					}
				}
				//outputXml("\t\t\t\t</PA01B>");
			}
				informationObjection();//异议信息提示
				//outputXml("\t\t</PA01>");
		}
		
		
		/**
		 * 异议信息提示
		 */
		private void informationObjection() {
			Elements pis = doc
					.select("table:has(tr:matches(^异议信息提示$))");// 获取信用提示html片段
			Elements tds = pis.select("td");// 获取信用提示里面的有效td

			if (tds != null && tds.size() > 0) {
				//outputXml("\t\t\t<PA01E>");
				Element e = tds.get(0);
				outputXml("DissentCnt", e.ownText());
				
				//outputXml("\t\t\t</PA01E>");
			}
		}
		
		
		

		/**
		 * 一 个人基本信息
		 */
		public void addPersonalInfoStart() {
			Elements isExistPerBaseInfo = doc
					.select("div:has(div:contains(一 个人基本信息))>div:eq(0)");// 判断个人信用报告中是否有个人基本信息
			if (isExistPerBaseInfo.size() > 0) {
				
				getIdentity(); // 个人身份信息
				getSpouse(); // 配偶信息
				getResidence(); // 居住信息
				getProfessions(); // 职业信息
				
			}
		}


		/**
		 * 个人身份信息
		 */
		public void getIdentity() {
			// 信用报告头部 ReportHeader
			Elements pis1 = doc.select("div:has(div:matches(..身份信息))>div:eq(2)");// 获取身份信息html片段
			Elements pitds = pis1.select("td");
			
			if (pitds != null && pitds.size() > 0) {
				outputXml("<IdentInfAry type=\"array\">");
				outputXml("<Struct>");
				//outputXml("\t\t<PB01>");
				//outputXml("\t\t\t<PB01A>");
				for (int i = 0; i < pitds.size(); i++) {

					Element e = pitds.get(i);
					if (i == 0) {
						outputXml("GndCd", e.ownText());
					} else if (i == 1) {
						outputXml("BrthDt", e.ownText());

					} else if (i == 2) {
						outputXml("MrlSts", e.ownText());

					} else if (i == 3) {//
						outputXml("Edct", e.ownText());

					} else if (i == 4) {
						outputXml("EdctDgr", e.ownText());

					} else if (i == 5) {
						outputXml("EmpSttn", e.ownText());
						
					}else if (i == 6) {//国籍
						outputXml("Ctzn", e.ownText());

					} else if (i == 7) {//电子邮箱
						outputXml("Email", e.ownText());
						
					} else if (i == 8) {
						outputXml("CtcAdrAdrLine", e.ownText());

					} else if (i == 9) {
						outputXml("HsholdAdrAdrLine", e.ownText());
						
					//outputXml("\t\t\t</PB01A>");

					}
				}
				//Elements pis = doc.select("table:matches(手机号码$)");
				Elements pis = doc.select("table:has(th:matches(^手机号码$))");
				Elements pitd = pis.select("tr:not(tr:contains(编号))");
				if (pitd != null && pitd.size() > 0) {
					 
					//outputXml("\t\t\t<PB01B>");
					outputXml("<TelNoInfAry type=\"array\">");
					for (int i = 0; i < pitd.size(); i++) {
						
						Element e = pitd.get(i);
		                Elements tds = e.getElementsByTag("td");
		                
		                
		                outputXml("<Struct>");
		               
		                e = tds.get(1);
		                outputXml5("TelNo", e.ownText());

		                e = tds.get(2);
		                outputXml5("MdfDt", e.ownText());
		                
		                outputXml("</Struct>");
		                
		               
					}
					outputXml("</TelNoInfAry>");
					outputXml("<TelNoNum>"+pitd.size()+"</TelNoNum>");
					//outputXml("\t\t\t</PB01B>");
				}

				 outputXml("</Struct>");
				outputXml("</IdentInfAry>");
				
			}
		}
		
		

		/**
		 * 配偶信息
		 */
		public void getSpouse() {
			// 信用报告头部 ReportHeader
			
			
			
			Elements pis1 = doc.select("div:has(div:matches(..身份信息))>div:eq(2)");// 获取身份信息html片段
			Elements pitds = pis1.select("td");

			
			String hyzt = pitds.get(2).ownText();
			
			Elements pis = doc
					.select("div:matches(..配偶信息$)+table");// 获取信用提示html片段
			Elements tds = pis.select("td");// 获取身份信息里面的有效td
			if (tds != null && tds.size() > 0) {
				outputXml("<MrlInfAry type=\"array\">");
				outputXml("<Struct>");
				
				Element e = tds.get(0);
				outputXml3("MrlSts", hyzt);
				outputXml3("SpsCstChinNm", e.ownText());

				e = tds.get(1);
				outputXml3("SpsIdentTp", e.ownText());
				
				e = tds.get(2);
				outputXml3("SpsIdentId", e.ownText());

				e = tds.get(3);
				outputXml3("SpsEmprAdrAdrLine", e.ownText());
				
				e = tds.get(4);
				outputXml3("SpsTelNo", e.ownText());
				
				outputXml("</Struct>");
				outputXml("</MrlInfAry>");
			}
		}

		/**
		 * <!-- 居住信息 -->
		 */
		public void getResidence() {
			// 信用报告头部 ReportHeader
			Elements pis = doc.select("div:matches(..居住信息$)+table");// 获取职业信息html片段
			Elements pitds = pis.select("tr:not(tr:matches(^编号))");// 获取职业信息里面的有效tr
			if (pitds != null && pitds.size() > 0) {
				outputXml("<RsdInfAry type=\"array\">");
				for (int i = 0; i < pitds.size(); i++) {
					outputXml("<Struct>");
					
					if (i < 5) {

					Element e = pitds.get(i);
					Elements tds = e.getElementsByTag("td");

					e = tds.get(1);
					outputXml3("LivAdrAdrLine", e.ownText());

					e = tds.get(2);
					outputXml3("HmTelNo", e.ownText());
					
					e = tds.get(3);
					outputXml3("DwlCdtn", e.ownText());

					e = tds.get(4);
					outputXml3("RsdInfUpdDt", e.ownText());

					

					}
					outputXml("</Struct>");
				}
				outputXml("</RsdInfAry>");
			}
		}

		/**
		 * <!-- 职业信息-->
		 */
		public void getProfessions() {
			// 信用报告头部 ReportHeader
			Elements pis = doc.select("div:matches(..职业信息)+table");// 获取职业信息html片段
			Elements pitds = pis.select("tr:not(tr:contains(编号))");// 获取职业信息里面的有效tr
			Elements pis1 = doc.select("div:matches(..职业信息)+table+table");
			Elements pitds1 = pis1.select("tr:not(tr:contains(编号))");
			
			if (pitds != null && pitds.size() > 0) {
				outputXml("<OcpInfAry type=\"array\">");
				for (int i = 0; i < pitds.size() ; i++) {
					outputXml("<Struct>");

					Element e = pitds.get(i);
					Elements tds = e.getElementsByTag("td");
					
					e = tds.get(1);
					outputXml3("CompanyNm", e.ownText());

					e = tds.get(2);
					outputXml3("EmpOrgNtr", e.ownText());
					
					e = tds.get(3);
//					String EmprAdrAdrLine = e.ownText();
//	                boolean contains = EmprAdrAdrLine.contains("<");
//	                boolean contains1 = EmprAdrAdrLine.contains(">");
//	                if (contains) {
//	                	EmprAdrAdrLine = EmprAdrAdrLine.replace("<", "&lt;");
//					}
//	                if (contains1){
//	                	EmprAdrAdrLine = EmprAdrAdrLine.replace(">", "&gt;");
//					}
//					outputXml3("EmprAdrAdrLine", EmprAdrAdrLine);
					outputXml3("EmprAdrAdrLine", e.ownText());
					

					e = tds.get(4);
					outputXml3("EmpTelNum", e.ownText());
				
					Element e1 = pitds1.get(i);
					Elements tds1 = e1.getElementsByTag("td");

					e1 = tds1.get(1);
					outputXml3("OcpTP", e1.text());

					e1 = tds1.get(2);
					outputXml3("Idy", e1.text());
					
					e1 = tds1.get(3);
					outputXml3("Duty", e1.text());

					e1 = tds1.get(4);
					outputXml3("JobTtlCd", e1.text());
						
					e1 = tds1.get(5);
					outputXml3("EntrOcpYear", e1.text());
						
					e1 = tds1.get(6);
					outputXml3("UpDt", e1.text());
					outputXml("</Struct>");

					}
					outputXml("</OcpInfAry>");
				}
			}
			
			
			
			
			
			

		/*
		 * 二 信息概要
		 */
		public void addInfoSummaryStart() {
			Elements infoSummary = doc
					.select("div:matches( 信息概要$)");// 判断个人信用报告中是否存在信息概要
			if (infoSummary.size() > 0) {
				//outputXml("\t<PSM>");
				
					getSzjd();
				
				//outputXml("\t</PSM>");
				//outputXml("\t<PCO>");
				outputXml("<CrTxnInfAry type=\"array\">");
				outputXml("<Struct>");
				getCreditCue(); // 信贷交易信息提示
				addOverdueAndFellbackStart();//信贷交易违约信息概要
				addShareAndDebtStart();//信贷交易授信及负债信息概要（未结清/未销户
				outputXml("</Struct>");
				outputXml("</CrTxnInfAry>");
				//outputXml("\t</PCO>");
				
				
				nonCreditTransactions();//非信贷交易信息概要
				publicInformation();//公共信息概要
				queryRecordSummary();//查询记录概要
				
			}
		}

		
		
		/**
		 * 数字解读
		 */
		
		public void getSzjd(){
			Elements pis = doc
					.select("div:matches(..个人信用报告“数字解读”$)+table");// 获取信用提示html片段
			Elements pitds = pis.select("tr");// 获取信用提示里面的有效td
			String yxys = "";
			
			if (pitds != null && pitds.size() > 0) {
				outputXml("<ScoInfAry type=\"array\">");
				outputXml("<Struct>");
				for (int i = 1; i < pitds.size(); i++) {
					if(i == 1){
						Element e = pitds.get(i);
		                Elements tds = e.getElementsByTag("td");
						
		                e = tds.get(0);
		                outputXml5("DgtlRead", e.ownText());
						
		                e = tds.get(1);
//		                String RltvPos = e.ownText();
//		                boolean contains = RltvPos.contains("<");
//		                boolean contains1 = RltvPos.contains(">");
//		                if (contains) {
//		                	RltvPos = RltvPos.replace("<", "&lt;");
//						}
//		                if (contains1){
//							RltvPos = RltvPos.replace(">", "&gt;");
//						}
//		                outputXml5("RltvPos", RltvPos);
		                outputXml5("RltvPos", e.ownText());
		                
		                e = tds.get(2);
		                yxys += e.ownText();
					}else{
						Element e = pitds.get(i);
		                Elements tds = e.getElementsByTag("td");
		                e = tds.get(0);
		                yxys += e.ownText();
					}
	                
	               
				}
				outputXml5("ScoInstrcCunt",String.valueOf(pitds.size()-1));
	            outputXml5("ScoInstrc", yxys);
	            outputXml("</Struct>");
	            outputXml("</ScoInfAry>");
	            
			}
		}
		

		/**
		 * 信贷交易信息提示
		 */
		public void getCreditCue() {

			// 信用报告头部 ReportHeader
			Elements pis = doc
					.select("div:matches(..信贷交易信息提示$)+table");// 获取信用提示html片段
			Elements pitds = pis.select("tr");// 获取信用提示里面的有效td
			if (pitds != null && pitds.size() > 0) {
				String totle = "";
				//outputXml("\t\t\t<CrTxnInfAry>");
				outputXml3("CrTxnBsnTpNum",String.valueOf(pitds.size()-2));
				
				String lx = "";
				outputXml("<CrTxnHintInfAry type=\"array\">");
				for (int i = 1; i < pitds.size(); i++) {
					
					Element e = pitds.get(i);
	                Elements tds = e.getElementsByTag("td");
	                Elements tds1 = e.getElementsByTag("th");
	                if(tds1.size()==2){
	            		outputXml("<Struct>");
	            		e = tds1.get(1);
	                	outputXml5("CrTxnBsnTp", e.ownText());
	            		lx = tds1.get(0).text();
	                	outputXml5("CrTxnMxClBsnTp", lx);
	            	    e = tds.get(0);
	                    outputXml5("CrTxnAcctNum", e.ownText());
	                    e = tds.get(1);
	                    outputXml5("CrTxnFrstDstrMon", e.ownText());
	            	}else{
	            		
	            		if("其他".equals(tds1.get(0).text())){
	            			
	            			outputXml("<Struct>");
	            			e = tds.get(0);
	                	    outputXml5("CrTxnBsnTp", e.ownText());
	            			e = tds1.get(0);
	                    	outputXml5("CrTxnMxClBsnTp", e.ownText());
	                        e = tds.get(1);
	                        outputXml5("CrTxnAcctNum", e.ownText());
	                        e = tds.get(2);
	                        outputXml5("CrTxnFrstDstrMon", e.ownText());
	            		}else if ("合计".equals(tds1.get(0).text())){
	                	    e = tds.get(0);
	                	    totle = e.ownText();
	                	    break;
	            		}else{
	            			
	            			outputXml("<Struct>");
	            			e = tds1.get(0);
	                    	outputXml5("CrTxnBsnTp", e.ownText());
	            			outputXml5("CrTxnMxClBsnTp", lx);
	                	    e = tds.get(0);
	                        outputXml5("CrTxnAcctNum", e.ownText());
	                        e = tds.get(1);
	                        outputXml5("CrTxnFrstDstrMon", e.ownText());
	            		}
	            	}

	                outputXml("</Struct>");
	                
				}
				outputXml("</CrTxnHintInfAry>");
				outputXml3("CrTxnTotAcctNum",totle);
				//outputXml("\t\t\t</CrTxnInfAry>");
			}
		}

		/**
		 * 信贷交易违约信息概要
		 */
		public void addOverdueAndFellbackStart() {
			Elements fellbackSummary = doc
					.select("div:matches(..信贷交易违约信息概要$)");
			if (fellbackSummary.size() > 0) {
				FellbackSummary(); // 被追偿信息汇总
				BadDebts();//呆账信息汇总
				OverdueSummary(); // 逾期（透支）信息汇总
			}
		}

		/**
		 * 被追偿信息汇总
		 */
		public void FellbackSummary() {
			// 信用报告头部 ReportHeader
			Elements pis = doc
					.select("table:has(tr:matches(^被追偿信息汇总$))");// 获取信用提示html片段
			Elements trs = pis.select("tr");// 获取信用提示里面的有效td
			// System.out.println(tds.html());
			String numTotle = "";
			String yeTotle = "";
			if (trs.size()>0) {
				//outputXml("\t\t<PC02B>");
				outputXml3("RcvryBsnTpNum", String.valueOf(trs.size()-3));
				outputXml("<RcvrySmryMsgAry type=\"array\">");
				for(int i = 0;i<trs.size();i++){
					
					Element e = trs.get(i);
					Elements tds = e.getElementsByTag("td");
					Elements ths = e.getElementsByTag("th");
					if("合计".equals(ths.get(0).text()) && tds.size()>0 && ths.size()==1){
						numTotle = tds.get(0).text();
						yeTotle = tds.get(1).text();
					}else if(!"合计".equals(ths.get(0).text()) && tds.size()>0 && ths.size()==1){
						
						outputXml("<Struct>");
						outputXml5("RcvryBsnTp",ths.get(0).text());
						outputXml5("RcvryAcctNum",tds.get(0).text());
						outputXml5("RcvryBalAmt",tds.get(1).text());
						outputXml("</Struct>");
						
					}
					
				}
				outputXml("</RcvrySmryMsgAry>");
				outputXml3("RcvryTotAcctNum",numTotle);
				outputXml3("RcvryTotBalAmt", yeTotle);
				//outputXml("\t\t</PC02B>");
			}	
				
				
				
				
		}
		
		/**
		 * 呆账信息汇总
		 */
		public void BadDebts() {
			// 信用报告头部 ReportHeader
			Elements pis = doc
					.select("table:has(tr:matches(^呆账信息汇总$))");// 获取信用提示html片段
			Elements tds = pis.select("td");// 获取信用提示里面的有效td
			
			if (tds != null && tds.size() > 0) {
				//outputXml("<Struct>");
				String msg = "";
				//outputXml("\t\t\t\t<BadAccountTotalCnt>");
				Element e = tds.get(0);
				msg = "<BadDbtAcctNum>";
				msg += e.ownText();
				msg += "</BadDbtAcctNum>";
				outputXml(msg);
		
				e = tds.get(1);
				msg = "<BadDebtBal>";
				msg += e.ownText();
				msg += "</BadDebtBal>";
				outputXml(msg);
				//outputXml("\t\t\t\t</FellbackDebtSum>");
				//outputXml("</Struct>");
			}
		}
		
		

		/**
		 * <!-- 逾期（透支）信息汇总 -->
		 */
		public void OverdueSummary() {

			// 信用报告头部 ReportHeader
			Elements pis = doc
					.select("table:has(tr:matches(^逾期（透支）信息汇总$))");// 获取信用提示html片段
			Elements pitds = pis.select("tr");// 获取信用提示里面的有效td

			if (pitds != null && pitds.size() > 0) {
				//outputXml("\t\t\t<PC02D>");
				String msg = "";
				msg = "<OdueAcctTpNum>";
				msg += pitds.size() - 2;
				msg += "</OdueAcctTpNum>";
				outputXml(msg);
				outputXml("<OdueSmryMsgAry type=\"array\">");
				for (int i = 2; i < pitds.size(); i++) {
					outputXml("<Struct>");
					Element e = pitds.get(i);
					Elements tds1 = e.getElementsByTag("th");
	                Elements tds = e.getElementsByTag("td");
	                
	                e = tds1.get(0);
	                outputXml5("OdueAcctTp", e.ownText());
	                
	                e = tds.get(0);
	                outputXml5("OdueAcctNum", e.ownText());

	                e = tds.get(1);
	                outputXml5("OverdueMon", e.ownText());
	                
	                e = tds.get(2);
	                outputXml5("MonMaxOdAmt", e.ownText());

	                
	                e = tds.get(3);
	                outputXml5("LnMaxOdMon", e.ownText());


	                outputXml("</Struct>");
				}
				outputXml("</OdueSmryMsgAry>");
			}
		}

		/**
		 * 信贷交易授信及负债信息概要（未结清/未销户）
		 */
		public void addShareAndDebtStart() {
			Elements shareAndDebt = doc
					.select("div:matches(..信贷交易授信及负债信息概要$)");// 判断个人信用报告中是否存信贷交易授信及负债信息概要（未结清/未销户）
			if (shareAndDebt.size() > 0) {
				Elements unpaidLoan = doc
						.select("table:has(tr:matches(^非循环贷账户信息汇总$))");// 判断个人信用报告中是否存在	非循环贷账户信息汇总
				Elements undestoryLoancard = doc
						.select("table:has(tr:matches(^循环额度下分账户信息汇总$))");// 判断个人信用报告中是否存在	循环贷账户一信息汇总
				Elements undestoryStandardLoancard = doc
						.select("table:has(tr:matches(^循环贷账户信息汇总$))");// 判断个人信用报告中是否存在	循环贷账户二信息汇总
				Elements guaranteeSummary = doc
						.select("table:has(tr:matches(^贷记卡账户信息汇总$))");// 判断个人信用报告中是否存在	贷记卡账户信息汇总
				
				
				Elements guaranteeSummarys = doc
						.select("table:has(tr:matches(^准贷记卡账户信息汇总$))");// 判断个人信用报告中是否存在	准贷记卡账户信息汇总
				Elements guaranteeSummaryss = doc
						.select("table:has(tr:matches(^相关还款责任信息汇总$))");// 判断个人信用报告中是否存在	相关还款责任信息汇总
				if (unpaidLoan.size() > 0) {
					getUnpaidLoan(); // 非循环贷账户信息汇总
				}
				if (undestoryLoancard.size() > 0) {
					getUndestoryLoancard(); // 循环贷账户一信息汇总
				}
				if (undestoryStandardLoancard.size() > 0) {
					getUndestoryStandardLoancard(); // 循环贷账户二信息汇总
				}
				if (guaranteeSummary.size() > 0) {
					getGuaranteeSummary(); // 贷记卡账户信息汇总
				}
				if (guaranteeSummarys.size() > 0) {
					getGuaranteeSummarys(); // 准贷记卡账户信息汇总
				}
				if (guaranteeSummaryss.size() > 0) {
					getGuaranteeSummaryss(); // 相关还款责任信息汇总
				}
			}
		}

		/**
		 * 非循环贷账户信息汇总
		 */
		public void getUnpaidLoan() {
			// 信用报告头部 ReportHeader
			Elements pis = doc
					.select("table:has(tr:matches(^非循环贷账户信息汇总$))");// 获取信用提示html片段
			Elements tds = pis.select("td");// 获取信用提示里面的有效td
			if (tds != null && tds.size() > 0) {
				//outputXml("<Struct>");

				String msg = "";

				Element e = tds.get(0);
				msg = "<NoRvolvLnAcctSprvOrgNum>";
				msg += e.ownText();
				msg += "</NoRvolvLnAcctSprvOrgNum>";
				outputXml(msg);

				e = tds.get(1);
				msg = "<NoRvolvLnAcctNum>";
				msg += e.ownText();
				msg += "</NoRvolvLnAcctNum>";
				outputXml(msg);

				e = tds.get(2);
				msg = "<NoRvolvLnAcctCrTotAmt>";
				msg += e.ownText();
				msg += "</NoRvolvLnAcctCrTotAmt>";
				outputXml(msg);

				e = tds.get(3);
				msg = "<NoRvolvLnAcctBalAmt>";
				msg += e.ownText();
				msg += "</NoRvolvLnAcctBalAmt>";
				outputXml(msg);

				e = tds.get(4);
				msg = "<NoRvolvLnAcct6MoAvgRpymtAmt>";
				msg += e.ownText();
				msg += "</NoRvolvLnAcct6MoAvgRpymtAmt>";
				outputXml(msg);

				//outputXml("</Struct>");
			}
		}

		/**
		 * 循环贷账户一信息汇总
		 */
		public void getUndestoryLoancard() {
			Elements pis = doc
					.select("table:has(tr:matches(^循环额度下分账户信息汇总$))");// 获取信用提示html片段
			Elements tds = pis.select("td");// 获取信用提示里面的有效td
			if (tds != null && tds.size() > 0) {
				//outputXml("\t\t\t<PC02F>");
				String msg = "";
				//outputXml("<Struct>");
				Element e = tds.get(0);
				msg = "<RvolvLmtAcctSprvOrgNum>";
				msg += e.ownText();
				msg += "</RvolvLmtAcctSprvOrgNum>";
				outputXml(msg);

				e = tds.get(1);
				msg = "<RvolvLmtAcctNum>";
				msg += e.ownText();
				msg += "</RvolvLmtAcctNum>";
				outputXml(msg);

				e = tds.get(2);
				msg = "<RvolvLmtAcctCrTotAmt>";
				msg += e.ownText();
				msg += "</RvolvLmtAcctCrTotAmt>";
				outputXml(msg);

				e = tds.get(3);
				msg = "<RvolvLmtAcctBalAmt>";
				msg += e.ownText();
				msg += "</RvolvLmtAcctBalAmt>";
				outputXml(msg);

				e = tds.get(4);
				msg = "<RvolvLmtAcct6MoAvgRpymtAmt>";
				msg += e.ownText();
				msg += "</RvolvLmtAcct6MoAvgRpymtAmt>";
				outputXml(msg);
				//outputXml("</Struct>");
				//outputXml("\t\t\t</PC02F>");
			}
		}

		/**
		 * 循环贷账户二信息汇总
		 */
		public void getUndestoryStandardLoancard() {
			Elements pis = doc
					.select("table:has(tr:matches(^循环贷账户信息汇总$))");// 获取未销户准贷记卡信息html片段
			Elements tds = pis.select("td");// 获取未销户准贷记卡信息里面的有效td
			if (tds != null && tds.size() > 0) {
				//outputXml("\t\t\t<PC02G>");
				String msg = "";
				//outputXml("<Struct>");
				Element e = tds.get(0);
				msg = "<RvolvLnAcctSprvOrgNum>";
				msg += e.ownText();
				msg += "</RvolvLnAcctSprvOrgNum>";
				outputXml(msg);

				e = tds.get(1);
				msg = "<RvolvLnAcctNum>";
				msg += e.ownText();
				msg += "</RvolvLnAcctNum>";
				outputXml(msg);

				e = tds.get(2);
				msg = "<RvolvLnAcctCrTotAmt>";
				msg += e.ownText();
				msg += "</RvolvLnAcctCrTotAmt>";
				outputXml(msg);

				e = tds.get(3);
				msg = "<RvolvLnAcctBalAmt>";
				msg += e.ownText();
				msg += "</RvolvLnAcctBalAmt>";
				outputXml(msg);

				e = tds.get(4);
				msg = "<RvolvLnAcct6MoAvgRpymtAmt>";
				msg += e.ownText();
				msg += "</RvolvLnAcct6MoAvgRpymtAmt>";
				outputXml(msg);

				//outputXml("</Struct>");
			}
		}

		/**
		 * 贷记卡账户信息汇总
		 */
		public void getGuaranteeSummary() {
			Elements pis = doc.select("table:has(tr:matches(^贷记卡账户信息汇总$))");// 获取未销户准贷记卡信息html片段
			Elements tds = pis.select("td");// 获取未销户准贷记卡信息里面的有效td
			//outputXml("<CcasInfAry>");
			if (tds != null && tds.size() > 0) {
				
				//outputXml("<Struct>");
				String msg = "";
				
				Element e = tds.get(0);
				msg = "<CrCrdIssuOrgCnt>";
				msg += e.ownText();
				msg += "</CrCrdIssuOrgCnt>";
				outputXml(msg);

				e = tds.get(1);
				msg = "<AcctCnt>";
				msg += e.ownText();
				msg += "</AcctCnt>";
				outputXml(msg);

				e = tds.get(2);
				msg = "<CrCrdLmt>";
				msg += e.ownText();
				msg += "</CrCrdLmt>";
				outputXml(msg);

				e = tds.get(3);
				msg = "<CrdtCrdMaxGrntLmt>";
				msg += e.ownText();
				msg += "</CrdtCrdMaxGrntLmt>";
				outputXml(msg);

				e = tds.get(4);
				msg = "<CrdtCrdMinGrntLmt>";
				msg += e.ownText();
				msg += "</CrdtCrdMinGrntLmt>";
				outputXml(msg);
				
				e = tds.get(5);
				msg = "<AlrdUsedLmt>";
				msg += e.ownText();
				msg += "</AlrdUsedLmt>";
				outputXml(msg);

				e = tds.get(6);
				msg = "<AvgUseLmt>";
				msg += e.ownText();
				msg += "</AvgUseLmt>";
				outputXml(msg);

				//outputXml("</Struct>");
				
			}
			//outputXml("</CcasInfAry>");
		}
		
		
		
		
		
		/**
		 * 准贷记卡账户信息汇总
		 */
		public void getGuaranteeSummarys() {
			Elements pis = doc.select("table:has(tr:matches(^准贷记卡账户信息汇总$))");// 获取未销户准贷记卡信息html片段
			Elements tds = pis.select("td");// 获取未销户准贷记卡信息里面的有效td
			if (tds != null && tds.size() > 0) {
				//outputXml("<Struct>");

				String msg = "";
				
				Element e = tds.get(0);
				msg = "<IssuOrgCnt>";
				msg += e.ownText();
				msg += "</IssuOrgCnt>";
				outputXml(msg);

				e = tds.get(1);
				msg = "<SmCrCrdAcctCnt>";
				msg += e.ownText();
				msg += "</SmCrCrdAcctCnt>";
				outputXml(msg);

				e = tds.get(2);
				msg = "<SmCrCrdLmt>";
				msg += e.ownText();
				msg += "</SmCrCrdLmt>";
				outputXml(msg);

				e = tds.get(3);
				msg = "<SmCrMaxGrntLmt>";
				msg += e.ownText();
				msg += "</SmCrMaxGrntLmt>";
				outputXml(msg);

				e = tds.get(4);
				msg = "<SmCrMinGrntLmt>";
				msg += e.ownText();
				msg += "</SmCrMinGrntLmt>";
				outputXml(msg);
				
				e = tds.get(5);
				msg = "<SmCrCrdOdBal>";
				msg += e.ownText();
				msg += "</SmCrCrdOdBal>";
				outputXml(msg);

				e = tds.get(6);
				msg = "<SmCrCrdAvgOdBal>";
				msg += e.ownText();
				msg += "</SmCrCrdAvgOdBal>";
				outputXml(msg);

				//outputXml("</Struct>");
			}
		}
		
		
		
		/**
		 * 相关还款责任信息汇总
		 */
		public void getGuaranteeSummaryss() {
			Elements pis = doc.select("table:has(tr:matches(^相关还款责任信息汇总$))");// 获取未销户准贷记卡信息html片段
			Elements tds = pis.select("td");// 获取未销户准贷记卡信息里面的有效td
			Elements qptr = pis.select("tr:contains(为个人)+tr"); 
			Elements qetr = pis.select("tr:contains(为企业)+tr"); 
			Elements qpths = qptr.select("th");
			Elements qeths = qetr.select("th");
			
			int n = Integer.valueOf(qpths.size())+Integer.valueOf(qeths.size());
			
			
			outputXml("<RlvRpymtNum>"+n+"</RlvRpymtNum>");
			
			outputXml("<RlvRpymtSmryMsgAry type=\"array\">");
			for(int i  = 0;i<qpths.size();i++){
				outputXml("<Struct>");
				outputXml("<BrwIdentTp>为个人</BrwIdentTp>");
				outputXml("<RlvRpymtTp>"+qpths.get(i).text()+"</RlvRpymtTp>");
				
				String msg = "";
				
				Element e = tds.get(i*3+0);
				msg = "<RlvRpymtAcctNum>";
				msg += e.ownText();
				msg += "</RlvRpymtAcctNum>";
				outputXml(msg);

				e = tds.get(i*3+1);
				msg = "<RlvRpymtAmt>";
				msg += e.ownText();
				msg += "</RlvRpymtAmt>";
				outputXml(msg);

				e = tds.get(i*3+2);
				msg = "<RlvRpymtBalAmt>";
				msg += e.ownText();
				msg += "</RlvRpymtBalAmt>";
				outputXml(msg);
				
				
				outputXml("</Struct>");
				
			}
			
			for(int k=0;k<qeths.size();k++){
				outputXml("<Struct>");
				outputXml("<BrwIdentTp>为企业</BrwIdentTp>");
				outputXml("<RlvRpymtTp>"+qeths.get(k).text()+"</RlvRpymtTp>");
				
				String msg = "";
				
				Element e = tds.get((k+qpths.size())*3+0);
				msg = "<RlvRpymtAcctNum>";
				msg += e.ownText();
				msg += "</RlvRpymtAcctNum>";
				outputXml(msg);

				e = tds.get((k+qpths.size())*3+1);
				msg = "<RlvRpymtAmt>";
				msg += e.ownText();
				msg += "</RlvRpymtAmt>";
				outputXml(msg);

				e = tds.get((k+qpths.size())*3+2);
				msg = "<RlvRpymtBalAmt>";
				msg += e.ownText();
				msg += "</RlvRpymtBalAmt>";
				outputXml(msg);
				
				
				outputXml("</Struct>");
			}
			outputXml("</RlvRpymtSmryMsgAry>");
			
			
			
			
		}
		
		
		/**
		 * 非信贷交易信息概要
		 */
		private void nonCreditTransactions() {
			Elements pis = doc.select("div:matches(..非信贷交易信息概要$)+table");
			Elements pitds = pis.select("tr");// 获取信用提示里面的有效td

			if (pitds != null && pitds.size() > 0) {
				outputXml("<NoCrTxnInfAry type=\"array\">");
				outputXml("<Struct>");
				//outputXml("\t\t<PC03>");
				String msg = "";
				msg = "<AfPymtBsnTpNum>";
				msg += pitds.size() - 2;
				msg += "</AfPymtBsnTpNum>";
				outputXml(msg);
				outputXml("<AfPymtBsnArgInfAry type=\"array\">");
				for (int i = 2; i < pitds.size(); i++) {
					
					outputXml("<Struct>");
					Element e = pitds.get(i);
					Elements tds1 = e.getElementsByTag("th");
	                Elements tds = e.getElementsByTag("td");
	                
	                e = tds1.get(0);
	                outputXml("AfPymtBsnTp", e.ownText());
	                
	                e = tds.get(0);
	                outputXml("AfPymtBsnArAcctNum", e.ownText());

	                e = tds.get(1);
	                outputXml("AfPymtBsnArAmt", e.ownText());

	                outputXml("</Struct>");
	               
				}
				outputXml("</AfPymtBsnArgInfAry>");
				//outputXml("\t\t</PC03>");
				outputXml("</Struct>");
				outputXml("</NoCrTxnInfAry>");
			}
			
		}
		
		
		/**
		 * 公共信息概要
		 */
		private void publicInformation() {
			Elements pis = doc.select("div:matches(..公共信息概要$)+table");
			Elements pitds = pis.select("tr");// 获取信用提示里面的有效td

			if (pitds != null && pitds.size() > 0) {
				outputXml("<PblcInfAry type=\"array\">");
				  outputXml("<Struct>");
				String msg = "";
				msg = "<PblcInfTpNum>";
				msg += pitds.size() - 2;
				msg += "</PblcInfTpNum>";
				outputXml(msg);
				outputXml("<PblcSmryMsgAry type=\"array\">");
				for (int i = 2; i < pitds.size(); i++) {
					
					outputXml("<Struct>");
					Element e = pitds.get(i);
					Elements tds1 = e.getElementsByTag("th");
	                Elements tds = e.getElementsByTag("td");
	                
	                e = tds1.get(0);
	                outputXml("PblcInfTp", e.ownText());
	                
	                e = tds.get(0);
	                outputXml("PblcInfRcrd", e.ownText());

	                e = tds.get(1);
	                outputXml("PblcInfArAmt", e.ownText());

	                outputXml("</Struct>");
				}
				outputXml("</PblcSmryMsgAry>");
				  outputXml("</Struct>");
				outputXml("</PblcInfAry>");
			}
			
		}
		
		
		/**
		 * 查询记录概要
		 */
		private void queryRecordSummary(){
			Elements pis = doc.select("div:matches(..查询记录概要$)+table");
			Elements ths = pis.select("th");
			if (ths != null && ths.size() > 0) {
				
			outputXml("<QryInfAry type=\"array\">");
			outputXml("<Struct>");
			//outputXml("\t\t<PC05>");
			//outputXml("\t\t\t<PC05A>");
			
			if("上一次查询记录".equals(ths.get(0).text())){
				Elements tds = pis.select("td");
				if (tds != null && tds.size() > 0) {
					String msg = "";
					Element e = tds.get(0);
					msg = "<LstTmQryDt>";
					msg += e.ownText();
					msg += "</LstTmQryDt>";
					outputXml(msg);

					e = tds.get(1);
					msg = "<LstTmQryOrgCd>";
					msg += e.ownText();
					msg += "</LstTmQryOrgCd>";
					outputXml(msg);

					e = tds.get(2);
					msg = "<LstTmQryRsn>";
					msg += e.ownText();
					msg += "</LstTmQryRsn>";
					outputXml(msg);
					//outputXml("\t\t\t</PC05A>");
				}
				Elements pis1 = doc.select("div:matches(..查询记录概要$)+table+table");
				Elements tds1 = pis1.select("tr:not(tr:contains(贷款审批))>td");
				
			if (tds1 != null && tds1.size() > 0) {if (tds1 != null && tds1.size() > 0) {
				String msg = "";
				//outputXml("\t\t\t<PC05B>");	
				Element	e = tds1.get(0);
				msg = "<Wi1MoLoanAprvQryInstCnt>";
				msg += e.ownText();
				msg += "</Wi1MoLoanAprvQryInstCnt>";
				outputXml(msg);
				
				e = tds1.get(1);
				msg = "<Wi1MoCrCardAprvQryInstCnt>";
				msg += e.ownText();
				msg += "</Wi1MoCrCardAprvQryInstCnt>";
				outputXml(msg);

				e = tds1.get(2);
				msg = "<Wi1MoLoanAprvQryTms>";
				msg += e.ownText();
				msg += "</Wi1MoLoanAprvQryTms>";
				outputXml(msg);

				e = tds1.get(3);
				msg = "<Wi1MoCrCardAprvQryTms>";
				msg += e.ownText();
				msg += "</Wi1MoCrCardAprvQryTms>";
				outputXml(msg);

				e = tds1.get(4);
				msg = "<Wi1MoPrsnQryTms>";
				msg += e.ownText();
				msg += "</Wi1MoPrsnQryTms>";
				outputXml(msg);
				
				e = tds1.get(5);
				msg = "<Wi2YrLoanAfMgtQryTms>";
				msg += e.ownText();
				msg += "</Wi2YrLoanAfMgtQryTms>";
				outputXml(msg);

				e = tds1.get(6);
				msg = "<Wi2YrAssrnQualfAprvQryTms>";
				msg += e.ownText();
				msg += "</Wi2YrAssrnQualfAprvQryTms>";
				outputXml(msg);

				e = tds1.get(7);
				msg = "<Wi2YrSEMRealNmAprvQryTms>";
				msg += e.ownText();
				msg += "</Wi2YrSEMRealNmAprvQryTms>";
				outputXml(msg);
				
				//outputXml("\t\t\t</PC05B>");
				//outputXml("\t\t</PC05>");
				//outputXml("</QryInfAry>");
				}
			}
			}else{
				//outputXml("\t\t\t</PC05A>");
				Elements pis1 = doc.select("div:matches(..查询记录概要$)+table");
				Elements tds1 = pis1.select("tr:not(tr:contains(贷款审批))>td");
				if (tds1 != null && tds1.size() > 0) {if (tds1 != null && tds1.size() > 0) {
					String msg = "";
					//outputXml("\t\t\t<PC05B>");	
					Element	e = tds1.get(0);
					msg = "<Wi1MoLoanAprvQryInstCnt>";
					msg += e.ownText();
					msg += "</Wi1MoLoanAprvQryInstCnt>";
					outputXml(msg);
					
					e = tds1.get(1);
					msg = "<Wi1MoCrCardAprvQryInstCnt>";
					msg += e.ownText();
					msg += "</Wi1MoCrCardAprvQryInstCnt>";
					outputXml(msg);

					e = tds1.get(2);
					msg = "<Wi1MoLoanAprvQryTms>";
					msg += e.ownText();
					msg += "</Wi1MoLoanAprvQryTms>";
					outputXml(msg);

					e = tds1.get(3);
					msg = "<Wi1MoCrCardAprvQryTms>";
					msg += e.ownText();
					msg += "</Wi1MoCrCardAprvQryTms>";
					outputXml(msg);

					e = tds1.get(4);
					msg = "<Wi1MoPrsnQryTms>";
					msg += e.ownText();
					msg += "</Wi1MoPrsnQryTms>";
					outputXml(msg);
					
					e = tds1.get(5);
					msg = "<Wi2YrLoanAfMgtQryTms>";
					msg += e.ownText();
					msg += "</Wi2YrLoanAfMgtQryTms>";
					outputXml(msg);

					e = tds1.get(6);
					msg = "<Wi2YrAssrnQualfAprvQryTms>";
					msg += e.ownText();
					msg += "</Wi2YrAssrnQualfAprvQryTms>";
					outputXml(msg);

					e = tds1.get(7);
					msg = "<Wi2YrSEMRealNmAprvQryTms>";
					msg += e.ownText();
					msg += "</Wi2YrSEMRealNmAprvQryTms>";
					outputXml(msg);
					
					//outputXml("\t\t\t</PC05B>");
					//outputXml("\t\t</PC05>");
					
					}
				
				}
			}
			outputXml("</Struct>");
			outputXml("</QryInfAry>");
			}
		}
		
		

		/**
		 *  三 信贷交易信息明细
		 */
		public void addCreditDetailStart() {
			Elements infoSummary = doc
					.select("div:matches( 信贷交易信息明细$)");// 判断个人信用报告中是否存在信贷交易信息明细
				
			if (infoSummary.size() > 0) {
				outputXml("<DbCrAcctInfAry type=\"array\">");	
				//获取"信贷交易明细"整个大的div
				Elements pis11 = doc.select("body>div>div:eq(4)");
				String  piString  = pis11.toString();
				String[] str1=piString.split("<div class=\"t2 f-mgtop\">");
				
				for (int i = 1; i < str1.length ; i++) {
					
					String string = str1[i];
					
					Document parse = Jsoup.parse(string);
					if (parse.select("html:contains(）被追偿信息)") != null && parse.select("html:contains(）被追偿信息)").size()>0) {
						allDetails(); //（一）被追偿信息
					}else if (parse.select("html:contains(非循环贷账户)") != null && parse.select("html:contains(非循环贷账户)").size()>0){
						allDetailss(parse,"非循环贷账户");
					}else if (parse.select("html:contains(循环额度下分账户)") != null && parse.select("html:contains(循环额度下分账户)").size()>0) {
						allDetailss(parse,"循环额度下分账户");
					}else if (parse.select("html:contains(）循环贷账户)") != null && parse.select("html:contains(）循环贷账户)").size()>0) {
						allDetailss(parse,"循环贷账户");
					}else if (parse.select("html:contains(）贷记卡账户)") != null && parse.select("html:contains(）贷记卡账户)").size()>0) {
						allDetailss(parse,"贷记卡账户");
					}else if (parse.select("html:contains(准贷记卡账户)") != null && parse.select("html:contains(准贷记卡账户)").size()>0) {
						allDetailss(parse,"准贷记卡账户");
					}else if (parse.select("html:contains(）相关还款责任信息)") != null && parse.select("html:contains(）相关还款责任信息)").size()>0) {
						allDetailss(parse,"相关还款责任信息");
					}
					
				}
				
				outputXml("</DbCrAcctInfAry>");
				
				creditAgreement();   //（八）授信协议信息
				
				relatedRepayment();  //（七）相关还款责任信息
//				for (int i = 1; i < str1.length ; i++) {
//					
//					String string = str1[i];
//					
//					Document parse = Jsoup.parse(string);
//				}
//				
//				relatedRepayment();  //（七）相关还款责任信息
//				
			}
		}
		
		
		private void allDetailss(Document parse,String leixing) {

			Elements pis = parse.select("table:has(tr:contains(账户标识))," +
					"table:has(tr:contains(账户标识))+table:has(tr:contains(账户状态))," +
					"table:has(tr:contains(账户标识))+table:has(tr:contains(账户状态))+table:has(tr:contains(逾期31—60天))," +
					"table:has(tr:contains(的还款记录)),"+
					"table:has(tr:contains(的还款记录))+table:has(tr:contains(特殊交易类型)),"+
					"table:has(tr:matches(账单日)),"+
					"table:has(tr:matches(大额专项分期额度)),"+
					"table:has(tr:matches(当前还款状态))");
			
			if (pis != null && pis.size() > 0) {
				for (int i = 0; i < pis.size() ; i++) {
					Elements pccc = null;
					Elements pddd = null; 
					Elements peee = null;
					
					Element q = pis.get(i);
					Elements piss = q.select("table:has(tr:matches(账户标识))");
					
					if(i<pis.size()-1){
						Element p = pis.get(i+1);
						pccc = p.select("table:has(tr:matches(当前还款状态))");
					}
					
					if(i<pis.size()-2){
						Element p = pis.get(i+2);
					    pddd = p.select("table:has(tr:matches(当前还款状态))");
					}
					if(i<pis.size()-3){
						Element p = pis.get(i+3);
						peee = p.select("table:has(tr:matches(当前还款状态))");
					}
					
					
					if (piss != null && piss.size() > 0) {
						
					
					if(i != 0){
						outputXml("</Struct>");
					}
					outputXml("<Struct>");	
					
					Elements tds = q.getElementsByTag("td");
					
									
						if (tds.size() == 12 || tds.size() == 15) {
							
							
						outputXml("AcctTp", leixing);
											
						Element e = tds.get(0);
						outputXml("SprvOrgCd", e.ownText());
						
						e = tds.get(1);
						outputXml("AcctFlg", e.ownText());
		
						e = tds.get(2);
						outputXml("EstbDt", e.ownText());
		
						e = tds.get(3);
						String data = e.ownText();
						if(data.equals("--")){
							data = data.replace("--", "");
							outputXml11("CtfDepMatDt", data);
						}else if(data.equals("长期")){
							data = data.replaceAll("长期", "2199-12-31");
							outputXml("CtfDepMatDt", data);
						}else {
							outputXml("CtfDepMatDt", data);
						}
						
						if("循环贷账户".equals(leixing))
						{
							e = tds.get(4);
							outputXml("CrLmtAmt", e.ownText());
						}else{
							e = tds.get(4);
							outputXml("LoanAmt", e.ownText());
						}
						
						e = tds.get(5);
						outputXml("Ccy", e.ownText());
						
						e = tds.get(6);
						outputXml("BatchBusiType", e.ownText());
						
						e = tds.get(7);
						outputXml("GntTp", e.ownText());
						
						e = tds.get(8);
						outputXml("PymtTerm", e.ownText());
						
						e = tds.get(9);
						outputXml("PymtFrqcy", e.ownText());
						
						e = tds.get(10);
						outputXml("LoanRpymtTp", e.ownText());
						
						e = tds.get(11);
						outputXml("ComBrwFlg", e.ownText());
						
//						outputXml("\t\t\t</PD01A>");
						
							if (tds.size() > 12) {
								
//								outputXml("\t\t\t<PD01B>");
								e = tds.get(12);
								outputXml("AcctSt", e.ownText());
								
								e = tds.get(13);
								outputXml("LoanBalAmt", e.ownText());
								
								e = tds.get(14);
								outputXml("LastRepymtDt", e.ownText());
								
//								outputXml("\t\t\t</PD01B>");
							}
						
						}else if (tds.size() == 8 || tds.size() == 11) {
							
							outputXml("AcctTp", leixing);
							
							Element e = tds.get(0);
							outputXml("SprvOrgCd", e.ownText());
							
							e = tds.get(1);
							outputXml("AcctFlg", e.ownText());
			
							e = tds.get(2);
							outputXml("EstbDt", e.ownText());
			
							e = tds.get(3);
							outputXml("CrLmtAmt", e.ownText());
							
							e = tds.get(4);
							outputXml("PblcCrLmtAmt", e.ownText());
							
							e = tds.get(5);
							outputXml("Ccy", e.ownText());
							
							e = tds.get(6);
							outputXml("BatchBusiType", e.ownText());
							
							e = tds.get(7);
							outputXml("GntTp", e.ownText());
//							outputXml("\t\t\t</PD01A>");
							
								if (tds.size() > 8) {
									
//									outputXml("\t\t\t<PD01B>");
									
									e = tds.get(8);
									outputXml("AcctSt", e.ownText());
									
									e = tds.get(9);
									outputXml("LoanBalAmt", e.ownText());
									
									e = tds.get(10);
									outputXml("LastRepymtAmt", e.ownText());
									
//									outputXml("\t\t\t</PD01B>");
								}
								
						}else if (tds.size() == 7 || tds.size() == 10) {
							
							outputXml("AcctTp", leixing);
							
							Element e = tds.get(0);
							outputXml("SprvOrgCd", e.ownText());
							
							e = tds.get(1);
							outputXml("AcctFlg", e.ownText());
			
							e = tds.get(2);
							outputXml("EstbDt", e.ownText());
			
							e = tds.get(3);
							outputXml("CrLmtAmt", e.ownText());
							
							e = tds.get(4);
							outputXml("PblcCrLmtAmt", e.ownText());
							
							e = tds.get(5);
							outputXml("Ccy", e.ownText());
							
							e = tds.get(6);
							outputXml("GntTp", e.ownText());
							
							
							if (tds.size() > 7) {
								
//								outputXml("\t\t\t<PD01B>");
								
								e = tds.get(7);
								outputXml("AcctSt", e.ownText());
								
								e = tds.get(8);
								outputXml("LoanBalAmt", e.ownText());
								
								e = tds.get(9);
								outputXml("LastRepymtDt", e.ownText());
								
//								outputXml("\t\t\t</PD01B>");
							}
						}
					
					}
					
//					outputXml("\t\t</PD01>");
			//----------------------------------最新表现信息段所含数据项-------------------------------------
				
					Elements pdd = q.select("table:has(tr:matches(账户状态))");
					
					Elements pdda = q.select("table:has(tr:matches(透支180天以))");
					if (pdda != null && pdda.size() > 0) {
						Elements tds = q.getElementsByTag("td");
						
						Element e = tds.get(0);
						outputXml("AcctSt", e.ownText());
						
						e = tds.get(1);
						outputXml("AlrdUsedLmt", e.ownText());
						
						e = tds.get(2);
						outputXml("AvgOdBal", e.ownText());
						
						e = tds.get(3);
						outputXml("MaxOdBal", e.ownText());
						
						e = tds.get(4);
						outputXml("ShldRpymtDt", e.ownText());
						
						e = tds.get(5);
						outputXml("CrnMoActRepymtAmt", e.ownText());
						
						e = tds.get(6);
						outputXml("LastRepymtDt", e.ownText());

						e = tds.get(7);
						outputXml("OdOvr180Amt", e.ownText());

						
					}else{
						
						if (pdd != null && pdd.size() > 0) {
							Elements ths = q.getElementsByTag("th");
							Elements tds = q.getElementsByTag("td");
							if (ths.size() == 1) {
//								outputXml("\t\t\t<PD01B>");
								
								Element e = ths.get(0);
								outputXml("AcctSt", e.ownText());
								
//								outputXml("\t\t\t</PD01B>");
							}else if (tds.size() == 2) {
//									outputXml("\t\t\t<PD01B>");
								
									Element e = tds.get(0);
									outputXml("AcctSt", e.ownText());
									
									e = tds.get(1);
									outputXml("ClsDt", e.ownText());

//									outputXml("\t\t\t</PD01B>");
									
							}else if (tds.size() == 3) {
//									outputXml("\t\t\t<PD01B>");
									
									Element e = tds.get(0);
									outputXml("AcctSt", e.ownText());
									
									e = tds.get(1);
									outputXml("LoanBalAmt", e.ownText());
			
									e = tds.get(2);
									outputXml("LastRepymtDt", e.ownText());

//									outputXml("\t\t\t</PD01B>");
							}else if (tds.size() == 7 && (pccc==null || pccc.size()==0) && (pddd==null || pddd.size()==0) && (peee==null || peee.size()==0)) {
//								outputXml("\t\t\t<PD01B>");
								
								Element e = tds.get(0);
								outputXml("AcctSt", e.ownText());
								
								e = tds.get(1);
								outputXml("LoanBalAmt", e.ownText());

								e = tds.get(2);
								outputXml("AlrdUsedLmt", e.ownText());
								
								e = tds.get(3);
								outputXml("NoRcptBigAmtInstlBalAmt", e.ownText());
								
								e = tds.get(4);
								outputXml("RmanTerm", e.ownText());
								
								e = tds.get(5);
								outputXml("AvgUseLmt", e.ownText());
								
								e = tds.get(6);
								outputXml("AcctMaxUserLmt", e.ownText());
								
							}else if(tds.size() == 7 ){
								Element e = tds.get(0);
								outputXml("AcctSt", e.ownText());
								
								e = tds.get(1);
								outputXml("AcctLastBalAmt", e.ownText());

								e = tds.get(2);
								outputXml("AlrdUsedLmt", e.ownText());
								
								e = tds.get(3);
								outputXml("NoRcptBigAmtInstlBalAmt", e.ownText());
								
								e = tds.get(4);
								outputXml("RmanTerm", e.ownText());
								
								e = tds.get(5);
								outputXml("AvgUseLmt", e.ownText());
								
								e = tds.get(6);
								outputXml("AcctMaxUserLmt", e.ownText());
							}
							else if(tds.size() == 8 && (pccc==null || pccc.size()==0) && (pddd==null || pddd.size()==0) && (peee==null || peee.size()==0)){

//									outputXml("\t\t\t<PD01B>");
									
									Element e = tds.get(0);
									outputXml("AcctSt", e.ownText());
									
									e = tds.get(1);
									outputXml("FiveLvlClVrty", e.ownText());

									e = tds.get(2);
									outputXml("LoanBalAmt", e.ownText());

									
//									outputXml("\t\t\t</PD01B>");
								}
								
								
						}
						
						
					}
					
		Elements pis2 = q.select("table:has(tr:matches(账单日))");
		if (pis2 != null && pis2.size() > 0) {
			
			Elements tds = q.getElementsByTag("td");
			if(tds.size()==6){
				Element e = tds.get(0);
				outputXml("ShldRpymtDt", e.ownText());
				
				 e = tds.get(1);
				outputXml("CrnMoRpylAmt", e.ownText());
				
				 e = tds.get(2);
				outputXml("CrnMoActRepymtAmt", e.ownText());
				
				 e = tds.get(3);
				outputXml("AcctLastRepymtDt", e.ownText());
				
				 e = tds.get(4);
				outputXml("CrnOduePrdCnt", e.ownText());
				
				 e = tds.get(5);
				outputXml("CrnOdueAmt", e.ownText());
			}
		}	
		
		
		
		Elements pis3 = q.select("table:has(tr:matches(大额专项分期额度))");
		if (pis3 != null && pis3.size() > 0) {
			outputXml("<DbCrAcctBigAmtInstlInfAry type=\"array\">");
			outputXml("<Struct>");
			Elements tds = q.getElementsByTag("td");
			if(tds.size()==4){
				Element e = tds.get(0);
				outputXml("BigAmtInstlPymtLmt", e.ownText());
				
				 e = tds.get(1);
				outputXml("InstlLmtEfctDt", e.ownText());
				
				 e = tds.get(2);
				outputXml("InstlLmtEndDt", e.ownText());
				
				 e = tds.get(3);
				outputXml("UserInstlAmt", e.ownText());
			}
			outputXml("</Struct>");
			outputXml("</DbCrAcctBigAmtInstlInfAry>");
			
		}
		
		Elements pis4 = q.select("table:has(tr:matches(当前还款状态))");
		if (pis4 != null && pis4.size() > 0) {
			Elements tds = q.getElementsByTag("td");
			if(tds.size()==4){
				Element e = tds.get(0);
				outputXml("LoanBalAmt", e.ownText());
				
				 e = tds.get(1);
				outputXml("LastRepymtDt", e.ownText());
				
				 e = tds.get(2);
				outputXml("LastRepymtAmt", e.ownText());
				
				 e = tds.get(3);
				outputXml("PymtSt", e.ownText());
			}
			
			
			if(tds.size()==5){
				Element e = tds.get(0);
				outputXml("FiveLvlClVrty", e.ownText());
				
				e = tds.get(1);
				outputXml("LoanBalAmt", e.ownText());
				
				 e = tds.get(2);
				outputXml("LastRepymtDt", e.ownText());
				
				 e = tds.get(3);
				outputXml("LastRepymtAmt", e.ownText());
				
				 e = tds.get(4);
				outputXml("PymtSt", e.ownText());
			}
			
			
		}
		
					
			//----------------------------------最近一次月度表现信息段所含数据项--------------------------------
			Elements pis1 = q.select("table:has(tr:matches(剩余还款期数))");
			
			if (pis1 != null && pis1.size() > 0) {
					Elements tds = q.getElementsByTag("td");
				
					Element e = tds.get(0);
					outputXml("AcctLastSt", e.ownText());
					
					e = tds.get(1);
					outputXml("AcctFiveLvlClVrty", e.ownText());

					e = tds.get(2);
					outputXml("AcctLastBalAmt", e.ownText());

					e = tds.get(3);
					outputXml("RmanTerm", e.ownText());
					
					e = tds.get(4);
					outputXml("CrnMoRpylAmt", e.ownText());
					
					e = tds.get(5);
					outputXml("ShldRpymtDt", e.ownText());
					
					e = tds.get(6);
					outputXml("CrnMoActRepymtAmt", e.ownText());
					
					e = tds.get(7);
					outputXml("AcctLastRepymtDt", e.ownText());
					

			}
				Elements piss1 = q.select("table:has(tr:matches(逾期31—60天))");
				if (piss1 != null && piss1.size() > 0) {

						
				

					Elements tds1 = q.getElementsByTag("td");
					
					Element e = tds1.get(0);
						outputXml("CrnOduePrdCnt", e.ownText());
						
						e = tds1.get(1);
						outputXml("CrnOdueAmt", e.ownText());

						e = tds1.get(2);
						outputXml("Odue31To60DayUpdPnpAmt", e.ownText());

						e = tds1.get(3);
						outputXml("Odue61To90DayUpdPnpAmt", e.ownText());
						
						e = tds1.get(4);
						outputXml("Odue91To180DayUpdPnpAmt", e.ownText());
						
						e = tds1.get(5);
						outputXml("OdueOv180DayUpdPnpAmt", e.ownText());
						
						//outputXml("\t\t\t</PD01C>");
						//outputXml("\t\t</PD01>");
				

					}
				
				
				//-------------------------------
					Elements pipsss = q.select("table:has(tr:matches(的还款记录))");
					Elements px = pipsss.select("tr");
					if (px != null && px.size() > 0) {
						
//					outputXml("\t\t\t<PD01D>");
					Element element = px.get(0);
					Elements elementById = element.getElementsByTag("th");
					
					element = elementById.get(0);
					String str = element.text();
					if (str != null && str.length() > 0) {
						str = str.replace("年", "-");
	                    str = str.replace("月", "");
//	                    String startDate = str.substring(0, str.indexOf("—"));
	                    String endDate = str.substring(str.indexOf("—") + 1, str
	                            .indexOf("—") + 8);
	                    outputXml("EndDt", endDate);
	                }
					
					int m = 0;
					String startDate = "";
					outputXml("<DbCrAcctPymtStInfAry type=\"array\">");
					for (int j = 2; j < px.size(); j+=2) {
						if(m == 24){
							break;
						}
						Element e1 = px.get(j);
						Elements ths1 = e1.getElementsByTag("th");
						Elements tds1 = e1.getElementsByTag("td");
						
						int n = 12;
						//outputXml("<DbCrAcctPymtStInfAry>");
						for(int k = tds1.size()-1;k>=0;k--){
							if(m == 24){
								break;
							}
							if("".equals(tds1.get(k).text())){
								n--;
								continue;
							}else{
								
								
								outputXml("<Struct>");
								startDate =  ths1.text()+"-"+n;
								outputXml5("RpymtDt", startDate);
								outputXml5("RpymtFlg", tds1.get(k).text());
								outputXml("</Struct>");
								
								n--;
								m++;
							}
						}
						//outputXml("</DbCrAcctPymtStInfAry>");
					}
					outputXml("</DbCrAcctPymtStInfAry>");
					outputXml("StrtDt", startDate);
					
					
					//outputXml("\t\t\t</PD01D>");
				}
				
					
					Elements pipdss = q.select("table:has(tr:matches(的还款记录))");
					
					if (pipdss != null && pipdss.size() > 0) {
						
					//outputXml("\t\t\t<PD01E>");
					
					Element element = px.get(0);
					Elements elementById = element.getElementsByTag("th");
					
					element = elementById.get(0);
					String str = element.text();
					if (str != null && str.length() > 0) {
						 str = str.replace("年", "-");
	                     str = str.replace("月", "");
	                    String endDate = str.substring(str.indexOf("—") + 1, str
	                            .indexOf("—") + 8);
	                    outputXml("HistrExprsEndDt", endDate);
	                }
					int m = 0;
					String startDate = "";
					outputXml("<DbCrAcctHistrInfAry type=\"array\">");
					for (int j = 2; j < px.size(); j+=2) {
						if(m == 60){
							break;
						}
						Element e1 = px.get(j);
						Element e2 = px.get(j+1);
						Elements ths1 = e1.getElementsByTag("th");
						Elements tds1 = e1.getElementsByTag("td");
						Elements tds2 = e2.getElementsByTag("td");
						
						int n = 12;
						//outputXml("<DbCrAcctHistrInfAry>");
						for(int k = tds2.size()-1;k>=0;k--){
							if(m == 60){
								break;
							}
							if("".equals(tds2.get(k).text())){
								n--;
								continue;
							}else{
								outputXml("<Struct>");
								startDate =  ths1.text()+"-"+n;
								outputXml5("HistrExprsRpyDt", startDate);
								outputXml5("HistrExprsRpySt", tds1.get(k).text());
								outputXml5("HistrExprsOdueAmt", tds2.get(k).text());
								outputXml("</Struct>");
								n--;
								m++;
							}
						}
						//outputXml("</DbCrAcctHistrInfAry>");
					}
					outputXml("</DbCrAcctHistrInfAry>");
					outputXml("HistrExprsStrtDt", startDate);
					outputXml("<HistrExprsMoNum>"+m+"</HistrExprsMoNum>");
					//outputXml("\t\t\t</PD01E>");
				}	
					
					
					
				Elements pissss = q.select("table:has(tr:matches(特殊交易类型))");
				Elements pi = pissss.select("tr:not(tr:contains(特殊交易类型))");
				if (pi != null && pi.size() > 0) {
					
					//outputXml("\t\t\t<PD01F>");
					
					
					String msg = "";

					msg = "<SpclTxnNum>";
					msg += pi.size();
					msg += "</SpclTxnNum>";
					outputXml(msg);
					
					
					outputXml("<DbCrAcctSpclInfAry type=\"array\">");
					for (int j = 0; j < pi.size(); j++) {
						
					
					outputXml("<Struct>");
					
					
					Element e1 = pi.get(j);
					Elements tds1 = e1.getElementsByTag("td");

					e1 = tds1.get(0);
					outputXml5("TranTpVal", e1.text());
					
					e1 = tds1.get(1);
					outputXml5("TranOcrDt", e1.text());

					e1 = tds1.get(2);
					outputXml5("LnChngMonNum", e1.text());
					
					e1 = tds1.get(3);
					outputXml5("LnTxnOcrAmt", e1.text());

					e1 = tds1.get(4);
					outputXml5("LnDtlDsc", e1.text());
					
					outputXml("</Struct>");
					
				}
					outputXml("</DbCrAcctSpclInfAry>");
				}
				
				
					
				}
				outputXml("</Struct>");
				//outputXml("</DbCrAcctInfAry>");
			}
		}
		
		
		
		/**
		 * (一)
		 */
		private void allDetails() {
			Elements pis = doc.select("table:has(tr:contains(债权转移时的还款状态)),table:has(tr:contains(债权转移时的还款状态))+table:has(tr:contains(账户状态)),table:has(tr:matches(债权转移时的还款状态))+table:has(tr:matches(账户状态))+table:has(tr:matches(特殊交易类型))");
			
//			Elements divs = doc.select("table:has(tr:contains(债权转移时的还款状态))+div,table:has(tr:contains(债权转移时的还款状态))+table:has(tr:contains(账户状态))+div,table:has(tr:matches(债权转移时的还款状态))+table:has(tr:matches(账户状态))+table:has(tr:matches(特殊交易类型))+div");
//			Elements aaaElements = doc.previousElementSibling().select("table:has(tr:contains(债权转移时的还款状态))");
//			System.out.println(aaaElements);
//			int n = 0;
			if (pis != null && pis.size() > 0) {
				//outputXml("<DbCrAcctInfAry>");
				for (int i = 0; i < pis.size() ; i++) {
//					outputXml("\t\t<Struct>");
					Element e = pis.get(i);
					Elements piss = e.select("table:has(tr:matches(债权转移时的还款状态))");
					if (piss != null && piss.size() > 0) {
						
						if(i != 0){
							outputXml("</Struct>");
						}
						outputXml("<Struct>");	
					
					Elements tds = e.getElementsByTag("td");
					
					
					outputXml("AcctTp", "被追偿信息");
					
					e = tds.get(0);
					outputXml("SprvOrgCd", e.ownText());
					
					e = tds.get(1);
					outputXml("BatchBusiType", e.ownText());

					e = tds.get(2);
					outputXml("EstbDt", e.ownText());

					e = tds.get(3);
					outputXml("LoanAmt", e.ownText());
					
					e = tds.get(4);
					outputXml("CrrghtIntoPymtSt", e.ownText());

//					outputXml("\t\t\t</PD01A>");
//					n++;
					}
					Elements pisss = e.select("table:has(tr:matches(账户状态))");
					
					if (pisss != null && pisss.size() > 0) {
				
//					outputXml("\t\t\t<PD01B>");
					
					
					Elements tds1 = e.getElementsByTag("td");

					e = tds1.get(0);
					outputXml("AcctSt", e.ownText());
					
					e = tds1.get(1);
					outputXml("LoanBalAmt", e.ownText());

					if (tds1.size() == 3) {
						e = tds1.get(2);
						outputXml("LastRepymtDt", e.ownText());
					}
					
					
//					outputXml("\t\t\t</PD01B>");
					
					}
					
					
					
					Elements pissss = e.select("table:has(tr:matches(特殊交易类型))");
					Elements pi = pissss.select("tr:not(tr:contains(特殊交易类型))");
					if (pi != null && pi.size() > 0) {
						
//						outputXml("\t\t\t<PD01F>");
						
						
						String msg = "";

						msg = "<SpclTxnNum>";
						msg += pi.size();
						msg += "</SpclTxnNum>";
						outputXml(msg);
						
						
						outputXml("<DbCrAcctSpclInfAry>");
						for (int j = 0; j < pi.size(); j++) {
							
						
						
						outputXml("<Struct>");
						
						
						Element e1 = pi.get(j);
						Elements tds1 = e1.getElementsByTag("td");

						e1 = tds1.get(0);
						outputXml5("TranTpVal", e1.text());
						
						e1 = tds1.get(1);
						outputXml5("TranOcrDt", e1.text());

						e1 = tds1.get(2);
						outputXml5("LnChngMonNum", e1.text());
						
						e1 = tds1.get(3);
						outputXml5("LnTxnOcrAmt", e1.text());

						e1 = tds1.get(4);
						outputXml5("LnDtlDsc", e1.text());
						outputXml("</Struct>");
						
						
					}
						outputXml("</DbCrAcctSpclInfAry>");
					}
				}
				outputXml("</Struct>");
			}
		}

		/**
		 * （八）授信协议信息
		 */
		public void creditAgreement() {
			Elements pis = doc.select("table:has(tr:matches(授信限额编号))");
			if (pis.size() > 0) {
				outputXml("<CrAgrmtInfAry type=\"array\">");
	            for (Element e : pis) {
	            	outputXml("<Struct>");
		    		Elements tds = e.select("td");// 获取身份信息里面的有效td
		    		if (tds != null && tds.size() > 0) {
		    				
		    				//outputXml("\t\t<PD02>");
		    				//outputXml("\t\t\t<PD02A>");
		    				
		    				e = tds.get(0);
		                    outputXml("SprvOrgCd", e.ownText());
		
		                    e = tds.get(1);
		                    outputXml("CrAgrmtFlg", e.ownText());
		
		                    e = tds.get(2);
		                    outputXml("EffDt", e.ownText());
		                    
		                    e = tds.get(3);
		                    outputXml("ExpDt", e.ownText());
		                    
		                    e = tds.get(4);
		                    outputXml("CrLmtUsgDsc", e.ownText());
		                    
		                    e = tds.get(5);
		                    outputXml("CrLmtAmt", e.ownText());
		                    
		                    e = tds.get(6);
		                    outputXml("CrLmt", e.ownText());
		                    
		                    e = tds.get(7);
		                    outputXml("CrLmtId", e.ownText());
		                    
		                    e = tds.get(8);
		                    outputXml("AlrdUsedLmt", e.ownText());
		                    
		                    e = tds.get(9);
		                    outputXml("Ccy", e.ownText());
		                    
		                    //outputXml("\t\t\t</PD02A>");
		                    //outputXml("\t\t</PD02>");
		    			
		    		}
		    		outputXml("</Struct>");
	            }
	            outputXml("</CrAgrmtInfAry>");
	        }
		}

		
		
		
		
		/**
		 * （七）相关还款责任信息
		 */
		public void relatedRepayment() {
					
			Elements pis = doc.select("table:has(th:matches(^保证合同编号$))");
			Elements pis1 = doc.select("table:has(th:matches(^还款状态$))");
			Elements pis2 = doc.select("table:has(th:matches(^逾期月数$))");
			outputXml("<RlvRpymtInfAry type=\"array\">");
			if (pis1 != null && pis1.size() > 0) {
				for (int i = 0; i < pis1.size() ; i++) {
					outputXml("<Struct>");
					
					outputXml("BrwIdentTp", "自然人");
					
					Element e = pis.get(i);
					Elements tds = e.getElementsByTag("td");

					e = tds.get(0);
					outputXml("SprvOrgCd", e.ownText());
					
					e = tds.get(1);
					outputXml("BsnTp", e.ownText());

					e = tds.get(2);
					outputXml("EstbDt", e.ownText());
					
					e = tds.get(3);
					outputXml("EndDt", e.ownText());

					e = tds.get(4);
					outputXml("RlvRpymtTp", e.ownText());

					e = tds.get(5);
					outputXml("RlvRpymtAmt", e.ownText());
					
					e = tds.get(6);
					outputXml("Ccy", e.ownText());

					e = tds.get(7);
					outputXml("RlvRpymtGntCtrNo", e.ownText());
				
					Element e1 = pis1.get(i);
					Elements tds1 = e1.getElementsByTag("td");
					Elements ths1 = e1.getElementsByTag("th");
					
					e1 = tds1.get(0);
					outputXml("RlvRpymtBalAmt", e1.text());

					e1 = tds1.get(1);
					outputXml("RlvRpymtFiveLvlClVrty", e1.text());
					
					e1 = tds1.get(2);
					outputXml("RlvRpymtSt", e1.text());
					
					e1 = ths1.get(0);
					outputXml("InfReportDt", e1.text());
					
					outputXml("</Struct>");

				}
			}
				if (pis2 != null && pis2.size() > 0) {
					int y = 0;
					for (int i = pis1.size(); i < pis.size() ; i++) {
						outputXml("<Struct>");
						
						outputXml("BrwIdentTp", "组织机构");
						Element e = pis.get(i);
						Elements tds = e.getElementsByTag("td");

						e = tds.get(0);
						outputXml("SprvOrgCd", e.ownText());
						
						e = tds.get(1);
						outputXml("BsnTp", e.ownText());

						e = tds.get(2);
						outputXml("EstbDt", e.ownText());
						
						e = tds.get(3);
						outputXml("EndDt", e.ownText());

						e = tds.get(4);
						outputXml("RlvRpymtTp", e.ownText());

						e = tds.get(5);
						outputXml("RlvRpymtAmt", e.ownText());
						
						e = tds.get(6);
						outputXml("Ccy", e.ownText());

						e = tds.get(7);
						outputXml("RlvRpymtGntCtrNo", e.ownText());
									
						Element e1 = pis2.get(y);
						y++;
						Elements tds1 = e1.getElementsByTag("td");
						Elements ths1 = e1.getElementsByTag("th");
						
						e1 = tds1.get(0);
						outputXml("RlvRpymtBalAmt", e1.text());

						e1 = tds1.get(1);
						outputXml("RlvRpymtFiveLvlClVrty", e1.text());
						
						
						e1 = tds1.get(2);
						outputXml("RlvRpymtOdMonNum", e1.text());
						
						e1 = ths1.get(0);
						outputXml("InfReportDt", e1.text());
						
						outputXml("</Struct>");

					}
				}
				outputXml("</RlvRpymtInfAry>");
				
		}
		
		
		
		
		
		
		/**
		 * 四 非信贷交易信息明细
		 */
		public void addNotCreditDetailStart() {
			Elements infoSummary = doc
					.select("div:matches( 非信贷交易信息明细$)");// 判断个人信用报告中是否存在公共信息明细
			if (infoSummary.size() > 0) {
				postpaidRecord(); //后付费记录
				
			}
		}
		
		
		
		/**
		 * 后付费记录
		 */
		private void postpaidRecord() {
			Elements pitdss = doc.select("table:has(tr:matches(当前欠费金额)),table:has(tr:matches(当前欠费金额))+table:has(tr:matches(的缴费记录))");
			outputXml("<AfPymtBsnInfAry type=\"array\">");
			for(int i =0;i<pitdss.size();i++){
				Element e = pitdss.get(i);
				if(String.valueOf(e).contains("当前欠费金额")){
						if(i != 0){
							//outputXml("\t\t\t</PE01A>");
							outputXml("</Struct>");
						}
						outputXml("<Struct>");
						//outputXml("\t\t\t<PE01A>");
					
						Elements tds = e.getElementsByTag("td");
						outputXml("<AfPymtAcctTp></AfPymtAcctTp>");
						e = tds.get(0);
						outputXml("AfPymtBsnOrgNm", e.ownText());

						e = tds.get(1);
						outputXml("AfPymtBsnTp", e.ownText());

						e = tds.get(2);
						outputXml("AfPymtBsnOpenDate", e.ownText());
						
						e = tds.get(3);
						outputXml("AfPymtBsnCrntPymtSt", e.ownText());

						e = tds.get(4);
						outputXml("AfPymtBsnArAmt", e.ownText());
						
						e = tds.get(5);
						outputXml("AfPymtBsnAcgDt", e.ownText());
				}else if(String.valueOf(e).contains("的缴费记录")){
					Elements tds1 = e.select("td");
					outputXml("AfPymtBsnPymtRcd", tds1.text());
					
				}
			}
				//outputXml("\t\t\t</PE01A>");
				outputXml("</Struct>");
				outputXml("</AfPymtBsnInfAry>");
		}
		/**
		 * 五 公共信息明细
		 */
		public void addPublicInformation() {
			Elements infoSummary = doc
					.select("div:matches( 公共信息明细$)");// 判断个人信用报告中是否存在公共信息明细
			if (infoSummary.size() > 0) {
				taxArrearsRecord();  		//（一）欠税记录 
				civilJudgement();   		//（二）民事判决记录
				enforcement();    			//（三）强制执行记录
				administrativeSanction();   //（四）行政处罚记录    
				accumulationFund();			//（五）住房公积金参缴记录
				subsistenceAllowance();  	//（六）低保救助记录
				practisingQualification();  //（七）执业资格记录
				administrativeReward();     //（八）行政奖励记录
			}
		}
		
		
		/**
		 * 六 机构说明
		 */
		public void InstitutionalDescription() {
			Elements infoSummary = doc.select("div:matches( 机构说明$)+table");// 判断个人信用报告中是否存在机构说明
			Elements pitds = infoSummary.select("tr:not(tr:contains(编号))");
			outputXml("<AnntonDclSmryMsgAry type=\"array\">");
				
			if (pitds != null && pitds.size() > 0) {
				outputXml("<Struct>");
				outputXml("<AnntonDclNum>"+pitds.size()+"</AnntonDclNum>");
				for (int i = 0; i < pitds.size(); i++) {
					outputXml("<Struct>");
					Element e = pitds.get(i);
	                Elements tds = e.getElementsByTag("td");
					
	                outputXml("AnntonDclTp", "机构说明");
	                
	                e = tds.get(1);
	                outputXml("AnntonDclDsc", e.ownText());

	                e = tds.get(2);
	                outputXml("AddDt", e.ownText());

	                outputXml("</Struct>");
				}
				 outputXml("</Struct>");
			}
			Elements infoSummaZX = doc.select("div:matches( 征信中心说明$)+table");// 判断个人信用报告中是否存在机构说明
			Elements pitdsS = infoSummaZX.select("tr:not(tr:contains(编号))");
			if (pitdsS != null && pitdsS.size() > 0) {
				outputXml("<Struct>");
				outputXml("<AnntonDclNum>"+pitdsS.size()+"</AnntonDclNum>");
				for (int i = 0; i < pitdsS.size(); i++) {
					outputXml("<Struct>");
					Element e = pitdsS.get(i);
		            Elements tds = e.getElementsByTag("td");
					
		            outputXml("AnntonDclTp", "征信中心说明");
		            
		            e = tds.get(1);
		            outputXml("AnntonDclDsc", e.ownText());
		
		            e = tds.get(2);
		            outputXml("AddDt", e.ownText());
		
		            outputXml("</Struct>");
				}
				outputXml("</Struct>");
			}
			Elements infoSummayy = doc.select("div:matches( 异议标注$)+table");// 判断个人信用报告中是否存在异议标注
			Elements pitdss = infoSummayy.select("tr:not(tr:contains(编号))");
			if (pitdss != null && pitdss.size() > 0) {
				outputXml("<Struct>");
				outputXml("<AnntonDclNum>"+pitdss.size()+"</AnntonDclNum>");
				for (int i = 0; i < pitdss.size(); i++) {
					outputXml("<Struct>");
					Element e = pitdss.get(i);
		            Elements tds = e.getElementsByTag("td");
					
		            outputXml("AnntonDclTp", "异议标注");
		            
		            e = tds.get(1);
		            outputXml("AnntonDclDsc", e.ownText());
		
		            e = tds.get(2);
		            outputXml("AddDt", e.ownText());
		
		            outputXml("</Struct>");
				}
				outputXml("</Struct>");
			}
			
			outputXml("</AnntonDclSmryMsgAry>");
			//System.out.println(infoSummary);
		}
		
		

		/**
		 * （一）欠税记录 
		 */
		private void taxArrearsRecord() {
			Elements pis = doc.select("div:matches(..欠税记录$)+table");
			Elements pitds = pis.select("tr:not(tr:contains(编号))");
			if (pitds != null && pitds.size() > 0) {
				outputXml("<OweTaxRcrdInfAry type=\"array\">");
				for (int i = 0; i < pitds.size(); i++) {
					outputXml("<Struct>");
					Element e = pitds.get(i);
	                Elements tds = e.getElementsByTag("td");
					
	                e = tds.get(1);
	                outputXml("TaxOrgNm", e.ownText());

	                e = tds.get(2);
	                outputXml("OweTaxAmt", e.ownText());

	                e = tds.get(3);
	                outputXml("OweTaxStatsDt", e.ownText());
	                
	                outputXml("</Struct>");
				}
				outputXml("</OweTaxRcrdInfAry>");
			}
		}
		
		/**
		 * （二）民事判决记录
		 */
		private void civilJudgement() {
			Elements pis = doc.select("div:matches(..民事判决记录$)+table");// 获取职业信息html片段
			Elements pitds = pis.select("tr:not(tr:contains(编号))");// 获取职业信息里面的有效tr
			Elements pis1 = doc.select("div:matches(..民事判决记录$)+table+table");
			Elements pitds1 = pis1.select("tr:not(tr:contains(编号))");
			
			if (pitds != null && pitds.size() > 0  &&  pitds1 != null && pitds1.size() > 0) {
				outputXml("<CivilJudgeInfAry type=\"array\">");
				for (int i = 0; i < pitds.size() ; i++) {
					outputXml("<Struct>");
					//outputXml("\t\t\t<PF02A>");
					
					Element e = pitds.get(i);
					Elements tds = e.getElementsByTag("td");

					e = tds.get(1);
					outputXml("RgstCourt", e.ownText());

					e = tds.get(2);
					outputXml("CaseReason", e.ownText());
					
					e = tds.get(3);
					outputXml("CvlJdgRgstDt", e.ownText());

					e = tds.get(4);
					outputXml("ClsCaseTp", e.ownText());

				
					Element e1 = pitds1.get(i);
					Elements tds1 = e1.getElementsByTag("td");

					e1 = tds1.get(1);
					outputXml("CaseResult", e1.text());

					e1 = tds1.get(2);
					outputXml("CaseEfctvDt", e1.text());
					
					e1 = tds1.get(3);
					outputXml("SuitObject", e1.text());

					e1 = tds1.get(4);
					outputXml("SuitObjAmt", e1.text());
						
					//outputXml("\t\t\t</PF02A>");
					outputXml("</Struct>");

					

				}
				outputXml("</CivilJudgeInfAry>");
			}
		}
		
		
		/**
		 * （三）强制执行记录
		 */
		private void enforcement() {
			Elements pis = doc.select("div:matches(..强制执行记录$)+table");// 获取职业信息html片段
			Elements pitds = pis.select("tr:not(tr:contains(编号))");// 获取职业信息里面的有效tr
			Elements pis1 = doc.select("div:matches(..强制执行记录$)+table+table");
			Elements pitds1 = pis1.select("tr:not(tr:contains(编号))");
			
			if (pitds != null && pitds.size() > 0  &&  pitds1 != null && pitds1.size() > 0) {
				outputXml("<FrceExcsInfAry type=\"array\">");
				for (int i = 0; i < pitds.size() ; i++) {
					outputXml("<Struct>");
					//outputXml("\t\t\t<PF03A>");
					
					Element e = pitds.get(i);
					Elements tds = e.getElementsByTag("td");

					e = tds.get(1);
					outputXml("ExcsCourt", e.ownText());

					e = tds.get(2);
					outputXml("ExcsCaseRsn", e.ownText());
					
					e = tds.get(3);
					outputXml("RgstDate", e.ownText());

					e = tds.get(4);
					outputXml("ExcsMdDsc", e.ownText());

				
					Element e1 = pitds1.get(i);
					Elements tds1 = e1.getElementsByTag("td");

					e1 = tds1.get(1);
					outputXml("CaseStDsc", e1.text());

					e1 = tds1.get(2);
					outputXml("ClsCaseDt", e1.text());
					
					e1 = tds1.get(3);
					outputXml("AppExcsObj", e1.text());

					e1 = tds1.get(4);
					outputXml("AppExcsObjAmt", e1.text());
					
					e1 = tds1.get(5);
					outputXml("AlrdExcsObj", e1.text());

					e1 = tds1.get(6);
					outputXml("AlrdExcsObjAmt", e1.text());
						
					//outputXml("\t\t\t</PF03A>");
					outputXml("</Struct>");

				}
				outputXml("</FrceExcsInfAry>");
			}
		}
		
		
		/**
		 * （四）行政处罚记录    
		 */
		private void administrativeSanction() {
			Elements pis = doc.select("div:matches(..行政处罚记录$)+table");
			Elements pitds = pis.select("tr:not(tr:contains(编号))");
			if (pitds != null && pitds.size() > 0) {
				outputXml("<AdminPnlInfAry type=\"array\">");
				for (int i = 0; i < pitds.size(); i++) {
					
					outputXml("<Struct>");
					//outputXml("\t\t\t<PF04A>");
					
					Element e = pitds.get(i);
	                Elements tds = e.getElementsByTag("td");
					
	                e = tds.get(1);
	                outputXml("PenaltyOrg", e.ownText());

	                e = tds.get(2);
	                outputXml("PenaltyCntnt", e.ownText());

	                e = tds.get(3);
	                outputXml("PnshAmt", e.ownText());
	                
	                e = tds.get(4);
	                outputXml("EffDt", e.ownText());
	                
	                e = tds.get(5);
	                outputXml("EndDt", e.ownText());
	                
	                e = tds.get(6);
	                outputXml("ReconsiderRslt", e.ownText());
	                
	                //outputXml("\t\t\t</PF04A>");
	                
	                outputXml("</Struct>");
				}
				outputXml("</AdminPnlInfAry>");
			}
			
		}
		
		
		/**
		 * （五）住房公积金参缴记录
		 */
		private void accumulationFund() {
			Elements pis = doc.select("table:has(tr:matches(参缴地))");
			if (pis.size() > 0) {
				outputXml("<HoFndPymtInfAry type=\"array\">");
	            for (Element e : pis) {
	    		
		    		Elements tds = e.select("td");// 获取身份信息里面的有效td
		    		if (tds != null && tds.size() > 0) {
		    				
		    				outputXml("<Struct>");
		    				//outputXml("\t\t\t<PF05A>");
		    				
		    				e = tds.get(0);
		                    outputXml("PymtRegion", e.ownText());
		
		                    e = tds.get(1);
		                    outputXml("PymtDate", e.ownText());
		
		                    e = tds.get(2);
		                    outputXml("FrstPymtMon", e.ownText());
		                    
		                    e = tds.get(3);
		                    outputXml("EndMon", e.ownText());
		                    
		                    e = tds.get(4);
		                    outputXml("HoFndPymtSt", e.ownText());
		                    
		                    e = tds.get(5);
		                    outputXml("PerMonPymtAmt", e.ownText());
		                    
		                    e = tds.get(6);
		                    outputXml("PrsnlPymtRt", e.ownText());
		                    
		                    e = tds.get(7);
		                    outputXml("CoPymtRt", e.ownText());
		                    
		                    e = tds.get(8);
		                    outputXml("HoFndPymtCoNm", e.ownText());
		                    
		                    e = tds.get(9);
		                    outputXml("HoFndUpdDt", e.ownText());
		                    
		                    //outputXml("\t\t\t</PF05A>");
		                    outputXml("</Struct>");
		    			
		    		}
	            }
	            outputXml("</HoFndPymtInfAry>");
	        }
		}
		
		
		
		/**
		 * （六）低保救助记录
		 */
		private void subsistenceAllowance() {
			Elements pis = doc.select("div:matches(..低保救助记录$)+table");
			Elements pitds = pis.select("tr:not(tr:contains(编号))");
			if (pitds != null && pitds.size() > 0) {
				 
				outputXml("<SalvInfAry type=\"array\">");
				
				for (int i = 0; i < pitds.size(); i++) {
					
					outputXml("<Struct>");
					// outputXml("\t\t\t<PF06A>");
					 
					Element e = pitds.get(i);
	                Elements tds = e.getElementsByTag("td");
					
	                e = tds.get(1);
	                outputXml("PrsnlTpVal", e.ownText());

	                e = tds.get(2);
	                outputXml("Location", e.ownText());

	                e = tds.get(3);
	                outputXml("WorkCoNm", e.ownText());
	                
	                e = tds.get(4);
	                outputXml("HomeMonIncm", e.ownText());
	                
	                e = tds.get(5);
	                outputXml("ApplyDate", e.ownText());
	                
	                e = tds.get(6);
	                outputXml("PassDate", e.ownText());
	                
	                e = tds.get(7);
	                outputXml("SalvUpdDt", e.ownText());
	                
	               // outputXml("\t\t\t</PF06A>");
	                outputXml("</Struct>");
				}
				outputXml("</SalvInfAry>");
			}
		}
		
		
		
		/**
		 * （七）执业资格记录
		 */
		private void practisingQualification() {
			Elements pis = doc.select("div:matches(..执业资格记录$)+table");
			Elements pitds = pis.select("tr:not(tr:contains(编号))");
			if (pitds != null && pitds.size() > 0) {
				 
				outputXml("<OprtQualInfAry type=\"array\">");
				
				for (int i = 0; i < pitds.size(); i++) {
					
					outputXml("<Struct>");
					//outputXml("\t\t\t<PF07A>");
					 
					Element e = pitds.get(i);
	                Elements tds = e.getElementsByTag("td");
					
	                e = tds.get(1);
	                outputXml("OprtQualNm", e.ownText());

	                e = tds.get(2);
	                outputXml("OprtQualLvlDsc", e.ownText());

	                e = tds.get(3);
	                outputXml("AuthDate", e.ownText());
	                
	                e = tds.get(4);
	                outputXml("IdInvldDt", e.ownText());
	                
	                e = tds.get(5);
	                outputXml("RevokeDate", e.ownText());
	                
	                e = tds.get(6);
	                outputXml("IssuOrgNm", e.ownText());
	                
	                e = tds.get(7);
	                outputXml("InstAdr", e.ownText());
	                
	                //outputXml("\t\t\t</PF07A>");
	                outputXml("</Struct>");
				}
				outputXml("</OprtQualInfAry>");
			}
			
		}

		
		
		/**
		 * （八）行政奖励记录
		 */
		private void administrativeReward() {
			Elements pis = doc.select("div:matches(..行政奖励记录$)+table");
			Elements pitds = pis.select("tr:not(tr:contains(编号))");
			if (pitds != null && pitds.size() > 0) {
				 
				outputXml("<AwrdRcrdInfAry type=\"array\">");
				
				for (int i = 0; i < pitds.size(); i++) {
					
					outputXml("<Struct>");
					//outputXml("\t\t\t<PF08A>");
					 
					Element e = pitds.get(i);
	                Elements tds = e.getElementsByTag("td");
					
	                e = tds.get(1);
	                outputXml("AwardOrg", e.ownText());

	                e = tds.get(2);
	                outputXml("AwardCntnt", e.ownText());

	                e = tds.get(3);
	                outputXml("AwrdEfctvDt", e.ownText());
	                
	                e = tds.get(4);
	                outputXml("AwrdEndDt", e.ownText());
	                
	                //outputXml("\t\t\t</PF08A>");
	                outputXml("</Struct>");
				}
				outputXml("</AwrdRcrdInfAry>");
			}
			
		}
		
		
		/**
		 *  六 查询记录
		 */
		public void addQueryRecordStart() {
			Elements queryRecord = doc
					.select("div:matches( 查询记录$)");// 判断个人信用报告中是否存在公共信息明细
			if (queryRecord.size() > 0) {
				unitquery();  //机构查询记录明细
				//ownQuery();   //本人查询记录明细
			}
		}
		
		
		
		/**
		 *  异议标注
		 */
		public void yiyibiaozhu() {
			Elements queryRecord = doc.select("div:matches( 异议标注$)");// 判断个人信用报告中是否存在异议标注
			if (queryRecord.size() > 0) {
				Elements pis = doc.select("div:matches( 异议标注$)+table");
				Elements pitds = pis.select("tr:not(tr:contains(编号))");
				if (pitds != null && pitds.size() > 0) {
					outputXml("<AnntonDclInfAry type=\"array\">");
					outputXml("<Struct>");
					outputXml("<AnntonDclNum>"+pitds.size()+"</AnntonDclNum>");
					outputXml("<AnntonDclSmryMsgAry type=\"array\">");
					
					for (int i = 0; i < pitds.size(); i++) {
						
						outputXml("<Struct>");
						 
						Element e = pitds.get(i);
		                Elements tds = e.getElementsByTag("td");
		                outputXml("AnntonDclTp", "异议标注");
		                e = tds.get(1);
		                outputXml3("AnntonDclDsc", e.ownText());

		                e = tds.get(2);
		                outputXml3("AddDt", e.ownText());

		                outputXml("</Struct>");
					}
					outputXml("</AnntonDclSmryMsgAry>");
					outputXml("</Struct>");
					outputXml("</AnntonDclInfAry>");
				}
			}
		}

		/**
		 * 机构查询记录明细
		 */
		private void unitquery() {
			Elements pis = doc.select("div:matches( 查询记录$)+table");
			Elements pitds = pis.select("tr:not(tr:contains(编号))");
			if (pitds != null && pitds.size() > 0) {
				 
				outputXml("<LoanQryRcrdInfAry type=\"array\">");
				
				for (int i = 0; i < pitds.size(); i++) {
					
					outputXml("<Struct>");
					 
					Element e = pitds.get(i);
	                Elements tds = e.getElementsByTag("td");
					
	                e = tds.get(1);
	                outputXml3("QryDt", e.ownText());

	                e = tds.get(2);
	                outputXml3("EqrOrgId", e.ownText());

	                e = tds.get(3);
	                outputXml3("QryRsn", e.ownText());
	                
	                outputXml("</Struct>");
				}
				outputXml("</LoanQryRcrdInfAry>");
			}
			
		}

		
		
		/**
		 * //本人查询记录明细
		 */
//		private void ownQuery() {
//			Elements pis = doc.select("div:matches(^本人查询记录明细$)+table");
//			Elements pitds = pis.select("tr:not(tr:contains(编号))");
//			if (pitds != null && pitds.size() > 0) {
//				 
//				outputXml("\t<QPPOQ>");
//				
//				for (int i = 0; i < pitds.size(); i++) {
//					
//					outputXml("\t\t<PH01>");
//					 
//					Element e = pitds.get(i);
//	                Elements tds = e.getElementsByTag("td");
//					
//	                e = tds.get(1);
//	                outputXml3("PH010R01", e.ownText());
	//
//	                e = tds.get(2);
//	                outputXml3("PH010Q02", e.ownText());
	//
//	                e = tds.get(3);
//	                outputXml3("PH010Q03", e.ownText());
//	                
//	                outputXml("\t\t</PH01>");
//				}
//				outputXml("\t</QPPOQ>");
//			}
//			
//		}
		
		
		/**
		 * 关闭流
		 * 
		 * @return boolean
		 */
		public boolean close() {
			if (output != null)
				output.close();
			return true;

		}

		
		
		public static void main(String[] args) {
			
			String ending = "UTF-8";
			HtmlToXml hx = null;
			 String output =null;
			try {
				 String input = "C:\\Users\\Administrator\\Desktop\\20201204\\wxr.html";
			     output = "C:\\Users\\Administrator\\Desktop\\20201204\\wxr.xml";
			     hx = new HtmlToXml(input, output, ending);
			     
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	        // String dateStr = sdf.format(new Date());
	        // File file = new File("C:/work/home/personout.xml");
	        // PbocSummary bulidPbocSummary =
	        // BuildPbocSummary.bulidPbocSummary(file,
	        // dateStr);
	        // System.out.println(bulidPbocSummary);
//	        String ending = "GBK";
//	        String input = "C:/work/home/4.html";
//	        String output = "C:/work/home/4.xml";
//	        StringBuffer sbf = new StringBuffer();
//	        HTML2XML hx = new HTML2XML(input, output, ending);

//	        hx.outputXml("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	        hx.outputXml("<ReportInf type=\"array\">");
	        hx.outputXml("<Struct>");
	        // 个人信用报告头部及摘要
	        hx.getHeader();

	        // 一 个人基本信息
	        hx.addPersonalInfoStart();

	        // 二 信息概要
	        hx.addInfoSummaryStart();

	        // 三 信贷交易信息明细
	        hx.addCreditDetailStart();

	        // 四 非信贷交易信息明细
	        hx.addNotCreditDetailStart();
	        
	        // 五 公共信息明细
	        hx.addPublicInformation();
	        //hx.InstitutionalDescription();
	        //异议标注
	        hx.yiyibiaozhu();
	        // 六 查询记录
	        hx.addQueryRecordStart();

	        hx.outputXml("</Struct>");
	        hx.outputXml("</ReportInf>");
		   System.out.println(XmlFileToStr(output));
			hx.close();
			
			
	      
		}
		 public static String XmlFileToStr(String path){
			 	String xmlString = "";
				byte[] strBuffer = null;
				InputStream in = null;
				int flen = 0;
				File xmlfile = new File(path);
				try {
				in = new FileInputStream(xmlfile);
				flen = (int)xmlfile.length();
				strBuffer = new byte[flen];
				in.read(strBuffer, 0, flen);
				in.close();
				} catch (FileNotFoundException e) {
				e.printStackTrace();
				} catch (IOException e) {
				e.printStackTrace();
				} 
				xmlString = new String(strBuffer); //构建String时，可用byte[]类型，
				return xmlString.replaceAll("\r", "").replaceAll("\n", "");

		 }
	}


