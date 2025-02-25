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
								<form action="QuerydDate/save.do" name="Form" id="Form" method="post">
									<input type="hidden" name="method" id="method" value="edit" readonly/>
									<input type="hidden" name="PARA_TYPE" id="PARA_TYPE" value="${pd.PARA_TYPE }" readonly/>
									<div id="zhongxin" class="paddingt-13">
									<table id="table_report" class="table table-striped"> <!-- table-bordered table-hover  -->
										<tr>
											<td class="align-right width-30">参数类型:<span class="red ">*</span></td>
											<td>
												<select class="width-75" dict-name="clientType" default-value="${pd.PARA_TYPE}" name="PARA_TYPE1" id="PARA_TYPE1" disabled>
												</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">限制时间:<span class="red ">*</span></td>
											<td><input type="number" name="LIMT_DATE" id="LIMT_DATE" value="${pd.LIMT_DATE}"  maxlength="20" class="width-75"/>(天)</td>
										</tr>
										<%-- <tr>
											<td class="align-right">机构:<span class="red ">*</span></td>
											<td>
												<c:if test="${admin == '1'}">
													<select id="ORG_ID" name="ORG_ID" class="width-75">
														<option value="">--</option>
														<c:forEach items="${orgs}" var="org">
															<option value="${org.ORG_ID}" <c:if test="${pd.ORG_ID == org.ORG_ID}">selected="true"</c:if>>${org.NAME}</option>
														</c:forEach>
													</select>
												</c:if>
												<c:if test="${admin != '1'}">
													<input type="hidden" name="ORG_ID" id="ORG_ID" value="${pd.ORG_ID}"  maxlength="20" class="width-75"/>
													<input type="text" value="${pd.NAME}"  maxlength="20" class="width-75"/>
												</c:if>
											</td>
										</tr> --%>
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
dict.init({ids:['PARA_TYPE1']});
	$(top.hangge());
	$(document).ready(function(){
	});
	
	
	//保存
	function save(){
		if($("#LIMT_DATE").val()==""){
			$("#LIMT_DATE").tips({
				side:3,
				msg:'请输入限制时间',
				bg:'#AE81FF',
				time:1
			});
			$("#LIMT_DATE").val('').focus();
			return false;
		}else if($("#LIMT_DATE").val()<0){
			$("#LIMT_DATE").tips({
				side:3,
				msg:'限制时间不能为负数',
				bg:'#AE81FF',
				time:1
			});
			$("#LIMT_DATE").val('').focus();
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