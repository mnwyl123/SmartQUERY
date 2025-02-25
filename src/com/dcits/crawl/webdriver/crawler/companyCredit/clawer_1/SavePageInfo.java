package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_1;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import org.apache.log4j.Logger;

import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.PathUtil;
import com.dcits.crawl.webdriver.crawler.CompressUtils;

/**
 * 保存页面
 * @author zhangyy
 *
 */
public class SavePageInfo {

	private static Logger logger = Logger.getLogger(SavePageInfo.class);
	//整体页面保存
	public void savePage(String pageCode,PageData pd){
		String ID = pd.getString("ID");
		//替换页面链接
		try{
			if(!pageCode.contains("借款人信息不存在")){
				pageCode = new OnclickHandle().OnClickOper(pageCode,pd);
				//记录打印
				StringBuffer str = new StringBuffer();
				str.append("window.print\\(\\);");
				str.append("\\$.ajax\\(\\{");
				str.append("async:false,");
				str.append("cache:false,");
				str.append("data:\\{"+'"'+"ID"+'"'+":'"+ID+"'\\},");
				str.append("url:'../../../PersonReportInquiry/isPrint.do',");
				str.append("type:"+'"'+"post"+'"');
				str.append(" \\}\\);");
				pageCode = pageCode.replaceAll("window.print\\(\\);", str.toString());
				str = new StringBuffer();
				str.append("<script src="+'"'+"../../js/common/jquery-1.10.2.js"+'"'+"></script>");
				str.append("</body>");
				str.append("<script>");
				str.append("document.oncontextmenu = function\\(\\)\\{return false;\\}");
				str.append("</script>");
				pageCode = pageCode.replaceAll("</body>", str.toString());
			}else{
				/*pageCode = pageCode.replaceAll("javascript:history.back()", "javascript:window.close()");
				pageCode = pageCode.replaceAll("返 回", "关 闭");*/
				pageCode = pageCode.replaceAll("<head>", "<head><meta http-equiv='Content-Type' content='text/html; charset=GBK'> ");
			}
			
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		
		//替换页面中的空格符
		try {
			pageCode = pageCode.replaceAll(" ", "&nbsp;");
			pageCode = pageCode.replaceAll("&lt;!--", "<!--");
			pageCode = pageCode.replaceAll("--&gt;", "-->");
			pageCode = pageCode.replace("HEIGHT: 90px", "HEIGHT: 0px");
			pageCode = pageCode.replace("height: 90px", "HEIGHT: 0px");
			pageCode = pageCode.replace("; HEIGHT: 100px", "; HEIGHT: 0px");
			pageCode = pageCode.replace(";HEIGHT: 100px", "; HEIGHT: 0px");
			pageCode = pageCode.replace("; height: 100px", "; HEIGHT: 0px");
			pageCode = pageCode.replace(";height: 100px", "; HEIGHT: 0px");
		} catch (Exception e1) {
			logger.info("页面字符替换失败！");
			logger.error(e1.getMessage(),e1);
		}
		
		String path = PathUtil.getClasspath() + Const.FILEPATHIMG + File.separator+ID;  //文件路径
		String fileName = ID+".html";
		//addb by zz on 20170914
		String zipFileName=ID+".zip";
		String zipPasswd=ID.substring(0,6);
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
			CompressUtils.zip(path+"\\"+fileName,path+"\\"+zipFileName,true,zipPasswd);
			//CompressUtils.zip(path+"\\"+fileName,path+"\\"+zipFileName,true,zipPasswd);
		} catch (IOException e) {
			logger.error(e.getMessage(),e);
		}finally{
			out.close();
		}
	}
}
