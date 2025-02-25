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
<%@ include file="../index/top.jsp"%>
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
						<form action="operation/list.do" method="post" name="userForm" id="logForm">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70 searchM">
								 <c:if test="${QX.query == 1 }">
									<div class="nav-search float-l">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="搜 索..." />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
									<div style="margin-right: -28px;" class="float-l date-icon">
										<input class="span10 date-picker " name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:108px;" placeholder="起始日期" />
										<i class="iconfont icon-date"></i>
									</div>
									<div style="margin-right: -28px;" class="float-l date-icon">
										<input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:108px;" placeholder="终止日期" />
										<i class="iconfont icon-date"></i>
									</div>
									<div class="float-l btn-group">
										<a class="btn btn-mini btn-blue1 paddingt-5"  style="width: 31px;height: 31px" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									<div class="float-l btn-group">
										<a class="btn btn-grey1 btn-mini" onclick="resets();"  title="重置"><i class="iconfont icon-zhongzhi"></i></a>
									</div>
								   </c:if>
								</td>
								<td class="align-right width-30" >
									<c:if test="${QX.downLoad == 1 }">
									<div class="btn-group">
										<a class="btn btn-green1 btn-mini" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="iconfont icon-xiazai" style="font-size:18px;"></i></a>
									</div>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class="center">用户名</th>
									<th class="center">用户ID</th>
									<th class="center">机构</th>
									<th class="center">IP</th>
									<th class="center">MAC</th>
									<th class="center">访问URL</th>
									<th class="center">操作时间</th>
									<th class="center">具体操作描述</th>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
								<c:if test="${QX.query == 1 }">
									<c:forEach items="${varList}" var="log" varStatus="vs">	
										<tr>
											<td class='center'>${vs.index+1}</td>
											<td class="center">${log.USERNAME }</td>
											<td class="center">${log.NAME }</td>
											<td class="center">${log.ORG }</td>
											<td class="center">${log.IP }</td>
											<td class="center">${log.MAC }</td>
											<td class="center">${log.OPERATION_URL}</td>
											<td class="center">${log.OPERATION_TIME}</td>
											<td class="center">${log.OPERATION_DESC}</td>
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
	<%@ include file="../index/foot.jsp"%>
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
function searchs(){
	top.jzts();
	$("#logForm").submit();
}
//重置
function resets(){
	$("#nav-search-input").val("");
	$("#lastLoginStart").val("");
	$("#lastLoginEnd").val("");
	//$("#logForm")[0].reset();
}



$(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});	
});

//导出excel
function toExcel(){
	var keywords = $("#nav-search-input").val();
	var lastLoginStart = $("#lastLoginStart").val();
	var lastLoginEnd = $("#lastLoginEnd").val();
	window.location.href='<%=basePath%>operation/excel.do?keywords='+keywords+'&lastLoginStart='+lastLoginStart+'&lastLoginEnd='+lastLoginEnd;
}
		
</script>
</html>
