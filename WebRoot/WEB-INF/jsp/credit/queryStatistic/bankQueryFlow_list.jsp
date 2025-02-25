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
						<div class="col-xs-12">	
						<!-- 检索  -->
						<form action="BankQueryFlow/list.do?menuId=${pd.menuId}" method="post" name="Form" id="Form">
			            <table class="margin-5 width-100">
							<tr>
								<td class="align-left width-100">
									<c:if test="${QX.query == 1 }">
									<div class="float-l margin2-5">
										<span>机构名称:<span>
										<select class="" name="ORG_ID" id="ORG_ID" data-placeholder="请选择机构" style="width:120px;">
											<option value=""></option>
											<c:forEach items="${orgList}" var="org">
												<option value="${org.orgId}" <c:if test="${pd.ORG_ID == org.orgId}">selected</c:if>> ${org.name}</option>
											</c:forEach>
								  		</select>
									</div>
									<div class="float-l margin2-5">	
									    <span>数据日期:</span>
										<input type="text"  class="span10 date-picker" data-date-format="yyyy-mm" name="DATA_DATE" id="DATA_DATE" value="${pd.DATA_DATE}" title="数据日期"/>
									</div>
									<div class="float-l margin2-5">
										<span>&nbsp;用户名称:&nbsp;<span>	
										<input type="text"  name="NAME" id="NAME" placeholder="请输入用户名称" value="${pd.NAME}" title="用户名称"/>
									</div>
									<div class="float-l margin2-5">	
									    <span>&nbsp;报告类型:&nbsp;<span>
										<select  name="REPORT_TYPE" id="REPORT_TYPE" style="width: 120px;"> 
											<option value="企业信用报告银行标准版" <c:if test="${pd.REPORT_TYPE == '企业信用报告银行标准版'}">selected</c:if>>企业信用报告银行标准版</option>
											<option value="个人信用报告银行标准版" <c:if test="${pd.REPORT_TYPE == '个人信用报告银行标准版'}">selected</c:if>>个人信用报告银行标准版</option>
										</select>
									</div>
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if>
								</td>
								<td class="align-right width-30">
								
								<div class="btn-group">
									<a class="btn btn-green1 btn-mini" onclick="fromExcel();" title="Access导入"><i style="font-size: 18px;" class="iconfont icon-msnui-cloud-upload"></i></a>
								</div>
								
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class="center">机构名称</th>
									<th class="center" hidden>机构id</th>
									<th class='center'>账号</td>
									<th class='center'>用户名</td>
									<th class="center">用户名称</th>
									<th class="center">查询次数</th>
									<th class='center'>查询时间</td>
									<th class="center">操作</th>
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
											<td class='center'>
											           <c:if test="${not empty var.ORG_NAME}">
											             ${var.ORG_NAME}
											           </c:if>
											            <c:if test="${empty var.ORG_NAME}">
											              <span style="color:red;">—</span>
											           </c:if>
											</td>
											<td class='center' hidden >${var.REPORT_TYPE}</td>
											<td class='center'>${var.USER_NAME}</td>
											<td class='center'>
											          <c:if test="${not empty var.USERNAME}">
											            ${var.USERNAME}
											          </c:if>
											           <c:if test="${empty var.USERNAME}">
											             <span style="color:red;">—</span>
											          </c:if>
											</td>
											<td class='center'>
											          <c:if test="${not empty var.NAME}">
											            ${var.NAME}
											          </c:if>
											           <c:if test="${empty var.NAME}">
											             <span style="color:red;">—</span>
											          </c:if>
											</td>
											<td class='center'>${var.QUERY_COUNT}</td>
											<td class='center'>${var.APPLICATION_TIME}</td>
											<td class="center">
												      <c:if test="${QX.edit != 1 && QX.delete != 1 }">
												      	<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												      </c:if>
												      <div class="hidden-sm hidden-xs action-buttons">
												      <c:if test="${QX.edit == 1 }">
												      	<a>
												      	<i class="menu-icon fa fa-book icon-shape7se" title="查看详情" onclick="showDetails('${var.APPLICATION_TIME}','${var.REPORT_TYPE}','${var.USERNAME}','${pd.menuId}')"></i>
												         	</a>
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
		dict.init({ids:['CREDENTIALS_TYPE']});
		dict.init({ids:['simple-table'],buildType:'grid'});
		//检索
		function tosearch(){
			top.jzts();
			/* var DATA_DATE=$("#DATA_DATE").val();
			if(DATA_DATE==""){
				$("#DATA_DATE").tips({
					side:3,
		            msg:'请选择日期',
		            bg:'#AE81FF',
		            time:5
		        });
				$("#DATA_DATE").focus();
			} */
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
			
			var varList = '${varList}';
			if(varList!='[]'){
				var tr = "<tr><td colspan='4'></td><td class='center'>小计</td>";
			    var totalCom = 0;
			    var totalPer = 0;
			    var totalCount = 0;
			    <c:forEach items="${varList}" var="var" varStatus="vs">
			    	totalCount += parseInt('${var.QUERY_COUNT}');
			    </c:forEach> 
			    tr += "<td class='center'>"+totalCount+"</td>";
			    tr += "<td colspan='2'></td></tr>";
				tr +="<tr><td colspan='4'></td><td class='center'>总计</td>";
				tr +="<td class='center' >${count}</td>";
				tr +="<td colspan='2'></td></tr>";
			    $('#simple-table').append(tr);
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
		//打开上传excel页面
		function fromExcel(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="Access导入到数据库";
			 diag.URL = '<%=basePath%>BankQueryFlow/goUploadExcel.do';
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
		//查看详情
		function showDetails(APPLICATION_TIME,REPORT_TYPE,USERNAME,menuId){
			top.jzts();
			window.location.href='<%=basePath%>BankQueryFlow/goDetail.do?APPLICATION_TIME='+APPLICATION_TIME+'&REPORT_TYPE='+REPORT_TYPE+'&USERNAME='+USERNAME+'&menuId='+menuId;
	    }
	</script>
</body>
</html>