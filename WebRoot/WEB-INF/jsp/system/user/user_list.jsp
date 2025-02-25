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
						<form action="user/listUsers.do" method="post" name="userForm" id="userForm">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70">
									<c:if test="${QX.query == 1 }">
									<div class="nav-search float-l margin2-5">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="" placeholder="搜&nbsp;索..." />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
									<div class="float-l margin2-5">
										<select style="width:130px" dict-name="DeptCode" default-value="${pd.DEPT_CODE}" name="DEPT_CODE" id="DEPT_CODE">
											<option value="">请选择部门名称</option>
										</select>
									</div>
									<div class="float-l margin2-5">
										<select class="chosen-select form-control" name="DEPARTMENT_ID" id="department_id" value="" data-placeholder="请选择机构" style="width: 120px;">
											<option value=""></option>
											<c:forEach items="${orgList}" var="org">
												<option value="${org.orgId }" <c:if test="${pd.DEPARTMENT_ID == org.orgId}">selected</c:if>> ${org.name}</option>
											</c:forEach>
								  		</select>
									</div>
									<div class="float-l margin2-5">
										<select class="chosen-select form-control" name="ROLE_ID" id="role_id" data-placeholder="请选择角色" style="width: 120px;">
											<option value=""></option>
											<c:forEach items="${roleList}" var="role">
												<option value="${role.ROLE_ID }" <c:if test="${pd.ROLE_ID == role.ROLE_ID}">selected</c:if>> ${role.ROLE_NAME} </option>
											</c:forEach>
								  		</select>
									</div>
									<!-- <div class="float-l margin2-5">
										<select class="chosen-select form-control" name="PRODUCT_ID" id="PRODUCT_ID" data-placeholder="请选择产品" style="width: 120px;">
											<option value=""></option>
											<c:forEach items="${productList}" var="product">
												<option value="${product.PRODUCT_ID }" <c:if test="${pd.PRODUCT_ID == product.PRODUCT_ID}">selected</c:if>> ${product.PRODUCT_NAME} </option>
											</c:forEach>
								  		</select>
									</div> -->
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if>
								</td>
								<td class="align-right width-30">
								   <c:if test="${QX.sendSms == 1 }">
									<div class="btn-group" >
									<a title="批量发送站内信" class="btn btn-mini btn-red1" onclick="makeAll('确定要给选中的用户发送站内信吗?');"><i style="font-size: 18px;" class="iconfont icon-zhanneixin"></i></a>
									</div>
								   </c:if>
								   <c:if test="${QX.downLoad == 1 }">
									<div class="btn-group">
										<a class="btn btn-green1 btn-mini" onclick="toExcel();" title="导出到EXCEL"><i style="font-size: 18px;" class="iconfont icon-xiazai"></i></a>
									</div>
									</c:if>
									<c:if test="${QX.upLoad == 1 }">
									<div class="btn-group">
										<a class="btn btn-green1 btn-mini" onclick="fromExcel();" title="从EXCEL导入"><i style="font-size: 18px;" class="iconfont icon-msnui-cloud-upload"></i></a>
									</div>
									</c:if>
									<c:if test="${QX.add == 1 }">
									 <div class="btn-group" >
									<a class="btn btn-orange btn-mini" onclick="add();" title="新建用户"><i class="iconfont icon-tianjia"></i></a>
									</div>
									</c:if>
									<c:if test="${QX.batchDetele == 1 }">
									<div class="btn-group" >
									<a title="批量删除" class="btn btn-mini btn-orange" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='iconfont icon-shape7'></i></a>
									</div>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<div style="width:100%;overflow-x:scroll;">
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
									<th class="center width35">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="min-width:50px">序号</th>
									<th class="center" style="min-width:100px">用户名</th>
									<th class="center" style="min-width:100px">用户真实姓名</th>
									<th class="center" dict-name="DeptCode" style="min-width:100px">所属部门</th>
									<th class="center" style="min-width:180px">所属机构</th>
									<th class="center" style="min-width:100px">联系电话</th>
									<th class="center" style="min-width:100px"><i class="ace-icon fa fa-envelope-o"></i>邮箱</th>
									<th class="center" style="min-width:100px">人行征信登录账号(个人)</th>
									<th class="center" style="min-width:100px">人行征信登录账号(企业)</th>
									<th class="center" style="min-width:100px">是否线上用户</th>
									<!--<th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>最近登录时间</th>-->
									<!--th class="center">登录IP</th-->
									<th class="center" style="min-width:100px">IP地址</th>
									<th class="center" style="min-width:180px">MAC地址</th>
									<th class="center" style="min-width:180px">上次登录时间</th>
									<th class="center" style="min-width:100px">用户状态</th>
									<th class="center" style="min-width:100px">锁定原因</th>
									<th class="center" style="min-width:80px">渠道编号</th>
									<th class="center" style="min-width:80px">产品编号</th>
									<th class="center" style="min-width:150px">操作</th>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty userList}">
								  <c:if test="${QX.query == 1 }">
									<c:forEach items="${userList}" var="user" varStatus="vs">	
										<tr>
											<td class='center'>
												<label><input type='checkbox' name='ids' value="${user.USER_ID }" id="${user.EMAIL }" alt="${user.PHONE }" title="${user.USERNAME }" class="ace"/><span class="lbl"></span></label>
											</td>
											<td class='center'>${vs.index+1}</td>
											<td class="center"><a onclick="viewUser('${user.USER_ID}')" style="cursor:pointer;">${user.USERNAME }</a></td>
											<td class="center">${user.NAME }</td>
											<td class="center">${user.DEPT_CODE }</td>
											<td class="center">${user.ORGNAME}</td>
											<!-- td class="center">${user.IP}</td-->
											<td class="center">${user.PHONE}</td>
											<td class="center">${user.EMAIL}</td>
											<td class="center">${user.USERNAME_PERBANK}</td>
											<td class="center">${user.USERNAME_PERBANK_ORG}</td>
											<td class="center">
												<c:if test="${user.IS_ONLINE_USER == '1'}">是</c:if>
												<c:if test="${user.IS_ONLINE_USER == '0'}">否</c:if>
											</td>
											<td class="center">${user.IP}</td>
											<td class="center">${user.MAC}</td>
											<td class="center">${user.LAST_LOGIN}</td>
											<c:if test="${user.LOCK_STATUS == 0}"><td class="center">无效</td></c:if>
											<c:if test="${user.LOCK_STATUS == 1}"><td class="center">正常</td></c:if>
											<c:if test="${user.LOCK_STATUS == 2}"><td class="center">睡眠户</td></c:if>
											<c:if test="${user.LOCK_STATUS == 3}"><td class="center">锁定</td></c:if>
											<c:if test="${user.LOCK_STATUS != 0 && user.LOCK_STATUS != 1 && user.LOCK_STATUS != 2 && user.LOCK_STATUS != 3}">
												<td class="center"></td>
											</c:if>
											<td class="center">${user.LOCK_REASON}</td>
											<td class="center">${user.CHANNEL_ID}</td>
											<td class="center">${user.PRODUCT_ID}</td>
											<td class="center">
												<c:if test="${user.USERNAME == pd.curUser || user.USERNAME != pd.curComp}">
												<c:if test="${QX.edit != 1 && QX.delete != 1 && QX.authorg != 1 && QX.authrole != 1}">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs action-buttons">
													<c:if test="${QX.unLock == 1 }">
													   <a > 
														<i class="iconfont icon-quanxianguanli green1"  title='重置密码' onclick="unLock('${user.USER_ID }','${user.USERNAME }');"></i>
														</a>
													</c:if>
													<c:if test="${QX.authorg == 1 }">
													   <a > 
														<i class="iconfont icon-quanxian blue2"  title='授权机构' onclick="authUser('${user.USER_ID }','org');"></i>
														</a>
													</c:if>
													<c:if test="${QX.authrole == 1 }">
													<a >
														<i class="iconfont icon-icon purple2" title="授权角色" onclick="authUser('${user.USER_ID }','role');"></i>
													</a>
													</c:if>
													<!-- <c:if test="${QX.authrole == 1 }">
													<a >
														<i class="iconfont icon-icon purple2" title="授权产品" onclick="authUser('${user.USER_ID }','pro');"></i>
													</a>
													</c:if> -->
													<c:if test="${QX.edit == 1 }">
													<a  href="javascript:editUser('${user.USER_ID}');">
														<i class="iconfont icon-bianji red1 " title="编辑" ></i>
													</a>
													</c:if>
										  			<c:if test="${QX.delete == 1 }">
										  			<a  href="javascript:delUser('${user.USER_ID }','${user.USERNAME }');">
														<i class="iconfont icon-shape7 green2 " title="删除" ></i>
													</a>
													</c:if>
													
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.unLock == 1 }">
															   <a > 
																<i class="iconfont icon-quanxianguanli green1"  title='重置密码' onclick="unLock('${user.USER_ID }','${user.USERNAME }');"></i>
																</a>
															</c:if>
															<c:if test="${QX.authorg == 1 }">
															<li>
																<a  onclick="authUser('${user.USER_ID }');" class="tooltip-info" data-rel="tooltip" title="授权机构">
																	<span class="blue2">
																		<i class="iconfont icon-quanxian "></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.authrole == 1 }">
															<li>
																<a  onclick="authUser('${user.USER_ID }');" class="tooltip-info" data-rel="tooltip" title="授权角色">
																	<span class="purple2">
																		<i class="iconfont icon-icon "></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.edit == 1 }">
															<li>
																<a  onclick="editUser('${user.USER_ID}');" class="tooltip-success" data-rel="tooltip" title="编辑">
																	<span>
																		<i class="iconfont icon-bianji red1"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.delete == 1 }">
															<li>
																<a  onclick="delUser('${user.USER_ID }','${user.USERNAME }');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span>
																		<i class="iconfont icon-shape7 green2"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											</c:if>
											<c:if test="${user.USERNAME != pd.curUser && user.USERNAME == pd.curComp}">
												<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
											</c:if>
											</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.query != 1 }">
										<tr>
											<td colspan="13" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="13" class="center">没有相关数据</td>
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
dict.init({ids:['DEPT_CODE']});
dict.init({ids:['simple-table'],buildType:'grid'});
$(top.hangge());

