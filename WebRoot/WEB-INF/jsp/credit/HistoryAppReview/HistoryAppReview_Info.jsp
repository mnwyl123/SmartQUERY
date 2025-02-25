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
								<form action="" name="Form" id="Form" method="post">
									<input type="hidden" name="ID" id="ID" value="${pd.ID }" readonly/>
									<div id="zhongxin" class="paddingt-13">
									<table id="table_report" class="table table-striped"> <!-- table-bordered table-hover  -->
										<tr>
											<td class="align-right">申请机构:</td>
											<td><input type="text" name="ORG_NAME" id="ORG_NAME" value="${ORG_NAME}" readonly maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">申请部门:</td>
											<td>
												<select style="width:260px" disabled dict-name="DeptCode" default-value="${DEPT_CODE }" name="DEPT_CODE" id="DEPT_CODE" class="width-75">
											</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">客户姓名:</td>
											<td><input type="text" name="CLIENT_NAME" id="CLIENT_NAME" readonly value="${appInfo.CLIENT_NAME}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">证件类型:</td>
											<td>
												<select style="width:260px" disabled dict-name="CRED_TYPE" default-value="${appInfo.CREDENTIALS_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE" class="width-75">
											</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">证件号码:</td>
											<td><input type="text" name="CREDENTIALS_NO" id="CREDENTIALS_NO" readonly value="${appInfo.CREDENTIALS_NO}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">查询员名称:</td>
											<td><input type="text" name="USER_SYS_NAME" id="USER_SYS_NAME" readonly value="${appInfo.USER_SYS_NAME}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">查询申请时间:</td>
											<td><input type="text" name="APPLICATION_TIME" id="APPLICATION_TIME" readonly value="${appInfo.APPLICATION_TIME}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">查询原因:</td>
											<td>
												<select style="width:260px" disabled dict-name="FIND_REASON" default-value="${appInfo.QUERY_REASON}" name="QUERY_REASON" id="QUERY_REASON" class="width-75">
											</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">查询版本:</td>
											<td>
												<select style="width:260px" disabled dict-name="FIND_VERSION" default-value="${appInfo.QUERY_VERSION}" name="QUERY_VERSION" id="QUERY_VERSION" class="width-75">
											</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">查询类型:</td>
											<td>
												<select style="width:260px" disabled dict-name="FIND_TYPE" default-value="${appInfo.QUERY_TYPE}" name="QUERY_TYPE" id="QUERY_TYPE" class="width-75">
											</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">授权书到期日:</td>
											<td><input type="text" name="WARRANT_MATURITY_DATE" id="WARRANT_MATURITY_DATE" readonly value="${appInfo.WARRANT_MATURITY_DATE}"  maxlength="32" class="width-75"/></td>
										</tr>
										<c:if test="${appInfo.WARRANT != '0' }">
											<tr>
												<td class="align-right width-30 paddingt-13">授权书:</td>
												<td>
													<a href="<%=basePath%>uploadFiles/uploadImgs/${appInfo.WARRANT}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${appInfo.WARRANT}" width="210"/></a>
												</td>
											</tr>
										</c:if>
										<c:if test="${appInfo.LOAN_APPLICATION != '0' }">
											<tr>
												<td class="align-right width-30 paddingt-13">贷款申请书:</td>
												<td>
													<a href="<%=basePath%>uploadFiles/uploadImgs/${appInfo.LOAN_APPLICATION}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${appInfo.LOAN_APPLICATION}" width="210"/></a>
												</td>
											</tr>
										</c:if>
										<c:if test="${appInfo.IDENTITY_DOCUMENT != '0' }">
											<tr>
												<td class="align-right width-30 paddingt-13">身份证明文件:</td>
												<td>
													<a href="<%=basePath%>uploadFiles/uploadImgs/${appInfo.IDENTITY_DOCUMENT}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${appInfo.IDENTITY_DOCUMENT}" width="210"/></a>
												</td>
											</tr>
										</c:if>
										<tr>
											<td class="align-right">授权审核时间:</td>
											<td><input type="text" name="CHECK_TIME" id="CHECK_TIME" readonly value="${appInfo.CHECK_TIME}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">授权审核员名称:</td>
											<td><input type="text" name="CHECK_SYS_NAME" id="CHECK_SYS_NAME" readonly value="${appInfo.CHECK_SYS_NAME}"  maxlength="32" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right">审核结果:</td>
											<td>
												<select name="STATUS" id="STATUS" disabled dict-name="checkStatus" default-value="${appInfo.STATUS}" data-placeholder="请选择审核结果" style="width: 260px;" class="width-75">
										  		</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">审核不通过原因:</td>
											<td>
												<textarea rows="3" cols="46" readonly name="CHECK_REJECT_RESON" id="CHECK_REJECT_RESON" title="审核不通过原因"  class="width-75">${appInfo.CHECK_REJECT_RESON}</textarea>
											</td>
										</tr>
										<tr>
										     <td class="align-center" colSpan=2>
												<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">关&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;闭</a> 
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
dict.init({ids:['CREDENTIALS_TYPE']});
dict.init({ids:['STATUS']});
dict.init({ids:['QUERY_REASON']});
dict.init({ids:['QUERY_VERSION']});
dict.init({ids:['QUERY_TYPE']});
dict.init({ids:['DEPT_CODE']});
	$(top.hangge());
	$(document).ready(function(){
		
	});
	
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