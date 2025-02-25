package com.dcits.credit.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.service.creditReportInquiry.ImportInfoManager;
import com.dcits.credit.service.numRead.NumReadService;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.FileZip;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
/**
 * 读取excel的信息，返回List<Map<String, String>>，每一个map为excel中一行的信息
 * excel模板的格式：第一行：表中的字段（隐藏）   第二行：表中字段的中文描述
 * @param filePath:excel的绝对路径
 * 支持.xls、.xlsx
 * @author wangwenming
 *
 */
public class ReadExcel {
	private static Logger logger = Logger.getLogger(ReadExcel.class);
	
	public static List<Map<String, String>> getExcelContent(InputStream is,String fileName){
		String fileType = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
		List<Map<String, String>> mapList = new ArrayList<Map<String, String>>();
		Map<String, String> map = null;
		//InputStream is = null;
		Workbook wb = null;
		Sheet rs = null;
		Row row = null;
		Cell cell = null;
		Row row1 = null; //第一行
		int startLine = 3; //开始行数
		try {
			//is = new FileInputStream(filePath);
			if("xls".equals(fileType)){
				wb = new HSSFWorkbook(is);
			}else if("xlsx".equals(fileType)){
				wb = new XSSFWorkbook(is);
			}else{
				throw new Exception("读取的不是excel文件");
			}
			//获取第一个sheet，目前只支持一个sheet
			rs = wb.getSheetAt(0);
			//获取第一行的信息（第一行存储的是表字段）
			row1 = rs.getRow(0);
			//列数
			int cols = rs.getRow(0).getPhysicalNumberOfCells(); 
			//数据的行数
			int rows = rs.getLastRowNum(); 
			String key = null;
			String value = null;
			for(int i=startLine-1; i<rows+1; i++){
				row = rs.getRow(i);
				map = new HashMap<String, String>();
				for(int j=0; j<cols; j++){
					cell = row.getCell(j);
					if(cell!=null){
						cell.setCellType(Cell.CELL_TYPE_STRING);
						key = row1.getCell(j).getStringCellValue();
						value = row.getCell(j).getStringCellValue();
						map.put(key, value);
					}else{
						break;
					}
				}
				if(map.size()>0){
					mapList.add(map);
				}
			}
		} catch (Exception e) {
			logger.equals(e.getMessage());
		}
		return mapList;
	}
	/***************************zhangyy*********************************/
	//插入数据(数据导入excel2003)
	public static Map<String,String> InsertExcelContent(Sheet rs,int startRow,int endRow,NumReadService numReadService,int REQUEST_NO,String COMPANY){
		Map<String,String> returnResult = new HashMap<String,String>();
		List<Map<String, String>> mapList = new ArrayList<Map<String, String>>();
		Map<String, String> map = null;
		Row row = null;
		Cell cell = null;
		Row row1 = null; //第一行
		try {
			//获取第一行的信息（第一行存储的是表字段）
			row1 = rs.getRow(0);
			//列数
			int cols = rs.getRow(0).getPhysicalNumberOfCells(); 
			String key = null;
			String value = null;
			for(int i=startRow; i<endRow+1; i++){
				row = rs.getRow(i);
				map = new HashMap<String, String>();
				for(int j=0; j<cols; j++){
					cell = row.getCell(j);
					if(cell!=null){
						key = row1.getCell(j).getStringCellValue();
						if("PRODUCE_DATE".equals(key)){
							try{
								Date date =row.getCell(j).getDateCellValue();
								value =DateFormatUtils.format(date, "yyyy-MM-dd");
							}catch(Exception e){
								cell.setCellType(Cell.CELL_TYPE_STRING);
								value = row.getCell(j).getStringCellValue();
							}
						}else{
							cell.setCellType(Cell.CELL_TYPE_STRING);
							value = row.getCell(j).getStringCellValue();
						}
						map.put(key, value);
					}else{
						break;
					}
				}
				if(map.size()>0){
					mapList.add(map);
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		//校验并入库
		String errCertno = "";
		String sql = "INSERT INTO CIFM_NUMREADRE_QUEST(REQUEST_NO,CLIENT_NAME,CREDENTIALS_TYPE,CREDENTIALS_NO,PRODUCE_DATE,COMPANY,STATUS)";
		String sqlV = "";
		try{
			//校验数据并入库
			for (int i = 0; i < mapList.size(); i++) {
				Map<String, String> pdMap = mapList.get(i);
				String certtype = pdMap.get("CREDENTIALS_TYPE");
				String certno = pdMap.get("CREDENTIALS_NO");
				String str = pdMap.get("PRODUCE_DATE");
				
				boolean isError = false;
				// 如果证件类型是身份证
				if (certtype.equals("0")) {
					boolean flag = checkMobileNumber(certno);
					if (!flag) {//记录错误的证件号码
						errCertno = errCertno + certno + ";";
						isError = true;
					}
				}
				if(!isError){
					sqlV = sqlV+" select "+REQUEST_NO+",'"+pdMap.get("CLIENT_NAME")+"','"+certtype+"','"+certno+"',str_to_date('"+str+"','%Y%m%d'),'"+COMPANY+"','0' FROM DUAL UNION ALL";
				}
				REQUEST_NO++;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
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
		
		returnResult.put("errorCode", errCertno);
		returnResult.put("request_no", String.valueOf(REQUEST_NO));
		return returnResult;
	}
	
	
	//校验身份证
	public static boolean checkMobileNumber(String certno) {
		boolean flag = false;
		String regEx = "(^(\\d{6}(([1-9]\\d{3}((01|0[3-9])|(1[0-2]))((0[1-9])|([12]\\d)|(3[0-1])))|([1-9]\\d{3}02((0[1-9])|([12]\\d))))\\d{3}[0-9Xx])$)|(^(\\d{6}\\d{2}(((01|0[3-9]|1[0-2])((0[1-9])|([12]\\d)|(3[0-1])))|(02)(0[1-9]|[12]\\d))\\d{3})$)";
		Pattern pattern = Pattern.compile(regEx);
		Matcher matcher = pattern.matcher(certno);
		flag = matcher.matches();
		return flag;
	}
	//报文生成
	public static void InsertData(List<PageData> list,String filename,NumReadService numReadService) {
		// 记录生成报文的信息（报文名称，每个报文的请求编号）
		String sql = "insert into CIFM_NUMREADR_BATCH(BATCH_NAME,REQUEST_NO,COMPANY)";
		String str = "";
		try{
			for (PageData pdd : list) {
				str += " select '"+filename+"','"+String.valueOf(pdd.get("REQUEST_NO"))+"','"+pdd.getString("COMPANY")+"' FROM DUAL UNION ALL";
			}
			sql = sql+str.substring(0, str.length()-9);
			Map<String,String> mapp = new HashMap<String,String>();
			mapp.put("creatSql", sql);
			//入库
			numReadService.saveInfo(mapp);
		}catch(Exception e){
			logger.info(e.getMessage(),e);
		}
		
		try{
			String[] listId = new String[list.size()];
			for(int i=0;i<list.size();i++){
				listId[i]=String.valueOf(list.get(i).get("REQUEST_NO"));
			}
			numReadService.updateStatus(listId);
		}catch(Exception e){
			logger.info(e.getMessage(),e);
		}
	}
	//上传ftp并删除本地临时文件
	public static void deleteFile(PageData pd,String filename) {
		// 将生成的文件上传到FTP服务器上
		uploadFTP(pd);
		// 删除本地文件
		File txt = new File(filename + ".txt");
		txt.delete();
		File file = new File(filename + ".tmp");
		file.delete();
		File fileEnc = new File(filename + ".enc");
		fileEnc.delete();
	}
	/**
	 * 将本地文件上传到FTP服务器
	 * 
	 * @param pd
	 * @throws IOException
	 */
	public static void uploadFTP(PageData pd) {
		String url = pd.getString("IP"); // FTP服务器hostname
		int port = Integer.parseInt(pd.getString("port")); // FTP服务器端口
		String username = pd.getString("LoginName"); // FTP登录账号
		String password = PasswordOper.decode(pd.getString("LoginPass")); // FTP登录密码
		String path = pd.getString("NR_ftpPath"); // FTP服务器保存目录
		String filename = pd.getString("filename"); // 上传到FTP服务器上的文件名
		String isPath = pd.getString("InputStreamPath");
		File file = new File(isPath);
		InputStream input;
		try {
			input = new FileInputStream(file);
			FileTool.uploadFile(url, port, username, password, path, filename, input);
		} catch (FileNotFoundException e) {
			logger.info(e.getMessage());
		}
	}
	//导出数字解读查询数据
	public static String exportData(PageData pd,NumReadService numReadService,HttpServletResponse response) {
		String msg = "success";
		int currentNo = 0;
		pd.put("currentNo", null);
		int total = 0;
		String path = PathUtil.getClasspath() + Const.NUMREAD;
		String fileName = "numRead"+new SimpleDateFormat("yyyyMMddHHmm").format(new Date())+".xlsx";
		if (path.endsWith("/") || path.endsWith("\\")) {
			path = path + fileName;
		} else {
			path = path + File.separator + fileName;
		}
		try{
			try{
				path = path.replaceAll("\\\\", "/");
			}catch(Exception e){
				
			}
			File file = new File(path);
			if(!file.exists()){
				file.createNewFile();
			}
			//查询需要导出数据总条数
			int sum = Integer.parseInt(String.valueOf(numReadService.queryNumReadSucessDataSum(pd).get("SUM")));
			if(sum!=0){
				int count = sum/1000+1;
				
				SXSSFWorkbook sxs = new SXSSFWorkbook(100);
				FileOutputStream out = new FileOutputStream(path);
				Sheet first = null;
				for(int i=0;i<count;i++){
					List<PageData> listPd = new ArrayList<PageData>();
					listPd = numReadService.queryNumReadSucessData(pd);
					if(listPd.size()>0){
						if(total>1040000||total==0){
							first = sxs.createSheet();
							total = 0;
							//标题
							Row row = first.createRow(0);
							row.createCell(0).setCellValue("被查询人姓名");
							row.createCell(1).setCellValue("被查询人证件类型");
							row.createCell(2).setCellValue("被查询人证件号码");
							row.createCell(3).setCellValue("查询结果类型");
							row.createCell(4).setCellValue("数字解读");
							row.createCell(5).setCellValue("影响因素");
							row.createCell(6).setCellValue("相对位置");
							row.createCell(7).setCellValue("计算日期");
						}
						//数据
						for(int t=0;t<listPd.size();t++){
							Row row = first.createRow(total+t+1);
							row.createCell(0).setCellValue(String.valueOf(listPd.get(t).get("CLIENT_NAME")));
							row.createCell(1).setCellValue(String.valueOf(listPd.get(t).get("CREDENTIALS_TYPE")));
							row.createCell(2).setCellValue(String.valueOf(listPd.get(t).get("CREDENTIALS_NO")));
							row.createCell(3).setCellValue(String.valueOf(listPd.get(t).get("RESULT_TYPE")));
							row.createCell(4).setCellValue(String.valueOf(listPd.get(t).get("SCORE")));
							row.createCell(5).setCellValue(String.valueOf(listPd.get(t).get("FACTORS")));
							row.createCell(6).setCellValue(String.valueOf(listPd.get(t).get("POSITION")));
							row.createCell(7).setCellValue(String.valueOf(listPd.get(t).get("SCORE_DATE")));
						}
						total +=listPd.size();
						currentNo = Integer.parseInt(String.valueOf(listPd.get(listPd.size()-1).get("REQUEST_NO")));
						pd.put("currentNo", currentNo);
					}
				}
				sxs.write(out);
				out.close();
				//压缩
				try{
					FileZip.zip(path, PathUtil.getClasspath() + Const.NUMREAD+fileName.replaceAll(".xlsx", ".zip"));
					msg = fileName.replaceAll(".xlsx", ".zip");
					//删除临时文件
					File ff = new File(path);
					if (ff.exists()) {
						ff.delete();
					}
				}catch(Exception e){
					msg = fileName;
				}
			}else{
				msg = "noData";
			}
		}catch(Exception e){
			msg = "error";
			logger.error(e.getMessage(), e);
		}
		return msg;
	}
	
	//删除临时文件
	public static void deleteFile(String path){
		// 删除临时文件
		try{
			File txt = new File(path);
			txt.delete();
		}catch(Exception e){
			logger.error("临时文件删除失败："+e.getMessage(), e);
		}
	}
	
	//下载文件
	public static void downFile(String localPath,String ftpPath,List<String> fileNames){
		try {
			if("".equals(localPath)||localPath==null){
				localPath="C:/";
			}
			for(int i=0;i<fileNames.size();i++){
				String fileName = fileNames.get(i);
				File file = new File(localPath+fileName);
				if(!file.exists()){
					file.createNewFile();
				}
				ftpPath = ftpPath+Const.NUMREAD+fileName;
				URL urlfile = new URL(ftpPath);
				HttpURLConnection httpUrl = (HttpURLConnection) urlfile.openConnection();
				httpUrl.setRequestMethod("GET");
				httpUrl.setRequestProperty("Charset", "UTF-8");
				httpUrl.connect();
				
				BufferedInputStream bis = new BufferedInputStream(httpUrl.getInputStream());
				OutputStream out = new FileOutputStream(file);
				int size = 0;
				int len = 0;
				byte[] buf = new byte[1024];
				while((size=bis.read(buf))!=-1){
					len+=size;
					out.write(buf, 0, size);
				}
				out.close();
				bis.close();
				httpUrl.disconnect();
				//下载完成，删除本地临时文件
				deleteFile(ftpPath);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			//下载完成，删除本地临时文件
			deleteFile(ftpPath);
		}
	}
	
	//插入数据(数据导入excel2003)
		public static Map<String,String> InsertExcelContent(Sheet rs,int startRow,int endRow,ImportInfoManager importInfoService,int REQUEST_NO,String filename){
			Map<String,String> returnResult = new HashMap<String,String>();
			List<Map<String, String>> mapList = new ArrayList<Map<String, String>>();
			Map<String, String> map = null;
			Row row = null;
			Cell cell = null;
			Row row1 = null; //第一行
			try {
				//获取第一行的信息（第一行存储的是表字段）
				row1 = rs.getRow(0);
				//列数
				int cols = rs.getRow(0).getPhysicalNumberOfCells(); 
				String key = null;
				String value = null;
				for(int i=startRow-1; i<endRow+1; i++){
					row = rs.getRow(i);
					map = new HashMap<String, String>();
					for(int j=0; j<cols; j++){
						cell = row.getCell(j);
						if(cell!=null){
							key = row1.getCell(j).getStringCellValue();
							if("提示信息生成时间".equals(key)){
								try{
									Date date =row.getCell(j).getDateCellValue();
									value =DateFormatUtils.format(date, "yyyy-MM-dd");
								}catch(Exception e){
									cell.setCellType(Cell.CELL_TYPE_STRING);
									value = row.getCell(j).getStringCellValue();
								}
							}else{
								cell.setCellType(Cell.CELL_TYPE_STRING);
								value = row.getCell(j).getStringCellValue();
							}
							map.put(key, value);
						}else{
							break;
						}
					}
					if(map.size()>0){
						mapList.add(map);
					}
				}
			} catch (Exception e) {
				logger.error(e.getMessage(),e);
			}
			//校验并入库
			String errCertno = "";
			String sql = "INSERT INTO important_message_info(import_message_name,org_code,NAME,card_type,card_no,info_no,create_time)";
			String sqlV = "";
			try{
				//校验数据并入库
				for (int i = 0; i < mapList.size(); i++) {
					Map<String, String> pdMap = mapList.get(i);
					String org_code = pdMap.get("本机构业务管理机构代码");
					String name = pdMap.get("借款人姓名");
					String type = pdMap.get("证件类型");	
					String cardNo = pdMap.get("证件号码");
					String infoNo = pdMap.get("信息代码");
					String createTime =  pdMap.get("提示信息生成时间");
					boolean isError = false;
					if(!isError){
						sqlV = sqlV+" select '"+filename+"','"+org_code+"','"+name+"','"+type+"','"+cardNo+"','"+infoNo+"',"+"date_format('"+createTime+"','%Y-%m-%d')  FROM DUAL UNION ALL";
					}
				}
			}catch(Exception e){
				logger.error(e.getMessage(),e);
			}
			
			if(!"".equals(sqlV)){
				sql = sql+sqlV.substring(0, sqlV.length()-9);
				Map<String,String> mapp = new HashMap<String,String>();
				mapp.put("creatSql", sql);
				//入库
				try {
					importInfoService.saveInfo(mapp);
					SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");
					String now = sdf.format(new Date());				
				    sql="";
				    mapp.clear();
				    sql="INSERT INTO test_important_message (id,m_date,NAME) VALUES ('"+filename+"','"+now+"','"+filename+"')";
				    mapp.put("creatSql", sql);
					importInfoService.save(mapp);
				} catch (Exception e) {
					logger.error(e.getMessage(),e);
				}
			}	
			returnResult.put("errorCode", errCertno);
			returnResult.put("request_no", String.valueOf(REQUEST_NO));
			return returnResult;
		}
}
