<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page session="false"%>
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

<html>
<head>
<!--  base href="<%=basePath%>" -->
<title>报表视图</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/knacss.css">

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/base/hideInput/page.css">


<!--  link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/styles.css" -->

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/base/hideInput/operateArea.css">


<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/base/hideInput/regularReportGrid.css">

<!-- link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/base/dataGridStyles.css" -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/base/hideInput/inputPanel.css">

<!--  link rel="stylesheet" type="text/css" href="<%=basePath%>css/table.css" -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/ui.1.10/base/jquery.ui.all.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/zTreeStyle.3.5/zTreeStyle.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/base/jquery.autocomplete.css">

<!-- customer define skin -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/${skin}regularReportGrid.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/${skin}inputPanel.css">
<!-- customer define skin end -->
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="<%=basePath%>js/json2005.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.9.1.fixed.js"></script>
<!--[if lte IE 6]>  
	   
<![endif]-->
<!--  
<script type="text/javascript"
	src="<%=basePath%>js/jquery-ui-1.8.24.custom.js"></script>
-->
<script type="text/javascript"
	src="<%=basePath%>js/jquery-ui.min-1.10.2.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jtip.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.autocomplete.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.selectboxes.js"></script>

<script type="text/javascript"
	src="<%=basePath%>js/fccharts/FusionCharts.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/fccharts/FusionCharts.jqueryplugin.js"></script>

<script type="text/javascript" src="<%=basePath%>js/dateSelect.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>js/graphics.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.common.js"></script>
<script type="text/javascript" src="<%=basePath%>js/commander.js"></script>
<script type="text/javascript" src="<%=basePath%>js/swfobject.js"></script>

<%@ include file="../system/index/top.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	top.hangge();
});
//alert("<%=request.getSession().getId()%>");
//alert(document.cookie);

var printerUrl= "<%=basePath%>printer/printApplet.jar";
var usePrintDlg = true;
var curDataPage=0,curDataSection=0;

var aal=<c:out value="'${aal}'" default="null" escapeXml="false" />;
var smagic='${smagic}';

var highlightCells = <c:out value="${highlightCells}" default="null" escapeXml="false" />;
var canDoEdit=<c:out value="${canDoEdit}" default="null" />;
var canDoAuditEdit=<c:out value="${canDoAuditEdit}" default="null" />;
var partPrintPaper="${partPrintPaper}";
var runInFintelligen = ${runInFintelligen};
var fintelligenVer = "${fintelligenVer}";
var needAuth = <c:out value="${needAuth}" default="false" />;
var params = {
		ajax:1,
		<c:forEach items="${extraParams}" var="item">
			<c:if test="${item.key!=''}">${item.key}:'${item.value}',</c:if>
		</c:forEach>
		type:'${fileType}'
		};
var staticView=<c:out value="${staticView}" default="false" />;
var maskCount = 0;
var timer;
var needRelayout = false;
var commentShowTime = <c:out value="${commentShowTime}" default="0" /> / 0.5;

var reportId = "${reportId}";
${partPrintSetting};

var printSetting = {
	paperSpec:'${printSetting.paperSpec}',
	margin: {
		left:${printSetting.marginSetting.left},
		top:${printSetting.marginSetting.top},
		right:${printSetting.marginSetting.right},
		bottom:${printSetting.marginSetting.bottom}
	},
	isPagging:${printSetting.pagging},
	isPrintTitlePerPage:${printSetting.printTitlePerPage},
	isPrintSectionTitlePerPage:${printSetting.printSectionTitlePerPage},
	isPrintGridHeaderPerPage:${printSetting.printGridHeaderPerPage},
	isPrintGridColHeaderPerPage:${printSetting.printGridColHeaderPerPage},
	isPrintGridFooterPerPage:${printSetting.printGridFooterPerPage},
	isPrintPageNo:${printSetting.printPageNo}
};

var validDefs = [
	<c:forEach items="${validDefs}" var="def">
	{ 
		cellCoordinate: "${def.cellCoordinate}",
		expression: [
			${def.expressionsJsonArray}
		],
		refs:[ 
			${def.refsJsonArray}
		]
	},
	</c:forEach>
];

var editableCells = [
<c:forEach items="${editableCells}" var="cell">"${cell}",</c:forEach>
];

var editableCellPatterns = [
<c:forEach items="${editableCellValidatePatterns}" var="cell">"${cell}",</c:forEach>
];

var editableCellDefs = [
<c:forEach items="${editableCellDefs}" var="cell">"${cell}",</c:forEach>
];



var autocompletes = <c:out value="${autocompletes}" default="{}" escapeXml="false"/>;
var znodeses = <c:out value="${znodeses}" default="{}" escapeXml="false"/>;

var originalVals = <c:out value="${originalVals}" default="null" escapeXml="false" />;
var modifyDraftVals = <c:out value="${modifyDraftVals}" default="null"  escapeXml="false"/>;
var modifyDraftComments = "${modifyDraftComments}";

var prevClickTime = null;

function fromProxy() {
	return ${fromProxy};
}

function getPrintUrl() {
	var idx = window.location.href.indexOf("?");
	var urlStart = window.location.href.substring(0,idx);
	var url = urlStart + "?_code=" + encodeURI("汉语") +  "&" + getQueryString(params);
	return url;
}

//Figure out if the W3C box model works as expected  
//document.body must exist before we can do this  
var boxModel = null ;
function isW3CBox(){  
	if(boxModel != null) {
		return boxModel;
	}
	 var div = document.createElement("div");  
	 div.style.width = "1px";  
	 div.style.paddingLeft = "1px";  
	 document.body.appendChild( div );  
	 boxModel = div.offsetWidth === 2;  
	 document.body.removeChild( div );
	 return boxModel;
}

function getDocHeight() {
    var D = document;
    return Math.max(
        D.body.scrollHeight, D.documentElement.scrollHeight,
        D.body.offsetHeight, D.documentElement.offsetHeight,
        D.body.clientHeight, D.documentElement.clientHeight
    );
}

function isChartView() {
	return window.location.href.indexOf("Chart?") > 0;
}

var currentTab = null;
var timeTiker = 0;
var windowSize = {x:0,y:0}; 
function timerCallback() {
	var $container = $(window).height() > 100 ? $(window) : $("body");	
	if($container.height() != windowSize.y || $container.width() != windowSize.x) {
		initLayout($container);
	//	alert("initalyout " + $("body").height() + " window " + $(window).height() + "  doc " + getDocHeight());
		windowSize.y =$container.height();
		windowSize.x = $container.width();
		alignInputCtrls();
	}
	timeTiker++;
	if(timeTiker % 50 == 0) {
		downloadMoni();
	}
	if (currentTab) {
		//var $tab = $(".toolbar li.tab[panel=" + currentTab + "]");
		var hasSelect = false;
		$(".toolbar li.tab")
				.each(
						function() {
							if ($(this).attr("panel") == currentTab) {
								$(this).addClass("selected");
							} else {
								$(this).removeClass("selected");
							}
						});

		$(".tabPanel").each(function() {
			if ($(this).attr("id") == currentTab) {
				$(this).css("display", "block");
			} else {
				$(this).css("display", "none");
			}
		});
		//			$("#" + currentTab).css("display", "block");
	} else {
		$(".toolbar li.tab").removeClass("selected");	
		if($(".tabPanel:visible").size() > 0){
			closeTab();
		}
	}
}

function closeTab() {
	$(".tabPanel").css("display", "none");
	$(".toolbar li.tab").css("width", "").css("background-color", "")
			.css("padding-left", "").children().css("display","none");//.html("");
}

function initOperateArea() {
	$(".toolbar li.tab").hover(function() {
		/*
		$(this).css("width", "180px").css("background-color",
				"black").css("color", "white").css("padding-left",
				"35px").css("margin-left", "5px").text(
				$(this).attr("title"));
		$("#" + $(this).attr("panel")).css("display", "block");
		mouseleaveTime[$(this).attr("panel")] = null;
		 */
		currentTab = $(this).attr("panel");
	}, function() {
		/*
		if ($("#" + $(this).attr("panel")).css("display") == "none") {
			$(this).css("width", "").css(
					"background-color", "").css(
					"padding-left", "").text("")
		}*/
		//mouseleaveTime[$(this).attr("panel")] = (new Date())
		//		.getTime();
		currentTab = null;
	});
	
	$(".toolbar li.cmd").hover(function() {
		$(this).addClass("hover");//.css("background-color", "silver");
	}, function() {
		$(this).removeClass("hover");//.css("background-color", "transparent");
	});
	
	$(".toolbar li.tab").click(function(){ 
		currentTab = $(this).attr("panel");
		timerCallback();
		if(currentTab == "inputPanel") {
			try{	
				$("#inputPanel input,#inputPanel select").get(0).focus();
			} catch(e) { 
				//ignore; 
			}
		}
	});
	
	var lastFocus = null;
	
	$("#inputPanel :input").focus(function(){
		lastFocus = this;
	});
	
	
	$("#inputPanel").click(function(){
		var focusOn = false;
		if( document.activeElement != null) {
			//var focusId = $(document.activeElement).attr("id");
			
			$("#" + $(this).attr("id") + " :input").each(function(){
				//if(focusId && $(this).attr("id") == focusId) {
				if(document.activeElement == this) {
					focusOn = true;
				}
			});
		}
		if(!focusOn) {
			if(lastFocus != null) {
				try{
					lastFocus.focus();
				} catch(e){}
			} else {
				try{
					$("#inputPanel input,#inputPanel select").get(0).focus();
				} catch(e){}
			}
		}
	});

	$(".tabPanel").hover(
			function() {
				var panelId = $(this).attr("id");

				//mouseleaveTime[panelId] = null;
				$(".toolbar li.tab").each(
						function() {
							if ($(this).attr("panel") != panelId) {
								$(this).css("width", "").css(
										"background-color", "").css(
										"padding-left", "");//.text("");
							}
						});
				currentTab = panelId;
			}, function() {
				
				if($(".menuContent:visible").size() > 0) {
					return;
				}
				
				var focusOn = false;
				if( document.activeElement != null) {
					//var focusId = $(document.activeElement).attr("id");
					
					$("#" + $(this).attr("id") + " :input").each(function(){
						//if(focusId && $(this).attr("id") == focusId) {
						if(document.activeElement == this) {
							focusOn = true;
						}
					});
				}
				
				if(!focusOn) {
					currentTab = null;
				}
			});
	
	$(".fileList li").hover(function(){
		$(this).css("background-color","darkgray");
	},function(){
		$(this).css("background-color","");
	});
	
	$("#prevPageBtn,#nextPageBtn,#firstPageBtn,#lastPageBtn").click(function(event){
		event.stopPropagation();
		var uuid = $("#regularReportViewer").attr("uuid");
		var newParams = $.extend({}, params,{op:"view",page:$(this).attr("page"),section:$(this).attr("section"), uuid:uuid});
		refreshReport(null, newParams);
		return false;
	});
	
	$("#gotoPageBtn").click(function(event){
		event.stopPropagation();
		/*
		var pageNo = $("#gotoPage").val();
		if($.trim(pageNo) == ""){
			alert("请录入页码！");
			return false;
		}
		params.op = "view";	
		params.page = pageNo - 1; //$("#gotoPage").attr("value") - 1;
		params.section = "all";
		refreshReport();						
		*/
		doGotoPage();
		return false;
	});
	
	$("#gotoPage").keyup(function(event){
		if(event.keyCode == 13) {
			doGotoPage();
		}
	});

}
			
function doGotoPage() {
	var pageNo = $("#gotoPage").val();
	if($.trim(pageNo) == ""){
		alert("请录入页码！");
		return false;
	}
	params.op = "view";	
	params.page = pageNo - 1; //$("#gotoPage").attr("value") - 1;
	params.section = "all";
	params.uuid = $("#regularReportViewer").attr("uuid");
	refreshReport();		
}

function abortLoading(){
	if( cur_xhr ){
		    //alert("do cancel");
			cur_xhr.abort();
	}
	unmask();
}




