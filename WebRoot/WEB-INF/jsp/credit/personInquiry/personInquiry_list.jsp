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
<link rel="stylesheet" type="text/css" href="static/iconfont/iconfont.css">
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
						<form action="CreditInquiry/list.do?menuId=26" method="post" name="Form" id="Form">
			            <table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70">
									<c:if test="${QX.query == 1 }">
									</div>
									<div class="float-l margin2-5">	
									<span>客户名称:<span>
										<input id="CLIENT_NAME" type="text" name="CLIENT_NAME" value="${pd.CLIENT_NAME}" placeholder="客户名称" />
									</div>
									<div class="float-l margin2-5">
									    <span>证件类型:<span>
										<select class="" name="CREDENTIALS_TYPE" dict-name="CRED_TYPE_PER" default-value="${pd.CREDENTIALS_TYPE}" id="CREDENTIALS_TYPE" data-placeholder="证件类型" style="width: 120px;">
										    <option value="">-请选择-</option>
								  		</select>
									</div>
									<div class="float-l margin2-5">	
									<span>证件号码:<span>
										<input id="CREDENTIALS_NUM" type="text" name="CREDENTIALS_NO" value="${pd.CREDENTIALS_NO}" placeholder="证件号码"/>
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
									<div class="btn-group" >
									<a class="btn btn-mini btn-orange" onclick="makeAll('确定要提交选中的数据吗?');" title="批量提交" ><i class="iconfont icon-duihao" style="font-size: 18px !important;"></i></a>
									</div>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width35">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center width50" hidden>查询编号</th>
									<!-- <th class="center">产品名称</th> -->
									<th class="center">客户姓名</th>
									<th class="center" dict-name="CRED_TYPE_PER">证件类型</th>
									<th class="center">证件号码</th>
									<th class="center">授权书到期日</th>
								    <th class="center" dict-name="find_reason_per">查询原因</th>
									<th class="center" dict-name="FIND_VERSION">查询版本</th>
									<th class="center" dict-name="FIND_TYPE">查询类型</th>
									<th class="center" dict-name="checkStatus">查询状态</th>
									<th class="center">审核不通过原因</th>
									<th class="center">征信报告日期</th>
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
										    <c:if test="${var.STATUS!='00'&& var.STATUS!='03'}">
												<td class='center'>
													<label class="pos-rel">
														<input type='checkbox' name='ids' disabled value="${var.ID}" class="ace" />
														<span class="lbl"></span>
													</label>
												</td>
											</c:if>
											<c:if test="${var.STATUS=='00'|| var.STATUS=='03'}">
												<td class='center'>
													<label class="pos-rel">
														<input type='checkbox' name='ids' value="${var.ID}" class="ace" />
														<span class="lbl"></span>
													</label>
												</td>
											</c:if>
											<td class='center' hidden>${var.ID}</td>
											<!-- <td class='center'>${var.PRODUCT_NAME}</td> -->
											<td class='center'>${var.CLIENT_NAME}</td>
											<td class='center'>${var.CREDENTIALS_TYPE}</td>
											<td class='center'>${var.CREDENTIALS_NO}</td>
											<td class='center'>${var.WARRANT_MATURITY_DATE}</td>
											<td class='center'>${var.QUERY_REASON}</td>
											<td class='center'>${var.QUERY_VERSION}</td>
											<td class='center'>${var.QUERY_TYPE}</td>
											<td class='center'>${var.STATUS}</td>
											<td class='center'>${var.CHECK_REJECT_RESON}</td>
											<td class='center'>${var.QUERY_TIME}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.delete != 1 }">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
												<!--<div class="hidden-sm hidden-xs action-buttons">-->
												<c:if test="${var.STATUS=='00'|| var.STATUS=='03'}">
													<c:if test="${QX.edit == 1 }">
														<i class="iconfont icon-bianji red1 marginLR-10" title="修改"  onclick="edit('${var.ID}');"></i>
													</c:if>
													<c:if test="${QX.delete == 1 }">
														<i class="iconfont icon-shape7 green2" title="删除"  onclick="deleteU('${var.ID}');"></i>
													</c:if>
														<i class="iconfont icon-duihao red1 marginLR-10" title="提交"  onclick="submitApply('${var.ID}');" style="font-size:20px !important;"></i>
												</c:if>
												<c:if test="${var.STATUS=='04'||var.STATUS=='07'||var.STATUS=='08'||var.STATUS=='09'}">
													<i class="iconfont1 icon-iconfontdanquxunhuan green1 marginLR-10" title="重新查询"  onclick="AgainApply('${var.ID}');" style="font-size:20px !important;"></i>
													<i class="iconfont icon-duihao red1 marginLR-10" title="丢弃"  onclick="goDelete('${var.ID}');" style="font-size:20px !important;"></i>
												</c:if>
												<c:if test="${var.STATUS!='00'&& var.STATUS!='03'&& var.STATUS!='04'&& var.STATUS!='07'&& var.STATUS!='08'&& var.STATUS!='09'}">
													<c:if test="${QX.edit == 1 }">
														<i class="iconfont icon-bianji marginLR-10" style="color:rgba(0, 0, 0, 0.42)" title="修改"></i>
													</c:if>
													<c:if test="${QX.delete == 1 }">
														<i class="iconfont icon-shape7 green2" title="删除"  style="color:rgba(0, 0, 0, 0.42)"></i>
													</c:if>
														<i class="iconfont icon-duihao red1 marginLR-10" title="提交" style="color:rgba(0, 0, 0, 0.42);font-size: 20px !important;"></i>
													</div> 
												</c:if>
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
		$(top.hangge());//关闭加载状态CRED_TYPE_PER
		dict.init({ids:['CREDENTIALS_TYPE']});
		dict.init({ids:['CRED_TYPE_PER']});
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
		
		//新增
		function add(){
			if(${pd.ORG_ID==""} ){
			 		bootbox.dialog({
					message: "<span class='bigger-110'>您没有所属机构，无法进行此操作，请联系管理员！</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				return;
			 }
		/* 	if(${queryTime=="1"} ){
		 		bootbox.dialog({
				message: "<span class='bigger-110'>用户已达到本月查询上线，无法新增查询，请联系管理员！</span>",
				buttons: 			
				{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
			});
			return;
		 } */
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>CreditInquiry/goAdd.do';
			 diag.Width = 510;
			 diag.Height = 640;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage('${page.currentPage}');
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		//修改
		function edit(ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改";
			 diag.URL = '<%=basePath%>CreditInquiry/goRevise.do?ID='+ID;
			 diag.Width = 510;
			 diag.Height = 640;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage('${page.currentPage}');
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		//删除
		function deleteU(ID){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>CreditInquiry/delete.do?ID="+ID;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				};
			});
		}
		//提交查询申请
		function submitApply(ID){
			bootbox.confirm("提交之后不可更改，确定要提交吗?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>CreditInquiry/goSubmit.do?ID='+ID,
						data: {DATA_IDS:""},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							nextPage(${page.currentPage});
						}
					});
				};
			});
		}
		//重新查询
		function AgainApply(ID){
			top.jzts();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>CreditInquiry/goApplyAgain.do?ID='+ID,
				data: {DATA_IDS:""},
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					nextPage(${page.currentPage});
				}
			});
		}
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
							if(str=='') str += document.getElementsByName('ids')[i].value;
							else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:3,
							msg:'点这里全选',
							bg:'#AE81FF',
							time:8
						});
						
						return;
					}else{
						if(msg == '确定要提交选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>CreditInquiry/goSubmitBatch.do?tm='+new Date().getTime(),
								data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									nextPage(${page.currentPage});
								}
							});
						}
					}
				}
			});
		}
		
		//提交丢弃数据
		function goDelete(ID){
			bootbox.confirm("确定丢弃本条数据?", function(result) {
				if(result) {
					top.jzts();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>CreditInquiry/goDelete.do?ID='+ID+'&STATUS=12',
						data: {DATA_IDS:""},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							nextPage(${page.currentPage});
						}
					});
				};
			});
		}
	</script>
</body>
</html>