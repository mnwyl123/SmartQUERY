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
						<form action="entObjectRemark/listObjTransCorrect.do?menuId=95" method="post" name="Form" id="Form">
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left width-95">
									<div class="float-l margin2-4">	
									    <span>发起用户名称:<span>
										<input id="NAME" type="text" value="${pd.NAME}" name="NAME" placeholder="发起用户名称" />
									</div>
									<div class="float-l margin2-4">	
										<span>异议更正号:<span>
										<input id="OBJCHECKID" type="text" name="OBJCHECKID" value="${pd.OBJCHECKID}" placeholder="异议更正号"/>
									</div>
									<div class="float-l margin2-4">	
									    <span>异议更正结果:<span>
										<select  name="CORRECTRESULT" id="CORRECTRESULT" style="width: 120px;"> 
											<option value="">--</option>
											<option value="1" <c:if test="${pd.CORRECTRESULT == '1'}">selected</c:if>>已更正</option>
											<option value="2" <c:if test="${pd.CORRECTRESULT == '2'}">selected</c:if>>无需更正</option>
										</select>
									</div>
									<div class="float-l margin2-4">	
									    <span>异议更正结果描述:<span>
										<input id="CORRECTDESC" type="text" value="${pd.CORRECTDESC}" name="CORRECTDESC" placeholder="异议更正结果描述" />
									</div>
									<div class="float-l margin2-4">	
									    <span>处理结果描述:<span>
										<input id="RESULTDESC" type="text" value="${pd.RESULTDESC}" name="RESULTDESC" placeholder="处理结果描述" />
									</div>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class="center minwidth100">操作</th>
									<th class="center">异议更正号</th>
									<th class="center" style="min-width:130px">核查开始日期</th>
									<th class="center" style="min-width:130px">核查到期日期</th>
									<th class="center">发起用户名称</th>
									<th class="center">异议更正结果</th>
									<th class="center">附件信息</th>
									<th class="center">异议更正结果描述</th>
									<th class="center">处理结果描述</th>
								</tr> 
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty listInfo}">
									<c:forEach items="${listInfo}" var="var" varStatus="vs">
										<tr>
											<td class='center'>${vs.index+1}</td>
											<td class="center" >
											<c:if test="${empty var.RESULTDESC  }">
												<a  title="填写处理结果" onclick="writeResult('${var.ID}','${var.OBJCHECKID}','${var.OBJCHECKNUM}');">
													<i  class="glyphicon glyphicon-send" style="color:orange" title="填写处理结果"></i>
												</a>
											</c:if>
											<c:if test="${not empty var.RESULTDESC  }">
												<i  class="glyphicon glyphicon-send" style="color:rgba(0, 0, 0, 0.42)" title="已上报"></i>
											</c:if>
											</td>
											<td class='center'>${var.OBJCHECKID}</td>
											<td class='center'>${var.CHECKBEGINDATE}</td>
											<td class='center'>${var.RELATIVE_ENDDATE}</td>
											<td class='center'>${var.NAME}</td>
											<td class='center'>
												<c:if test="${var.CORRECTRESULT == '1'}">已更正</c:if>
												<c:if test="${var.CORRECTRESULT == '2'}">无需更正</c:if>
											</td>
											<td class='center'>
											<a  href="javascript:downloadAtt('${var.ID}','${var.CORRECT_ENCLOSUREINF}');">${var.CORRECT_ENCLOSUREINF}</a>
											</td>
											<td class='center'>${var.CORRECTDESC}</td>
											<td class='center'>${var.RESULTDESC}</td>
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
		
		function writeResult(ID,OBJCHECKID,OBJCHECKNUM){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="处理结果填写";
			 diag.URL = '<%=basePath%>entObjectRemark/goCheckResultReport.do?ID='+ID+'&OBJCHECKID='+OBJCHECKID+'&OBJCHECKNUM='+OBJCHECKNUM+'&TYPE=2';
			 diag.Width = 600;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
				//下载附件
		function downloadAtt(id,filename){
			$("#Form").attr("action","<%=basePath%>/entObjectRemark/downloadAtt.do?ID="+id+"&CORRECT_ENCLOSUREINF="+filename);
			$("#Form").submit();
			$("#Form").attr("action","entObjectRemark/listObjTransCorrect.do");
		}
		
	</script>


</body>
</html>