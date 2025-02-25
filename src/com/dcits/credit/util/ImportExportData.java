package com.dcits.credit.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.openxml4j.opc.PackageAccess;
import org.apache.poi.util.SAXHelper;
import org.apache.poi.xssf.eventusermodel.ReadOnlySharedStringsTable;
import org.apache.poi.xssf.eventusermodel.XSSFReader;
import org.apache.poi.xssf.eventusermodel.XSSFSheetXMLHandler;
import org.apache.poi.xssf.eventusermodel.XSSFSheetXMLHandler.SheetContentsHandler;
import org.apache.poi.xssf.model.StylesTable;
import org.apache.poi.xssf.usermodel.XSSFComment;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

import com.dcits.credit.service.creditReportInquiry.ImportInfoManager;
import com.dcits.credit.service.numRead.NumReadService;

/**
 * 读取excel中数据
 * @author HP
 *
 */
public class ImportExportData {
	private static Logger logger = Logger.getLogger(ImportExportData.class);
	
	 	private File file;  //源文件
	 	private NumReadService numReadService;
	 	private ImportInfoManager importInfoService;
	 	private int REQUEST_NO;  //
	 	private String COMPANY;  //法人
	    private SheetContentsHandler handler; 
	    private List<String> listErrCertno = new ArrayList<String>();  // 记录错误身份证号
	    private List<List<String>> listData = new ArrayList<List<String>>();   //记录读取的数据
	    private String FILENAME;  //重要信息文件名
	    
	    public ImportExportData(File file,ImportInfoManager importInfoService,int REQUEST_NO,String filename){  
	        this.file = file; 
	        this.importInfoService = importInfoService;
	        this.REQUEST_NO = REQUEST_NO;
	        this.FILENAME = filename;
	    }  
	      
	    public ImportExportData(File file,NumReadService numReadService,int REQUEST_NO,String COMPANY){  
	        this.file = file; 
	        this.numReadService = numReadService;
	        this.REQUEST_NO = REQUEST_NO;
	        this.COMPANY = COMPANY;
	    }  
	    public ImportExportData setHandler(SheetContentsHandler handler) {  
	        this.handler = handler;  
	        return this;  
	    }  
	    
	    public List<String> getData(){
	    	final List<String> fields = new ArrayList<String>();//记录标题字段
	    	 setHandler(new SimpleSheetContentsHandler(){ 
	    		 private int cellNo;//记录身份证号位置
	    		 private int typeNo;//记录证件类型位置
			        @Override  
			        public void endRow(int rowNum) {  
			            if(rowNum == 0){  
			                // 第一行字段  
			            	fields.addAll(row);
			            	for(int i=0;i<fields.size();i++){
			            		if("CREDENTIALS_TYPE".equals(fields.get(i))){
			            			typeNo = i;
			            		}else if("CREDENTIALS_NO".equals(fields.get(i))){
			            			cellNo = i;
			            		}
			            	}
			            }else if(rowNum > 1){  
			                // 数据 
			            	boolean flag = true;
		            		if("0".equals(row.get(typeNo))){ //验证身份证号码
		            			flag = ReadExcel.checkMobileNumber(row.get(cellNo));
		            			if (!flag) {//记录错误的证件号码
		            				listErrCertno.add(row.get(cellNo));
		    					}
		            		}
		            		if(flag){
		            			listData.add(row);
		            		}
			            }
			            if(listData.size()>1000){
			            	//调用数据入库方法
			            	REQUEST_NO= InsertData(listData,fields,numReadService,REQUEST_NO,COMPANY);
			            	listData.clear();
			            }
			        }
			    }).parse(); 
	    	 if(listData.size()>0){
	    		//数据入库
	    		 InsertData(listData,fields,numReadService,REQUEST_NO,COMPANY);
	    		 listData.clear();
	    	 }
	    	 return listErrCertno;
	    }
	    
	    
	    public void parse(){  
	        OPCPackage pkg = null;  
	        InputStream sheetInputStream = null;  
	          
	        try {  
	            pkg = OPCPackage.open(file,PackageAccess.READ);  
	            XSSFReader xssfReader = new XSSFReader(pkg);  
	              
	            StylesTable styles = xssfReader.getStylesTable();   
	            ReadOnlySharedStringsTable strings = new ReadOnlySharedStringsTable(pkg);  
	            sheetInputStream = xssfReader.getSheetsData().next();  
	              
	            processSheet(styles, strings, sheetInputStream);  
	        } catch (Exception e) {  
	            throw new RuntimeException(e.getMessage(), e);  
	        }finally {  
	            if(sheetInputStream != null){  
	                try {  
	                    sheetInputStream.close();  
	                } catch (IOException e) {  
	                    throw new RuntimeException(e.getMessage(), e);  
	                }  
	            }  
	            if(pkg != null){  
	                try {  
	                    pkg.close();  
	                } catch (IOException e) {  
	                    throw new RuntimeException(e.getMessage(), e);  
	                }  
	            }  
	        }  
	    }  
	      
	    private void processSheet(StylesTable styles, ReadOnlySharedStringsTable strings, InputStream sheetInputStream) throws SAXException, ParserConfigurationException, IOException{  
	        XMLReader sheetParser = SAXHelper.newXMLReader();   
	          
	        if(handler != null){  
	            sheetParser.setContentHandler(new XSSFSheetXMLHandler(styles, strings, handler, false));  
	        }else{  
	            sheetParser.setContentHandler(new XSSFSheetXMLHandler(styles, strings, new SimpleSheetContentsHandler(), false));  
	        }  
	          
	        sheetParser.parse(new InputSource(sheetInputStream));  
	    }  
	      
