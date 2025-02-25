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
	<!-- 图标 -->
	<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
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
					<form action="exceptionParam/${msg }.do" name="Form" id="Form" method="post">
					<input type="hidden" name="OID" id="OID" value="${paramObject.ORG_ID }"/>
					<input type="hidden" name="msg" id="msg" value="${msg }"/>
						<div id="zhongxin">
						<table id="table_report" class="table table-striped" >
							<tr>
								<td class="align-right">机构名称:<span class="red ">*</span></td>
								<td>
								  <c:if test="${msg=='saveP'}">
									<select class="chosen-select form-control width-75" name="ORG_ID" id="ORG_ID" onchange="hasO(this.value)"; data-placeholder="请选择机构">
										<c:forEach items="${orgList}" var="org">
											<option value="${org.ORG_ID }" <c:if test="${paramObject.ORG_ID == org.orgId}">selected</c:if>>${org.NAME}</option>
										</c:forEach>
									</select>
								  </c:if>
								  <c:if test="${msg=='updateP'}">
									<select class="chosen-select form-control width-75" name="ORG_ID" id="ORG_ID" onchange="hasO(this.value)"; data-placeholder="请选择机构">
										<option value="${paramObject.ORG_ID }"/>${paramObject.ORG_NAME }</option>
									</select>
								  </c:if>
								</td>
							</tr>
							<tr>
								<td class="align-right">个人失败占比上限(%):<span class="red ">*</span></td>
								<td><input type="number" name="FAIL_ZBSX_PER" id="FAIL_ZBSX_PER" value="${paramObject.FAIL_ZBSX_PER}" placeholder="个人失败占比上限" title="个人失败占比上限" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">企业失败占比上限(%):<span class="red ">*</span></td>
								<td><input type="number" name="FAIL_ZBSX_ORG" id="FAIL_ZBSX_ORG" value="${paramObject.FAIL_ZBSX_ORG}" placeholder="企业失败占比上限" title="企业失败占比上限" class="width-75"/></td>
							</tr> 
							<tr>
								<td class="align-right">短时间内对同一客户查询次数上限:<span class="red ">*</span></td>
								<td><input type="number" name="OTHER_REASON_ZBSX" id="OTHER_REASON_ZBSX" value="${paramObject.OTHER_REASON_ZBSX}" placeholder="其他理由占比上限" title="其他理由占比上限" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">短时间内对相同客户查询时间(h):<span class="red ">*</span></td>
								<td><input type="number" name="CROSS_REGION_ZBSX" id="CROSS_REGION_ZBSX" value="${paramObject.CROSS_REGION_ZBSX}" placeholder="跨地域占比上限" title="跨地域占比上限" class="width-75"/></td>
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
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		$(document).ready(function(){
			if($("#OID").val()!=""){
				$("#ORG_ID").attr("disabled","disabled");
				$("#ORG_ID").css("color","gray");
			}
			if($("#msg").val()=="saveP"){
			if($("#ORG_ID").val()!=""){
				var ORG_ID = $("#ORG_ID").val();
				hasO(ORG_ID);
			}
			}
		});
		
		//保存
		function save(method){
			if($("#ORG_ID").val()==""){
				$("#ORG_ID").tips({
					side:3,
		            msg:'请选择机构',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORG_ID").focus();
				return false;
			}
			if($("#FAIL_ZBSX_PER").val()==""){
				$("#FAIL_ZBSX_PER").tips({
					side:3,
		            msg:'占比上限不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAIL_ZBSX_PER").focus();
				return false;
			}else if($("#FAIL_ZBSX_PER").val()<0||$("#FAIL_ZBSX_PER").val()>100){
				$("#FAIL_ZBSX_PER").tips({
					side:3,
		            msg:'请输入正确的上限值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAIL_ZBSX_PER").focus();
				return false;
			}
			if($("#FAIL_ZBSX_ORG").val()==""){
				$("#FAIL_ZBSX_ORG").tips({
					side:3,
		            msg:'占比上限不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAIL_ZBSX_ORG").focus();
				return false;
			}else if($("#FAIL_ZBSX_ORG").val()<0||$("#FAIL_ZBSX_ORG").val()>100){
				$("#FAIL_ZBSX_ORG").tips({
					side:3,
		            msg:'请输入正确的上限值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAIL_ZBSX_ORG").focus();
				return false;
			}
			if($("#OTHER_REASON_ZBSX").val()==""){
				$("#OTHER_REASON_ZBSX").tips({
					side:3,
		            msg:'占比上限不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OTHER_REASON_ZBSX").focus();
				return false;
			}else if($("#OTHER_REASON_ZBSX").val()<0||$("#OTHER_REASON_ZBSX").val()>100){
				$("#OTHER_REASON_ZBSX").tips({
					side:3,
		            msg:'请输入正确的上限值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OTHER_REASON_ZBSX").focus();
				return false;
			}
			if($("#CROSS_REGION_ZBSX").val()==""){
				$("#CROSS_REGION_ZBSX").tips({
					side:3,
		            msg:'占比上限不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CROSS_REGION_ZBSX").focus();
				return false;
			}else if($("#CROSS_REGION_ZBSX").val()<0||$("#CROSS_REGION_ZBSX").val()>100){
				$("#CROSS_REGION_ZBSX").tips({
					side:3,
		            msg:'请输入正确的上限值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CROSS_REGION_ZBSX").focus();
				return false;
			}
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		//判断机构是否添加
		function hasO(ORG_ID){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>exceptionParam/hasO.do',
		    	data: {ORG_ID:ORG_ID},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("error" == data.result){
						 $("#ORG_ID").tips({
								side:3,
					            msg:'该机构已经添加',
					            bg:'#AE81FF',
					            time:3
					        });
						 $("#ORG_ID").val('');
					 }
				}
			});
		}

		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			//下拉框
			$('.selectpicker').selectpicker({
				'selectedText':'cat'
			});
		});
	</script>
</body>
</html>