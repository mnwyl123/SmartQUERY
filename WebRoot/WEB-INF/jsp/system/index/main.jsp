<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<link rel="icon" href="img/favicon.ico">
<!-- jsp文件头和头部 -->
<%@ include file="top.jsp"%>
<style type="text/css">
.commitopacity {
	position: absolute;
	width: 100%;
	height: 100px;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.8;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}
.menu-container	{
    position: absolute;
    right: 10px;
    top: 52px;
    z-index: 12;
}
.menu-container ul li{
    padding-left: 10px;
}
.commitbox_top{
	display:none;
	min-width:150px;
	max-width:300px; 
	max-height:500px; 
	overflow:auto; 
	position:fixed;
	z-index:9999;
	top:56px; 
	right:30px; 
	padding:10px; 
	background:#FFF; 
	border-radius:5px; 
	box-shadow:1px 1px 3px #e8e8e8;
}
.navbar-default {
    background-color: #15476d;
    border-color: #e7e7e7;
}
#tabinfo{
	margin-top: -42px;
}
.menu-text{
	text-align: left !important;
	/*padding-left: 12px !important;*/
	font-size: 14px !important;
}
#headermenu>.active{
	background-color: white !important;
}
#headermenu>.active>a{
	/*color: black !important;*/
	color: #15476d !important;
}
#headermenu > li > a:hover, #headermenu > li > a:focus, #headermenu > li.open > a {
    background-color: white !important;
    /*color: black !important;*/
	color: #15476d !important;
}
#currentMenuName{
	color: white;
}

.sidebar.menu-min .sidebar-shortcuts-large {
    display: block;
    position: absolute;
    top: 0;
    left: 0px;
    width: 42px;
    padding: 0;
    border: 0px solid;
    border-top-width: 0;
    border-color: #4b4b4b !important;
}
.sidebar.menu-min #currentMenuName {
    display: none;
}

.no-skin .sidebar.menu-min .nav-list > li > a.dropdown-toggle > .menu-text {
    overflow: hidden;
    max-height: 42px;
    margin-left: -42px;
    -webkit-box-shadow: 2px 2px 2px 0 rgba(0,0,0,0.1);
    box-shadow: 2px 2px 2px 0 rgba(0,0,0,0.1);
}

.no-skin .sidebar.menu-min .nav-list > li > a > .menu-text {
    overflow: hidden;
    max-height: 40px;
    margin-left: -42px;
    background-color: #303030;
    -webkit-box-shadow: 2px 1px 2px 0 rgba(0,0,0,0);
    box-shadow: 2px 1px 2px 0 rgba(0,0,0,0);
    border-color: #4b4b4b;
}
.sidebar.menu-min .nav-list > li > .submenu {
    top: 0;
    margin-top: 0;
    margin-top: 0;
    padding-bottom: 0;
}
</style>

<!-- 即时通讯 -->
<link rel="stylesheet" type="text/css"
	href="plugins/websocketInstantMsg/ext4/resources/css/ext-all.css">
<link rel="stylesheet" type="text/css"
	href="plugins/websocketInstantMsg/css/websocket.css" />
<link rel="stylesheet" type="text/css"
	href="static/iconfont/iconfont.css">
	
<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
<script type="text/javascript" src="plugins/websocketInstantMsg/ext4/ext-all-debug.js"></script>
<script type="text/javascript" src="plugins/websocketInstantMsg/websocket.js"></script>
<!-- 即时通讯 -->

</head>
<body class="no-skin">
	<!-- #section:basics/navbar.layout -->

	 <!-- 页面顶部¨ -->
		<%@ include file="head.jsp"%>
	<div id="websocket_button"></div>
	<!-- 少了此处，聊天窗口就无法关闭 -->
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
	
		<!-- #section:basics/sidebar -->
		<!-- 左侧菜单 -->
		<%@ include file="left.jsp"%>

		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">

				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					<div class="menu-container"  id="tabinfo">
						<i id="iconfont" class="iconfont icon-chakanxiaji"></i>
						<div id="menudiv" class="commitbox_top" >
							<ul id="menuli">
							</ul>
					    </div>
					</div>
					<!-- /.ace-settings-container -->
					<div class="row">
						<div class="col-md-12">
							<!-- <div class="row">
								<div style="padding-left: 5px;">
								</div>
							</div> -->
							<div class="row">
								<div id="jzts"
									style="display: none; width: 100%; position: fixed; z-index: 99999999;">
									<div class="commitopacity" id="bkbgjz"></div>
									<div style="padding-left: 70%; padding-top: 1px;">
										<div style="float: left; margin-top: 3px;">
											<img src="static/images/loadingi.gif" />
										</div>
										<div style="margin-top: 6px;">
											<h4 class="lighter block red">&nbsp;加载中 ...</h4>
										</div>
									</div>
								</div>
								<div>
									<iframe name="mainFrame" id="mainFrame" frameborder="0" src="tab.do" style="margin: 0 auto; width: 100%; height: 100%;"></iframe>
								</div>
							</div>
							<div class="row">
								<div style="text-align: center;padding-top: 3px; height: 30px; width: 100%; position: fixed; z-index: 999; background-color: #dddddd; border-top: 1px solid #d5d3d3; bottom: 0;">
									</div>
							</div>

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
		<%@ include file="foot.jsp"%>

		<!-- page specific plugin scripts -->

		<!-- ace scripts -->
		<script src="static/ace/js/ace/elements.scroller.js"></script>
		<script src="static/ace/js/ace/elements.colorpicker.js"></script>
		<script src="static/ace/js/ace/elements.fileinput.js"></script>
		<script src="static/ace/js/ace/elements.typeahead.js"></script>
		<script src="static/ace/js/ace/elements.wysiwyg.js"></script>
		<script src="static/ace/js/ace/elements.spinner.js"></script>
		<script src="static/ace/js/ace/elements.treeview.js"></script>
		<script src="static/ace/js/ace/elements.wizard.js"></script>
		<script src="static/ace/js/ace/elements.aside.js"></script>
		<script src="static/ace/js/ace/ace.js"></script>
		<script src="static/ace/js/ace/ace.ajax-content.js"></script>
		<script src="static/ace/js/ace/ace.touch-drag.js"></script>
		<script src="static/ace/js/ace/ace.sidebar.js"></script>
		<script src="static/ace/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="static/ace/js/ace/ace.submenu-hover.js"></script>
		<script src="static/ace/js/ace/ace.widget-box.js"></script>
		<script src="static/ace/js/ace/ace.settings.js"></script>
		<script src="static/ace/js/ace/ace.settings-rtl.js"></script>
		<script src="static/ace/js/ace/ace.settings-skin.js"></script>
		<script src="static/ace/js/ace/ace.widget-on-reload.js"></script>
		<script src="static/ace/js/ace/ace.searchbox-autocomplete.js"></script>

		<!-- inline scripts related to this page -->

		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="static/ace/css/ace.onpage-help.css" />

		<script type="text/javascript">
			ace.vars['base'] = '..';
		</script>
		<script src="static/ace/js/ace/elements.onpage-help.js"></script>
		<script src="static/ace/js/ace/ace.onpage-help.js"></script>

		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/head.js"></script>
		<script type="text/javascript" src="plugins/tab/js/tab.js"></script>
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/index.js"></script>
		<!--引入弹窗组件start-->
		<script type="text/javascript"
			src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript"
			src="plugins/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
</body>
</html>