$( function() {

	if(document.documentMode >= 9) {
		$("body").addClass("docMdIE9u");
	} else {
		$("body").addClass("docMdIE8d");
	}

	if($.fn.pngFix) {
		$(document).pngFix();
	}
	initOperateArea();
	initDependsInputControls();
	$("body").click(function(){
		$("#JT").remove();
	});

	for(var key in autocompletes){
		var maxlen = 6;
		for(var i=0;i<autocompletes[key].length;i++){
			maxlen = autocompletes[key][i][0].length>maxlen ? autocompletes[key][i][0].length : maxlen;
		}
//		alert(maxlen);

		$("#"+key).autocomplete(autocompletes[key],{
			minChars: 0,
			max: 150,
			autoFill: false,
			mustMatch: true,
			matchContains: false,
			scroll: true,
			scrollHeight: 350
		}).css("width",maxlen + "em");

	}	
	
	initMultiSelect();
		
	initDateSelect();

	initCalendarControl();	
	
	if(${hideInput}) {
		$(".inputPanel").css("display","none");
	} else {
		disableCtrls();
	}
	
	//$layout = initLayout();
	
	hookParamsChange();
	
	$("body").keyup(function(event){
		if(27 == event.keyCode) {  //esc
			restoreParams(params);
			if($("table.regularTable").size() > 0) {
				enableRefreshBtn(true);
			}
		}
	});
	/*
	$("#buttonPanel input[type=button]").click(function(){
		if(prevClickTime && )
		alert($(this).attr("id"));
		onCommand($(this).attr("id"));
	});
	*/
	/*
	$("#commentsCtrl").hover(function(){
		showCommentsPan(true);
	},function(){
		showCommentsPan(false);
	});
	*/
	
	$(".cmd").click(function(){
		var r = onCommander($(this).attr("id"));	
		if(r != null) {
			//alert("return");
			return r;
		}
	});
	
	$("#commentsPan").draggable();
	
	$("#commentsCtrl").click(function(){
		showCommentsPan(true);
	});
	
	$("#commentsPan .close").click(function() {
		showCommentsPan(false);
	});
	
	$("#accessCtrlBtn").click(function(){
		var idx = window.location.href.indexOf("?");
		var urlStart = window.location.href.substring(0,idx);
		var type = "${param._type}";
		if( type == null || type=="") {
			type = "${param.type}";
		}
		var page = urlStart + "?_op=accessCtrl&_type=" + type;
		//open(page);
		showModalDialog(page, "",  "dialogWidth:600px;dialogHeight:450px;resizable:yes;center:yes;");
	});

	$("#cancelBtn").click(function(){
		abortLoading();
/*
		if( cur_xhr ){
   		    //alert("do cancel");
   			cur_xhr.abort();
		}
		unmask();
*/
	});
	
	$("#viewReportBtn").click(function(){
		$("#downloading").addClass("hide");
		queryReport();
		currentTab = null;
		closeTab();
		return;
	});
	
	$("#resetBtn").click(function(){
			closeTab();
	});
	
/*	
	$("#refreshReportBtn").click(function(){
		if( !validateInputs() ) {
			return;
		}
		if( confirm("刷新操作将清除报表缓存，重新查询数据库，这可能会给数据库服务器带来不必要的负荷，继续么？") ){
			collectParams(params);
			doRefreshReport();
		}
	});
*/	
	$("#refreshChartBtn").click(function(){	
		if( !validateInputs() ) {
			return;
		}
		if( confirm("刷新操作将清除报表缓存，重新查询数据库，这可能会给数据库服务器带来不必要的负荷，继续么？") ){
			doRefreshChart();
		}
	});
	
	$("#viewChartBtn").click(function(){
		queryChart();	
		currentTab = null;
		closeTab();
	});
	
	
	
	
	$("#validBtn").click(function(){
	    cellValidate();
		/*
		collectParams(params);
		params.op = "validate";
		ajaxCall(params, 
		function(data) {
			if( data.HeadInfo.Code == 0 ){
				if( data.DataInfo ) {
					
				} else {
					alert(data.HeadInfo.Message);
				}
			} else {
				alert(data.HeadInfo.Message);
			}
		});
		*/
	});
	
	initAuditEditPanel();
	initEditPanel();
		
	$("#chartButton").click(function(){
		
		var url = "?op=chart&_code=" + encodeURI("汉语") +  "&" + getQueryString(params);
		url = url.replace(/ajax=[^&]/,"");
		var idx = window.location.href.indexOf("?");
		var urlStart = window.location.href.substring(0,idx);
		url = urlStart + url; 
		//alert(url);
		var sFeatures="dialogHeight:400px;dialogWidth:550px;center:true;status:no;resizable:yes;";
		showModalDialog(url,"",sFeatures);
		//showModalDialog("printer/print1.dlg.jsp", dlgParams,  sFeatures);
	});
	
/*	
	$("#printBtn").click(function(){
		print();
	});
	
	$("#exportExcellBtn").click(function(){
		var option = "left=0,top=0,status=yes,resizable=yes,toolbar=no,menubar=yes,location=yes,scrollbars=yes";
		params.op = "view";
		var url = "RegularReport?_code=" + encodeURI("汉语") + "&" + getQueryString(params)
		  +"&exportType=xls";
	    if(url.indexOf("${proxyUrl}")!=0){
	 //   	url = "${proxyUrl}?target=" + encodeURI(url.replace(/&/g,"^"));
	    }
//		   alert(url);
//		var url = "RegularReport?type=" + encodeURI(params.type) + "&code=" + encodeURI("汉语") + "&" + getQueryString(params)
//		  +"&exportType=xls";
		  
		//var url = "servlet/DownloadServlet&exportType=xls"			
		//		+"&enging=exportRegular"
		//		+"&" + document.location.search
		//		+"&" + getQueryString();
		//window.open("opencontrol.jsp?action=" + url,"",option,false);
		window.open(url,"123",option,false);
	});
	
	$("#exportPdfBtn").click(function(){
		var option = "left=0,top=0,status=yes,resizable=yes,toolbar=no,menubar=yes,location=yes,scrollbars=yes";
		params.op = "view";
		var url = "RegularReport?_code=" + encodeURI("汉语") + "&" + getQueryString(params)
		  +"&exportType=pdf";
		if(url.indexOf("${proxyUrl}")!=0){
//	    	url = "${proxyUrl}?target=" + encodeURI(url.replace(/&/g,"^"));
	    }  
//		var url = "RegularReport?type=" + encodeURI(params.type) + "&code=" + encodeURI("汉语") + "&" + getQueryString(params)
//		  +"&exportType=pdf";
		//  alert(url);
		//var url = "servlet/DownloadServlet&exportType=xls"			
		//		+"&enging=exportRegular"
		//		+"&" + document.location.search
		//		+"&" + getQueryString(params);
		//window.open("opencontrol.jsp?action=" + url,"",option,false);
		window.open(url,"",option,false);
	});
*/

	$("#coordinRadio").click(function(){
		$(this).attr("checked",!$(this).attr("checked"));
	});
	
	$("a.dataNavi").click(dataNaviClick);
	
	
	$(window).resize(function(){
		//$layout.resizeAll();
		drawTopLeftCell();
//		alignInputCtrls();
	}).bind('beforeunload', function(){
//		alert("close");
		abortLoading();
	});
	
	
	updateUI();
	
	initSwf();
	
	alignInputCtrls();
	
	if(aal && aal == 'queryreport') {
		if(isChartView()) {
			queryChart();
		} else {
			queryReport();
		}
	} else {	
		if($("#inputTab").size() > 0 && $(".regularTable").size() <= 0) {
			currentTab = "inputPanel";
		}
	}
	initTimer();
	
	var viewStaticPageByAjax = "${viewStaticPageByAjax}";
	if(viewStaticPageByAjax){
		queryReport();
	}
	
	
} )
/*
function syncInputArea() {
	var params = document.location.search;
	var paramArray = splitUrl(params);
	for(var index = 0 ; index < paramArray.length ; index++) {
		var paramItem = paramArray[index];	
		var pos = paramItem.indexOf("=");
		var paramKey = paramItem.substring(0,pos);
		var paramValue = paramItem.substring(pos+1,paramItem.length);
		$("input.paramInput[type=text,var="+paramKey+"]").val(paramValue);	
	}
}
*/

function initTimer() {
//	timer = setInterval(onTimer,500);
	timer = window.setInterval(timerCallback, 100);
}


function onTimer() {
	relayoutIfNeed();

	if(autoShowComments) {
		if(commentShowTime > 0) {
			commentShowTime--;
		} else {
			showCommentsPan(false);
			autoShowComments = false;
		}
	}
}



function relayoutIfNeed() {
	//alert($("body").height());
	//alert($layout.state.container.innerHeight);
	//alert($layout.state.north.size);
	if($("body").height() > 0 ){
		if(needRelayout == true) {
			//alert($("span[resizer]").size());
			$("span[resizer]").remove();
			$layout = initLayout();
			//alert($("#northPan").height());
			//$layout.resizeContent("north");
			//$layout.resizeContent("center");
			//$layout.open("north");
			needRelayout = false;
			//$layout.sizePane("north",$("#northPan").height());
			//alert($layout.state.north.size);
		}
	} 
}

function queryReport() {
	if( !validateInputs() ) {
		return;
	}
	
	collectParams(params);
	if(!doAuth()) {
		return;
	}
	/*
	params.op = "view";
	params.page = 0;
    params.section = 0;
	refreshReport();
	*/
	
	if( <c:out value="${discardCache}" default="false" /> ) {
		doRefreshReport();
	} else {
		doViewReport();
	}
	/*
	if( commentShowTime > 0 ) {
		showCommentsPan(true);
		autoShowComments = true;
	}
	*/
}

function queryChart() {
	if( !validateInputs() ) {
		return;
	}
			
	collectParams(params);
	if(!doAuth()) {
		return;
	}
//	closeTab();

	/*
	params.op = "view";
	params.page = 0;
	params.section = 0;
	refreshChart();
	*/
	if( <c:out value="${discardCache}" default="false" /> ) {
		doRefreshChart();
	} else {
		doViewChart();
	}
}

function print() {
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
	var idx = window.location.href.indexOf("?");
	var urlStart = window.location.href.substring(0,idx);
	var uuid = $("#regularReportViewer").attr("uuid");
	var url = "?_code=" + encodeURI("汉语") +  "&" + getQueryString(params) + "&" + "uuid=" + uuid;
	if(fromProxy()){
		//url = "${proxyUrl}?target=RegularReport" + encodeURI(url.replace(/&/g,"^"));
		url = urlStart + url + "&target=RegularReport";//"<%=basePath%>RegularReport" + url;
	} else  {		
//		url = urlStart + "Print" + url;
		url = urlStart + url;
	}
	var dlgParams = {};

	dlgParams.url = url;
	dlgParams.smagic = smagic;
	dlgParams.magicid = "${magicid}";
	dlgParams.printSetting = printSetting;
	dlgParams.partPrintPaper = (partPrintPaper=="" ? null : partPrintPaper);
	dlgParams.printerUrl = printerUrl;
	dlgParams.curDataPage = curDataPage;
	dlgParams.curDataSection = curDataSection;
	//alert(partPrintPaper + "==" + dlgParams.partPrintPaper);
	var sFeatures="dialogHeight:400px;dialogWidth:580px;height:400px;width:580px;location=no;center:true;status:no;resizable:yes;";//
	
	if(usePrintDlg) {
	    var page = "printer/print.scope.dlg.jsp";
	    
	    if(fromProxy()){ //if not use cross domain policy, then disable this if branch
	        /*
	        ajaxCall ({op:'getTicket'},
		        function(data){
		            dlgParams.url += "&auth=" + data.DataInfo;
		    		page = "<%=basePath%>" + page + "?params=" + JSON.stringify(dlgParams);
		    		showModalDialog(page, null,  sFeatures);
		    	}, false);
		    */
		    showPrintDialog( "<%=basePath%>" + page, dlgParams,  sFeatures);
	    } else {
	    	showPrintDialog(page, dlgParams,  sFeatures);
		}
	} else {
		top.showModelessDialog("printer/print.dlg.jsp", top,  sFeatures);
	}
//	showModalDialog("printer/print.dlg.jsp",url, sFeatures);
/*		
	printer.setUrlStr ( urlStart + "?code=" + encodeURI("汉语") +  "&" + getQueryString(params) );
	printer.print();
	var title = document.title;
	document.title = "";
	//window.print();
	document.title = title;
*/		
}

function showPrintDialog(url,params) {
	if(window.showModalDialog) {
		var sFeatures="dialogHeight:450px;dialogWidth:580px;location=no;center:true;status:no;resizable:yes;";//
		showModalDialog(url, params,  sFeatures);
	} else {
		var iWidth = 580;
		var iHeight = 450;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
		var sFeatures="width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft +",toolbar=no, menubar=no,location=no,center=true,status=no,resizable=yes";//
		window.printDlgParams = params;
		open(url,"打印控制台",sFeatures);
	}
}

function dataNaviClick(event) {
	event.preventDefault();
	event.stopPropagation();
	var option = "left=0,top=0,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,scrollbars=yes";
	//window.open($(this).attr("href"),"",option,false);
	var href = $(this).attr("href");
	var id = $(this).attr("id");
	if(id) {
		href = window.bigStrs[id];
	}
	PostNewWin(href);
	return false;
}

