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
					
					<form action="CreditInquiry/${msg}.do?INTERNAL=2" name="Form" id="Form" method="post" 
					enctype="multipart/form-data">
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
						    <tr hidden>
								<td class="align-right width-25" >查询ID:<span class="red ">*</span></td>
								<td><input type="text" name="ID" id="ID" value="${pd.ID}" maxlength="32" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25" >申请机构:<span class="red ">*</span></td>
								<input hidden type="text" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="32" readonly placeholder="这里输入申请机构"  class="width-75"/>
								<td><input type="text" name="ORG_NAME" id="ORG_NAME" value="${pd.ORG_NAME}" maxlength="32" readonly placeholder="这里输入申请机构"  class="width-75"/></td>
							
							</tr>
							<!--   <tr>
								<td class="align-right width-35">申请产品:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" name="PRO_ID" id="PRO_ID">
										<c:forEach items="${prolist}" var="pro">
											<option value="${pro.PRODUCT_ID}"<c:if test="${pd.PRO_ID==pro.PRODUCT_ID}">selected</c:if>>
												${pro.PRODUCT_NAME}
											</option>
										</c:forEach>
									</select>
								</td>
							</tr> -->
							<tr>
								<td class="align-right width-25">客户姓名:<span class="red ">*</span></td>
								<td><input type="text" name="CLIENT_NAME" id="CLIENT_NAME" value="${pd.CLIENT_NAME}" maxlength="255" placeholder="这里输入客户姓名" title="客户姓名" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">证件类型:<span class="red ">*</span></td>
								<td>
								    <select class="chosen-select form-control width-75" dict-name="CRED_TYPE_PER" default-value="${pd.CREDENTIALS_TYPE}" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE">
									    <!--<option value="0">0-身份证</option>
										<option value="1">1-户口簿证</option>
										<option value="2">2-护照</option>
										<option value="3">3-军官证</option>-->
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">证件号码:<span class="red">*</span></td>
								<td><input type="text" name="CREDENTIALS_NO" id="CREDENTIALS_NUM" value="${pd.CREDENTIALS_NO}" maxlength="255" placeholder="这里输入证件号码" title="证件号码" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">查询原因:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" dict-name="find_reason_per" default-value="${pd.QUERY_REASON}" name="QUERY_REASON" id="FIND_REASON">
									  
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">授权方式:<span class="red ">*</span></td>
								<td>
								    <select class="chosen-select form-control width-75" default-value="${pd.SHFS}" name="SHFS" id="SHFS">
									    <option value="0">0-窗口面签</option>
										<option value="1">1-非窗口面签</option>
										<option value="9">9-其他</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">有无人脸识别:<span class="red ">*</span></td>
								<td>
								    <select class="chosen-select form-control width-75" default-value="${pd.RLSB}" name="RLSB" id="RLSB	">
									    <option value="0">0-有</option>
										<option value="1">1-无</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">查询版本:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" dict-name="FIND_VERSION" default-value="${pd.QUERY_VERSION}" name="QUERY_VERSION" id="FIND_VERSION">
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">查询类型:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" dict-name="FIND_TYPE" default-value="${pd.QUERY_TYPE}" name="QUERY_TYPE" id="FIND_TYPE">
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">授权书到期日:<span class="red ">*</span></td>
								<td><input type="text"  class="span10 date-picker width-75" data-date-format="yyyymmdd" name="WARRANT_MATURITY_DATE" id="WARRANT_MATURITY_DATE" value="${pd.WARRANT_MATURITY_DATE}" title="授权书到期日"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">客户经理:<span class="red ">*</span></td>
								<td><input type="text" name="CUST_MANAGER" id="CUST_MANAGER" value="${pd.CUST_MANAGER}" maxlength="255" placeholder="这里输入客户经理" title="客户经理" class="width-75"/></td>
							</tr>
							<tr>
							    <td class="align-right width-25">授权书上传:</td>
								<td class="z_photo upimg-div clear">
									<section class="z_file fl">
									    <c:if test="${pd == null || pd.WARRANT == '' || pd.WARRANT == null }">
											<img src="img/a11.png" class="add-img">
										 </c:if>
										 <c:if test="${pd != null && pd.WARRANT != '' && pd.WARRANT != null }">
												<c:if test="${pd.WARRANTTYPE != 'pdf'}">
											 		<img src="${pd.WARRANT}" width="210"/>
											 	</c:if>
												<c:if test="${pd.WARRANTTYPE == 'pdf'}">
													<input  value="${pd.WARRANT}" />
												</c:if>
												<a href="${pd.WARRANT}" target="_blank"><img src="img/a8.png"/></a>
										 </c:if>
										 <input type="hidden" name="WARRANT" id="WARRANT1" value="${pd.WARRANT}"/>
										<input type="file" name="WARRANT" id="WARRANT" class="file"   style="width:80%;"  accept="image/jpg,image/jpeg,image/png,image/bmp,application/pdf"/> 
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
							    <td class="align-right width-25">身份证明正反面上传:</td>
								<td class="z_photo upimg-div clear">
									<section class="z_file fl">
									    <c:if test="${pd == null || pd.LOAN_APPLICATION == '' || pd.LOAN_APPLICATION == null }">
											<img src="img/a11.png" class="add-img">
										 </c:if>
										 <c:if test="${pd != null && pd.LOAN_APPLICATION != '' && pd.LOAN_APPLICATION != null }">
										 		<c:if test="${pd.LOAN_APPLICATIONTYPE != 'pdf'}">
											 		<img src="${pd.LOAN_APPLICATION}" width="210"/>
											 	</c:if>
												<c:if test="${pd.LOAN_APPLICATIONTYPE == 'pdf'}">
													<input  value="${pd.LOAN_APPLICATION}" />
												</c:if>
												<a href="${pd.LOAN_APPLICATION}" target="_blank"><img src="img/a8.png"/></a>
										 </c:if>
										 <input type="hidden" name="LOAN_APPLICATION" id="LOAN_APPLICATION1" value="${pd.LOAN_APPLICATION}"/>
										<input type="file" name="LOAN_APPLICATION" id="LOAN_APPLICATION"   style="width:80%;"  value="${pd.LOAN_APPLICATION}" class="file" accept="image/jpg,image/jpeg,image/png,image/bmp,application/pdf"/>
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
							    <td class="align-right width-25">身份证明正反面上传:</td>
								<td class="z_photo upimg-div clear">
									<section class="z_file fl">
									    <c:if test="${pd == null || pd.IDENTITY_DOCUMENT == '' || pd.IDENTITY_DOCUMENT == null }">
											<img src="img/a11.png" class="add-img">
										 </c:if>
										 <c:if test="${pd != null && pd.IDENTITY_DOCUMENT != '' && pd.IDENTITY_DOCUMENT != null }">
											    <c:if test="${pd.IDENTITY_DOCUMENTTYPE != 'pdf'}">
											 		<img src="${pd.IDENTITY_DOCUMENT}" width="210"/>
											 	</c:if>
												<c:if test="${pd.IDENTITY_DOCUMENTTYPE == 'pdf'}">
													<input  value="${pd.IDENTITY_DOCUMENT}" />
												</c:if>
												<a href="${pd.IDENTITY_DOCUMENT}" target="_blank"><img src="img/a8.png"/></a>
										 </c:if>
										 <input type="hidden" name="IDENTITY_DOCUMENT" id="IDENTITY_DOCUMENT1" value="${pd.IDENTITY_DOCUMENT}"/>
										<input type="file" name="IDENTITY_DOCUMENT" id="IDENTITY_DOCUMENT"    style="width:80%;"  class="file" accept="image/jpg,image/jpeg,image/png,image/bmp,application/pdf"/>
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
								<td class="align-right width-35">内部授权人:</td>
								<td>
									<select class="chosen-select form-control width-75" name="CHECK_SYS_ID" id="CHECK_SYS_ID">
										<c:forEach items="${checkUserList}" var="checkUser">
											<option value="${checkUser.USER_ID}-${checkUser.NAME}"<c:if test="${pd.CHECK_SYS_ID==checkUser.USER_ID}">selected</c:if>>
												${checkUser.NAME}
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<!-- 
							<tr>
								<td class="align-right width-35">微信企业号审核标识:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75"  name="IS_WX_CHECK" id="IS_WX_CHECK">
										<option value="0" <c:if test="${pd.IS_WX_CHECK=='0'}">selected</c:if>>否</option>	
										<option value="1" <c:if test="${pd.IS_WX_CHECK=='1'}">selected</c:if>>是</option>	
									</select>
								</td>
							</tr>
							 -->
							<tr>
							     <td class="align-center" colSpan=2>
							     	<a class="btn btn-orange btn-size1" onclick="save();">保&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</a>
									<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
								</td>
							</tr>
							<!--  
							<tr style="color:red">
							     <td class="align-center" colSpan=2>
							     	图片仅支持:.jpg/.png/.bmp/.jpeg
								</td>
							</tr>
							-->
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
			//if($("#FIND_REASON").val()=="01"){
				//		$("#FIND_REASON").tips({
					//		side:3,
					//		msg:'该客户信贷业务不存在或已终止，请选择其他查询原因',
					//		bg:'#AE81FF',
					//		time:2
					//	});
					//	$("#FIND_REASON").focus();
					//	return false;
			//}
			//if($("#FIND_REASON").val()=="08"){
				//		$("#FIND_REASON").tips({
					//		side:3,
						//	msg:'该客户担保业务不存在或已终止，请选择其他查询原因',
						//	bg:'#AE81FF',
						//	time:2
						//});
						//$("#FIND_REASON").focus();
						//return false;
			//}
			if($("#CLIENT_NAME").val()==""){
				$("#CLIENT_NAME").tips({
					side:3,
		            msg:'请输入客户姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLIENT_NAME").focus();
				return false;
			}
			if($("#CREDENTIALS_NUM").val()==""){
				$("#CREDENTIALS_NUM").tips({
					side:3,
		            msg:'请输入证件号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREDENTIALS_NUM").focus();
			return false;
			}
			if($("#FIND_REASON").val()=="05"){
				if($("#FIND_VERSION").val()!="31"){
					$("#FIND_VERSION").tips({
						side:3,
						msg:'查询版本与查询原因不相符',
						bg:'#AE81FF',
						time:2
					});
					$("#FIND_VERSION").focus();
					return false;
				}
				if($("#FIND_TYPE").val()!="0"){
					$("#FIND_TYPE").tips({
						side:3,
						msg:'查询类型与查询原因不相符',
						bg:'#AE81FF',
						time:2
					});
					$("#FIND_TYPE").focus();
					return false;
				}
			}
			if($("#CHECK_SYS_ID").val()==""||$("#CHECK_SYS_ID").val()==null){
				$("#CHECK_SYS_ID").tips({
					side:3,
		            msg:'请选择内部授权人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CHECK_SYS_ID").focus();
			   return false;
			}
			var CREDENTIALS_NUM=$("#CREDENTIALS_NUM").val();
			if($("#CREDENTIALS_NUM").val()!=""&&($("#CREDENTIALS_TYPE").val()=="0"||$("#CREDENTIALS_TYPE").val()=="10")){
				var reg = /(^(\d{6}(([1-9]\d{3}((01|0[3-9])|(1[0-2]))((0[1-9])|([1|2]\d)|(3[0-1])))|([1-9]\d{3}02((0[1-9])|([12]\d))))\d{3}[0-9Xx])$)|(^(\d{6}((\d{2}((01|0[3-9])|(1[0-2]))((0[1-9])|([1|2]\d)|(3[0-1])))|([1-9]\d{3}02((0[1-9])|([12]\d))))\d{3})$)/;
				if(!CREDENTIALS_NUM.match(reg)){
					$("#CREDENTIALS_NUM").tips({
						side:3,
						msg:'请输入正确的证件号码',
						bg:'#AE81FF',
						time:2
					});
					$("#CREDENTIALS_NUM").focus();
					return false;
				}
			}
			if($("#WARRANT_MATURITY_DATE").val()==""){
				$("#WARRANT_MATURITY_DATE").tips({
					side:3,
		            msg:'请选择证件到期日',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WARRANT_MATURITY_DATE").focus();
			return false;
			}
			if($("#CUST_MANAGER").val()==""){
				$("#CUST_MANAGER").tips({
					side:3,
		            msg:'请输入客户经理',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUST_MANAGER").focus();
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
							msg:'请上传身份证明文件',
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
		  function show(showUrl){
					window.open(showUrl);
				}
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});

			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		});
	</script>
</body>
</html>