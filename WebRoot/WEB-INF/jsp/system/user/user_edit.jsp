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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12 no-padding">
								<form action="user/${msg }.do" name="userForm" id="userForm" method="post">
									<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
									<input type="hidden" name="flag" id="flag" value="${flag }"/>
									<div id="zhongxin" class="paddingt-13">
									<table id="table_report" class="table table-striped" >
										<tr>
											<td class="align-right width-30">登录编码:<span class="red ">*</span></td>
											<td><input type="text" name="USERNAME" id="loginname" value="${pd.USERNAME }" maxlength="32" placeholder="这里输入用户名" title="用户名" class="width-80" onblur="hasU()"/></td>
										</tr>
										<tr>
											<td class="align-right width-30">人行登录编码(个人):</td>
											<td><input type="text" name="USERNAME_PERBANK" id="USERNAME_PERBANK" value="${pd.USERNAME_PERBANK }" maxlength="32" placeholder="人行登录编码(个人)" title="人行登录编码(个人)" class="width-80"/></td>
										</tr>
										<tr>
											<td class="align-right width-30">人行登录编码(企业):</td>
											<td><input type="text" name="USERNAME_PERBANK_ORG" id="USERNAME_PERBANK_ORG" value="${pd.USERNAME_PERBANK_ORG }" maxlength="32" placeholder="人行登录编码(企业)" title="人行登录编码(企业)" class="width-80"/></td>
										</tr>
										<tr>
											<td class="align-right width-30">是否线上用户:</td>
											<td>
												<select name="IS_ONLINE_USER" id="IS_ONLINE_USER" value="${pd.IS_ONLINE_USER }" class="width-80">
													<option value="0" <c:if test="${pd.IS_ONLINE_USER == '0'}">selected</c:if>>否</option>
													<option value="1" <c:if test="${pd.IS_ONLINE_USER == '1'}">selected</c:if>>是</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">用户姓名:<span class="red ">*</span></td>
											<td><input type="text" name="NAME" id="name"  value="${pd.NAME }"  maxlength="32" placeholder="这里输入姓名" title="姓名" class="width-80"/></td>
										</tr>
										<!--<tr>
											<td class="align-right">柜员号:<span class="red ">*</span></td>
											<td><input type="number" name="TELLER_NUMBER" id="TELLER_NUMBER"  value="${pd.TELLER_NUMBER }"  maxlength="32" placeholder="这里输入柜员号" title="柜员号" class="width-80"/></td>
										</tr>-->
										<tr>
											<!-- <td class="align-right">部门编码:<span class="red ">*</span></td>  -->
											<td class="align-right" class='center'>部门:<span class="red ">*</span></td>
											<td>
											<!-- <input type="number" name="DEPT_CODE" id="DEPT_CODE"  value="${pd.DEPT_CODE }"  maxlength="32" placeholder="这里输入部门编码" title="部门编码" class="width-80"/>  -->
											<select class="chosen-select form-control width-80" dict-name="DeptCode" default-value="${pd.DEPT_CODE }" name="DEPT_CODE" id="DEPT_CODE">
											</select>
											</td>
										</tr>
										<tr>
											<td class="align-right">手机号:</td>
											<td><input type="number" name="PHONE" id="PHONE"  value="${pd.PHONE }"  maxlength="32" placeholder="这里输入手机号" title="手机号" class="width-80"/></td>
										</tr>
										<tr>
											<td class="align-right">邮箱:</td>
											<td><input type="email" name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="hasE('${pd.USERNAME }')" class="width-80"/></td>
										</tr>
										<tr>
											<td class="align-right">IP:</td>
											<td><input type="text" name="IP" id="IP"  value="${pd.IP }" maxlength="32" placeholder="IP" title="IP" class="width-80"/></td>
										</tr>
										<tr>
											<td class="align-right">MAC:</td>
											<td><input type="text" name="MAC" id="MAC"  value="${pd.MAC}" maxlength="32" placeholder="MAC" title="MAC" class="width-80"/></td>
										</tr>
										<tr>
											<td class="align-right">状态:</td>
											<td>
												<select name="LOCK_STATUS" id="LOCK_STATUS" class="width-80">
													<option value="0" <c:if test="${pd.LOCK_STATUS == '0'}">selected</c:if>>无效</option>
													<option value="1" <c:if test="${pd.LOCK_STATUS == '1'}">selected</c:if>>正常</option>
													<option value="2" <c:if test="${pd.LOCK_STATUS == '2'}">selected</c:if>>睡眠</option>
													<option value="3" <c:if test="${pd.LOCK_STATUS == '3'}">selected</c:if>>锁定</option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="align-right width-30">渠道编号:</td>
											<td>
												<select name="CHANNEL_ID" id="CHANNEL_ID" class="width-80">
													<option value="">请选择渠道编号</option>
													<c:forEach items="${channelList}" var="channel">
														<option value="${channel.CHANNEL_ID }" <c:if test="${pd.CHANNEL_ID == channel.CHANNEL_ID}">selected</c:if>> ${channel.CHANNEL_DES} </option>
													</c:forEach>
												</select>
											</td>
										</tr>
									</table>
									</div>
									<div class="footfix">
									     <a class="btn btn-orange btn-size1"  onClick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
										<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
