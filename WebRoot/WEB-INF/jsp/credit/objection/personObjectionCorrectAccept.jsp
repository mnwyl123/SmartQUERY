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
	#tab tr td{
		width:150px;
	}
	#tab{
		border-collapse:separate;
		border-spacing:0px 10px;
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
						<form action="personObjection/listCorrectAccept.do?menuId=96" method="post" name="Form" id="Form">
						<table class="" id="tab">
							<tr>
								<td align="right">
									    发起用户名称:&nbsp;&nbsp;
							    </td>
								<td>
								   </div>
										<input id="NAME" type="text" value="${pd.NAME}" name="NAME" placeholder="用户姓名" />
								</td>
								<td align="right">
									
										异议事项号:&nbsp;&nbsp;
								</td>
								<td>
										<input id="OBJCHECKID" type="text" name="OBJCHECKID" value="${pd.OBJCHECKID}" placeholder="异议事项号"/>
								</td>
								<td align="right">
									    处理结果描述:&nbsp;&nbsp;
							    </td>
								<td>
										<input id="RESULTDESC" type="text" value="${pd.RESULTDESC}" name="RESULTDESC" placeholder="处理结果描述" />
								</td>
								<td align="right">	
									    是否接受更正结果:&nbsp;&nbsp;
							    </td>
								<td>
										<select  name="CORRECTACCEPTFLAG" id="CORRECTACCEPTFLAG" style="width: 163px;"> 
											<option value="">--</option>
											<option value="Y" <c:if test="${pd.CORRECTACCEPTFLAG == 'Y'}">selected</c:if>>是</option>
											<option value="N" <c:if test="${pd.CORRECTACCEPTFLAG == 'N'}">selected</c:if>>否</option>
										</select>
								
								</td>
							</tr><tr>
								<td align="right">	
									    更正处理意见:&nbsp;&nbsp;
							    </td>
								<td>
										<input id="CORRECTOPINION" type="text" value="${pd.CORRECTOPINION}" name="CORRECTOPINION" placeholder="更正处理意见" />
								</td>
								<td>
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
									<th class="center">异议事项号</th>
									<th class="center" style="min-width:130px">核查开始日期</th>
									<th class="center" style="min-width:130px">核查到期日期</th>
									<th class="center">发起用户名称</th>
									<th class="center">处理结果描述</th>
									<th class="center">是否接受更正结果</th>
									<th class="center">更正处理意见</th>
								</tr> 
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>${vs.index+1}</td>
											
											<td class="center" >
											<c:if test="${ empty var.RESULTDESC  }">
												<a  title="填写处理结果" onclick="writeResult('${var.ID}','${var.OBJCHECKID}');"><!-- 此处的edit传入值可根据实际情况设置为表主键-->
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
											<td class='center'>${var.RESULTDESC}</td>
											<td class='center'>
												<c:if test="${var.CORRECTACCEPTFLAG == 'Y'}">是</c:if>
												<c:if test="${var.CORRECTACCEPTFLAG == 'N'}">否</c:if>
											</td>
											<td class='center'>${var.CORRECTOPINION}</td>
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
		
		function writeResult(ID,OBJCHECKID){
			bootbox.confirm("请确认是否上报异议事项("+OBJCHECKID+")?", function(result) {
			if(result) {
			top.jzts();
			$.ajax({
				url:'<%=basePath%>personObjection/correctAcceptReport.do',
				data:{ID:ID,OBJCHECKID:OBJCHECKID},
				type:'post',
				dataType:'json',
				success:function(data){
					$(top.hangge());
					bootbox.dialog({
						message: "<span class='bigger-110'>"+data.msg+"</span>",
						buttons: 			
						{
							"button" :
							{
								"label" : "确定",
								"className" : "btn-sm btn-success",
								"callback" : function(){
									nextPage(${page.currentPage});
								}
							}
						}
					});
				}
			});
			};
			});
		}
		
	</script>


</body>
</html>