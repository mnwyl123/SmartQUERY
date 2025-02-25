<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据权限管理</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/styles.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/table.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/base/ui.all.css">
<link rel="stylesheet" type="text/css" href="css/zTreeStyle/zTreeStyle.css" >
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/base/jquery.autocomplete.css">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="<%=basePath%>js/json2005.js"></script>
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
<script type="text/javascript" src="<%=basePath%>js/dateSelect.js"></script>
<script type="text/javascript" src="<%=basePath%>js/graphics.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.ztree.all-3.0.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.common.js"></script>
<script type="text/javascript">
var znodeses = <c:out value="${znodeses}" default="{}" escapeXml="false"/>;

$( function() {
	initTree();
	initLayout();
	initMultiSelect();
	
	$("input:checkbox").click(function(){
		var text = $($(this).parent().siblings().get(0)).text();
		var val = $("#customerExpr").val();
		if($(this).attr("checked")) {	
			$("#customerExpr").val(val + (val.length<=0 ? "" : "    ") + "{" + text + "}");
		} else {
			$("#customerExpr").val( val.replace("{"+ text + "}",""));
		}
	});
	
	$("#modiRuleBtn").click(function(event){
		event.stopPropagation();
		$("#showRulePan").css("display","none");
		$("#editRulePan").css("display","block");		
		return false;
	});
	
	$("#relationSelector").change(function(){
		if("customer" == $("#relationSelector").selectedValues()[0]) {
			$("#customerExprPan").css("display","block");
		} else {
			$("#customerExprPan").css("display","none");
		}
	});
	
	$("#saveRuleBtn").click(function(event){
		event.stopPropagation();
		$("#rule").html("");//clear content
		var rule = {policy:$("#policySelector").val(),rel:$("#relationSelector").val()};
		rule.conditions = [];
		$("input:checkbox[checked]").each(function(){
			var condition = {hier:$(this).attr("hier"),type:$(this).attr("optype")};
			condition.id=$($(this).parent().siblings().get(0)).text();
			condition.op=$($(this).parent().siblings().get(1)).children().filter("select").val();
			if(condition.type=="level") {
				condition.vals=$($(this).parent().siblings().get(2)).children().filter("select").val();		
			} else {
				var treeId = "param-" + condition.hier + "-tree";
		    	var zTree = $.fn.zTree.getZTreeObj(treeId);
				var nodes = zTree.getCheckedNodes(true);
				condition.vals = "";//"multiSelectInput:";
				for(var i=0;i<nodes.length;i++){
					condition.vals += nodes[i]["id"];
					if(i<nodes.length-1){
						condition.vals += ",";
					}
				}
			
				//condition.vals=$($(this).parent().siblings().get(2)).children().filter("span").children().val();
			}
		//	alert(JSON.stringify(condition));
			rule.conditions.push(condition);
		});
		if(rule.rel == "customer") {
			rule.relExpr = $("#customerExpr").val();
		}
		
		var param = {ajax:1,op:'updateAccessRule',_type:getReportType(),id:$("#rule").attr("sid")};
		param.rule = JSON.stringify(rule);
		var returnData=null;
		ajaxCall(param,function(data){
			returnData = data; //data.HeadInfo.Code;
		},false);
		if(returnData.HeadInfo.Code == 0) {
			showCellRule($("#rule").attr("sid"));
			$("#showRulePan").css("display","block");
			$("#editRulePan").css("display","none");	
		} else {
			alert(data.HeadInfo.Message);
		}
			
		return false;
	});
	
	$("#cancelRuleBtn").click(function(event){
		event.stopPropagation();
		$("#showRulePan").css("display","block");
		$("#editRulePan").css("display","none");		
		return false;
	});
});

function getReportType(){
	var type = "${param._type}";
	if( type == null || type=="") {
		type = "${param.type}";
	}
	return type;
}

function initLayout(){
	var layout = $('body').layout( {
		center: {
			initHidden:false
		},
		west: {
			initHidden:false,
			resizable:true
		/*
			closable: false,
			resizable:false,
			spacing_open: 0
			*/
		}
	
	});
	return layout;
}