function alignInputCtrls() {
	return;
	if($("table.inputPanel tr").size() < 2){
		return;
	} 
	var colMaxWidth = new Array();
	var oneElementCol = new Array();
	$("table.inputPanel input, table.inputPanel td > select").each(function(){
		
		var colIdx = ($(this).hasClass("multiSelect") || $(this).hasClass("treeSelect")) ? $(this).parent().parent().attr("colIdx") : $(this).parent().attr("colIdx");
		if(!$(this).parent().attr("colspan") || $(this).parent().attr("colspan") < 2) {
			var width = $(this).width();
			if($(this).hasClass("multiSelect")){
				width = width + 12;
			}
			if(colMaxWidth[colIdx]==null){
				oneElementCol[colIdx] = true;
			} else {
				oneElementCol[colIdx] = false;
			}
			if(colMaxWidth[colIdx]==null 
					|| colMaxWidth[colIdx] < width ){
				colMaxWidth[colIdx] = width;		
				alert(width);
			}
		} 
	});
	
	$("table.inputPanel input, table.inputPanel td > select").each(function(){
		var colIdx = ($(this).hasClass("multiSelect") || $(this).hasClass("treeSelect")) ? $(this).parent().parent().attr("colIdx") : $(this).parent().attr("colIdx");
		var span = $(this).parent().attr("colspan");
		if(span &&  span >= 2) {			
			var ctrlWidth = 0;
			var lastIdx = parseInt(colIdx) + parseInt(span)-1;
			for(var i=colIdx;i<lastIdx;i++) {
				ctrlWidth += $("table.inputPanel td:[colIdx='" + i + "'][not(colspan)]").width();
				ctrlWidth += $("table.inputPanel td:[colIdx='" + i + "'][not(colspan)] img").width();
				ctrlWidth += $("table.inputPanel td:[colIdx='" + i + "'][not(colspan)] span").width();
			}
			ctrlWidth += colMaxWidth[lastIdx+""] + parseInt(span);
			if($(this).hasClass("multiSelect") || $(this).hasClass("treeSelect")){
				$("#" + $(this).attr("id") + "-box").width(ctrlWidth + 2);
				ctrlWidth -= 12;
			}
			$(this).width(ctrlWidth);
			
		} else {
			if(colMaxWidth[colIdx] && !oneElementCol[colIdx]) {
				ctrlWidth = colMaxWidth[colIdx];
				if($(this).hasClass("multiSelect") || $(this).hasClass("treeSelect")){
					$("#" + $(this).attr("id") + "-box").width(ctrlWidth + 2); //adjust 2px because IE's box model.(border's width)
					ctrlWidth = ctrlWidth - 12;
				}
				$(this).width(ctrlWidth);
			}
		}
		
	});
}

var autoShowComments = false;
function doViewReport() {
//	collectParams(params);
	/*
	if(!doAuth()) {
		return;
	}
	*/
	params.op = "view";
	params.page = 0;
    params.section = 0;
	refreshReport();
	
}

function doRefreshReport() {
//	collectParams(params);
	params.op = "refresh";
	params.page = 0;
   	params.section = 0;
	refreshReport();
}

function doViewChart(){
//	collectParams(params);
	params.op = "view";
	params.page = 0;
	params.section = 0;
	refreshChart();
}

function doRefreshChart(){
//	collectParams(params);
	params.op = "refresh";
	params.page = 0;
	params.section = 0;
	refreshChart();
}

function initSwf() {
	//$layout.show("south");
	
	$("div.swf").each(function(){
				swfobject.embedSWF('swf/myopenflash.swf',$(this).attr("id"),"100%","90%","9.0.0",null,{"get-data":"initSwfData","id":$(this).attr("id")});
			});
			
}

function initSwfData() {
	//return '{"elements":[{"type":"scatter","values":[{"x":0, "y":0}]}]}';
	//return '{"bg_colour":"#ffffff","elements":[{"type":"line","values":[0]}]}';
	//return '{ "title":{"text": "Many data lines"} }';
	var emptyData = {
	/*
	      "title":{
	            "text":"没有数据",
	            "style":"{font-size:   12px;}"
	      },
	*/
	      "elements":[
	            
	      ],
	      "radar_axis":   {
	            "max":                           50,
	            "steps":                     10,
	            "stroke":                  2,
	            "colour":                  "#A1D4B5",
	            "grid-colour":   "#C0DEBF"
	      },
	
	      "bg_colour":   "#ffffff"
	};
	return JSON.stringify(emptyData);
}


function hookParamsChange() {
	$(".inputPanel input[type=text]").change(onParamsChange);
	$(".inputPanel select").change(onParamsChange);
}

function onParamsChange() {
	enableRefreshBtn(false);
}

function enableRefreshBtn(enabled) {
	$("#refreshReportBtn").attr("disabled",!enabled);
}

function updateUI() {
	var viewStaticPageByAjax = "${viewStaticPageByAjax}";
	if(!viewStaticPageByAjax && $("table.regularTable").size() <= 0 ) {
		$(".toolbar .cmd").each(function(){
			var $this = $(this);
			if($this.attr("id") != "refreshReportBtn"
				&& $this.attr("id") != "viewChartBtn") {
			//alert("hide " + $(this).attr("id"));
				$(this).hide();
			} else {
				//is not first visit , or not empty result
				//so hide the view and refreshBtn
				//it's critical to void view refreshBtn when get the respone of "查询中，请稍候再试"
				if($("#guider").size()>0    
						|| $("table.nodata").size()<=0) {
					$this.hide();
				} else {
					$this.show();
				}
			}
		});
	} else {
		//$("#fontcontroller").show();
		$(".toolbar .cmd").each(function(){
			switch($(this).attr("id")) {		
				case "validBtn": {
					if (validDefs.length > 0) {
						$(this).show();//$(this).attr("disabled","false");
					} else {
						$(this).hide();
						//$(this).attr("disabled","true");
					}
					break;
				}
				case "inputButton": {
				    if(editableCells.length > 0){
				    	$(this).show();
				    } else {
				    	$(this).hide();
				    }
			
				    if(canDoEdit){
				    	$(this).attr("disabled",false);//$(this).show();
				    } else {
				    	$(this).attr("disabled",true); //$(this).hide();
				    }
					break;
				}
				case "inputAuditButton": {
					if(canDoAuditEdit){
				    	$(this).show();
				    } else {
				    	$(this).hide();
				    }
/*				   
					if(originalVals) {
						$(this).attr("disabled",false);
					} else {
						$(this).attr("disabled",true);
					}
*/
					break;
				}
				default: {
					$(this).show();
				}
			} 
			
		});
	}
//	alert($("object[data='swf/myopenflash.swf']").size());
	if($("object[data='swf/myopenflash.swf']").size()>0
	  || $("object[classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000']").size() > 0
	  || $("#centerPan .FusionCharts").size() > 0){
		$("#refreshChartBtn").show();
	} else {
		$("#refreshChartBtn").hide();
	}
	
	drawTopLeftCell();
	
	enableRefreshBtn(true);
}

function collectInputDatas(){
	var vals = {};
	$("table.regularTable input[type=text]").each(function(){
	    var inputVal = $.trim($(this).val());
	   // alert( inputVal + "=" + $(this).parent().attr("val"));
	   if(isNumber(inputVal) && isNumber($(this).parent().attr("val"))){
	   		var expr={};
	   		expr.leftHand = inputVal;
	   		expr.rightHand = "!=" + $(this).parent().attr("val");
	   		if(isExpresionTrue(expr)){  		
	   			vals[$(this).attr("id")] = {val:inputVal,def:editableCellDefs[$(this).attr("idx")]};
	   		}
	   } else {
		    if(inputVal != $(this).parent().attr("val")) {
				vals[$(this).attr("id")] = {val:inputVal,def:editableCellDefs[$(this).attr("idx")]};
			}
		}
	});
	return vals;
}

function doAuth() {
    if(needAuth){
		var sFeatures="dialogHeight:200px;dialogWidth:350px;status=no,toolbar=no,menubar=no,location=no";//"dialogHeight:200px;dialogWidth:350px;fullscreen:yes;center:true;menubar:no;help:no;location:no;toolbar:no;status:no;resizable:no;";//
		var val = showModalDialog( "<%=basePath%>/auth.jsp" , /*{reportId:reportId}*/params,  sFeatures);
		if(val) {
			return val.success;
		} 
		return false;
	}
    return true;
}


function drawTopLeftCell() {
	if(window.painter) {	
		window.painter.clear();
	} 
	window.painter = new jsGraphics("centerPan");
	window.painter.setColor("black");
	window.painter.setStroke(1);
	var painer = window.painter;	
	
	$(".topLeft2bottomRightLine").each(function(){
		painter.drawLine($(this).offset().left + $("#centerPan").scrollLeft(),$(this).offset().top + $("#centerPan").scrollTop() - parseInt($("#centerPan").css("top")),
			$(this).offset().left + $("#centerPan").scrollLeft() + $(this).width(),
			$(this).offset().top + $(this).outerHeight() + $("#centerPan").scrollTop() - parseInt($("#centerPan").css("top")));
		/*
		painter.drawLine(0,0,
			$(this).width(),
			$(this).height());
			*/
	});
	painter.paint();
}

function getDataPrecision(convertStr){
	if(convertStr.indexOf(".")<0){
		return 0;
	}
	var p = 0;
	for(var i = convertStr.length-1;i>=0;i--){
		if(convertStr.substr(i,1)=="0"){
			p++;
		} else {
			break;
		}
	}
	return p+"";
}

function showSouthPanel(panelId) {
	$(".southPanel").css("display","none");
	$("#" + panelId).css("display","block");
}

function hideSouthPanel() {
	$(".southPanel").css("display","none");
	
}

function initAuditEditPanel(){
	$("#aggreeBtn").click(function(){
		 collectParams(params);
		 params.comments = encodeURI($("#auditInputComments").val());
		 params.attitude = 1;
		 params.op = "auditInput";
		  var success = false;
		 var msg = null;
		 ajaxCall(params, function(data) {
		 	if( data.HeadInfo.Code == 0 ) {
		 		success = true;
		 	} else {
		 	 msg = data.HeadInfo.Message;
		 	}
		 },false);
		 
		 if(success){
		 	if(runInFintelligen && fintelligenVer<"2.0.0"){
			     var finParams = params;//attitude=1&remarkEncode="
			     finParams.attitude = 1;
			     finParams.remarkEncode = encodeURI($("#auditInputComments").val());
			     auditInputs(finParams, function(data){
			     	alert(data);
			     });   
		     } else {
		     	alert("操作成功！");
		     }
		     //$layout.hide("south");
		     hideSouthPanel();
		     initLayout($("body"));
	     } else {
	     	alert(msg);
	     }
	});
	
	$("#disaggreeBtn").click(function(){
		 collectParams(params);
		 params.comments = encodeURI($("#auditInputComments").val());
		 params.attitude = 2;
		 params.op = "auditInput";
		 var success = false;
		 var msg = null;
		 ajaxCall(params, function(data) {
		 	if( data.HeadInfo.Code == 0 ) {
		 		success = true;
		 	} else {
		 	 msg = data.HeadInfo.Message;
		 	}
		 },false);

		 if(success) {
		     if(runInFintelligen && fintelligenVer<"2.0.0"){
			     var finParams = params;//attitude=2&remarkEncode="
			     finParams.attitude = 2; 
			     finParams.remarkEncode = encodeURI("hehe");
			     auditInputs(finParams, function(data){
			     	alert(data);
			     }); 
		     } else  {
		     	alert("操作成功！");
		     } 
		     hideSouthPanel();//$layout.hide("south");
		     initLayout($("body"));
	     } else {
	     	alert(msg);
	     }
	});
	$("#auditCancelBtn").click(function(){
		hideSouthPanel(); //$layout.hide("south");
		initLayout($("body"));
	});

	
	$("#inputAuditButton").click(function(){
		collectParams(params);
		params.op = "viewAuditData";
		refreshReport(true);
/*		
		$("#southPan").html("<div style='margin-top:.5em;margin-left:.5em;'>批复:</div>"
			 + "<textarea id='auditInputComments' style='width:100%;height:5em;'></textarea> "
			 + "<input id='auditCancelBtn' type='button' value='取消' style='float:right;margin-left:1em;margin-right:1em;font-size:9pt;' /> "
			 + "<input id='aggreeBtn' type='button' value='同意' style='float:right;margin-left:1em;margin-right:1em;font-size:9pt;' /> "
			 + "<input id='disaggreeBtn' type='button' value='不同意' style='float:right;font-size:9pt;' /> ");
		$layout.show("south");
*/
       showSouthPanel("auditEditPanel");
		initLayout($("body"));		
	});

}

