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
<style>
	.a{
		margin:auto 60px auto 60px;
		padding-buttom:5px;
		height:50px;
	}
	.b{
		margin:5px auto auto 40px;
	}
	input[readonly]{
		height:30px;
	}
</style>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12 no-padding">					
					<form action="numberReadParam/${msg }.do" name="Form" id="Form" method="post">
						<div id="zhongxin">
						<table id="table_report" class="table table-striped" >
							<tr>
								<td class="align-right">参数名称:<span class="red ">*</span></td>
								<c:if test="${msg == 'updateP' }">
								<td><input type="text" name="PARAM" id="PARAM" value="${paramObject.PARAM}" placeholder="不可修改，请取名规范" title="参数名称" class="width-85" readonly/></td>
								</c:if>
								<c:if test="${msg != 'updateP' }">
								<td><input type="text" name="PARAM" id="PARAM" value="${paramObject.PARAM}" placeholder="不可修改，请取名规范" title="参数名称" class="width-85" onchange="hasU()"/></td>
								</c:if>
							</tr>
							<tr>
								<td class="align-right">上报员名称:<span class="red ">*</span></td>
								<td><input type="text" name="REQUEST_USER_NAME" id="REQUEST_USER_NAME" value="${paramObject.REQUEST_USER_NAME}" placeholder="上报员名称" title="上报员名称" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">人行用户代码:<span class="red ">*</span></td>
								<td><input type="text" name="REQUEST_USER_CODE" id="REQUEST_USER_CODE" value="${paramObject.REQUEST_USER_CODE}" placeholder="上报员人行用户代码" title="上报员人行用户代码" class="width-85"/></td>
							</tr> 
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="a">
	<a class="btn btn-orange btn-size1 b" onclick="save();" id="btn">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
	<a class="btn btn-size1 btn-default b" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
</div>

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		
		//保存
		function save(){
			if($("#PARAM").val()==""){
				$("#PARAM").tips({
					side:3,
					msg:'请添加参数',
					bg:'#AE81FF',
					time:1
				});
				return false;
			}
			if($("#REQUEST_USER_NAME").val()==""){
				$("#REQUEST_USER_NAME").tips({
					side:3,
					msg:'请添加上报员名称',
					bg:'#AE81FF',
					time:1
				});
				return false;
			}
			if($("#REQUEST_USER_CODE").val()==""){
				$("#REQUEST_USER_CODE").tips({
					side:3,
					msg:'请添加人行用户代码',
					bg:'#AE81FF',
					time:1
				});
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();	
		}
		function hasU(){
			var PARAM = $('#PARAM').val();
			if($("#PARAM").val()==""){
				$("#PARAM").tips({
					side:3,
					msg:'请选择参数',
					bg:'#AE81FF',
					time:1
				});
				return false;
			}
			$.ajax({
				type: "POST",
				url: '<%=basePath%>numberReadParam/hasId.do',
		    	data: {PARAM:PARAM},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" != data.result){
						 $("#PARAM").tips({
								side:3,
					            msg:'当前该参数已存在',
					            bg:'#AE81FF',
					            time:3
					        });
						 $("#PARAM").val('');
					 }
				}
			});
		}
	</script>
</body>
</html>