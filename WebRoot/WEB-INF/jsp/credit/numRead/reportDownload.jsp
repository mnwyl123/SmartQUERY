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
					<form action="createReport/goreportDownload.do?menuId=64" name="Form" id="Form" method="post">
						<div style="width:100%;overflow-x:scroll;">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left">
									<div class="float-l date-icon">
										<span>报文生成日期:</span>
										<input class="span10 date-picker" name="REPORTDATE" id="REPORTDATE" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:140px;" placeholder="" />										
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l margin2-5">
										<span>报文名称:</span>
										<input type="text" style="width:140px" name="BATCH_NAME" id="BATCH_NAME" placeholder="请输入报文名称" />
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l btn-group">
									   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
								<td class="align-right width-30">
									<%-- <c:if test="${QX.download == 1 }">
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="downAll();" title="批量下载" ><i class="iconfont icon-xiazai"></i></a>
									</div>
									</c:if> --%>
									<c:if test="${QX.deleteAll == 1 }">
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="delAll('确定要删除选中的数据吗?');" title="批量删除" ><i class="iconfont icon-shape7"></i></a>
									</div>
									</c:if>
								</td>
							</tr>
						</table>
						<table id="table_report" class="table table-striped table-bordered table-hover" style="width:100%;table-layout:fixed">
							<thead>
								<tr>
									<th class="center width35">
										<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width: 100px;">序号</th>
									<th class="center">报文生成日期</th>
									<th class="center">报文名称</th>
									<th class="center">被查询人个数</th>
									<th class="center" style="width: 200px;">操作</th>
								</tr>
							</thead>					
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty ftpList}">
									<c:forEach items="${ftpList}" var="dsl" varStatus="vs">											
										<tr>
											<td class='center'>
												<label class="pos-rel">
													<input type='checkbox' name='ids' value="${dsl.BATCH_NAME}" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td class='center' style="width: 100px;">${vs.index+1}</td>
											<td class="center">${dsl.REPORTDATE }</td>
											<td class="center">${dsl.BATCH_NAME }</td>
											<td class="center">${dsl.RECODECNT }</td>
											<td class="center">
												<c:if test="${QX.download != 1 && QX.delete != 1}">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
												<c:if test="${QX.download == 1 }">
												<a class="btn btn-green1 btn-mini" onclick="reportDownload('${dsl.BATCH_NAME}');" >
													<i class="iconfont icon-xiazai" title="下载"></i>
												</a>
												</c:if>
												<c:if test="${QX.delete == 1 }">
												&nbsp;&nbsp;&nbsp;
												<a onclick="del('${dsl.BATCH_NAME}');">
													<i class="iconfont icon-shape7 green2" title="删除"></i>
												</a>
												</c:if>
											</td>
										</tr>
									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="6" class="center">没有相关数据</td>
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
			$('#table_report > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
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
	function reportDownload(BATCH_NAME){
		 //var downLoadPath = BrowseFolder();
		/*alert(downLoadPath);   ?path='+downLoadPath*/
				$(top.hangge());
		window.location.href='<%=basePath%>/createReport/reportDownloadnum.do?BATCH_NAME='+BATCH_NAME;		
		<%-- top.jzts();
		$.ajax({
			url:'<%=basePath%>createReport/download.do',
			type:'GET',
			data:{BATCH_NAME:BATCH_NAME,PATH:""},
			dataType:'json',
			success:function(data){
				$(top.hangge());
				var msg = "";
				if("success" == (data.msg)){
				
					msg="下载成功";
					window.location.href='<%=basePath%>/createReport/download.do?BATCH_NAME='+BATCH_NAME;
					window.location.href='<%=basePath%>/createReport/reportDownloadnum.do?BATCH_NAME='+BATCH_NAME;
				}else{
					 msg="下载失败!";
				}
				bootbox.dialog({
					message: "<span class='bigger-110'>"+msg+"</span>",
					buttons: 			
						{ "button":
						    {"label":"确定",
           				  "className":"btn-sm btn-success"
										}}
				});
			}
		}); --%>
	}
	//批量下载
	function downAll(){
		//var downLoadPath = BrowseFolder();
		top.jzts();
		var str = '';
		for(var i=0;i < document.getElementsByName('ids').length;i++){
		  if(document.getElementsByName('ids')[i].checked){
			if(str=='') str += document.getElementsByName('ids')[i].value;
			else str += ',' + document.getElementsByName('ids')[i].value;
		  }
		}
		if(str==''){
			$(top.hangge());
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
			$.ajax({
				type: "POST",
				url: '<%=basePath%>createReport/reportDownload.do?PATH=',
		    	data: {BATCH_NAME:str},
				dataType:'json',
				cache: false,
				success:function(data){
					$(top.hangge());
					 var msg = "";
					 if("success" == (data.msg)){
						 window.location.href='<%=basePath%>/createReport/reportDownloadnum.do?BATCH_NAME='+str; 
						 msg="批量下载成功!";
					 }else{
						 msg="批量下载失败!";
					 }
					 bootbox.dialog({
							message: "<span class='bigger-110'>"+msg+"</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
				}
			});
		}
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
	//单文件删除
	function del(BATCH_NAME){
		top.jzts();
		$.ajax({
			url:'<%=basePath%>createReport/reportDel.do',
			type:'POST',
			data:{"BATCH_NAME":BATCH_NAME},
			dataType:'json',
			success:function(data){
				$(top.hangge());
				var msg = "";
				if("success" == (data.msg)){
					nextPage(${page.currentPage});
					msg="删除成功!";
				}else{
					 msg="删除失败!";
				}
				bootbox.dialog({
					message: "<span class='bigger-110'>"+msg+"</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
			}
		});
	}
	//批量删除
	function delAll(){
		top.jzts();
		var str = '';
		for(var i=0;i < document.getElementsByName('ids').length;i++){
		  if(document.getElementsByName('ids')[i].checked){
			if(str=='') str += document.getElementsByName('ids')[i].value;
			else str += ',' + document.getElementsByName('ids')[i].value;
		  }
		}
		if(str==''){
			$(top.hangge());
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
			$.ajax({
				type: "POST",
				url: '<%=basePath%>createReport/reportDel.do',
		    	data: {BATCH_NAME:str},
				dataType:'json',
				cache: false,
				success:function(data){
					$(top.hangge());
					 var msg = "";
					 if("success" == (data.msg)){
						 nextPage(${page.currentPage});
						 msg="批量删除成功!";
					 }else{
						 msg="批量删除失败!";
					 }
					 bootbox.dialog({
							message: "<span class='bigger-110'>"+msg+"</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
				}
			});
		}
	}
</script>
</body>
</html>