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
						<!-- 检索  -->
						<form action="KeyCustMaintain/list.do?menuId=63" method="post" name="Form" id="Form">
			            <table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70">
									<c:if test="${QX.query == 1 }">
									<div class="float-l margin2-5">
									    <span>客户类型:<span>
										<select class="" name="CLIENT_TYPE" dict-name="clientType" default-value="${pd.CLIENT_TYPE}" id="CLIENT_TYPE" data-placeholder="客户类型" style="width: 120px;">
										    <option value="">-请选择-</option>
								  		</select>
									</div>
									<div class="float-l margin2-5">	
										<input id="CLIENT_NAME" type="text" name="CLIENT_NAME" value="" placeholder="客户名称" />
									</div>
									
									<div class="float-l margin2-5">	
										<input id="CREDENTIALS_NUM" type="text" name="CREDENTIALS_NO" value="" placeholder="身份证件号码/中征码"/>
									</div>
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if>
								</td>
								<td class="align-right width-30">
									<c:if test="${QX.add == 1 }">
									 <div class="btn-group" >
									<a class="btn btn-orange btn-mini" onclick="add();" title="新增查询"><i class="iconfont icon-tianjia"></i></a>
									</div>
									</c:if>
									<div class="btn-group">
									   <a class="btn btn-green1 btn-mini" onclick="fromExcel();" title="从EXCEL导入"><i style="font-size: 18px;" class="iconfont icon-msnui-cloud-upload"></i></a>
								    </div>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class="center width50" hidden>客户编码</th>
									<th class="center" dict-name="clientType">客户类型</th>
									<th class="center">客户姓名</th>
									<th class="center">证件号码/中征码</th>
									<th class="center" dict-name="OPERATION_TYPE">业务类型</th>
								    <th class="center" >录入机构</th>
									<th class="center" >录入用户</th>
									<th class="center">移入日期</th>
									<th class="center">移除日期</th>
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
											<td class='center'>${vs.index+1}</td>
											<td class='center' hidden>${var.CUST_NO}</td>	
											<td class='center'>${var.CLIENT_TYPE}</td>
											<td class='center'>${var.CLIENT_NAME}</td>
											<td class='center'>${var.CREDENTIALS_NO}</td>
											<td class='center'>${var.OPERATION_TYPE}</td>
											<td class='center'>${var.ORG_NAME}</td>
											<td class='center'>${var.USER_NAME}</td>
											<td class='center'>${var.ADD_DATE}</td>
											<td class='center'>${var.DELETE_DATE}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.delete != 1 }">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs action-buttons">
												<c:if test="${QX.edit == 1 }">
												<a  href="javascript:edit('${var.CUST_NO}');">
														<i class="iconfont icon-bianji red1 " title="编辑" ></i>
												</a>
												</c:if>
												<c:if test="${QX.delete == 1 }">
												<a>
													<i class="iconfont icon-shape7 green2 " title="删除" onclick="deleteU('${var.CUST_NO}')"></i>
												</a>
												</c:if>
												<a>
													<i class="menu-icon fa fa-book icon-shape7se" title="详情" onclick="detail('${var.CUST_NO}')"></i>
												</a>
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
		dict.init({ids:['CLIENT_TYPE']});
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
		
		        //删除
		function deleteU(CUST_NO){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>KeyCustMaintain/delete.do?CUST_NO="+CUST_NO;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				};
			});
		}
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>KeyCustMaintain/goAdd.do';
			 diag.Width = 550;
			 diag.Height = 370;
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
		function edit(CUST_NO){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = '<%=basePath%>KeyCustMaintain/goEdit.do?CUST_NO='+CUST_NO;
			 diag.Width = 550;
			 diag.Height = 470;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		//详情
		function detail(CUST_NO){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = '<%=basePath%>KeyCustMaintain/goDetail.do?CUST_NO='+CUST_NO;
			 diag.Width = 550;
			 diag.Height = 470;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		//打开上传excel页面
		function fromExcel(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="Excel导入到数据库";
			 diag.URL = '<%=basePath%>KeyCustMaintain/goUploadExcel.do';
			 diag.Width = 550;
			 diag.Height = 350;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}	
	</script>


</body>
</html>