function initTree() {
	var setting = {
			data: {
				
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onTreeClick
			}
		};
	var nodes = ${sCells};
	$.fn.zTree.init($("#tree"), setting, nodes);
}

function onTreeClick(event, treeId, treeNode, clickFlag) {
	/*
	$("#modiRuleBtn").css("display","block");
	var type = getReportType();
	var param = {ajax:1,op:'getAccessRule',mime:'text/html',_type:type,id:treeId};
	ajaxCall(param,function(data){
		if( data.HeadInfo.Code == 0 ) {
			$("#rule").html(data.HeadInfo.Message).attr("sid",treeId);
		} else {
			$("#rule").html("读取规则错误：<br/>" + data.HeadInfo.Message).attr("sid",treeId); 
		}
	},true);
	*/
	showCellRule(treeNode.id);
}

function showCellRule(cellId) {
	var type = getReportType();
	var param = {ajax:1,op:'getAccessRule',mime:'text/html',_type:type,id:cellId};
	ajaxCall(param,function(data){
		if( data.HeadInfo.Code == 0 ) {
			$("#rule").html(data.HeadInfo.Message).attr("sid",cellId);
			$("#modiRuleBtn").css("display","block");
		} else {
			$("#rule").html("读取规则错误：<br/>" + data.HeadInfo.Message).attr("sid",cellId); 
		}
	},true);
}



function ajaxCall( param , callback, async) {
		ajaxUrlCall("RegularReport",param,callback,async);
}

</script>
<style>
.title-pan{
	padding:25px 0 0 0;
}

.title-pan-title{
	background-color:silver;
	position:relative;
	top:-25px;
	height:25px;
	line-height:25px;
	width:100%;
	text-align:center;
	font-weight:600;
	margin:0;
	padding:0;

}

.title-pan-pan {
	position:relative;
	top:-25px;
	height:100%;
	width:100%;
	padding:0;
	margin:0;

}

#contentPan{
	padding:0.5em;
}

div.menuContent{
	background-color:white; 
	border:solid 1px gray;
}
span.dropdown {
		display:inline-block;
		border:solid 1px gray;
		padding:0 12px 0 0;		
		background-image:url('<%=basePath%>css/base/images/arrow_d.gif');
		background-repeat:no-repeat;
		background-position:right center;
		cursor:pointer;
	}
span.dropdown input {
		border:none;
	}

#param-role-tree.ztree li button.switch {
	width:2px;
}

