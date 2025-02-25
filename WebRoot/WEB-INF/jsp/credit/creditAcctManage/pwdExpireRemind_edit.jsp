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
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12 no-padding">
					<form action="PwdExpireRemind/${msg}.do" name="Form" id="Form" method="post">
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
							<input type="text" hidden name="CREDIT_ACCT_TYPE" id="CREDIT_ACCT_TYPE" value="${pd.CREDIT_ACCT_TYPE}" maxlength="32" class="width-75"/>
							<input type="text" hidden name="IS_WEB" id="IS_WEB" value="${pd.IS_WEB}" maxlength="32" class="width-75"/>
						    <tr>
								<td class="align-right width-25" hidden>征信登录名:<span class="red ">*</span></td>
								<td ><input type="text" hidden name="CREDIT_CODE" id="CREDIT_CODE" value="${pd.CREDIT_CODE}" maxlength="32" readonly placeholder="这里输入征信登录名"  class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25" hidden>上次修改时间:<span class="red ">*</span></td>
								<td ><input type="text" hidden name="CURRENT_TIME" id="CURRENT_TIME" value="${pd.CURRENT_TIME}" maxlength="32" readonly placeholder="这里输入征信登录名"  class="width-75"/></td>
							</tr>
							<tr hidden>
								<td class="align-right width-25" >旧密码:<span class="red ">*</span></td>
								<td><input type="password" name="PREVIOUS_PASSWORD" id="PREVIOUS_PASSWORD" value="${pd.PREVIOUS_PASSWORD}" maxlength="32"  placeholder="这里输入新密码"  class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25" >新密码:<span class="red ">*</span></td>
								<td><input type="password" name="CURRENT_PASSWORD" id="CURRENT_PASSWORD" maxlength="32"  placeholder="这里输入新密码"  class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">再输一次新密码:<span class="red ">*</span></td>
								<td><input type="password" name="CURRENT_PASSWORD1" id="CURRENT_PASSWORD1"  maxlength="32"  placeholder="这里输入新密码"  class="width-75"/></td>
							</tr>
						</table>
						</div>
						<div class="footfix">
							<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
							<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
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

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		dict.init({ids:['CREDENTIALS_TYPE']});
		//保存
		function save(){
			if($("#CURRENT_PASSWORD").val()!=$("#CURRENT_PASSWORD1").val()){
				$("#CURRENT_PASSWORD1").tips({
					side:3,
		            msg:'两次输入的密码不一致',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CURRENT_PASSWORD1").focus();
				return false;
			}
			var CREDIT_CODE = $("#CREDIT_CODE").val();
			var PREVIOUS_PASSWORD = $("#PREVIOUS_PASSWORD").val();
			var CURRENT_PASSWORD = $("#CURRENT_PASSWORD").val();
			
			$.ajax({
	             type: "POST",
	             url: "<%=basePath%>PwdExpireRemind/edit.do?",
	             data: {CREDIT_CODE:CREDIT_CODE,PREVIOUS_PASSWORD:PREVIOUS_PASSWORD,CURRENT_PASSWORD:CURRENT_PASSWORD},
	             dataType:'json',
	             cache: false,
	             success:function(data){
	             	 var msg = data.msg;
	             	 bootbox.dialog({
	             			message: "<span class='bigger-110'>"+msg+"</span>",
	             			buttons: 			
	             			{ "button":{ "label":"确定", 
	             				"className":"btn-sm btn-success",
								"callback": function() {
									top.Dialog.close();}
	             			}
	             			}
	             	});
	             	
	            }
            });
			
			//$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		</script>
</body>
</html>