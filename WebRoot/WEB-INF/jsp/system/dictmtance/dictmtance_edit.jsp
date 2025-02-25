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
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12 no-padding">
					
					<form action="dictmtance/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DIC_CODE1" id="DIC_CODE1" value="${pd.DIC_CODE1}"/>
						<div id="zhongxin">
						<table id="table_report" class="table table-striped" >
							<tr>
								<td class="align-right paddingt-13 width-30">编码:<span class="red ">*</span></td>
								<td class="paddingt-13"><input type="text" name="DIC_CODE" id="DIC_CODE" value="${pd.DIC_CODE}" maxlength="100" placeholder="这里输入字典编码" title="字典编码" class="width-75" onblur="hasD();" <c:if test="${null != pd.DIC_CODE}">readonly="readonly" disabled</c:if>/></td>
							</tr>
							<tr>
								<td class="align-right">名称:<span class="red ">*</span></td>
								<td><input type="text" name="DIC_DES" id="DIC_DES" value="${pd.DIC_DES}" maxlength="100" placeholder="这里输入字典名称" title="字典名称" class="width-75"/></td>
							</tr>
							<!--  <tr>
								<td class="align-right">字典类型:</td>
								<td><input type="text" name="DIC_TYPE" id="DIC_TYPE" value="${pd.DIC_TYPE}" maxlength="1" placeholder="这里输入字典类型" title="字典类型" class="width-75"/></td>
							</tr>-->
							<tr>
								<td class="align-right">来源表:<span class="red ">*</span></td>
								<td><input type="text" name="DIC_TBLNAME" id="DIC_TBLNAME" value="${pd.DIC_TBLNAME}" maxlength="30" placeholder="这里输入字典来源表" title="字典来源表" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">过滤条件列:<span class="red ">*</span></td>
								<td><input type="text" name="DIC_ID_COLNAME" id="DIC_ID_COLNAME" value="${pd.DIC_ID_COLNAME}" maxlength="30" placeholder="这里输入字典对应的过滤条件列" title="字典对应的过滤条件列" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">条件列取值:<span class="red ">*</span></td>
								<td><input type="text" name="DIC_IDVALUE" id="DIC_IDVALUE" value="${pd.DIC_IDVALUE}" maxlength="35" placeholder="这里输入字典列对应的过滤条件列取值" title="字典列对应的过滤条件列取值" class="width-75"/></td>
							</tr> 
							<tr>
								<td class="align-right">取值列:<span class="red ">*</span></td>
								<td><input type="text" name="DIC_VAL_COLNAME" id="DIC_VAL_COLNAME" value="${pd.DIC_VAL_COLNAME}" maxlength="30" placeholder="这里输入字典列对应的取值列" title="字典列对应的取值列" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">取值名称:<span class="red ">*</span></td>
								<td><input type="text" name="DIC_DES_COLNAME" id="DIC_DES_COLNAME" value="${pd.DIC_DES_COLNAME}" maxlength="30" placeholder="这里输入字典列对应的描述列" title="字典列对应的描述列" class="width-75"/></td>
							</tr>
							<!-- 
							<tr>
								<td class="align-right">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="100" placeholder="这里输入备注" title="备注" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">排序字段:</td>
								<td><input type="text" name="DIC_SORT_COLNAME" id="DIC_SORT_COLNAME" value="${pd.DIC_SORT_COLNAME}" maxlength="30" placeholder="这里输入排序字段" title="排序字段" class="width-75"/></td>
							</tr> -->
							<!--<tr>
								<td class="align-right">是否动态获取:</td>
								<td><input type="text" name="DIC_DYNAMIC_SIGN" id="DIC_DYNAMIC_SIGN" value="${pd.DIC_DYNAMIC_SIGN}" maxlength="1" placeholder="这里输入是否动态获取" title="是否动态获取" class="width-75"/></td>
							</tr>-->
							<!--<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>-->
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
					<div class="footfix">
							<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
							<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
						</div>
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" class="width50" /><br/><h4 class="lighter block green"></h4></div>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#DIC_CODE").val()==""){
				$("#DIC_CODE").tips({
					side:3,
		            msg:'请输入字典编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DIC_CODE").focus();
			return false;
			}
			if($("#DIC_DES").val()==""){
				$("#DIC_DES").tips({
					side:3,
		            msg:'请输入字典名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DIC_DES").focus();
			return false;
			}
			if($("#DIC_TBLNAME").val()==""){
				$("#DIC_TBLNAME").tips({
					side:3,
		            msg:'请输入字典来源表',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DIC_TBLNAME").focus();
			return false;
			}
			if($("#DIC_VAL_COLNAME").val()==""){
				$("#DIC_VAL_COLNAME").tips({
					side:3,
		            msg:'请输入字典列对应的取值列',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DIC_VAL_COLNAME").focus();
			return false;
			}
			if($("#DIC_DES_COLNAME").val()==""){
				$("#DIC_DES_COLNAME").tips({
					side:3,
		            msg:'请输入字典列对应的描述列',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DIC_DES_COLNAME").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		//判断柜员号是否存在
		function hasD(DIC_CODE){
		var DIC_CODE = $.trim($("#DIC_CODE").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>dictmtance/hasD.do',
	    	data: {DIC_CODE:DIC_CODE,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#DIC_CODE").tips({
							side:3,
				            msg:'编号 '+DIC_CODE+' 已存在',
				            bg:'#AE81FF',
				            time:2
				        });
					 $("#DIC_CODE").val('');
				 }
			}
		});
	}
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>