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
					<form action="createReport/getReoprtList.do?menuId=${pd.menuId}" name="Form" id="Form" method="post">
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
										<select style="width:140px" dict-name="CRED_TYPE_PER" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE">
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
										<span>产品时间:</span>
										<input type="text"style="width:140px" name="PRODUCE_DATE" id="PRODUCE_DATE"  value="${pd.PRODUCE_DATE}" placeholder="yyyymmdd" />
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l btn-group">
									   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
								<td class="align-right width-30">
									<c:if test="${QX.add == 1 }">
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="add();"><i class="iconfont icon-tianjia" title="新增"></i></a>
									</div>
									</c:if>
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="importExcel();"><i class="iconfont iconfont icon-msnui-cloud-upload" title="导入"></i></a>
									</div>
									<c:if test="${QX.deleteAll == 1 }">
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="makeAll('确定要删除吗?');" title="批量删除" ><i class="iconfont icon-shape7"></i></a>
									</div>
									</c:if>
									<c:if test="${QX.reportCreate == 1 }">
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="createReport();" title="报文生成" ><i class="iconfont icon-htmal5icon06"></i></a>
									</div>
									</c:if>
									<!--<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="parseReport();" title="反馈报文入库" ><i class="iconfont icon-htmal5icon06"></i></a>
									</div>-->
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
									<th class="center">被查询人姓名</th>
									<th class="center" dict-name="CRED_TYPE_PER">被查询人证件类型</th>
									<th class="center">被查询人证件号码</th>
									<th class="center">产品时间</th>
									<th class="center">操作</th>
								</tr>
							</thead>					
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty reports}">
									<c:forEach items="${reports}" var="rep" varStatus="vs">											
										<tr>
											<td class='center'>
												<label class="pos-rel">
													<input type='checkbox' name='ids' value="${rep.REQUEST_NO}" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td class='center' style="width: 100px;">${vs.index+1}</td>
											<td class="center">${rep.CLIENT_NAME }</td>
											<td class="center">${rep.CREDENTIALS_TYPE }</td>
											<td class="center">${rep.CREDENTIALS_NO}</td>
											<td class="center">${rep.PRODUCE_DATE}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.delete != 1}">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
												<c:if test="${QX.edit == 1 }">
												<a title="编辑" onclick="edit('${rep.REQUEST_NO}');">
													<i class="iconfont icon-bianji red1"   title="编辑"></i>
												</a>
												</c:if>
												<c:if test="${QX.delete == 1 }">
												&nbsp;&nbsp;&nbsp;
												<a  title="删除" onclick="del('${rep.REQUEST_NO}');">
													<i class="iconfont icon-shape7 green2 "   title="删除"></i>
												</a>
												</c:if>
											</td>
										</tr>
									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="7" class="center">没有相关数据</td>
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
	dict.init({ids:['CREDENTIALS_TYPE']});
	dict.init({ids:['table_report'],buildType:'grid'});
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
	//新增
	function add(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>createReport/goAddR.do';
		 diag.Width = 510;
		 diag.Height = 350;
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
	//导入
	function importExcel(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="EXCEL导入到数据库";
		 diag.URL = '<%=basePath%>createReport/goImportExcel.do';
		 diag.Width = 500;
		 diag.Height = 350;
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
	function edit(REQUEST_NO){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="资料";
		 diag.URL = "<%=basePath%>createReport/goEditR.do?REQUEST_NO="+REQUEST_NO;
		 diag.Width = 510;
		 diag.Height = 350;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				nextPage(${page.currentPage});
			}
			diag.close();
		 };
		 diag.show();
	}
	//删除
	function del(REQUEST_NO){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="资料";
		 diag.URL = "<%=basePath%>createReport/deleteR.do?REQUEST_NO="+REQUEST_NO;
		 diag.Width = 469;
		 diag.Height = 365;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				nextPage(${page.currentPage});
			}
			diag.close();
		 };
		 diag.show();
	}
	//批量操作
	function makeAll(msg){
		$(top.hangge());
		var PRODUCE_DATE = $("#PRODUCE_DATE").val();
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
					str+="id";
				}
				if(msg == '确定要删除吗?'){
					top.jzts();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>createReport/deleteAll.do',
						data: {DATA_IDS:str,PRODUCE_DATE:PRODUCE_DATE},
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
				<%-- if(str==''){
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
					$(top.hangge());
					if(msg == '确定要删除吗?'){
						top.jzts();
						$.ajax({
							type: "POST",
							url: '<%=basePath%>createReport/deleteAll.do',
							data: {DATA_IDS:str,PRODUCE_DATE:PRODUCE_DATE},
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
				} --%>
			}
		});
	}
	function createReport(){
		var PRODUCE_DATE = $("#PRODUCE_DATE").val();
		top.jzts();
		var str = '';
		for(var i=0;i < document.getElementsByName('ids').length;i++){
		  if(document.getElementsByName('ids')[i].checked){
			if(str=='') str += document.getElementsByName('ids')[i].value;
			else str += ',' + document.getElementsByName('ids')[i].value;
		  }
		}
		if(str==''){
			str+="id";
		}
		$.ajax({
			type: "POST",
			url: '<%=basePath%>createReport/createReport.do',
	    	data: {DATA_IDS:str,PRODUCE_DATE:PRODUCE_DATE},
			dataType:'json',
			cache: false,
			success:function(data){
				$(top.hangge());
				 var msg = "";
				 if("success" == (data.msg)){
					 msg="报文生成成功!";
				 }else{
					 msg="报文生成失败!";
				 }
				 bootbox.dialog({
						message: "<span class='bigger-110'>"+msg+"</span>",
						buttons: 			
						{ "button":{ "label":"确定", 
						  "className":"btn-sm btn-success",
						  "callback":function(){
							  nextPage(${page.currentPage});
								}}
							}
				});
			}
		});
		<%-- if(str==''){
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
				url: '<%=basePath%>createReport/createReport.do',
		    	data: {DATA_IDS:str},
				dataType:'json',
				cache: false,
				success:function(data){
					$(top.hangge());
					 var msg = "";
					 if("success" == (data.msg)){
						 msg="报文生成成功!";
					 }else{
						 msg="报文生成失败!";
					 }
					 bootbox.dialog({
							message: "<span class='bigger-110'>"+msg+"</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
				}
			});
		} --%>
	}
	function parseReport(){
		top.jzts();
		var diag = new top.Dialog();
		diag.Drag=true;
		diag.Title ="反馈报文解析并存到数据库";
		diag.URL = '<%=basePath%>createReport/goParseReport.do';
		diag.Width = 500;
		diag.Height = 200;
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
</script>
</body>
</html>