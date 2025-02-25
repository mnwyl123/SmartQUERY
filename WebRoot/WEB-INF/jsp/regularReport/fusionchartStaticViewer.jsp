<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/*
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if (null != request.getAttribute("fromProxy")
			&& (Boolean) request.getAttribute("fromProxy")) {
		basePath = "bc/px/";
	}
	*/
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if (null != request.getAttribute("fromProxy")
			&& (Boolean) request.getAttribute("fromProxy")) {
		basePath = "";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计图</title>

<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.fixed.js"></script>
<script type="text/javascript" src="<%=basePath%>js/fccharts/FusionCharts.js"></script>
<script type="text/javascript" src="<%=basePath%>js/fccharts/FusionCharts.jqueryplugin.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.common.js"></script>

<script type="text/javascript">
var params = <c:out value="${params}" default="null" escapeXml="false" />;
params.ajax = 1;
params.type = '${fileType}';

function ajaxCall( param , callback, async){
	ajaxUrlCall("Chart",param,callback,async);
}

$( function() {
	ajaxCall(params,loadChartWorker);
});

function loadChartWorker(data) {
	if( data.HeadInfo.Code == 0 ){
	    if(data.DataInfo.chartCtrl == "fusionChart") {
	    	for(var chartId in data.DataInfo.chartDatas) {
		    	var dataString = data.DataInfo.chartDatas[chartId];
		    	var swfUrl = "swf/" + data.DataInfo.swfUrls[chartId];
				if($("#centerPan .FusionCharts").size() <=0 ){
					$("#centerPan").insertFusionCharts({   
						swfUrl: swfUrl, //"swf/Column3D.swf", 
						dataSource: dataString, 
						dataFormat: "xml", 
						width: "100%", height: "100%", 
						id: "myChartID"
						});
				} else {
			    	$("#centerPan").updateFusionCharts({
			    		dataSource: dataString, //"<chart caption='Weekly Sales Summary for February' showPercentValues='1'><set label='Week 1' value='26000' /><set label='Week 2' value='13200' /><set label='Week 3' value='24200' /><set label='Week 4' value='12200' /></chart>", 
			    		dataFormat: "xml"});
			    }
				break;//just support one chart
	    	}
	    } 
	} else {
		alert(data.HeadInfo.Message);
	}
}

</script>
<style>
	html,body{
		overflow:hidden;
		width:100%;
		height:100%;
		text-align:center;
		
	}
	
	#centerPan {
		overflow:hidden;
		width:90%;
		height:90%;
		margin:auto;
	}
</style>
</head>
<body>
<div id="centerPan">

</div>
</body>
</html>