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
<style >
 body{height:100% !important;background:#02A7E9;min-width:1024px;line-height: 20px !important;} 
 canvas{z-index:-1;position:absolute;}
 .footer {
    padding-top: 2px;
    position: fixed;
    bottom: 0;
    z-index: 1030;
    width: 100%;
    height: 30px;
    border-top: 5px solid #0a78cb;
    text-align: center;
    background-color: #ffffff;
	display: block;
 }
 .headerRight{
	 border-left:1px #cccccc solid;
	 padding-left:10px;
	 padding-right:10px;
 }
 .input-append, .input-prepend {
    display: inline-block;
    margin-bottom: 25px !important;
    font-size: 0;
    white-space: nowrap;
    vertical-align: middle;
}
</style>

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
   <a href="javascript:void(0);" onclick="SetHome(this);" style="padding-right:10px;">设为首页</a>
   <a href="javascript:void(0);" rel="sidebar" class="headerRight" onclick="AddFavorite(this);">加入收藏</a>
   </div>
	</div>

  </div>
<div style="margin-bottom:30px;background:url(static/login/images/gjhjk.png) no-repeat;margin-left:10%;margin-top:5%;">
 <form action="" method="post" name="loginForm" id="loginForm" class="admin_login">
   <input  type="hidden"  name="mac" id="mac" value="111111" />
	<div class="input-prepend">
		<span class="add-on" style="-webkit-border-radius: 0 0 0 0;"><img src="static/login/images/u.png" /></span>
		<input type="text" name="loginname" id="loginname"  value="" placeholder="输入用户名" onBlur="findC(this.value)" />
	</div>
	<div class="input-prepend" >
		<span class="add-on"  style="-webkit-border-radius: 0 0 0 0;"><img src="static/login/images/p.png" /></span>
	    <input type="password" name="password" id="password" placeholder="输入密码" value="" onBlur="findC(this.value)"/>
	</div>
	<div id="cDiv" class="input-prepend" style="display:none">
		<span class="add-on"  style="-webkit-border-radius: 0 0 0 0;"><img src="static/login/images/fa.png" /></span> 
		<select class="chosen-select form-control" name="company" id="company" style="text-indent: 0.3em;">
		   <option  value="" disabled selected style="display:none;">选择法人</option>
		</select>
	</div>
  <input type="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录" class="submit_btn"  onclick="severCheck();"/>
  <div id="Tmsg" style="width: 280px; margin-top:10px; min-width: 16px;margin-left:0px;background-color: #eee;display:none; ">
		首次登陆请设置：<br/>1.IE浏览器>设置>Internet选项>安全>Internet>自定义级别>对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本(不安全)>启用；<br/>2.对弹窗口均选择“允许”；<br/>3.刷新登录界面。
	</div>
</form>
</div>
<div style="z-index: 999; position: fixed; text-align: center; background-color: #ffffff; width: 100%; bottom: 0px; height: 30px; border-top: #d5d3d3 1px solid; padding-top: 3px;">
<!--<div class="footer" style="height:10%;text-align:center;margin:auto;">-->
		
</div>


  <script type="text/javascript">
		/*$(document).ready(function() {
			//粒子背景特效
			$('body').particleground({
				dotColor: '#ffffff',
				lineColor: '#ffffff'
			});
		});*/

	$(document).ready(function() {
	var mac = ''; //$("#mac").val();		
	var locator =new ActiveXObject ("WbemScripting.SWbemLocator");
        var service = locator.ConnectServer(".");
        var properties = service.ExecQuery("Select * from Win32_NetworkAdapterConfiguration Where IPEnabled =True");
        var e =new Enumerator (properties);
        {
            var p = e.item();
            mac = p.MACAddress;
            mac = mac.replace(":","-").replace(":","-").replace(":","-").replace(":","-").replace(":","-").replace(":","-");
        }
	$("#mac").val(mac);
	});
		function KeyDown()
		{
		  if (event.keyCode == 13)
		  {
		    event.returnValue=false;
		    event.cancel = true;
		    severCheck();
		  }
		}
			//设为首页
		function SetHome(obj){
			var url = window.location;
			try{
				$(obj).style.behavior=url+'(#default#homepage)';
				$(obj).setHomePage(url);
			}catch(e){
				if(window.netscape){
					try{
						netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
					}catch(e){
					alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
					}
				}else{
					alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
				}
			}
		}
		//加入收藏
		function AddFavorite(obj) {
			var url = window.location;
			var title = document.title;
			var nav = navigator.userAgent;
			//alert(title+"..."+url+"..."+nav+"...."+nav.indexOf("MSIE") +"...."+window.sidebar);
            if(nav.indexOf("MSIE")!=-1) { //针对IE
                window.external.addFavorite(url, title);
			}else if (nav.indexOf("Firefox")!=-1){ //针对火狐
				$(obj).attr("rel", "sidebar");
                $(obj).attr("title", title);
                $(obj).attr("href", url);
				//window.sidebar.addPanel("sd", "http://localhost:8089/SmartSence/", "");
            } else {
                alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
            }
		}
          //查询对应法人
            function findC(){
    			var USERNAME = $.trim($("#loginname").val());
    			$.ajax({
    				type: "POST",
    				url: 'login_findC',
    		    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
    				dataType:'json',
    				cache: false,
    				success: function(data){
    					if(null == data.result){
    							$("#loginname").tips({
    									side : 1,
    									msg : "用户不存在",
    									bg : '#FF5080',
    									time : 1
    								});
    								$("#loginname").focus();
    					}else{
   							var modelMap = data.result;
   							var num=0;
   						   	var html = '';
   						   	$.each(modelMap, function(key, value){
   						   		num +=1;
   						   		html += '<option value="' + key + '">' + value + '</option>';
   						   	});
   						   	$('#company').html(html);
   						   	if(num>1){
   						   		document.getElementById("cDiv").style.display="";
   						   	}
   						}
    				}
    			});
    		}
		
		//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var company = $("#company").val();
				var password = $("#password").val();
				var code =loginname+",dcits,"+company+",dcits,"+password+",dcits,"+$("#mac").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							window.location.href="main/index";
						}else if("paserror" == data.result){
							$("#password").tips({
								side : 1,
								msg : "密码输入有误",
								bg : '#FF5080',
								time : 2
							});
							$("#password").val('').focus();
							return false;
						}else if("OutTimes" == data.result){
							$("#password").tips({
								side : 1,
								msg : "密码错误次数超过上限，已被锁定，请联系管理员",
								bg : '#FF5080',
								time : 2
							});
							$("#password").focus();
							return false;
						}else if("lock" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户已被锁定，请联系管理员",
								bg : '#FF5080',
								time : 2
							});
							$("#loginname").focus();
							return false;
						}else if("novalid" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户是无效状态，请联系管理员",
								bg : '#FF5080',
								time : 2
							});
							$("#loginname").focus();
							return false;
						}else if("comInfo" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户缺少法人信息",
								bg : '#FF5080',
								time : 2
							});
							$("#loginname").focus();
							return false;
						}else if("MacError" == data.result){
							bootbox.confirm("登录机器已改变，是否提交变更申请?", function(result) {
								if(result) {
									$.ajax({
												type: "post",
												url: 'login_MacheChange',
												data:{USER_ID:data.USERID,USERNAME:data.USERName,COMPANY:data.company,OLD_MAC:data.oldMAC,OLD_IP:data.oldIP,NEW_MAC:data.newMAC,NEW_IP:data.newIP},
												dataType:'json',
												cache: false,
												success: function(data) {
													if (data.msg == "success") {
														bootbox.dialog({
															message: "<span class='bigger-110'>变更申请已提交，请等待!</span>",
															buttons:
																{
																"button" :
																	{
																	"label" : "确定",
																	"className" : "btn-sm btn-success",
																	"callback": function() {
																		window.location.href='login_toLogin';
																		}
																	}
																}
														});
													}else{
														bootbox.dialog({
															message: "<span class='bigger-110'>"+data.info+"</span>",
															buttons:
																{
																"button" :
																	{
																	"label" : "确定",
																	"className" : "btn-sm btn-success",
																	"callback": function() {
																		window.location.href='login_toLogin';
																		}
																	}
																}
														});
													}
												}
										});
										return false;
							}
						})
						}else if("oper" == data.result){
							$("#loginname").tips({
								side : 2,
								msg : "首次登陆请参照提示进行设置!",
								bg : '#FF5080',
								time : 2
							});
							document.getElementById("Tmsg").style.display="";
							return false;
						}else if("hasU" == data.result){
							bootbox.dialog({
									message: "<span class='bigger-110'>一个浏览器只允许登陆一个用户!</span>",
									buttons:
									{
										"button" :
										 {
										   "label" : "确定",
											"className" : "btn-sm btn-success",
											"callback": function() {
											window.location.href='login_toLogin';
											}
										}
									}
							});
						}else if("InitPwd" == data.result){
							bootbox.confirm("登陆密码与初始密码相同,请修改密码!", function(result) {
								if(result) {
								bootbox.dialog({
								message: '<form class="form-horizontal" role="form" id="cpwd_form"><table id="table_report" class="table table-striped " style="width:80%;"><tr><td style="width:79px;text-align: right;padding-top: 13px;">密码:</td><td><input type="password" name="InitPwd" id="InitPwd"  maxlength="32" placeholder="输入密码" title="密码" style="width:98%;"/></td></tr><tr><td style="width:79px;text-align: right;padding-top: 13px;">确认密码:</td><td><input type="password" name="chkInitPwd" id="chkInitPwd"  maxlength="32" placeholder="确认密码" title="确认密码" style="width:98%;"/></td></tr></table></from>',
								buttons: 			
								{
									"button" :
									{
										"label" : "提交",
										"className" : "btn-sm btn-success",
										"callback": function() {
											if($("#InitPwd").val()==""){
												$("#InitPwd").tips({
													side:3,
													msg:'输入密码',
													bg:'#AE81FF',
													time:1
												});
												$("#InitPwd").focus();
												return false;
											}
											if($("#InitPwd").val()!=$("#chkInitPwd").val()){
												$("#chkInitPwd").tips({
													side:3,
													msg:'两次密码不相同',
													bg:'#AE81FF',
													time:1
												});
												$("#chkInitPwd").focus();
												return false;
											}
											var params = $("#InitPwd").val();
											$.ajax({
												type: "post",
												url: 'login_Pwdchange',
												data:{InitPwd:params,USER_ID:data.USERID,USERNAME:data.USERName,MAC:data.MAC},
												dataType:'json',
												cache: false,
												success: function(data) {
													if (data.result == "success") {
														bootbox.dialog({
															message: "<span class='bigger-110'>修改成功,请重新登陆!</span>",
															buttons:
																{
																"button" :
																	{
																	"label" : "确定",
																	"className" : "btn-sm btn-success",
																	"callback": function() {
																		window.location.href='login_toLogin';
																		}
																	}
																}
														});
													}else{
														$("#InitPwd").tips({
														side:3,
														msg:data.msg,
														bg:'#AE81FF',
														time:1
														});
														$("#InitPwd").focus();
													}
												}
										});
										return false;
										}
									}
								}
							});
						}
						})
						}else if("overDay" == data.result){
							bootbox.confirm("密码已过期,请修改密码!", function(result) {
								if(result) {
								bootbox.dialog({
								message: '<form class="form-horizontal" role="form" id="cpwd_form"><table id="table_report" class="table table-striped " style="width:80%;"><tr><td style="width:79px;text-align: right;padding-top: 13px;">密码:</td><td><input type="password" name="InitPwd" id="InitPwd"  maxlength="32" placeholder="输入密码" title="密码" style="width:98%;"/></td></tr><tr><td style="width:79px;text-align: right;padding-top: 13px;">确认密码:</td><td><input type="password" name="chkInitPwd" id="chkInitPwd"  maxlength="32" placeholder="确认密码" title="确认密码" style="width:98%;"/></td></tr></table></from>',
								buttons: 			
								{
									"button" :
									{
										"label" : "提交",
										"className" : "btn-sm btn-success",
										"callback": function() {
											if($("#InitPwd").val()==""){
												$("#InitPwd").tips({
													side:3,
													msg:'输入密码',
													bg:'#AE81FF',
													time:1
												});
												$("#InitPwd").focus();
												return false;
											}
											if($("#InitPwd").val()!=$("#chkInitPwd").val()){
												$("#chkInitPwd").tips({
													side:3,
													msg:'两次密码不相同',
													bg:'#AE81FF',
													time:1
												});
												$("#chkInitPwd").focus();
												return false;
											}
											var params = $("#InitPwd").val();
											$.ajax({
												type: "post",
												url: 'login_Pwdchange',
												data:{InitPwd:params,USER_ID:data.USERID,USERNAME:data.USERName,MAC:data.MAC},
												dataType:'json',
												cache: false,
												success: function(data) {
													if (data.result == "success") {
														bootbox.dialog({
															message: "<span class='bigger-110'>修改成功,请重新登陆!</span>",
															buttons:
																{
																"button" :
																	{
																	"label" : "确定",
																	"className" : "btn-sm btn-success",
																	"callback": function() {
																		window.location.href='login_toLogin';
																		}
																	}
																}
														});
													}else{
														$("#InitPwd").tips({
														side:3,
														msg:data.msg,
														bg:'#AE81FF',
														time:1
														});
														$("#InitPwd").focus();
													}
												}
										});
										return false;
										}
									}
								}
							});
						}
						})
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 1

							});
							$("#loginname").focus();
							return false;
						}
					}
				});
			}
		}

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		//客户端校验
		function check() {
			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 1
				});
				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '请重新输入密码',
					bg : '#AE81FF',
					time : 1
				});
				$("#password").focus();
				return false;
			}
			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 3
			})
			return true;
		}

		function quxiao() {
			$("#loginname").val('');
			$("#company").val('');
			$("#password").val('');
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var companyname = $.cookie('company');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(companyname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#company").val(companyname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
			}
		});
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
	<c:if test="${'1' == pd.msg}">
		<script type="text/javascript">
		$(tsMsg());
		function tsMsg(){
			alert('已经有用户在本机登录，您暂时无法登录！');
		}
		</script>
	</c:if>
	<c:if test="${'2' == pd.msg}">
		<script type="text/javascript">
			$(tsMsg());
			function tsMsg(){
				alert('您被系统管理员强制下线');
			}
		</script>
	</c:if>
	<script type="text/javascript" src="static/login/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/login/js/jquery.easing.1.3.js"></script>
	<!--<script type="text/javascript" src="static/login/js/jquery.mobile.customized.min.js"></script>  
	 <script type="text/javascript" src="static/login/js/camera.min.js"></script> 
	<script type="text/javascript" src="static/login/js/templatemo_script.js"></script>-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script> 
	
</body>

</html>