	    public static class SimpleSheetContentsHandler implements SheetContentsHandler{  
	        protected List<String> row = new LinkedList<>();  
	          
	        @Override  
	        public void startRow(int rowNum) {  
	        	row = new LinkedList<>();    
	        }  
	  
	        @Override  
	        public void endRow(int rowNum) {  
	            System.err.println(rowNum + " : " + row);  
	        }  
	  
	        @Override  
	        public void cell(String cellReference, String formattedValue, XSSFComment comment) {  
	            row.add(formattedValue);  
	        }  
	  
	        @Override  
	        public void headerFooter(String text, boolean isHeader, String tagName) {  
	              
	        }  
	    }
	    
	    
	    public int InsertData(List<List<String>> listData,List<String> fields,NumReadService numReadService,int REQUEST_NO,String COMPANY){
	    	String sql = "INSERT INTO CIFM_NUMREADRE_QUEST(REQUEST_NO,COMPANY,";
	    	String sqlV = "";
	    	int dateNo = 0;
	    	for(int i=0;i<fields.size();i++){
	    		sql += fields.get(i).trim()+",";
	    		if("PRODUCE_DATE".equals(fields.get(i))){
	    			dateNo = i;
	    		}
	    	}
	    	sql = sql.substring(0, sql.length()-1)+")";
	    	for(int i=0;i<listData.size();i++){
	    		List<String> list = listData.get(i);
	    		sqlV = sqlV+" select "+REQUEST_NO+",'"+COMPANY+"',";
	    		String str = "";
	    		for(int j=0;j<list.size();j++){
	    			if(j==dateNo){
	    				str += "to_date('"+list.get(j)+"','yyyy-MM-dd'),";
	    			}else{
	    				str += "'"+list.get(j)+"',";
	    			}
	    		}
	    		sqlV += str.substring(0, str.length()-1)+"  FROM DUAL UNION ALL";
	    		REQUEST_NO++;
	    	}
			
	    	if(!"".equals(sqlV)){
				sql = sql+sqlV.substring(0, sqlV.length()-9);
				Map<String,String> mapp = new HashMap<String,String>();
				mapp.put("creatSql", sql);
				//入库
				try {
					numReadService.saveInfo(mapp);
				} catch (Exception e) {
					logger.error(e.getMessage(),e);
				}
			}
	    	return REQUEST_NO;
	    }
	    
	    
	    
	    public List<String> getMessageData(){
	    	final List<String> fields = new ArrayList<String>();//记录标题字段
	    	 setHandler(new SimpleSheetContentsHandler(){ 
			        @Override  
			        public void endRow(int rowNum) {  
			            if(rowNum == 0){  
			                // 第一行字段  
			            	fields.addAll(row);
			            }else{  		              
		            			listData.add(row);
			            }
			            if(listData.size()>1000){
			            	//调用数据入库方法
			            	REQUEST_NO= InsertMessageData(listData,fields,importInfoService,REQUEST_NO,FILENAME);
			            	listData.clear();
			            }
			        }
			    }).parse(); 
	    	 if(listData.size()>0){
	    		//数据入库
	    		 InsertMessageData(listData,fields,importInfoService,REQUEST_NO,FILENAME);
	    		 listData.clear();
	    	 }
	    	  
	    	 SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");
				String now = sdf.format(new Date());				
				String  sql="";
				Map<String,String> mapp = new HashMap<String,String>();
			    mapp.clear();
			    sql="INSERT INTO test_important_message (id,m_date,NAME) VALUES ('"+FILENAME+"','"+now+"','"+FILENAME+"')";
			    mapp.put("creatSql", sql);
				try {
					importInfoService.save(mapp);
				} catch (Exception e) {
					logger.error(e.getMessage(),e);
				}
	    	 return listErrCertno;
	    }
	    public int InsertMessageData(List<List<String>> listData,List<String> fields,ImportInfoManager importInfoService,int REQUEST_NO,String filename){
	    	String sql = "INSERT INTO important_message_info(import_message_name,org_code,name,card_type,card_no,info_no,create_time) ";
	    	String sqlV = "";
	    	for(int i=0;i<listData.size();i++){
	    		List<String> list = listData.get(i);
	    		sqlV = sqlV+" select '"+filename+"',";
	    		String str = "";
	    		for(int j=0;j<list.size();j++){
	    			if(j % 5==0&& j!=0){
	    				str += "date_format('"+list.get(j)+"','%Y-%m-%d')";
	    			}else{
	    				str += "'"+list.get(j)+"',";
	    			}
	    		}
	    		sqlV += str+"  FROM DUAL UNION ALL";
	    	}
			
	    	if(!"".equals(sqlV)){
				sql = sql+sqlV.substring(0, sqlV.length()-9);
				Map<String,String> mapp = new HashMap<String,String>();
				mapp.put("creatSql", sql);
				//入库
				try {
					importInfoService.saveInfo(mapp);
				} catch (Exception e) {
					logger.error(e.getMessage(),e);
				}
			}
	    	return REQUEST_NO;
	    }
	    
}
