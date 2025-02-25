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
								<form action="Product/saveProduct.do" name="Form" id="Form" method="post">
									<input type="hidden" name="method" id="method" value="${pd.method }" readonly/>
									<div id="zhongxin" class="paddingt-13">
									<table id="table_report" class="table table-striped"> <!-- table-bordered table-hover  -->
										<tr>
											<td class="align-right">产品编号:<span class="red ">*</span></td>
											<td><input type="text" name="PRODUCT_ID" id="PRODUCT_ID" value="${pd.PRODUCT_ID}" maxlength="20"  class="width-75"<c:if test="${pd.method != 'edit'}">onblur="hasU()"</c:if><c:if test="${pd.method == 'edit'}">readonly</c:if>/></td>
										</tr>
										<tr>
											<td class="align-right">产品名称:<span class="red ">*</span></td>
											<td><input type="text" name="PRODUCT_NAME" id="PRODUCT_NAME" value="${pd.PRODUCT_NAME}"  maxlength="100" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right width-30">业务类别:<span class="red ">*</span></td>
											<td>
												<select class="width-75" dict-name="YWLB" default-value="${pd.YWLB}" name="YWLB" id="YWLB">
													<option value="">请选择业务类别</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="align-right width-30">产品状态:<span class="red ">*</span></td>
											<td>
												<select class="width-75" dict-name="channel_status" default-value="${pd.PRODUCT_STATUS}" name="PRODUCT_STATUS" id="PRODUCT_STATUS">
													<option value="">请选择产品状态</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">产品描述:<span class="red ">*</span></td>
											<td><input type="text" name="PRODUCT_DESCRIBE" id="PRODUCT_DESCRIBE" value="${pd.PRODUCT_DESCRIBE}"  maxlength="20" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">产品所属机构:<span class="red ">*</span></td>
											<td><select class="width-75" name="COMPANY" id="COMPANY" default-value="${pd.COMPANY}" data-placeholder="请选择机构" >
												<c:forEach items="${orgList}" var="org">
													<option value="${org.orgId }" <c:if test="${pd.COMPANY == org.orgId}">selected</c:if>> ${org.name}</option>
												</c:forEach>
									  		</select></td>
										</tr>
										<tr>
										     <td class="align-center" colSpan=2>
										     	<a class="btn btn-orange btn-size1" onclick="save();">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</a>
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
dict.init({ids:['YWLB']});
dict.init({ids:['PRODUCT_STATUS']});
	$(top.hangge());
	$(document).ready(function(){
	});
	//判断渠道编号是否存在
	function hasU(){
		var PRODUCT_ID = $('#PRODUCT_ID').val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>Product/hasId.do',
	    	data: {PRODUCT_ID:PRODUCT_ID},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#PRODUCT_ID").tips({
							side:3,
				            msg:'产品编号 ' + PRODUCT_ID + ' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#PRODUCT_ID").val('').focus();
				 }
			}
		});
	}

	//保存
	function save(){
		if($("#PRODUCT_ID").val()==""){
			$("#PRODUCT_ID").tips({
				side:3,
				msg:'请填写产品编号',
				bg:'#AE81FF',
				time:3
			});
			$("#PRODUCT_ID").val('').focus();
			return false;
		}
		if($("#PRODUCT_NAME").val()==""){
			$("#PRODUCT_NAME").tips({
				side:3,
				msg:'请输入产品名称',
				bg:'#AE81FF',
				time:3
			});
			$("#PRODUCT_NAME").val('').focus();
			return false;
		}
		if($("#PRODUCT_STATUS").val()==""){
			$("#PRODUCT_STATUS").tips({
				side:3,
				msg:'请选择产品状态',
				bg:'#AE81FF',
				time:3
			});
			$("#PRODUCT_STATUS").val('').focus();
			return false;
		}
		if($("#PRODUCT_DESCRIBE").val()==""){
			$("#PRODUCT_DESCRIBE").tips({
				side:3,
				msg:'请输入产品描述',
				bg:'#AE81FF',
				time:3
			});
			$("#PRODUCT_DESCRIBE").val('').focus();
			return false;
		}
		if($("#COMPANY").val()==""){
			$("#COMPANY").tips({
				side:3,
				msg:'请输入产品所属机构',
				bg:'#AE81FF',
				time:3
			});
			$("#COMPANY").val('').focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
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