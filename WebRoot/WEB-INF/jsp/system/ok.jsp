<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<link href="static/login/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="static/login/css/style.css" />

<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>

 <!--<script type="text/javascript" src="static/login/js/jquery.js"></script>
<script type="text/javascript" src="static/login/js/Particleground.js"></script>
<script type="text/javascript" src="static/login/js/verificationNumbers.js"></script>--> 
<!-- 修改确认窗口 -->
<script type="text/javascript" src="static/ace/js/bootbox.js"></script>
<script language="JavaScript">  
      window.history.forward();  
      window.onbeforeunload=function (){      
        }  
</script>


	<!--<meta name="generator" content="editplus" /> 
	<script event="OnObjectReady(objObject,objAsyncContext)" for="foo">  
	if(objObject.IPEnabled!=null&&objObject.IPEnabled!="undefined"&&objObject.IPEnabled == true){ 
	   if(objObject.MACAddress!=null&&objObject.MACAddress!="undefined")  
	       document.getElementById('mac').value=unescape(objObject.MACAddress); 
	}  
	</script> 
	<script type="text/javascript"> 
	function init(){ 
	   var service=locator.ConnectServer(); 
	   service.Security_.ImpersonationLevel=3; 
	   service.InstancesOfAsync(foo,'Win32_NetworkAdapterConfiguration'); 
	} 
	</script> -->


	
</head>
<body  onkeydown="KeyDown()" onLoad="init()" >
<object classid="CLSID:76A64158-CB41-11D1-8B02-00600806D9B6" id="locator" style="display:none;visibility:hidden"></object>
<object classid="CLSID:75718C9A-F029-11d1-A1AC-00C04FB6C223" id="foo" style="display:none;visibility:hidden"></object> 
<div style="background:#ffffff;height:15%;z-index:99;border-bottom: 5px solid #0a78cb;">
   <div style="width:1024px;margin:auto;text-align:center;">
  <!--  <i style="float: left;"><img src="static/login/images/log.png"  style="padding-left:15px;" /></i> -->
   <div style="float: right;padding-right:15px;padding-top:5%;">
   <a href="javascript:void(0);"  style="padding-right:10px;">ok</a>
   </div>
	</div>

  </div>
</form>
</div>



	<script type="text/javascript" src="static/login/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/login/js/jquery.easing.1.3.js"></script>
	<!--<script type="text/javascript" src="static/login/js/jquery.mobile.customized.min.js"></script>  
	 <script type="text/javascript" src="static/login/js/camera.min.js"></script> 
	<script type="text/javascript" src="static/login/js/templatemo_script.js"></script>-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script> 
	
</body>

</html>