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
	<link href="css/imgUp/common.css" type="text/css" rel="stylesheet"/>
	<link href="css/imgUp/index.css" type="text/css" rel="stylesheet"/>
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
					<form action="personObjection/${msg}.do?" name="Form" id="Form" method="post">
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
							<input type="hidden" type="text" id="ID" name="ID" value="${pd.ID}"/>
							<input type="hidden" id="BTN_TYPE" name="BTN_TYPE" />
							<tr>
								<td class="align-right width-25">个人姓名:<span class="red ">*</span></td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" title="个人姓名" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">个人证件类型:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" dict-name="CRED_TYPE" default-value="${pd.IDTYPE}" name="IDTYPE" id="IDTYPE">  
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">个人证件号码:<span class="red ">*</span></td>
								<td><input type="text" name="IDNUM" id="IDNUM" value="${pd.IDNUM}" maxlength="255"  title="个人证件号码" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">定位信息:</td>
								<td class="width-75">
									<c:forEach items="${dict}" var="var" varStatus="vs">
										<label><input type="checkbox" name="LOCATEINFTYPE" value="${var.key}" <c:if test="${var.checked == 'true'}">checked="checked"</c:if>/>${var.value}</label>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">异议说明:<span class="red ">*</span></td>
								<td><input type="text" name="OBJDESC" id="OBJDESC" value="${pd.OBJDESC}" maxlength="255" title="异议说明" class="width-75"/></td>
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
<div class="center">
	<c:if test="${admin == '1'}">
	<a class="btn btn-orange btn-size1 b" onclick="save('1');" id="btn" style="margin-left:50px;<c:if test='${pd.ID == null}'>margin-left:100px;</c:if>">保存并上报</a>
	</c:if>
	<a class="btn btn-orange btn-size1 b" onclick="save('2');" id="btn">保&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</a>
	<c:if test="${pd.ID != null && admin == '1' }">
	<a class="btn btn-orange btn-size1 b" onclick="save('3');" id="btn">上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;报</a>
	</c:if>
	<a class="btn btn-size1 btn-default b" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
</div>
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--<script src="js/common/jquery-1.7.2.js"></script>-->
	<script src="js/common/imgUp.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		dict.init({ids:['IDTYPE']});
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
			var id=obj.id;
		}
		//保存
		function save(type){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入个人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
				return false;
			}
			if($("#IDTYPE").val()==""){
				$("#IDTYPE").tips({
					side:3,
		            msg:'请输入个人证件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IDTYPE").focus();
				return false;
			}
			if($("#IDNUM").val()==""){
				$("#IDNUM").tips({
					side:3,
		            msg:'请输入个人证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IDNUM").focus();
				return false;
			}
			var IDNUM=$("#IDNUM").val();
						if($("#IDNUM").val()!=""&&($("#IDTYPE").val()=="0"||$("#IDTYPE").val()=="10")){
							var reg = /(^(\d{6}(([1-9]\d{3}((01|0[3-9])|(1[0-2]))((0[1-9])|([1|2]\d)|(3[0-1])))|([1-9]\d{3}02((0[1-9])|([12]\d))))\d{3}[0-9Xx])$)|(^(\d{6}((\d{2}((01|0[3-9])|(1[0-2]))((0[1-9])|([1|2]\d)|(3[0-1])))|([1-9]\d{3}02((0[1-9])|([12]\d))))\d{3})$)/;
							if(!IDNUM.match(reg)){
								$("#IDNUM").tips({
									side:3,
									msg:'请输入正确的证件号码',
									bg:'#AE81FF',
									time:2
								});
								$("#IDNUM").focus();
								return false;
							}
						}
			
			if($("#OBJDESC").val()==""){
				$("#OBJDESC").tips({
					side:3,
		            msg:'请输入异议说明',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OBJDESC").focus();
				return false;
			}
			$("#BTN_TYPE").val(type);
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
	</script>
</body>
</html>