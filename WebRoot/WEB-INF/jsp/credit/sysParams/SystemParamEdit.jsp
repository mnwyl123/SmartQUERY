<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="">
								<form action="paramManage/UpdateSysP.do" name="Form" id="Form" method="post">
									<input type="hidden" name="sys_ID" id="sys_ID" value="${pd.ID}"/>
									<div id="zhongxin" class="paddingt-13">
									<table id="table_report" class="table table-striped"> <!-- table-bordered table-hover  -->
										<tr>
											<td class="align-right">系统参数名称:</td>
											<td><input type="text" name="sys_CHN" id="sys_CHN"  value="${pd.CHN}" maxlength="32" class="width-75" /></td>
										</tr>					
										<tr>
											<td class="align-right">系统参数编码:</td>
											<td><input type="text" name="sys_CODE" id="sys_CODE" readonly value="${pd.CODE}" maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">系统参数值:</td>
											<td><input type="text" name="sys_VALUE" id="sys_VALUE" value="${pd.VALUE}" maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">系统参数描述:</td>
											<td><input type="text" name="sys_DATA_DESC" id="sys_DATA_DESC" value="${pd.DATA_DESC}" maxlength="32" class="width-75"/></td>
										</tr>									
										<tr>
										     <td class="align-center" colSpan=2>
										     	<a class="btn btn-orange btn-size1" onclick="save();">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</a>&nbsp;&nbsp;&nbsp;
												<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
											</td>
										</tr>
									</table>
									</div>
									
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
dict.init({ids:['USER_TYPE']});
	$(top.hangge());
	$(document).ready(function(){
		
	});
	//保存
	function save(){
		if($("#sys_CHN").val()==""){
			$("#sys_CHN").tips({
				side:3,
	            msg:'请输入系统参数名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#sys_CHN").focus();
			return false;
		}
		if($("#sys_VALUE").val()==""){
			$("#sys_VALUE").tips({
				side:3,
	            msg:'请输入系统参数值',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#sys_VALUE").focus();
			return false;
		}if($("#sys_DATA_DESC").val()==""){
			$("#sys_DATA_DESC").tips({
				side:3,
	            msg:'请输入系统参数描述',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#sys_DATA_DESC").focus();
			return false;
		}	
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
</html>