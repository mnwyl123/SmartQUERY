package com.dcits.credit.util.crawler.companyCredit;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.WebDriver;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.service.crawler.CompanyCrawlerManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

/**
 * 保存页面
 * @author zhangyy
 *
 */
public class SavePageInfo {

	private static Logger logger = Logger.getLogger(SavePageInfo.class);
	//整体页面保存
	public void savePage(WebDriver dr,PageData pd){
		String ID = pd.getString("ID");
		String pageCode = "";
		
		try{
			//处理页面中的OnClick事件
			pageCode = new OnclickHandle().OnClickHandle(dr,pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		
		//替换页面中的空格符
		try {
			pageCode = pageCode.replaceAll(" ", "&nbsp;");
			pageCode = pageCode.replaceAll("&lt;!--", "<!--");
			pageCode = pageCode.replaceAll("--&gt;", "-->");
		} catch (Exception e1) {
			logger.info("页面字符替换失败！");
			logger.error(e1.getMessage());
		}
		
		String ftpPath = pd.getString("ftpPath")+ID;
		String path = PathUtil.getClasspath() + Const.FILEPATHIMG + "\\"+ID;  //文件路径
		String fileName = ID+".html";
		
		try {
			File file = new File(path);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(path,fileName);
			if(!file.exists()){
				file.createNewFile();
			}
			PrintWriter out = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"GBK")));
			out.write(pageCode);
			out.flush();
			out.close();
			new FileTool().upLoadFromProduction(pd.getString("IP"), Integer.parseInt(pd.getString("port")), pd.getString("LoginName"), pd.getString("LoginPass"), ftpPath, fileName,path+"/"+fileName);
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
	}
}
