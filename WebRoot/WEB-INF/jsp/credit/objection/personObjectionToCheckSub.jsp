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
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 图标 -->
	<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
	<style>
		th{
			color:black;
			background-color:#eeeff0;
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
					<div class="col-xs-12" style="padding:0;">
					<form action="personObjection/listSubToCheck.do" method="post" name="Form" id="Form">
						<div id="zhongxin">
						<div style="width:100%;overflow-x:scroll;">
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center" style="min-width:120px">历史核查信息</th>
									<th class="center" style="min-width:100px">异议事项号</th>
									<th class="center" style="min-width:150px">异议事项流水号</th>
									<th class="center" style="min-width:130px">核查开始日期</th>
								    <th class="center" style="min-width:100px">姓名</th>
									<th class="center" style="min-width:100px">证件类型</th>
									<th class="center" style="min-width:100px">证件号码</th>
									<th class="center" style="min-width:100px">有效联系电话</th>
									<th class="center" style="min-width:100px">异议事项信息</th>
									<th class="center" style="min-width:100px">异议说明</th>
									<th class="center" style="min-width:100px">数据提供机构代码</th>
									<th class="center" style="min-width:100px">数据发生机构代码</th>
									<th class="center" style="min-width:100px">业务标识号</th>
									<th class="center" style="min-width:100px" dict-name="ywzl">业务种类</th>
									<th class="center" style="min-width:130px">核查到期日期</th>
									<th class="center" style="min-width:130px">数据发生日期</th>
									<th class="center" style="min-width:130px">数据发生金额</th>
									<th class="center" style="min-width:120px">是否存在附件</th>
								</tr> 
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class="center">
													<a  href="javascript:goSubLast('${var.OBJCHECKID}');">
														查看
													</a>
												</td>
											<td class='center'>${var.OBJCHECKID}</td>
											<td class='center'>${var.OBJCHECKNUM}</td>
											<td class='center'>${var.CHECKBEGINDATE}</td>
											<td class='center'>${var.NAME}</td>
											<td class='center'>${var.IDTYPE}</td>
											<td class='center'>${var.IDNUM}</td>
											<td class='center'>${var.PHONENUM}</td>
											<td class='center'>${var.OBJITEMINF}</td>
											<td class='center'>${var.OBJITEMDESC}</td>
											<td class='center'>${var.DATAPROVIDERORGCODE}</td>
											<td class='center'>${var.DATAOCCURORGCODE}</td>
											<td class='center'>${var.BUSINESSCODE}</td>
											<td class='center'>${var.BUSINESSTYPE}</td>
											<td class='center'>${var.CHECKFINALDATE}</td>
											<td class='center'>${var.DATAOCCURDATE}</td>
											<td class='center'>${var.DATAOCCURAMOUNT}</td>
											<td class='center'>${var.ENCLOSUREFLAG}</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
							</tbody>
						</table>
						</div>
						</div>
						
						<div class="page-header position-relative">
						<table class="width-100">
							<tr class="center">
							     <td class="center" colSpan=2>
									<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">关&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;闭</a> 
								</td>
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
		
	});
	
	//历史信息
	function goSubLast(OBJCHECKID){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="历史信息";
		 diag.URL = '<%=basePath%>personObjection/listSubLastToCheck.do?OBJCHECKID='+OBJCHECKID;
		 diag.Width = 800;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage('${page.currentPage}');
			}
			diag.close();
		 };
		 diag.show();
	}
</script>


</body>
</html>