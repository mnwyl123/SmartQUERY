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
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" /> 
<link rel="stylesheet" href="static/ace/css/datetimepicker.css" />
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
						<form action="fhsms/list.do" method="post" name="Form" id="Form">
						<input type="hidden" name="TYPE" value="${pd.TYPE}" />
						<table style="margin-top:5px;width:100%;">
							<tr>
								<td style="width:60%;text-align:left;">
									<div class="nav-search" style="float:left;margin:0 2px;">
										<span class="input-icon">
											<input type="text" placeholder="按发件人、收件人、状态搜索" class="nav-search-input" id="nav-search-input" style="width:210px;" autocomplete="off" name="keywords" value="${pd.keywords }" >
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
									<div style="float:left;margin-right: -25px;"  class="float-l date-icon">
									<input name="lastLoginStart" id="lastLoginStart" readonly="readonly" value="${pd.lastLoginStart}" type="text"  style="width:168px;" placeholder="开始日期" title="开始日期"/> 
										<i class="iconfont icon-date"></i>
									</div>
									<div style="float:left;margin-right: -25px;" class="float-l date-icon">
									    <input  name="lastLoginEnd" id="lastLoginEnd" readonly="readonly" value="${pd.lastLoginEnd}" type="text"   style="width:168px;" placeholder="结束日期" title="结束日期"/>
										<i class="iconfont icon-date"></i>
									</div>
									<div style="float:left; margin:0 2px;">
										<select class="chosen-select form-control" name="STATUS" id="STATUS" data-placeholder="状态" style="width: 68px;">
											<c:if test="${pd.TYPE != '2' }">
											<option value="">全部</option>
											<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if>>已读</option>
											<option value="2" <c:if test="${pd.STATUS == '2' }">selected</c:if>>未读</option>
											</c:if>
											<c:if test="${pd.TYPE != '1' }">
											<option value="">全部</option>
											<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if>>已发送</option>
											<option value="2" <c:if test="${pd.STATUS == '2' }">selected</c:if>>未发送</option>
											</c:if>
								  		</select>
									</div>
									<div style="float:left;margin:0 2px;" class="btn-group">
										<a class="btn btn-mini btn-blue1 paddingt-5" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									<div class="float-l btn-group">
										<a class="btn btn-grey1 btn-mini" onclick="resets();"  title="重置"><i class="iconfont icon-zhongzhi"></i></a>
									</div>
									
								</td>
								<td style="width:35%;text-align:right;">
									<div class="btn-group">
									  <a href="fhsms/list.do?TYPE=1" class="btn btn-<c:if test="${pd.TYPE != '2' }">green1</c:if> btn-hanzi" style="border-radius:4px;height: 30px;">收信箱</a>
									</div>
									<div class="btn-group">
										<a href="fhsms/list.do?TYPE=2" class="btn btn-<c:if test="${pd.TYPE == '2' }">green1</c:if> btn-hanzi" style="border-radius:4px;height: 30px;">发信箱</a>
									</div>
									<div class="btn-group">
									<a title="批量发送站内信" style="height:30px;width:auto;border-top-width: 1px" class="btn btn-hanzi btn-orange" onclick="makeAll('确定要发送站内信吗?');"><i class="iconfont icon-peifaxinxi"></i>发信</a>
									</div>
									<div class="btn-group">
									<a class="btn btn-mini btn-orange" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='iconfont icon-shape7'></i></a>
									</div>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">发信人</th>
									<th class="center">收信人</th>
									<th class="center">发信时间</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' id="${var.SMS_ID}" value="${var.SMS_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.FROM_USERNAME}</td>
											<td class='center'>${var.TO_USERNAME}</td>
											<td class='center'>${var.SEND_TIME}</td>
											<c:if test="${pd.TYPE == '1' }">
											<td class='center' id="STATUS${vs.index+1}"><c:if test="${var.STATUS == '2' }"><div class="red1" style="font-size:normal;">未&nbsp;&nbsp;读</div></c:if><c:if test="${var.STATUS == '1' }"><div class="green2" style="font-size:normal;">已&nbsp;&nbsp;读</div></c:if></td>
											<%-- <td class='center' id="STATUS${vs.index+1}"><c:if test="${var.STATUS == '2' }"><span class="label label-important arrowed-in">未读</span></c:if><c:if test="${var.STATUS == '1' }"><span class="label label-success arrowed">已读</span></c:if></td> --%>
											</c:if>
											<c:if test="${pd.TYPE != '1' }">
											<td class='center' id="STATUS${vs.index+1}"><div class="green2" style="font-size:normal;">已发送</div></td>
											<%-- <td class='center' id="STATUS${vs.index+1}"><span class="label label-success arrowed">已发送</span></td> --%>
											</c:if>
											<td class="center">
												<div class="action-buttons">
													<a title="查看" onclick="viewx('STATUS${vs.index+1}','${var.STATUS}','${pd.TYPE == '2'?'2':'1' }','${var.SMS_ID}','${var.SANME_ID}');">
														<i class="iconfont icon-sousuo red1"></i>
													</a>
													<a title='发送站内信' onclick="sendFhsms('${var.SMS_ID}','${pd.TYPE == '2'?'2':'1' }');" style="margin:0 3px;">
														<i class="iconfont icon-peifaxinxi orange1" title="发送站内信"></i>
													</a>
													<a onclick="del('STATUS${vs.index+1}','${var.STATUS}','${pd.TYPE == '2'?'2':'1' }','${var.SMS_ID}','${var.SANME_ID}');">
														<i class="iconfont icon-shape7 green2" title="删除"></i>
													</a>
												</div>
											</td>
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
								<td style="vertical-align:top;text-align:center;"><div class="pagination" style="padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
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
	<script src="static/ace/js/date-time/moment.js"></script>  
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<!--  <script src="static/ace/js/date-time/bootbox.js"></script> -->
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		//重置
		function resets(){
			$("#nav-search-input").val("");
			$("#lastLoginStart").val("");
			$("#lastLoginEnd").val("");
		}
		$(function() {
		
		//日期框
		//	$('.date-picker').datepicker({
		//		autoclose: true,
		//		todayHighlight: true
		//	});
			$('#lastLoginStart,#lastLoginEnd').datetimepicker({
				format:'YYYY-MM-DD HH:mm:ss'
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
		
		//发站内信
		function sendFhsms(smsId,type){
			top.jzts();
			 window.location.href='<%=basePath%>fhsms/goAdd.do?SMSID='+smsId+'&TYPE='+type+'&ID='+'sms';
			
			<%--  top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="站内信";
			 diag.URL = '<%=basePath%>fhsms/goAdd.do?SMSID='+smsId+'&TYPE='+type+'&ID='+'sms';
			 diag.Width = 660;
			 diag.Height = 444;
			 diag.CancelEvent = function(){ //关闭事件
				 top.jzts();
				 setTimeout("self.location=self.location",100);
				diag.close();
			 };
			 diag.show(); --%>
		}
		
		//删除
		function del(ztid,STATUS,type,Id,SANME_ID){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(type == "1" && STATUS == '2' && $("#"+ztid).html() == '<div class="red1" style="font-size:normal;">未&nbsp;&nbsp;读</div>'){
					top.readFhsms();//读取站内信时减少未读总数  <!-- readFhsms()函数在 WebRoot\static\js\myjs\head.js中 -->
				}
				if(result) {
					top.jzts();
					var url = "<%=basePath%>fhsms/delete.do?SMS_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//查看信件
		function viewx(ztid,STATUS,type,Id,SANME_ID){
			if(STATUS == '2' && $("#"+ztid).html() == '<div class="red1" style="font-size:normal;">未&nbsp;&nbsp;读</div>'){
				$("#"+ztid).html('<i class="ace-icon fa fa-check green2 bigger-120"></i>');
				top.readFhsms();//读取站内信时减少未读总数  <!-- readFhsms()函数在 WebRoot\static\js\myjs\head.js中 -->
			}
			top.jzts();
			 window.location.href='<%=basePath%>fhsms/goView.do?SMS_ID='+Id+'&TYPE='+type+'&SANME_ID='+SANME_ID+'&STATUS='+STATUS;
			
			<%--  top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="站内信";
			 diag.URL = '<%=basePath%>fhsms/goView.do?SMS_ID='+Id+'&TYPE='+type+'&SANME_ID='+SANME_ID+'&STATUS='+STATUS;
			 diag.Width = 600;
			 diag.Height = 460;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show(); --%>
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var smsId = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  	
					  	if(smsId=='') smsId += document.getElementsByName('ids')[i].id;
					  	else smsId += ';' + document.getElementsByName('ids')[i].id;
					  }
					}
					
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>fhsms/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});//刷新当前页面
											top.getFhsmsCount();//更新未读站内信
									 });
								}
							});
						}else if(msg=='确定要发送站内信吗?'){
							sendFhsms(smsId,${pd.TYPE == '2'?'2':'1' });
						}
					}
			});
		};
		
		//查看用户
		function viewUser(USERNAME){
			if('admin' == USERNAME){
				bootbox.dialog({
					message: "<span class='bigger-110'>不能查看super用户!</span>",
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
	</script>

</body>
</html>