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

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
				
					<!-- <div class="page-header">
							<h1>
							</h1>
					</div> --><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12 no-padding" >

					<form  action="menu/${MSG }.do" name="menuForm" id="menuForm" method="post" class="form-horizontal">
						<input type="hidden" name="MENU_ID" id="MENU_ID" value="${pd.MENU_ID }"/>
						<input type="hidden" name="url" id="url" value="${pd.url}"/>
						<div id="zhongxin">
						<table id="table_report" class="table table-striped">
						<input type="hidden" name="PARENT_ID" id="PARENT_ID" value="${pd.PARENT_ID}"/>
							<tr>
								<td class="align-right paddingt-13 width-25"  >上级:</td>
								<td class="paddingt-13">${null == (pds.MENU_NAME) ?'((无) 此部门为顶级)':(pds.MENU_NAME)}
									<%-- <div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
										<b>${null == pds.MENU_NAME ?'(无) 此部门为顶级':pds.MENU_NAME}</b>
									</div> --%>
								</td>
							</tr>
							<tr>
								<td class="align-right" >名称:<span class="red ">*</span></td>
								<td><input type="text" name="MENU_NAME" id="MENU_NAME" value="${pd.MENU_NAME}" maxlength="50" placeholder="这里输入名称" title="名称" class="width-85" onblur="hasN()"/></td>
							</tr>
							<tr>
								<td class="align-right" >英文名称:</td>
								<td><input type="text" name="MENU_NAME_EN" id="MENU_NAME_EN" value="${pd.MENU_NAME_EN}" maxlength="50" placeholder="这里输入英文名称" title="英文" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right" >菜单url:</td>
								<td><input type="text" name="MENU_URL" id="MENU_URL" value="${pd.MENU_URL}" maxlength="100" placeholder="这里输入url" title="url" class="width-85"></td>
							</tr>
							<tr>
								<td class="align-right" >菜单排序:<span class="red ">*</span></td>
								<td><input type="number" name="ORDER_BY" id="ORDER_BY" value="${pd.ORDER_BY}" maxlength="32" placeholder="这里输入排序" title="顺序" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right" >菜单组:</td>
								<td>	<select class="chosen-select form-control width-85" dict-name="menuGroup" default-value="${pd.MENU_GROUP_ID}" name="MENU_GROUP_ID" id="MENU_GROUP_ID">
										</select>
								</td>
							</tr>
							<tr>
								<td class="align-right" class='center'>菜单类型:</td>
								<td>	<select class="chosen-select form-control width-85" dict-name="menuType" default-value="${pd.MENU_TYPE}" name="MENU_TYPE" id="MENU_TYPE">
										</select>
								</td>
							</tr>
							<tr>
								<td class="align-right" class='center'>菜单渠道:</td>
								<td>	<select class="chosen-select form-control width-85" dict-name="menuChannel" default-value="${pd.MENU_CHANNEL}" name="MENU_CHANNEL" id="MENU_CHANNEL">
										</select>
								</td>
							</tr>
							<tr>
								<td class="align-right" >状态:</td>
								<td >
								<div class="col-sm-9">
									<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input name="MENU_STATE" type="radio" class="ace" id="MENU_STATE" <c:if test="${pd.MENU_STATE == 1 }">checked="checked"</c:if> value ='1'/>
										<span class="lbl"> 显示</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="MENU_STATE" type="radio" class="ace" id="MENU_STATE" <c:if test="${pd.MENU_STATE == 0 }">checked="checked"</c:if> value = '0'/>
										<span class="lbl"> 隐藏</span>
									</label>
								</div>
								</td>
							</tr>
							<tr>
								<td class="align-right" >交易码:</td>
								<td><input type="text" name="TRAN_CODE" id="TRAN_CODE" value="${pd.TRAN_CODE}" maxlength="32" placeholder="这里输入交易码" title="交易码" class="width-85"/></td>
							</tr>
							<tr>
								<td class="align-right" >所属系统:</td>
								<td><input type="text" name="SYS_IND" id="SYS_IND" value="${pd.SYS_IND}" maxlength="32" placeholder="这里输入所属系统"  title="所属系统" class="width-85"/></td>
							</tr>
							<tr>
								<c:if test="${COMPANY == 'super' }">
								<td class="align-right" >法人:</td>
								<td>
									<select class="chosen-select form-control width-85" name="COMPANY" id="COMPANY" onchange="hasN()">
			   							<c:forEach items="${listComp}" var="list">
			   								<c:if test="${list.COMP_CODE  != 'super' }">
			   								<option  value="${list.COMP_CODE }" <c:if test="${list.COMP_CODE  == pd.COMPANY }">selected="selected"</c:if>>${list.COMP_NAME }</option>
			   								</c:if>
			   							</c:forEach>
			   							<option  value="ALL" <c:if test="${'ALL'  == pd.COMPANY }">selected="selected"</c:if>>ALL</option>
									</select>
								</td>
								</c:if>
								<c:if test="${COMPANY != 'super' }">
								<td class="align-right" >法人:</td>
								<td><input type="text" name="COMPANY" id="COMPANY" value="${pd.COMPANY}" maxlength="32" title="法人" class="width-85" readonly /></td>
								</c:if>
							</tr>
						</table>
						</div>
						<div class="footfix">
						     <a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
							 <a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
						</div>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		dict.init({ids:['MENU_GROUP_ID']});
		dict.init({ids:['MENU_TYPE']});
		dict.init({ids:['MENU_CHANNEL']});
		
		$(top.hangge());
		
		//返回
		function goback(MENU_ID){
			top.jzts();
			window.location.href="<%=basePath%>menu.do?MENU_ID="+MENU_ID;
		}
		
		//保存
		function save(){
			if($("#MENU_NAME").val()==""){
				$("#MENU_NAME").tips({
					side:3,
		            msg:'请输入菜单名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MENU_NAME").focus();
				return false;
			}
			if($("#MENU_RUL").val()==""){
				$("#MENU_RUL").val('#');
			}
			if($("#MENU_TYPE").val()==""){
				$("#MENU_TYPE").val('MENUTYPE3');
			}
			if($("#MENU_CHANNEL").val()==""){
				$("#MENU_CHANNEL").val('PC');
			}
			//类型为空默认为业务类型
			if($("#MENU_TYPE").val()==""){
				$("#MENU_TYPE").val('1');
			}
			//状态值为空默认为隐藏
			if($("#MENU_STATE").val()==""){
				$("#MENU_STATE").val('0');
			}
			if($("#ORDER_BY").val()==""){
				$("#ORDER_BY").tips({
					side:1,
		            msg:'请输入菜单序号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDER_BY").focus();
				return false;
			}
			
			$("#menuForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		//设置菜单类型or状态
		function setType(type,value){
			if(type == '1'){
				$("#MENU_TYPE").val(value);
			}else{
				$("#MENU_STATE").val(value);
			}
		}

	//判断菜单名是否重复
	function hasN(){
		if($("#MENU_NAME").val()==""){
			$("#MENU_NAME").tips({
				side:3,
			     msg:'请输入菜单名称',
			      bg:'#AE81FF',
			    time:2
			 });
			$("#MENU_NAME").focus();
			return false;
		}
		var MENU_NAME = $('#MENU_NAME').val();
		var COMPANY = $('#COMPANY').val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>menu/hasN.do',
	    	data: {MENU_NAME:MENU_NAME,COMPANY:COMPANY},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#MENU_NAME").tips({
							side:3,
				            msg:'菜单名:' + MENU_NAME + ' 已经存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#MENU_NAME").val('');
					 $("#MENU_NAME").focus();
				 }
			}
		});
	}
	</script>
</body>
</html>