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
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<link type="text/css" rel="stylesheet" href="plugins/zTree/2.6/zTreeStyle.css"/>
	<script type="text/javascript" src="plugins/zTree/2.6/jquery.ztree-2.6.min.js"></script>
	<style type="text/css">
	footer{height:50px;position:fixed;bottom:0px;left:0px;width:100%;text-align: center;}
	</style>
<body>

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
							<div id="zhongxin">
								<div style="overflow:auto;height:415px;width:400px;text-align:center;">
								<ul id="tree" class="tree" style="overflow:auto;"></ul>
								</div>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">正在保存...</h4></div>
							</div>
						<!-- /.col -->
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	
		<footer style="padding-top:13px;border-top:1px solid #cccccc;"  >
			<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
			<!-- <a class="btn btn-mini btn-primary" onclick="save();">保存</a> -->
			<a class="btn btn-size1 btn-default" style="margin-left:30px;" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a>
		</footer>
	
	<script type="text/javascript">
		$(top.hangge());
		var zTree;
		$(document).ready(function(){
			
			var setting = {
			    showLine: true,
			    checkable: true
			};
			var zn = '${zTreeNodes}';
			var zTreeNodes = eval(zn);
			console.log(zTreeNodes);
			zTree = $("#tree").zTree(setting, zTreeNodes);
			// var ids ="${ID}";
			// ids = ids.replace("[", "");
			// ids = ids.replace("]", "");
			// id = ids.split(",");
			// for(var i=0;i<id.length;i++){
			// 	var node = zTree.getNodeByParam("id",id[i].trim());
			// 	node.checked = true;
			// 	zTree.updateNode(node);
			// }
		});
	
		//保存
		 function save(){
	 	// 	function filter(node) {
	  //  			return (node.checked==true||node.check_Child_State==1);
			// }
			// var checkedNotes =zTree.getNodesByFilter(filter);
			
			var checkedNotes = zTree.getCheckedNodes(true);

			var roleId=  "${ROLE_ID}";
			var resoIds = [];
			var resoAllInfos = [];
			$.each(checkedNotes, function(i, item){
				resoIds[i] = {};
				resoIds[i].id = checkedNotes[i].id;

				var resoAllInfo = {};
				if(!checkedNotes[i].isParent){
					resoAllInfo.id=checkedNotes[i].id;
					resoAllInfo.menuId =checkedNotes[i].parentId;
					resoAllInfo.funGroupId =checkedNotes[i].menuGroupId;
					resoAllInfo.funId =checkedNotes[i].funId;
				}else{
					resoAllInfo.id=checkedNotes[i].id;
					resoAllInfo.menuId =checkedNotes[i].id;
					resoAllInfo.funGroupId = '#';
					resoAllInfo.funId = '#';
				}
				resoAllInfos.push(resoAllInfo);
			});
			
			var url = "<%=basePath%>role/saveMenuqx.do";
			var postData;
			postData = {"roleId":roleId,"resoIds":JSON.stringify(resoIds),"resoAllInfo":JSON.stringify(resoAllInfos)};
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			$.post(url,postData,function(data){
				top.Dialog.close();
			});
		 }
	
	</script>
</body>
</html>