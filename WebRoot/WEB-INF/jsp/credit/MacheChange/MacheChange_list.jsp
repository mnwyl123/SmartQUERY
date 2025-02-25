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
						<form action="macheChange/listMache.do?menuId=${pd.menuId}" method="post" name="Form" id="Form">
						<table class="margin-5 width-100">
							<tr>
								<c:if test="${QX.query == 1 }">
									<td class="align-left width-70">
										<div class="float-l margin2-5">
											<span>登录名:</span>
											<input type="text" style="width:180px" name="USERNAME" id="USERNAME" placeholder="请输入用户登录名称" />
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
									<th class="center">用户登录名</th>
									<th class="center">法人编码</th>
									<th class="center">变更前MAC</th>
									<th class="center">变更前IP</th>
									<th class="center">变更后MAC</th>
									<th class="center">变更后IP</th>
									<th class="center">变更时间</th>
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
												<td class="center">${var.USERNAME }</td>
												<td class="center">${var.COMPANY }</td>
												<td class="center">${var.OLD_MAC }</td>
												<td class="center">${var.OLD_IP}</td>
												<td class="center">${var.NEW_MAC}</td>
												<td class="center">${var.NEW_IP}</td>
												<td class="center">${var.UPDATE_TIME}</td>
												<c:if test="${var.STATUS == 0 }">
												<td class="center">待审核</td>
												</c:if>
												<c:if test="${var.STATUS == 1 }">
												<td class="center">同意</td>
												</c:if>
												<c:if test="${var.STATUS == 2 }">
												<td class="center">不同意</td>
												</c:if>
												<td class="center">
													<c:if test="${QX.check == 1 }">
														<i class="iconfont icon-duihao green1 marginLR-10" title="详情" onclick="goCheck('${var.ID}');" ></i>
													</c:if>
													<c:if test="${QX.delete == 1 }">
										  			<a  href="javascript:del('${var.ID }');">
														<i class="iconfont icon-shape7 green2 " title="删除" ></i>
													</a>
													</c:if>
													
													
													
													
													
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${QX.query != 1 }">
										<tr>
											<td colspan="10" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="10" class="center">没有相关数据</td>
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
$(top.hangge());

//检索
function goSearch(){
	top.jzts();
	$("#Form").submit();
}


//删除
function del(id){
	bootbox.confirm("确定要删除该条数据吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "<%=basePath%>macheChange/delete.do?ID="+id;
			$.get(url,function(data){
				nextPage(${page.currentPage});
			});
		};
	});
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

//审核
function goCheck(ID){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="机器变更审核";
	 diag.URL = '<%=basePath%>macheChange/goCheck.do?ID='+ID;
	 diag.Width = 450;
	 diag.Height = 500;
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
</script>
</html>
