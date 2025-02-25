<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/base/ui.all.css">

	<script type="text/javascript" src="<%=basePath%>js/jquery-1.3.2.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery-ui-1.7.2.custom.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.layout.js"></script>

<title>数据对比</title>
<script type="text/javascript">
if(!window.dialogArguments){
	window.dialogArguments = opener.paramsToDialog;
}
var $layout;
var timer;
var $curBrule;
var colors=["red","green","blue:white","yellow","gray","silver"];

$( function() {
	$layout = initLayout();
	$("#southPan").html(dialogArguments.msg);
	var idx=0;
	var cellColor = {};
	$(".brule a.refCell").each(function(){
		var color;
		var cell = $(this).html();
		if(cellColor[cell])
			color = cellColor[cell];
		else{
			color = colors[idx++ % colors.length];
			cellColor[cell] = color;
		}
		var cols = color.split(":");
		$(this).css("background-color" ,cols[0]);
		if(cols.length > 1) {
			$(this).css("color",cols[1]);
		} else {
			$(this).css("color","black");
		}
	});
	
	$(".brule a.rptName").click(function() {
		var alias = $(this).attr("alias");
		var url = dialogArguments.urls[alias];
		//alert(alias + "=" + url);
		var $ele = $(this).parent();
		while(!$ele.hasClass("brule")) {
			$ele = $ele.parent();
		}
		
		var idx = $ele.attr("idx");
		var info = dialogArguments.info[idx];
		
		var $frame = $(this).hasClass("r") ? $("#centerPan") : $("#westPan");
	//	var cells = $(this).hasClass("r") ? info.right[$frame.attr("rpt")] : info.left[$frame.attr("rpt")];
		
		if($frame.attr("rpt") != alias) {
			//alert($frame.attr("id"));
			$frame.attr("src","wait.html");
			$frame.attr("rpt",alias);
			naviHref($frame.attr("id"),url);
		}
	});
	
	$(".brule").hover(function(){
			$(this).css("background-color","lightblue");
		},function(){
			$(this).css("background-color","");
		}).click(function(){
			if($curBrule){
				$curBrule.css("border","solid 1px silver");//reset
			}
			$(this).css("border","solid 1px red");
			$curBrule = $(this);
			onTimer();
			/*
			var idx = $(this).attr("idx");
			var info = dialogArguments.info[idx];
			var cells = info.left[$("#westPan").attr("rpt")];
					
			hilightCells(cells,"westPan","red");
			cells = info.right[$("#centerPan").attr("rpt")];
			hilightCells(cells,"centerPan","blue");
			/*
			var params = {};
			var cells = info.left[$("#westPan").attr("rpt")];
			for(var i=0;i<cells.length;i++) {
				params[cells[i]] = "red";
			}
			frames["westPan"].window.doHighlightCells(params);
			*/
		});
	
	$(window).resize(function(){	
		$layout.resizeAll();
	});
	
	var left = {};	
	var right = {};
/*
	$.each(dialogArguments.urls, function(key,val){
		if(dialogArguments.info[0].left[key]){
			left.url = val;
			left.alias = key;
		} 
		if(dialogArguments.info[0].right[key]){
			right.url = val;
			right.alias = key;
		}
	});
	if(right.url == "") {
		right.url = left.url;
	}
*/
	left.alias = $(".brule a.rptName.l").attr("alias");
	//alert(left.alias + "  = " + dialogArguments.urls[left.alias]);
	left.url = dialogArguments.urls[left.alias];
	right.alias = $(".brule a.rptName.r").attr("alias");
	right.url = dialogArguments.urls[right.alias];
	
//	alert(right.url +"===========" + left.url);
	$("#westPan").attr("rpt",left.alias);//.attr("src",left.url);
	naviHref("westPan", left.url);
	$("#centerPan").attr("rpt",right.alias);//.attr("src",right.url);
	naviHref("centerPan" , right.url);
	timer = setInterval(onTimer,1000);
});

function naviHref(frameId,href) {
	if(frames[frameId].window){
		frames[frameId].window.location.href = href;
	} else {
		frames[frameId].contentWindow.location.href = href;
	}
}

function onTimer() {
	if($curBrule) {		
		try{
			var idx = $curBrule.attr("idx");
			var info = dialogArguments.info[idx];
			var cells = info.left[$("#westPan").attr("rpt")];	
			hilightCells(cells,"westPan","red");
			cells = info.right[$("#centerPan").attr("rpt")];
			hilightCells(cells,"centerPan","blue");
		} catch(e) {
			//ignore
		}
	}
}

function initLayout(){
	var w = $(window).width();
	var layout = $('body').layout({
		center: {
			
		},
		west: {
			size:w/2,
			resizable:true,
			closable: false,	
			slidable:false
		/*
			closable: false,
			resizable:false,
			spacing_open: 0
			*/
		},
		south: {
			initHidden:false,
			//spacing_open: 0,
			size:100, //'auto',
			//minSize:25,
			resizable:true
		}
	} );
	
	return layout;
}

function getHighlightCells($brule,$frame) {
	var idx = $brule.attr("idx");
	var info = dialogArguments.info[idx];
	var cells = info.left[$frame.attr("rpt")];
	return cells;
}

function hilightCells(cells, frameId, color) {
	var params = {};
	
	for(var i=0;i<cells.length;i++) {
		var $cell = $(".brule a.refCell[rpt=" + $("#" + frameId).attr("rpt") + "][coo='"+cells[i]+"']");
		params[cells[i]] =$cell.css("background-color") + ":" + $cell.css("color");
		
	//alert(cells[i] + "=" + params[cells[i]]);
	}
	var win = frames[frameId].window;
	if(!win){
		win= frames[frameId].contentWindow;
	}
	if(!win.doHighlightCells) {
		if(timer) {
			clearTimeout(timer);
		}
		timer = setTimeout(hilightCells(cells,frameId,color),1000);
	} else {
		win.doHighlightCells(params);
	}
}

</script>

<style type="text/css">
.brule {
		display:inline-block;
	 	border:solid 1px silver;
	 	margin:0.5em;
	 	padding:0.5em;
	 	font-size:9pt;
	}

.brule span.exprRelation {
	margin:0 1em 0 1em;
}
	
.brule a.rptName{
		margin-left:1em;
	}
	
.brule a.rptName:hover,
.brule a.refCell:hover{
		color:blue;
		cursor:pointer;
	}
</style>

</head>
<body>
	<iframe id="centerPan" class="ui-layout-center" frameBorder="0" border="0" src="wait.html"></iframe>
<!--  	<div id="northPan" class="ui-layout-north" ></div> -->
	<iframe id="westPan" class="ui-layout-west"  frameBorder="0" border="0" src="wait.html"></iframe>
	<div id="southPan" class="ui-layout-south" style="height:150px;padding:0;margin:0;overflow:auto;white-space:nowrap;">			
	</div>
</body>
</html>