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
					
					<form action="dictionaries/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DICTIONARIES_ID" id="DICTIONARIES_ID" value="${pd.DICTIONARIES_ID}"/>
						<input type="hidden" name="PARENT_ID" id="PARENT_ID" value="${null == (pd.PARENT_ID) ? DICTIONARIES_ID:(pd.PARENT_ID)}"/>
						<input type="hidden" name="url" id="url" value="${pd.url}"/>
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
							<tr>
								<td class="align-right width-25">上级:</td>
								<td class="align-left">
									<!-- <div class="col-xs-4 "> --><!-- label label-lg label-light arrowed-in arrowed-right -->
										${null == (pds.NAME) ?'((无) 此项为顶级)':(pds.NAME)}
									<!-- </div> -->
								</td>
							</tr>
							<tr>
								<td class="align-right">名称:<span class="red ">*</span></td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="50" placeholder="这里输入名称" title="名称" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">英文:<span class="red ">*</span></td>
								<td><input type="text" name="NAME_EN" id="NAME_EN" value="${pd.NAME_EN}" maxlength="50" placeholder="这里输入英文" title="英文" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">编码:<span class="red ">*</span></td>
								<c:if test="${null != (pd.DICT_CODE)}">
									<td><input type="text" name="DICT_CODE" id="DICT_CODE" value="${pd.DICT_CODE}" maxlength="32" placeholder="这里输入编码" title="编码" class="width-75" readonly="readonly"/></td>
								</c:if>
								<c:if test="${null == (pd.DICT_CODE)}">
									<td><input type="text" name="DICT_CODE" id="DICT_CODE" value="${pd.DICT_CODE}" maxlength="32" placeholder="这里输入编码" title="编码" class="width-75" onblur="hasBianma('${pd.PARENT_ID }')"/></td>
								</c:if>
							</tr>
							<tr>
								<td class="align-right">排序:<span class="red ">*</span></td>
								<td><input type="number" name="ORDER_BY" id="ORDER_BY" value="${pd.ORDER_BY}" maxlength="32" placeholder="这里输入排序" title="排序" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right">备注:</td>
								<td>
									<textarea rows="3" cols="46" name="BZ" id="BZ" placeholder="这里输入备注" title="备注"  class="width-75">${pd.BZ}</textarea>
								</td>
							</tr>
							<tr>
								<td class="align-right">排查表:</td>
								<td><input type="text" name="TBSNAME" id="TBSNAME" value="${pd.TBSNAME}" maxlength="100" placeholder="这里输入表名, 多个用逗号分隔(非必录)" title="排查表" class="width-75"/></td>
							</tr>
							<tr>
								<td colspan="10" class="center"><p class="text-warning bigger-110 orange">排查表：删除此条数据时会去此表查询是否被占用(是:禁止删除)</p></td>
							</tr>
							<!-- <tr>
								<td class="center" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr> -->
						</table>
						</div>
						<div class="footfix">
							<a class="btn btn-orange btn-size1" onclick="save();">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</a>
							<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif"  class="width50" /><br/><h4 class="lighter block green"></h4></div>
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
			if($("#NAME_EN").val()==""){
				$("#NAME_EN").tips({
					side:3,
		            msg:'请输入英文',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME_EN").focus();
			return false;
		}
			if($("#DICT_CODE").val()==""){
				$("#DICT_CODE").tips({
					side:3,
		            msg:'请输入编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DICT_CODE").focus();
			return false;
		}
			if($("#ORDER_BY").val()==""){
				$("#ORDER_BY").tips({
					side:3,
		            msg:'请输入数字',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORDER_BY").focus();
			return false;
		}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			
		}
		
		//判断编码是否存在
		function hasBianma(PARENT_ID){
			var DICT_CODE = $.trim($("#DICT_CODE").val());
			if("" == DICT_CODE)return;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>dictionaries/hasBianma.do',
		    	data: {DICT_CODE:DICT_CODE,PARENT_ID:PARENT_ID,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("error" == (data.result)){
						$("#DICT_CODE").tips({
							side:1,
				            msg:'编码'+DICT_CODE+'已存在,重新输入',
				            bg:'#AE81FF',
				            time:2
				        });
						$('#DICT_CODE').val('');
					}
				}
			});
		}
		</script>
</body>
</html>