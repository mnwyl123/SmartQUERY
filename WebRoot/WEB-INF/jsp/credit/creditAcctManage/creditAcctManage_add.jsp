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
<body class="no-skin" >
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content" >
				<div class="row">
					<div class="col-xs-12 no-padding">
					<form action="CreditAcctManage/${msg}.do" name="Form" id="Form" method="post">
						<div id="zhongxin" class="paddingt-13" >
						<table id="table_report" class="table table-striped "  ><!-- table-bordered table-hover -->
							<tr>
								<td class="align-right width-25" >征信登录名:<span class="red ">*</span></td>
								<td><input type="text" name="CREDIT_CODE" id="CREDIT_CODE" maxlength="32"  placeholder="这里输入征信登录名"  class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">征信用户名称:<span class="red ">*</span></td>
								<td><input type="text" name="CREDIT_NAME" id="CREDIT_NAME" value="${pd.CREDIT_NAME}" maxlength="255" placeholder="这里输入征信用户名称" title="征信用户名称" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">证件类型:</td>
								<td>
								    <select class="chosen-select form-control width-75" dict-name="creditType" default-value="${pd.CRED_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE">
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">证件号码:</td>
								<td><input type="text" name="CREDENTIALS_NO" id="CREDENTIALS_NUM"  maxlength="255" placeholder="这里输入证件号码" title="证件号码" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">账号类型:</td>
								<td>
								    <select class="chosen-select form-control width-75" dict-name="clientType" default-value="${pd.CREDIT_ACCT_TYPE}" name="CREDIT_ACCT_TYPE" id="CREDIT_ACCT_TYPE">
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">是否柜面用户:<span class="red ">*</span></td>
								<td>
								    <select class="chosen-select form-control width-75" data-placeholder="请选择" name="IS_WEB" id="IS_WEB">
									<option value="">请选择</option>
									<option value="1">是</option>
									<option value="0">否</option>
									</select>
								</td>								
							</tr>
							<tr>
								<td class="align-right width-25">启用日期:<span class="red ">*</span></td>
								<td>
									<input type="text"  class="span10 date-picker width-75" data-date-format="yyyymmdd" name="START_DATE" id="START_DATE"  title="启用日期"/>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">初始密码:<span class="red ">*</span></td>
								<td>
									<input type="password" name="CURRENT_PASSWORD" id="CURRENT_PASSWORD"  class="width-75" title="初始密码"/>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>		
								<td ></td>
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
	<!--form表单-->
	<script src="static/js/jquery.form.js"></script>
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
			if($("#CURRENT_PASSWORD").val()==""){
				$("#CURRENT_PASSWORD").tips({
					side:3,
		            msg:'请输入初始密码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CURRENT_PASSWORD").focus();
			return false;
			}
			if($("#IS_WEB").val()==""){
				$("#IS_WEB").tips({
					side:3,
		            msg:'请选择是否柜面用户',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_WEB").focus();
			return false;
			}
			var CREDIT_ACCT_TYPE = $("#CREDIT_ACCT_TYPE").val();
			var CREDIT_CODE = $("#CREDIT_CODE").val();
			$.ajax({
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
					$("#Form").ajaxSubmit({
						complete:function(){
							document.getElementById('zhongxin').style.display = 'none';
							top.Dialog.close();
						}
					});
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
		function editPwd(CREDIT_CODE){
			var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改密码";
			 //diag.URL = '<%=basePath%>CreditAcctManage/goEdit.do?CREDIT_CODE='+CREDIT_CODE;
			 diag.URL = '<%=basePath%>CreditAcctManage/toPwdUpdate.do?menuId=59&user_code='+CREDIT_CODE;
			 diag.Width = 450;
			 diag.Height = 370;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
			
		}
	</script>
</body>
</html>