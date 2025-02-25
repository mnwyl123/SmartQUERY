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
						<form action="exceptionParam/paramlist.do?menuId=${pd.menuId}" method="post" name="Form" id="Form">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70">
									<div class="float-l margin2-5">
										<select class="chosen-select form-control" name="ORG_ID" id="ORG_ID" data-placeholder="请选择机构" style="width: 180px;">
											<option value=""></option>
											<c:forEach items="${orgList}" var="org">
												<option value="${org.ORG_ID }"> ${org.NAME}</option>
											</c:forEach>
										</select>
									</div>
									<div class="float-l btn-group">
									   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
								
								<td class="align-right width-30">
									<c:if test="${QX.add == 1 }">
									<div class="btn-group" >
									<a class="btn btn-orange btn-mini" onclick="add();" title="添加参数"><i class="iconfont icon-tianjia"></i></a>
									</div>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">机构名称</th>
									<th class="center">个人失败占比上限(%)</th>
									<th class="center">企业失败占比上限(%)</th>
									<th class="center">短时间内对同一客户查询次数上限</th>
									<th class="center">短时间内对相同客户查询时间(h)</th>
									<th class="center width-10">操作</th>
								</tr>
							</thead>
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty paramList}">
									<c:if test="${QX.query == 1 }">
										<c:forEach items="${paramList}" var="var" varStatus="vs">	
											<tr>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td class="center">${var.ORG_NAME }</td>
												<td class="center">${var.FAIL_ZBSX_PER }</td>
												<td class="center">${var.FAIL_ZBSX_ORG }</td>
												<td class="center">${var.OTHER_REASON_ZBSX }</td>
												<td class="center">${var.CROSS_REGION_ZBSX }</td>
												<td class="center">
													<a  href="javascript:edit('${var.ORG_ID}');">
														<i class="iconfont icon-bianji red1 " title="修改" ></i>
													</a>
													&nbsp;&nbsp;&nbsp;
													<a  href="javascript:del('${var.ORG_ID}');">
														<i class="iconfont icon-shape7 green2 " title="删除" ></i>
													</a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${QX.query != 1 }">
										<tr>
											<td colspan="7" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="7" class="center">没有相关数据</td>
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

	//新增
	function add(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>exceptionParam/goSaveP.do';
		 diag.Width = 500;
		 diag.Height = 300;
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
	function edit(ORG_ID){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="资料";
		 diag.URL = "<%=basePath%>exceptionParam/goUpdateP.do?ORG_ID="+ORG_ID;
		 diag.Width = 469;
		 diag.Height = 300;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				nextPage(${page.currentPage});
			}
			diag.close();
		 };
		 diag.show();
	}
	//删除
	function del(ORG_ID){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="资料";
		 diag.URL = "<%=basePath%>exceptionParam/deleteP.do?ORG_ID="+ORG_ID;
		 diag.Width = 469;
		 diag.Height = 300;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				nextPage(${page.currentPage});
			}
			diag.close();
		 };
		 diag.show();
	}
</script>
</html>
