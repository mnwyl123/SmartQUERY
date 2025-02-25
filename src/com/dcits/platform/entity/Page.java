package com.dcits.platform.entity;

import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.Tools;

/**
 * 分页类
 * @author pengyj pengyj
 * 创建时间：2014年6月28日
 */
public class Page implements Cloneable{
	
	private int showCount = 10; //每页显示记录数
	private int totalPage;		//总页数
	private int totalResult;	//总记录数
	private int currentPage;	//当前页
	private int currentResult;	//当前记录起始索引
	private boolean entityOrField;	//true:需要分页的地方，传入的参数就是Page实体；false:需要分页的地方，传入的参数所代表的实体拥有Page属性
	private String pageStr;		//最终页面显示的底部翻页导航，详细见：getPageStr();
	private PageData pd = new PageData();
	
	public Page(){
		
	}
	
	public Object clone(){
		Page o = null ;
		try {
			o = (Page)super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return o ;	
	}
	
	public int getTotalPage() {
		if(totalResult%showCount==0)
			totalPage = totalResult/showCount;
		else
			totalPage = totalResult/showCount+1;
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getTotalResult() {
		return totalResult;
	}
	
	public void setTotalResult(int totalResult) {
		this.totalResult = totalResult;
	}
	
	public int getCurrentPage() {
		if(currentPage<=0)
			currentPage = 1;
		if(currentPage>getTotalPage())
			currentPage = getTotalPage();
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	//拼接分页 页面及JS函数
	public String getPageStr() {
		StringBuffer sb = new StringBuffer();
		sb.append(" <link rel=\"stylesheet\" type=\"text/css\" href=\"css/fenye/iconfont.css\">\n");
		sb.append("	<div style=\"float:left;color:#b4b4b4;\"><span>每页显示 <select name=\"showCount\" id=\"showCount\" style=\"width:40px;height:30px;text-align:center;padding: 0;\" onchange=\"changeCount(this.value);\">");
		sb.append(" <option value=\"5\">5</option>");
		sb.append(" <option value=\"10\">10</option>");
		sb.append(" <option value=\"15\">15</option></select>条数据</span>\n");
		sb.append(" <span style=\"margin-right:20px;margin-left:20px;\">  共 "+totalResult+" 条</span>\n");
		sb.append(" <span style=\"margin-right:20px;margin-left:20px;\">"+currentPage+"/"+totalPage+"</span>\n");
		sb.append("	</div>\n");
		if(totalResult>0){
			sb.append("	<ul class=\"pagination no-margin\">\n");
			if(currentPage==1){
				sb.append("	<li><a class=\"iconfont-14 icon-shangyiye1 pageOption\" style=\"font-weight:600\"></a></li>\n");
				sb.append("	<li><a class=\"iconfont icon-shangyiye pageOption\"></a></li>\n");
			}else{
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage(1)\" class=\"iconfont-14 icon-shangyiye1 pageOption\" style=\"font-weight:600\"></a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+(currentPage-1)+")\" class=\"iconfont icon-shangyiye pageOption\"></a></li>\n");
			}
			if(currentPage==totalPage){
				sb.append("	<li><a class=\"iconfont icon-shangyiye-copy-copy pageOption\"></a></li>\n");
				sb.append("	<li><a class=\"iconfont icon-caozuoxiayiye pageOption\"></a></li>\n");
			}else{
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+(currentPage+1)+")\" class=\"iconfont icon-shangyiye-copy-copy\"></a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+totalPage+")\" class=\"iconfont icon-caozuoxiayiye\"></a></li>\n");
			}
			sb.append("</ul>\n");
			
			sb.append("	<div style=\"float:right;color:#b4b4b4;\">\n");
			sb.append("	<span style=\"margin-right:5px;margin-left:35px;\">跳转到 <input type=\"text\" value=\"\" id=\"toGoPage\" style=\"width:30px;height:30px;text-align:center;padding: 0;\"/> 页</span>\n");
			sb.append("	<span style=\"cursor:pointer;margin-left:18px;\"><a onclick=\"toTZ();\" style=\"height:30px;background-color:#2291e4 !important;border-color:#2291e4 !important;padding-left: 2px;\" class=\"btn btn-mini\">GO</a></span></div>\n");
			sb.append("<script type=\"text/javascript\">\n");
			
			//换页函数
			sb.append("function nextPage(page,showCount){");
			sb.append(" top.jzts();");
			sb.append("	if(true && document.forms[0]){\n");
			sb.append("		var url = document.forms[0].getAttribute(\"action\");\n");
			sb.append("		if(url.indexOf('?')>-1){url += \"&"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		else{url += \"?"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(entityOrField?"showCount":"page.showCount")+"="+showCount+"\";\n");
			sb.append("		document.forms[0].action = url;\n");
			sb.append("		document.forms[0].submit();\n");
			sb.append("	}else{\n");
			sb.append("		var url = document.location+'';\n");
			sb.append("		if(url.indexOf('?')>-1){\n");
			sb.append("			if(url.indexOf('currentPage')>-1){\n");
			sb.append("				var reg = /currentPage=\\d*/g;\n");
			sb.append("				url = url.replace(reg,'currentPage=');\n");
			sb.append("			}else{\n");
			sb.append("				url += \"&"+(entityOrField?"currentPage":"page.currentPage")+"=\";\n");
			sb.append("			}\n");
			sb.append("		}else{url += \"?"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(entityOrField?"showCount":"page.showCount")+"="+showCount+"\";\n");
			sb.append("		document.location = url;\n");
			sb.append("	}\n");
			sb.append("}\n");
			
			//调整每页显示条数
			sb.append("document.getElementById('showCount').value = "+showCount+";\n");
			sb.append("function changeCount(value){");
			sb.append(" top.jzts();");
			sb.append("	if(true && document.forms[0]){\n");
			sb.append("		var url = document.forms[0].getAttribute(\"action\");\n");
			sb.append("		if(url.indexOf('?')>-1){url += \"&"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		else{url += \"?"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + \"1&" +(entityOrField?"showCount":"page.showCount")+"=\"+value;\n");
			sb.append("		document.forms[0].action = url;\n");
			sb.append("		document.forms[0].submit();\n");
			sb.append("	}else{\n");
			sb.append("		var url = document.location+'';\n");
			sb.append("		if(url.indexOf('?')>-1){\n");
			sb.append("			if(url.indexOf('currentPage')>-1){\n");
			sb.append("				var reg = /currentPage=\\d*/g;\n");
			sb.append("				url = url.replace(reg,'currentPage=');\n");
			sb.append("			}else{\n");
			sb.append("				url += \"1&"+(entityOrField?"currentPage":"page.currentPage")+"=\";\n");
			sb.append("			}\n");
			sb.append("		}else{url += \"?"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + \"&" +(entityOrField?"showCount":"page.showCount")+"=\"+value;\n");
			sb.append("		document.location = url;\n");
			sb.append("	}\n");
			sb.append("}\n");
			
			//跳转函数 
			sb.append("function toTZ(){");
			sb.append("var toPaggeVlue = document.getElementById(\"toGoPage\").value;");
			sb.append("var showCount = document.getElementById(\"showCount\").value;");
			sb.append("if(toPaggeVlue == ''){document.getElementById(\"toGoPage\").value=1;return;}");
			sb.append("if(isNaN(Number(toPaggeVlue))){document.getElementById(\"toGoPage\").value=1;return;}");
			sb.append("if(isNaN(Number(showCount))){document.getElementById(\"showCount\").value=1;return;}");
			sb.append("nextPage(toPaggeVlue,showCount);");
			sb.append("}\n");
			
//			//回车事件
//			sb.append("function goHome(e){");
//			sb.append("var ev = window.event||e;");
//			sb.append("var showCount = document.getElementById(\"showCount\").value;");
//			sb.append("if(isNaN(Number(showCount))){document.getElementById(\"showCount\").value=1;return;}");
//			sb.append("if(e.keyCode == 13){changeCount(showCount);return;}");
//			sb.append("}\n");
			sb.append("</script>\n");

			//按钮颜色样式
			sb.append("<style>\n");
			sb.append(".pagination > li > a:hover, .pager > li > a:hover {");
			sb.append(" background-color: #459eec !important;");
			sb.append(" border-color: #EEEEEE !important;color: black;}\n");
			sb.append(".pagination > li > a, .pagination > li > span {");
			sb.append(" background-color: #ffffff !important;}\n");
			sb.append("</style>\n");
		}
		pageStr = sb.toString();
		return pageStr;
	}
	
	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}
	
	public int getShowCount() {
		return showCount;
	}
	
	public void setShowCount(int showCount) {
		
		this.showCount = showCount;
	}
	
	public int getCurrentResult() {
		currentResult = (getCurrentPage()-1)*getShowCount();
		if(currentResult<0)
			currentResult = 0;
		return currentResult;
	}
	
	public void setCurrentResult(int currentResult) {
		this.currentResult = currentResult;
	}
	
	public boolean isEntityOrField() {
		return entityOrField;
	}
	
	public void setEntityOrField(boolean entityOrField) {
		this.entityOrField = entityOrField;
	}
	
	public PageData getPd() {
		return pd;
	}

	public void setPd(PageData pd) {
		this.pd = pd;
	}
	
}
