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

<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">

</head>
<style>
	.ace-file-input .ace-file-container {
		height:31px;
	}
	.margin-30{
		margin:30px;
	}
</style>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
			<!--	<div class="page-content">-->
					<div class="row">
						<div class="col-xs-12" style="height:90%;">
							<form action="createReport/parseReport.do?menuId=65" name="Form" id="Form" method="post" enctype="multipart/form-data" >
								<div id="zhongxin" style="border:1px solid #ccc;width:60%;padding:5%;height:50%;margin:10% auto; background-color:#B1D2EA">
									<div class="row margin-30">
									     <div class="col-xs-3 align-right">
										    法人机构：
										 </div>
										 <div class="col-xs-9">
										    <input type="text" id="frOrg" name="frOrg" value="${frOrg}" style="width:100%" readOnly/>
										 </div>
									</div>
									<div class="row margin-30">
									     <div class="col-xs-3 align-right">
										    反馈报文上传：
										 </div>
										 <div class="col-xs-9">
										    <input type="file" id="enc" name="enc" onchange="fileType(this)" />
										 </div>
									</div>
									<div class="row">
									    <div class="col-xs-7 align-right">
										    <button type="submit" class="btn btn-orange btn-size1" onclick="save();">导&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;入</button>
										</div>
										<div class="col-xs-5">
										   <a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
										</div>
									</div>
								</div>
								<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
							</form>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				<!--</div>
				 /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 上传控件 -->
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="static/js/jquery.form.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//上传
			$('#enc').ace_file_input({
				no_file:'请选择enc ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'xls|xls',
				blacklist:'gif|png|jpg|jpeg'
				//onchange:''
			});
		});
		
		//保存
		function save(){
			top.jzts();
			$("#Form").ajaxForm({
				dataType:'json',
				success:function(data){
					$(top.hangge());
					var msg = "";
					 if("success" == (data.msg)){
						 msg="报文解析成功!";
					 }else if("error" == (data.msg)){
						 msg="报文解析失败!";
					 }else if("nofile" == (data.msg)){
						 msg="请选择.enc文件或.txt文件!";
					 }else if("error_jm" == (data.msg)){
						 msg=".enc文件解密失败!";
					 }else if("error_jy" == (data.msg)){
						 msg=".enc文件解压失败!";
					 }
					 bootbox.dialog({
							message: "<span class='bigger-110'>"+msg+"</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
				},
				error:function(){
					$("#zhongxin2").hide();
				}
			});
			
			
		}
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
			var sucOrErr = obj.value.substr(obj.value.lastIndexOf(".")-1,1).toLowerCase();
		    if(fileType != '.enc' && fileType != ".txt"){
		    	$("#enc").tips({
					side:3,
		            msg:'请上传后缀为.enc或.txt格式的文件',
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#enc").val('');
		    	document.getElementById("enc").files[0] = '请选择后缀为.enc或.txt格式的文件';
		    }
			if(sucOrErr != 'r' && sucOrErr != 'e'){
				$("#enc").tips({
					side:3,
		            msg:"上传文件的文件名应该以r或者e结尾",
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#enc").val('');
		    	document.getElementById("enc").files[0] = '请选择后缀为.enc或.txt格式的文件';
		    }
		}
	</script>

</body>
</html>