//检索
function searchs(){
	top.jzts();
	$("#userForm").submit();
}
//重置
// function resets(){
// 	$("#nav-search-input").val("");
// 	$("#lastLoginStart").val("");
// 	$("#lastLoginEnd").val("");
// 	$("#DEPARTMENT_ID").val("");
// 	$("#ROLE_ID").val("");
// 	//$("#logForm")[0].reset();
// }

//删除
function delUser(userId,msg){
	bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "<%=basePath%>user/deleteU.do?USER_ID="+userId+"&tm="+new Date().getTime();
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
	 diag.URL = '<%=basePath%>user/goAddU.do';
	 diag.Width = 469;
	 diag.Height = 480;
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
function editUser(user_id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '<%=basePath%>user/goEditU.do?USER_ID='+user_id;
	 diag.Width = 469;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			nextPage(${page.currentPage});
		}
		diag.close();
	 };
	 diag.show();
}

//授权
function authUser(user_id,type){
	if(type == 'org'&& ${pd.orgCount == 0} ){
	 		bootbox.dialog({
			message: "<span class='bigger-110'>尚无机构信息，请添加！</span>",
			buttons: 			
			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
		});
		return;
	 }
	 if(type == 'role'&& ${pd.roleCount == 0} ){
	 		bootbox.dialog({
			message: "<span class='bigger-110'>尚无角色信息，请添加！</span>",
			buttons: 			
			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
		});
		return;
	 }
	if(type == 'pro'&& ${pd.proCount == 0} ){
	 		bootbox.dialog({
			message: "<span class='bigger-110'>尚无产品信息，请添加！</span>",
			buttons: 			
			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
		});
		return;
	 }
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 if(type == 'org'){
	 	diag.Title ="机构授权";
	 }else if(type == 'role'){
	 	diag.Title ="角色授权";
	 }else if(type == 'pro'){
	 	diag.Title ="产品授权";
	 }else{
	 	diag.Title ="用户授权";
	 }
	 diag.URL = '<%=basePath%>user/goAuthOrg.do?USER_ID='+user_id+'&type='+type;
	 diag.Width = 400;
	 diag.Height = 475;
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
	bootbox.confirm(msg, function(result) {
		if(result) {
			var str = '';
			var emstr = '';
			var phones = '';
			var username = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(str=='') str += document.getElementsByName('ids')[i].value;
				  	else str += ',' + document.getElementsByName('ids')[i].value;
				  	
				  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
				  	else emstr += ';' + document.getElementsByName('ids')[i].id;
				  	
				  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
				  	else phones += ';' + document.getElementsByName('ids')[i].alt;
				  	
				  	if(username=='') username += document.getElementsByName('ids')[i].title;
				  	else username += ';' + document.getElementsByName('ids')[i].title;
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
						url: '<%=basePath%>user/deleteAllU.do?tm='+new Date().getTime(),
				    	data: {USER_IDS:str},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							 $.each(data.list, function(i, list){
									nextPage(${page.currentPage});
							 });
						}
					});
				}else if(msg == '确定要给选中的用户发送邮件吗?'){
					sendEmail(emstr);
				}else if(msg == '确定要给选中的用户发送短信吗?'){
					sendSms(phones);
				}else if(msg == '确定要给选中的用户发送站内信吗?'){
					sendFhsms(username);
				}
			}
		}
	});
}

