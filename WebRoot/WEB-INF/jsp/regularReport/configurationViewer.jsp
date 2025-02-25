<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if (null != request.getAttribute("fromProxy")
			&& (Boolean) request.getAttribute("fromProxy")) {
		basePath = "";
	}
%>

<html>
<head>
<title>配置界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/knacss.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/ui.1.10/base/jquery.ui.all.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/zTreeStyle.3.5/zTreeStyle.css">



<script type="text/javascript" src="<%=basePath%>js/json2005.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.9.1.fixed.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.common.js"></script>


<style type="text/css">
html {
overflow-x: hidden;
}

body: {
	color:#003366;
}

table {
	font-size: 12px;
	table-layout: auto;
	border: none;
	margin: 0;
}

.CONFIG_TITLE{font-size: 16px}
.CHD_TITLE {font-size: 16px}
.FONT_BTN {
	font-size: 14px;
	color: #0000FF;
	font-weight: bold;
	cursor:pointer;
}
.CFG_INFO {
	color: #FF0000;
	font-size: 14px;
}
.DIV_CONFIG {
	width: 100%;
	padding-left: 30px;
	padding-right: 30px;
}
.TABLE_CONFIG {
	width: 100%;
	border:1px solid #666666;
}


div.zTreeDemoBackground {
	width: 250px;
	height: 362px;
	text-align: left;
}

ul.ztree {
	margin-top: 10px;
	border: 1px solid #617775;
	background: white;
	width: 220px;
	height: 360px;
	overflow-y: scroll;
	overflow-x: auto;
}

a.treeOp {
	margin-left: 0.5em;
	margin-right: 0.5em;
	float: right;
}

ul.ztree.onelevel li {
	list-style-type: none;
	padding-left: 3px;
}

ul.ztree.onelevel li span.button.switch {
	display: none;
}

#overlay {
    background: #000;
    filter: alpha(opacity=50); /* IE的透明度 */
    opacity: 0.5;  /* 透明度 */
    display: none;
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    z-index: 100; /* 此处的图层要大于页面 */
    display:none;
    background-position:center center;
    overflow:hidden;
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	$("p[id^='p_']").each(function(i, val){
		var div_id = "div"+this.id.substring(1, this.id.length);
		var img_id = "img"+this.id.substring(1, this.id.length);
		$(this).bind("click", {"p_id": this.id,"div_id": div_id,"img_id": img_id}, hideConfig);
	});
});

function ajaxCall( param , callback, async){
	ajaxUrlCall("RegularReport",param,callback,async);
}

var setting={
	check: {
		enable: false
	},
	data:{
		simpleData:{
			enable: true,
			idKey: "id",
			pIdKey: "pId"
		}
	}
};

function checkConfig(buttonType, name){
	showOverlay();
	ajaxCall("op=checkConfig&ajax=1&cfgType="+buttonType+"&cfgName="+name, function(data){
		hideOverlay();
		if(!data || !data.DataInfo)
			return;
		
		if(data.DataInfo.resultType == data.DataInfo.textType){
			if(data.DataInfo.isPass){
				disableButton("bt_"+buttonType+"_"+name	);
				$('#'+buttonType+'_'+name).css("color","green");
			}
			$('#'+buttonType+'_'+name).html(data.DataInfo.content);
		}else if(data.DataInfo.resultType == data.DataInfo.treeType){
			if(data.DataInfo.isPass){
				disableButton("bt_"+buttonType+"_"+name	);
				var treeNodes = data.DataInfo.content;
				var width = $('#td_'+buttonType+'_'+name).width();
				var height = $('#td_'+buttonType+'_'+name).height();
				$('#'+buttonType+'_'+name).after("<div style='width:"+width+"px;height:"+height+"px'><ul id='ztree_"+name+"' class='ztree' style='margin-top:0; padding:0; width:"+width+"; height: "+height+";'  ></ul></div>");
				$.fn.zTree.init($('#ztree_'+name), setting, treeNodes);
			}else{
				$('#'+buttonType+'_'+name).html("未查到或没有权限");
			}
		}else{
			$('#'+buttonType+'_'+name).html(data.DataInfo.content);
		}
	}, true);
}

function ajaxCall( param , callback, async){
	ajaxUrlCall("RegularReport",param,callback,async);
}

function disableButton(id){
	$("#"+id).attr("onclick","");
	$("#"+id).css({"color":"#ABABAB","cursor":""});
}
	
	
/* 显示遮罩层 */
function showOverlay() {   
    $("#overlay").height(pageHeight());
    $("#overlay").width(pageWidth());
    
	var $container = $(window).height() > 100 ? $(window) : $("body");	
	$("#overlay div").css("padding-top",$container.height()*2/5);
    
    // fadeTo第一个参数为速度，第二个为透明度
    $("#overlay").fadeTo(200, 0.5);
}

