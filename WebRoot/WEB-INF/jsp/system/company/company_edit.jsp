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
<%@ include file="../index/top.jsp"%>
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
								<form action="company/${msg }.do" name="companyForm" id="companyForm" method="post">
								<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID }" readonly/>
									<div id="zhongxin" class="paddingt-13">
									<table id="table_report" class="table table-striped"> <!-- table-bordered table-hover  -->
										<tr>
											<td class="align-right">法人代码:<span class="red ">*</span></td>
											<td><input type="text" name="COMP_CODE" id="COMP_CODE" value="${pd.COMP_CODE}" maxlength="32" placeholder="这里输入法人代码" title="法人代码" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">法人简称:<span class="red ">*</span></td>
											<td><input type="text" name="COMP_SHORT" id="COMP_SHORT" value="${pd.COMP_SHORT}" maxlength="32" placeholder="这里输入法人简称" title="法人简称" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">法人名称:<span class="red ">*</span></td>
											<td><input type="text" name="COMP_NAME" id="COMP_NAME" value="${pd.COMP_NAME}"  maxlength="32" placeholder="这里输入法人名称" title="法人名称" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">法人logo:<span class="red ">*</span></td>
											<td><input type="text" name="LOGO_PATH" id="LOGO_PATH" value="${pd.LOGO_PATH}"  maxlength="32" placeholder="法人logo" title="法人logo" class="width-75"/></td>
										</tr>
										<c:if test="${msg == 'editC'}">
											<tr>
												<td class="align-right">状态</td>
												<td>
													<select name="LOCK_STATUS" id="LOCK_STATUS" class="width-80">
														<option value="0" <c:if test="${pd.LOCK_STATUS == '0'}">selected</c:if>>无效</option>
														<option value="1" <c:if test="${pd.LOCK_STATUS == '1'}">selected</c:if>>正常</option>
														<option value="2" <c:if test="${pd.LOCK_STATUS == '2'}">selected</c:if>>睡眠</option>
														<option value="3" <c:if test="${pd.LOCK_STATUS == '3'}">selected</c:if>>锁定</option>
													</select>
												</td>
											</tr>
										</c:if>
									</table>
									</div>
									<div  class="footfix">
									     <a class="btn btn-orange btn-size1" onclick="save('${pd.COMP_CODE }');">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
											<!-- <a class="btn btn-mini btn-primary" onclick="save();">确定</a> -->
										<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
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
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#COMP_CODE").val()!=""){
			$("#COMP_CODE").attr("readonly","readonly");
			$("#COMP_CODE").css("color","gray");
		}
	});
	//保存
	function save(COMP_ID){
		if($("#COMP_CODE").val()=="" || $("#COMP_CODE").val()=="此法人已存在!"){
			$("#COMP_CODE").tips({
				side:3,
	            msg:'输入法人代码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMP_CODE").focus();
			$("#COMP_CODE").val('');
			$("#COMP_CODE").css("background-color","white");
			return false;
		}else{
			$("#COMP_CODE").val(jQuery.trim($('#COMP_CODE').val()));
		}
		
		if($("#COMP_SHORT").val()==""){
			$("#COMP_SHORT").tips({
				side:3,
	            msg:'输入简称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#COMP_SHORT").focus();
			return false;
		}else{
			$("#COMP_SHORT").val($.trim($("#COMP_SHORT").val()));
		}
		if($("#COMP_NAME").val()==""){
			$("#COMP_NAME").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#COMP_NAME").focus();
			return false;
		}
		if($("#LOGO_PATH").val()==""){
			$("#LOGO_PATH").tips({
				side:3,
	            msg:'输入法人logo',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#LOGO_PATH").focus();
			return false;
		}
		if(COMP_ID != $("#COMP_CODE").val()){
				hasC();
		}else{
			$("#companyForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	
	//判断法人法人代码是否存在
	function hasC(){
		var COMP_CODE = $.trim($("#COMP_CODE").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>company/hasC.do',
	    	data: {COMP_CODE:COMP_CODE,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#companyForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#COMP_CODE").css("background-color","#D16E6C");
					setTimeout("$('#COMP_CODE').val('此法人代码已存在!')",500);
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