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
<%@ include file="../index/top.jsp"%>
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
						<div class="col-xs-12">
							<form action="user/readExcel.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
								<div id="zhongxin">
								<table style="width:95%;" >
									<tr>
										<td style="padding-top: 20px;"><input type="file" id="excel" name="excel" style="width:50px;" onchange="fileType(this)" /></td>
									</tr>
									
									<tr>
										<td class="center" style="padding-top: 200px;"><span class="red ">登录编码唯一，重复信息不会上传！！！</span></td>
									</tr>
									<%-- <tr>
										<td style="text-align: center;padding-top: 10px;">
											<a class="btn btn-mini btn-success" onclick="window.location.href='<%=basePath%>/user/downExcel.do'">下载模版</a>
											<a class="btn btn-mini btn-primary" onclick="save();">导入</a>
											<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											<a class="btn btn-mini btn-success" onclick="window.location.href='<%=basePath%>/user/downExcel.do'">下载模版</a>
										
										 </td>
									</tr> --%>
								</table>
								</div>
								<div style="bottom: 190px;position: fixed;margin-left:260px;">
								<!-- -->
								    <a onclick="window.location.href='<%=basePath%>/user/downExcel.do'" onmouseover="pic1(this);" onmouseout="pic2(this);"><i id ="changePic" class="iconfont icon-moban bigger-190 green1" style="width:35px;height:35px;"></i><span style="font-size:12px;position: relative;top:20px;left:-40px;color: #595959;">数据模板</span> </a>
								</div>
								<div style="padding-top:13px;border-top:1px solid #cccccc;height:60px;position:fixed;bottom:0px;left:0px;width:100%;" class="center">
									<button type="submit" class="btn btn-orange btn-size1" onclick="save();">导&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;入</button>
									<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
								</div>
								<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
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

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
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
			$('#excel').ace_file_input({
				no_file:'请选择EXCEL ...',
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
		
		function pic1(obj){
			$("#changePic").removeClass("icon-moban");
			$("#changePic").addClass("icon-ordinarydownload");
			$("#changePic").css("background-color","#8b9aa3");
			$("#changePic").css("color","#ffffff");
		}
		function pic2(obj){
			$("#changePic").addClass("icon-moban");
			$("#changePic").removeClass("icon-ordinarydownload");
			$("#changePic").css("background-color","#ffffff");
			$("#changePic").css("color","#3fb8ae");
		}
		//保存
		function save(){
			$("#Form").ajaxForm({
				success:function(data){
					if(data.msg=="success"){
						document.getElementById('zhongxin').style.display = 'none';
						top.Dialog.close();
					}else if(data.msg=="uInfo"){
						bootbox.dialog({
							message: "<span class='bigger-110'>"+data.RuserName+"</span>",
							buttons: 			
							{ 
								"button":
									{ 
										"label":"确定", 
										"className":"btn-sm btn-success",
										"callback": function() {
											document.getElementById('zhongxin').style.display = 'none';
											top.Dialog.close();
										}
									}
							}
						});
					}else if(data.msg=="error"){
						bootbox.dialog({
							message: "<span class='bigger-110'>请选择.xls格式文件</span>",
							buttons: 			
							{ 
								"button":
									{ 
										"label":"确定", 
										"className":"btn-sm btn-success"
									}
							}
						});
					}else{
						top.Dialog.close();
					}
				},
				error:function(){
					$("#zhongxin2").hide();
				}
			});
			//$("#zhongxin").hide();
			//$("#zhongxin2").show();
		}
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
		    if(fileType != '.xls'){
		    	$("#excel").tips({
					side:3,
		            msg:'请上传xls格式的文件',
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#excel").val('');
		    	document.getElementById("excel").files[0] = '请选择xls格式的文件';
		    }
		}
	</script>


</body>
</html>