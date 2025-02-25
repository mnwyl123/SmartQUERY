<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String bankCode = request.getParameter("bankCode");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
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
					<div class="col-xs-12" style="padding:0;">
					<form action="createReport/numReadQueryList.do?menuId=42" name="Form" id="Form" method="post">
						<div style="width:100%;overflow-x:scroll;">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left">
									<div class="float-l margin2-5">
										<span>被查询人姓名:</span>
										<input type="text" style="width:140px" name="CLIENT_NAME" id="CLIENT_NAME" placeholder="请输入被查询人姓名" />
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l margin2-5">
									    <span>证件类型:</span>
										<select style="width:140px" dict-name="CRED_TYPE_PER" name="CERTTYPE" id="CERTTYPE">
											<option value="">请选择证件类型</option>
										</select>
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l margin2-5">
										<span>证件号码:</span>
										<input type="text"style="width:140px" name="CREDENTIALS_NO" id="CREDENTIALS_NO" placeholder="请输入证件号码" />
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l margin2-5">
										<span>文件名称:</span>
										<input type="text"style="width:160px" name="RE_FILE_NAME" id="RE_FILE_NAME" value="${pd.FILENAME}" placeholder="请输入文件名称" />
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l btn-group">
									   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
								<td class="align-right width-30">
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="exportExcel();"><i class="iconfont icon-xiazai" title="导出"></i></a>
									</div>
								</td>							
							</tr>
						</table>
						<table id="table_report" class="table table-striped table-bordered table-hover" style="width:100%;table-layout:fixed">
							<thead>
								<tr>
									<th class="center" style="width: 70px;">序号</th>
									<th class="center" style="width: 70px;">被查询人姓名</th>
									<th class="center" dict-name="CRED_TYPE_PER" style="width: 70px;">被查询人证件类型</th>
									<th class="center" style="width: 150px;">被查询人证件号码</th>
									<th class="center" dict-name="QUERY_RESULT_TYPE" style="width: 70px;">查询结果类型</th>
									<th class="center" style="width: 50px;">数字解读</th>
									<th class="center" style="width: 100px;">影响因素</th>
									<th class="center" style="width: 70px;">相对位置</th>
									<th class="center" style="width: 120px;">产品日期</th>
									<th class="center" style="width: 230px;">文件名称</th>
								</tr>
							</thead>					
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty queryResult}">
									<c:forEach items="${queryResult}" var="dsl" varStatus="vs">											
										<tr>
											<td class='center'>${vs.index+1}</td>
											<td class="center">${dsl.CLIENT_NAME }</td>
											<td class="center">${dsl.CREDENTIALS_TYPE }</td>
											<td class="center">${dsl.CREDENTIALS_NO}</td>
											<td class="center">${dsl.RESULT_TYPE}</td>
											<td class="center">${dsl.SCORE }</td>
											<td class="center">${dsl.FACTORS }</td>
											<td class="center">${dsl.POSITION}</td>
											<td class="center">${dsl.SCORE_DATE}</td>
											<td class="center">${dsl.RE_FILE_NAME}</td>
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
</div>
<!-- /.main-container -->
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp"%>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<!-- 没有选中时的提示框 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<script type="text/javascript">
	dict.init({ids:['CERTTYPE']});
	dict.init({ids:['table_report'],buildType:'grid'});
	$(top.hangge());
	
	$(function() {
		
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
	

	//检索
	function goSearch(){
		top.jzts();
		$("#Form").submit();
	}
	//单文件下载
	function exportExcel(){
		//var downLoadPath = BrowseFolder(); 
		var RE_FILE_NAME = $("#RE_FILE_NAME").val();
		top.jzts();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>/createReport/exportData.do?',
	    	data: {RE_FILE_NAME:RE_FILE_NAME,PATH:""},
			dataType:'json',
			cache: false,
			success:function(data){
				$(top.hangge());
				 var msg = "";
				 if("success" == (data.msg)){
					 msg="下载完成!";
					 window.location.href='<%=basePath%>/createReport/downLoadData.do?name='+data.name; 
				 }else if("noData" == (data.msg)){
					 msg="无符合条件数据!";
				 }else{
					 msg="下载失败!";
				 }
				 bootbox.dialog({
						message: "<span class='bigger-110'>"+msg+"</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
			}
		});
	}
	//弹出本地磁盘选择Folder路径
	function BrowseFolder(){
		try{
			var Message = "请选择文件下载路径..."; //选择提示框信息
			var Shell = new ActiveXObject("Shell.Application");
			var Folder = Shell.BrowseForFolder(0,Message,0x0040,0x11);//起始目录为:我的电脑
			if(Folder != null){
				Folder = Folder.items();
				Folder = Folder.item();
				Folder = Folder.Path;
				if(Folder.charAt(Folder.length - 1) != "\\"){
					Folder = Folder + "\\";
				}
				return Folder;
			}
		}catch(e){
			alert(e.message);
		}
	}
</script>
</body>
</html>