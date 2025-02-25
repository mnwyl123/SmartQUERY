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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<!--  base href="<%=basePath%>" -->
		<title>My JSP 'reportViewer.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/base/regularReportGrid.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/base/inputPanel.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/styles.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/table.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/base/ui.all.css">
		
		<!-- customer define skin -->	
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/${skin}regularReportGrid.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>css/${skin}inputPanel.css">
		<!-- customer define skin end -->
		
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jtip.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.layout.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.ztree.all-3.0.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery.autocomplete.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery.selectboxes.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery-ui-1.7.2.custom.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/dateSelect.js" charset="UTF-8"></script>
	<script type="text/javascript" src="<%=basePath%>js/graphics.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.common.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/swfobject.js"></script>
<script type="text/javascript">
var invalidateMsgs = {};
var usePrintDlg = true;

var $layout;
var aal=<c:out value="'${aal}'" default="null" escapeXml="false" />;
var canDoEdit=<c:out value="${canDoEdit}" default="null" />;
var canDoAuditEdit=<c:out value="${canDoAuditEdit}" default="null" />;
var partPrintPaper="${partPrintPaper}";
var runInFintelligen = ${runInFintelligen};
var fintelligenVer = "${fintelligenVer}";
var needAuth = <c:out value="${needAuth}" default="false" />;
var params = {ajax:1,${userIdDef}type:'${fileType}'};
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

var editableCellDefs = [
<c:forEach items="${editableCellDefs}" var="cell">"${cell}",</c:forEach>
];

var autocompletes = <c:out value="${autocompletes}" default="{}" escapeXml="false"/>;
var znodeses = <c:out value="${znodeses}" default="{}" escapeXml="false"/>;

var originalVals = <c:out value="${originalVals}" default="null" />;
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