function initEditPanel() {
	$("#inputSave").click(function(){
		var vals = collectInputDatas();
		if(JSON.stringify(vals) == "{}"){
			alert("没有修改任何值！");
			return;
		}
		collectParams(params);
		params.inputVals = JSON.stringify(vals);
//		alert(params.inputVals);
		params.comments = encodeURI($("#inputComments").val());
		params.op = "saveInput";
		ajaxCall(params, function(data) {
			if( data.HeadInfo.Code == 0 ) {
				alert("保存成功！");
			} else {
				alert("保存失败！\r\n" + data.HeadInfo.Message); 
			}
		});
	});
	
	$("#inputCancel").click(function(){
		$("table.regularTable input[type=text]").each(function(){
			$(this).parent().text($(this).parent().attr("oldval"));
		});
		hideSouthPanel(); //$("#editPanel").css("display","none");
		initLayout($("body"));
		//$layout.hide("south");
	});

	
	$("#inputOK").click(function(){
		var vals = collectInputDatas();
		if(JSON.stringify(vals) == "{}"){
			alert("没有修改任何值！");
			return;
		}
		collectParams(params);
		params.inputVals = JSON.stringify(vals);
		params.comments = encodeURI($("#inputComments").val());
		params.op = "input";
		ajaxCall(params,loadReportWorker);
		var finParams = params;//null;//{reportid:,valueList:,poses:,rptdate:,rmlpar:,paraDef:};
		
		renderInputs(finParams,function(data){
			alert(data);
		});
		
		hideSouthPanel(); //$("#editPanel").css("display","none");
		initLayout($("body"));
	});
	
	
	$("#inputButton").click(function(){
	   /*
	    $.each(editableCells,function(idx,val){
	    	if(val) {
				var $td = getTdWraper(val);
				var draftVal = getDraftVal(val);
				//alert(val + "=" + draftVal);
				$td.attr("valign","bottom").attr("oldval",$td.text()).css("padding-bottom","0").html("<input type='text' id='" + val + "' idx='" + idx + "'style='border:none;border-bottom:solid 1px red;width:100%;' value='" + ((draftVal!=null) ? draftVal : $td.attr("val"))  + "' />");
			}
		});
		*/
		//alert($(this).attr("class"));
		var tmpCells = {};

		for(var idx=0;idx<editableCells.length;idx++){
			var val = editableCells[idx];
		    if(val) {
				var coo = getCoordinate(val);
				var id = coo.col + "," + coo.row;
				tmpCells[id] = {val:val,idx:idx,pattern:editableCellPatterns[idx]};
			}
		}
		
		$("table.regularTable td").each(function() {
			var id = $(this).attr("x") + "," + $(this).attr("y");	
			if(tmpCells[id]){
			 	var val = tmpCells[id].val;
			 	var idx = tmpCells[id].idx;   
			 	var pattern = tmpCells[id].pattern;
			    var draftVal = getDraftVal(val);
						//alert(val + "=" + draftVal);
				var classN = "";
				if(pattern.toLowerCase() == "number"){
					classN = "numberInput";
				}
				$(this).attr("valign","bottom")
					.attr("oldval",$(this).text())
					.css("padding-bottom","0")
					.html("<input type='text' class='" + classN + "' id='" + val + "' idx='" + idx + "'style='border:none;border-bottom:solid 1px red;width:100%;' value='" + ((draftVal!=null) ? draftVal : $(this).attr("val"))  + "' />");
			}   
		});
		
		$(".numberInput").keypress(inputNumberCallback)
						 .change( function(){
							if(!isNumber($(this).val())){
								alert("只能录入数字！");	
								$(this).val("");
							}
						 });
						 
/*		
		$("#southPan").html("<div style='margin-top:.5em;margin-left:.5em;'>录入补录原因:</div><textarea id='inputComments' style='width:100%;height:5em;'></textarea>"
		+ " <input id='inputSave' type='button' value='存为草稿' style='float:right;margin-left:1em;margin-right:1em;font-size:9pt;' />"
		+ " <input id='inputOK' type='button' value='提交' style='float:right;margin-left:1em;margin-right:1em;font-size:9pt;' />" 
		+ " <input id='inputCancel' type='button' value='取消' style='float:right;font-size:9pt;' /> ");
		$layout.show("south");
*/
	    showSouthPanel("editPanel");
		if(modifyDraftComments){
			$("#inputComments").val(decodeURI(modifyDraftComments));
		}
		initLayout($("body"));
		
		
	});
}


function disableCtrls() {
	
	$(".inputPanel input.paramInput.disable,.inputPanel select.paramInput.disable,.inputPanel .paramInput.disable select,.inputPanel .paramInput.disable input").attr("disabled",true);
}

function getStartEndDay(dateStr){
	return new Date(parseInt(dateStr.substr(0,4),10),parseInt(dateStr.substr(4,2),10)-1,parseInt(dateStr.substr(6,2),10));
}

function parseStartEndDay(def){
	var theDay = {};
	var dayStr;
	if(def.indexOf("|") >= 0) {
			dayStr = $.trim(def.split("|")[0]);
			theDay.dependCtrl = $.trim(def.split("|")[1]);
	} else {
		dayStr = def;
	}
	if(dayStr && dayStr.length == 8){
		theDay.date = getStartEndDay(dayStr);
	}
	return theDay;
}



function initCalendarControl(){
	if($(".datePicker").size() <=0 ){
		return;
	}
	
	$.datepicker.setDefaults($.extend({showMonthAfterYear: false}, $.datepicker.regional['zh-CN']));
	
	$(".datePicker").datepicker( {
					//showOn:'button',
					//buttonImage:'<%=basePath%>images/calendar.png',
					//buttonImageOnly:true,
					showButtonPanel: true,
					changeMonth: true,
					changeYear: true,
					dateFormat:'yymmdd',
					beforeShow: function(input, inst) { 
						if(document.activeElement == this) {
							return false;
						} else {
							//$(this).focus();
						}
					}
				}
						//$.datepicker.regional['zh-CN']
	);	
			
	$(".datePicker").datepicker();
				

	$(".datePicker").each( function() {
		var formatStr = $(this).attr("format");
		if(formatStr && $.trim(formatStr).length > 0){
			$(this).datepicker("option","dateFormat", formatStr);
		}
		var begin = $(this).attr("st");
		var sday = parseStartEndDay(begin);
		if(sday.date){
			$(this).datepicker("option","minDate",sday.date);
		}
		
		var end = $(this).attr("end");
		var eday = parseStartEndDay(end);
		if(eday.date){
			$(this).datepicker("option","maxDate",eday.date);
		}
		
		if($(this).hasClass("disable")) {
			$(this).datepicker("disable");
			$(this).datepicker("option","showButtonPanel",false);
			$(this).datepicker("option","buttonImage","");
		}
		
	});
	
	$(".datePicker").change(function(){
		var format = $(this).datepicker("option","dateFormate");
		if(!format){
			format = "yymmdd";
		}
		var day = null;
		try{
			day = $.datepicker.parseDate(format,$(this).val());
		} catch(e){
			$(this).val("");
		}
		if(day){
		    var begin = $(this).attr("st");
			var boundDay = parseStartEndDay(begin);
			if(boundDay.dependCtrl) {
				if(boundDay.date) {
					var beginDay = boundDay.date; //getStartEndDay(begin); //new Date(parseInt(begin.substr(0,4)),parseInt(begin.substr(4,2))-1,parseInt(begin.substr(6,2)));
					if(beginDay > day){
						day = beginDay;		
						$(this).val($.datepicker.formatDate(format,day));
					}
					var $dependCtrl = $(".paramInput[var="+ boundDay.dependCtrl.substr(1)+"]");
					var dependVal = $.trim($dependCtrl.val());
					if( dependVal != "" ) {
						if( day < $.datepicker.parseDate(format,dependVal)){
							$dependCtrl.val($.datepicker.formatDate(format,day));
						}
					}
				}
			} else {
				if(boundDay.date) {
					var beginDay = boundDay.date;
					if(beginDay > day) {
						day = beginDay;
						$(this).val($.datepicker.formatDate(format,day));
					}
				}
			}
			
			var end = $(this).attr("end");
			var boundDay = parseStartEndDay(end);
			if(boundDay.dependCtrl) {
				if(boundDay.date) {
					var endDay = boundDay.date; //getStartEndDay(begin); //new Date(parseInt(begin.substr(0,4)),parseInt(begin.substr(4,2))-1,parseInt(begin.substr(6,2)));
					if(endDay < day){
						day = endDay;		
						$(this).val($.datepicker.formatDate(format,day));
					}
					var $dependCtrl = $(".paramInput[var="+ boundDay.dependCtrl.substr(1)+"]");
					var dependVal = $.trim($dependCtrl.val());
					if( dependVal != "" ) {
						if( day > $.datepicker.parseDate(format,dependVal)){
							$dependCtrl.val($.datepicker.formatDate(format,day));
						}
					}
				} 
			} else {
				if(boundDay.date) {
					var endDay = boundDay.date; //getStartEndDay(begin); //new Date(parseInt(begin.substr(0,4)),parseInt(begin.substr(4,2))-1,parseInt(begin.substr(6,2)));
					if(endDay < day){
						day = endDay;		
						$(this).val($.datepicker.formatDate(format,day));
					}
				}
			}
		}
		
	});

 	$(".datePicker").datepicker("hide");
 	
 	$(".datePicker").parent().click(function(){
 	 		$(this).children().datepicker("show");
 	 });
 	
}

function validateInputs() {
	var suc = true;
	$("input.paramInput[type=text]").each(function(){
		var input = $.trim($(this).val());
	    if(input == "" && $(this).attr('an') == 'false') {
			alert($('#' + $(this).attr("var") + '-caption' ).text() + '  为必输项！');
			suc = false;
			return;
		}
	});
	return suc;
}