//去发送短信页面
function sendSms(phone){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="发送短信";
	 diag.URL = '<%=basePath%>head/goSendSms.do?PHONE='+phone+'&msg=appuser';
	 diag.Width = 600;
	 diag.Height = 265;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//去发送电子邮件页面
function sendEmail(EMAIL){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="发送电子邮件";
	 diag.URL = '<%=basePath%>head/goSendEmail.do?EMAIL='+EMAIL;
	 diag.Width = 660;
	 diag.Height = 486;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//发站内信
function sendFhsms(username){
	top.jzts();
	 window.location.href='<%=basePath%>fhsms/goAdd.do?username='+username+'&type=2'+'&ID='+'user';
	
	
	 <%-- top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="站内信";
	 diag.URL = '<%=basePath%>fhsms/goAdd.do?username='+username+'&type=2'+'&ID='+'user';
	 diag.Width = 1000;
	 diag.Height = 474;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show(); --%>
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

//导出excel
function toExcel(){
	var keywords = $("#nav-search-input").val();
	var lastLoginStart = $("#lastLoginStart").val();
	var lastLoginEnd = $("#lastLoginEnd").val();
	var DEPT_CODE = $("#DEPT_CODE").val();
	var DEPARTMENT_ID = $("#department_id").val();
	var ROLE_ID = $("#role_id").val();
	var str='';
	for(var i=0;i < document.getElementsByName('ids').length;i++)
		{
			 if(document.getElementsByName('ids')[i].checked){
			 	if(str=='') str += document.getElementsByName('ids')[i].value;
				 else str += ',' + document.getElementsByName('ids')[i].value;
				}
			}
	window.location.href='<%=basePath%>user/excel.do?keywords='+keywords+'&lastLoginStart='+lastLoginStart+'&lastLoginEnd='+lastLoginEnd+'&IDS='+str+'&DEPT_CODE='+DEPT_CODE+'&DEPARTMENT_ID='+DEPARTMENT_ID+'&ROLE_ID='+ROLE_ID;
}

//打开上传excel页面
function fromExcel(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="EXCEL导入到数据库";
	 diag.URL = '<%=basePath%>user/goUploadExcel.do';
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

//查看用户
function viewUser(USER_ID){
	if('0' == USER_ID){
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
	 diag.URL = '<%=basePath%>user/view.do?USER_ID='+USER_ID;
	 diag.Width = 469;
	 diag.Height = 360;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//查看用户
function unLock(USER_ID,USERNAME){
	bootbox.confirm("确定要重置 "+USERNAME+" 密码吗?", function(result) {
		if(result) {
			$.ajax({
				type: "POST",
				url: '<%=basePath%>user/unLock.do',
		    	data: {USER_ID:USER_ID,USERNAME:USERNAME},
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
