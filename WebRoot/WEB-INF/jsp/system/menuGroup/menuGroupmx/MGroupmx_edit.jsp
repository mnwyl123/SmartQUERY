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
	<%@ include file="../../index/top.jsp"%>
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
					
					<form action="menuGroupmx/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="FUN_GROUP_ID" id="FUN_GROUP_ID" value="${pd.FUN_GROUP_ID}"/>
						<input type="hidden" name="FUN_IDD" id="FUN_IDD" value="${pd.FUN_ID}"/>
						<div id="zhongxin" class="paddingt-5">
						<table id="table_report" class="table table-striped">
							<tr>
								<td class="align-right width-30" >功能ID:<span class="red ">*</span></td>
								<td><input type="text" name="FUN_ID" id="FUN_ID" value="${pd.FUN_ID}" maxlength="255" placeholder="这里输入add,delete,query,edit或其它"  <c:if test="${null != pd.FUN_ID}">readonly="readonly" disabled</c:if> class="width-75" onblur="hasID()"/></td>
							</tr>
							<tr>
								<td class="align-right" >功能名称:<span class="red ">*</span></td>
								<td><input type="text" name="FUN_NAME" id="FUN_NAME" value="${pd.FUN_NAME}" maxlength="255" placeholder="这里输入名称" title="名称" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">功能英文名称:</td>
								<td><input type="text" name="FUN_NAME_EN" id="FUN_NAME_EN" value="${pd.FUN_NAME_EN}" maxlength="255" placeholder="这里输入英文名称" title="功能英文名称" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">描述:</td>
								<td><textarea rows="3"  cols="10" name="FUN_DESC" id="FUN_DESC" maxlength="32" placeholder="这里输入描述" title="描述" class="width-75">${pd.FUN_DESC}</textarea></td>
							</tr>
							<!-- <tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr> -->
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
	<%@ include file="../../index/foot.jsp"%>
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
		if($("#FUN_ID").val()==""){
				$("#FUN_ID").tips({
					side:3,
		            msg:'请输入ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FUN_ID").focus();
			return false;
			}else if($("#FUN_NAME").val()==""){
				$("#FUN_NAME").tips({
					side:3,
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FUN_NAME").focus();
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
		//判断用户id是否存在
	function hasID(){
		if($('#FUN_ID').attr('readonly') == 'readonly'){
			return;
		}
		var FUN_ID = $('#FUN_ID').val();
		var FUN_GROUP_ID = '${pd.FUN_GROUP_ID}';
		$.ajax({
			type: "POST",
			url: '<%=basePath%>menuGroupmx/hasID.do',
	    	data: {FUN_ID:FUN_ID,FUN_GROUP_ID:FUN_GROUP_ID},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#FUN_ID").tips({
							side:3,
				            msg:'本组ID ' + FUN_ID + ' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#FUN_ID").val('');
				 }
			}
		});
	}
		</script>
</body>
</html>