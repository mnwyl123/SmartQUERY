<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String bankCode = request.getParameter("bankCode");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
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
					<div class="col-xs-12" style="padding:0;">
					<form action="createReport/resultReadQueryList.do?menuId=43" name="Form" id="Form" method="post">
						<div style="width:100%;overflow-x:scroll;">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left">
									<div class="float-l margin2-5">
										<span>用户登录名:</span>
										<input type="text" style="width:140px" name="USER_CODE" id="USER_CODE" placeholder="请输入用户登录名" />
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l date-icon">
										<span>反馈日期:</span>
										<input class="span10 date-picker" name="RESPONSE_TIME" id="RESPONSE_TIME" type="text" data-date-format="yyyymmdd" readonly="readonly" style="width:140px;" placeholder="反馈日期" />										
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l btn-group">
									   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
							</tr>
						</table>
						<table id="table_report" class="table table-striped table-bordered table-hover" style="width:100%;table-layout:fixed">
							<thead>
								<tr>
									<th class="center" style="width: 100px;">序号</th>
									<th class="center">用户登录名</th>
									<th class="center">反馈时间</th>
									<th class="center">报文总数</th>
									<th class="center">错误信息编码</th>
									<th class="center">错误信息内容</th>
								</tr>
							</thead>					
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty queryResult}">
									<c:forEach items="${queryResult}" var="dsl" varStatus="vs">											
										<tr>
											<td class='center' style="width: 100px;">${vs.index+1}</td>
											<td class="center">${dsl.USERCODE }</td>
											<td class="center">${dsl.RESPONSE_TIME }</td>
											<td class="center">${dsl.TOTAL_NUM}</td>
											<td class="center">${dsl.ERROR_CODE}</td>
											<td class="center">${dsl.ERROR_MSG}</td>
										</tr>
									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="6" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						</div>
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
</div>
<!-- /.main-container -->
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp"%>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<!-- 没有选中时的提示框 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<script type="text/javascript">
	$(top.hangge());
	
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
	
	//检索
	function goSearch(){
		top.jzts();
		$("#Form").submit();
	}
</script>
</body>
</html>