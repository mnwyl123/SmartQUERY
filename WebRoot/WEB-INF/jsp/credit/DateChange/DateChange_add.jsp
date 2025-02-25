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
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<link href="css/imgUp/common.css" type="text/css" rel="stylesheet"/>
	<link href="css/imgUp/index.css" type="text/css" rel="stylesheet"/>
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
					
					<form action="SavePersonInquiryController/saveCheck.do?" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}" readonly/>
						<input type="hidden" name="CLIENT_TYPE" id="CLIENT_TYPE" value="${pd.CLIENT_TYPE}" readonly/>
						<input type="hidden" name="FILEADDRESS" id="FILEADDRESS" value="${pd.FILEADDRESS}" readonly/>
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
						  
							<tr>
								<td class="align-right width-25">客户姓名:<span class="red ">*</span></td>
								<td><input type="text" readonly name="CLIENT_NAME" id="CLIENT_NAME" value="${pd.CLIENT_NAME}" maxlength="255" placeholder="这里输入客户姓名" title="客户姓名" class="width-75"/></td>
							</tr>
							<tr>
								<th class="align-right width-25" dict-name="COM_CRED_TYPE">证件类型:<span class="red ">*</span></th>
								<td> 
									<c:if test="${pd.CLIENT_TYPE == 2 }">
										<select  dict-name="COM_CRED_TYPE" disabled default-value="${pd.CREDENTIALS_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE" style="width: 260px;" class="width-75">  
										</select>
									</c:if>
									<c:if test="${pd.CLIENT_TYPE == 1  }">
										<select style="width:180px" disabled dict-name="CRED_TYPE" default-value="${pd.CREDENTIALS_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE" style="width: 260px;" class="width-75">
										</select>
									</c:if>
								</td>
							</tr>
				
							<tr>
								<td class="align-right width-25">证件号码:<span class="red">*</span></td>
								<td><input type="text" readonly name="CREDENTIALS_NO" id="CREDENTIALS_NUM" value="${pd.CREDENTIALS_NO}" maxlength="255" placeholder="这里输入证件号码" title="证件号码" class="width-75"/></td>
							</tr>

							<tr>
							    <td class="align-right width-25">授权书:</td>
								<td>
									<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.WARRANT}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.WARRANT}" width="210"/></a>
								</td>
							</tr>
							<tr>
							    <td class="align-right width-25">贷款申请书:</td>
								<td>
									<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.LOAN_APPLICATION}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.LOAN_APPLICATION}" width="210"/></a>
								</td>
							</tr>
							<tr>
								<c:if test="${pd.CLIENT_TYPE == 1 }">
								    <td class="align-right width-25">身份证明文件:</td>
									<td>
										<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.IDENTITY_DOCUMENT}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.IDENTITY_DOCUMENT}" width="210"/></a>
									</td>
								</c:if>
								<c:if test="${pd.CLIENT_TYPE == 2 }">
								    <td class="align-right width-30 paddingt-13">营业执照:</td>
									<td>
										<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.business_licence}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.business_licence}" width="210"/></a>
									</td>
								</c:if>
							</tr>
							<tr>
							<td class="align-right">审核状态:</td>
								<td>
								
								<select name="STATUS" id="STATUS" data-placeholder="请选择审核结果" style="width: 260px;" class="width-75">
									<option value="00" <c:if test="${pd.STATUS  == '00' }">selected="selected"</c:if>>待审核</option>
									<option value="01" <c:if test="${pd.STATUS  == '01' }">selected="selected" disable</c:if>>同意</option>
									<option value="02" <c:if test="${pd.STATUS  == '02' }">selected="selected"</c:if>>不同意</option>
						  		</select>
						  		</td>
							</tr>
							<tr>
								<td class="align-right width-25">变更原因:<span class="red ">*</span></td>
								<td>
								<textarea readonly class="width-75" rows="3" cols="46" name="EDIT_REASON" id="EDIT_REASON" value="${pd.EDIT_REASON}"  clos="20" rows="4">${pd.EDIT_REASON}</textarea>
								</td>
							</tr>
							<tr>
								<td class="align-right">审核意见:</td>
								<td>
									<textarea rows="3" cols="46" name="AUDIT_OPINION" id="AUDIT_OPINION"   class="width-75">${pd.AUDIT_OPINION}</textarea>
								</td>
							</tr>
							<tr>
							     <td class="align-center" colSpan=2>
							     	<c:if test="${pd.STATUS  != '00' }">
							     		<a class="btn btn-orange btn-size1" onclick="top.Dialog.close();">关&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;闭</a>
							     	</c:if>
							     	<c:if test="${pd.STATUS  == '00' }">
							     		<a class="btn btn-orange btn-size1" onclick="save('${pd.ID}');">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</a>
							     	</c:if>
									<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--<script src="js/common/jquery-1.7.2.js"></script>-->
	<script src="js/common/imgUp.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		dict.init({ids:['CREDENTIALS_TYPE']});
		dict.init({ids:['FIND_REASON']});
		dict.init({ids:['FIND_VERSION']});
		dict.init({ids:['FIND_TYPE']});  
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
			var id=obj.id;
		}
		//保存
		function save(ID){
			if($("#STATUS").val()=="00"){
				$("#STATUS").tips({
					side:3,
		            msg:'请选择审核状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EDIT_REASON").focus();
				return false;
			}
			if($("#STATUS").val()=="02" && $("#AUDIT_OPINION").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请输入审核意见',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EDIT_REASON").focus();
				return false;
			}

			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
	</script>
</body>
</html>