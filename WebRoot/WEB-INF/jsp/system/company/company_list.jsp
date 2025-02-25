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
						<form action="company/listCompany.do" method="post" name="companyForm" id="companyForm">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left width-50">
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" id="keywords" value="${pd.keywords }" placeholder="搜&nbsp;索..." />
										<i class="ace-iconR fa fa-search nav-search-icon" onclick="searchs();"></i>
									</span>
									</div>
								</td>
								<!-- <td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td> -->
								<td class="align-right width-50" >
								     <div class="btn-group">
										<a class="btn btn-mini btn-orange" onclick="add();">
											<i class="iconfont icon-tianjia"></i>
										</a>
									</div>
									<div class="btn-group margin-10">
										<a title="批量删除" class="btn btn-mini btn-orange" onclick="makeAll('确定要删除选中的数据吗?');" >
										  <i class="iconfont icon-shape7"></i>	
										</a>
									</div>
								</td>
								     
							    <!--<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="resets();"  title="重置"><i id="nav-search-icon" class="ace-icon fa fa-reply bigger-110 nav-search-icon blue"></i></a></td>  -->
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
									<th class="center width35">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center width50">序号</th>
									<th class="center">法人代码</th>
									<th class="center">法人简称</th>
									<th class="center">法人名称</th>
									<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>法人登录账号</th>
									<th class="center">法人logo</th>
									<th class="center">状态</th>
									<th class="center width-15">操作</th>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty companyList}">
									<c:forEach items="${companyList}" var="company" varStatus="vs">	
										<tr>
											<td class='center'>
												<label><input type='checkbox' name='ids' value="${company.COMP_CODE }" class="ace"/><span class="lbl"></span></label>
											</td>
											<td class='center'>${vs.index+1}</td>
											<td class="center">${company.COMP_CODE }</td>
											<td class="center">${company.COMP_SHORT }</td>
											<td class="center">${company.COMP_NAME }</td>
											<td class="center">${company.USER_CODE}</td>
											<td class="center">${company.LOGO_PATH}</td>
											<td class="center">
												<c:if test="${company.LOCK_STATUS == 0}">无效</c:if>
												<c:if test="${company.LOCK_STATUS == 1}">正常</c:if>
												<c:if test="${company.LOCK_STATUS == 2}">睡眠户</c:if>
												<c:if test="${company.LOCK_STATUS == 3}">锁定</c:if>
											</td>
											<td class="center">
												<i class="iconfont icon-quanxianguanli green1 marginLR-10" title="解锁重置密码" onclick="unLock('${company.COMP_CODE}','${company.USER_CODE}');" ></i>
												<i class="iconfont icon-bianji red1 marginLR-10" title="编辑" onclick="editCompany('${company.COMP_CODE}');" ></i>
												<i class="iconfont icon-shape7 green2 marginLR-10"  title="删除" onclick="delCompany('${company.COMP_CODE }','${company.COMP_NAME}');"></i>
											</td>
										</tr>
									</c:forEach>
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
	$("#companyForm").submit();
}
//重置
function resets(){
	$("#companyForm")[0].reset();
}

//删除
function delCompany(compCode,msg){
	bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "<%=basePath%>company/deleteC.do?COMP_CODE="+compCode+"&tm="+new Date().getTime();
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
	 diag.URL = '<%=basePath%>company/goAddC.do';
	 diag.Width = 469;
	 diag.Height = 285;
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
function editCompany(comp_code){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改";
	 diag.URL = '<%=basePath%>company/goEditC.do?COMP_CODE='+comp_code;
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
				if(msg == '确定要删除选中的数据吗?'){
					top.jzts();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>company/deleteAllC.do?tm='+new Date().getTime(),
				    	data: {COMP_CODES:str},
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
}

//查看用户
function viewUser(USERNAME){
	if('admin' == USERNAME){
		bootbox.dialog({
			message: "<span class='bigger-110'>不能查看admin用户!</span>",
			buttons: 			
			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
		});
		return;
	}
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '<%=basePath%>user/view.do?USERNAME='+USERNAME;
	 diag.Width = 469;
	 diag.Height = 380;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//查看用户
function unLock(COMP_CODE,USER_CODE){
	bootbox.confirm("确定要重置 "+USER_CODE+" 密码吗?", function(result) {
	if(result) {
		$.ajax({
			type: "POST",
			url: '<%=basePath%>company/unLock.do',
	    	data: {COMP_CODE:COMP_CODE,USER_CODE:USER_CODE},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success"==data.result){
				 	bootbox.dialog({
						message: "<span class='bigger-110'>密码重置成功!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
				 }else{
				 	bootbox.dialog({
						message: "<span class='bigger-110'>密码重置失败!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
				 }
			}
		});
	}
	});
}
		
</script>
</html>
