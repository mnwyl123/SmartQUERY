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
<head>
	<meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=9"/>
    <meta name="keywords" content="" />
	<meta name="description" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    
    <!-- Favicon -->
	<link rel="icon" href="../static/creditreference/v2/test/web-bank-manage/resource/pc/img/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="../static/creditreference/v2/test/web-bank-manage/resource/pc/img/favicon.ico" type="image/x-icon" />
	
    <title>密码维护</title>
    <script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/pc/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/pc/js/crypto-js.js"></script>
    <script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/pc/js/PassGuardCtrl.js"></script>
    <script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/layer/layer.js"></script>
<script type="text/javascript">
		   	var pgeditor = new pge({
				pgePath : "../static/creditreference/v2/test/web-bank-manage/resource/ocx/",//控件下载目录，可以指定绝对路径，如"http://www.baidu.com/download/"
				pgeId : "_ocx_password",//控件id
				pgeEdittype : 0,//控件显示类型,0(星号),1(明文)
				pgeEreg1 : "[\\s\\S]*",//输入过程中字符类型限制，如"[0-9]*"表示只能输入数字
				pgeEreg2 : "[\\s\\S]{8,16}",//输入完毕后字符类型判断条件，与pgeditor.pwdValid()方法对应
				pgeMaxlength : 16,//允许最大输入长度
				pgeTabindex : 2,//tab键顺序
				/* pgeCertX : "B0562CFB493AA394CB56DBF14679657CB174E2908335AF92667AEDD6B0B9859A",
				pgeCertY : "56D4276D65985F40B95066507D9AB955D6E737D8FE05EE1947964DEB80CCBFFC", */
				pgeCertX : "BA15C7E63D4BABAB6A8F1D249EDB223C773E0318344156234C877AF1F866E0CE",
				pgeCertY : "D17E4B54288E0BF7731D2B632AC051E426C578A1E24BE953EB002885CED6719E",
				pgeClass : "input input_passIcon",//控件css样式
				pgeInstallClass : "input input_passIcon",//针对安装或升级的css样式
				pgeOnkeydown :"FormSubmitSM2()",//回车键响应函数，需焦点在控件中才能响应
			    tabCallback : "message_LOGIN_IMMEDIATELY",//火狐tab键回调函数,设置要跳转到的对象ID
			    //pgeOnfocus:"pgeFocus()",//监控光标切入密码控件框
			    //pgeOnblur:"pgeBlur()",//监控光标切出密码控件框
			   	//windows10 edge&Chrome42+相关
			    pgeWindowID:"password"+new Date().getTime()+1,
			    pgeRZRandNum:"60824760916616613705176072321129",
			    pgeRZDataB:"O/5xtxQks+t4Wdg06I/5ze2jMb+n06BG/kXZqp/oSEg="
			});
			window.pgeCtrl = pgeditor;
			var i = 0;
			//密码控件获得焦点时，提示一下
			//function pgeFocus(){
				/* pgeditor.pwdGetEById("tishi").innerHTML = ("获得焦点"+(i++)); */
			//}
			//密码控件失去焦点时获得密码强度，并展示出来
			//function pgeBlur(){
				/* pgeditor.pwdGetEById("tishi").innerHTML = ("失去焦点"+(i++));
				//显示密码强度
				GetLevel(); */
			//} 
			/* window.onload = function(){
			   pgeditor.pwdGetEById("login").focus(); 
			   pgeditor.pgInitialize(); 
			   pgeditor.setLicense(); 
			  pgeditor.pwdGetEById("lic").value = (pgeditor.setLicense()); 
			}  */
		</script>
    <style>
 .login{
	margin:50px auto !important;
 }
	.flexslider{
		min-width:120px !important;
		height:100% !important;
	}
    </style>
</head>
<body style="background: rgb(83, 138, 168);">
<div class="page out" data-form="fade">
        
		<!-- 头部  -->
		

 

<script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/pc/lib/html5/canvas.js"></script>
<link rel="stylesheet" href="../static/creditreference/v2/test/web-bank-manage/resource/pc/css/reset.min.css">
<link rel="stylesheet" href="../static/creditreference/v2/test/web-bank-manage/resource/pc/css/index.css">

<link type="text/css" href="../static/creditreference/v2/test/web-bank-manage/resource/pc/css/pager2.css" rel="stylesheet" /><!---分页样式-->
  <script type="text/javascript">
      function imgErrorFun(event){
          js_removeNode(event)
      }

      function js_removeNode(obj){
          obj.parentNode.parentNode.removeChild(obj.parentNode);
      }
  </script>
  
  	
