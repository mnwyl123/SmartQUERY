﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	#tab tr td{
		width:120px;
	}
	#tab{
		border-collapse:separate;
		border-spacing:0px 10px;
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
							
						<!-- 检索  -->
						<form action="entObjectRemark/listObjDelete.do?menuId=98" method="post" name="Form" id="Form">
						<table class="" id="tab">
							<tr>
								<td align="right">
									发起用户名称:
								</td>
								<td>
									<input id="NAME" type="text" value="${pd.NAME}" name="NAME" placeholder="发起用户名称" />
								</td>
								<td align="right">
									企业名称:
								</td>
								<td>
									<input id="ENTNAME" type="text" value="${pd.ENTNAME}" name="ENTNAME" placeholder="企业名称" />
								</td>
								<td align="right">
									企业身份类型:
								</td>
								<td >
										<select  dict-name="EntIDType" default-value="${pd.ENTIDTYPE}" name="ENTIDTYPE" id="ENTIDTYPE" style="width:163px" >  
										   <option value="">-请选择企业身份标识类型-</option>
										</select>
								</td>
								<td align="right">
									企业身份号码:
								</td>
								<td >
										<input id="ENTIDNUM" type="text" value="${pd.ENTIDNUM}" name="ENTIDNUM" placeholder="企业身份标识号码" />
								</td>
							</tr>
							<tr>
								<td align="right">
									异议说明:
								</td>
								<td>
									<input id="OBJDESC" type="text" value="${pd.OBJDESC}" name="OBJDESC" placeholder="异议说明" />
								</td>
								<td align="right">
									 业务回执码:
								</td>
								<td>
									<input id="SERVICERETURNCODE" type="text" value="${pd.SERVICERETURNCODE}" name="SERVICERETURNCODE" placeholder="业务回执码" />
								</td>
								<td align="right">
									处理结果描述:
								</td>
								<td>
									<input id="DEL_RESULTDESC" type="text" value="${pd.DEL_RESULTDESC}" name="DEL_RESULTDESC" placeholder="处理结果描述" />
								</td>
								<td>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
							</tr>
						</table>
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class="center">发起用户名称</th>
								    <th class="center">企业名称</th>
									<th class="center" dict-name="EntIDType">企业身份标识类型</th>
									<th class="center">企业身份标识号码</th>
									<th class="center" >定位信息类别</th>
								    <th class="center">异议说明</th>
									<th class="center">业务回执代码</th>
									<th class="center">处理结果描述</th>
								</tr> 
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>${vs.index+1}</td>
											<td class='center'>${var.NAME}</td>
											<td class='center'>${var.ENTNAME}</td>
											<td class='center'>${var.ENTIDTYPE}</td>
											<td class='center'>${var.ENTIDNUM}</td>
											<td class='center' style="max-width:150px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${var.LOCATEINFTYPE}">${var.LOCATEINFTYPE}</td>
											<td class='center'>${var.OBJDESC}</td>
											<td class='center'>${var.SERVICERETURNCODE}</td>
											<td class='center'>${var.DEL_RESULTDESC}</td>
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
		dict.init({ids:['ENTIDTYPE']});
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
		
		function writeResult(ID){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="处理结果填写";
			 diag.URL = '<%=basePath%>distributeObjOrg/objResultAtt.do?ID='+ID;
			 diag.Width = 500;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
	</script>


</body>
</html>