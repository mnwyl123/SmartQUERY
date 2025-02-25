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
	<style>
	   .ace-file-input{
		   width:75% !important;
	   }
	</style>
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
					<form action="KeyCustMaintain/${msg}.do" name="Form" id="Form" method="post">
					    <input type="text" hidden name="CUST_NO" id="CUST_NO" value="${pd.CUST_NO}" class="width-75"/>
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
						<c:if test="${msg=='save'}">
							<tr>
								<td class="align-right width-25" >客户类型:<span class="red ">*</span></td>
								<td>
									 <select class="chosen-select form-control width-75" dict-name="clientType" default-value="${pd.CLIENT_TYPE}" name="CLIENT_TYPE" id="CLIENT_TYPE">
									    <!-- <option value="0">0-身份证</option>
										<option value="1">1-户口簿证</option>
										<option value="2">2-护照</option>
										<option value="3">3-军官证</option> -->
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">客户姓名:<span class="red ">*</span></td>
								<td><input type="text" name="CLIENT_NAME" id="CLIENT_NAME" value="${pd.CLIENT_NAME}" maxlength="255" placeholder="这里输入客户姓名" title="客户姓名" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">证件号码/中征码:<span class="red">*</span></td>
								<td><input type="text" name="CREDENTIALS_NO" id="CREDENTIALS_NUM" value="${pd.CREDENTIALS_NO}" maxlength="255" placeholder="这里输入证件号码或者中征码" title="证件号码" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">业务类型:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" dict-name="OPERATION_TYPE" default-value="${pd.OPERATION_TYPE}" name="OPERATION_TYPE" id="OPERATION_TYPE">
									  
									</select>
								</td>
							</tr>
						</c:if>
							<c:if test="${msg=='edit'}">
							<tr>
								<td class="align-right width-25" >客户类型:<span class="red ">*</span></td>
								<td>
									 <select class="chosen-select form-control width-75" dict-name="clientType" disabled default-value="${pd.CLIENT_TYPE}" name="CLIENT_TYPE" id="CLIENT_TYPE">
									    <!-- <option value="0">0-身份证</option>
										<option value="1">1-户口簿证</option>
										<option value="2">2-护照</option>
										<option value="3">3-军官证</option> -->
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">客户姓名:<span class="red ">*</span></td>
								<td><input type="text" name="CLIENT_NAME" id="CLIENT_NAME" value="${pd.CLIENT_NAME}" readonly maxlength="255" placeholder="这里输入客户姓名" title="客户姓名" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">证件号码/中征码:<span class="red">*</span></td>
								<td><input type="text" name="CREDENTIALS_NO" id="CREDENTIALS_NUM" value="${pd.CREDENTIALS_NO}" readonly maxlength="255" placeholder="这里输入证件号码或者中征码" title="证件号码" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">业务类型:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" dict-name="OPERATION_TYPE" disabled default-value="${pd.OPERATION_TYPE}" name="OPERATION_TYPE" id="OPERATION_TYPE">
									  
									</select>
								</td>
							</tr>
						</c:if>
							<tr>
								<td class="align-right width-25">移入日期:<span class="red ">*</span></td>
								<td><input type="text"  class="span10 date-picker width-75" data-date-format="yyyymmdd" name="ADD_DATE" id="ADD_DATE" value="${pd.ADD_DATE}" title="移入日期"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">移入原因:<span class="red ">*</span></td>
								<td><textarea type="text" name="ADD_REASON" id="ADD_REASON"   value="" maxlength="255" placeholder="这里输入移入原因" title="移入原因" class="width-75">${pd.ADD_REASON}</textarea></td>
							</tr>
							<c:if test="${msg=='edit'}">
							<tr>
								<td class="align-right width-25">移出日期:<span class="red ">*</span></td>
								<td><input type="text"  class="span10 date-picker width-75" data-date-format="yyyymmdd" name="DELETE_DATE" id="DELETE_DATE" value="${pd.DELETE_DATE}" title="移出日期"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">移出原因:<span class="red ">*</span></td>
								<td><textarea type="text" name="DELETE_REASON" id="DELETE_REASON" value="" maxlength="255" placeholder="这里输入移出原因" title="移出原因" class="width-75"/>${pd.DELETE_REASON}</textarea></td>
							</tr>
							</c:if>
							<tr>
								<td class="align-right">
									
								</td>
							     <td class="align-left">
							     	<a class="btn btn-orange btn-size1" onclick="save();">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</a>
									<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
								</td>
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

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 上传控件 -->
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		dict.init({ids:['CLIENT_TYPE']});
		dict.init({ids:['OPERATION_TYPE']});
		//保存
		function save(){
			if($("#CLIENT_NAME").val()==""){
				$("#CLIENT_NAME").tips({
					side:3,
		            msg:'请输入客户姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLIENT_NAME").focus();
				return false;
			}
			if($("#CREDENTIALS_NUM").val()==""){
				$("#CREDENTIALS_NUM").tips({
					side:3,
		            msg:'请输入证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREDENTIALS_NUM").focus();
			return false;
			}
			if($("#ADD_DATE").val()==""){
				$("#ADD_DATE").tips({
					side:3,
		            msg:'请选择移入日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_DATE").focus();
			return false;
			}
			if($("#ADD_REASON").val()==""){
				$("#ADD_REASON").tips({
					side:3,
		            msg:'请输入移入原因',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_REASON").focus();
			return false;
			}
			if($("#DELETE_DATE").val()==""){
				$("#DELETE_DATE").tips({
					side:3,
		            msg:'请选择移出日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DELETE_DATE").focus();
			return false;
			}
			if($("#DELETE_REASON").val()==""){
				$("#DELETE_REASON").tips({
					side:3,
		            msg:'请输入移出原因',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DELETE_REASON").focus();
			return false;
			}
			$("#Form").submit();
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