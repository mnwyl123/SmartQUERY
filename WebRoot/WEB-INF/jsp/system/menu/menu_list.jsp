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
	<script type="text/javascript">

	</script>
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
							<form action="menu.do" method="post" name="Form" id="Form">
							<table class="margin-5 width-100">
							<tr>
								<td class="searchM align-left width-50">
								<c:if test="${QX.query == 1 }">
									<div class="nav-search" style="float:left;">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" id="keywords" value="${page.pd.keywords }" placeholder="搜&nbsp;索..." />
										<i class="ace-icon fa fa-search nav-search-icon" onclick="searchs();"></i>
									</span>
									</div>
									<div style="float:left;">
									  <select name="MENU_ID" id="MENU_ID">
										<option value="${MENU_ID}" <c:if test="${MENU_ID != ''}">selected</c:if>>本级</option>
										<option value="" <c:if test="${MENU_ID == ''}">selected</c:if>>全部</option>
									</select>
									</div>
									<div style="float:left;" class="btn-group">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="gsearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if>
								</td>
								<td class="align-right width-50">
									<c:if test="${QX.add == 1 }">
								     <div class="btn-group">
											<a class="btn btn-mini btn-orange" onclick="addmenu('${MENU_ID}');" ><i class="iconfont icon-tianjia" title="新增"></i></a>
									</div>
									</c:if>
									<c:if test="${null != pd.PARENT_ID && pd.PARENT_ID != ''}">
									<div class="btn-group">
										<a class="btn btn-mini btn-orange" onclick="goSonmenu('${pd.PARENT_ID}');">
											<i class="iconfont icon-fanhui"></i>
										</a>
									</div>
									</c:if>
								</td>
							</tr>
						</table>
							

							<table id="dynamic-table" class="table table-striped table-bordered table-hover" >
								<thead>
									<tr>
										<th class="center width50">序号</th>
										<th class='center'>名称</th>
										<th class='center'>资源路径</th>
										<th class='center' dict-name="menuType" >菜单类型</th>
										<th class='center'>交易码</th>
										<th class='center' dict-name="menuChannel">菜单渠道</th>
										<th class='center width50'>状态</th>
										<th class='center'>法人</th>
										<th class='center width-15'>操作</th>
									</tr>
								</thead>

								<tbody>
								<c:choose>
									<c:when test="${not empty menuList}">
									<c:if test="${QX.query == 1 }">
									<c:forEach items="${menuList}" var="menu" varStatus="vs">
									<tr>
										<td class='center' >${vs.index+1}</td>
										<td class='center'><i class="${menu.menuName }">&nbsp;</i>
											<a href="javascript:goSonmenu('${menu.menuId }')">${menu.menuName }&nbsp;<i class="iconfont icon-chakanxiaji orange1 "></i></a>
										</td>
										<td class='center'>${menu.menuUrl}</td>
										<td class='center'><span>${menu.menuType}</span></td>
										<td class='center'>${menu.tranCode}</td>
										<td class='center'><span>${menu.menuChannel}</span></td>
										<td class='center'><i class="grey1 iconfont ${menu.menuState == 1? 'icon-show': 'icon-yincang'}"></i></td>
										<td class='center'>${menu.company}</td>
										<td class='center' >
										 <c:if test="${menu.company != 'ALL' || USERNAME == 'super'}">
										 	<c:if test="${QX.edit != 1 && QX.delete != 1 && QX.editIcon != 1}">
												<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
											</c:if>
											<div class="hidden-sm hidden-xs action-buttons">
												<c:if test="${QX.editIcon == 1 }">
												<a  href="javascript:editTb('${menu.menuId }');"> 
												<i class="iconfont icon-tupiantubiao purple1" title="编辑图标"></i>
												</a>
												</c:if>
												<c:if test="${QX.edit == 1 }"> 
												<a  href="javascript:editmenu('${menu.menuId }');">
													<i class="iconfont icon-bianji red1 marginLR-10" title="编辑" ></i>
												</a>
												</c:if>
												 <c:if test="${QX.delete == 1 }">
												<a href="javascript:delmenu('${menu.menuId }');">
													<i class="iconfont icon-shape7 green2" title="删除"></i>
												</a>
												</c:if>
											</div>
											<div class="hidden-md hidden-lg">
												<div class="inline pos-rel">
													<button
														class="btn btn-minier btn-yellow dropdown-toggle"
														data-toggle="dropdown" data-position="auto">
														<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
													</button>
													<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
														<c:if test="${QX.editIcon == 1 }">
														<li><a href="javascript:editTb('${menu.menuId }');" class="tooltip-info" data-rel="tooltip" title="View">
															<span>
																<i class="iconfont icon-tupiantubiao purple1" title="编辑图标"></i>
															</span>
														</a></li>
														</c:if>
														<c:if test="${QX.edit == 1 }">
														<li><a href="javascript:editmenu('${menu.menuId }');" class="tooltip-success" data-rel="tooltip" title="Edit">
															<span class="green">
																<i class="iconfont icon-bianji red1" title="修改"></i>
															</span>
														</a></li>
														</c:if>
														<c:if test="${QX.delete == 1 }">
														<li><a href="javascript:delmenu('${menu.menuId }');" class="tooltip-error" data-rel="tooltip" title="Delete">
															<span class="red"> <i class="iconfont icon-shape7 green2"  title="删除"></i>
															</span>
														</a></li>
														</c:if>
													</ul>
												</div>
											</div>
											</c:if>
											 <c:if test="${menu.company == 'ALL' && USERNAME != 'super'}">
												<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
											</c:if>
										</td>
									</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.query != 1 }">
										<tr>
											<td colspan="100" class='center'>您无权查看</td>
										</tr>
									</c:if>
									</c:when>
										<c:otherwise>
											<tr>
											<td colspan="100" class='center'>没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
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
						<!-- /.col -->
					</div>
					
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
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
	
		dict.init({ids:['dynamic-table'],buildType:'grid'});
	
		$(document).ready(function(){
			top.hangge();
		});	
		//检索
		function gsearch(){
			top.jzts();
			$("#Form").submit();
		}
		//去此ID下子菜单列表
		function goSonmenu(MENU_ID){
			top.jzts();
			window.location.href="<%=basePath%>menu.do?MENU_ID="+MENU_ID;
		};
		
		//新增菜单，拼接url是为了记录日志
		function addmenu(MENU_ID){
		 top.jzts();
		   	 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增菜单";
			 diag.URL = '<%=basePath%>menu/toAdd.do?MENU_ID='+MENU_ID+'&url=<%=basePath%>menu/toAdd.do';   
			 diag.Width = 500;
			 diag.Height = 570;
			 diag.CancelEvent = function(){ //关闭事件
				if('none' == diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display){
					 parent.location.href="<%=basePath%>menu/listAllMenu.do?MENU_ID=${MENU_ID}&dnowPage=${page.currentPage}";
				}
				diag.close();
			 };
			 diag.show();
		};
		
		//编辑菜单
		function editmenu(MENU_ID){
			top.jzts();
		   	 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改菜单";
			 diag.URL = '<%=basePath%>menu/toEdit.do?MENU_ID='+MENU_ID+'&url=<%=basePath%>menu/toEdit.do';
			 diag.Width = 500;
			 diag.Height = 570;
			 diag.CancelEvent = function(){ //关闭事件
				if('none' == diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display){
					 parent.location.href="<%=basePath%>menu/listAllMenu.do?MENU_ID=${MENU_ID}&dnowPage=${page.currentPage}";
				}
				diag.close();
			 };
			 diag.show();
		};
		
		//删除
		function delmenu(MENU_ID){
			bootbox.confirm("确定要删除此菜单吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>menu/delete.do?MENU_ID="+MENU_ID+"&guid="+new Date().getTime()+"&url=<%=basePath%>menu/delete.do";
					top.jzts();
					$.get(url,function(data){
						if("success" == data.result){
							parent.location.href="<%=basePath%>menu/listAllMenu.do?MENU_ID=${MENU_ID}&dnowPage=${page.currentPage}";
						}else if("false" == data.result){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败,请先删除子菜单!</span>",
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
		
		//编辑菜单图标
		function editTb(MENU_ID){
			 top.jzts();
		   	 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑图标";
			 diag.URL = '<%=basePath%>menu/toEditicon.do?MENU_ID='+MENU_ID+'&url=<%=basePath%>menu/toEditicon.do';
			 diag.Width = 800;
			 diag.Height = 395;
			 diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					top.jzts(); 
					setTimeout("location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
	</script>


</body>
</html>