function collectParams(params) {
/*
	params.branch = $("#branchSelector").selectedValues()[0];
	params.branchCap = $("#branchSelector").selectedTexts()[0].replace(/\u00a0+/,"");
	params.day = $("#publishTime").attr("value");
	params.ccy = $("#ccySelector").selectedValues()[0];
	params.ccyCap = $("#ccySelector").selectedTexts()[0];
	params.hasCoordin = $("#coordinRadio").attr("checked");
*/
    var rmlpar = "";
    var paraDef = "";
	$("select.paramInput").each(function(){
		params[$(this).attr("var")] = $(this).selectedValues()[0] ? $(this).selectedValues()[0] : '';
		var varCap = $.trim($(this).attr("varCap"));
		if(varCap != null && $.trim(varCap)!="") {
			params[varCap] = $(this).selectedTexts()[0] ? $(this).selectedTexts()[0].replace(/\u00a0+/,"") : '';
		}
		if(rmlpar!="") {
			rmlpar += "|";
		}
		rmlpar += $(this).selectedValues()[0];
		if(paraDef != ""){
			paraDef += "|";
		}
		paraDef += "str";
	});	
	$("input.paramInput[type=text]").each(function(){
	    if($(this).hasClass("itext")){
	        var cap = $.trim($(this).val());
	    	params[$(this).attr("varCap")] = cap;
	    	if(cap == ""){
	    		params[$(this).attr("var")] = "";
	    	} else {
		    	var autocomplete = autocompletes[$(this).attr("id")];
		    	for(var i=0;i<autocomplete.length;i++) {
		    		if(cap == $.trim(autocomplete[i][0])) {
		    			params[$(this).attr("var")] = autocomplete[i][1];
		    		}
		    	}
	    	}
	    } else if($(this).hasClass("treeSelect")){
	    	var cap = $.trim($(this).val());
	    	params[$(this).attr("varCap")] = cap;
	    	if(cap == ""){
	    		params[$(this).attr("var")] = "";
	    	} else {
	    		var treeId = $(this).attr("id") + "-tree";
		    	var zTree = $.fn.zTree.getZTreeObj(treeId);	
	    		var nodes = zTree.getSelectedNodes();
	    		params[$(this).attr("var")] = nodes[0]["id"];
	    	}
	    } else if($(this).hasClass("multiSelect")){
	    	var cap = $.trim($(this).val());
	    	params[$(this).attr("varCap")] = cap;
	    	if(cap == ""){
	    		params[$(this).attr("var")] = "";
	    	} else {
		    	var treeId = $(this).attr("id") + "-tree";
		    	var zTree = $.fn.zTree.getZTreeObj(treeId);		    	
				var nodes = zTree.getCheckedNodes(true);
				var vals = "";//"multiSelectInput:";
				for(var i=0;i<nodes.length;i++){
					vals += nodes[i]["id"];
					if(i<nodes.length-1){
						vals += ",";
					}
				}
				params[$(this).attr("var")] = vals;    	
	    	}
	    } else {	    	
	        var input = $.trim($(this).val());
			params[$(this).attr("var")] = input;
		}
		if(rmlpar!="") {
			rmlpar += "|";
		}
		rmlpar +=  $(this).val();
		if(paraDef != ""){
			paraDef += "|";
		}
		paraDef += "str";	
			
		if($(this).hasClass("datePicker")){
			params[$(this).attr("varCap")] = $.datepicker.formatDate($(this).attr("capFormat"),$(this).datepicker("getDate"));
		}
	});
	
	$("input.paramInput[type=hidden]").each(function(){
		params[$(this).attr("var")] = $.trim($(this).val());
		if($(this).attr("varCap")){
			params[$(this).attr("varCap")] = $(this).attr("capValue");
		}
		if(rmlpar!="") {
			rmlpar += "|";
		}
		rmlpar +=  $(this).val();
		if(paraDef != ""){
			paraDef += "|";
		}
		paraDef += "str";
		
		//params[$(this).attr("varCap")] = ;
	});
	
	$("span.DateSelect").each(function(){
		if($(this).hasClass("paramInput")){
			var id = $(this).attr("id");
			var yearWrap = $("#" + id + " .year");
			var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
			var dWrap = $("#" + id + " .TenDay");
			if(yearWrap.selectedValues()[0] == "") {
				params[$(this).attr("var")] = "";
				params[$(this).attr("varCap")] = "";
			} else {
				switch($(this).attr("optionType").toLowerCase()){
					case "ymd":
					case "ymt":{
						params[$(this).attr("var")] = yearWrap.selectedValues()[0] + mWrap.selectedValues()[0] + dWrap.selectedValues()[0];
						params[$(this).attr("varCap")] = yearWrap.selectedTexts()[0] + mWrap.selectedTexts()[0] + dWrap.selectedTexts()[0];
						break;
					}
					case "ym":
					case "ys":
					case "yq":
					case "yw": {
						params[$(this).attr("var")] = yearWrap.selectedValues()[0] + mWrap.selectedValues()[0] ;
						params[$(this).attr("varCap")] = yearWrap.selectedTexts()[0] + mWrap.selectedTexts()[0] ;				
						break;
					}
					case "y":{
						params[$(this).attr("var")] = yearWrap.selectedValues()[0];
						params[$(this).attr("varCap")] = yearWrap.selectedTexts()[0];				
						break;
					}
				}
	//			alert( "---------" + params[$(this).attr("var")] );
				if(rmlpar!="") {
					rmlpar += "|";
				}
				rmlpar +=  params[$(this).attr("var")];
				if(paraDef != ""){
					paraDef += "|";
				}
				paraDef += "str";
			}
		}
	});
	//following 4 para is for fintelligen's workflow
	params.rmlpar = rmlpar;
	params.paraDef = paraDef;
	params.reportid = reportId;  //for doAuth
	params.S_ID = reportId;
	
//	alert(rmlpar);
	return params;
}

function restoreParams(params) {
	$("select.paramInput").each(function(){
		$(this).selectOptions( params[$(this).attr("var")] );
		
	});	
	
	$("input.paramInput[type=text]").each(function(){
	    if($(this).hasClass("itext")){
	    	$(this).val(params[$(this).attr("varCap")]);
	    } else {	    	
	        $(this).val(params[$(this).attr("var")]);
		}
			
		if($(this).hasClass("datePicker")){
//			params[$(this).attr("varCap")] = $.datepicker.formatDate($(this).attr("capFormat"),$(this).datepicker("getDate"));
		}
	});
}

function getDraftVal(coorStr){
	for(var key in modifyDraftVals){
		if(coorStr == key){
			return modifyDraftVals[key].val;
		}
	} 
	return null;
}


function getQueryString(inputParams) {
	/*
	return "branch=" + encodeURI($("#branchSelector").selectedValues()[0])
			+ "&branchCap=" + encodeURI($("#branchSelector").selectedTexts()[0].replace(/\u00a0+/,""))
			+ "&day=" + encodeURI($("#publishTime").attr("value"))
			+ "&ccy=" + encodeURI($("#ccySelector").selectedValues()[0])
			+ "&ccyCap=" + encodeURI($("#ccySelector").selectedTexts()[0])
	*/
	if(staticView){
		collectParams(params);
	}
	var str = "";
	for( var key in inputParams ){
//	alert(key + "=" +inputParams[key]);
		if(key =="op"){
			continue;
		}
		if(str.length > 0) {
			str += "&";
		}
		str += key + "=" + encodeURI(inputParams[key]);
	}
	return str;
}

var g_chartDatas = null;

function getChartData(chartId){
//alert(chartId +":====" + window.chartDatas[chartId]);
	return g_chartDatas[chartId];
}

function jumpFromChart(url){
	//alert(url);
	var option = "left=0,top=0,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,scrollbars=yes";
	window.open(url,"",option,false);
}

function findSWF(movieName) {
	  if (navigator.appName.indexOf("Microsoft")!= -1) {
	    return window[movieName];
	  } else {
	    return document[movieName];
	  }
}

function loadChartWorker(data) {
	if( data.HeadInfo.Code == 0 ){
	
		if(data.DataInfo.timeStamp){
			$("#southPan").html(data.DataInfo.timeStamp);
			
		} else {
			$("#southPan").html("<span style='color:green;'>当前显示的是最新数据</span>");
		}
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
	    	}
	    } else {
			if($("div.swf").size() > 0){
				g_chartDatas = data.DataInfo.chartDatas;			
				$("div.swf").each(function(){
					swfobject.embedSWF('swf/myopenflash.swf',$(this).attr("id"),"100%","90%","9.0.0",null,{"get-data":"getChartData","id":$(this).attr("id")});
				});
			} 
			else {
				for( var chartId in data.DataInfo.chartDatas){
					var tmp = findSWF(chartId);
					tmp.load(data.DataInfo.chartDatas[chartId]);
				}
			}
	    }
		
	} else {
		alert(data.HeadInfo.Message);
	}
	unmask();
	updateUI();
}

var lastHighlightCells = null;
var lastInputCells = null;
function cmpCells(cells1,cells2){
	//alert(JSON.stringify(cells1) + "=======" + JSON.stringify(cells2));
	return JSON.stringify(cells1) == JSON.stringify(cells2);
}

function doHighlightCells(cells) {
	if(!cells) {
		if(!highlightCells) {
			return;
		}
		
		$.each(highlightCells,function(key,val){
			var coo = key.split(",");
			if(coo.length > 1) {
				if(!lastHighlightCells){
					lastHighlightCells = {};
				}
				var $cell = $("td[x="+coo[0] +"][y=" + coo[1] + "]");
				lastHighlightCells[key] = $cell.css("background-color") + ":" + $cell.css("color");
				var cols = val.split(":");
				var forcol = cols.length > 1 ? cols[1] : "black";
				$cell.css("background-color",cols[0]).css("color",forcol);
			}
		});	
	} else {
		if(lastInputCells && cmpCells(lastInputCells,cells)) {
			return;
		}
		if(lastHighlightCells) {  //reset 
				$.each(lastHighlightCells,function(key,val){
				var coo = key.split(",");
				if(coo.length > 1) {
					var cols = val.split(":");
					var forcol = cols.length > 1 ? cols[1] : "black";
					$("td[x="+coo[0] +"][y=" + coo[1] + "]").css("background-color",cols[0]).css("color",forcol); 
				}
			});	
			lastHighlightCells = null;
		}
		highlightCells = cells;
		doHighlightCells();
		lastInputCells = cells;
	}
}

function loadReportWorker(data) {

	if( data.HeadInfo.Code == 0 ){
		/*
		if(data.DataInfo.pageNavi) {
			$("#southPan").html(data.DataInfo.pageNavi);
			//$layout.show("south");
		} else if(data.DataInfo.includeAuditData){
			//$layout.show("south");
		}
		else {
			//$layout.hide("south");
		}
		*/
		
		$("#statusMsg").text(data.DataInfo.statusMsg ? data.DataInfo.statusMsg : "");
		if(!data.DataInfo.cacheUuid){
			alert("maybe there is a bug! liuxjg");
		}
		$("#regularReportViewer").attr("uuid",data.DataInfo.cacheUuid);
		
		curDataPage = data.DataInfo.curPage ?  data.DataInfo.curPage : 0;
	    curDataSection = data.DataInfo.curSection ? data.DataInfo.curSection : 0;

		
		if(data.DataInfo.curPage != null) {
		    		
			$("#pageNavi").css("display","block");
			var msg = "";
			if(data.DataInfo.totalPages && data.DataInfo.totalPages > 0) {
				msg = "共 " + data.DataInfo.totalPages +" 页";
			} else if(data.DataInfo.ongoingPage && data.DataInfo.ongoingPage >= 0) {
				msg = "正在处理";
				if(data.DataInfo.totalSections > 1) {
					msg += (parseInt(data.DataInfo.ongoingSection)+1) + "部分  第";
				}
				msg +=  data.DataInfo.ongoingPage +" 页";
			}
			
			if(data.DataInfo.totalPages > 1 || data.DataInfo.ongoingPage >= 0) {
				$("#totalPages").text(msg);
			
				if(data.DataInfo.curPage == 0) {
					$("#prevPageBtn,#firstPageBtn").addClass("hide");//.css("display","none");
				} else {
					$("#prevPageBtn,#firstPageBtn").removeClass("hide");//css("display","inline-block");
					$("#prevPageBtn").attr("page",data.DataInfo.prevPage);
					$("#prevPageBtn").attr("section",data.DataInfo.prevSection);
				}

				$("#curPage").text("第 "+ (parseInt(data.DataInfo.curPage) + 1) +" 页");
				
				if(data.DataInfo.isLastPage) {
					$("#nextPageBtn,#lastPageBtn").addClass("hide");//.css("display","none");
				} else {
					if(data.DataInfo.totalPages > 1) {
						$("#nextPageBtn,#lastPageBtn").removeClass("hide");
					} else {
						$("#nextPageBtn").removeClass("hide");//.css("display","inline-block");
						$("#lastPageBtn").addClass("hide");
					}
					$("#nextPageBtn").attr("page",data.DataInfo.nextPage);
					$("#nextPageBtn").attr("section",data.DataInfo.nextSection);
					$("#lastPageBtn").attr("page",data.DataInfo.lastPage);
					$("#lastPageBtn").attr("section","all");
				}
			} else {
				
				$("#pageNavi").css("display","none");
				
			}
		} else {
			$("#pageNavi").css("display","none");
		}
//		if(data.DataInfo.originalVals) {
			originalVals = data.DataInfo.originalVals;
//		}		
//		if(data.DataInfo.modifyDraftVals){
			modifyDraftVals =  data.DataInfo.modifyDraftVals;
//		}		
//		if(data.DataInfo.modifyDraftComments){
			modifyDraftComments = data.DataInfo.modifyDraftComments;
//		}
/*
		if(data.DataInfo.canDoEdit){
			$("#inputButton").show();
		} else {
			$("#inputButton").hide();
		}
		
		if(data.DataInfo.canDoAuditEdit){
			$("#inputAuditButton").show();
		} else {
			$("#inputAuditButton").hide();
		}		
*/
	    canDoEdit = data.DataInfo.canDoEdit;
	    canDoAuditEdit = data.DataInfo.canDoAuditEdit;
	    
	    window.bigStrs = data.DataInfo.bigStrs;
	    
		$("#centerPan").html(data.DataInfo.content);
		
/*		
		$("#nextPageBtn").click(function(event){
			event.stopPropagation();
			params.op = "view";	
			params.page = $(this).attr("page");
			params.section = $(this).attr("section");
			refreshReport();
									
			return false;
		});
*/
		/*
		$("#gotoPage").click(function(event){
			event.stopPropagation();
			return false;
		});
		*/
		
		$("a.dataNavi").click(dataNaviClick);
			
		if(data.DataInfo.includeAuditData) {
			for(var cooStr in originalVals){
				if(cooStr == "comments" ){
					continue;
				}
				var val = $.trim(originalVals[cooStr][0].data);
				var $td = getTdWraper(cooStr);
				//if($.trim($td.text()) != val) {
					$td.append(genAlramIconHtml(cooStr,-1,-1,""));//"原值：" + ("" == val ? "无" : val)));
				//}
			}
			
			$("img.jTip").hover(function(){
					$("#JT").remove();
					JT_showHtml(this.id,genHistoryInputsMsg($(this).attr("cooStr")),null,null);
			});
		}

	} else {
		$("#centerPan").html("<div style='margin:1em;color:red;font:10pt;'>" + data.HeadInfo.Message + "</div>");
		if(data.HeadInfo.Message.indexOf("查询中") > -1){
			$("#centerPan").append("<input type='button' onclick='queryReport()' value='重试'/>")
		}
	}
	updateUI();
	doHighlightCells();
	unmask();
	if($("body").height() <= 0 ) {
		needRelayout = true;
	}
	if(data.DataInfo && data.DataInfo.isFixHeader){
		fixTable("gridTable", data.DataInfo.rowHeaderWidth, data.DataInfo.colHeaderHeight);
		window.fixGridHeader = {row: data.DataInfo.rowHeaderWidth,col:data.DataInfo.colHeaderHeight};
	}
}