$( function() {
	
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
	
	$layout = initLayout();
	
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
	
	$("#commentsCtrl").click(function(){
		showCommentsPan(true);
	});
	
	$("#commentsPan .close").click(function() {
		showCommentsPan(false);
	});

	$(".fontctrl").click(function(){
		var size = $("table.regularTable").css("font-size");
		var org = parseInt(size);
		var diff = org * 0.1 ;
		if(diff < 1) {
			diff = 1;
		}
		if($(this).hasClass("fontEnlarge")) {		 			
			$("table.regularTable").css("font-size",org + diff + "px");			
		} else if($(this).hasClass("fontShrink")) {
			if(org - diff < 6) {
				return;
			}
			$("table.regularTable").css("font-size",org - diff + "px");
		}
		return false;
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
	
	$( "#invalidateMsg" ).draggable({handle:"p"});
	
	$("#closeHint").click(function(){
		$( "#invalidateMsg" ).css("display","none");
	});

	$("#cancelBtn").click(function(){
		if( cur_xhr ){
   		    //alert("do cancel");
   			cur_xhr.abort();
		}
		unmask();
	});
	
	$("#viewReportBtn").click(function(){
		queryReport();
		return;
/*		if( cur_xhr ){
		    		    //alert("do cancel");
		    			cur_xhr.abort();
		}
		
		params.branch = $("#branchSelector").selectedValues()[0];
		params.branchCap = $("#branchSelector").selectedTexts()[0].replace(/\u00a0+/,"");
		params.day = $("#publishTime").attr("value");
		params.ccy = $("#ccySelector").selectedValues()[0];
		params.ccyCap = $("#ccySelector").selectedTexts()[0];
		params.hasCoordin = $("#coordinRadio").attr("checked");
		params.page = 0;
		*/		
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
	});
	
	$("#refreshReportBtn").click(function(){
/*		if( cur_xhr ){
		    		    //alert("do cancel");
		    			cur_xhr.abort();
		}
		
		params.branch = $("#branchSelector").selectedValues()[0];
		params.branchCap = $("#branchSelector").selectedTexts()[0].replace(/\u00a0+/,"");
		params.day = $("#publishTime").attr("value");
		params.ccy = $("#ccySelector").selectedValues()[0];
		params.ccyCap = $("#ccySelector").selectedTexts()[0];
		params.hasCoordin = $("#coordinRadio").attr("checked");
		params.page = 0;
		*/
		
		if( !validateInputs() ) {
			return;
		}
		if( confirm("刷新操作将清除报表缓存，重新查询数据库，这可能会给数据库服务器带来不必要的负荷，继续么？") ){
			
			collectParams(params);
			/*
			params.op = "refresh";
			params.page = 0;
	    	params.section = 0;
			refreshReport();
			*/
			doRefreshReport();
		}
	});
	
	$("#refreshChartBtn").click(function(){	
		if( !validateInputs() ) {
			return;
		}
		if( confirm("刷新操作将清除报表缓存，重新查询数据库，这可能会给数据库服务器带来不必要的负荷，继续么？") ){
			doRefreshChart();
		}
	});
	
	$("#viewChartBtn").click(function(){
		
		if( !validateInputs() ) {
			return;
		}
		
		collectParams(params);
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
	});
	
	
	$("#validBtn").click(function(){
		invalidateMsgs =  {};
		collectParams(params);
		params.op = "setValidate";
		var rowCount = $(".regularTable tr").size() - 1;
		g_lineIdx = 0;
		//timerId = window.setInterval(validateAllLines(params),500);
		for(var idx =0;idx<rowCount;idx++) {
		    validateOneLine(params,idx);
		}
		/*
			$("img.jTip").click(function(){
			    $("#invalidateMsg").css("display","block");
			    $("#msgText").html(invalidateMsgs[$(this).attr("id")]);
			});
		*/
	});
	
	$("#writebackToDbBtn").click(function(){
		collectParams(params);
		params.op = "writeback";
		var args = {};
		args.params= params;
		args.rowCount= $(".regularTable tr").size() - 1;
		showModalDialog("RegularReport?dlg=writeback.dlg.jsp",args);
		
	});
	
	$("#inputAuditButton").click(function(){
	//	if(originalVals) {
//			collectParams(params);
//			params.op = "viewAuditData";
//			refreshReport();
/*			
			for(var cooStr in originalVals){
				if(cooStr == "comments" ){
					continue;
				}
				var val = $.trim(originalVals[cooStr][0].data);
				var $td = getTdWraper(cooStr);
				if($.trim($td.text()) != val) {
					$td.append(genAlramIconHtml(cooStr,-1,-1,""));//"原值：" + ("" == val ? "无" : val)));
				}
			}
			
			$("img.jTip").hover(function(){
					$("#JT").remove();
					JT_showHtml(this.id,genHistoryInputsMsg($(this).attr("cooStr")),null,null);
			});
*/
	//	}
		collectParams(params);
		params.op = "viewAuditData";
		refreshReport(true);
		
		$("#southPan").html("<div style='margin-top:.5em;margin-left:.5em;'>批复:</div>"
			 + "<textarea id='auditInputComments' style='width:100%;height:5em;'></textarea> "
			 + "<input id='auditCancelBtn' type='button' value='取消' style='float:right;margin-left:1em;margin-right:1em;font-size:9pt;' /> "
			 + "<input id='aggreeBtn' type='button' value='同意' style='float:right;margin-left:1em;margin-right:1em;font-size:9pt;' /> "
			 + "<input id='disaggreeBtn' type='button' value='不同意' style='float:right;font-size:9pt;' /> ");
		$layout.show("south");
		$("#aggreeBtn").click(function(){
			 collectParams(params);
			 params.comments = encodeURI($("auditInputComments").val());
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
				     finParams.remarkEncode = encodeURI($("auditInputComments").val());
				     auditInputs(finParams, function(data){
				     	alert(data);
				     });   
			     } else {
			     	alert("操作成功！");
			     }
			     $layout.hide("south");
		     } else {
		     	alert(msg);
		     }
		});
		
		$("#disaggreeBtn").click(function(){
			 collectParams(params);
			 params.comments = encodeURI($("auditInputComments").val());
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
			     $layout.hide("south");
		     } else {
		     	alert(msg);
		     }
		});
		$("#auditCancelBtn").click(function(){
			$layout.hide("south");
		});
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
		var tmpCells = {};

		for(var idx=0;idx<editableCells.length;idx++){
			var val = editableCells[idx];
		    if(val) {
				var coo = getCoordinate(val);
				var id = coo.col + "," + coo.row;
				tmpCells[id] = {val:val,idx:idx};
			}
		}
		
		$("table.regularTable td").each(function() {
			var id = $(this).attr("x") + "," + $(this).attr("y");	
			if(tmpCells[id]){
			 	var val = tmpCells[id].val;
			 	var idx = tmpCells[id].idx;   
			    var draftVal = getDraftVal(val);
						//alert(val + "=" + draftVal);
				$(this).attr("valign","bottom")
					.attr("oldval",$(this).text())
					.css("padding-bottom","0")
					.html("<input type='text' id='" + val + "' idx='" + idx + "'style='border:none;border-bottom:solid 1px red;width:100%;' value='" + ((draftVal!=null) ? draftVal : $(this).attr("val"))  + "' />");
			}   
		});
		
		$("#southPan").html("<div style='margin-top:.5em;margin-left:.5em;'>录入补录原因:</div><textarea id='inputComments' style='width:100%;height:5em;'></textarea>"
		+ " <input id='inputSave' type='button' value='存为草稿' style='float:right;margin-left:1em;margin-right:1em;font-size:9pt;' />"
		+ " <input id='inputOK' type='button' value='提交' style='float:right;margin-left:1em;margin-right:1em;font-size:9pt;' />" 
		+ " <input id='inputCancel' type='button' value='取消' style='float:right;font-size:9pt;' /> ");
		$layout.show("south");

		if(modifyDraftComments){
			$("#inputComments").val(decodeURI(modifyDraftComments));
		}
		
		$("#inputSave").click(function(){
			/*
			var vals = {};
			$("table.regularTable input[type=text]").each(function(){
			    var inputVal = $(this).attr("value");
			   // alert( inputVal + "=" + $(this).parent().attr("val"));
			    if(inputVal != $(this).parent().attr("val")) {
					vals[$(this).attr("id")] = {val:inputVal,def:editableCellDefs[$(this).attr("idx")]};
				}
			});
			*/
			var vals = collectInputDatas();
			if(JSON.stringify(vals) == "{}"){
				alert("没有修改任何值！");
				return;
			}
			collectParams(params);
			params.inputVals = JSON.stringify(vals);
//			alert(params.inputVals);
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
		
		$("#inputOK").click(function(){
		/*
			var vals = {};
			$("table.regularTable input[type=text]").each(function(){
			    var inputVal = $(this).attr("value");
//			    alert( inputVal + "=" + $(this).parent().attr("val"));
			    if(inputVal != $(this).parent().attr("val")) {
					vals[$(this).attr("id")] = inputVal;
				}
			});
			*/
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
		});
		$("#inputCancel").click(function(){
			$("table.regularTable input[type=text]").each(function(){
				$(this).parent().text($(this).parent().attr("oldval"));
			});
			$layout.hide("south");
		});
	});
	
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
		var idx = window.location.href.indexOf("?");
		var urlStart = window.location.href.substring(0,idx);
		var url = "?_code=" + encodeURI("汉语") +  "&" + getQueryString(params);
		if(fromProxy()){
			//url = "${proxyUrl}?target=RegularReport" + encodeURI(url.replace(/&/g,"^"));
			url = urlStart + url + "&target=RegularReport";//"<%=basePath%>RegularReport" + url;
		} else  {
			
			url = urlStart + "Print" + url;		
		}
		var dlgParams = {};

		dlgParams.url = url;
		dlgParams.printSetting = printSetting;
		dlgParams.partPrintPaper = (partPrintPaper=="" ? null : partPrintPaper);
		//alert(partPrintPaper + "==" + dlgParams.partPrintPaper);
		var sFeatures="dialogHeight:400px;dialogWidth:550px;center:true;status:no;resizable:yes;";//
		
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
			    showModalDialog( "<%=basePath%>" + page, dlgParams,  sFeatures);
		    } else {
				showModalDialog(page, dlgParams,  sFeatures);
			}
		} else {
			top.showModelessDialog("printer/print.dlg.jsp", top,  sFeatures);
		}
//		showModalDialog("printer/print.dlg.jsp",url, sFeatures);
/*		
		printer.setUrlStr ( urlStart + "?code=" + encodeURI("汉语") +  "&" + getQueryString(params) );
		printer.print();
		var title = document.title;
		document.title = "";
		//window.print();
		document.title = title;
*/		
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


	$("#coordinRadio").click(function(){
		$(this).attr("checked",!$(this).attr("checked"));
	});
	
	$("a.dataNavi").click(dataNaviClick);
	
	
	$(window).resize(function(){
		$layout.resizeAll();
		drawTopLeftCell();
//		alignInputCtrls();
	});
	
	updateUI();
	
	initSwf();
	
	alignInputCtrls();
	
	if(aal && aal == 'queryreport') {
		queryReport(); 
	} else if(aal && aal == 'validate') {
		queryReport();
	}
	
	initTimer();
	
	
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
	timer = setInterval(onTimer,500);
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
	if( commentShowTime > 0 ) {
		showCommentsPan(true);
		autoShowComments = true;
	}
}

