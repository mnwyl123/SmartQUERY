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
					
					<form action="queryNumRead/${msg}.do?INTERNAL=2" name="Form" id="Form" method="post" 
					enctype="multipart/form-data">
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
						    <tr hidden>
								<td class="align-right width-25" >查询ID:<span class="red ">*</span></td>
								<td><input type="text" name="ID" id="ID" value="${pd.ID}" maxlength="32" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25" >机构代码:<span class="red ">*</span></td>
								<td><input type="text" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="32" readonly placeholder="这里输入申请机构"  class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">被查询人姓名:<span class="red ">*</span></td>
								<td><input type="text" name="CLIENT_NAME" id="CLIENT_NAME" value="${pd.CLIENT_NAME}" maxlength="255" placeholder="这里输入客户姓名" title="客户姓名" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">被查询人证件类型:<span class="red ">*</span></td>
								<td>
								    <select class="chosen-select form-control width-75" dict-name="CRED_TYPE_PER" default-value="${pd.CREDENTIALS_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE">
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">被查询人证件号码:<span class="red">*</span></td>
								<td><input type="text" name="CREDENTIALS_NO" id="CREDENTIALS_NUM" value="${pd.CREDENTIALS_NO}" maxlength="255" placeholder="这里输入证件号码" title="证件号码" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">查询原因:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75"  default-value="${pd.QUERY_REASON}" name="QUERY_REASON" id="FIND_REASON">
									    <option value="">--</option>
										<option value="01" selected='true'>贷后管理</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td class="align-right width-35">内部授权人:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" name="CHECK_SYS_ID" id="CHECK_SYS_ID">
										<c:forEach items="${checkUserList}" var="checkUser">
											<option value="${checkUser.USER_ID }"<c:if test="${pd.CHECK_SYS_ID==checkUser.USER_ID}">selected</c:if>>
												${checkUser.NAME}
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-30">产品时间:<span class="red ">*</span></td>
								<td><input type="text" class="span10 date-picker width-75" data-date-format="yyyy-mm-dd" value="${pd.PRODUCE_DATE}" name="PRODUCE_DATE" id="PRODUCE_DATE" value="" maxlength="1" placeholder="这里输入是产品时间" title="产品时间" /></td>
							</tr>
							<tr>
							     <td class="align-center" colSpan=2>
							     	<a class="btn btn-orange btn-size1" onclick="save();">保&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</a>
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
	<!--<script src="js/common/jquery-1.7.2.js"></script>-->
	<script src="js/common/imgUp.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		dict.init({ids:['CREDENTIALS_TYPE']});
		dict.init({ids:['FIND_REASON']});
		dict.init({ids:['FIND_VERSION']});
		dict.init({ids:['FIND_TYPE']});  
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
			var id=obj.id;
		    if(fileType != '.gif'&&fileType != '.png'&&fileType != '.jpg'&&fileType != '.jpeg'){
		    	$("#"+id).tips({
					side:3,
		            msg:'只能上传图片',
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#"+id).val('');
		    	document.getElementById(id).files[0] = '只能上传图片';
		    }
		}
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
			if($("#FIND_REASON").val()==""){
				$("#FIND_REASON").tips({
					side:3,
		            msg:'查询原因不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FIND_REASON").focus();
				return false;
			}
			if($("#PRODUCE_DATE").val()==""){
				$("#PRODUCE_DATE").tips({
					side:3,
		            msg:'日期不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCE_DATE").focus();
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
			if($("#CHECK_SYS_ID").val()==""||$("#CHECK_SYS_ID").val()==null){
				$("#CHECK_SYS_ID").tips({
					side:3,
		            msg:'请选择内部授权人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHECK_SYS_ID").focus();
			   return false;
			}
			var CREDENTIALS_NUM=$("#CREDENTIALS_NUM").val();
			if($("#CREDENTIALS_NUM").val()!=""&&$("#CREDENTIALS_TYPE").val()=="0"){
				var reg = /(^(\d{6}(([1-9]\d{3}((01|0[3-9])|(1[0-2]))((0[1-9])|([1|2]\d)|(3[0-1])))|([1-9]\d{3}02((0[1-9])|([12]\d))))\d{3}[0-9Xx])$)|(^(\d{6}((\d{2}((01|0[3-9])|(1[0-2]))((0[1-9])|([1|2]\d)|(3[0-1])))|([1-9]\d{3}02((0[1-9])|([12]\d))))\d{3})$)/;
				if(!CREDENTIALS_NUM.match(reg)){
					$("#CREDENTIALS_NUM").tips({
						side:3,
						msg:'请输入正确的证件号码',
						bg:'#AE81FF',
						time:2
					});
					$("#CREDENTIALS_NUM").focus();
					return false;
				}
			}
			if($("#FIND_REASON").val()!="01"&&$("#FIND_REASON").val()!="05"){
				if($("#WARRANT1").val()==""){
					if($("#WARRANT").val()==""){
						$("#WARRANT").tips({
							side:3,
							msg:'请上传授权书',
							bg:'#AE81FF',
							time:2
					   });
					   $("#WARRANT").focus();
					   return false;
				   }
				}
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