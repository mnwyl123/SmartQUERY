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
					<form action="CreditAcctManage/${msg}.do" name="Form" id="Form" method="post">
						<div id="zhongxin" class="paddingt-13">
						<input type="text" hidden name="CREDIT_ACCT_TYPE1" id="CREDIT_ACCT_TYPE1" value="${pd.CREDIT_ACCT_TYPE}" readonly maxlength="32" class="width-75"/>
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
							<tr>
								<td class="align-right width-25" >征信登录名:<span class="red ">*</span></td>
								<td><input type="text" name="CREDIT_CODE" id="CREDIT_CODE" value="${pd.CREDIT_CODE}" readonly maxlength="32"  placeholder="这里输入征信登录名"  class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">征信用户名称:<span class="red ">*</span></td>
								<td><input type="text" name="CREDIT_NAME" id="CREDIT_NAME" value="${pd.CREDIT_NAME}" maxlength="255" placeholder="这里输入征信用户名称" title="征信用户名称" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">证件类型:</td>
								<td>
								    <select class="chosen-select form-control width-75" dict-name="creditType" default-value="${pd.CREDENTIALS_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE">
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">证件号码:</td>
								<td><input type="text" name="CREDENTIALS_NO" id="CREDENTIALS_NUM" value="${pd.CREDENTIALS_NO}" maxlength="255" placeholder="这里输入证件号码" title="证件号码" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">账号类型:</td>
								<td>
								    <select class="chosen-select form-control width-75" dict-name="clientType" default-value="${pd.CREDIT_ACCT_TYPE}" name="CREDIT_ACCT_TYPE" id="CREDIT_ACCT_TYPE">
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">启用日期:<span class="red ">*</span></td>
								<td>
									<input type="text"  class="span10 date-picker width-75" data-date-format="yyyymmdd" name="START_DATE" id="START_DATE" value="${pd.START_DATE}" title="启用日期"/>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">停用日期:</td>
								<td>
									<input type="text"  class="span10 date-picker width-75" data-date-format="yyyymmdd" name="END_DATE" id="END_DATE" value="${pd.END_DATE}" title="停用期日"/>
								</td>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		dict.init({ids:['CREDENTIALS_TYPE']});
		dict.init({ids:['CREDIT_ACCT_TYPE']});
		//保存
		function save(){
			if($("#CREDIT_CODE").val()==""){
				$("#CREDIT_CODE").tips({
					side:3,
		            msg:'请输入登录用户名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREDIT_CODE").focus();
				return false;
			}
			if($("#CREDIT_NAME").val()==""){
				$("#CREDIT_NAME").tips({
					side:3,
		            msg:'请输入征信用户名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREDIT_NAME").focus();
			return false;
			}
			if($("#START_DATE").val()==""){
				$("#START_DATE").tips({
					side:3,
		            msg:'请选择启用日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#START_DATE").focus();
			return false;
			}
			var START_DATE = $("#START_DATE").val().replace(/\-/g,"");
			var END_DATE = $("#END_DATE").val().replace(/\-/g,"");
			if(START_DATE>=END_DATE){
				alert("启用日期不能大于停用日期");
				return false;
			}
			var CREDIT_ACCT_TYPE = $("#CREDIT_ACCT_TYPE").val();
			var CREDIT_CODE = $("#CREDIT_CODE").val();
			/*$.ajax({
			type: "POST",
			url: '<%=basePath%>CreditAcctManage/hasID.do',
	    	data: {CREDIT_CODE:CREDIT_CODE,CREDIT_ACCT_TYPE:CREDIT_ACCT_TYPE},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#CREDIT_CODE").tips({
							side:3,
				            msg:'该类型账号 ' + CREDIT_CODE + ' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
				 }else{
					 $("#Form").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }
			}
		});*/
			 $("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
			//判断用户id是否存在
	function hasID(){
		if($("#FUN_GROUP_ID").val()==""){
				$("#FUN_GROUP_ID").tips({
					side:3,
		            msg:'请输入功能组ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FUN_GROUP_ID").focus();
				return false;
			}
		var FUN_GROUP_ID = $('#FUN_GROUP_ID').val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>menuGroup/hasID.do',
	    	data: {FUN_GROUP_ID:FUN_GROUP_ID},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#FUN_GROUP_ID").tips({
							side:3,
				            msg:'本组ID ' + FUN_GROUP_ID + ' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#FUN_GROUP_ID").val('');
				 }
			}
		});
	}
		</script>
</body>
</html>