dict.init({ids:['DEPT_CODE']});
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	//保存
	function save(){
		if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
			$("#loginname").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#loginname").focus();
			$("#loginname").val('');
			$("#loginname").css("background-color","white");
			return false;
		}else{
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}
		if($("#flag").val()!=""&&$("#flag").val()!="N"){
			if($("#USERNAME_PERBANK").val()==""&&$("#USERNAME_PERBANK_ORG").val()==""){
				$("#USERNAME_PERBANK").tips({
					side:3,
					msg:'该用户关联查询员角色，必须有一个人行账户!',
					bg:'#AE81FF',
					time:2
				});
				$("#USERNAME_PERBANK").focus();
				return false;
			}
		}
		 if($("#IS_ONLINE_USER").val()==""){
			 $("#IS_ONLINE_USER").tips({
				 side:3,
	             msg:'请选择是否线上用户！',
	             bg:'#AE81FF',
	             time:2
	         });
			 $("#IS_ONLINE_USER").focus();
			 return false;
		 }
		// if($("#TELLER_NUMBER").val()==""){
			// $("#TELLER_NUMBER").tips({
				// side:3,
	            // msg:'输入编号',
	            // bg:'#AE81FF',
	            // time:1
	        // });
			// $("#TELLER_NUMBER").focus();
			// return false;
		// }else{
			// $("#TELLER_NUMBER").val($.trim($("#TELLER_NUMBER").val()));
		// }
		if($("#DEPT_CODE").val()==""){
			$("#DEPT_CODE").tips({
				side:3,
	            msg:'输入部门编号',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#DEPT_CODE").focus();
			return false;
		}else{
			$("#DEPT_CODE").val($.trim($("#DEPT_CODE").val()));
		}
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#name").focus();
			return false;
		}
		/* var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if($("#PHONE").val()==""){
			
			$("#PHONE").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#PHONE").focus();
			return false;
		}else if(!myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#PHONE").focus();
			return false;
		}
		if($("#EMAIL").val()==""){
			
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#EMAIL").focus();
			return false;
		}	 */
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//判断用户id是否存在
	function hasU(){
		if($('#loginname').attr('readonly') == 'readonly'){
			return;
		}
		var USERNAME = $('#loginname').val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasU.do',
	    	data: {USERNAME:USERNAME},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#loginname").tips({
							side:3,
				            msg:'用户 ' + USERNAME + ' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#loginname").val('');
				 }
			}
		});
	}

	//判断柜员号是否存在
	function hasN(USERNAME){
		var TELLER_NUMBER = $.trim($("#TELLER_NUMBER").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasN.do',
	    	data: {TELLER_NUMBER:TELLER_NUMBER,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#TELLER_NUMBER").tips({
							side:3,
				            msg:'编号 '+TELLER_NUMBER+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#TELLER_NUMBER").val('');
				 }
			}
		});
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱 '+EMAIL+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#EMAIL").val('');
				 }
			}
		});
	}
	

</script>
</html>