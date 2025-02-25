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
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
<style>
    .margin2-5{
		margin-right:10px;
	}
</style>
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
						<!-- <div class="col-xs-12">
							<iframe src="/file/SGC/uploadFiles/uploadImgs/528758380f8f4a0d81538e13e037e243abce9875d4ba45489e2736bdf7fa5174/528758380f8f4a0d81538e13e037e243abce9875d4ba45489e2736bdf7fa5174.html"></iframe>
						</div> -->	
						<!-- 检索  -->
						<form action="test/list.do?menuId=38" method="post" name="Form" id="Form">
						<input id="user_id" hidden type="text" name="USERID" value="${pd.USERID}" placeholder="当前登录的用户ID"/>
			            <table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70">
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
									<div class="float-l margin2-5">	
									    <span>征信报告日期:</span>
										<input type="text"  class="span10 date-picker" data-date-format="yyyy-mm-dd" name="QUERY_TIME" id="FIND_TIME" value="${pd.QUERY_TIME}" title="征信报告日期"/>
									</div>
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
								<td class="align-right width-30">
									 <div class="btn-group" >
										<a class="btn btn-orange btn-mini" onclick="add();" title="历史数据处理"><i class="iconfont icon-tianjia"></i></a>
									</div>
									<div class="btn-group" >
										<a class="btn btn-orange btn-mini" onclick="cip();" title="转存"><i class="iconfont icon-tianjia"></i></a>
									</div>
								</td>
							</tr>
								
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width50" hidden>查询编号</th>
									<th class="center">客户姓名</th>
									<th class="center" dict-name="CRED_TYPE_PER">证件类型</th>
									<th class="center">证件号码</th>
									<th class="center">征信报告日期</th>
									<th class="center" dict-name="FIND_VERSION">查询版本</th>
									<th class="center">申请时间</th>
									<th class="center">授权时间</th>
									<th class="center" hidden >查询发起人ID</th>
									<th class="center" hidden >查询状态</th>
									<th class="center width-10">操作</th>
								</tr> 
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center' hidden>${var.ID}</td>
											<td class='center'>${var.CLIENT_NAME}</td>
											<td class='center'>${var.CREDENTIALS_TYPE}</td>
											<td class='center'>${var.CREDENTIALS_NO}</td>
											<td class='center'>${var.QUERY_TIME}</td>
											<td class='center'>${var.QUERY_VERSION}</td>
											<td class='center'>${var.APPLICATION_TIME}</td>
											<td class='center'>${var.CHECK_TIME}</td>
											<td class='center' hidden>${var.USER_SYS_ID}</td>
											<td class='center' hidden>${var.STATUS}</td>
											<td class="center">
												<div class="hidden-sm hidden-xs action-buttons">
													<a>
													<i class="menu-icon fa fa-book icon-shape7se" title="重写" onclick="submitApply('${var.ID}','${var.USER_SYS_ID}','${var.REPORT_ID}','${var.NAME}')"></i>
												   	</a>
												</div> 	
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;text-align: center;"><div class="pagination" style="padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		dict.init({ids:['CREDENTIALS_TYPE']});
		dict.init({ids:['simple-table'],buildType:'grid'});
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
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

		//查看征信报告
		function submitApply(ID,USER_SYS_ID,REPORT_ID,NAME){
			top.jzts();
				var USERID=$("#user_id").val();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>test/goEdit.do',
						data: {ID:ID,USER_SYS_ID:USER_SYS_ID,REPORT_ID:REPORT_ID,NAME:NAME},
						dataType:'json',
						cache: false,
						success: function(data){
							$(top.hangge());
							 if("success" != data.result){
								alert('success');
							 }
							 else{
									alert('faile');
								 }
						}
				   });
			
	    }
		function add(){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>test/enquiry.do',
				dataType:'json',
				cache: false,
				success: function(data){
					$(top.hangge());
					 if("success" != data.result){
						alert('success');
					 }
					 else{
							alert('faile');
						 }
				}
		   });
			
	    }
		function cip(){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>test/add.do',
				dataType:'json',
				cache: false,
				success: function(data){
					$(top.hangge());
					 if("success" != data.result){
						alert('success');
					 }
					 else{
							alert('faile');
						 }
				}
		   });
			
	    }
		<%-- function cip(){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>cip/cip.do',
				dataType:'json',
				cache: false,
				success: function(data){
					$(top.hangge());
					 if("success" != data.result){
						alert('success');
					 }
					 else{
							alert('faile');
						 }
				}
		   });
			
	    } --%>
	</script>


</body>
</html>