function dataNaviClick(event) {
	event.stopPropagation();
	var option = "left=0,top=0,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,scrollbars=yes";
	window.open($(this).attr("href"),"",option,false);
	return false;
}

function alignInputCtrls() {
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
	$("#fontcontroller").show();
	drawTopLeftCell();
}

function collectInputDatas(){
	var vals = {};
	$("table.regularTable input[type=text]").each(function(){
	    var inputVal = $.trim($(this).attr("value"));
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
		painter.drawLine($(this).offset().left,$(this).offset().top - $("#northPan").height()-6,
			$(this).offset().left+$(this).width(),
			$(this).offset().top + $(this).height() - $("#northPan").height()-6);
		/*
		painter.drawLine(0,0,
			$(this).width(),
			$(this).height());
			*/
	});
	painter.paint();
}

function dependsInputChange($ctrl, dependeeId, dependeeVar) {
	collectParams(params);
	var ps = {
			ajax:1,
			type:params.type,
			ctrl:"select",
			op:"updateCtrl",
			dependee:dependeeVar,
			def:$("#"+dependeeId).attr("default"),
			depends:$ctrl.attr("id"),//dependsId,
			val:$ctrl.selectedValues()[0],
			cap:$ctrl.selectedTexts()[0],
			params:JSON.stringify(params)
			};
		
//		mask();
		ajaxCall(ps,function(data){
		    if( data.HeadInfo.Code == 0 ){
		    	var html = data.DataInfo.options;
		    	if($.trim(html)==""){
		    		html = "<option />";
		    	}
		    	$("#"+dependeeId).html(html);
		    	//$("#"+dependeeId).html(data.DataInfo.options);
		    } else {
		    	alert(data.HeadInfo.Message);
		    }
		    var $dependeeee = $("select.paramInput[depends='"+ dependeeId +"']"); 
		    if($dependeeee.size() > 0) {
		    	dependsInputChange($("#"+dependeeId),$dependeeee.attr("id"),$dependeeee.attr("var"));
		    }
//			unmask();
		});
}

