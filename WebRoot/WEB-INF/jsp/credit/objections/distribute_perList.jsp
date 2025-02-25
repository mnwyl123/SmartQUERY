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
    .minwidth100{
		min-width:90px;
	}
	#show{
		overflow-x:auto;
	}
	.modal-content {
		height:auto !important;
	}
	.modal-body {
		height:auto !important;
	}
	.btn {
		border-radius:4px;
	}
	textarea{
		height:216px;
		width:436px;
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
						<form action="distributeObjOrg/perList.do" method="post" name="Form" id="Form">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70">
									<div class="nav-search float-l margin2-5">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
									<div class="float-l margin2-5">
									    <input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/>
									</div>
									<div class="float-l margin2-5">
										<input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/>
									</div>
								</td>
								<td class="align-right width-30">
									<c:if test="${QX.add == 1 }">
									<div class="btn-group" >
									<a class="btn btn-orange btn-mini" onclick="add();"><i class="iconfont icon-tianjia"></i></a>
									</div>
									</c:if>
									<c:if test="${QX.delete == 1 }">
									<div class="btn-group" >
									<a class="btn btn-mini btn-orange" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class="iconfont icon-shape7"></i></a>
									</div>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<div id="show">
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width35">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center">序号</th>
									<th class="center minwidth100">操作</th>
									<th class="center minwidth100">用户名</th>
									<th class="center minwidth100">企业名称</th>
									<th class="center minwidth100">企业身份标识类型</th>
									<th class="center minwidth100">企业身份标识号码</th>
									<th class="center minwidth100">业务标识号</th>
									<th class="center minwidth100">定位信息个数</th>
									<th class="center minwidth100">定位信息类别</th>
									<th class="center minwidth100">数据发生机构代码</th>
									<th class="center minwidth100">异议说明</th>
									<th class="center minwidth100">业务回执代码</th>
									<th class="center minwidth100">报告类型</th>
									<th class="center minwidth100">数据提供机构代码</th>
									<th class="center minwidth100">发起机构代码</th>
									<th class="center minwidth100">发起用户代码</th>
									<th class="center minwidth100">开始日期</th>
									<th class="center minwidth100">结束日期</th>
									<th class="center minwidth100">异议事项号</th>
									<th class="center minwidth100">有效联系电话</th>
									<th class="center minwidth100">异议事项流水号</th>
									<th class="center minwidth100">核查结果</th>
									<th class="center minwidth100">异议核查结果描述</th>
									<th class="center minwidth100">异议更正结果</th>
									<th class="center minwidth100">附件信息</th>
									<th class="center minwidth100">异议更正结果描述</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty perList}">
									<c:forEach items="${perList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel">
													<input type='checkbox' name='ids' value="" class="ace" /><!-- 此处的value值可根据实际情况设置为表主键,并取掉下面主键列-->
													<span class="lbl"></span>
												</label>
											</td>
											<td class='center'>${vs.index+1}</td>
											<td class="center" >
												<a  title="填写处理结果" onclick="writeResult('${var.ID}');"><!-- 此处的edit传入值可根据实际情况设置为表主键-->
													<i class="iconfont icon-bianji red1" title="填写处理结果"></i>
												</a>
											</td>
											<td class='center'>${var.USERNAME}</td>
											<td class='center'>${var.ENTNAME}</td>
											<td class='center'>${var.ENTIDTYPE}</td>
											<td class='center'>${var.ENTIDNUM}</td>
											<td class='center'>${var.BUSINESSCODE}</td>
											<td class='center'>${var.LOCATEINFNM}</td>
											<td class='center'>${var.LOCATEINFTYPE}</td>
											<td class='center'>${var.DATAOCCURORGCODE}</td>
											<td class='center'>${var.OBJDESC}</td>
											<td class='center'>${var.SERVICERETURNCODE}</td>
											<td class='center'>${var.REPORT_TYPE}</td>
											<td class='center'>${var.DATAPROVIDERORGCODE}</td>
											<td class='center'>${var.ORIGINATEORGCODE}</td>
											<td class='center'>${var.ORIGINATEUSERCODE}</td>
											<td class='center'>${var.BEGINDATE}</td>
											<td class='center'>${var.ENDDATE}</td>
											<td class='center'>${var.OBJCHECKID}</td>
											<td class='center'>${var.PHONENUM}</td>
											<td class='center'>${var.OBJCHECKNUM}</td>
											<td class='center'>${var.CHECKRESULT}</td>
											<td class='center'>${var.CHECKRESULTDESC}</td>
											<td class='center'>${var.CORRECTRESULT}</td>
											<td class='center'>${var.ENCLOSUREINF}</td>
											<td class='center'>${var.CORRECTDESC}</td>
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
						</div>
						<div class="page-header position-relative">
						<table class="width-100">
							<tr>
								<!--<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-sm btn-success" onclick="add();">新增</a>
									</c:if>
									<c:if test="${QX.del == 1 }">
									<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
									</c:if>
								</td> -->
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
	</div>
		<!-- 处理结果填写 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							处理结果填写
						</h4>
					</div>
					<div class="modal-body" >
						<form action="distributeObjOrg/objHandler.do" method="post" id="attForm" enctype="multipart/form-data">
							<input type="hidden" id="ID" name="ID" />
							<table id="resultTab">		
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="save()">保存</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
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
	<script src="static/ace/js/bootstrap.min.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
			//模太框
			$(".btn").click(function () {
				$("#myModal").modal({
					backdrop: false, // 相当于data-backdrop
					keyboard: false, // 相当于data-keyboard
					show: true, // 相当于data-show
					remote: "" // 相当于a标签作为触发器的href
				});
			});
			
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

		//保存
		function save(){
			$("#attForm").ajaxSubmit({
				success: function(data){
					alert(data.msg);
				}
			});
		}
		
		
		function upload(){
			var index = $("input[type='file']").length;
			$("#addFileDiv").append('<input type="file" name="multiUploadFiles"/>');
		}
	</script>


</body>
</html>