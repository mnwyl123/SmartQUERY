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
						<form action="role/roleList.do" method="post" name="Form" id="Form">
						<div class="float-l margin-5">
							<c:if test="${QX.query == 1 }">
									<div class="nav-search float-l">
										<span class="input-icon">
											<input type="text" placeholder="搜&nbsp;索..." class="nav-search-input" id="keywords" name="keywords" autocomplete="off" value="${page.pd.keywords }" />
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								  <div class="float-l btn-group">
									   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="gsearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</c:if>
							</div>
							<div class="float-r margin-5">
							<c:if test="${QX.add == 1 }">
								<div class="btn-group">
										<a class="btn btn-mini btn-orange" onclick="addRole('${pd.ROLE_ID }');" title="新建角色">
											<i class="iconfont icon-tianjia"></i>
										</a>
								</div>
							</c:if>
							</div>
							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class='center'>角色中文名称</th>
									<th class='center'>角色英文名称</th>
									<th class='center'>角色描述</th>
									<th class="center width-10">操作</th>
								</tr>
								</thead>
								<c:choose>
									<c:when test="${not empty roleList_z}">
									 <c:if test="${QX.query == 1 }">
										<c:forEach items="${roleList_z}" var="var" varStatus="vs">
										<tr>
											<td class='center'>${vs.index+1}</td>
											<td id="ROLE_NAMETd${var.ROLE_NAME}">${var.ROLE_NAME}</td>
											<td id="ROLE_NAME_ENTd${var.ROLE_NAME_EN }">${var.ROLE_NAME_EN}</td>
											<td id="ROLE_DESCTd${var.ROLE_DESC}">${var.ROLE_DESC}</td>
											<td class="center width-10">
											<c:if test="${QX.edit != 1 && QX.delete != 1 && QX.editRights != 1}">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
											</c:if>
											 <div class="action-buttons">
											 <c:if test="${QX.editRights == 1 }">
												 <a  href="javascript:editRights('${var.ROLE_ID }');"> 
												<i class="iconfont icon-quanxianguanli green1" style="cursor: pointer;" title="授权菜单"></i>
												</a>
											</c:if>
											<c:if test="${QX.edit == 1 }">
												<a  href="javascript:editRole('${var.ROLE_ID }');"> 
												<i class='iconfont icon-bianji red1 marginLR-10' title="编辑"></i>
												</a>
											</c:if>
											<c:if test="${QX.delete == 1 }"> 
												 <a  href="javascript:delRole('${var.ROLE_ID }','c','${var.ROLE_NAME }');"> 
												 <i class='iconfont icon-shape7 green2' style="cursor: pointer;" title="删除"></i>
												</a>
											</c:if>
											</div>
											</td>
										</tr>
										</c:forEach>
										</c:if>
										<c:if test="${QX.query != 1 }"> 
 											<tr>
												<td colspan="100" class="center">您无权查看</td>
											</tr> 
									  </c:if>
									</c:when>
									<c:otherwise>
										<tr>
										<td colspan="100" class="center" >没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<div class="page-header position-relative">
								<table class="width-100">
									<tr>
										<td class="align-top center"><div class="pagination">${page.pageStr}</div></td>
									</tr>
								</table>
							</div>
							</form>
						</div>
					</div>
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
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
		function gsearch(){
			top.jzts();
			$("#Form").submit();
		}
		//新增组
		function addRole(pid){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>role/toAdd.do';
			 diag.Width = 500;
			 diag.Height = 275;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editRole(ROLE_ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>role/toEdit.do?ROLE_ID='+ROLE_ID;
			 diag.Width = 500;
			 diag.Height = 275;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts();
					setTimeout("self.location.reload()",100);
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delRole(ROLE_ID,msg,ROLE_NAME){
			bootbox.confirm("确定要删除["+ROLE_NAME+"]吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>role/delete.do?ROLE_ID="+ROLE_ID+"&guid="+new Date().getTime();
					top.jzts();
					$.get(url,function(data){
						if("success" == data.result){
							if(msg == 'c'){
								top.jzts();
								document.location.reload();
							}else{
								top.jzts();
								window.location.href="role.do";
							}
							
						}/* else if("false" == data.result){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败，请先删除下级角色!</span>",
								buttons: 			
								{
									"button" :
									{
										"label" : "确定",
										"className" : "btn-sm btn-success"
									}
								}
							});
						} */else if("error" == data.result){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败，此角色已被使用!</span>",
								buttons: 			
								{
									"button" :
									{
										"label" : "确定",
										"className" : "btn-sm btn-success"
									}
								}
							});
						}
					});
				}
			});
		}
		
		//菜单权限
		function editRights(ROLE_ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "菜单权限";
			 diag.URL = '<%=basePath%>role/menuqx.do?ROLE_ID='+ROLE_ID;
			 diag.Width = 400;
			 diag.Height = 475;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//按钮权限(增删改查)
	<%-- 	function roleButton(ROLE_ID,msg){
			top.jzts();
			if(msg == 'add_qx'){
				var Title = "授权新增权限(此角色下打勾的菜单拥有新增权限)";
			}else if(msg == 'del_qx'){
				Title = "授权删除权限(此角色下打勾的菜单拥有删除权限)";
			}else if(msg == 'edit_qx'){
				Title = "授权修改权限(此角色下打勾的菜单拥有修改权限)";
			}else if(msg == 'cha_qx'){
				Title = "授权查看权限(此角色下打勾的菜单拥有查看权限)";
			}
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = Title;
			 diag.URL = '<%=basePath%>role/b4Button.do?ROLE_ID='+ROLE_ID+'&msg='+msg;
			 diag.Width = 330;
			 diag.Height = 450;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		} --%>
	</script>


</body>
</html>