function initDependsInputControls() {

	$("select.paramInput").each(function(){
		var dependeeId = $(this).attr("id");
		var dependeeVar = $(this).attr("var");
		var dependsId = $(this).attr("depends");
		if(dependsId && dependsId != ""){
			//dependsInputChange($("#"+dependsId),dependeeId,dependeeVar);
			/*
			var param = {
					ajax:1,
					type:params.type,
					ctrl:"select",
					op:"updateCtrl",
					dependee:dependeeVar,
					depends:dependsId,
					val:$("#"+dependsId).selectedValues()[0],
					cap:$("#"+dependsId).selectedTexts()[0]
					};
				mask();
				ajaxCall(param,function(data){
				    if( data.HeadInfo.Code == 0 ){
				    	var html = data.DataInfo.options;
				    	if($.trim(html)==""){
				    		html = "<option />";
				    	}
				    	$("#"+dependeeId).html(data.DataInfo.options);
				    } else {
				    	alert(data.HeadInfo.Message);
				    }
					unmask();
				});
				*/
			$("#" + dependsId).change(function(){
				dependsInputChange($(this),dependeeId,dependeeVar);
				/*
				var ps = {
					ajax:1,
					type:params.type,
					ctrl:"select",
					op:"updateCtrl",
					dependee:dependeeVar,
					depends:dependsId,
					val:$(this).selectedValues()[0],
					cap:$(this).selectedTexts()[0]
					};
				
				mask();
				ajaxCall(ps,function(data){
				    if( data.HeadInfo.Code == 0 ){
				    	$("#"+dependeeId).html(data.DataInfo.options);
				    } else {
				    	alert(data.HeadInfo.Message);
				    }
					unmask();
				});
				*/
			});
		}
	});	
	
	$(".itext").each(function(){
		var dependeeId = $(this).attr("id");
		var dependeeVar = $(this).attr("var");
		var dependsId = $(this).attr("depends");
		if(dependsId && dependsId != ""){
			var param = {
					ajax:1,
					type:params.type,
					ctrl:"itext",
					op:"updateCtrl",
					dependee:dependeeVar,
					depends:dependsId,
					val:$("#"+dependsId).selectedValues()[0],
					cap:$("#"+dependsId).selectedTexts()[0]
					};
				mask();
				ajaxCall(param,function(data){
				    if( data.HeadInfo.Code == 0 ){
				    	
				    	var key = dependeeId;
				    	
				    	autocompletes[key] = data.DataInfo.options;
				    	var maxlen = 6;
						for(var i=0;i<autocompletes[key].length;i++){
							maxlen = autocompletes[key][i][0].length>maxlen ? autocompletes[key][i][0].length : maxlen;
						}
						
						//alert(key);
						$("#"+key).setOptions({"data":autocompletes[key]}).css("width",maxlen + "em");
						
				    	
				    } else {
				    	alert(data.HeadInfo.Message);
				    }
					unmask();
				});
			$("#" + dependsId).change(function(){
				var ps = {
					ajax:1,
					type:params.type,
					ctrl:"itext",
					op:"updateCtrl",
					dependee:dependeeVar,
					depends:dependsId,
					val:$(this).selectedValues()[0],
					cap:$(this).selectedTexts()[0]
					};
				
				mask();
				ajaxCall(ps,function(data){
				    if( data.HeadInfo.Code == 0 ){
				    	
				    	var key = dependeeId;
				    	$("#"+key).val("");
				    	autocompletes[key] = data.DataInfo.options;
				    	var maxlen = 6;
						for(var i=0;i<autocompletes[key].length;i++){
							maxlen = autocompletes[key][i][0].length>maxlen ? autocompletes[key][i][0].length : maxlen;
						}
						
						$("#"+key).setOptions({"data":autocompletes[key]}).css("width",maxlen + "em");
						
				    	
				    } else {
				    	alert(data.HeadInfo.Message);
				    }
					unmask();
				});
			});
		}
	});	

	$("span.DateSelect").each(function(){
	    var dependeeId = $(this).attr("id");
		var dependsId = $(this).attr("depends");
		if(dependsId && dependsId != ""){
			var formatStr = $(this).attr("optionType");
			
			if(formatStr.indexOf("$")>=0) {				
			    $(this).attr("optionType", $("#" + dependsId).val());
				$("#" + dependsId).change(function(){
				    $("#" + dependeeId).attr("optionType", $("#" + dependsId).val());
					initInputControl(dependeeId);
				});
			}
		}
	});
	
}

