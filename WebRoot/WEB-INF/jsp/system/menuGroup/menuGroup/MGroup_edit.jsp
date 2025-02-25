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
	<%@ include file="../../index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<!-- 图标 -->
	<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12" >
					<div class="float-r margin-5">
						<div class="btn-group">
						<a class="btn btn-green1 btn-hanzi" onclick="save();">保&nbsp;&nbsp;&nbsp;存</a>
						</div>
						<div class="btn-group">
						<a class="btn btn-hanzi btn-orange"  onclick="window.location.href=document.referrer ;">返&nbsp;&nbsp;&nbsp;回</a> 
						</div>
					</div>
					<form action="menuGroup/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="FUN_GROUP_ID" id="FUN_GROUP_ID" value="${pd.FUN_GROUP_ID}"/>
						<div id="zhongxin" class="paddingt-5">
						<table id="table_report" class="table table-striped bgreen1 margin-5" ><!-- table-bordered table-hover -->
							<tr>
								<td class="width35 align-right paddingt-13" >名称:</td>
								<td class="width-40" ><input type="text" name="FUN_GROUP_NAME" id="FUN_GROUP_NAME" value="${pd.FUN_GROUP_NAME}" maxlength="255" placeholder="这里输入名称" title="名称" class="width-75" disabled/></td>
								<td class="width50 align-right">英文名称:</td>
								<td class="width-40"><input type="text" name="FUN_GROUP_NAME_EN" id="FUN_GROUP_NAME_EN" value="${pd.FUN_GROUP_NAME_EN}" maxlength="32" placeholder="这里输入英文名称" title="英文名称" class="width-75"/></td>
							</tr>
							<tr>
								<td class="width35 align-right">描述:</td>
								<td colspan="3"><input type="text" name="FUN_GROUP_DESC" id="FUN_GROUP_DESC" value="${pd.FUN_GROUP_DESC}" maxlength="255" placeholder="这里输入描述" title="描述" class="width-90"/></td>
							</tr>
							
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->

<c:if test="${msg == 'edit' }">
	<div id="zhongxin1">
		<iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/menuGroupmx/list.do?FUN_GROUP_ID=${pd.FUN_GROUP_ID}" style="margin:0 auto;width:100%;height:340px;;"></iframe>
	</div>
</c:if>

<!--<footer>
 <div style="width: 100%;padding-bottom: 2px;" class="center">
	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
	<a class="btn btn-mini btn-danger" onclick="window.location.href=document.referrer;">取消</a>
</div> 
</footer>-->

	<!-- 页面底部js¨ -->
	<%@ include file="../../index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());

		//保存
		function save(){
		var FUN_GROUP_ID = $.trim($("#FUN_GROUP_ID").val());
		var FUN_GROUP_NAME = $.trim($("#FUN_GROUP_NAME").val());
		var FUN_GROUP_NAME_EN = $.trim($("#FUN_GROUP_NAME_EN").val());
		var FUN_GROUP_DESC = $.trim($("#FUN_GROUP_DESC").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>menuGroup/editSave.do',
	    	data: {FUN_GROUP_ID:FUN_GROUP_ID,FUN_GROUP_NAME:FUN_GROUP_NAME,FUN_GROUP_NAME_EN:FUN_GROUP_NAME_EN,FUN_GROUP_DESC:FUN_GROUP_DESC,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					bootbox.dialog({
						message: "<span class='bigger-110'>修改成功!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
				 }else{
				 	bootbox.dialog({
						message: "<span class='bigger-110'>修改失败!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
				 }
				}
			});
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>