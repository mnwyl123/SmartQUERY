<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	
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
					<form action="dataSubmission/dataSubmissionCompanylist.do?menuId=29" name="Form" id="Form" method="post">
						<div id="zhongxin">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left">
									<div class="float-l margin2-5">
										<span>客户名称:</span>
										<input type="text" style="width:180px" name="COMPANY_NAME" id="COMPANY_NAME" placeholder="请输入客户名称" />
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l margin2-5">
										<span>中证码:</span>
										<input type="text"style="width:180px" name="CHINA_CREDIT_CODE" id="CHINA_CREDIT_CODE" placeholder="请输入中证码" />
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="float-l btn-group">
									   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
								<td class="align-right width-30">
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="sendPostBatch();" title="批量报文生成" ><i class="iconfont icon-htmal5icon06"></i></a>
									</div>
								</td>
							</tr>
						</table>
						<div style="width:100%;overflow-x:scroll;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center width35">
										<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center" style="min-width:100px">机构代码</th>
									<th class="center" style="min-width:100px">产品名称</th> 
									<th class="center" style="min-width:180px">用户所属机构</th>
									<th class="center" style="min-width:180px">查询网点名称</th>
									<th class="center" style="min-width:100px">查询用户系统名</th>
									<th class="center" style="min-width:100px">查询用户真实姓名</th>
									<th class="center"  hidden style="min-width:180px">查询编号</th>
									<th class="center" style="min-width:200px">被查询单位名称</th>
									<th class="center" dict-name="DeptCode" style="min-width:100px">部门名称</th>
									<th class="center" style="min-width:170px">查询时间</th>
									<th class="center" style="min-width:180px">中征码</th>
									<th class="center" style="min-width:100px">是否查得</th>
									<th class="center" style="min-width:170px">查询授权时间</th>
									<th class="center" style="min-width:100px">查询机IP</th>
									<th class="center" style="min-width:100px">操作</th>
								</tr>
							</thead>					
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty dataSubmissionCompanyList}">
									<c:forEach items="${dataSubmissionCompanyList}" var="dsl" varStatus="vs">											
										<tr style="height: 45px;">
											<c:if test="${dsl.SEND_STATUS!='0'}">
												<td class='center'>
													<label class="pos-rel">
														<input type='checkbox' name='ids' disabled value="${dsl.ID}" class="ace" />
														<span class="lbl"></span>
													</label>
												</td>
											</c:if>
											<c:if test="${dsl.SEND_STATUS=='0'}">
												<td class='center'>
													<label class="pos-rel">
														<input type='checkbox' name='ids' value="${dsl.ID}" class="ace" />
														<span class="lbl"></span>
													</label>
												</td>
											</c:if>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${dsl.ORG_CODE }</td>
											<td class="center">${dsl.product_name }</td>
											<td class="center">${dsl.ORG_NAME }</td>
											<td class="center">${dsl.BRANCH_NAME}</td>
											<td class="center">${dsl.USER_SYS_NAME}</td>
											<td class="center">${dsl.USER_REAL_NAME}</td>
											<td class="center" hidden>${dsl.ID}</td>
											<td class="center">${dsl.COMPANY_NAME}</td>
											<td class="center">${dsl.DEPT_CODE}</td>
											<td class="center">${dsl.QUERY_TIME}</td>
											<td class="center">${dsl.CHINA_CREDIT_CODE}</td>
										    <td class="center">${dsl.IS_GET}</td>
											<td class="center">${dsl.CHECK_TIME}</td>
											<td class="center">${dsl.IP}</td>
											<td class="center">
												<!-- <i class="iconfont icon-yingshe01 orange1" title="生成xml" onclick="createXml('${dsl.ID}');" ></i>
												<i class="iconfont icon-yingshe01 orange1" title="生成txt" onclick="createTxt('${dsl.ID}');" ></i> -->
												<c:if test="${QX.send == 1 }">
													<c:if test="${dsl.SEND_STATUS=='0'}">
														<i class="glyphicon glyphicon-send" style="color:orange" title="发送报文" onclick="sendPost('${dsl.ID}');" ></i>
													</c:if>
													<c:if test="${dsl.SEND_STATUS!='0'}">
														<i class="glyphicon glyphicon-send" style="color:rgba(0, 0, 0, 0.42)" title="已发送成功，不能再次发送" ></i>
													</c:if>
												</c:if>
												<c:if test="${QX.send != 1 }">
												<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
											</td>
										</tr>
									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						</div>
						</div>
						<div class="page-header position-relative">
						<table class="width-100">
							<tr>
								<td class="align-top center"><div class="pagination">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>					
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
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
	dict.init({ids:['table_report'],buildType:'grid'});
	$(top.hangge());
	
	//检索
	function goSearch(){
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
	//创建xml文件
	function createXml(id){
		$.ajax({
			type: "POST",
			url: '<%=basePath%>dataSubmission/createXmlOfCompany.do',
	    	data: {id:id},
			dataType:'json',
			cache: false,
			success:function(data){
				 var msg = "";
				 if("success" == (data.result)){
					 msg="xml文件生成成功!";
				 }else{
					 msg="xml文件生成失败!";
				 }
				 bootbox.dialog({
						message: "<span class='bigger-110'>"+msg+"</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
			}
		});
		
	}
	//创建txt文件
	function createTxt(id){
		$.ajax({
			type: "POST",
			url: '<%=basePath%>dataSubmission/createTxtOfCompany.do',
	    	data: {id:id},
			dataType:'json',
			cache: false,
			success:function(data){
				 var msg = "";
				 if("success" == (data.result)){
					 msg="txt文件生成成功!";
				 }else{
					 msg="txt文件生成失败!";
				 }
				 bootbox.dialog({
						message: "<span class='bigger-110'>"+msg+"</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
			}
		});
		
	}
	//发送post请求
	function sendPost(id){
		top.jzts();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>syncUploadCreditLog/sendData.do',
	    	data: {id:id,dataType:2},
			dataType:'json',
			cache: false,
			success:function(data){
				 var msg = "";
				 if("success" == (data.result)){
					 msg="发送成功!";
				 }else{
					 msg="发送失败!"; 
					  bootbox.dialog({
						message: "<span class='bigger-110'>"+msg+"</span>",
						buttons: 			
						{ "button":
						    {"label":"确定",
           				  "className":"btn-sm btn-success",
						  "callback": function() {
											nextPage(${page.currentPage});
										}}}
				   });
				 }
				
				$(top.hangge());
			}
		});
		
	}

	function createReport(){
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
				url: '<%=basePath%>syncUploadCreditLog/downLoadAll.do',
		    	data: {DATA_IDS:str,dataType:2},
				dataType:'json',
				cache: false,
				success:function(data){
					$(top.hangge());
					 var msg = "";
					 if("success" == (data.msg)){
						 msg="批量生成成功!";
					 }else{
						 msg="批量生成失败!";
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
	//批量发送报文
	function sendPostBatch(){
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
			$.ajax({
				type: "POST",
				url: '<%=basePath%>syncUploadCreditLog/sendDataBatch.do',
		    	data: {DATA_IDS:str,dataType:'2'},
				dataType:'json',
				cache: false,
				success:function(data){
					$(top.hangge());
					 var msg = "";
					 if("success" == (data.result)){
						 msg="批量发送成功!";
					 }else{
						 msg="批量发送失败!";
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