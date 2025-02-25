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
					<form action="ImportInfoInquiry/readExcel.do" enctype="multipart/form-data">
					<div id="zhongxin">
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
								    <th class="center" >本机构业务管理机构代码</th>
									<th class="center" >借款人姓名</th>		
									<th class="center" >证件类型</th>							
								    <th class="center" >证件号码</th>
								    <th class="center" >信息代码</th>
								    <th class="center" >提示信息生成时间</th>						
								</tr>
							</thead>
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
							<c:when test="${not empty varList}">
								
										<c:forEach items="${varList}" var="var" varStatus="vs">	
											<tr>
											   <td class="center">${var.org_code}</td>
											   <td class="center">${var.name}</td>
											   <td class="center">${var.card_type}</td>
											   <td class="center">${var.card_no}</td>
											   <td class="center">${var.info_no}</td>
											   <td class="center">${var.create_time}</td>
									
								 </tr>
								</c:forEach>
								</c:when>
							</c:choose>
							</tbody>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
	$(top.hangge());
	</script>
	</body>
</html>
