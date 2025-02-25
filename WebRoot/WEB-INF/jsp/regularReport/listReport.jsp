<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>list</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath %>css/zTreeStyle.3.5/zTreeStyle.css" type="text/css">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.ztree.all-3.5.js"></script>
	
	<script type="text/javascript">
	

	
	var fileStru = ${reports};
	
	$( function() {
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		$.fn.zTree.init($("#tree"), setting, fileStru);
		
	});
	
	function layout() {
		$("#treeContainer").css("height",$("body").height() + "px");
	}
	
	
	</script>

  </head>
  	  
  <body style="position:relative;padding:20px 0 0 0;margin:0;overflow:hidden;">
  	 <div class="titleBar" style="float:left;position:relative;top:-20px;left:0;height:20px;width:100%;line-height:20px;font-size:9pt;font-weight:600;text-align:center;background-color:white;background-image:url(images/sprite_repeat_x_png.png);overflow:hidden;">表样文件</div>
  	<div id="treeContainer" style="float:left;position:relative;top:-20px;height:100%;width:100%;margin:0;padding:0;overflow:auto;">
	  	<ul id="tree" class="ztree" >
		 </ul>
  	</div>
  </body>
</html>
