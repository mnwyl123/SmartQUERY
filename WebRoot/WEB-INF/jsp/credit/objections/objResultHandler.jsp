<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<link href="css/imgUp/common.css" type="text/css" rel="stylesheet"/>
	<link href="css/imgUp/index.css" type="text/css" rel="stylesheet"/>
	<style>
		textarea{
			height:216px;
			width:400px;
		}
		td{
			border:0 !important;
		}
		.modal-content{
			width:300px;
			margin:0 auto;
		}
	</style>
</head>
<body class="no-skin">		
	<form action="distributeObjOrg/objHandler.do" method="post" id="Form" enctype="multipart/form-data">
		<div id="zhongxin">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}" />
		<table id="simple-table" class="table table-striped table-bordered table-hover">				
			<tr>
				<td class="align-right" style="width:100px">处理结果</td>
				<td colspan="3"><textarea type="text" name="RESULT_DESC" id="RESULT_DESC" placeholder="">${pd.RESULT_DESC}</textarea></td>
			</tr>
			<c:choose>
				<c:when test="${not empty attList}">
					<c:forEach items="${attList}" var="file" varStatus="vs">
						<tr name="${file.ATT_NAME}">
							<td class="align-right" style="width:40px">附件下载</td>
							<td><div style="width:190px" class="ellipsis-2" title="${file.ATT_NAME}">${file.ATT_NAME}</div></td>
							<td><input type="button" onclick="downloadAtt('${file.ATT_NAME}')" value="下载"/></td>
							<td><input type="button" onclick="deleteAtt('${file.ATT_NAME}')" value="删除"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr class="main_info">
						<td class="align-right">附件下载</td>
						<td colspan="3" align="left">没有上传附件</td>
					</tr>
				</c:otherwise>
			</c:choose>	
			<tr>
				<td class="align-right">附件上传</td>
				<td colspan="3">
					<div id="addFileDiv" style="width:100px;">
						<input type="file" name="multiUploadFiles"/>
					</div>
					<input type="button" onclick="upload()" id="addFile" value="添加文件" style="width:72px"/>
				</td>
			</tr>
			<tr style="margin-top:100px;">
				<td class="align-center" colSpan="4">
						<a class="btn btn-orange btn-size1" onclick="save();">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</a>
						<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
	</form>
	<form action="" id="Form1" name="Form1">
		<tr><td><input type="hidden" name="ID" id="ID" value="${pd.ID}"/></td></tr>
		<tr><td><input type="hidden" name="ATT_NAME" id="ATT_NAME" /></td></tr>
	</form>

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--<script src="js/common/jquery-1.7.2.js"></script>-->
	<script src="js/common/imgUp.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		function save(){
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		function upload(){
			var index = $("input[type='file']").length;
			$("#addFileDiv").append('<input type="file" name="multiUploadFiles"/>');
		}
		
		//下载附件
		function downloadAtt(filename){
			$("#ATT_NAME").val(filename);
			$("#Form1").attr("action","<%=basePath%>/distributeObjOrg/downloadAtt.do");
			$("#Form1").submit();
			//window.location.href='<%=basePath%>/distributeObjOrg/downloadAtt.do?FILENAME='+filename;
			
		}
		//删除附件
		function deleteAtt(filename){
			$("#ATT_NAME").val(filename);
			$("#Form1").attr("action","<%=basePath%>/distributeObjOrg/deleteAtt.do");
			$("tr[name='"+filename+"']").remove();
			$("#Form1").ajaxSubmit({
				success:function(data){
					bootbox.alert("删除成功！");
				}
			});
		}
		
	</script>
</body>
</html>