/// <summary>
///     锁定表头和列
/// </summary>
/// <param name="TableID" type="String">
///     要锁定的Table的ID
/// </param>
/// <param name="FixColumnNumber" type="Number">
///     要锁定列的个数
/// </param>
/// <param name="FixRowNumber" type="Number">
///     要锁定行的个数，不设则以<thead>的高度为准
/// </param>
function fixTable(TableID, FixColumnNumber, FixRowNumber) {
	
	if(FixColumnNumber == null || FixRowNumber == null 
			|| (FixColumnNumber == 0 && FixRowNumber == 0)){
		return;
	}
	
	var keepWidth = 40;	//表格右边的预留宽度
	var keepHeight = 70;	//表格下方的预留高度
	
	var $container = $(window).height() > 100 ? $(window) : $("body");	
	
	var width = $('#'+TableID).width() ;
	var height = $('#'+TableID).outerHeight();
		
	var gridLeftWidth = $('#'+TableID).offset().left;
	var gridTopHeight = $('#'+TableID).offset().top;
	
	//计算底部的高度，并预留出来
	var bottomHeight = $('#centerPan table').outerHeight() + $('#centerPan table').offset().top
						- (height + gridTopHeight);
	
	if(bottomHeight > 0){
		if(bottomHeight > keepHeight || bottomHeight > 40)		
			keepHeight += 40;
		else
			keepHeight += bottomHeight;
		if(bottomHeight > keepHeight && (width + gridLeftWidth + keepWidth > $container.width()))
			keepWidth = 80;
	}
	
	if(width + gridLeftWidth + keepWidth > $container.width()){
		width = $container.width() - gridLeftWidth - keepWidth;	
	}
	
	if(height + gridTopHeight + keepHeight > $container.height()){
		height = $container.height() - gridTopHeight - keepHeight;
	}
	height += 6;
	
	$("#"+TableID).css("width",width);
	
	if ($("#" + TableID + "_tableLayout").length != 0) {
	    $("#" + TableID + "_tableLayout").before($("#" + TableID));
	    $("#" + TableID + "_tableLayout").empty();
	}
	else {
	    $("#" + TableID).after("<div id='" + TableID + "_tableLayout' style='overflow:hidden;height:" + height + "px; width:" + width + "px;margin:0 auto;'></div>");
	}
	
	$('<div id="' + TableID + '_tableFix"></div>'
	+ '<div id="' + TableID + '_tableHead"></div>'
	+ '<div id="' + TableID + '_tableColumn"></div>'
	+ '<div id="' + TableID + '_tableData"></div>').appendTo("#" + TableID + "_tableLayout");
	
	
	var oldtable = $("#" + TableID);
	
	var tableFixClone = oldtable.clone(true);
	
	tableFixClone.attr("id", TableID + "_tableFixClone");
	$("#" + TableID + "_tableFix").append(tableFixClone);
	var tableHeadClone = oldtable.clone(true);
	tableHeadClone.attr("id", TableID + "_tableHeadClone");
	$("#" + TableID + "_tableHead").append(tableHeadClone);
	var tableColumnClone = oldtable.clone(true);
	tableColumnClone.attr("id", TableID + "_tableColumnClone");
	$("#" + TableID + "_tableColumn").append(tableColumnClone);
	$("#" + TableID + "_tableData").append(oldtable);
	
	$("#" + TableID + "_tableLayout table").each(function () {
	    $(this).css("margin", "0");
	});
	
	var HeadHeight = 0;
	if(FixRowNumber){
		var totleTrCount = $("#" + TableID + "_tableHead tr").length;
		if(FixRowNumber > totleTrCount){
			FixRowNumber = totleTrCount;
		}
		for(i = 0; i < FixRowNumber; i++){
			HeadHeight += $("#" + TableID + "_tableHead tr").eq(i).outerHeight();
		}
	}else{
	   HeadHeight = $("#" + TableID + "_tableHead thead").outerHeight();
	}
	HeadHeight += 2;
	
	var ColumnsWidth = 0;
	var ColumnsNumber = 0;
	
	/** 计算行表头宽度*/
	for(colIdx = 0; colIdx <  FixColumnNumber; colIdx ++){
		ColumnsWidth += $("#g_"+colIdx).outerWidth();
		if($("#g_"+colIdx).attr("colspan")){
			colIdx += ($("#g_"+colIdx).attr("colspan") - 1)
		}
		ColumnsNumber++;
	}
	
	/*$("#" + TableID + "_tableColumn tr:last td:lt(" + FixColumnNumber + ")").each(function () {
		alert($(this).attr("colspan"));		
	    ColumnsWidth += $(this).outerWidth(true);
	    ColumnsNumber++;
	});*/
	ColumnsWidth += 2;
	var agent = navigator.userAgent.toLowerCase();
	if(agent.indexOf("msie") > 0){
		var regStr = /msie [\d.]+/gi;
		var brower = agent.match(regStr);
		var version = (brower+"").replace(/[^0-9.]/ig,"");
		switch (version) {
	        case "7.0":
	            if (ColumnsNumber > 1) ColumnsWidth ++;
	            HeadHeight ++;
	            break;
	        case "8.0":
	        //  if (ColumnsNumber < 2) ColumnsWidth++;
	            break;
		}
	}
	
	$("#" + TableID + "_tableHead").css("height", HeadHeight);
	$("#" + TableID + "_tableFix").css("height", HeadHeight);
	
	var tableColumnIndex = 40;
	if(FixColumnNumber == 0 || $("#" + TableID + "_tableLayout").outerWidth() >= $("#" + TableID).outerWidth()){
		$("#" + TableID + "_tableFix").css("width", tableFixClone.outerWidth());
		$("#" + TableID + "_tableColumn").css("width", tableFixClone.outerWidth());
		tableColumnIndex = 30;
	}
	else{
		$("#" + TableID + "_tableFix").css("width", ColumnsWidth);
		$("#" + TableID + "_tableColumn").css("width", ColumnsWidth);
	}
	
	$("#" + TableID + "_tableData").scroll(function () {
	    $("#" + TableID + "_tableHead").scrollLeft($("#" + TableID + "_tableData").scrollLeft());
	    $("#" + TableID + "_tableColumn").scrollTop($("#" + TableID + "_tableData").scrollTop());
	});
	
	/* $("#" + TableID + "_tableData")
     .bind('mousewheel', function(event, delta) {
         var dir = delta > 0 ? 'Up' : 'Down';
       	 alert(dir + ' at tableData ');
         return true;
     });
	$("#" + TableID + "_tableColumn")
    .bind('mousewheel', function(event, delta) {
        var dir = delta > 0 ? 'Up' : 'Down';
      	 alert(dir + ' at tableColumn ');
        return true;
    }); */
	
	$("#" + TableID + "_tableFix").css({ "overflow": "hidden","position": "relative", "z-index": "50", "background-color": "Silver" });
	$("#" + TableID + "_tableHead").css({ "overflow": "hidden", "width": width, "position": "relative", "z-index": "45", "background": "-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9fcfd), color-stop(1, #e4f0f7) )" });
	$("#" + TableID + "_tableColumn").css({ "overflow": "hidden", "height": height, "position": "relative", "z-index": tableColumnIndex, "background-color": "Silver" });
	$("#" + TableID + "_tableData").css({ "overflow": "scroll", "width": width, "height": height, "position": "relative", "z-index": "35" });
	if ($("#" + TableID + "_tableHead").width() > $("#" + TableID + "_tableFix table").outerWidth()) {
	    $("#" + TableID + "_tableHead").css("width", $("#" + TableID + "_tableFix table").outerWidth());
	}
	if ($("#" + TableID + "_tableColumn").height() > $("#" + TableID + "_tableColumn table").outerHeight()) {
	    $("#" + TableID + "_tableColumn").css("height", $("#" + TableID + "_tableColumn table").outerHeight());
	}
	
	if($("#"+TableID).height()>height){
		$("#"+TableID+"_tableLayout").width($("#"+TableID+"_tableLayout").width()+17);
	    $("#"+TableID+"_tableData").width($("#"+TableID+"_tableData").width()+17);
	    $("#"+TableID+"_tableData table").css("float","left");
	}else{
		$("#"+TableID+"_tableData").css("overflow-y","hidden");
	}
	
	if($('#'+TableID).width() > width){
		$("#"+TableID+"_tableLayout").height($("#"+TableID+"_tableLayout").height()+17);
	    $("#"+TableID+"_tableData").height($("#"+TableID+"_tableColumn").height()+17);
	}else{
	 	$("#"+TableID+"_tableData").css("overflow-x","hidden");
	}
	
	$("#" + TableID + "_tableFix").offset($("#" + TableID + "_tableLayout").offset());
	$("#" + TableID + "_tableHead").offset($("#" + TableID + "_tableLayout").offset());
	$("#" + TableID + "_tableColumn").offset($("#" + TableID + "_tableLayout").offset());
	$("#" + TableID + "_tableData").offset($("#" + TableID + "_tableLayout").offset());
}

function deFixTable(tableId){
	var $parent = $("#" + tableId + "_tableLayout").parent();
	var $original = $("#" + tableId).clone(true);
	$("#" + tableId + "_tableLayout").remove();
	$parent.append($original);
}

function mask(){
	//$("#mask").css("display","block");
	$("#mask").css({top:"0px",left:"0px"});
	maskCount++;
}

function unmask() {
	maskCount--;
	//if(maskCount<=0) {
		//$("#mask").css("display","none");
		$("#mask").css({top:"-9999px",left:"-9999px"});
	//}
}

function refreshReport(sync, newParams) {
//	$("#centerPan").html("<img src='images/loading.gif' style='margin:20%;' />")
	mask();
	if(newParams)
		ajaxCall(newParams, loadReportWorker, sync ? false : true );
	else
		ajaxCall(params, loadReportWorker, sync ? false : true );
}

function refreshChart() {
	mask();
	ajaxChartCall(params,loadChartWorker);	
}



function getTdWraper(cellCoordinateStr) {

	var coo = getCoordinate(cellCoordinateStr);
	return $("td[x="+ coo.col + "][y=" +  coo.row + "]");
}

function getPrecise(val){
	var tokens = (val+"").split(".");
	var precise = 0;
	if(tokens.length > 1){
		precise = tokens[1].length;
	}
	return precise;
}

function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

function isExpresionTrue(expr){

	var leftPrecise = getPrecise(expr.leftHand);
	var leftVal =  expr.leftHand;

	var rightHand = $.trim(expr.rightHand);
	var opMatched = rightHand.match(/^==|!=|>=|<=|>|</);
	if(!opMatched){
		alert("平衡校验语法定义出错：未定义关系运算符！");
		return false;
	}
	var op = opMatched[0];
	rightHand = rightHand.substr(op.length);
	try {
		var rightVal = eval(rightHand);
		var rightPrecise = getPrecise(rightVal);
		if(leftPrecise >= rightPrecise){
			return eval(leftVal + op + rightVal);
		} else {
			if(leftPrecise == 0){
				leftVal += ".00";
			} else {
				leftVal += "00";
			}
			var tokens = (rightVal+"").split(".");
			var trimedVal=rightVal;
			if(tokens[1].length > leftPrecise + 2) {
			    var normalized = tokens[1].substr(0,leftPrecise + 2) + "." + tokens[1].substr(leftPrecise + 2);
	//		    alert(normalized + "=" + tokens[1]);
			    normalized = Math.round(parseFloat(normalized));  
				trimedVal = tokens[0] + "." + normalized;
			} else {
			    for(var i = 0;i<leftPrecise+2-rightPrecise;i++){
					trimedVal += "0"; 
				}
			}
//			alert(leftVal + op + trimedVal);
			return eval(leftVal + op + trimedVal);
		}
	} catch(e){
			alert("平衡校验语法定义出错：\r\n" + expr.leftHand + expr.rightHand + "\r\n" +　e.message);
	}
}

