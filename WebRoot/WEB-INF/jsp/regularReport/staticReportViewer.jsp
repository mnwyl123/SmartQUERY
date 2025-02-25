<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'reportViewer.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<link rel="stylesheet" type="text/css" href="css/base/regularReportGrid.css">
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<link rel="stylesheet" type="text/css" href="css/base/ui.all.css">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="js/json2005.js"></script>
		<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
		<script type="text/javascript" src="js/jtip.js"></script>
		<script type="text/javascript" src="js/jquery.layout.js"></script>
		<script type="text/javascript" src="js/jquery.selectboxes.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
		<script type="text/javascript" src="js/swfobject.js"></script>
<script type="text/javascript">
var cur_xhr;
var layout;
var params = {ajax:1,type:'${fileType}'};
var validDefs = [
	<c:forEach items="${validDefs}" var="def">
	{ 
		cellCoordinate: "${def.cellCoordinate}",
		expression: "${def.expression}",
		refs:[ 
			${def.refsJsonArray}
		]
	},
	</c:forEach>
];

var editableCells = [
<c:forEach items="${editableCells}" var="cell">"${cell}",</c:forEach>
];

var originalVals = null;

$( function() {
	$("body").click(function(){
		$("#JT").remove();
	});
	
	layout = initLayout();
	
	$.datepicker.setDefaults($.extend({showMonthAfterYear: false}, $.datepicker.regional['zh-CN']));
				$("#publishTime").datepicker({
					showOn:'button',
					showButtonPanel: true,
					changeMonth: true,
					changeYear: true,
					dateFormat:'yymmdd'
				}
						//$.datepicker.regional['zh-CN']
	);
	
	$("#viewReportBtn").click(function(){
		if( cur_xhr ){
		    		    //alert("do cancel");
		    			cur_xhr.abort();
		}
		/*
		params.branch = $("#branchSelector").selectedValues()[0];
		params.branchCap = $("#branchSelector").selectedTexts()[0].replace(/\u00a0+/,"");
		params.day = $("#publishTime").attr("value");
		params.ccy = $("#ccySelector").selectedValues()[0];
		params.ccyCap = $("#ccySelector").selectedTexts()[0];
		params.hasCoordin = $("#coordinRadio").attr("checked");
		params.page = 0;
		*/
		collectParams(params);
		params.op = "view";
		refreshReport();
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
	
	$("#inputAuditButton").click(function(){
		if(originalVals) {
			for(var cooStr in originalVals){
				var val = $.trim(originalVals[cooStr]);
				var $td = getTdWraper(cooStr);
				if($.trim($td.text()) != val) {
					$td.append(genAlramIconHtml(cooStr,-1,-1,"原值：" + ("" == val ? "无" : val)));
				}
			}
		}
	});
	
	$("#inputButton").click(function(){
	    $.each(editableCells,function(idx,val){
	    	if(val) {
				var $td = getTdWraper(val);
				$td.attr("valign","bottom").attr("oldval",$td.text()).css("padding-bottom","0").html("<input type='text' id='" + val + "' style='border:none;border-bottom:solid 1px red;width:100%;' value='" + $td.text()  + "' />");
			}
		});
		
		$("#southPan").html("<input id='inputOK' type='button' value='提交' style='float:right;margin-left:1em;margin-right:1em;font-size:9pt;' /> <input id='inputCancel' type='button' value='取消' style='float:right;font-size:9pt;' /> ");
		layout.show("south");
		$("#inputOK").click(function(){
			var vals = {};
			$("table.regularTable input[type=text]").each(function(){
				vals[$(this).attr("id")] = $(this).attr("value");
			});
			collectParams(params);
			params.inputVals = JSON.stringify(vals);
			params.op = "input";
			ajaxCall(params,loadReportWorker);
			
		});
		$("#inputCancel").click(function(){
			$("table.regularTable input[type=text]").each(function(){
				$(this).parent().text($(this).parent().attr("oldval"));
			});
			layout.hide("south");
		});
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
		printer.setUrlStr ( window.location + "&" + getQueryString() );
		printer.print();
		var title = document.title;
		document.title = "";
		//window.print();
		document.title = title;
		
	});
	
	$("#exportExcellBtn").click(function(){
		var option = "left=0,top=0,status=yes,resizable=yes,toolbar=no,menubar=yes,location=yes,scrollbars=yes";
		var url = window.location + "&" + getQueryString()
		  +"&exportType=xls";
		//var url = "servlet/DownloadServlet&exportType=xls"			
		//		+"&enging=exportRegular"
		//		+"&" + document.location.search
		//		+"&" + getQueryString();
		//window.open("opencontrol.jsp?action=" + url,"",option,false);
		window.open(url,"",option,false);
	});


	$("#refreshReportBtn").click(function(){
		window.location.replace( window.location + "&refresh=true");
	});
	
	if(showCharts){
		showCharts();
	}
	
} )
/*
function showCharts() {
	$(".swf").each(function(){
		var chartId = $(this).attr("id");
		swfobject.embedSWF("swf/open-flash-chart.swf", chartId, "100%", "200", "9.0.0",null,{"get-data":"get" + chartId + "Data"});
	});
}
*/

function collectParams(params) {
/*
	params.branch = $("#branchSelector").selectedValues()[0];
	params.branchCap = $("#branchSelector").selectedTexts()[0].replace(/\u00a0+/,"");
	params.day = $("#publishTime").attr("value");
	params.ccy = $("#ccySelector").selectedValues()[0];
	params.ccyCap = $("#ccySelector").selectedTexts()[0];
	params.hasCoordin = $("#coordinRadio").attr("checked");
	params.page = 0;
*/
	return params;
}

function getQueryString() {
	return "branch=" + $("#branchSelector").selectedValues()[0]
			+ "&branchCap=" + $("#branchSelector").selectedTexts()[0].replace(/\u00a0+/,"")
			+ "&day=" + $("#publishTime").attr("value")
			+ "&ccy=" + $("#ccySelector").selectedValues()[0]
			+ "&ccyCap=" + $("#ccySelector").selectedTexts()[0]
}

function loadReportWorker(data) {
	if( data.HeadInfo.Code == 0 ){
		if(data.DataInfo.pageNavi) {
			$("#southPan").html(data.DataInfo.pageNavi);
			layout.show("south");
		} else {
			layout.hide("south");
		}
		
		if(data.DataInfo.originalVals) {
			originalVals = data.DataInfo.originalVals;
			$("#inputAuditButton").show();
		} else {
			$("#inputAuditButton").hide();
		}
		
		$("#centerPan").html(data.DataInfo.content);
		
			$("#prevPageBtn").click(function(event){
				event.stopPropagation();
				params.page = $(this).attr("page");
				refreshReport();
				
				return false;
			});
			
			$("#nextPageBtn").click(function(event){
				event.stopPropagation();	
				params.page = $(this).attr("page");
				refreshReport();
										
				return false;
			});
			
			$("#gotoPage").click(function(event){
				event.stopPropagation();
				return false;
			});
			
			$("#gotoPageBtn").click(function(event){
				event.stopPropagation();	
				params.page = $("#gotoPage").attr("value") - 1;
				refreshReport();						
				return false;
			});
	} else {
		$("#centerPan").html(data.HeadInfo.Message);
	}

}

function refreshReport() {
	$("#centerPan").html("<img src='images/loading.gif' style='margin:20%;' />")

	ajaxCall(params, loadReportWorker
		/*
		function(data) {
			if( data.HeadInfo.Code == 0 ){
				if(data.DataInfo.pageNavi) {
					$("#southPan").html(data.DataInfo.pageNavi);
					layout.show("south");
				} else {
					layout.hide("south");
				}
				$("#centerPan").html(data.DataInfo.content);
				
					$("#prevPageBtn").click(function(event){
						event.stopPropagation();
						params.page = $(this).attr("page");
						refreshReport();
						
						return false;
					});
					
					$("#nextPageBtn").click(function(event){
						event.stopPropagation();	
						params.page = $(this).attr("page");
						refreshReport();
												
						return false;
					});
					
					$("#gotoPage").click(function(event){
						event.stopPropagation();
						return false;
					});
					
					$("#gotoPageBtn").click(function(event){
						event.stopPropagation();	
						params.page = $("#gotoPage").attr("value") - 1;
						refreshReport();						
						return false;
					});
			} else {
				$("#centerPan").html(data.HeadInfo.Message);
			}
		}*/ );
}

function getTdWraper(cellCoordinateStr) {
	var coo = getCoordinate(cellCoordinateStr);
	return $("td[x="+ coo.col + "][y=" +  coo.row + "]");
}

function showValidateResult( expr, def) {
	try {
		    
			var $td = getTdWraper(def.cellCoordinate);
			if(eval(expr)){
				$td.css("background-color","green");
				//$("td[x="+ coo.col + "][y=" +  coo.row + "]").css("background-color","green");
			} else {
				var coo = getCoordinate(def.cellCoordinate);
				$td.css("background-color","red");
				$td.append(genAlramIconHtml(def.cellCoordinate,coo.col,coo.row,""));;
				//$("td[x="+ coo.col + "][y=" +  coo.row + "]").css("background-color","red");
				//$("td[x="+ coo.col + "][y=" +  coo.row + "]").append(genAlramIconHtml(coo.col,coo.row,genIvalidateMsg(def)));
			//	$("img.invalidateInfo[x="+ coo.col + "][y=" +  coo.row + "]").click(function(){
			//	});
			}
	} catch(e){
		alert("平衡校验语法定义出错：\r\n" +　e.message);
	}
}

function cellValidate() {
	var refValidates = [];
	for(var i=0;i<validDefs.length;i++){
		var def = validDefs[i];
		if(!def) continue;
		if(isContainRef(def.expression)){
			refValidates.push(def);
		} else {
			var expr = getCellValue(def.cellCoordinate) + " " + setInnerCellValue(def.expression);
			showValidateResult( expr, def);
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
		params.refs = JSON.stringify(refValidates);
		params.op = "getCellValues";
		ajaxCall(params, 
		function(data) {
			if( data.HeadInfo.Code == 0 ){
				if( data.DataInfo ) {
					var cellVals = data.DataInfo.content;
					for(var i=0;i<validDefs.length;i++){
						var def = validDefs[i];
						if(!def) continue;
						if(isContainRef(def.expression)){
							var refCell = cellVals[def.cellCoordinate];
							var expr = getCellValue(def.cellCoordinate) + " " + setInnerCellValue(setRefCellValue(def.expression, refCell));
							showValidateResult( expr, def);
						}
					}
					$("img.jTip").hover(function(){
						$("#JT").remove();
						JT_showHtml(this.id,genIvalidateMsg($(this).attr("cooStr")),null,null);
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
			JT_showHtml(this.id,genIvalidateMsg($(this).attr("cooStr")),null,null);
		});
	}
	
	
}

function escapeHtml(htmlStr) {
	return htmlStr.replace("<","&lt;").replace(">","$gt;");
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


function genIvalidateMsg(cooStr) {
	var validDef = null;
	for(var i=0;i<validDefs.length;i++){
		if(validDefs[i] && validDefs[i].cellCoordinate == cooStr){
			validDef = validDefs[i];
		}
	}
	var msg = "未能符合下列平衡校验公式：<br/>" + escapeHtml(validDef.expression);
	if(validDef.refs.length > 0) {
		msg += "<br/> 参见：";
		for(var i=0;i<validDef.refs.length;i++){
			var ref = validDef.refs[i];
			if(ref){
				collectParams(params);
				var href = "RegularReport?type=" + ref.file.file + "&op=view";
				if(!ref.file.branch || ref.file.branch != "null") {
					href += "&branch=" + params.branch + "&branchCap=" + params.branchCap; 
				} else {
					href += "&branch=" + ref.file.branch + "&branchCap=" + ref.file.branch; 
				}
				if(!ref.file.cur || ref.file.cur != "null") {
					href += "&ccy=" + params.ccy + "&ccyCap=" + params.ccyCap; 
				} else {
					href += "&ccy=" + ref.file.cur + "&branchCap=" + ref.file.cur; 
				}
				if(!ref.file.day || ref.file.day != "null") {
					href += "&day=" + params.day ; 
				} else {
					href += "&dat=" + ref.file.day; 
				}
				msg += "<a target='_blank' href='" + href + "'> "+ ref.name +" </a>"; 
			}
		}
	}
	return msg;
}

function genAlramIconHtml(cooStr, col,row, msg){
	return "<img id='info-" + cooStr + "' cooStr='"+ cooStr +"' class='invalidateInfo jTip' x='" + col + "' y='" + row + "' src='images/hint.gif' "
	 + "alt='" + msg + "' />";
}

function isContainRef(expr){
	return expr.match(/[!][a-zA-Z]+\d+/);
}

function setInnerCellValue(expr) {
	while( (match = /[a-zA-Z]+\d+/.exec(expr)) != null){
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
	if(!valStr || $.trim(valStr) == ""){
		return 0;
	} 
	var valText = valStr.match(/[-]?\d+[,\d]+[\.]?\d+/);
	var val = valText[0].replace(/,/g,"");
	return val;
}


function getCoordinate(str) {
    str = str.toUpperCase();
	if(!str.match(/[A-Z]+\d+/)) {
		return null;
	}
	var co = {};
	var col = str.match(/[A-Z]+/);
	co.row = str.substring(col.length,str.length) - 1;
	co.col = alphabetToInt(str.substring(0,col.length));
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
			var num = ch.charCodeAt(0) - "A".charCodeAt(0);
			for (var i = 0; i < curPos; i++) {
				num *= 26;
			}
			idx += num;
			curPos++;
		}
		return idx;
	}
	return -1;
}

function ajaxCall( param , callback){
	if(callback) {
		ajaxPost( "RegularReport",
			param,callback );
	} 		
}

function ajaxPost( url, param, successCallback ) {
	cur_xhr =  $.ajax({
		type:"POST",
		url:url,
		cache: false,
		data:param,
		dataType:"json",
		success: successCallback
	});
	return cur_xhr;
}

function initLayout(){
	var layout = $('body').layout( {
		center: {
			initHidden:false
		},
		north: {
		    initHidden:false,
			spacing_open: 0,
			resizable:false
		},
		south: {
			initHidden:true,
			spacing_open: 0,
			resizable:false
		}
	});
	return layout;
}


	
</script>

<style type="text/css">
	table {
		font-size: 9pt;
	}
	td.caption {
		text-align:right;
		
	}
	
	td.intput {
		text-align:left;
		
	}
	
	td.input select td.input input {
		width:8em;
	}
</style>
	</head>

	<body>
		<div id="centerPan" class="ui-layout-center" style="padding:0;margin:0;text-align:center;overflow:auto;">
			${reportHtml }
		</div>
		<div id="northPan" class="ui-layout-north" style="height:1.8em;padding:0;margin:0;background-color:silver;">
			${buttons }
			<!--  input id="refreshReportBtn" type="button" value="刷新" style="float:right;margin-right:1em;"/ -->
		</div>	
		<div id="southPan" class="ui-layout-south" style="height:1.2em;padding:0;margin:0;background-color:silver;">			
		</div>
	</body>
</html>
