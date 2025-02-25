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
											<td class="align-right width-25" >申请机构:<span class="red ">*</span></td>
											<td><input type="text" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="32" readonly placeholder="这里输入申请机构"  class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right width-25">客户姓名:<span class="red ">*</span></td>
											<td><input type="text" name="CLIENT_NAME" id="CLIENT_NAME" value="${pd.CLIENT_NAME}" maxlength="255" readonly placeholder="这里输入客户姓名" title="客户姓名" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right width-25">证件类型:<span class="red ">*</span></td>
											<td>
												<select class="width-75" disabled dict-name="CRED_TYPE_PER" default-value="${pd.CREDENTIALS_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE">
												</select>
											<input type="text" hidden name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE" readonly value="${pd.CREDENTIALS_TYPE}" maxlength="255" placeholder="这里输入证件类型" title="证件类型" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right width-25">证件号码:<span class="red">*</span></td>
											<td><input type="text" name="CREDENTIALS_NO" id="CREDENTIALS_NUM" readonly value="${pd.CREDENTIALS_NO}" maxlength="255" placeholder="这里输入证件号码" title="证件号码" class="width-75"/></td>
										</tr>
										<tr>
											<td class="align-right width-25">查询原因:<span class="red ">*</span></td>
											<td>
												<select class="width-75" dict-name="find_reason_per" disabled default-value="${pd.QUERY_REASON}" name="QUERY_REASON" id="FIND_REASON">
												</select>
											</td>
										</tr>
										<tr>
											<td class="align-right width-25">查询版本:<span class="red ">*</span></td>
											<td>
												<select class="width-75" disabled dict-name="FIND_VERSION" default-value="${pd.QUERY_VERSION}" name="QUERY_VERSION" id="FIND_VERSION">
												</select>
												<input type="text" hidden name="QUERY_VERSION" id="FIND_VERSION" readonly value="${pd.QUERY_VERSION}" maxlength="255"  title="查询版本" class="width-75"/>
											</td>
										</tr>
										<tr>
											<td class="align-right width-25">查询类型:<span class="red ">*</span></td>
											<td>
												<select class="width-75" disabled dict-name="FIND_TYPE" default-value="${pd.QUERY_TYPE}" name="QUERY_TYPE" id="FIND_TYPE">
												</select>
												<input type="text" hidden name="QUERY_TYPE" id="FIND_TYPE" readonly value="${pd.QUERY_TYPE}" maxlength="255"  title="查询类型" class="width-75"/>
											</td>
										</tr>
										<tr>
											<td class="align-right width-25">授权书到期日:<span class="red ">*</span></td>
											<td><input type="text"  class="span10 date-picker width-75" data-date-format="yyyymmdd" name="WARRANT_MATURITY_DATE" id="WARRANT_MATURITY_DATE" value="${pd.WARRANT_MATURITY_DATE}" title="授权书到期日"/></td>
										</tr>
										<tr>
											<td class="align-right width-25">客户经理:<span class="red ">*</span></td>
											<td><input type="text" name="CUST_MANAGER" id="CUST_MANAGER" value="${pd.CUST_MANAGER}" maxlength="255" placeholder="这里输入客户经理" title="客户经理" class="width-75"/></td>
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
											<td class="align-right">内部授权人:</td>
											<td><input type="text" name="CHECK_SYS_NAME" id="CHECK_SYS_NAME" readonly value="${appInfo.CHECK_SYS_NAME}"  maxlength="32" class="width-75"/></td>
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
	dict.init({ids:['FIND_REASON']});
	dict.init({ids:['FIND_VERSION']});
	dict.init({ids:['FIND_TYPE']});  
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