<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="">
								<form action="qeurySet/saveQ.do" name="Form" id="Form" method="post">
									<input type="text" hidden value="${pd.QUERY_MONTH}" name="QUERY_MONTH" id="QUERY_MONTH"/>
									<input type="text" name="QUERY_COUNT" id="QUERY_COUNT" hidden value="${pd.QUERY_COUNT}" />
									<input type="text" name="AVG_QUERY_COUNT" id="AVG_QUERY_COUNT" hidden value="${pd.AVG_QUERY_COUNT}"/>
									<div id="zhongxin" class="paddingt-13">
									<table id="table_report" class="table table-striped"> <!-- table-bordered table-hover  -->
										<tr>
											<td class="align-right">用户登录名称:</td>
											<td><input type="text" name="USERNAME" id="USERNAME" maxlength="32" class="width-75" onblur="hasU('${pd.COMPANY}')" /></td>
										</tr>
										<tr>
											<td class="align-right">用户类型:</td>
											<td>
												<select style="width:258px" dict-name="clientType" name="USER_TYPE" id="USER_TYPE"/>
													<option value="">请选择用户类型</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">查询上限值:</td>
											<td><input type="NUMBER" name="QUERY_MIN_COUNT" id="QUERY_MIN_COUNT" maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">查询预警倍数:</td>
											<td><input type="NUMBER" name="QUERY_MULTIPLE" id="QUERY_MULTIPLE" maxlength="32" class="width-75"/></td>
										</tr>
										<%-- <tr>
											<td class="align-right">新增月份:</td>
											<td><input type="text"  class="span10 date-picker width-75" data-date-format="yyyymm" readonly value="${pd.QUERY_MONTH}" name="QUERY_MONTH" id="QUERY_MONTH" title="日期"/></td>
										</tr>
										<tr>
											<td class="align-right">本月查询次数:</td>
											<td><input type="NUMBER" name="QUERY_COUNT" id="QUERY_COUNT" readonly value="${pd.QUERY_COUNT}" maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">前三月平均次数:</td>
											<td><input type="NUMBER" name="AVG_QUERY_COUNT" id="AVG_QUERY_COUNT" readonly value="${pd.AVG_QUERY_COUNT}" maxlength="32" class="width-75"/></td>
										</tr> --%>
										<tr>
											<td class="align-right">法人编码:</td>
											<td><input type="text" name="COMPANY" id="COMPANY" readonly value="${pd.COMPANY}" maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
										     <td class="align-center" colSpan=2>
										     	<a class="btn btn-orange btn-size1" onclick="save();">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</a>&nbsp;&nbsp;&nbsp;
												<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
											</td>
										</tr>
									</table>
									</div>
									
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
dict.init({ids:['USER_TYPE']});
	$(top.hangge());
	$(document).ready(function(){
		
	});
	//保存
	function save(){
		if($("#USERNAME").val()==""){
			$("#USERNAME").tips({
				side:3,
	            msg:'请输入用户登录名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#USERNAME").focus();
			return false;
		}
		if($("#USER_TYPE").val()==""){
			$("#USER_TYPE").tips({
				side:3,
	            msg:'请选择用户类型',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#USER_TYPE").focus();
			return false;
		}
		
		re = new RegExp("^[0-9]+$");
		if($("#QUERY_MIN_COUNT").val()==""){
			$("#QUERY_MIN_COUNT").tips({
				side:3,
	            msg:'请输入平均查询笔数下限值',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUERY_MIN_COUNT").focus();
			return false;
		}else if(!re.test($("#QUERY_MIN_COUNT").val())){
				$("#QUERY_MIN_COUNT").tips({
				side:3,
	            msg:'平均查询笔数下限值只能为正整数',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUERY_MIN_COUNT").focus();
			return false;
		}
		if($("#QUERY_MULTIPLE").val()==""){
			$("#QUERY_MULTIPLE").tips({
				side:3,
	            msg:'请输入查询激增预警倍数',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUERY_MULTIPLE").focus();
			return false;
		}else if($("#QUERY_MULTIPLE").val()<=0){
			$("#QUERY_MULTIPLE").tips({
				side:3,
	            msg:'查询激增预警倍数不能小于0',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QUERY_MULTIPLE").focus();
			return false;
		}
		var USERNAME = $('#USERNAME').val();
		var COMPANY = $('#COMPANY').val();
		var USER_TYPE = $('#USER_TYPE').val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>qeurySet/queryU.do',
	    	data: {USERNAME:USERNAME,COMPANY:COMPANY,USER_TYPE:USER_TYPE},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("errName" == data.result){
					 $("#USERNAME").tips({
							side:3,
				            msg:'用户 ' + USERNAME + ' 已经添加',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#USERNAME").val('');
					 return false;
				 }else{
				 	$("#Form").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }
			}
		});
	}
	
	//判断用户是否存在
	function hasU(COMPANY){
		var USERNAME = $('#USERNAME').val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>qeurySet/hasU.do',
	    	data: {USERNAME:USERNAME,COMPANY:COMPANY},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("errCom" == data.result){
					 $("#USERNAME").tips({
							side:3,
				            msg:'用户 ' + USERNAME + ' 不是该法人下用户',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#USERNAME").val('');
				 }else if("error" == data.result){
					 $("#USERNAME").tips({
							side:3,
				            msg:'用户 ' + USERNAME + ' 不存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#USERNAME").val('');
				 }
			}
		});
	}
	
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
</script>
</html>