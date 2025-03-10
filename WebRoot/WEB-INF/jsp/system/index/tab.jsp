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
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="plugins/tab/js/framework.js"></script>
	<link href="plugins/tab/css/import_basic.css" rel="stylesheet" type="text/css"/>
	<link  rel="stylesheet" type="text/css" id="skin" prePath="plugins/tab/" /><!--默认相对于根目录路径为../，可添加prePath属性自定义相对路径，如prePath="<%=request.getContextPath()%>"-->
	<script type="text/javascript" charset="utf-8" src="plugins/tab/js/tab.js"></script>
	<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
	<link rel="stylesheet" type="text/css" href="static/ace/css/font-awesome.css">
	</head>
<body>
<div id="tab_menu">
</div>
<div style="width:100%;">
	<div id="page" style="width:100%;height:100%;">
	</div>
</div>
</body>
<script type="text/javascript">

function tabAddHandler(mid,mtitle,murl){
	tab.close(mid);
	tab.update({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	tab.add({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	tab.activate(mid);
}
 var tab;	
$( function() {
	 tab = new TabView( {
		containerId :'tab_menu',
		pageid :'page',
		cid :'tab1',
		position :"top"
	});
	tab.addZhuYe( {
		id :'tab1_index1',
		title :'<i class="iconfont icon-htmal5icon06" style="font-size:28px;width=40px;"></i>',
		url :"<%=basePath%>login_default.do",
		isClosed :false
	});
	$("#tab1_index1").css("background-color","eeeff0");
	$("#tab1_index1").css("border-top","3px solid #eeeff0");
	$("#tab1_index1").css("font-size","30px");
	
});

	function cmainFrameT(){
		var hmainT = document.getElementById("page");
		var bheightT = document.documentElement.clientHeight;
		hmainT .style.width = '100%';
		hmainT .style.height = (bheightT  - 41) + 'px';
	}
	cmainFrameT();
	window.onresize=function(){  
		cmainFrameT();
	};

</script>
</html>

