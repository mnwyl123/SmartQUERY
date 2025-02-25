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
							
						<!-- 检索  -->
						<form action="EnterReportInquiry/list.do?menuId=39" method="post" name="Form" id="Form">
						<input id="user_id" hidden type="text" name="USERID" value="${pd.USERID}" placeholder="当前登录的用户ID"/>
			            <table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70">
									<c:if test="${QX.query == 1 }">
									</div>
									<div class="float-l margin2-5">	
										<input id="COMPANY_NAME" type="text" name="COMPANY_NAME" value="${pd.COMPANY_NAME}" placeholder="客户名称" />
									</div>
									<div class="float-l margin2-5">	
									    <span>&nbsp;证件号类型:&nbsp;<span>
										<select  dict-name="CRED_TYPE_COM" default-value="${pd.CREDENTIALS_NO_TYPE}" name="CREDENTIALS_NO_TYPE" id="CREDENTIALS_NO_TYPE" style="width: 120px;">  
											<option value="">-请选择-</option>
										</select>
									</div>
									<div class="float-l margin2-5">	
										<input id="CHINA_CREDIT_CODE" type="text" name="CHINA_CREDIT_CODE" value="${pd.CHINA_CREDIT_CODE}" placeholder="企业证件号码"/>
									</div>
									<div class="float-l margin2-5">	
									    <span>征信报告日期:</span>
										<input type="text"  class="span10 date-picker" data-date-format="yyyy-mm-dd" name="QUERY_TIME" id="QUERY_TIME" value="${pd.QUERY_TIME}" title="征信报告日期"/>
									</div>
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width50" hidden>查询编号</th>
									<th class="center">客户姓名</th>
									<th class="center" dict-name="CRED_TYPE_COM">证件号类型</th>
									<th class="center">企业证件号码</th>
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
								<c:if test="${QX.query == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center' hidden>${var.ID}</td>
											<td class='center'>${var.COMPANY_NAME}</td>
											<td class='center'>${var.CREDENTIALS_NO_TYPE}</td>
											<td class='center'>${var.CHINA_CREDIT_CODE}</td>
											<td class='center'>${var.QUERY_TIME}</td>
											<td class='center'>${var.QUERY_VERSION}</td>
											<td class='center'>${var.APPLICATION_TIME}</td>
											<td class='center'>${var.CHECK_TIME}</td>
											<td class='center' hidden>${var.USER_SYS_ID}</td>
											<td class='center' hidden>${var.STATUS}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.delete != 1 }">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs action-buttons">
												<c:if test="${QX.edit == 1 }">
													<a>
													<i class="menu-icon fa fa-book icon-shape7se" title="查看征信报告"  onclick="submitApply('${var.ID}','${var.USER_SYS_ID}','${var.STATUS}');"></i>
												   	</a>
											   	</c:if>
												</div> 	
											</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.query != 1 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
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
		dict.init({ids:['CREDENTIALS_NO_TYPE']});
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
		function submitApply(ID,USER_SYS_ID,STATUS){
			if(STATUS=="05"){
				bootbox.dialog({
					message: "<span class='bigger-110'>系统中查无此人!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
			}else{
			    	var USERID=$("#user_id").val();
			    	var IS_COM="true";//是否是企业报文
			        //if(USERID==USER_SYS_ID){
					   $.ajax({
							type: "POST",
							url: '<%=basePath%>PersonReportInquiry/goEdit.do',
							data: {ID:ID,IS_COM:IS_COM},
							dataType:'json',
							cache: false,
							success: function(data){
								 if("success" != data.result){
									//window.location.href="/file/SGC/"+data.filePath;
									window.location.href=data.filePath;
									return false;	
								 }
							}
						});
//					}else{ 
//						top.jzts();
//						var diag = new top.Dialog();
//						diag.Drag=true;
//						diag.Title ="查询申请";
//						diag.URL = '<%=basePath%>CompanyInquiry/goEdit.do?ID='+ID;
//						diag.Width = 510;
//						diag.Height = 640;
//						diag.CancelEvent = function(){ //关闭事件
//							 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
//								nextPage(${page.currentPage});
//							}
//							diag.close();
//						};
//						diag.show();
//					}
				}
		
	    }
	</script>


</body>
</html>