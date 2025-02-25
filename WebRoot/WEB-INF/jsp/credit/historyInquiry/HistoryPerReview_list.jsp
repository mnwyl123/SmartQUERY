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
						<form action="HistoryInquery/list.do?menuId=${pd.menuId}" method="post" name="Form" id="Form">
						<table class="margin-5 width-100">
							<td class="align-left width-70">
									<c:if test="${QX.query == 1 }">
									</div>
									<div class="float-l margin2-5">	
									<span>客户名称:<span>
										<input id="CLIENT_NAME" type="text" name="CLIENT_NAME" value="${pd.CLIENT_NAME}" placeholder="客户名称" />
									</div>
									<div class="float-l margin2-5">
									    <span>证件类型:<span>
										<select class="" name="CREDENTIALS_TYPE" dict-name="CRED_TYPE_PER" default-value="${pd.CREDENTIALS_TYPE}" id="CREDENTIALS_TYPE" data-placeholder="证件类型" style="width: 120px;">
										    <option value="">-请选择-</option>
								  		</select>
									</div>
									<div class="float-l margin2-5">	
									<span>证件号码:<span>
										<input id="CREDENTIALS_NUM" type="text" name="CREDENTIALS_NO" value="${pd.CREDENTIALS_NO}" placeholder="证件号码"/>
									</div>
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if>
								</td>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
									<!-- <th class="center width50">序号</th> -->
									<%-- <th class="center">产品名称</th> --%>
									<th class="center">客户姓名</th>
									<th class="center" dict-name="CRED_TYPE_PER">证件类型</th>
									<th class="center">证件号码</th>
									<th class="center">授权书到期日</th>
								    <th class="center" dict-name="find_reason_per">查询原因</th>
									<th class="center" dict-name="FIND_VERSION">查询版本</th>
									<th class="center" dict-name="FIND_TYPE">查询类型</th>
									<th class="center" dict-name="checkStatus">查询状态</th>
									<th class="center">审核不通过原因</th>
									<th class="center">征信报告日期</th>
									<th class="center width-10">操作</th>
								</tr>
							</thead>
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.query == 1 }">
										<c:forEach items="${varList}" var="var" varStatus="vs">	
											<tr>
												<%-- <td class='center'>${var.ID}</td> --%>
												<!--  <td class='center'>${var.PRODUCT_NAME}</td>-->
												<td class='center'>${var.CLIENT_NAME}</td>
												<td class='center'>${var.CREDENTIALS_TYPE}</td>
												<td class='center'>${var.CREDENTIALS_NO}</td>
												<td class='center'>${var.WARRANT_MATURITY_DATE}</td>
												<td class='center'>${var.QUERY_REASON}</td>
												<td class='center'>${var.QUERY_VERSION}</td>
												<td class='center'>${var.QUERY_TYPE}</td>
												<td class='center'>${var.STATUS}</td>
												<td class='center'>${var.CHECK_REJECT_RESON}</td>
												<td class='center'>${var.QUERY_TIME}</td>
												<td class="center">

													<i class="menu-icon fa fa-book icon-shape7se" title="详细信息" onclick="goDetail('${var.ID}','${var.USER_SYS_ID}','${var.CLIENT_TYPE}');" ></i>
												<%--	<i class="iconfont icon-bianji red1 marginLR-10" title="修改"  onclick="edit('${var.ID}');"></i> --%>
												
								 
					
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${QX.query != 1 }">
										<tr>
											<td colspan="12" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="12" class="center">没有相关数据</td>
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
dict.init({ids:['TYPE']});
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

//查询申请历史详情
function goDetail(ID,USER_SYS_ID,CLIENT_TYPE){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="查询申请历史详情";
	 diag.URL = '<%=basePath%>HistoryInquery/getPerHistoryInfo.do?ID='+ID+'&USER_SYS_ID='+USER_SYS_ID;
	 diag.Width = 500;
	 diag.Height = 550;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location=self.location",100);
			 }else{
				 nextPage(${page.currentPage});
			 }
		}
		diag.close();
	 };
	 diag.show();
}	
//修改
function edit(ID){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改";
	 diag.URL ='<%=basePath%>SavePersonInquiryController/goRevise.do?ID='+ID;
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
