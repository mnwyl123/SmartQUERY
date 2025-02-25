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
					<form action="createReport/${msg }.do" name="Form" id="Form" method="post">
						<div id="zhongxin" style="margin-top:20px">
						<table id="table_report" class="table table-striped" >
							<tr>
								<td class="align-right width-30">请求信息编号:<span class="red ">*</span></td>
								<td><input type="text" name="REQUEST_NO" id="REQUEST_NO" value="${pd.REQUEST_NO}" readonly maxlength="30" placeholder="这里输入请求信息编号" title="请求信息编号" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-30">被查询人姓名:<span class="red ">*</span></td>
								<td><input type="text" name="CLIENT_NAME" id="CLIENT_NAME" value="${pd.CLIENT_NAME}" maxlength="30" placeholder="这里输入被查询人姓名" title="被查询人姓名" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-30">被查询人证件类型:<span class="red ">*</span></td>
								<td>
									<select class="width-75" dict-name="CRED_TYPE_PER"  default-value="${pd.CREDENTIALS_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE">
										<option value="">请选择证件类型</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-30">被查询人证件号码:<span class="red ">*</span></td>
								<td><input type="text" name="CREDENTIALS_NO" id="CREDENTIALS_NO" value="${pd.CREDENTIALS_NO}" maxlength="30" placeholder="这里输入被查询人证件号码" title="被查询人证件号码" class="width-75"/></td>
							</tr> 
							<tr>
								<td class="align-right width-30">产品时间:<span class="red ">*</span></td>
								<td><input type="text" class="span10 date-picker width-75" data-date-format="yyyy-mm-dd" name="PRODUCE_DATE" id="PRODUCE_DATE" value="${pd.PRODUCE_DATE}" maxlength="1" placeholder="这里输入是产品时间" title="产品时间" /></td>
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
		dict.init({ids:['CREDENTIALS_TYPE']});
		dict.init({ids:['table_report'],buildType:'grid'});
		$(top.hangge());
		
		//保存
		function save(){
			var msg="";
			$("input").each(function(index,obj){
				if(obj.value==""){
					msg=obj.title+"不能为空";
				}
				return;
			});
			if($("#CREDENTIALS_TYPE").val()==""){
				$("#CREDENTIALS_TYPE").tips({
					side:3,
		            msg:'证件类型不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREDENTIALS_TYPE").focus();
				return false;
			}
			if (msg==""){				
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}else{
				$("#btn").tips({
					side:1,
		            msg:msg,
		            bg:'#AE81FF',
		            time:2
		        });
			}
		}
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
	</script>
</body>
</html>