function showValidateResult( exprs, def) {	
	var $td = getTdWraper(def.cellCoordinate);
	var falseExprs = [];
	var falseIdxs = [];
	for(var i=0;i<exprs.length;i++){
		if(!isExpresionTrue(exprs[i])){
			falseExprs.push(exprs[i].leftHand + exprs[i].rightHand);
			falseIdxs.push(i);
		}
/*
	    try{
			if(!eval(exprs[i])) {
				falseExprs.push(exprs[i]);
				falseIdxs.push(i);
			}
		}catch(e){
			alert("平衡校验语法定义出错：\r\n" + exprs[i] + "\r\n" +　e.message);
		}
*/
	}
	if(falseExprs.length<=0){
		$td.css("background-color","green");
		//$("td[x="+ coo.col + "][y=" +  coo.row + "]").css("background-color","green");
	} else {
		var coo = getCoordinate(def.cellCoordinate);
		$td.css("background-color","red");
		$td.append(genAlramIconHtml(def.cellCoordinate,coo.col,coo.row,"",falseExprs,falseIdxs));
	}
}

function cellValidate() {
	var refValidates = [];
	var handledValidDefs = preHandleValidateDefs();
//	alert(handledValidDefs.length);
	for(var idx=0;idx<handledValidDefs.length;idx++){
		var def = handledValidDefs[idx];
		if(!def) continue;
		var containRef = false;
		for( var i=0;i<def.expression.length;i++){
			if(isContainRef(def.expression[i])){
				containRef = true;
				break;
			}
		}

		if(containRef){
			refValidates.push(def);
		} else {
		    var valuedExprs = [];
			for( var i=0;i<def.expression.length;i++){
				var expr = {};
				//expr.expr = getCellValue(def.cellCoordinate) + " " + setInnerCellValue(def.expression[i]);
				expr.leftHand = getCellValue(def.cellCoordinate);
				expr.rightHand = setInnerCellValue(def.expression[i]);
				valuedExprs.push(expr);
			}

			showValidateResult(valuedExprs , def);
		/*
			var coo = getCoordinate(def.cellCoordinate);
			
			if(eval(getCellValue(def.cellCoordinate) + " " + setInnerCellValue(def.expression))){
				$("td[x="+ coo.col + "][y=" +  coo.row + "]").css("background-color","green");
			} else {
				$("td[x="+ coo.col + "][y=" +  coo.row + "]").css("background-color","red");
				$("td[x="+ coo.col + "][y=" +  coo.row + "]").append(genAlramIconHtml(coo.col,coo.row,genIvalidateMsg(def)));
			//	$("img.invalidateInfo[x="+ coo.col + "][y=" +  coo.row + "]").click(function(){
			//	});
			}
		*/
		}
	}
	
	if(refValidates.length > 0){
		collectParams(params);
		var newParams = {};
		$.extend(newParams,params);
		newParams.refs = JSON.stringify(refValidates);
		newParams.op = "getCellValues";

		ajaxCall(newParams, 
		function(data) {
			if( data.HeadInfo.Code == 0 ){
				if( data.DataInfo ) {
				 
					var cellVals = data.DataInfo.content;
					
					for(var i=0;i<refValidates.length;i++){//for(var i=0;i<validDefs.length;i++){
						var def = refValidates[i];
						
						if(!def) continue;
						
							var refCell = cellVals[def.cellCoordinate];
							var valuedExprs = [];
							for(var j=0;j<def.expression.length;j++) {
							    var form = def.expression[j];
			 
							    if(isContainRef(form)){
									var expr = {};
									expr.leftHand = getCellValue(def.cellCoordinate);
									expr.rightHand = setInnerCellValue(setRefCellValue(form, refCell));
		    
									valuedExprs.push(expr);
								} else {
									var expr = {};
									expr.leftHand = getCellValue(def.cellCoordinate);
									expr.rightHand = setInnerCellValue(form, refCell);
		
									valuedExprs.push(expr);
								}
//alert(expr);				
							}
							
							showValidateResult( valuedExprs, def);
					
					}
					$("img.jTip").hover(function(){
						$("#JT").remove();
						JT_showHtml(this.id,genIvalidateMsg($(this).attr("cooStr"),$(this).attr("expr"),$(this).attr("exprIdx")),null,null);
					});
				} else {
					alert(data.HeadInfo.Message);
				}
			} else {
				alert(data.HeadInfo.Message);
			}
		});
	} else {
		$("img.jTip").hover(function(){
			$("#JT").remove();
			JT_showHtml(this.id,genIvalidateMsg($(this).attr("cooStr"),$(this).attr("expr"),$(this).attr("exprIdx")),null,null);
		});
	}
	
	
}

function preHandleValidateDefs(){
	var newValidDefs = [];
	for(var i=0;i<validDefs.length;i++){
		if(!validDefs[i]){
			continue;
		}
		var newDef = {};
		$.extend(newDef, validDefs[i]);
		for(var j=0;j< newDef.refs.length;j++){
		    var ref = newDef.refs[j];
		    if(!ref){
		    	continue;
		    }
		    for(var k in ref.file) {
				if(k == "file"){
					continue;
				}
				var refParamDef = ref.file[k];
				var tmp = refParamDef;
				for(var key in params) {
					if(key == ""){
						continue;
					}
					
//				alert( "params :" + key + "=" + params[key] + "  " + tmp);
				
					var tmp = tmp.replace(new RegExp("[$]"+key,"g") ,params[key]); 
					
				}
				if(tmp != refParamDef){
					try{
						ref.file[k] = eval(tmp);
					} catch(e){
						alert("运算公式：" + tmp + "出错！");
					}		
				}
		    }
		}
		newValidDefs.push(newDef);
	}
//	alert(newValidDefs.length);
	return newValidDefs;
}

function escapeHtml(htmlStr) {
	return htmlStr.replace("<","&lt;").replace(">","&gt;");
}

function getRefs() {
	var refs = [];
	for(var i=0;i<validDefs.length;i++){
		var def = validDefs[i];
		if(def){
			for(var j=0;j<def.refs.length;j++){
				var ref = def.refs[j];
				//if(refs[ref.name] = ref
			}
		}
	}
}


function showComments(user,day){
	var msg = "无标注信息！";
	if(originalVals){
		
		for(var i=0;i<originalVals["comments"].length;i++){
			var com = originalVals["comments"][i];
			if(com.user == user && com.day == day){
				msg = decodeURI(com.data);
			}
		}
	}
	alert(msg);
}

function genHistoryInputsMsg(cooStr){
	if(originalVals) {
		var msg = "<table class='lightblue' border='0'> ";
		msg += "<tr style='text-align:center;'><td>补录值</td><td>补录人</td><td>补录时间</td><td>备注</td></tr>"
		for(var i=0;i<originalVals[cooStr].length;i++){
			msg += "<tr>"
			msg += "<td>" + originalVals[cooStr][i].data +"</td>";
			if(originalVals[cooStr][i].user!=""){
				msg += "<td>" + originalVals[cooStr][i].user +"</td>";
				msg += "<td>" + originalVals[cooStr][i].day +"</td>";
				msg += "<td style='cursor:pointer;color:blue;' onclick='showComments(\"" + originalVals[cooStr][i].user + "\",\"" + originalVals[cooStr][i].day + "\");' >" + "原因" +"</td>";		
			} else {
				msg += "<td colspan='3' > 原值 </td>"; 
			}
			msg += "</tr>";
		}
	    msg += "</table>";
	} else {
		return "无历史信息";
	}
	return msg;
}

function genIvalidateMsg(cooStr,exprStr,idxStr) {

	var validDef = null;
	for(var i=0;i<validDefs.length;i++){
		if(validDefs[i] && validDefs[i].cellCoordinate == cooStr){
			validDef = validDefs[i];
		}
	}
	var msg = "未能符合下列平衡校验公式：<br/>" ;
	var exprs = exprStr.split(";");
	var idxs = idxStr.split(";");
	if(exprs){
	for(var i=0;i<exprs.length;i++){
	        var htmlStr = validDef.expression[parseInt(idxs[i])]; 
			if(htmlStr){
				msg += escapeHtml(htmlStr) + "<br/>";
				msg += "<br/> 赋值结果为：<br/>" + exprs[i] + "<br/>" 
			}
		}
		msg += "<br/>****************<br/>";
	}
	if(validDef.refs.length > 0) {
		msg += "<br/> 参见：";
		for(var i=0;i<validDef.refs.length;i++){
			var ref = validDef.refs[i];
			if(ref){
				collectParams(params);
				var newParams = {};
				$.extend(newParams, params);				
				for(var key in ref.file){
					if(key == "file") {
						continue;
					}
					if( ref.file[key] && ref.file[key] != "null" && ref.file[key] != ""){
						var refParamDef = ref.file[key];
						newParams[key] = refParamDef;
					}
				}
				newParams.type = ref.file.file;
				
				newParams.op = "view";
		//		alert(ref.file.file + "  " + newParams.type);
				
				delete newParams.ajax;
				var href = "RegularReport?_code=" + encodeURI("汉语") + "&" + getQueryString(newParams);
				//alert(href);
				//msg += "<a href='javascript:open(\"" + href + "\",\"_blank\",\"status=yes,toolbar=no,menubar=no,location=no\");' > "+ ref.name +" </a>"; 
				msg += "<a target='_blank' href='" + href + "'> "+ ref.name +" </a>"; 
			
			}
		}
	}
	return msg;
}

function genAlramIconHtml(cooStr, col,row, msg, exprs, exprIdxs) {
    var exprResult = "";
    if(exprs){
	    for(var i=0; i<exprs.length; i++){
	    	exprResult += exprs[i] + ";";
	    }
	    var exprIdxStr = "";
	    for(var i=0;i<exprIdxs.length;i++){
	    	exprIdxStr += i + ";";
	    }
 	}
	return "<img id='info-" + cooStr + "' expr='" + (exprs ? exprResult : "") + "' exprIdx='" + (exprIdxs ? exprIdxStr : "") + "' cooStr='"+ cooStr +"' class='invalidateInfo jTip' x='" + col + "' y='" + row + "' src='images/hint.gif' "
	 + "alt='" + msg + "' />";
}

function isContainRef(expr){
	return expr.match(/[!][a-zA-Z]+\d+/);
}

function setInnerCellValue(expr) {
    var count = 0;
	while( (match = /[a-zA-Z]+\d+/.exec(expr)) != null){
		count++;
		if(count > 1000){
			break;
		}
		if( match.index>0 && expr.substring(match.index-1,match.index) == "!") { //ref cell 
			continue;
		} 
		
		var cooStr = match[0];
		expr = expr.replace(new RegExp(cooStr,"g"),getCellValue(cooStr));
		
	}
	return expr;
}

function setRefCellValue(expr, refcells) {
	for(var key in refcells) {
		expr = expr.replace(new RegExp(key,"g"), deformatValue(refcells[key]));
	}
	return expr;
}


function getCellValue(coordinateStr) {
	var text = getTdWraper(coordinateStr).text();
	
	return deformatValue(text);
/*
	if(!text || $.trim(text) == ""){
		return 0;
	} 
	var valText = text.match(/[-]?\d+[,\d]+[\.]?\d+/);
	var val = valText[0].replace(/,/g,"");
	return val;
*/
}

function deformatValue(valStr){
	valStr = valStr.replace(/\u00a0+/,"");
	if(!valStr || $.trim(valStr) == ""){
		return 0;
	}
//	alert(valStr);
	try { 
		var valText = valStr.match(/[-]?\d+[,0123456789]*[\.]?\d+|[-]?\d+|(0+(\.0+)?)/);
		var val = valText[0].replace(/,/g,"");
 //       var val = valStr.replace(/,/g,"");
		return val;
	} catch(e){
		alert(e.description + "\r\n无法识别的数值：'" + valStr + "'");
		return Number.NaN;
	}
}


function getCoordinate(str) {
    str = str.toUpperCase();
	if(!str.match(/[A-Z]+\d+/)) {
		return null;
	}
	var co = {};
	var col = str.match(/[A-Z]+/);
	co.row = str.substring(col[0].length,str.length) - 1;
	co.col = alphabetToInt(col[0]);
	return co;
}

function alphabetToInt(alp) {
	alp = alp.toUpperCase();
	if(alp.match(/[A-Z]+/)) {
		var ch = alp.charAt(alp.length - 1);
		var idx = ch.charCodeAt(0) - "A".charCodeAt(0);
		var curPos = 1;
		while (curPos < alp.length) {
		    ch = alp.charAt(alp.length - curPos - 1);
			var num = ch.charCodeAt(0) - "A".charCodeAt(0) + 1;
			for (var i = 0; i < curPos; i++) {
				num *= 26;
			}
			idx += num;
			curPos++;
		}
		//alert( alp + " =  " + idx);
		return idx;
	}
	//alert( alp + "= -1" );
	return -1;
}

