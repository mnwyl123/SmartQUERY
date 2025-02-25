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
						<form action="PersonRegister/list.do?menuId=26" method="post" name="Form" id="Form">
			            <table class="margin-5 width-100">
							<tr>
								<td class="align-left width-95">
									<c:if test="${QX.query == 1 }">
									<div class="float-l margin2-4">	
									    <span>被查询人姓名:<span>
										<input id="CLIENT_NAME" type="text" value="${pd.CLIENT_NAME}" name="CLIENT_NAME" value="" placeholder="被查询人姓名" />
									</div>
									<div class="float-l margin2-4">
									    <span>证件类型:<span>
										<select class="" name="CREDENTIALS_TYPE" dict-name="CRED_TYPE" default-value="${pd.CREDENTIALS_TYPE}" id="CREDENTIALS_TYPE" data-placeholder="证件类型" style="width:200px;">
										    <option value="">-请选择-</option>
								  		</select>
									</div>
									<div class="float-l margin2-4">	
										<span>证件号码:<span>
										<select class="" name="sign"  default-value="${pd.sign}" value='${pd.sign}' id="sign" data-placeholder="" style="width:100px;">
										    <option value="1"<c:if test="${'1'==pd.sign}"> selected="selected"</c:if>>完整号码</option>
											<option value="2"<c:if test="${'2'==pd.sign}"> selected="selected"</c:if>>前六位</option>
											<option value="3"<c:if test="${'3'==pd.sign}"> selected="selected"</c:if>>前四位</option>
											<option value="4"<c:if test="${'4'==pd.sign}"> selected="selected"</c:if>>前二位</option>
								  		</select>
								  		<input type="hidden" id="typev" value="${pd.sign}"/> 
										<input id="CREDENTIALS_NUM" type="text" name="CREDENTIALS_NO" value="${pd.CREDENTIALS_NO}" placeholder="证件号码"/>
									</div>
									<div class="float-l margin2-4">	
									    <span>查询用户号:<span>
										<input id="SEARCHER_ID" type="text" value="${pd.SEARCHER_ID}" name="SEARCHER_ID" value="" placeholder="查询用户号" />
									</div>
									</td>
									</tr>
									<tr>
									<td class="align-left width-95">
									<%-- <div class="float-l margin2-4">	
									    <span>机构名称:<span>
										<input id="ORG_NAME" type="text" value="${pd.ORG_NAME}" name="ORG_NAME" value="" placeholder="机构名称" />
									</div> --%>
									<div class="float-l margin2-4">
									    <span>查询方式:<span>
										<select class="" name="INTERNAL"  default-value="${pd.INTERNAL}" id="INTERNAL" data-placeholder="查询方式" style="width:200px;">
										    <option value="">-请选择-</option>
										    <option value="1"<c:if test="${'1'==pd.INTERNAL}"> selected="selected"</c:if>>-行内查询-</option>
										    <option value="2"<c:if test="${'2'==pd.INTERNAL}"> selected="selected"</c:if>>-人行查询-</option>
								  		</select>
									</div>
									<div class="float-l margin2-4">
									    <span>影像资料:<span>
										<select class="" name="FLAG"  default-value="${pd.FLAG}" id="FLAG" data-placeholder="影像资料" style="width:200px;">
										    <option value="">-请选择-</option>
										    <option value="0"<c:if test="${'0'==pd.FLAG}"> selected="selected"</c:if>>-全部缺失-</option>
										    <option value="1"<c:if test="${'1'==pd.FLAG}"> selected="selected"</c:if>>-全部上传-</option>
										    <option value="2"<c:if test="${'2'==pd.FLAG}"> selected="selected"</c:if>>-部分缺失-</option>
								  		</select>
									</div>
									<div class="float-l margin2-4">
									    <span>是否查得:<span>
										<select class="" name="result"  default-value="${pd.result}" id="result" data-placeholder="是否查的" style="width:200px;">
										    <option value="">-请选择-</option>
										    <option value="AAA000"<c:if test="${'AAA000'==pd.result}"> selected="selected"</c:if>>-是-</option>
										    <option value="1"<c:if test="${'1'==pd.result}"> selected="selected"</c:if>>-否-</option>
								  		</select>
									</div>
									</td>
								</tr>
								<tr><td class="align-left width-95">
									
									<div class="float-l margin2-5">	
									    <span>日期范围:</span>
										<%-- <select class="" name="sign"  default-value="=" value='${pd.sign}' id="sign" data-placeholder="" style="width:50px;">
										    <option value="1">=</option>
											<option value="2">></option>
											<option value="3"><</option>
								  		</select>
								  		<input type="hidden" id="typev" value="${pd.sign}"/> --%>
										<input type="text"  class="span10 date-picker" data-date-format="yyyy-mm-dd" name="START_TIME" id="START_TIME" value="${pd.START_TIME}" title="日期范围"/>
										<input type="text"  class="span10 date-picker" data-date-format="yyyy-mm-dd" name="END_TIME" id="END_TIME" value="${pd.END_TIME}" title="日期范围"/>
									</div>
									
									<!--<div class="float-l margin2-5">	
										<input id="USER_NAME" type="text" name="USER_NAME" value="${pd.USER_NAME}" placeholder="查询员姓名"/>
									</div>-->
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if>
								</td>
								<td class="align-right width-5">
									<!--<c:if test="${QX.add == 1 }">-->
									<!--<c:if test="${QX.downLoad == 1 }">-->
									<div class="btn-group">
										<a class="btn btn-green1 btn-mini" onclick="toExcel();" title="导出"><i style="font-size: 18px;" class="iconfont icon-xiazai"></i></a>
									</div>
									<div class="btn-group">
										<a class="btn btn-green1 btn-mini" onclick="javascript:document.execCommand('print')" title="打印"><i style="font-size: 18px;" class="menu-icon fa fa-hdd-o"></i></a>
									</div>
									<!--</c:if>-->
									<!--</c:if>-->
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class="center">被查询人姓名</th>
									<th class="center" dict-name="CRED_TYPE">证件类型</th>
									<th class="center">证件号码</th>
								    <th class="center" dict-name="find_reason_per">查询原因</th>
									<th class="center">查询申请人</th>
									<th class="center">内部授权人</th>
									<th class="center">查询员</th>
									<th class="center">查询用户号</th>
									<th class="center">机构名称</th>
									<th class="center">是否打印信用报告</th>
									<th class="center">查询时间</th>
									<th class="center">查询方式</th>
									<th class="center">是否查得</th>
									 <th class="center">影像资料</th>
									<th class="center">备注</th>
									<th class="center">操作</th>
								</tr> 
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>${vs.index+1}</td>
											<td class='center'>${var.CLIENT_NAME}</td>
											<td class='center'>${var.CREDENTIALS_TYPE}</td>
											<td class='center'>${var.CREDENTIALS_NO}</td>
											<td class='center'>${var.QUERY_REASON}</td>
											<td class='center'>${var.CUST_MANAGER}</td>
											<td class='center'>${var.CHECK_SYS_NAME}</td>
											<td class='center'>${var.USER_NAME}</td>
											<td class='center'>${var.SEARCHER_ID}</td>
											<td class='center'>${var.ORG_NAME}</td>
											<td class='center'>${var.IS_PRINT}</td>
											<td class='center'>${var.APPLICATION_TIME}</td>
											<td class='center'>${var.STATUS}</td>
											<td class='center'>${var.IS_GET}</td>
											 <td class='center'>
												<c:if test="${var.FLAG == 0}">
													全部缺失
												</c:if>
												<c:if test="${var.FLAG == 1}">
													全部上传
												</c:if>
												<c:if test="${var.FLAG == 2}">
													部分缺失
												</c:if>
											</td> 
											<td class='center'>${var.REMARKS}<input id="REMARKS" hidden type="text" name="REMARKS" value="${var.REMARKS}" placeholder="备注"/></td>
											<td class="center">
												<a>
													<i class="iconfont icon-bianji marginLR-10" title="备注" onclick="goRemark('${var.ID}')"></i>
												</a>	
												<a>
													<i class="iconfont icon-bianji marginLR-10" title="查看" onclick="edit('${var.ID}','${var.USER_SYS_ID}')"></i>
												</a>
												<a>
													<i class="iconfont icon-bianji marginLR-10" title="查看影像资料" onclick="view('${var.ID}')"></i>
												</a>
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

		str = document.getElementById("typev").value;
        obj = document.getElementById("sign");
        for(i=0;i<obj.length;i++){
            if(obj[i].value==str)
                obj[i].selected = true;
        }
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
		
		//导出excel
		function toExcel(){
		    var sign = $("#sign").val();
			var CLIENT_NAME = $("#CLIENT_NAME").val();
			var CREDENTIALS_TYPE = $("#CREDENTIALS_TYPE").val();
			var CREDENTIALS_NO = $("#CREDENTIALS_NUM").val();
			//var USER_NAME = $("#USER_NAME").val();
            var SEARCHER_ID = $("#SEARCHER_ID").val();
            var ORG_NAME = $("#ORG_NAME").val();
            var APPLICATION_TIME = $("#APPLICATION_TIME").val();
			var str='';
			for(var i=0;i < document.getElementsByName('ids').length;i++)
				{
					 if(document.getElementsByName('ids')[i].checked){
						if(str=='') str += document.getElementsByName('ids')[i].value;
						 else str += ',' + document.getElementsByName('ids')[i].value;
						}
				}
			window.location.href='<%=basePath%>PersonRegister/excel.do?CLIENT_NAME='+CLIENT_NAME+'&CREDENTIALS_TYPE='+CREDENTIALS_TYPE+'&CREDENTIALS_NO='+CREDENTIALS_NO+'&SEARCHER_ID='+SEARCHER_ID+'&ORG_NAME='+ORG_NAME+'&APPLICATION_TIME='+APPLICATION_TIME+'&sign='+sign;
		}
		//备注
		function goRemark(ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="备注";
			 diag.URL = '<%=basePath%>PersonRegister/goRemark.do?ID='+ID;
			 diag.Width = 500;
			 diag.Height = 300;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage('${page.currentPage}');
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		function edit(ID,USER_SYS_ID){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="查询申请";
			diag.URL = '<%=basePath%>HistoryInquery/getPerHistoryInfo.do?ID='+ID+'&USER_SYS_ID='+USER_SYS_ID;
			diag.Width = 510;
			diag.Height = 300;
			diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			};
			diag.show();
		}
		function view(ID){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="影像资料";
			diag.URL = '<%=basePath%>PersonRegister/view.do?ID='+ID;
			diag.Width = 600;
			diag.Height = 300;
			diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			};
			diag.show();
		}
	</script>


</body>
</html>