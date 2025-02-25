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
					<form action="holidayManage/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="dataP" id="dataP" value="${pd.DATE_PARAM}"/>
						<div id="zhongxin">
						<table id="table_report" class="table table-striped" >
							<tr>
								<td class="align-right">日期:<span class="red ">*</span></td>
								<td>
									<input class="span10 date-picker width-75" name="DATE_PARAM" id="DATE_PARAM" value="${pd.DATE_PARAM}" type="text" data-date-format="yyyy-mm-dd" placeholder="日期" />
								</td>
							</tr> 
							<tr>
								<td class="align-right">是否节假日:<span class="red ">*</span></td>
								<td>
									<select name="IS_HOLIDAY" id="IS_HOLIDAY" class="width-75" value="${paramObject.IS_HOLIDAY}">
										<option value="">选择是否节假日</option>
										<option value=1 <c:if test="${paramObject.IS_HOLIDAY == 1}">selected</c:if>>是</option>
										<option value=0 <c:if test="${paramObject.IS_HOLIDAY == 0}">selected</c:if>>否</option>
									</select>
								</td>
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
	<a class="btn btn-orange btn-size1 b" onclick="save('${msg }');" id="btn">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
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
		$(document).ready(function(){
			if($("#dataP").val()!=""){
				$("#DATE_PARAM").attr("disabled","disabled");
				$("#DATE_PARAM").css("color","gray");
			}
		});
		
		//保存
		function save(method){
			if($("#DATE_PARAM").val()==""){
				$("#DATE_PARAM").tips({
					side:3,
		            msg:'请选择日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DATE_PARAM").focus();
				return false;
			}
			if($("#IS_HOLIDAY").val()==""){
				$("#IS_HOLIDAY").tips({
					side:3,
		            msg:'请选择是否为节假日',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_HOLIDAY").focus();
				return false;
			}
			var DATE_PARAM = $('#DATE_PARAM').val();
			var IS_HOLIDAY = $('#IS_HOLIDAY').val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>holidayManage/queryData.do',
				data: {DATE_PARAM:DATE_PARAM,IS_HOLIDAY:IS_HOLIDAY,method:method},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("error" == data.result){
						 $("#DATE_PARAM").tips({
								side:3,
								msg:'该日期已经添加',
								bg:'#AE81FF',
								time:3
							});
						 $("#DATE_PARAM").val('');
						 return false;
					 }else{
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
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