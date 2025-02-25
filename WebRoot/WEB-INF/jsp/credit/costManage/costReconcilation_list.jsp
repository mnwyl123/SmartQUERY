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
<style>
	input {
    width: 180px;
    height: 35px;
}
</style>
<body class="no-skin">

<div class="main-container" id="main-container">
	<form action="costManage/getCRlistPage.do?menuId=61" name="Form" id="Form" method="post">
		<table style="margin:10px auto auto 10px;">
			<tr>
				<td class="align-left width-70">
				<!--	<div class="float-l date-icon margin2-5">
						<span>数据日期:</span>
						<input class="span10 date-picker" name="QUERYTIME" id="QUERYTIME" type="text" value="${pd.QUERYTIME}" data-date-format="yyyy-mm" readonly="readonly" style="width:140px;" placeholder="反馈日期" />						
					</div>-->
					<div class="float-l margin2-5">	
									    <span>开始日期:</span>
										<input type="text"  class="span10 date-picker" data-date-format="yyyy-mm-dd" name="START_DATE" value="${pd.START_DATE}" id="START_DATE" title="开始日期"/>
									</div> 
									<div class="float-l margin2-5">	
									    <span>&nbsp;&nbsp;结束日期:</span>
										<input type="text"  class="span10 date-picker" data-date-format="yyyy-mm-dd" name="END_DATE" value="${pd.END_DATE}" id="END_DATE"  title="结束日期"/>
									</div>
							 	  <div class="float-l margin2-5">
									    <span>&nbsp;&nbsp;产品名称:</span>
									    <select  style="width:180px;" name="product_id" id="product_id"data-placeholder="请选择产品" >
										<option value="">请选择产品名称</option>
										<c:forEach items="${orgList}" var="pro">
													<option value="${pro.product_id}" <c:if test="${pro.product_id==pd.product_id}"> selected="selected"</c:if>>
														${pro.product_name}
													</option>
												</c:forEach>
										</select>
									</div>
									
					<div class="float-l btn-group">
					   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
					</div>
				</td>
			</tr>
		</table>
		<hr />
		<table id="table_report" class="table table-striped table-hover" style="margin:0 auto;width:30%;table-layout:fixed;background-color:#CBDDF3">
		 <tr>
				<td align="right">产品名称:</td>
				<td align="left""><input type="text" id="DATA_DATE" name="DATA_DATE" value="${crObject.NAME}" readonly></td>
			</tr>
			<tr>
				<td align="right">企业查询笔数:</td>
				<td align="left"><input type="text" id="ORGQUERYCNT" name="ORGQUERYCNT" value="${crObject.ORGQUERYCNT}" readonly></td>
			</tr>
			<tr>
				<td align="right">个人查询笔数:</td>
				<td align="left"><input type="text" id="PERQUERYCNT" name="PERQUERYCNT" value="${crObject.PERQUERYCNT}" readonly></td>
			</tr>
<%-- 			<tr>
				<td align="right">总笔数:</td>
				<td align="left"><input type="text" id="QUERYCNT" name="QUERYCNT" value="${crObject.QUERYCNT}" readonly></td>
			</tr> --%>
			<tr>
				<td align="right">企业每笔费用:</td>
				<td align="left">
					<!--<c:if test="${not empty crObject.ORGQUERYCOST}">
						<input type="text" id="ORGQUERYCOST" name="ORGQUERYCOST" value="${crObject.ORGQUERYCOST}" readonly>
					</c:if>
					<c:if test="${empty crObject.ORGQUERYCOST}">
						<input type="text" id="ORGQUERYCOST" name="ORGQUERYCOST" value="${crObject.ORGQUERYCOST}">
					</c:if>-->
					<input type="text" style="font-size:12px" placeholder="查询笔数为0时，不能输入" id="ORGQUERYCOST" name="ORGQUERYCOST" value="${crObject.ORGQUERYCOST}">
				</td>
			</tr>
			<tr>
				<td align="right">个人每笔费用:</td>
				<td align="left">
					<!--
					不为空，只读，否则，可写
					<c:if test="${not empty crObject.PERQUERYCOST}">
						<input type="text" id="PERQUERYCOST" name="PERQUERYCOST" value="${crObject.PERQUERYCOST}" readonly>
					</c:if>
					<c:if test="${empty crObject.PERQUERYCOST}">
						<input type="text" id="PERQUERYCOST" name="PERQUERYCOST" value="${crObject.PERQUERYCOST}">
					</c:if>-->
					<input type="text" style="font-size:12px" placeholder="查询笔数为0时，不能输入" id="PERQUERYCOST" name="PERQUERYCOST" value="${crObject.PERQUERYCOST}">
				</td>
			</tr>
			<tr>
				<td align="right">总费用:</td>
				<td align="left"><input type="text" id="QUERYCOST" name="QUERYCOST" value="${crObject.QUERYCOST}" readonly></td>
			</tr>
		</table>		
	</form>
</div>
<div style="margin:20px auto;width:130px" >
	<!--<c:if test="${empty crObject.ORGQUERYCOST || empty crObject.PERQUERYCOST}">
		<a class="btn btn-orange btn-size1 b" onclick="save();" id="btn">计&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;算</a>
	</c:if>-->
	<c:if test="${QX.calculate == 1 }">
	<a class="btn btn-orange btn-size1 b" onclick="save();" id="btn">计&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;算</a>
	</c:if>
</div>
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp"%>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<!-- 没有选中时的提示框 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
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
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
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
		var msg="";
		var start_date = $("#START_DATE").val(),
		    end_date = $("#END_DATE").val();
		if(start_date>end_date){
			$("#END_DATE").tips({
				side:3,
	            msg:'结束日期必须大于开始日期！',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#END_DATE").focus();
			return false;
		}
		if( msg==""){
			    top.jzts();
				$("#Form").submit();
		}
		   
	}
	//计算
	function save(){
		var DATA_DATE = $("#DATA_DATE").val(),
			product_id = $("#product_id").val(),
			ORGQUERYCNT = $("#ORGQUERYCNT").val(),
			PERQUERYCNT = $("#PERQUERYCNT").val(),
			QUERYCNT = $("#QUERYCNT").val(),
			ORGQUERYCOST = $("#ORGQUERYCOST").val(),
			PERQUERYCOST = $("#PERQUERYCOST").val(),
			QUERYCOST = $("#QUERYCOST").val();
		var json = {"DATA_DATE":DATA_DATE,"product_id":product_id,"ORGQUERYCNT":ORGQUERYCNT,"PERQUERYCNT":PERQUERYCNT,"QUERYCNT":QUERYCNT,"ORGQUERYCOST":ORGQUERYCOST,"PERQUERYCOST":PERQUERYCOST,"QUERYCOST":QUERYCOST};
		$.ajax({
			type:"POST",
			url:'<%=basePath%>costManage/updateCR.do?menuId=61',
			data:json,
			datatype:"json",
			success:function(data){
				var msg = "";
				if("success" == (data.msg)){
					msg="计算成功";
					$("#Form").submit();
				}else{
					msg="计算失败!";
				}
				bootbox.dialog({
					message: "<span class='bigger-110'>"+msg+"</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				})
			}
		});
	}
</script>
</body>
</html>