function ajaxCall( param , callback, async){
/*
	if(callback) {
		ajaxPost(  "RegularReport",//"${proxyUrl}",   //ajaxPost( "${proxyUrl}RegularReport",
			param,callback ,async);
	} else {
		alert("必须定义回调函数！");
	}
*/
	ajaxUrlCall("RegularReport",param,callback,async);
}

function ajaxChartCall(param, callback){
	ajaxUrlCall("Chart",param,callback,true);
}



function auditInputs(param,callback){
	fintelligenAjaxCall("AuditorTable",param,callback);
}

function renderInputs(param,callback){
	fintelligenAjaxCall("AdjustTableAudit",param,callback);
}

function fintelligenAjaxCall(url, param, callback) {
	if(callback) {
		var url = url;
		$.ajax({
			type:"POST",
			url:url,
			cache: false,
			data:param,
			dataType:"html",
			success: callback
		});
	} else {
		alert("必须定义回调函数！");
	}
}

function initLayout($container) {
	var height = $container.height() - $(".toolbar").height() - $(".statusbar").height();
	var width = $container.width();
	//alert(document.compatMode + " " + $.support.boxModel + " " + isW3CBox());
	if(isW3CBox()) {
		var paddingHeight = $("#centerPan").outerHeight(true) - $("#centerPan").height();
		height -= paddingHeight;
		var paddingWidth =  $("#centerPan").outerWidth(true) - $("#centerPan").width();
		width -= paddingWidth;	
	}
	
	var southHeight = 0;
	
	$(".southPanel").each( function(){ 
		if($(this).css("display") == "block") {
			if($(this).height()>southHeight){
				southHeight = $(this).height();
			}
		}
	});
	
	height -= southHeight;
	
	$("#centerPan").css("top",$(".toolbar").height() + "px").css("height", height + "px").css("width",width + "px");	
}

function initLayoutOld(){
	var layout = $('body').layout( {
		center: {
			initHidden:false
		},
		north: {
			initHidden:<c:out value='${hideTop}' default='false' />,
			resizable:false,
			//closable: false,	
			slidable:false
		/*
			closable: false,
			resizable:false,
			spacing_open: 0
			*/
		},
		south: {
			initHidden:true,
			spacing_open: 0,
			size:'auto',
			minSize:25,
			resizable:false
		}
	
	});
	if($("body").height() <= 0 ) {
		needRelayout = true;
	}
	return layout;
}

function showCommentsPan(visible) {
	var $ctrl = $("#commentsCtrl");
	if(visible) {
		//$("#commentsPan").css({left:$ctrl.position().left /*+ $ctrl.width()*/ + "px",top:$ctrl.position().top + + $ctrl.width() + "px"});
		$("#commentsPan").css({left:'10%',top:'25px',width:'80%'});
	} else {
		$("#commentsPan").css({left:-9999,top:-9999});
	}
}

	
</script>

<style type="text/css">
html,body {
	overflow: hidden;
	width: 100%;
	height: 100%;
}

table {
	font-size: 12px;
	table-layout: auto;
	border: none;
	margin: 0;
}

table td {
	border: none;
	line-height: 1em;
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

span.dropdown {
	display: inline-block;
	border: solid 1px gray;
	padding: 0 12px 0 0;
	background-image: url('<%=basePath%>css/base/images/arrow_d.gif');
	background-repeat: no-repeat;
	background-position: right center;
	cursor: pointer;
}

span.dropdown input {
	margin: 0;
	border: none;
}

span.calendar {
	display: inline-block;
	border: solid 1px gray;
	padding: 0 18px 0 0;
	background-image: url('<%=basePath%>images/icons/calendar.gif');
	background-repeat: no-repeat;
	background-position: 99% center;
	cursor: pointer;
}

span.calendar input {
	margin: 0;
	border: none;
}

.fontctrl {
	cursor: pointer;
	font-weight: 600;
	font-family: Tahoma;
}

.fontEnlarge {
	font-size: 150%;
}

#commentsPan.close {
	position: absolute;
	top: -15px;
	right: -15px;
	width: 30px;
	height: 30px;
	border: solid 1px red;
	z-index: 10002;
	background-color: black;
}

.download {
	margin:1em;
	padding:1em;
	
}

.download .hl {
	border-bottom:solid 2px gray; 
}

.download .detail {
	margin-top:0.5em;
	padding-left:2em;
}

.download .downloadOp {
	margin:auto;
	text-align:center;
}

.download.error .downloadOp .cmd,
.download.info .downloadOp .cmd{
	display:none;
}

.download.error .downloadOp .cmd.info,
.download.info .downloadOp .cmd.info{
	display:block;
}


.download .downloadOp a {
	margin: 0.5em 2em;
}

#commentsPan.pdf .download.xls{
	 display:none;
}

#commentsPan.xls .download.pdf{
	 display:none;
}
<c:out value ="${specCss}" default =""  escapeXml ="false"/>

div#firstTimeComments {
	margin: 15em auto 0 auto;
	padding: 2.5em 1em 0 50%;
	background: url(css/base/images/blankreport/background.jpg) no-repeat
		20% top;
	width: 100%;
	height: 62%;
	text-align: left;
}

div#firstTimeComments div {
	font-size: 11pt;
	color: #999999;
	line-height: 24px;
}

div#firstTimeTitle {
	background: url(css/base/images/blankreport/title.png) no-repeat;
	text-indent: 30px;
	font-weight: 600;
	margin-bottom: 24px;
}

div#firstTimeCommentsContent {
	background-image: url(css/base/images/blankreport/info.png);
	background-repeat: no-repeat;
	text-indent: 30px;
	padding-top: 2px;
}
</style>
</head>

<body id="${bodyId}"
	style="overflow: hidden; width: 100%; height: 100%;">

	<ul class="toolbar" style="">
		<!-- 
		<li id="inputTab" class="tab" caption="查询条件" panel="inputPanel">
			<span>查询条件</span>
			<img style='position:absolute;right:3px;top:3px;' src='images/icons/unpin-red.png' />
		</li>
 
		<li id="commentsTab" class="tab" style="background-image: url(css/base/images/oparea/info.png);"
			caption="温馨提示" panel="commentsPanel">
			<span>温馨提示</span>
			<img style='position:absolute;right:3px;top:3px;' src='images/icons/unpin-red.png' />
		</li>
		<li id="mySpaceTab" class="tab"
			style="background-image: url(css/base/images/oparea/my-account.png);"
			caption="我的下载" panel="mySpacePanel">
			<span>我的下载</span>
			<img style='position:absolute;right:3px;top:3px;' src='images/icons/unpin-red.png' />
		</li>
-->
		${cmdIcons}
		<!--  
		<li id="refresh" class="cmd"
			caption="刷新" style="background-image: url(images/icons/refresh.png);"></li>
		<li id="print" class="cmd" style="background-image: url(images/icons/print.png);"></li>
		<li id="exportPdf" class="cmd"
			style="background-image: url(images/icons/pdf-export.png);"></li>
		<li id="exportExcel" class="cmd"
			style="background-image: url(images/icons/export_excel.png);"></li>
		<li id="editReport" class="cmd" caption="补录"
			style="background-image: url(images/icons/Input-Tablet-32.png);"></li>
		<li id="enlargeFont" class="cmd"
			style="background-image: url(images/icons/font-size-more.png);"></li>
		<li id="shrinkFont" class="cmd"
			style="background-image: url(images/icons/font-size-less.png);"></li>
-->
	</ul>

	<div id="centerPan" class="ui-layout-center"
		style="position: relative; top: 36px; padding: 1em 2px 0 2px; margin: 0; text-align: center; width: 100%; height: 100%; overflow: auto;">
		${reportHtml }

		<!--div style="position:absolute;top:5px;left:5px;height:48px;line-height:48px;text-valign:bottom;color:#999999;background:no-repeat url(images/finger-up.png);padding:0 0 0 32px;">鼠标移到这里，录入查询条件</div -->
	</div>

	<div class="tabPanel" id="inputPanel">
		<span class="tabtitle" style="">请录入查询条件：</span> ${inputPan } ${buttons
		}
	</div>

	<div class="tabPanel" id="commentsPanel">
		<span class="tabtitle" style="">提示信息：</span>
		<div
			style="width: 100%; height: 100%; background-color: white; color: gray; padding: 1em; line-height: 1.5em;">${comments
			}</div>
	</div>

	<div class="tabPanel" id="mySpacePanel">
		<ul class="fileList">
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>zfafdasdfasfasdf生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>
			<li style="background-image: url(images/icons/file-xls.png)"><span>阿斯顿发生发达.xls</span></li>

		</ul>
	</div>

	<div id="southPan" class="statusbar">
		<div id="statusMsg" style="float: left;"></div>
		<div id="pageNavi" style="display: none; float: right;">
			<span id="totalPages"></span> <a id="firstPageBtn" href="#" page="0"
				section="0">首页</a> <a id="prevPageBtn" href="#" page="0" section="0">上一页</a>
			<span id="curPage"></span> <a id="nextPageBtn" href="#" page="0"
				section="0">下一页</a> <a id="lastPageBtn" href="#" page="0"
				section="0">末页</a> <a id='gotoPageBtn' href='#'>转到</a><input
				id='gotoPage' type='text' maxlength='5' />页
		</div>
	</div>


	<div id="mask"
		style="position: absolute; z-index: 10000; width: 110%; height: 100%; top: -9999px; left: -9999px; margin: 0; font-size: 10pt; font-weight: bold; background-color: lightblue; filter: Alpha(opacity =         40); opacity: 0.3; -moz-opacity: 0.3; text-align: center; padding-top: 0; overflow: hidden;">
		<div style='margin: 20%; margin-left: 10%; text-align: center;'>
			<img src='<%=basePath%>images/loading.gif' />
			<div id="cancelBtn" style="cursor: pointer; margin: 1em; color: red;">
				点击这里取消</div>
		</div>
	</div>
	<div id="commentsPan"
		style="position: absolute; z-index: 10001; top: -9999px; left: -9999px;">
		<div class="close"
			style="position:absolute;top:-13px;right:-13px;width:25px;height:25px;background-image:url(<%=basePath%>css/base/images/close.gif);background-repeat:no-repeat;cursor:pointer;"></div>
		<div class="download pdf">
			<div class="hl">PDF下载</div>
			<div class="detail">...</div>
			<div class="downloadop">
				<a class="cmd info" id="cancelPdf" href="javascript:">放弃下载</a> 
				<a class="cmd error" style="display:none;" id="retryPdf" href="javascript:">重新下载</a> 
				<a class="cmd" id="redownloadPdf" href="javascript:">删除并重新下载</a> 
				<a class="cmd" id="downloadPdf" href="javascript:">立即下载</a> 
			</div>
		</div>
		<div class="download xls">
			<div class="hl">Excel下载</div>
			<div class="detail">...</div>
			<div class="downloadop">
				<a class="cmd info" id="cancelXls" href="javascript:">放弃下载</a> 
				<a class="cmd error" style="display:none;" id="retryXls" href="javascript:">重新下载</a> 
				<a class="cmd" id="redownloadXls" href="javascript:">删除并重新下载</a> 
				<a class="cmd" id="downloadXls" href="javascript:">立即下载</a> 
			</div>
		</div>
	</div>

	<div id="editPanel" class="southPanel"
		style="display: none; position: absolute; bottom: 0; left: 0; width: 100%; z-index: 200; background-color: gray;">
		<div style='margin-top: .5em; margin-left: .5em;'>录入补录原因:</div>
		<textarea id='inputComments' style='width: 100%; height: 5em;'></textarea>
		<div style="float: right; width: 100%;">
			<input id='inputCancel' type='button' value='取消'
				style='float: right; margin-left: 1em; margin-right: 1em;' /> <input
				id='inputSave' type='button' value='存为草稿'
				style='float: right; margin-left: 1em; margin-right: 1em;' /> <input
				id='inputOK' type='button' value='提交'
				style='float: right; margin-left: 1em; margin-right: 1em;' />"
		</div>
	</div>

	<div id="auditEditPanel" class="southPanel"
		style="display: none; position: absolute; bottom: 0; left: 0; width: 100%; z-index: 200; background-color: gray;">
		<div style='margin-top: .5em; margin-left: .5em;'>批复:</div>
		<textarea id='auditInputComments' style='width: 100%; height: 5em;'></textarea>
		<input id='auditCancelBtn' type='button' value='取消'
			style='float: right; margin-left: 1em; margin-right: 1em; font-size: 9pt;' />
		<input id='aggreeBtn' type='button' value='同意'
			style='float: right; margin-left: 1em; margin-right: 1em; font-size: 9pt;' />
		<input id='disaggreeBtn' type='button' value='不同意'
			style='float: right; font-size: 9pt;' />
	</div>
</body>

</html>
