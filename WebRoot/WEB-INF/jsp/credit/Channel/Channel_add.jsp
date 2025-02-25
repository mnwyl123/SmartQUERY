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
								<form action="Channel/saveChannel.do" name="Form" id="Form" method="post">
									<input type="hidden" name="method" id="method" value="${pd.method }" readonly/>
									<div id="zhongxin" class="paddingt-13">
									<table id="table_report" class="table table-striped"> <!-- table-bordered table-hover  -->
										<tr>
											<td class="align-right">渠道编号:<span class="red ">*</span></td>
											<td><input type="text" name="CHANNEL_ID" id="CHANNEL_ID" value="${pd.CHANNEL_ID}" maxlength="20" onblur="hasU()" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">渠道描述:<span class="red ">*</span></td>
											<td><input type="text" name="CHANNEL_DES" id="CHANNEL_DES" value="${pd.CHANNEL_DES}"  maxlength="100" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right width-30">渠道状态:<span class="red ">*</span></td>
											<td>
												<select class="width-75" dict-name="channel_status" default-value="${pd.CHANNEL_STATUS}" name="CHANNEL_STATUS" id="CHANNEL_STATUS">
													<option value="">请选择渠道状态</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">联系人:<span class="red ">*</span></td>
											<td><input type="text" name="CHANNEL_CONTACT" id="CHANNEL_CONTACT" value="${pd.CHANNEL_CONTACT}"  maxlength="20" class="width-75"/></td>
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
dict.init({ids:['CHANNEL_STATUS']});
	$(top.hangge());
	$(document).ready(function(){
	});
	//判断渠道编号是否存在
	function hasU(){
		var CHANNEL_ID = $('#CHANNEL_ID').val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>Channel/hasId.do',
	    	data: {CHANNEL_ID:CHANNEL_ID},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#CHANNEL_ID").tips({
							side:3,
				            msg:'渠道编号 ' + CHANNEL_ID + ' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#CHANNEL_ID").val('').focus();
				 }
			}
		});
	}

	//保存
	function save(){
		if($("#CHANNEL_ID").val()==""){
			$("#CHANNEL_ID").tips({
				side:3,
				msg:'请填写渠道编号',
				bg:'#AE81FF',
				time:3
			});
			$("#CHANNEL_ID").val('').focus();
			return false;
		}
		if($("#CHANNEL_DES").val()==""){
			$("#CHANNEL_DES").tips({
				side:3,
				msg:'请输入渠道描述',
				bg:'#AE81FF',
				time:3
			});
			$("#CHANNEL_DES").val('').focus();
			return false;
		}
		if($("#CHANNEL_STATUS").val()==""){
			$("#CHANNEL_STATUS").tips({
				side:3,
				msg:'请选择渠道状态',
				bg:'#AE81FF',
				time:3
			});
			$("#CHANNEL_STATUS").val('').focus();
			return false;
		}
		if($("#CHANNEL_CONTACT").val()==""){
			$("#CHANNEL_CONTACT").tips({
				side:3,
				msg:'请输入联系人',
				bg:'#AE81FF',
				time:3
			});
			$("#CHANNEL_CONTACT").val('').focus();
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