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
						<form action="dictmtance/list.do" method="post" name="Form" id="Form">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70 searchM">
								<c:if test="${QX.query == 1 }">
									<div class="nav-search float-l">
										<span class="input-icon">
											<input type="text" placeholder="搜&nbsp;索..." class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>			
									<div class="btn-group float-l">
									   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if> 
								</td>
								<td class="align-right width-30">
									<c:if test="${QX.add == 1 }">
									<div class="btn-group" >
									<a class="btn btn-mini btn-orange" onclick="add();"><i class="iconfont icon-tianjia" title="新增"></i></a>
									</div>
									</c:if>
									<c:if test="${QX.batchDelete == 1 }">
									<div class="btn-group" >
									<a class="btn btn-mini btn-orange" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class="iconfont icon-shape7"></i></a>
									</div>
									</c:if>
									<c:if test="${QX.refresh == 1 }">
									<div class="btn-group" >
									<a class="btn btn-mini btn-orange" onclick="pushCacheAll('确定要刷新字典缓存吗?');" title="缓存字典刷新" ><i class="iconfont icon-iconfontshuaxin"></i></a>
									</div>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<div style="width:100%;overflow-x:scroll;">	
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="table-layout:fixed">	
							<thead>
								<tr>
									<th class="center width35">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" width="120px">编码</th>
									<th class="center" width="150px">名称</th>
									<!--  <th class="center">类型</th>-->
									<th class="center" width="350px">来源表</th>
									<th class="center" width="180px">过滤条件列</th>
									<!-- <th class="center" width="350px">过滤条件列取值</th> -->
									<th class="center" width="180px">取值列</th>
									<th class="center" width="180px">取值名称</th>
									<!-- <th class="center" width="100px">备注</th> -->
									<!-- <th class="center" width="100px">排序字段</th> -->
									<!--<th class="center">是否动态获取</th>-->
									<th class="center" width="80px">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.query == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr >
											<td class='center'>
												<label class="pos-rel">
													<input type='checkbox' name='ids' value="${var.DIC_CODE}" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td class='center'>${var.DIC_CODE}</td>
											<td class='center'>${var.DIC_DES}</td>
											<!--<td class='center'>${var.DIC_TYPE}</td>-->
											<td class='center'>${var.DIC_TBLNAME}</td>
											<td class='center'>${var.DIC_ID_COLNAME}</td>
											<!-- <td class='center'>${var.DIC_IDVALUE}</td> -->
											<td class='center'>${var.DIC_VAL_COLNAME}</td>
											<td class='center'>${var.DIC_DES_COLNAME}</td>
											<!-- <td class='center'>${var.REMARK}</td> -->
											<!-- <td class='center'>${var.DIC_SORT_COLNAME}</td> -->
											<!--<td class='center'>${var.DIC_DYNAMIC_SIGN}</td>-->
											<td class="center" style="width: 6%;">
												<c:if test="${QX.edit != 1 && QX.delete != 1 }">
												<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs action-buttons">
													<c:if test="${QX.edit == 1 }">
													<a  title="编辑" onclick="edit('${var.DIC_CODE}');"><!-- 此处的edit传入值可根据实际情况设置为表主键-->
														<i class="iconfont icon-bianji red1"   title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.delete == 1 }">
													<a  onclick="del('${var.DIC_CODE}');"><!-- 此处的del传入值可根据实际情况设置为表主键-->
														<i class="iconfont icon-shape7 green2 "   title="删除"></i>
													</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a  onclick="edit('${var.DIC_CODE}');" class="tooltip-success" data-rel="tooltip" title="修改"><!-- 此处的edit传入值可根据实际情况设置为表主键-->
																	<span class="green">
																		<i class="iconfont icon-bianji red1 bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.delete == 1 }">
															<li>
																<a  onclick="del('${var.DIC_CODE}');" class="tooltip-error" data-rel="tooltip" title="删除"><!-- 此处的del传入值可根据实际情况设置为表主键-->
																	<span class="red">
																		<i class="iconfont icon-shape7 green2 bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
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
						</div>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
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
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>dictmtance/goAdd.do';
			 diag.Width = 500;
			 diag.Height = 450;
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
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>dictmtance/delete.do?DIC_CODE="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>dictmtance/goEdit.do?DIC_CODE='+Id;
			 diag.Width = 500;
			 diag.Height = 350;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		function pushCacheAll(msg){
			bootbox.confirm("确定要刷新字典缓存吗?", function(result) {
				if(result) {
					$.ajax({
						type: "POST",
						url: '<%=basePath%>/cache/putCache.do?tm='+new Date().getTime(),
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							bootbox.dialog({
								message: "<span class='bigger-110'>刷新成功!</span>",
								buttons: 			
								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							});
							top.hangge();
						}
					});
				}
				
			});
			
		}
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
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
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>dictmtance/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>dictmtance/excel.do';
		}
	</script>


</body>
</html>