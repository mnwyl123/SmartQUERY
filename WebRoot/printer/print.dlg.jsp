<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <!-- base href="<%=basePath%>" -->
    
    <title>打印控制台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body{
			padding:0px 5px 0 5px;
			overflow:hidden;
			font:normal normal normal 10pt Arial; 
		}
		
		fieldset {
		 	margin-top:5px;
		 	padding:0.5em;
		}
		
	</style>

	<script type="text/javascript" src="../js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="../js/jquery.selectboxes.js"></script>
	<script type="text/javascript" src="../js/json2005.js"></script>
	<script type="text/javascript" src="../js/common/common.js"></script>
	
	<script type="text/javascript">
		var inputNumber=function(e){
			if( e.which == 46 ){ // .
				if($(this).attr("value").indexOf(".") >= 0) {
					return false;
				}
			} else if(e.which == 45) { //-
				if($(this).attr("value").indexOf("-") >= 0){
				 	return false;
				}
				$(this).attr("value", "-" + $(this).attr("value"));
				return false;
	 		}
			else if( 48 > e.which || 57 < e.which ){
				return false;
			} 	
		};
		
		var fromProxy=function(){
			return dialogArguments == null;
		}
		
		var inputParams ;
		$( function() {
		    inputParams = dialogArguments;
			if(!inputParams) {
			    
			    //var params = document.location.search.substring(1,document.location.search.length);
			    //for(var i=0;i<params.length;i++){
					var paramItem = document.location.search.substring(1,document.location.search.length);//params[i];	
					var pos = paramItem.indexOf("=");
					var paramKey = paramItem.substring(0,pos);
					var paramValue = paramItem.substring(pos+1,paramItem.length);
					
					if(paramKey == "params") {
					 try{
						inputParams = JSON.parse(paramValue);
					 } catch(e){
						alert(e.message);
				      }
					}
				//}
			}
			
			try {
				var p = document.getElementsByName("printer")[0];
			    p.setUrlStr("");	
			}catch(e){
				$("#jre").css("display","block");
			}
			//alert(inputParams.partPrintPaper);
			var partPrintPaper = inputParams.partPrintPaper;
			if(!partPrintPaper) {
				if(inputParams.printSetting.paperSpec.indexOf("套打")>=0){
					partPrintPaper = inputParams.printSetting.paperSpec;
				}
			}
			
			if(partPrintPaper) {
				$("#paperSelector").addOption(partPrintPaper,partPrintPaper);
			} 
			
			$("#paperSelector").addOption("","其它...");
			
			if(inputParams.printSetting.paperSpec.indexOf("套打")>=0){
				$("#paperSelector").selectOptions(partPrintPaper);
			} else {
				$("#paperSelector").selectOptions(inputParams.printSetting.paperSpec);
			}
			$("#margin-left").val(inputParams.printSetting.margin.left);
			
			$("#margin-top").val(inputParams.printSetting.margin.top);
			$("#margin-right").val(inputParams.printSetting.margin.right);
			$("#margin-bottom").val(inputParams.printSetting.margin.bottom);
			
			$("#title").attr("checked",inputParams.printSetting.isPrintTitlePerPage);
			$("#sectionHeader").attr("checked",inputParams.printSetting.isPrintSectionTitlePerPage);
			$("#gridHeader").attr("checked",inputParams.printSetting.isPrintGridHeaderPerPage);
			$("#gridFooter").attr("checked",inputParams.printSetting.isPrintGridFooterPerPage);
			$("#pageNo").attr("checked",inputParams.printSetting.isPrintPageNo);
		
			$("input.numberEditor").keypress(inputNumber);
			
			$("#printBtn").click(function(){
			/*
				printer.setUrlStr ( window.location 
					+ "&branch=" + $("#branchSelector").selectedValues()[0]
					+ "&branchCap=" + $("#branchSelector").selectedTexts()[0].replace(/\u00a0+/,"")
					+ "&day=" + $("#publishTime").attr("value")
					+ "&ccy=" + $("#ccySelector").selectedValues()[0]
					+ "&ccyCap=" + $("#ccySelector").selectedTexts()[0])
					;
			*/
				//printer.setUrlStr ( window.location + "&" + getQueryString(params) );
				//alert(window.location + "&" + getQueryString(params) + "--" + "RegularReport?code=" + encodeURI("汉语") + "&" + getQueryString(params));
//				var idx = window.location.href.indexOf("?");
//				var urlStart = window.location.href.substring(0,idx);
//				printer.setUrlStr ( urlStart + "?code=" + encodeURI("汉语") +  "&" + getQueryString(params) );
				//alert(inputParams.url);
				var printer = document.getElementsByName("printer")[0];
				if(printer == null){
					$("#jre").css("display","block");
				}
				printer.setUrlStr ( inputParams.url );
				printer.print(
					$("#useDefault").attr("checked"),
				    $("#paperSelector").selectedValues()[0],
					$("#margin-left").val() ,//dialogArguments.printSetting.margin.left,
					$("#margin-top").val() ,//dialogArguments.printSetting.margin.top,
					$("#margin-right").val() ,//dialogArguments.printSetting.margin.right,
					$("#margin-bottom").val() ,//dialogArguments.printSetting.margin.bottom,

					inputParams.printSetting.isPagging,
					$("#pageNo").attr("checked"),
					$("#title").attr("checked"),
					$("#sectionHeader").attr("checked"),
					$("#gridHeader").attr("checked"),
					true,
					$("#gridFooter").attr("checked"),true );
				//printer.print();
				var title = document.title;
				document.title = "";
				//window.print();
				document.title = title;
				if(fromProxy()){
					window.close();
				}
			});
			
			$("#cancelBtn").click(function(){
				window.close();
			});
		});
		

	</script>
  </head>
  
  <body>
  <!--  
  	<fieldset>
    	<div><input type="checkbox" checked="true" /> 打印页码</div>
    	<div><input type="checkbox"  /> 每页打印标题</div>
    	<div><input type="checkbox" checked="true" /> 每页打印表头</div>
    	<div><input type="checkbox" checked="true" /> 每页打印表尾</div>
    	<div><input type="checkbox" checked="true" /> 每页打印列标题</div>
    </fieldset>
 --> 
    <div>
    <fieldset style="width:60%;height:13em;float:left;">
    	<LEGEND>打印设置</LEGEND>
    	<div><input id="useDefault" type="checkbox" checked="true" /> 使用默认打印机</div>
    	<div>
    		<span style="width:6em;text-align:right;">打印纸张：</span> 
    		<select id="paperSelector" style="width:15em;">
    			<% for(String name : com.dc.bicenter.frontend.report.freereport.PrintSetting.RegisterPapers){ %>
    				<option value='<%=name %>'> <%=name %></option>
    			<%} %>
    			<!--  option>其它...</option -->
    		</select>
    	</div>
    	<div>
    		<span style="width:6em;text-align:right;">左边距：</span>
    		<input class="numberEditor" id="margin-left" type="text" style="width:10em;margin-right:5px;"/>厘米
    	</div>
    	<div>
    		<span style="width:6em;text-align:right;">右边距：</span>
    		<input class="numberEditor" id="margin-right" type="text" style="width:10em;margin-right:5px;"/>厘米
    	</div>
    	<div>
    		<span style="width:6em;text-align:right;">上边距：</span>
    		<input class="numberEditor"  id="margin-top" type="text" style="width:10em;margin-right:5px;"/>厘米
    	</div>
    	<div>
    	 	<span style="width:6em;text-align:right;">下边距：</span>
    	 	<input class="numberEditor" id="margin-bottom" type="text" style="width:10em;margin-right:5px;"/>厘米
    	</div>
    </fieldset>
    
  	<fieldset style="width:30%;height:13em;float:right;">
  	   <LEGEND>打印内容控制</LEGEND>
	    <div><input id="title" type="checkbox"  /> 每页打印标题</div>
	  	<div><input id="sectionHeader"  type="checkbox" checked="true" /> 每页打印章节标题</div>
	  	<div><input id="gridHeader" type="checkbox" checked="true" /> 每页打印表头</div>
	    <div style="display:none;"><input id="gridFooter" type="checkbox"  /> 每页打印表尾</div>
	  	<div><input id="pageNo" type="checkbox" checked="true" /> 打印页码</div>
    </fieldset>
    </div>
    <div style="clear:both;margin-top:1em;">
         <input id="printBtn" style="float:right;" type="button"  value="开始打印">
	    <input id="cancelBtn" style="float:right;margin-right:1em;" type="button" value="取消" />
    </div>
    <!-- 
    <div style="margin:1em;">
	    <input id="printBtn" style="float:right;" type="button"  value="开始打印">
	    <input id="cancelBtn" style="float:right;margin-right:1em;" type="button" value="取消" />
     </div>
      -->
    <div id="jre" style="display:none;color:red;" >       
            打印功能需要安装java 客户端安装包<a href="jre-6u7-windows-i586-p.exe" >点击这里下载</a>
    </div>
    <c:import url="print.applet.jsp"  charEncoding="UTF-8"></c:import>
    
  </body>
</html>
