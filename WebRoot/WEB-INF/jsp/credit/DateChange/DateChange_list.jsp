<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<!-- 检索  -->
						<form action="SavePersonInquiryController/listHistory.do?menuId=${pd.menuId}" method="post" name="Form" id="Form">
						<table class="margin-5 width-100">
							<tr>
								<c:if test="${QX.query == 1 }">
									<td class="align-left">
										<div class="float-l margin2-5">
										    <span>&nbsp;客户类型:</span>
											<select style="width:180px" dict-name="clientType" default-value="${pd.CLIENT_TYPE}" name="CLIENT_TYPE" id="CLIENT_TYPE" onchange="goSearch()"/>
												<option value="">请选择客户类型</option>
											</select>
										</div>
										<div class="float-l margin2-5">
											<!-- <span>&nbsp;客户名称:</span>
											<input type="text" style="width:180px" name="CLIENT_NAME" id="CLIENT_NAME" placeholder="请输入客户名称" /> -->
											 <span>&nbsp;机构名称:<span>
											<select class="" name="ORG_ID" id="ORG_ID" data-placeholder="请选择机构" style="width:120px;">
												<option value=""></option>
												<c:forEach items="${orgList}" var="org">
													<option value="${org.orgId }" <c:if test="${pd.ORG_ID == org.orgId}">selected</c:if>> ${org.name}</option>
												</c:forEach>
									  		</select>
										</div>
										<div class="float-l margin2-5">	
										    <span>&nbsp;证件类型:<span>
										    <c:if test="${pd.CLIENT_TYPE == 2 }">
												<select  dict-name="COM_CRED_TYPE" default-value="${pd.CREDENTIALS_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE" style="width: 120px;">  
												   <option value="">-请选择-</option>
												</select>
											</c:if>
											<c:if test="${pd.CLIENT_TYPE == 1  }">
												<select style="width:180px" dict-name="CRED_TYPE" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE">
													<option value="">请选择证件类型</option>
												</select>
											</c:if>
										</div>
										<div class="float-l margin2-5">
											<span>&nbsp;证件号码:</span>
											<input type="text"style="width:180px" name="CREDENTIALS_NO" id="CREDENTIALS_NO" placeholder="请输入身份证号码/中证码" />
										</div>
										<div class="float-l btn-group">
										   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
										</div>
									</td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
									<!-- <th class="center width50">序号</th> -->
									<th class="center" dict-name="clientType">客户类型</th>
									<th class="center">客户名称</th>
									 <c:if test="${pd.CLIENT_TYPE == 2 }">
										<th class="center" dict-name="COM_CRED_TYPE">证件类型</th>
									</c:if>
									 <c:if test="${pd.CLIENT_TYPE == 1 }">
										<th class="center" dict-name="CRED_TYPE">证件类型</th>
									</c:if>
									<th class="center">证件号码</th>
									<th class="center">查询员</th>
									<th class="center">所属机构</th>
									<th class="center">申请时间</th>
									<th class="center">审核状态</th>
									<th class="center width-10">操作</th>
								</tr>
							</thead>
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty listInfo}">
									<c:if test="${QX.query == 1 }">
										<c:forEach items="${listInfo}" var="var" varStatus="vs">	
											<tr>
												<%-- <td class='center'>${var.ID}</td> --%>
												<td class="center">${var.CLIENT_TYPE }</td>
												<td class="center">${var.CLIENT_NAME }</td>
												<td class="center">${var.CREDENTIALS_TYPE}</td>
												<td class="center">${var.CREDENTIALS_NO}</td>
												<td class="center">${var.USERNAME}</td>
												<td class="center">${var.NAME}</td>
												<td class="center">${var.APPLICATION_TIME}</td>
												<td class='center'>
												<c:if test="${var.STATUS == '00' }">
												<span ><i>待审核</i></span>
												</c:if>
												<c:if test="${var.STATUS == '01' }">
												<span ><i>同意</i></span>
												</c:if>
												<c:if test="${var.STATUS == '02' }">
												<span ><i>不同意</i></span>
												</c:if>
											</td>
												<td class="center">
													<c:if test="${QX.check == 1 }">
														<i class="iconfont icon-duihao red1 marginLR-10" title="详细信息" onclick="edit('${var.ID}','${var.CLIENT_TYPE}','${var.FILEADDRESS}');"></i>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${QX.query != 1 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table class="width-100">
							<tr>
								<td class="align-top center"><div class="pagination">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>

<script type="text/javascript">
dict.init({ids:['CLIENT_TYPE']});
dict.init({ids:['CREDENTIALS_TYPE']});
dict.init({ids:['simple-table'],buildType:'grid'});
$(top.hangge());

//检索
function goSearch(){
	top.jzts();
	$("#Form").submit();
}

$(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
	
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

	
	//复选框全选控制
	var active_class = 'active';
	$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
			else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
		});
	});
});

//修改
function edit(ID,CLIENT_TYPE,FILEADDRESS){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改";
	 diag.URL = '<%=basePath%>SavePersonInquiryController/goReviseG.do?ID='+ID+'&CLIENT_TYPE='+CLIENT_TYPE+'&FILEADDRESS='+FILEADDRESS;
	 diag.Width = 510;
	 diag.Height = 640;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location=self.location",100);
			 }else{
				 nextPage('${page.currentPage}');
			 }
		}
		diag.close();
	 };
	 diag.show();
}


</script>
</html>
