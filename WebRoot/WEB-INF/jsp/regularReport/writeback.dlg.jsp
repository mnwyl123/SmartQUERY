<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <!--  base href="<%=basePath%>" -->
    
    <title>回写操作</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.selectboxes.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/json2005.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/common/common.js"></script>
	
	<script type="text/javascript">
		var cur_xhr;
		var inputParams ;
		var timerId;
		$( function() {
		    inputParams = dialogArguments;
		    timerId = setInterval(doWriteback,500);
			/*
			if(inputParams) {
				var params = inputParams.params;
				for(var idx =0;idx<inputParams.rowCount;idx++) {
				    params.rowIdx = idx;
				    ajaxCall(params,function(data){
					    if( data.HeadInfo.Code == 0 ){
							if( data.DataInfo ) {
							    var old = $("#msgBoard").html();
							    $("#msgBoard").html(data.DataInfo.msg + "<br/><br/>" + old);
							} else {
								alert(data.HeadInfo.Message);
							}
						} else {
							alert(data.HeadInfo.Message);
						}
				    },false);
				    
				}
			}
			*/
			$(window).unload(function(){
				if(timerId){
					clearInterval(timerId);
				}
			});
		});
		
		var idx=0;
		
		function doWriteback(){
			if(inputParams) {
				var params = inputParams.params;
				//for(var idx =0;idx<inputParams.rowCount;idx++) {
				    params.rowIdx = idx;
				    ajaxCall(params,function(data){
					    if( data.HeadInfo.Code == 0 ){
							if( data.DataInfo ) {
							    var old = $("#msgBoard").html();
							    $("#msgBoard").html(data.DataInfo.msg + "<br/><br/>" + old);
							} else {
								alert(data.HeadInfo.Message);
							}
						} else {
							alert(data.HeadInfo.Message);
						}
				    },false);
				  idx++;
				  if(idx >= inputParams.rowCount){
				  	clearInterval(timerId);
				  }
				//}
			}
		}
		
		function ajaxCall( param , callback, async){
			if(callback) {
				ajaxPost(  "RegularReport",   //ajaxPost( "${proxyUrl}RegularReport",
					param,callback ,async);
			} else {
				alert("必须定义回调函数！");
			}
		}
		
		function ajaxPost( url, param, successCallback,async ) {
			cur_xhr =  $.ajax({
				type:"POST",
				url:url,
				cache: false,
				data:param,
				dataType:"json",
				async: async,
				success: successCallback,
				error:function(xhr,errCode,exception){
					alert("访问服务器出错！" + errCode + ":" + exception);
				}
			});
			return cur_xhr;
		}
		
	</script>
  </head>
  
  <body id="msgBoard" style="padding:5px;" >
    	<img src='images/loading.gif' />
  </body>
</html>
