<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="">
						<form action="role/${msg}.do" name="form1" id="form1"  method="post">
						<input type="hidden" name="ROLE_ID" id="id" value="${pd.ROLE_ID}"/>
					<%-- 	<input name="PARENT_ID" id="parent_id" value="${pd.parent_id }" type="hidden"> --%>
							<div id="zhongxin" class="paddingt-13">
							<table style="width:auto;" class="table table-striped ">
								<tr >
									<td class="align-right paddingt-13 width-30">角色名称(中文):<span class="red ">*</span></td>
									<td><input type="text" name="ROLE_NAME" id="ROLE_NAME" placeholder="这里输入角色名称" value="${pd.ROLE_NAME}"  title="名称" class="width-90" onblur="hasR()"/></td>
								</tr>
								<tr >
									<td class="align-right ">角色名称(英文):<span class="red ">*</span></td>
									<td><input type="text" name="ROLE_NAME_EN" id="ROLE_NAME_EN" placeholder="这里输入角色英文名称" value="${pd.ROLE_NAME_EN}"  title="名称" class="width-90"/></td>
								</tr>
								<tr >
									<td class="align-right">角&nbsp;&nbsp;&nbsp;色&nbsp;&nbsp;描&nbsp;&nbsp;&nbsp;述:</td>
									<td><textarea  rows="3" cols="46" name="ROLE_DESC" id="ROLE_DESC" placeholder="这里输入角色描述" title="名称" class="width-90">${pd.ROLE_DESC}</textarea></td>
								</tr>
							</table>
							</div>
							<div class="footfix">
									<!-- <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> -->
									<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
									<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a>
							</div>
						</form>
					
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
	<%@ include file="../index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
	top.hangge();
	//保存
	function save(){
		if($("#ROLE_NAME").val()==""){
			$("#ROLE_NAME").tips({
				side:3,
	            msg:'请输入',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ROLE_NAME").focus();
			return false;
		}
		if($("#ROLE_NAME_EN").val()==""){
			$("#ROLE_NAME_EN").tips({
				side:3,
	            msg:'请输入',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ROLE_NAME_EN").focus();
			return false;
		}
			$("#form1").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	}
	
	//判断用户id是否存在
	function hasR(){
		if($('#ROLE_NAME').attr('readonly') == 'readonly'){
			return;
		}
		if($("#ROLE_NAME").val()==""){
			$("#ROLE_NAME").tips({
				side:3,
	            msg:'请输入',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ROLE_NAME").focus();
			return;
		}
		var ROLE_NAME = $('#ROLE_NAME').val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>role/hasR.do',
	    	data: {ROLE_NAME:ROLE_NAME},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#ROLE_NAME").tips({
							side:3,
				            msg:'角色 ' + ROLE_NAME + ' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#ROLE_NAME").val('');
				 }
			}
		});
	}
	</script>
</body>
</html>