</style>
</head>
<body>
	<div id="contentPan" class="ui-layout-center" style="position:relative;">
		<div id="showRulePan">
			<div id="rule">
			<!--  
				<span style="font-weight:600;">允许</span>符合以下规则的用户访问：<br/><br/>
				
				<span style="margin:0.5em 0 0 2em;">满足下列所有条件</span><br/>
				
				<table style="margin:0.5em 0 0 2em;">
				
					<tr>
						<td>1</td>
						<td>角色</td>
						<td>属于</td>
						<td>admin</td>
					</tr>
					<tr>
						<td>2</td>
						<td>机构</td>
						<td>大于</td>
						<td>分局</td>
					</tr>
				</table>
				-->		
			</div>	
			
			<p >
			<a id="modiRuleBtn" href="#" style="display:none;" ><span>修改</span></a>
			</p>
		</div>
		<div id="editRulePan" style="display:none;position:relative;">
			<p id="rule">
			<select id="policySelector" style="width:6em;margin-right:0.5em;" >
				<option value="allow">允许</option>
				<option value="deny">不允许</option>
			</select>符合以下规则的用户访问：<br/><br/>
			
			<select id="relationSelector" style="margin:0.5em 0 0 2em;">
				<option value='all'>满足下列所有条件</option>
				<option value='acceptIfAnyone'>满足下列任一条件</option>
				<option value='none'>下列条件都不满足</option>
				<option value='refuseIfAnyone'>不满足下列任一条件</option>
				<option value='customer'>满足自定义的逻辑表达式</option>
			</select><br/>
			
			<table style="margin:0.5em 0 0 2em;">
			
				<tr>
					<td><input type="checkbox" hier="role" optype="member"/> </td>
					
					<td>角色</td>
					<td>
						<select>
						   <option value="includeBy">属于</option>
						   <option value="excludeBy">不属于</option>
						</select>
					</td>
					<td>
						<span class='dropdown' >
							<input type='text' readonly="readonly" class='paramInput multiSelect' id='param-role' />
						</span>
						<div id='param-role-box' class='menuContent' style='display:none; position: absolute;z-index:100;'>
								<ul id='param-role-tree' class='ztree  dmcontent' bind='param-role' default='' style='margin:0;padding:0; width:180px; height: 10em;overflow:auto;'></ul>
								<!--  
								<div style='width:180px;background-color:#ffffff;height:1.5em;line-height:1.5em;'>
									<a class='treeOp' href='#' treeId='param-role-tree' op='selectAll' >全选</a>
									<a class='treeOp' href='#' treeId='param-role-tree' op='diselectAll' >全消</a>
									<a class='treeOp' href='#'  treeId='param-role-tree' op='toggle' >反选</a>
								</div>
								-->
						</div>
						<!--  
						<select>
							<c:forEach items="${roles}" var="role">
								<option value="${role}">${role}</option>
							</c:forEach>
						</select>
						-->
					</td>
				</tr>
				
				<c:forEach items="${hiers}" var="hier">
					<tr>
						<td><input type="checkbox" hier="${hier.name}" optype="level"/> </td>
						
						<td>${hier.name}的层次</td>
						<td>
						  <select>
							   <option value="higher" >高  于</option>
							   <option value="lower">低  于</option>
							   <option value="equot">等  于</option>
						  </select>
						</td>
						<td>
							<select>
								<c:forEach items="${hier.levels}" var="lvl">
									<option value="${lvl.uniqueName}">${lvl.caption}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				
					<tr>
					    <td><input type="checkbox" hier="${hier.name}" optype="member"/> </td>
						
						<td>${hier.name}</td>
						<td>
						  <select>
							   <option value="includeBy">属于</option>
						   	   <option value="excludeBy">不属于</option>
						  </select>
						</td>
						<td>
							<span class='dropdown' >
								<input type='text' readonly="readonly" class='paramInput multiSelect' id='param-${hier.name}'  />
							</span>
							<div id='param-${hier.name}-box' class='menuContent' style='display:none; position: absolute;z-index:100;'>
								<ul id='param-${hier.name}-tree' class='ztree dmcontent' bind='param-${hier.name}' default='' style='margin-top:0; width:180px; height: 10em;overflow:auto;'></ul>
								<!-- 
								<div style='width:180px;background-color:#ffffff;height:1.5em;line-height:1.5em;'>
									<a class='treeOp' href='#' treeId='param-${hier.name}-tree' op='selectAll' >全选</a>
									<a class='treeOp' href='#' treeId='param-${hier.name}-tree' op='diselectAll' >全消</a>
									<a class='treeOp' href='#'  treeId='param-${hier.name}-tree' op='toggle' >反选</a>
								</div>
								 -->
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div id="customerExprPan" style="display:none;margin:1em 0 0 2em;">
				<span>以上条件应遵守的逻辑表达式:</span><br/>
				<input id="customerExpr" type="text" style="width:80%"/>
			</div>
			</p>			
			<p>
			<a id="saveRuleBtn" href="#" ><span>保存</span></a>
			<a id="cancelRuleBtn" href="#" style="margin-left:2em;" ><span>取消</span></a>
			</p>
		</div>
	</div>
	<div id="navipan" class="ui-layout-west title-pan">
		<div class="title-pan-title">受保护的单元格</div>
		<ul id="tree" class="title-pan-pan ztree">
		</ul>
	</div>
</body>
</html>