function hideOverlay() {
    $("#overlay").fadeOut(200);
}

function pageHeight() {
    return document.body.scrollHeight;
}

function pageWidth() {
    return document.body.scrollWidth;
}

function showConfig(event){
	$("#"+event.data.img_id).attr("src", "<%=basePath%>css/base/images/arrow_d.gif");
	$("#"+event.data.div_id).slideToggle("slow", function(){
		$("#"+event.data.p_id).unbind();
		$("#"+event.data.p_id).bind("click", {"p_id": event.data.p_id,"div_id": event.data.div_id,"img_id": event.data.img_id}, hideConfig);
	});
}

function hideConfig(event){
	$("#"+event.data.div_id).slideUp("slow", function(){
		$("#"+event.data.img_id).attr("src", "<%=basePath%>css/base/images/arrow_r.gif");
		$("#"+event.data.p_id).unbind();
		$("#"+event.data.p_id).bind("click", {"p_id": event.data.p_id,"div_id": event.data.div_id,"img_id": event.data.img_id}, showConfig);
	});
}

	

</script>

</head>

<body style="width: 100%; height: 100%;">

	<div id="overlay">
		<div style="padding-left: 50%; text-align: center; position: fixed; ">
		<img src="<%=basePath%>images/loading.gif" ></div>
	</div>

	<c:forEach items="${dc.childConfigurations}" var="configList" >
		<p id="p_${configList.title }" style="cursor: pointer;" class="CONFIG_TITLE"><strong>${configList.title }</strong>&nbsp;
		<img id="img_${configList.title }" src="<%=basePath%>css/base/images/arrow_d.gif"></p>
		
		<div id="div_${configList.title }" class="DIV_CONFIG">
			<c:forEach items="${configList.childConfigurations}" var="chdConfig" >
			<table class='TABLE_CONFIG'>
				<c:if test="${chdConfig.title != null }">
					<tr>
				      	<th colspan="2" align="left"><div  class="CHD_TITLE">${chdConfig.title }</div></th>
					    <c:choose>
					    <c:when test="${chdConfig.showButton }">
					      	<td colspan="2" align="left" >
					      		<span class="FONT_BTN">
					      			<u id="bt_${chdConfig.buttonType}_${chdConfig.title}" onclick="checkConfig('${chdConfig.buttonType}','${chdConfig.title}')">${chdConfig.buttonText }</u>
					      		</span>
					      	</td>
					      	<td width="280" rowspan="20" align="center" id="td_${chdConfig.buttonType}_${chdConfig.title}"><span id="${chdConfig.buttonType}_${chdConfig.title}" class="CFG_INFO" ></span></td>
					      </c:when>
					      <c:otherwise>
					      	<td colspan="2" align="left" >&nbsp;</td>
					      	<td width="280" rowspan="20" align="center" >&nbsp;</td>
					      </c:otherwise>
					      </c:choose>
				      </tr>
				</c:if>
				<c:forEach items="${chdConfig.properties}" var="property" varStatus="status">
					<tr>
				      <th width="100"  align="left">${property.keyName }</th>
				      <td>${property.value }</td>
				      <td width="150" >
				      	<c:if test="${property.showComment}">
				      		<c:if test="${property.commentType == 'E'}">
				      			<img src="<%=basePath%>images/delete.gif" alt="" width="16" height="16" align="middle"/>
				      		</c:if>
				      		<c:if test="${property.commentType == 'W'}">
				      			<img src="<%=basePath%>images/warning16.gif" alt="" width="16" height="16" align="middle"/>
				      		</c:if>
				      		<span>${property.comment}</span>
				      	</c:if>
				      </td>
				    <c:if test="${status.index == 0 && chdConfig.title == null}">
				    <c:choose>
				    <c:when test="${chdConfig.showButton }">
				      	<td width="40" rowspan="20" align="left" >
				      		<span class="FONT_BTN">
				      			<u id="bt_${chdConfig.buttonType}_${chdConfig.title}" onclick="checkConfig('${chdConfig.buttonType}','${chdConfig.title}')">${chdConfig.buttonText }</u>
				      		</span>
				      	</td>
				      	<td width="280" rowspan="20" align="center" id="td_${chdConfig.buttonType}_${chdConfig.title}"><span id="${chdConfig.buttonType}_${chdConfig.title}" class="CFG_INFO" ></span></td>
				      </c:when>
				      <c:otherwise>
				      	<td width="40" rowspan="20" align="left" >&nbsp;</td>
				      	<td width="280" rowspan="20" align="center" >&nbsp;</td>
				      </c:otherwise>
				      </c:choose>
				    </c:if>
					</tr>
				</c:forEach>
			</table><br/>
			</c:forEach>
		</div>
	</c:forEach>
	
</body>

</html>
