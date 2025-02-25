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
								<form action="macheChange/saveCheck.do" name="Form" id="Form" method="post">
								<input type="hidden" name="ID" id="ID" value="${pd.ID }" readonly/>
									<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID }" readonly/>
									<div id="zhongxin" class="paddingt-13">
									<table id="table_report" class="table table-striped"> <!-- table-bordered table-hover  -->
										<tr>
											<td class="align-right">用户登录名:</td>
											<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" readonly maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">法人编码:</td>
											<td><input type="text" name="COMPANY" id="COMPANY" value="${pd.COMPANY}" readonly maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">变更前MAC:</td>
											<td><input type="text" name="OLD_MAC" id="OLD_MAC" readonly value="${pd.OLD_MAC}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">变更前IP:</td>
											<td><input type="text" name="OLD_IP" id="OLD_IP" readonly value="${pd.OLD_IP}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">变更后MAC:</td>
											<td><input type="text" name="NEW_MAC" id="NEW_MAC" readonly value="${pd.NEW_MAC}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">变更后IP:</td>
											<td><input type="text" name="NEW_IP" id="NEW_IP" readonly value="${pd.NEW_IP}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">审核状态:</td>
											<td>
												<select name="STATUS" id="STATUS" data-placeholder="请选择审核结果" style="width: 260px;" class="width-75">
													<option value="0" <c:if test="${pd.STATUS  == 0 }">selected="selected"</c:if>>待审核</option>
													<option value="1" <c:if test="${pd.STATUS  == 1 }">selected="selected" disable</c:if>>同意</option>
													<option value="2" <c:if test="${pd.STATUS  == 2 }">selected="selected"</c:if>>不同意</option>
										  		</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">审核意见:</td>
											<td>
												<textarea rows="3" cols="46" name="AUDIT_OPINION" id="AUDIT_OPINION" placeholder="这里输入审核意见" title="审核意见"  class="width-75"></textarea>
											</td>
										</tr>
										<tr>
										     <td class="align-center" colSpan=2>
										     	<c:if test="${pd.STATUS  != 0 }">
										     		<a class="btn btn-orange btn-size1" onclick="top.Dialog.close();">关&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;闭</a>
										     	</c:if>
										     	<c:if test="${pd.STATUS  == 0 }">
										     		<a class="btn btn-orange btn-size1" onclick="save();">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</a>
										     	</c:if>
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
	$(top.hangge());
	$(document).ready(function(){
		
	});
	//保存
	function save(){
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请审核',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#STATUS").focus();
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