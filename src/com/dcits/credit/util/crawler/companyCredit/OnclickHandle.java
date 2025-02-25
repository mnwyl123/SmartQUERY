package com.dcits.credit.util.crawler.companyCredit;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.util.crawler.WaitTime;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

/**
 * 页面中Onclick事件处理
 * @author zhangyy
 *
 */
public class OnclickHandle {

	private static Logger logger = Logger.getLogger(OnclickHandle.class);
	
	//页面中OnClick事件处理
	public String OnClickHandle(WebDriver dr,PageData pd){
		String pageCode = dr.getPageSource();
		Document document = Jsoup.parse(pageCode);
		List<Element> eles = document.getElementsByTag("table");
		int count = 0; //记录onclick事件个数
		//记录处理结果
		int rowNum = 0;
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("count", 0);
		resultMap.put("pageCode", pageCode);
		for(int i=0;i<eles.size();i++){
			String str = eles.get(i).text().trim();
			rowNum = i+1;
			if(str.contains("资产负债表")||str.contains("利润表")||str.contains("现金流量表")){
				//调用处理方法
				resultMap = FinOnclickHandle(dr,pageCode,rowNum,count,pd);
			}else{
				//其他弹出窗口调用处理方法
				resultMap = OtherOnclickHandle(dr,pageCode,rowNum,count,pd);
			}
			pageCode = (String) resultMap.get("pageCode");
			count = (int) resultMap.get("count");
		}
		return pageCode;
	}
	
	//财务报表单独处理方法(利用静态页面替换链接，动态页面点击事件)
	private Map<String,Object> FinOnclickHandle(WebDriver dr,String pageCode,int rowNum,int count,PageData pd){
		boolean flag = false;  //用于标识是否含有可点击事件
		String ID = pd.getString("ID");
		//记录处理结果
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Document document = Jsoup.parse(pageCode);
		List<Element> eles = document.getElementsByTag("table");
		if(rowNum!=0&&rowNum<eles.size()){
			int num = count;
			List<Element> rows = eles.get(rowNum).select("table").select("tr");
			for(int t=0;t<rows.size();t++){
				List<Element> cols = rows.get(t).select("td");
				for(int k=0;k<cols.size();k++){
					List<Element> ss = cols.get(k).getElementsByTag("a");
					for(int h=0;h<ss.size();h++){
						flag = true;
						num++;
						//替换onclick事件
						ss.get(h).attr("onclick", "javascript:location.href='"+ID+"/"+num+".xlsx';");
					}
				}
			}
		}
		//点击按钮事件，保存弹出页面，动态页面点击事件
		if(flag){
			//点击onclick方法，保存弹出页面
			List<WebElement> Listtable = dr.findElements(By.tagName("table"));
			List<WebElement> list = Listtable.get(rowNum).findElements(By.cssSelector("tr>td>a"));
			for(int i=0;i<list.size();i++){
				//System.out.println(list.get(i).getText());
				//点击事件并保存页面
				count++;
				list.get(i).click();
				//下载excel
				try{
					DownLoad dl = new DownLoad();
					dl.executeAutoItScript(count, pd);
				}catch(Exception e){
					logger.error(e.getMessage());
				}
				
//				String currentHandle = dr.getWindowHandle();//当前主窗口句柄
//				Set<String> handlesSet = dr.getWindowHandles();
//				String otherHandle = "";
//				for (String handle : handlesSet) {
//					if (!currentHandle.equals(handle)) {
//						otherHandle = handle;
//						break;
//					}
//				}
//				if (!"".equals(otherHandle)) {
//					//捕获弹出窗口
//					dr.switchTo().window(otherHandle);
//					//下载excel
//					
//					
//					String pageInfo = dr.getPageSource();
//					WaitTime.threadWait(3);
//					dr.close();
//					//保存弹出页面
//					SavePopPage(count,pageInfo,pd);
//					//退回到主窗口
//					dr.switchTo().window(currentHandle);
//					
//				}else{
//					logger.info(" 弹出页面获取失败!");
//				}
			}
		}
		
		resultMap.put("pageCode", document.toString());
		resultMap.put("count", count);
		return resultMap;
	}
	
	//其它表中onclick事件处理(利用静态页面替换链接，动态页面点击事件)
	public Map<String,Object> OtherOnclickHandle(WebDriver dr,String pageCode,int rowNum,int count,PageData pd){
		boolean flag = false;  //用于标识是否含有可点击事件
		String ID = pd.getString("ID");
//		//记录处理结果，静态页面替换链接
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Document document = Jsoup.parse(pageCode);
		List<Element> eles = document.getElementsByTag("table");
		if(rowNum!=0&&rowNum<eles.size()){
			int num = count;
			List<Element> rows = eles.get(rowNum).select("table").select("tr");
			for(int t=0;t<rows.size();t++){
				List<Element> cols = rows.get(t).select("td");
				for(int k=0;k<cols.size();k++){
					List<Element> ss = cols.get(k).getElementsByTag("a");
					for(int h=0;h<ss.size();h++){
						flag = true;
						num++;
						//替换onclick事件
						ss.get(h).attr("onclick", "javascript:window.open('"+ID+"/"+num+".html', 'newwindow', 'Width=800px;Height=600px,top=100px,left=200px,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,resizable=no,directories=no');");
					}
				}
			}
		}
		
		//点击按钮事件，保存弹出页面，动态页面点击事件
		if(flag){
			//点击onclick方法，保存弹出页面
			List<WebElement> Listtable = dr.findElements(By.tagName("table"));
			List<WebElement> list = Listtable.get(rowNum).findElements(By.cssSelector("tr>td>a"));
			for(int i=0;i<list.size();i++){
				//点击事件并保存页面
				count++;
				list.get(i).click();
				String currentHandle = dr.getWindowHandle();//当前主窗口句柄
				Set<String> handlesSet = dr.getWindowHandles();
				String otherHandle = "";
				for (String handle : handlesSet) {
					if (!currentHandle.equals(handle)) {
						otherHandle = handle;
						break;
					}
				}
				if (!"".equals(otherHandle)) {
					//捕获弹出窗口
					dr.switchTo().window(otherHandle);
					String pageInfo = dr.getPageSource();
					WaitTime.threadWait(3);
					dr.close();
					//保存弹出页面
					SavePopPage(count,pageInfo,pd);
					//退回到主窗口
					dr.switchTo().window(currentHandle);
					
				}else{
					logger.info(" 弹出页面获取失败!");
				}
			}
		}
		resultMap.put("pageCode", document.toString());
		resultMap.put("count", count);
		return resultMap;
	}
	
	//保存页面
	private void SavePopPage(int count,String str,PageData pd){
		String ID = pd.getString("ID");
		String path = PathUtil.getClasspath() + Const.FILEPATHIMG + "\\"+ID;  //文件路径
		String fileName = count+".html";
		String ftpPath = pd.getString("ftpPath")+ID;
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
			out.write(str);
			out.flush();
			out.close();
			new FileTool().upLoadFromProduction(pd.getString("IP"), Integer.parseInt(pd.getString("port")), pd.getString("LoginName"), pd.getString("LoginPass"), ftpPath, fileName,path+"/"+fileName);
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
	}
}