</div>
<div id="zhongxin" class="paddingt-13">
	<div class="flexslider">
		<div class="login" style="">
			<div class="login-text"></div>
				<form id="form-area" class="ng-form-area show-place" action="pwdUpdate.do" method="POST">
				<input type="hidden" name="password" id="password" value="" tabindex="-1" />
				<input type="hidden" name="local_network" id="local_network" value="" tabindex="-1" />
				<input type="hidden" name="local_disk" id="local_disk" value="" tabindex="-1" />
				<input type="hidden" name="local_cpu" id="local_cpu" value="" tabindex="-1" />
				<ul class="form-group">
					<li class="input-group">
						<input type="text" class="input input_userIcon" id="username" name="username" aria-required="true" autocomplete="off" tabindex="1" readOnly="true">
					</li>
					<li class="input-group">
						<script>
									pgeditor.generate();
						</script>
					</li>
					<li class="input-group ">
						<input type="button" value="立即修改" id="message_LOGIN_IMMEDIATELY" class="button input input_blue" tabindex="3">
					</li>
					<li><span style="color:#fff;">●&nbsp;请以管理员身份安装密码控件</span></li>
				</ul>
				</form>
			</div>

		</div>
	</div>
        
       
        
</div>
 <!-- 尾部  -->
<script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/pc/lib/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/pc/lib/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/pc/lib/GVerify.js"></script>
 <script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/pc/lib/jqthumb/jqthumb.min.js"></script>

<script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/artTemplate.js"></script><!---列表页面数据加载模板js-->
<script type="text/javascript">
$(function(){
	$("#username").val('${pd.user_code}');
})
</script>

		
		<script type="text/javascript" src="../static/creditreference/v2/test/web-bank-manage/resource/pc/js/index.js"></script>
		
		
<script type="text/javascript">
var checkform = false;
function FormSubmitSM() {
	checkform = false;
		var length = pgeditor.pwdLength();//获得密码长度
		if($.trim($("#username").val())===""){
			alert("用户名不能为空");
			$("#username").focus();
			return false;
		}else if (length == 0 || length == undefined) {
    		setTimeout(function(){
    			alert("密码不能为空");
    			$("_ocx_password").focus();
    		},0);
    		return false;
    	}else if (pgeditor.pwdValid() == 1) {//判断密码是否匹配正则表达式二
    		setTimeout(function(){
    			alert("密码不符合要求");
    			$("_ocx_password").focus();
    		},0);
    		return false;
    	}
		checkform = true;
		return true;
		

	
}

function submitform (){
	$("#message_LOGIN_IMMEDIATELY").val("正在修改中...").prop("disabled",true);
	var pwdResult = pgeditor.pwdResultSM();//获取密码AES密文
	var machineNetwork = pgeditor.machineNetworkSM();//获取网卡信息密文
	var machineDisk = pgeditor.machineDiskSM();//获取硬盘信息密文	
	var machineCPU = pgeditor.machineCPUSM();//获取CPU信息密文
	$("#password").val(pwdResult);
	$("#local_network").val(machineNetwork);
	$("#local_disk").val(machineDisk);
	$("#local_cpu").val(machineCPU);
	/* alert(pwdResult);
	alert(machineNetwork);
	alert(machineDisk);
	alert(machineCPU); */
	/* $("#password").value = pwdResult;//将密码密文赋值给表单
	$("#local_network").value = machineNetwork;//将网卡和MAC信息密文赋值给表单
	$("#local_disk").value = machineDisk;//将硬盘信息密文赋值给表单 */
	$("#form-area").submit();
	
}





    $(function () {
    	
    	
		//关闭首页提示框
		$("#close").click(function(){
			$(this).closest("div").hide();
		});
		
    	$("#message_LOGIN_IMMEDIATELY").click(function(){
    		$("#form-area").submit();
        });
   
	$("#form-area").submit(function(e) {
			if (!checkform) {
				e.preventDefault();
				if (FormSubmitSM()) {
					submitform();
				} else {
					return false;
				}
			}

		});
		$("embed").css("width", "347px");
		if (window.navigator.userAgent.indexOf("Chrome") != -1) {

			$("embed").css("width", "292px");

		}
		;

	});
</script>


</body>
</html>
