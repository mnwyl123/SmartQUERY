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
					
					<form action="personObjection/toCheckResultReport.do" name="Form" id="Form" method="post">
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
							<input type="hidden" type="text" id="ID" name="ID" value="${pd.ID}"/>
							<input type="hidden" id="BTN_TYPE" name="BTN_TYPE" />
							<tr>
								<td class="align-right width-25">异议事项号:<span class="red ">*</span></td>
								<td><input type="text" name="OBJCHECKID" id="OBJCHECKID" value="${pd.OBJCHECKID}" maxlength="255" title="异议事项号" class="width-75" readOnly="true"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">异议事项流水号:<span class="red ">*</span></td>
								<td><input type="text" name="OBJCHECKNUM" id="OBJCHECKNUM" value="${pd.OBJCHECKNUM}" maxlength="255" title="异议事项号" class="width-75" readOnly="true"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">有效联系电话:<span class="red ">*</span></td>
								<td><input type="text" name="PHONENUM" id="PHONENUM" value="${pd.PHONENUM}" maxlength="255"  title="异议事项号" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">核查结果:<span class="red ">*</span></td>
								<td>
									<select class="width-75" style="width:180px" dict-name="checkResult" default-value="${pd.CHECKRESULT}" name="CHECKRESULT" id="CHECKRESULT">
										<option value="">请选择核查结果</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">异议核查结果描述:<span class="red ">*</span></td>
								<td><input type="text" name="CHECKRESULTDESC" id="CHECKRESULTDESC" value="${pd.CHECKRESULTDESC}" maxlength="255" title="异议核查结果描述" class="width-75"/></td>
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
<div class="center">
		<c:if test="${admin != '0'}">
			<a class="btn btn-orange btn-size1 b" onclick="save('1');" id="btn" style="margin-left:50px;">保存并上报</a>
		</c:if>
	
			<a class="btn btn-orange btn-size1 b" onclick="save('2');" id="btn">保&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</a>
	
		<c:if test="${admin != '0'}">
			<a class="btn btn-orange btn-size1 b" onclick="save('3');" id="btn">上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;报</a>
		</c:if>
			<a class="btn btn-size1 btn-default b" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
</div>
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--<script src="js/common/jquery-1.7.2.js"></script>-->
	<script src="js/common/imgUp.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		dict.init({ids:['CHECKRESULT']});
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
			var id=obj.id;
		}
		//保存
		function save(type){
			if($("#OBJCHECKID").val()==""){
				$("#OBJCHECKID").tips({
					side:3,
		            msg:'请输入异议事项号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OBJCHECKID").focus();
			return false;
			}
			if($("#OBJCHECKNUM").val()==""){
				$("#OBJCHECKNUM").tips({
					side:3,
		            msg:'请输入异议事项流水号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OBJCHECKNUM").focus();
			return false;
			}
			if($("#PHONENUM").val()==""){
				$("#PHONENUM").tips({
					side:3,
		            msg:'请输入有效联系电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONENUM").focus();
			return false;
			}
			if($("#CHECKRESULT").val()==""){
				$("#CHECKRESULT").tips({
					side:3,
		            msg:'请选择核查结果',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHECKRESULT").focus();
			return false;
			}
			if($("#CHECKRESULTDESC").val()==""){
				$("#CHECKRESULTDESC").tips({
					side:3,
		            msg:'请输入异议核查结果描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHECKRESULTDESC").focus();
			return false;
			}
			$("#BTN_TYPE").val(type);
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