function disableCtrls() {
	
	$(".inputPanel input.paramInput.disable,.inputPanel select.paramInput.disable,.inputPanel .paramInput.disable select,,.inputPanel .paramInput.disable input").attr("disabled",true);
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
				$(".datePicker").datepicker({
					showOn:'button',
					buttonImage:'<%=basePath%>images/calendar.png',
					buttonImageOnly:true,
					showButtonPanel: true,
					changeMonth: true,
					changeYear: true,
					dateFormat:'yymmdd'
				}
						//$.datepicker.regional['zh-CN']
	);	
				

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
}

function initInputControl(id){
    var $comp = $("#" + id);
	if( $comp.hasClass("DateSelect") ){
		initDateSelect($comp);
	}
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

	$("select.paramInput").each(function(){
		params[$(this).attr("var")] = $(this).selectedValues()[0] ? $(this).selectedValues()[0] : '';
		var varCap = $.trim($(this).attr("varCap"));
		if(varCap != null && $.trim(varCap)!="") {
			params[varCap] = $(this).selectedTexts()[0] ? $(this).selectedTexts()[0].replace(/\u00a0+/,"") : '';
		}
		
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
		
			
		if($(this).hasClass("datePicker")){
			params[$(this).attr("varCap")] = $.datepicker.formatDate($(this).attr("capFormat"),$(this).datepicker("getDate"));
		}
	});
	
	$("input.paramInput[type=hidden]").each(function(){
		params[$(this).attr("var")] = $.trim($(this).val());
		if($(this).attr("varCap")){
			params[$(this).attr("varCap")] = $(this).attr("capValue");
		}
		
		//params[$(this).attr("varCap")] = ;
	});
	
	$("span.DateSelect").each(function(){
		if($(this).hasClass("paramInput")){
			var id = $(this).attr("id");
			var yearWrap = $("#" + id + " .year");
			var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
			var dWrap = $("#" + id + " .TenDay");
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
			
		}
	});
	//following 4 para is for fintelligen's workflow
	
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

function collectParamsOld(params) {
	params.branch = $("#branchSelector").selectedValues()[0];
	params.branchCap = $("#branchSelector").selectedTexts()[0].replace(/\u00a0+/,"");
	params.day = $("#publishTime").attr("value");
	params.ccy = $("#ccySelector").selectedValues()[0];
	params.ccyCap = $("#ccySelector").selectedTexts()[0];
	params.hasCoordin = $("#coordinRadio").attr("checked");
	params.page = 0;
	return params;
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
		

		
	} else {
		alert(data.HeadInfo.Message);
	}
	unmask();
	updateUI();
	
}

