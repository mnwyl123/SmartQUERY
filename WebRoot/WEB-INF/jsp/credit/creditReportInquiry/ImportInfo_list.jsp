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
						<form action="ImportInfoInquiry/list.do?menuId=${pd.menuId}" method="post" name="Form" id="Form">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70">
									<c:if test="${QX.query == 1 }">
									<!-- <div class="float-l margin2-5">
											<span>文件名称:</span>
											<input type="text" style="width:180px" value="${pd.FILE_NAME}" name="FILE_NAME" id="FILE_NAME" placeholder="请输入文件名称" />
										</div>
										 -->
										<div class="float-l margin2-5">	
									        <span>日期:</span>
										    <input type="text"  class="span10 date-picker" data-date-format="yyyy-mm-dd" name="QUERY_TIME" id="QUERY_TIME" value="${pd.QUERY_TIME}" title="征信报告日期"/>
									    </div>
										&nbsp;&nbsp;&nbsp;
										<div class="float-l btn-group">
										   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
										</div>
									</c:if>
								</td>
								<td class="align-right width-30">
								<c:if test="${QX.add == 1 }">
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="importExcel();"><i class="iconfont iconfont icon-msnui-cloud-upload" title="导入"></i></a>
									</div>
									</c:if>
								</td>
						
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
								    <th class="center">编号</th>
									<th class="center">日期</th>		
									<th class="center">文件名称</th>							
								    <th class="center width-10" >操作</th>
							<!--   
								<th class="center" dict-name="IMPORT_STATUS" type="hidden">状态</th>	  -->							
								</tr>
							</thead>
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.query == 1 }">
										<c:forEach items="${varList}" var="var" varStatus="vs">	
											<tr>
											   <td class='center' style="width: 30px;">${vs.index+1}</td>
											   <td class="center">${var.M_DATE}</td>
											   <td class="center">${var.NAME}</td>
												<td class="center">
													<c:if test="${QX.download != 1 && QX.delete != 1}">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>

												   <a  href="javascript:download('${var.NAME}');">
													<i class="iconfont icon-xiazai" title="下载"></i>
												</a>
                                                   <a  href="javascript:goCheck('${var.NAME}');">
													<i class="iconfont icon-duihao green1 marginLR-10" title="详情"></i>
												</a>
												<c:if test="${QX.delete == 1 }">
												&nbsp;&nbsp;&nbsp;
												   <a  href="javascript:del('${var.NAME}');">
													<i class="iconfont icon-shape7 green2" title="删除"></i>
												</a>
												</c:if>
												</td>  
												<!-- 	<td class="center">${var.STATUS}</td>	 -->																							
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
dict.init({ids:['USER_TYPE']});
dict.init({ids:['simple-table'],buildType:'grid'});
$(top.hangge());
 
//检索
function goSearch(){
	top.jzts();
	$("#Form").submit();
}



//删除
function del(id,time){
	bootbox.confirm("确定要删除吗?", function(result) {
		if(result) {
			top.jzts();
			var url = '<%=basePath%>ImportInfoInquiry/delImportInfo.do?ID='+id;
			$.get(url,function(data){
				nextPage(${page.currentPage});
			});
		};
	});
}
//导入Excel
function importExcel(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="EXCEL导入到数据库";
	 diag.URL = '<%=basePath%>ImportInfoInquiry/goImportExcel.do';
	 diag.Width = 500;
	 diag.Height = 350;
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
//下载
function download(NAME){
      
	window.location.href='<%=basePath%>/ImportInfoInquiry/downloadnum.do?NAME='+NAME;
  
}

//查看详情
function goCheck(NAME){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="重要信息提示";
	 diag.URL = '<%=basePath%>ImportInfoInquiry/getImpCheck.do?NAME='+NAME;
	 diag.Width = 1000;
	 diag.Height = 1000;
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
</script>
</html>
