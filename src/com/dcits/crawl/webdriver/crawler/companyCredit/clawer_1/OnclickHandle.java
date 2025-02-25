package com.dcits.crawl.webdriver.crawler.companyCredit.clawer_1;
import java.util.List;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.dcits.platform.util.PageData;

/**
 * 页面中Onclick事件处理
 * @author zhangyy
 *
 */
public class OnclickHandle {

	private static Logger logger = Logger.getLogger(OnclickHandle.class);	
	
	//替换链接
	public String OnClickOper(String pageCode,PageData pd){
		Document document = Jsoup.parse(pageCode);
		List<Element> eles = document.getElementsByTag("table");
		int count = 0; //记录onclick事件个数
		//记录处理结果
		int rowNum = 0;
		String nowTime = pd.getString("nowTime");
		
		//需要下载的部分
		for(int i=0;i<eles.size();i++){
			String str = eles.get(i).text().trim();
			rowNum = i+1;
			if(str.contains("资产负债表")||str.contains("利润表")||str.contains("现金流量表")){
				try{
					if(rowNum<eles.size()){
						List<Element> rows = eles.get(rowNum).select("table").select("tr");
						for(int t=0;t<rows.size();t++){
							List<Element> cols = rows.get(t).select("td");
							for(int k=0;k<cols.size();k++){
								List<Element> ss = cols.get(k).getElementsByTag("a");
								for(int h=0;h<ss.size();h++){
									count++;
									String content = ss.get(h).attr("onclick");
									if(!"".equals(content)){  //判断onclick是否包含在a标签中
										//替换onclick事件
										ss.get(h).attr("onclick", "javascript:location.href='"+nowTime+"/exce"+count+".xls';");
									}else{//判断onclick是否包含在sapn标签中
										List<Element> span = ss.get(h).getElementsByTag("span");
										if(span.size()>0){
											content = span.get(0).attr("onclick");
											if(!"".equals(content)){
												//替换onclick事件
												span.get(0).attr("onclick", "javascript:location.href='"+nowTime+"/exce"+count+".xls';");
											}else{//防止span为空
												ss.get(h).attr("onclick", "javascript:window.open('"+nowTime+"/A"+count+".html', 'newwindow', 'Width=800px;Height=600px,top=100px,left=200px,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,resizable=no,directories=no');");
											}
										}
									}
								}
							}
						}
					}
				}catch(Exception e){
					logger.error(e.getMessage(),e);
					logger.error("页面下载excel按钮处理报错！");
				}
			}
		}
		
		//页面顶部报告编号
		if(eles.size()>0){
			try{
				List<Element> rows = eles.get(0).select("table").select("tr");
				if(rows.size()>0){
					List<Element> cols = rows.get(0).select("td");
					for(int h=1;h<cols.size();h++){
						cols.get(h).attr("align", "center");
					}
				}
			}catch(Exception e){
				logger.error(e.getMessage(), e);
				logger.error("页面顶部报告编号处理报错！");
			}
		}
		
		//替换其他弹出窗口调用处理方法链接
		
		int num = 0;
		for(int i=0;i<eles.size();i++){
			String str = eles.get(i).text().trim();
			rowNum = i+1;
			try{
				//页面底部三个按钮隐藏
				if(rowNum>=eles.size()-1){
					List<Element> rows = eles.get(rowNum).select("table").select("tr");
					for(int t=0;t<rows.size();t++){
						List<Element> cols = rows.get(t).select("td");
						for(int k=0;k<cols.size();k++){
							List<Element> ss = cols.get(k).getElementsByTag("input");
							for(int h=0;h<ss.size();h++){
								String content = ss.get(h).attr("onclick");
								if(content.contains("winprint")){
									ss.get(h).attr("type", "button");
									ss.get(h).attr("style", "font:12px;width=45px;");
									ss.get(h).attr("value", "打印");
								}else if(content.contains("printattch")){
									ss.get(h).attr("type", "button");
									ss.get(h).attr("style", "font:12px;width=60px;");
									ss.get(h).attr("value", "打印附件");
									ss.get(h).attr("onclick", "javascript:window.open('"+nowTime+"/PrintDoc.html', 'newwindow', 'Width=1000px;Height=600px,top=100px,left=200px,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,resizable=no,directories=no');");
								}else{
									//替换onclick事件
									ss.get(h).attr("type", "hidden");
								}
							}
						}
					}
					break;
				}
			}catch(Exception e){
				logger.error(e.getMessage(),e);
				logger.error("页面底部打印按钮处理报错！");
			}
			
			
			if(!str.contains("资产负债表")&&!str.contains("利润表")&&!str.contains("现金流量表")&&!str.contains("有直接关联关系的其他企业")){
				try{
					if(rowNum<eles.size()){
						List<Element> rows = eles.get(rowNum).select("table").select("tr");
						for(int t=0;t<rows.size();t++){
							List<Element> cols = rows.get(t).select("td");
							for(int k=0;k<cols.size();k++){
								List<Element> ss = cols.get(k).getElementsByTag("a");
								if(ss.size()>0){  //a标签
									for(int h=0;h<ss.size();h++){
										num++;
										String content = ss.get(h).attr("onclick");
										if(!"".equals(content)){  //判断onclick是否包含在a标签中
											//替换onclick事件
											ss.get(h).attr("onclick", "javascript:window.open('"+nowTime+"/A"+num+".html', 'newwindow', 'Width=800px;Height=600px,top=100px,left=200px,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,resizable=no,directories=no');");
										}else{//判断onclick是否包含在sapn标签中
											List<Element> span = ss.get(h).getElementsByTag("span");
											if(span.size()>0){
												content = span.get(0).attr("onclick");
												if(!"".equals(content)){
													//替换onclick事件
													ss.get(0).attr("onclick", "javascript:window.open('"+nowTime+"/A"+num+".html', 'newwindow', 'Width=800px;Height=600px,top=100px,left=200px,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,resizable=no,directories=no');");
												}else{//防止span为空
													ss.get(h).attr("onclick", "javascript:window.open('"+nowTime+"/A"+num+".html', 'newwindow', 'Width=800px;Height=600px,top=100px,left=200px,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,resizable=no,directories=no');");
												}
											}
										}
									}
								}else{  //input标签
									ss = cols.get(k).getElementsByTag("input");
									for(int h=0;h<ss.size();h++){
										num++;
										//替换onclick事件
										ss.get(h).attr("onclick", "javascript:window.open('"+nowTime+"/In"+num+".html', 'newwindow', 'Width=800px;Height=600px,top=100px,left=200px,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,resizable=no,directories=no');");
										ss.get(h).attr("type", "button");
										ss.get(h).attr("style", "font:12px;width=45px;");
										ss.get(h).attr("value", "详情");
									}
								}
							}
						}
					}
				}catch(Exception e){
					logger.error(e.getMessage(),e);
					logger.error("页面弹出框按钮处理报错！");
				}
			}
			//处理公共明细中的链接按钮
			if(rowNum>2){
				str= eles.get(rowNum-2).text().trim();
				if(str.contains("强制执行记录")||str.contains("行政处罚记录")||str.contains("社会保险参保缴费记录")||str.contains("住房公积金缴费记录")||str.contains("公用事业缴费记录")){
					try{
						if(rowNum<eles.size()){
							List<Element> rows = eles.get(rowNum).select("table").select("tr");
							for(int t=0;t<rows.size();t++){
								List<Element> cols = rows.get(t).select("td");
								for(int k=0;k<cols.size();k++){
									List<Element> ss = cols.get(k).getElementsByTag("a");
									if(ss.size()>0){  //a标签
										//替换onclick事件
										//ss.get(0).attr("onclick", "javascript:window.open('"+nowTime+"/A"+num+".html', 'newwindow', 'Width=800px;Height=600px,top=100px,left=200px,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,resizable=no,directories=no');");
										ss.get(0).attr("style","cursor: hand;font:12px;");
										ss.get(0).attr("class","black1");
										ss.get(0).getElementsByTag("img").get(0).attr("width","0");
										ss.get(0).text("最近24个月详情");
											
									}
								}
							}
						}
					}catch(Exception e){
						logger.error(e.getMessage());
					}
				}
			}
		}
		return document.toString();
	}
}
