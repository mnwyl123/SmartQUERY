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
<link rel="stylesheet" type="text/css" href="static/iconfont2/iconfont.css">
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
							<form action="pwdRuleConfig/edit.do" method="post" name="Form" id="Form">
								<div id="zhongxin" class="center paddingt-13">
								<table id="table_report" class="table table-striped center paddingt-13">
									<tr>
										<td class="width-40 align-right paddingt-13"  >密码过期天数:</td>
										<td class="align-left width-10">
										<input type="number" name="EFFECT_DAYS" onBlur="onif(this.id,this.value)" id="EFFECT_DAYS" value="${pd.EFFECT_DAYS}" maxlength="32" placeholder="这里输入过期天数" title="过期天数"  />
										</td>
									</tr>
									<tr>
										<td class="width-40 align-right paddingt-13" >密码最小长度:</td>
										<td class="align-left">
										<input type="number" name="MIN_LENGTH" onBlur="onif(this.id,this.value)" id="MIN_LENGTH" value="${pd.MIN_LENGTH}" maxlength="32" placeholder="这里输入最小长度" title="最小长度" " /></td>
										<td class="align-left width-15" >
										<span class="red2 ">*</span>
										(可填>5的数字)
										</td>
										<td class="align-left">
										<i class="iconfont icon-duihao green" id="duihao" style="display:none"></i>
										<i class="iconfont icon-cuohao red" id="cuohao" style="display:none" ></i>
										</td>
									</tr>
									<tr>
										<td class="width-40 align-right paddingt-13" >密码最大长度:</td>
										<td class="align-left"><input type="number" onBlur="onif(this.id,this.value)" name="MAX_LENGTH" id="MAX_LENGTH" value="${pd.MAX_LENGTH}" maxlength="32" placeholder="这里输入最大长度" title="最大长度" /></td>
										<td class="align-left width-15">
										<span class="red2">*</span>
										(可填<20的数字)
										</td>
										<td class="align-left">
										<i class="iconfont icon-duihao green" id="duihao1" style="display:none"></i>
										<i class="iconfont icon-cuohao red" id="cuohao1" style="display:none" ></i>
										</td>
									</tr>
									<tr>
										<td class="width-40 align-right paddingt-13" >密码不能重复次数:</td>
										<td class="align-left"><input type="number" onBlur="onif(this.id,this.value)" name="REPEAT_NUM" id="REPEAT_NUM" value="${pd.REPEAT_NUM}" maxlength="32" placeholder="这里输入不能重复次数" title="不能重复次数" /></td>
										<td class="align-left width-15">
										<span class="red2">*</span>
										(可填≤3的数字)
										</td>
										<td class="align-left">
										<i class="iconfont icon-duihao green" id="duihao2" style="display:none"></i>
										<i class="iconfont icon-cuohao red" id="cuohao2" style="display:none" ></i>
										</td>
									</tr>
									<tr>
										<td class="width-40 align-right paddingt-13" >密码连续输错锁定次数:</td>
										<td class="align-left"><input type="number" onBlur="onif(this.id,this.value)" name="MAX_ERROR_LOGON" id="MAX_ERROR_LOGON" value="${pd.MAX_ERROR_LOGON}" maxlength="32" placeholder="这里输入连续输错次数" title="连续输错次数" /></td>
										<td class="align-left width-15">
										<span class="red2">*</span>
										(可填≤3的数字)
										</td>
										<td class="align-left">
										<i class="iconfont icon-duihao green" id="duihao3" style="display:none"></i>
										<i class="iconfont icon-cuohao red" id="cuohao3" style="display:none" ></i>
										</td>
									</tr>
									<tr>
										<td class="width-40 align-right paddingt-13" >密码重复修改限制时间:</td>
										<td class="align-left"><input type="number" onBlur="onif(this.id,this.value)" name="MODIFIED_RESTRICT_TIME" id="MODIFIED_RESTRICT_TIME" value="${pd.MODIFIED_RESTRICT_TIME}" maxlength="32" placeholder="这里输入重复修改限制时间" title="重复修改限制时间" /></td>
										<td class="align-left width-15">
										<span class="red2">*</span>
										(可填≤3的数字)
										</td>
										<td class="align-left">
										<i class="iconfont icon-duihao green" id="duihao4" style="display:none"></i>
										<i class="iconfont icon-cuohao red" id="cuohao4" style="display:none" ></i>
										</td>
									</tr>
									<tr>
										<td class="width-40 align-right paddingt-13" >密码是否包含小写字母:</td>
										<td class="align-left">
										<input type="checkbox" id="lowercase" name="lowercase"  class="ace ace-switch ace-switch-3"  >
										<span class="lbl" ></span>
										</td>
									</tr>
									<tr>
										<td class="width-40 align-right paddingt-13" >密码是否包含大写字母:</td>
										<td class="align-left">
										<input id="capital" name="capital"  class="ace ace-switch ace-switch-3" type="checkbox"  >
										<span class="lbl"></span>
										</td>
									</tr>
									<tr>
										<td class="width-40 align-right paddingt-13" >密码是否包含数字:</td>
										<td class="align-left">
										<input id="number" name="number"  class="ace ace-switch ace-switch-3" type="checkbox"  >
										<span class="lbl"></span>
										</td>
									</tr>
									<tr>
										<td class="width-40 align-right paddingt-13" >密码是否包含特殊字符:</td>
										<td class="align-left">
										<input id="specialCharacter" name="specialCharacter"  class="ace ace-switch ace-switch-3" type="checkbox"  >
										<span class="lbl"></span>
										</td>
									</tr>
									<tr>
										<td class="center" colspan="10">
										<a class="btn btn-orange btn-size1" id="savebtn" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
									</td>
									</tr>
								</table>
								</div>
								<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
							</form>
						</div>
					</div>
						
				</div>
					
			</div>
				
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
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	var min=true,max=true,REPEAT=true,ERRORNUM=true,time=true;
		$(top.hangge());
		$(document).ready(function() {
			var pr = '${pd.PASSWORD_RULE}';
			var len=pr.split(',');
			for(var i=0;i<len.length;i++)
			{
				
				$("input[name='"+len[i]+"']").attr("checked","checked");
			}
			
		})
		
		function onif(id,value){
			var temp = "#"+id;
			if(value!=""){
				if(value<=0){
					$(temp).tips({
						side:3,
						msg:'必须为大于0的整数',
						bg:'#AE81FF',
						time:2
					});
					$(temp).focus();
				}
				if(id=="MIN_LENGTH"){
					if(value>5){
						document.getElementById("duihao").style.display="block";
						document.getElementById("cuohao").style.display="none";
						min=true;
					}else{
						document.getElementById("duihao").style.display="none";
						document.getElementById("cuohao").style.display="block";
						min=false;
					}
				}
				if(id=="MAX_LENGTH"){
					if(value<20 && value>0){
						document.getElementById("duihao1").style.display="block";
						document.getElementById("cuohao1").style.display="none";
						max=true;
					}else{
						document.getElementById("duihao1").style.display="none";
						document.getElementById("cuohao1").style.display="block";
						max=false;
					}
				}
				if(id=="REPEAT_NUM"){
					if(value<=3 && value>0){
						document.getElementById("duihao2").style.display="block";
						document.getElementById("cuohao2").style.display="none";
						REPEAT=true;
					}else{
						document.getElementById("duihao2").style.display="none";
						document.getElementById("cuohao2").style.display="block";
						REPEAT=false;
					}
				}
				if(id=="MAX_ERROR_LOGON"){
					if(value<=3 && value>0){
						document.getElementById("duihao3").style.display="block";
						document.getElementById("cuohao3").style.display="none";
						ERRORNUM=true;
					}else{
						document.getElementById("duihao3").style.display="none";
						document.getElementById("cuohao3").style.display="block";
						ERRORNUM=false;
					}
				}
				if(id=="MODIFIED_RESTRICT_TIME"){
					if(value<=3 && value>0){
						document.getElementById("duihao4").style.display="block";
						document.getElementById("cuohao4").style.display="none";
						time=true;
					}else{
						document.getElementById("duihao4").style.display="none";
						document.getElementById("cuohao4").style.display="block";
						time=false;
					}
				}
				
			btnIs();
			}else{
				$(temp).tips({
					side:2,
		            msg:'不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#savebtn").removeClass("btn btn-orange btn-size1");
				$("#savebtn").addClass("btn btn-size1"); 
				$("#savebtn").attr("disabled", true);
				$(temp).focus();
			}
		}
		function btnIs(){
			if(min && max && REPEAT && ERRORNUM && time){
				$("#savebtn").removeClass("btn  btn-size1");
				$("#savebtn").addClass("btn btn-orange btn-size1"); 
				$("#savebtn").attr("disabled", false); 
			}else
			{
				$("#savebtn").removeClass("btn btn-orange btn-size1");
				$("#savebtn").addClass("btn btn-size1"); 
				$("#savebtn").attr("disabled", true); 
			}
		}
		function save(){
			if(!$('#lowercase').is(':checked')&&!$('#capital').is(':checked')&&!$('#number').is(':checked')&&!$('#specialCharacter').is(':checked')){
				$("#lowercase").tips({
					side:2,
		            msg:'至少选择一种校验方式',
		            bg:'#AE81FF',
		            time:2
		        });
			}else if(min && max && REPEAT && ERRORNUM && time){
				var url = "<%=basePath%>pwdRuleConfig/edit.do";
				$.post(url, $('Form').serialize());
				$("#zhongxin2").show();
				bootbox.dialog({
					message: "<span class='bigger-110'>密码配置成功</span>",
					buttons:
						{
							"button" :
							{
								"label" : "确定",
								"className" : "btn-sm btn-success",
								"callback": function() {
								window.location.reload();
								}
							}
						}
				});
			}
			
			
		}
	</script>

</body>
</html>