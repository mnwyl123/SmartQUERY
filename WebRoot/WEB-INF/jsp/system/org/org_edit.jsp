<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<!-- jsp文件头和头部 -->
		<%@ include file="../../system/index/top.jsp"%>
		
	
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
					
					<form action="org/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ORG_ID" id="ORG_ID" value="${pd.ORG_ID}"/>
						<input type="hidden" name="url" id="url" value="${pd.url}"/>
						<input type="hidden" name="ORG_LEVEL" id="ORG_LEVEL" value="${pd.ORG_LEVEL}"/>
						<div id="zhongxin">
						<table id="table_report" class="table table-striped" >
						<input type="hidden" name="PARENT_ID" id="PARENT_ID" value="${pd.PARENT_ID}"/>
							<tr>
								<td class="align-right paddingt-13 width-35">上级:</td>
								<td class="align-left paddingt-13">${null == (pds.NAME) ?'((无) 此部门为顶级)':(pds.NAME)}
									<%-- <div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
										<b>${null == pds.NAME ?'(无) 此部门为顶级':pds.NAME}</b>
									</div> --%>
								</td>
							</tr>
							<tr>
								<td class="align-right">名称:<span class="red ">*</span></td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="50" placeholder="这里输入名称" title="名称" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">机构简称:</td>
								<td><input type="text" name="SIMPLENAME" id="SIMPLENAME" value="${pd.SIMPLENAME}" maxlength="50" placeholder="这里输入机构简称" title="机构简称" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">英文:</td>
								<td><input type="text" name="NAME_EN" id="NAME_EN" value="${pd.NAME_EN}" maxlength="50" placeholder="这里输入英文" title="英文" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">行内机构编码:<span class="red ">*</span></td>
								<td><input type="text" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="32" placeholder="这里输入编码 (不重复, 禁止修改)" title="编码" class="width-85" onblur="hasBianma();" <c:if test="${null != pd.ORG_CODE}">readonly="readonly" disabled</c:if>/></td>
							</tr>
							<tr>
								<td class="align-right">上报机构编码(个人):</td>
								<td><input type="text" name="ORG_ID_PERBANK" id="ORG_ID_PERBANK" value="${pd.ORG_ID_PERBANK}" maxlength="32" placeholder="这里输入个人上报机构编码" title="个人上报人行机构编码" class="width-85"></td>
							</tr>
							<tr>
								<td class="align-right">上报机构编码(企业):</td>
								<td><input type="text" name="ORG_ID_COMBANK" id="ORG_ID_COMBANK" value="${pd.ORG_ID_COMBANK}" maxlength="32" placeholder="这里输入企业上报机构编码" title="企业上报人行机构编码" class="width-85"></td>
							</tr>
							<tr>
								<td class="align-right">人行查询网点编码(个人):</td>
								<td><input type="text" name="BRANCH_CODE_PERBANK" id="BRANCH_CODE_PERBANK" value="${pd.BRANCH_CODE_PERBANK}" maxlength="32" placeholder="这里输入查询网点编码" title="个人查询网点编码" class="width-85"></td>
							</tr>
							<tr>
								<td class="align-right">人行查询网点编码(企业):</td>
								<td><input type="text" name="BRANCH_CODE_COMBANK" id="BRANCH_CODE_COMBANK" value="${pd.BRANCH_CODE_COMBANK}" maxlength="32" placeholder="这里输入查询网点编码" title="企业查询网点编码" class="width-85"></td>
							</tr>
							<tr>
								<td class="align-right">负责人:</td>
								<td><input type="text" name="HEADMAN" id="HEADMAN" value="${pd.HEADMAN}" maxlength="32" placeholder="这里输入负责人" title="负责人" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">手机号码:<span class="red ">*</span></td>
								<td><input type="number" name="TEL" id="TEL" value="${pd.TEL}" maxlength="32" placeholder="这里输入手机号码" title="手机号码" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">部门职能:</td>
								<td><input type="text" name="FUNCTIONS" id="FUNCTIONS" value="${pd.FUNCTIONS}" maxlength="32" placeholder="这里输入部门职能" title="部门职能" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="32" placeholder="这里输入地址" title="地址" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">机构行政区代码:<span class="red ">*</span></td>
								<td><input type="number" name="REGIONALISM_CODE" id="REGIONALISM_CODE" value="${pd.REGIONALISM_CODE}" maxlength="32" placeholder="这里输入机构行政区代码" title="机构行政区代码" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">法人:</td>
								<td><input type="text" name="COMPANY" id="COMPANY" value="${pd.COMPANY}" maxlength="32"  title="法人" class="width-85" readonly/></td>
							</tr>
							<tr>
								<td class="align-right">机构描述:</td>
								<td><input type="text" name="ORG_DESC" id="ORG_DESC" value="${pd.ORG_DESC}" maxlength="32" placeholder="这里输入机构描述" title="描述" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">机构顺序:<span class="red ">*</span></td>
								<td><input type="number" name="ORG_ORDER" id="ORG_ORDER" value="${pd.ORG_ORDER}" maxlength="32" placeholder="这里输入机构顺序，为数字" title="顺序" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right">状态:</td>
								<td>
								<%-- <input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="2" placeholder="这里输入状态，填0或1或者为空" title="状态" class="width-85"/> --%>
									<select name="STATUS" id="STATUS" class="chosen-select form-control  width-85" >
							                <option  value="0" <c:if test="${pd.STATUS == '0'}">selected="selected"</c:if>>正常</option>
							                <option  value="1" <c:if test="${pd.STATUS == '1'}">selected="selected"</c:if>>停用</option>
							                <option  value="2" <c:if test="${pd.STATUS == '2'}">selected="selected"</c:if>>被合并</option>
							        </select>
								</td>
							</tr>
							<tr>
								<td class="center" colspan="10">
									<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
								</td>
							</tr>
						</table>
						</div>
						<!-- <div class="footfix">
							<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
							<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
						</div> -->
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
				return false;
			}
			var str = /^[0-9a-zA-Z]*$/g;
			if($("#ORG_CODE").val()==""){
				$("#ORG_CODE").tips({
					side:3,
		            msg:'请输入编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORG_CODE").focus();
				return false;
			}else if(!str.test($("#ORG_CODE").val())){
				$("#ORG_CODE").tips({
					side:3,
		            msg:'编码由数字字母或数字和字母的组合组成',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#ORG_CODE").focus();
				return false;
			}
			/*if($("#ORG_ID_PERBANK").val()==""){
				$("#ORG_ID_PERBANK").tips({
					side:3,
		            msg:'请输入个人上报机构编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORG_ID_PERBANK").focus();
				return false;
			}
			if($("#ORG_ID_COMBANK").val()==""){
				$("#ORG_ID_COMBANK").tips({
					side:3,
		            msg:'请输入企业上报机构编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORG_ID_COMBANK").focus();
				return false;
			}
			if($("#BRANCH_CODE_PERBANK").val()==""){
				$("#BRANCH_CODE_PERBANK").tips({
					side:3,
		            msg:'请输入个人查询网点编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BRANCH_CODE_PERBANK").focus();
				return false;
			}
			if($("#BRANCH_CODE_COMBANK").val()==""){
				$("#BRANCH_CODE_COMBANK").tips({
					side:3,
		            msg:'请输入企业查询网点编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BRANCH_CODE_COMBANK").focus();
				return false;
			}*/
			
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if($("#TEL").val()==""){
				$("#TEL").tips({
					side:3,
	            	msg:'电话号输入不正确',
	            	bg:'#AE81FF',
	            	time:1
	        	});
				$("#TEL").focus();
				return false;
			}else if(!myreg.test($("#TEL").val())){
			$("#TEL").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#TEL").focus();
			return false;
		}
		if(($("#REGIONALISM_CODE").val().length !=6)){
				$("#REGIONALISM_CODE").tips({
					side:3,
		            msg:'请输入六位机构行政区代码',
		            bg:'#AE81FF',
		            time:1
		        });
				$("#REGIONALISM_CODE").focus();
				return false;
			}
			if($("#ORG_ORDER").val()==""){
				$("#ORG_ORDER").tips({
					side:3,
		            msg:'机构顺序为数字且必填',
		            bg:'#AE81FF',
		            time:1
		        });
				$("#ORG_ORDER").focus();
				return false;
			}
			if(($("#ORG_ORDER").val().length > 32)){
				$("#ORG_ORDER").tips({
					side:3,
		            msg:'机构顺序长度不能超过32位',
		            bg:'#AE81FF',
		            time:1
		        });
				$("#ORG_ORDER").focus();
				return false;
			}
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			
		}
		
		//判断编码是否存在
		function hasBianma(){
			var ORG_CODE = $.trim($("#ORG_CODE").val());
			if("" == ORG_CODE)return;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>org/hasBianma.do',
		    	data: {ORG_CODE:ORG_CODE,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("error" == data.result){
						$("#ORG_CODE").tips({
							side:1,
				            msg:'编码'+ORG_CODE+'已存在,重新输入',
				            bg:'#AE81FF',
				            time:2
				        });
						$('#ORG_CODE').val('');
					 }
				}
			});
		}
		</script>
</body>
</html>