function afterReportLoaded() {
	if(aal && aal == "validate") {
		$("#validBtn").click();
	}
}

function loadReportWorker(data) {

	if( data.HeadInfo.Code == 0 ){
		if(data.DataInfo.pageNavi) {
			$("#southPan").html(data.DataInfo.pageNavi);
			$layout.show("south");
		} else if(data.DataInfo.includeAuditData){
			$layout.show("south");
		}
		else {
			$layout.hide("south");
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
	    
		$("#centerPan").html(data.DataInfo.content);
		
		$("#prevPageBtn,#nextPageBtn").click(function(event){
			event.stopPropagation();
			params.op = "view";
			params.page = $(this).attr("page");
			params.section = $(this).attr("section");
			refreshReport();
			
			return false;
		});
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
		$("#gotoPageBtn").click(function(event){
			event.stopPropagation();
			var pageNo = $("#gotoPage").attr("value");
			if($.trim(pageNo) == ""){
				alert("请录入页码！");
				return false;
			}
			params.op = "view";	
			params.page = pageNo - 1; //$("#gotoPage").attr("value") - 1;
			params.section = "all";
			refreshReport();						
			return false;
		});
		
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
	}
	bindClick2Tr();
	updateUI();
	unmask();
	if($("body").height() <= 0 ) {
		needRelayout = true;
	}
	afterReportLoaded();
}

function parseUrlQuery( urlQuery ){
	var result = new Array();
	var count = 0;
	var paramArray = urlQuery.split("&");
	if (paramArray.length < 1)
		return null;
	for ( var i = 0; i < paramArray.length; i++) {
		if (paramArray[i] == null || paramArray[i] == "") {
			continue;
		}
		result[count] = paramArray[i];
		count++;
	}
	
	var params = {};
	
	for(var index = 0 ; index < paramArray.length ; index++) {	
		var paramItem = paramArray[index];	
		var pos = paramItem.indexOf("=");
		var paramKey = $.trim(paramItem.substring(0,pos));
		var paramValue = $.trim(paramItem.substring(pos+1,paramItem.length));
		params[paramKey] = paramValue;		
	}
	return params;
}

function validateAllLines(params){
	alert('in' + g_lineIdx);
		var rowCount = $(".regularTable tr").size() - 1;
		if(g_lineIdx>=rowCount){
			clearInterval(timerId);
			alert(g_lineIdx);
			return;
		}
		validateOneLine(params,g_lineIdx);
		g_lineIdx++;
	}

function validateOneLine(params , idx) {
	var $tds = $($(".regularTable tr").get(idx+1)).children();
	$($tds[$tds.size()-2]).css("background-color","yellow");	
	params.rowIdx = idx;
	ajaxCall(params, 
		function(data) {
			if( data.HeadInfo.Code == 0 ){
				if( data.DataInfo ) {
				    // alert("responsen: " + (data.DataInfo.rowIdx +1) );
				     var i = parseInt(data.DataInfo.rowIdx);
				     var result = parseInt(data.DataInfo.result);
				     var $tds = $($(".regularTable tr")[i+1]).children();
				    
				     if(result < 0){		     	
				     	$($tds[$tds.size()-2]).html("未定义校验规则");
				     } else if(result == 0){
				     	$($tds[$tds.size()-2]).html("通过").css("background-color","green");
				     } else {
				     	$($tds[$tds.size()-2]).html("未通过<img  class='invalidateInfo jTip' src='images/hint.gif' id='" + i + "'>" ).css("background-color","red");
				     	$($tds[$tds.size()-1]).children().filter("span[op=compare]").css("display","inline-block");
				     	invalidateMsgs[i] = {msg:data.DataInfo.msg,info:data.DataInfo.info,aliasIdxMap:data.DataInfo.aliasIdxMap};
				     	$("img.jTip#" + i).click(function(){
				     		$("#southPan").html(invalidateMsgs[i].msg);
				     		//$layout.open("south");
				     		$(".brule").hover(function(){
				     				$(this).css("background-color","lightblue");
				     			},function(){
				     				$(this).css("background-color","");
				     			}).dblclick(function(){
				     				alert("click");
				     			});
						   $("#invalidateMsg").css("display","block");
						    $("#msgText").html(invalidateMsgs[i].msg);
						});
				     }
					 //$($(".regularTable tr").get(i+1)).children().css("background-color","green");
				} else {
					alert(data.HeadInfo.Message);
				}
			} else {
				alert(data.HeadInfo.Message);
			}
		},false);
		
}

function genReportUrl(opCtrl) {
	var inputParams = parseUrlQuery($(opCtrl).attr('param'));
		collectParams(params);
	var newParams = {};
	$.extend(newParams, params);				
	for(var key in inputParams){
		if( inputParams[key] ){
			if(key.toUpperCase() == "S_ID"){
				continue;
			}
			var refParamDef = inputParams[key];

			newParams[key] = refParamDef;
		}
	}
	newParams.op = "view";
	var href = "${proxyUrl}?";
	for(var key in newParams){
		if(key=="ajax"){  // || 
			continue;
		}
	//	alert( "key='" + key +"'");
		href += key + "=" + newParams[key] + "&";
	}
	href += "_code=" + encodeURI("汉语") ;
	return href;
}


function bindClick2Tr() {
	$(".regularTable tr").each(function(rowNo){
	    if(rowNo == 0){
	    	/*
	    	$(this).append("<th style='background-color:" + $($(this).children()[0]).css("background-color") 
	    		+ ";text-align:"+$($(this).children()[0]).css("text-align")+"'>操作</th>");
	    */
	    	$(this).append("<th class='colLeaf col' style='font-weight:" + $($(this).children()[0]).css("font-weight") +"; text-align:"+$($(this).children()[0]).css("text-align")+"'>操作</th>");
		} else {
	        var href = "";
			$(this).children().each(function(){
				if($(this).text().match(/type\s*=.*/)){
				    href += $(this).text();
				    return;
				}
			});
			
			$(this).append("<td style='background-color:"+ $($(this).children()[0]).css("background-color") +";'><span class='op' op='view' rowNo='"+ (rowNo-1) +"' param='" + href + "'>查看</span>"
				+ "<span class='op' op='compare' style='margin-left:0.5em;display:none;' rowNo='" + (rowNo-1) +"' param='" + href + "'>检查</span>"
				+ "<span class='op' op='validate' style='margin-left:0.5em;' rowNo='" + (rowNo-1) +"'>校验</span>"
				+"</td>");
		}
	});
	
	$(".regularTable .op").click(function(){
	 	if($(this).attr('op') == "view"){
	 		var inputParams = parseUrlQuery($(this).attr('param'));
	 		collectParams(params);
			var newParams = {};
			$.extend(newParams, params);				
			for(var key in inputParams){
				if( inputParams[key] ){
					if(key.toUpperCase() == "S_ID"){
						continue;
					}
					var refParamDef = inputParams[key];
	
					newParams[key] = refParamDef;
				}
			}
			newParams.op = "view";
			var href = "${proxyUrl}?";
			for(var key in newParams){
				if(key=="ajax"){  // || 
					continue;
				}
			//	alert( "key='" + key +"'");
				href += key + "=" + newParams[key] + "&";
			}
			href += "_code=" + encodeURI("汉语") ;
			//alert(href);
			var sFeatures="status:no;resizable:yes;";
			open(href,"",sFeatures);
	 	} else if($(this).attr('op') == "validate") {
	 		collectParams(params);
			params.op = "setValidate";
			var idx = parseInt($(this).attr("rowNo"));
	 		validateOneLine(params,idx);
	 		/*
	 		$("img.jTip#"+idx).click(function(){
			    $("#invalidateMsg").css("display","block");
			    $("#msgText").html(invalidateMsgs[$(this).attr("id")]);
			});
			*/
	 	} else if($(this).attr("op") == "compare") {
	 		collectParams(params);
	 		var idx = parseInt($(this).attr("rowNo"));
	 		var dialogParam = invalidateMsgs[idx];
	 		dialogParam.urls = {};
	 		$.each(invalidateMsgs[idx].aliasIdxMap,function(key,val){
	 			var ctrl = $(".regularTable tr td span[op=view][rowNo="+val+"]").get(0);
	 			dialogParam.urls[key] = genReportUrl(ctrl);
	 		});
	 		dialogParam.leftUrl = genReportUrl(this);
	 		var url = "RegularReport?op=compare&time" + new Date();
	 		var sfeature = "resizable:yes;status:no;dialogWidth:"+ screen.availWidth +"px;dialogHeight:"+screen.availHeight+"px;"
	 		showModalDialog(url,dialogParam,sfeature);
	 	}
	});
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

function refreshReport(sync) {
//	$("#centerPan").html("<img src='images/loading.gif' style='margin:20%;' />")
	mask();
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

function initLayout(){
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
			//spacing_open: 0,
			size:100, //'auto',
			//minSize:25,
			resizable:true
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
		$("#commentsPan").css({left:'10%',top:'30%',width:'80%'});
	} else {
		$("#commentsPan").css({left:-9999,top:-9999});
	}
}

function onCommand(op) {
	switch(op) {
	
	}
}
	
	
</script>

<style type="text/css">
	table {
		font-size: 9pt;
	}
	
	.op {
	  	cursor:pointer;
	}
	
	.brule {
	 	border:solid 1px darkgray;
	 	margin:0.5em;
	 	padding:0.5em;
	}
</style>
	</head>

	<body id="regularReport" style="position:relative;">
		<div id="centerPan" class="ui-layout-center" style="position:relative;padding:0;margin:0;text-align:center;overflow:auto;">
		</div>
		<div id="northPan" class="ui-layout-north" style="padding:0;margin:0;">
			${inputPan }
			
			<TABLE  width='100%' >
				<TR >
				<TD  style='text-align:right;' >
				<input id='viewReportBtn' type='button' value='查看' /> <input id='validBtn' type='button' value='平衡检查' /> <input id='writebackToDbBtn' type='button' value='上报存档' /> 
				</TD>
				</TR>
			</TABLE>
			
		</div>		
		<div id="southPan" class="ui-layout-south" style="height:100px;padding:0;margin:0;overflow:auto;">
			
		</div>
		<div id="mask" style="position: absolute; z-index: 10000; width: 110%; height: 100%; margin:0; font-size: 10pt; font-weight:bold; display: none; background-color: lightblue; filter: Alpha(opacity = 40); opacity: 0.3; -moz-opacity: 0.3; text-align: center; padding-top: 0; overflow:hidden;">
			<div style='margin:20%;margin-left:10%;text-align:center;'>
				<img src='images/loading.gif'  />
				<div id="cancelBtn" style=" cursor:pointer; margin:1em;color:red;" >
					点击这里取消
				</div>
			</div>
		</div>
		<div id="invalidateMsg" style="position:absolute;z-index:100;top:100px;left:200px;width:300px;height:300px;background-color:lightYellow;border:solid 1px gray;display:none;">
			<p class="ui-widget-header" style="line-height:16px;height:16px;width:100%;margin:0;cursor:pointer;">
				<img id="closeHint" src='images/delete.gif' style="float:right;"/>
			</p>
			<div id="msgText" style="overflow-y:auto;overflow-x:hidden;width:100%;height:280px;line-height:1.2em;padding:5px;" ></div>
		</div>
	</body>
	
</html>
