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
					
					<form action="SavePersonInquiryController/saveCompany.do" name="Form" id="Form" method="post" 
					enctype="multipart/form-data">
						<div id="zhongxin" class="paddingt-13">
						<input type="hidden" name="WARRANT1" id="WARRANT1" value="${pd.WARRANT }"/>
						<input type="hidden" name="LOAN_APPLICATION1" id="LOAN_APPLICATION1" value="${pd.LOAN_APPLICATION }"/>
						<input type="hidden" name="IDENTITY_DOCUMENT1" id="IDENTITY_DOCUMENT1" value="${pd.IDENTITY_DOCUMENT }"/>
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
					    <tr hidden>
							<td class="align-right width-25" >查询ID:<span class="red ">*</span></td>
							<td><input type="text" name="ID" id="ID" value="${pd.ID}" maxlength="32" class="width-75"/></td>
						</tr>
							<tr>
							    <td class="align-right width-25">授权书上传:</td>
								<td class="z_photo upimg-div clear">
									<section class="z_file fl">
									    <c:if test="${pd == null || pd.WARRANT == '' || pd.WARRANT == null }">
											<img src="img/a11.png" class="add-img">
										 </c:if>
										 <c:if test="${pd != null && pd.WARRANT != '' && pd.WARRANT != null }">
										 <img src="<%=basePath%>uploadFiles/uploadImgs/${pd.WARRANT}" width="210"/>
										 </c:if>
										 <input type="hidden" name="WARRANT" id="WARRANT1" value="${pd.WARRANT}"/>
										<input type="file" name="WARRANT" id="WARRANT" value="${pd.WARRANT}" class="file"  accept="image/jpg,image/jpeg,image/png,image/bmp,image/JPG,image/JPEG,image/PNG,image/BMP"/> 
									 </section>
								</td>
								<aside class="mask works-mask">
									<div class="mask-content">
										<p class="del-p">您确定要删除吗？</p>
										<p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
									</div>
							    </aside>
							</tr>
							<tr>
							    <td class="align-right width-25">贷款申请书上传:</td>
								<td class="z_photo upimg-div clear">
									<section class="z_file fl">
									    <c:if test="${pd == null || pd.LOAN_APPLICATION == '' || pd.LOAN_APPLICATION == null }">
											<img src="img/a11.png" class="add-img">
										 </c:if>
										 <c:if test="${pd != null && pd.LOAN_APPLICATION != '' && pd.LOAN_APPLICATION != null }">
										 <img src="<%=basePath%>uploadFiles/uploadImgs/${pd.LOAN_APPLICATION}" width="210"/>
										 </c:if>
										 <input type="hidden" name="LOAN_APPLICATION" id="LOAN_APPLICATION1" value="${pd.LOAN_APPLICATION}"/>
										<input type="file" name="LOAN_APPLICATION" id="LOAN_APPLICATION" value="${pd.LOAN_APPLICATION}" class="file" accept="image/jpg,image/jpeg,image/png,image/bmp,image/JPG,image/JPEG,image/PNG,image/BMP"/>
									 </section>
								</td>
								<aside class="mask works-mask">
									<div class="mask-content">
										<p class="del-p">您确定要删除吗？</p>
										<p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
									</div>
							    </aside>
							</tr>
							<tr>
							    <td class="align-right width-25">营业执照上传:</td>
								<td class="z_photo upimg-div clear">
									<section class="z_file fl">
									    <c:if test="${pd == null || pd.business_licence == '' || pd.business_licence == null }">
											<img src="img/a11.png" class="add-img">
										 </c:if>
										 <c:if test="${pd != null && pd.business_licence != '' && pd.business_licence != null }">
										 <img src="<%=basePath%>uploadFiles/uploadImgs/${pd.business_licence}" width="210"/>
										 </c:if>
										 <input type="hidden" name="IDENTITY_DOCUMENT" id="IDENTITY_DOCUMENT1" value="${pd.business_licence}"/>
										<input type="file" name="IDENTITY_DOCUMENT" id="IDENTITY_DOCUMENT"  value="${pd.business_licence}" class="file" accept="image/jpg,image/jpeg,image/png,image/bmp,image/JPG,image/JPEG,image/PNG,image/BMP"/>
									 </section>
								</td>
								<aside class="mask works-mask">
									<div class="mask-content">
										<p class="del-p">您确定要删除吗？</p>
										<p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
									</div>
							    </aside>
							</tr>
							<tr>

							</tr>
							<tr>
								<td class="align-right width-35">变更原因:<span class="red ">*</span></td>
								<td>
									<!-- <input class="chosen-select form-control width-75" type="text"/>-->
									<textarea class="chosen-select form-control width-75" name="EDIT_REASON" id="EDIT_REASON" value="${pd.EDIT_REASON}"  clos="20" rows="4">${pd.EDIT_REASON}</textarea>
								</td>
							</tr>
							<c:if test="${pd.STATUS != '00'}">
							<tr>
							<td class="align-right">审核状态:</td>
								<td>
								
								<select name="STATUS" disabled id="STATUS" data-placeholder="请选择审核结果" style="width: 260px;" class="width-75">
									<option value="00" <c:if test="${pd.STATUS  == '00' }">selected="selected"</c:if>>待审核</option>
									<option value="01" <c:if test="${pd.STATUS  == '01' }">selected="selected" disable</c:if>>同意</option>
									<option value="02" <c:if test="${pd.STATUS  == '02' }">selected="selected"</c:if>>不同意</option>
						  		</select>
						  		</td>
							</tr>
							<tr>
								<td class="align-right">审核意见:</td>
								<td>
									<textarea readonly rows="3" cols="46" name="AUDIT_OPINION" id="AUDIT_OPINION"   class="width-75">${pd.AUDIT_OPINION}</textarea>
								</td>
							</tr>
							 </c:if>
							<tr>
						        <td class="align-center" colSpan=2>
						        	<%-- <c:if test="${pd.STATUS == '00'}"> --%>
								     	<a class="btn btn-orange btn-size1" onclick="save();">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交</a>
										<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a>
									 <%-- </c:if>
									 <c:if test="${pd.STATUS != '00'}">
								     	<a class="btn btn-orange btn-size1" onclick="top.Dialog.close();">关&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;闭</a>
									 </c:if> --%>
								</td>
							</tr>
							<tr style="color:red">
							     <td class="align-center" colSpan=2>
							     	图片仅支持:.jpg/.png/.bmp/.jpeg
								</td>
							</tr>
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
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
			var id=obj.id;
		    if(fileType != '.gif'&&fileType != '.png'&&fileType != '.jpg'&&fileType != '.jpeg'){
		    	$("#"+id).tips({
					side:3,
		            msg:'只能上传图片',
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#"+id).val('');
		    	document.getElementById(id).files[0] = '只能上传图片';
		    }
		}
		//保存
		function save(){
			if($("#EDIT_REASON").val()==""){
				$("#EDIT_REASON").tips({
					side:3,
		            msg:'请输入变更原因',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EDIT_REASON").focus();
				return false;
			}
			if($("#FIND_REASON").val()!="01"&&$("#FIND_REASON").val()!="05"){
				if($("#WARRANT1").val()==""){
					if($("#WARRANT").val()==""){
						$("#WARRANT").tips({
							side:3,
							msg:'请上传授权书',
							bg:'#AE81FF',
							time:2
					   });
					   $("#WARRANT").focus();
					   return false;
				   }
				}
				if($("#LOAN_APPLICATION1").val()==""){
					if($("#LOAN_APPLICATION").val()==""){
						$("#LOAN_APPLICATION").tips({
							side:3,
							msg:'请上传贷款申请书',
							bg:'#AE81FF',
							time:2
						});
						$("#LOAN_APPLICATION").focus();
						return false;
					}
				}
				if($("#IDENTITY_DOCUMENT1").val()==""){
					if($("#IDENTITY_DOCUMENT").val()==""){
						$("#IDENTITY_DOCUMENT").tips({
							side:3,
							msg:'请上传营业执照',
							bg:'#AE81FF',
							time:2
						});
						$("#IDENTITY_DOCUMENT").focus();
						return false;
					}
				}
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