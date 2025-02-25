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
						<form action="CreditAcctManage/list.do?menuId=59" method="post" name="Form" id="Form">
			            <table class="margin-5 width-100">
							<tr>
								<td class="align-left width-70">
									<c:if test="${QX.query == 1 }">
									<div class="float-l margin2-5">
									    <span>征信登录名:<span>
										<input id="CREDIT_CODE" type="text" name="CREDIT_CODE" value="${pd.CREDIT_CODE}" placeholder="征信登录名"/>
									</div>
									<div class="float-l margin2-5">
									    <span>征信用户名称:<span>
										<input id="CREDIT_NAME" type="text" name="CREDIT_NAME" value="${pd.CREDIT_NAME}" placeholder="征信登录名"/>
									</div>
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if>
								</td>
								<td class="align-right width-30">
									<c:if test="${QX.add == 1 }">
									 <div class="btn-group" >
									<a class="btn btn-orange btn-mini" onclick="add();" title="新增"><i class="iconfont icon-tianjia"></i></a>
									</div>
									</c:if>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class="center">征信登录名</th>
									<th class="center">征信用户名称</th>
									<th class="center" dict-name="CRED_TYPE">证件类型</th>
									<th class="center" >证件号码</th>
									<th class="center" dict-name="creditType">账号类型</th>
									<th class="center">启用日期</th>
								    <th class="center">停用日期</th>
									<th class="center" dict-name="IS_USED">是否启用</th>
								    <th class="center" dict-name="IS_WHITE">是否白名单</th>
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
											<td class='center'>${var.CREDIT_CODE}</td>
											<td class='center'>${var.CREDIT_NAME}</td>
											<td class='center'>${var.CREDENTIALS_TYPE}</td>
											<td class='center'>${var.CREDENTIALS_NO}</td>
											<td class='center'>${var.CREDIT_ACCT_TYPE}</td>
											<td class='center'>${var.START_DATE}</td>
											<td class='center'>${var.END_DATE}</td>
											<td class='center'>${var.PERBANK_STATUS}</td>
											<td class='center'>${var.ISWHITE}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.delete != 1 }">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs action-buttons">
												<c:if test="${QX.edit == 1 }">
												<a  href="javascript:edit('${var.CREDIT_CODE}','${var.CREDIT_ACCT_TYPE}');">
														<i class="iconfont icon-bianji red1 " title="编辑" ></i>
												</a>
												</c:if>
												<c:if test="${QX.delete == 1 }">
												<a>
													<i class="iconfont icon-shape7 green2 " title="删除" onclick="deleteU('${var.CREDIT_CODE}','${var.CREDIT_ACCT_TYPE}')"></i>
												</a>
												</c:if>
												<c:if test="${QX.edit == 1 }">
												    <c:if test="${var.IS_WEB == 1}">
												       <a  href="javascript:editPwd('${var.CREDIT_CODE}','${var.CREDIT_CODE}');">
														   <i class="iconfont icon-bianji #83f8f8 " title="修改密码" ></i>
												       </a>
												    </c:if>
												</c:if>
												<c:if test="${QX.edit == 1 }">
												     <c:if test="${var.IS_WEB == 1}">
												        <a  href="javascript:testPwd('${var.CREDIT_CODE}');">
														     <i class="menu-icon fa fa-book icon-shape7se" title="测试密码" ></i>
												        </a>
												     </c:if>
												</c:if>
												<c:if test="${QX.edit == 1 }">
												     <c:if test="${var.IS_WEB == 1}">
												        <a  href="javascript:iswhite('${var.CREDIT_CODE}');">
														     <i class="iconfont icon-bianji #83f8f8 " title="设定白名单" ></i>
												        </a>
												     </c:if>
												</c:if>
												<c:if test="${QX.edit == 1 }">
												     <c:if test="${var.IS_WEB == 1}">
												        <a  href="javascript:isnotwhite('${var.CREDIT_CODE}');">
														     <i class="iconfont icon-bianji #83f8f8 " title="取消白名单" ></i>
												        </a>
												     </c:if>
												</c:if>
												<c:if test="${QX.edit == 1 }">
												     <c:if test="${var.IS_WEB == 1}">
												        <a  href="javascript:statususe('${var.CREDIT_CODE}');">
														     <i class="iconfont icon-bianji #83f8f8 " title="启用账号" ></i>
												        </a>
												     </c:if>
												</c:if>
												<c:if test="${QX.edit == 1 }">
												     <c:if test="${var.IS_WEB == 1}">
												        <a  href="javascript:statusnouse('${var.CREDIT_CODE}');">
														     <i class="iconfont icon-bianji #83f8f8 " title="停用账号" ></i>
												        </a>
												     </c:if>
												</c:if>
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
						<form action="CreditAcctManage/toPwdUpdate.do?menuId=59" method="post" name="Form2" id="Form2">
							<input type="hidden" id="user_code" name="user_code"/>
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
		<input type="hidden" id="PERBANK_USER_CODE2" name="PERBANK_USER_CODE2" value="10"/>
		<input type="hidden" id="IS_WEB2" name="IS_WEB2" value="5"/>		

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
	dict.init({ids:['PERBANK_STATUS']});
	dict.init({ids:['simple-table'],buildType:'grid'});
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
		
        //删除
		function deleteU(CREDIT_CODE,CREDIT_ACCT_TYPE){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>CreditAcctManage/delete.do?CREDIT_CODE="+encodeURI(encodeURI(CREDIT_CODE))+"&CREDIT_ACCT_TYPE="+CREDIT_ACCT_TYPE;
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
			 diag.URL = '<%=basePath%>CreditAcctManage/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 // if('${page.currentPage}' == '0'){
						 // top.jzts();
						 // setTimeout("self.location=self.location",100);
					 // }else{
						 // nextPage(${page.currentPage});
					 // }
					 var isweb = diag.innerFrame.contentWindow.document.getElementById('IS_WEB').value;
					 if(isweb!='' && isweb=='1'){
						var usercode = diag.innerFrame.contentWindow.document.getElementById('CREDIT_CODE').value;
						editPwd(usercode);					
					 }else{
						 $("#Form").submit(); 
					 }	
				}
				diag.close();
			 };
			 diag.show();
		}
		

		//修改
		function edit(CREDIT_CODE,CREDIT_ACCT_TYPE){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 //diag.URL = '<%=basePath%>CreditAcctManage/goEdit.do?CREDIT_CODE='+CREDIT_CODE;
			 diag.URL = '<%=basePath%>CreditAcctManage/goEdit.do?CREDIT_CODE='+encodeURI(encodeURI(CREDIT_CODE))+'&CREDIT_ACCT_TYPE='+CREDIT_ACCT_TYPE;
			 diag.Width = 450;
			 diag.Height = 370;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}

		function editPwd(CREDIT_CODE){
			//$("#user_code").val(CREDIT_CODE);
			//$("#Form2").submit();
			var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改密码";
			 //diag.URL = '<%=basePath%>CreditAcctManage/goEdit.do?CREDIT_CODE='+CREDIT_CODE;
			 diag.URL = '<%=basePath%>CreditAcctManage/toPwdUpdate.do?menuId=59&user_code='+CREDIT_CODE;
			 diag.Width = 450;
			 diag.Height = 370;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
			
		}
		
		function testPwd(CREDIT_CODE){
			 bootbox.confirm("是否要去人行测试当前输入的密码是否正确?", function(result) {
				if(result) {
					$.ajax({
			             type: "POST",
			             url: "<%=basePath%>CreditAcctManage/testPwd.do?",
	    	             data: {CREDIT_CODE:CREDIT_CODE},
			             dataType:'json',
			             cache: false,
			             success:function(data){
			             	 var msg = data.msg;
			             	 bootbox.dialog({
			             			message: "<span class='bigger-110'>"+msg+"</span>",
			             			buttons: 			
			             			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
			             	});
			            }
		             });	
				};
			});
		}
		//是白名单
		function iswhite(CREDIT_CODE){
			var iswhite = "YES";
			bootbox.confirm("确定设定当前账号为白名单吗?", function(result) {
				if(result) {
					$.ajax({
			             type: "POST",
			             url: "<%=basePath%>CreditAcctManage/updateISWHITE.do?",
	    	             data: {CREDIT_CODE:CREDIT_CODE,ISWHITE:iswhite},
			             dataType:'json',
			             cache: false,
			             success:function(data){
			             	 var msg = data.msg;
			             	 bootbox.dialog({
			             			message: "<span class='bigger-110'>"+msg+"</span>",
			             			buttons: 			
			             			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
			             	});
			            }
		             });	
				};
			});
		}
		//取消白名单
		function isnotwhite(CREDIT_CODE){
			var iswhite = "NO";
			bootbox.confirm("取消当前账号白名单的设定吗?", function(result) {
				if(result) {
					$.ajax({
			             type: "POST",
			             url: "<%=basePath%>CreditAcctManage/updateISWHITE.do?",
	    	             data: {CREDIT_CODE:CREDIT_CODE,ISWHITE:iswhite},
			             dataType:'json',
			             cache: false,
			             success:function(data){
			             	 var msg = data.msg;
			             	 bootbox.dialog({
			             			message: "<span class='bigger-110'>"+msg+"</span>",
			             			buttons: 			
			             			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
			             	});
			            }
		             });	
				};
			});
		}
		//是白名单
		function statususe(CREDIT_CODE){
			var isuse = "YES";
			bootbox.confirm("确定设定当前账号为可用吗?", function(result) {
				if(result) {
					$.ajax({
			             type: "POST",
			             url: "<%=basePath%>CreditAcctManage/updateCREDITSTATUS.do?",
	    	             data: {CREDIT_CODE:CREDIT_CODE,ISUSE:isuse},
			             dataType:'json',
			             cache: false,
			             success:function(data){
			             	 var msg = data.msg;
			             	 bootbox.dialog({
			             			message: "<span class='bigger-110'>"+msg+"</span>",
			             			buttons: 			
			             			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
			             	});
			            }
		             });	
				};
			});
		}
		//是白名单
		function statusnouse(CREDIT_CODE){
			var isuse = "NO";
			bootbox.confirm("确定设定当前账号为不可以吗?", function(result) {
				if(result) {
					$.ajax({
			             type: "POST",
			             url: "<%=basePath%>CreditAcctManage/updateCREDITSTATUS.do?",
	    	             data: {CREDIT_CODE:CREDIT_CODE,ISUSE:isuse},
			             dataType:'json',
			             cache: false,
			             success:function(data){
			             	 var msg = data.msg;
			             	 bootbox.dialog({
			             			message: "<span class='bigger-110'>"+msg+"</span>",
			             			buttons: 			
			             			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
			             	});
			            }
		             });	
				};
			});
		}
	</script>
</body>
</html>