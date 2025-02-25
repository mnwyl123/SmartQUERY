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
					
					<form action="CompanyInquiry/${msg}.do?INTERNAL=1" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
						    <tr>
                        		<td><input type="text" name="ID" id="ID" value="${pd.ID}" maxlength="32" readonly hidden="true"  class="width-75"/></td>
                        	</tr>
							<tr>
								<td class="align-right width-25" >申请机构:<span class="red ">*</span></td>
								<td><input type="text" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="32" readonly placeholder="这里输入申请机构"  class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">客户名称:<span class="red ">*</span></td>
								<td><input type="text" name="COMPANY_NAME" id="COMPANY_NAME" value="${pd.COMPANY_NAME}" maxlength="255" readonly placeholder="这里输入客户名称" title="客户名称" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">证件类型:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" dict-name="CRED_TYPE_COM" default-value="${pd.CREDENTIALS_NO_TYPE}" name="CREDENTIALS_NO_TYPE" id="CREDENTIALS_NO_TYPE">  
									</select>
									<!--<input type="text" hidden name="CREDENTIALS_NO_TYPE" id="CREDENTIALS_NO_TYPE"  readonly value="${pd.CREDENTIALS_NO_TYPE}" maxlength="255"  title="证件号类型" class="width-75"/>-->
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">企业证件号码:<span class="red">*</span></td>
								<td><input type="text" name="CHINA_CREDIT_CODE" id="CHINA_CREDIT_CODE" value="${pd.CHINA_CREDIT_CODE}" readonly maxlength="255" placeholder="这里输入中征码" title="中征码" class="width-75"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">查询原因:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75" dict-name="EntFindReason" default-value="${pd.QUERY_REASON}" name="QUERY_REASON" id="FIND_REASON">
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">查询版本:<span class="red ">*</span></td>
								<td>
								    <select class="chosen-select form-control width-75" disabled dict-name="FIND_VERSION" default-value="${pd.QUERY_VERSION}" name="QUERY_VERSION" id="FIND_VERSION"> 
									</select>
								    <input type="text" hidden name="QUERY_VERSION" id="FIND_VERSION" dict-name="FIND_VERSION" readonly value="${pd.QUERY_VERSION}" maxlength="255"  title="查询版本" class="width-75"/>
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
										 <img src="${pd.WARRANT}" width="210"/>
										 </c:if>
										 <input type="hidden" name="WARRANT" id="WARRANT1" value="${pd.WARRANT}"/>
										<input type="file" name="WARRANT" id="WARRANT" class="file"  accept="image/jpg,image/jpeg,image/png,image/bmp,image/JPG,image/JPEG,image/PNG,image/BMP"/> 
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
										 <img src="${pd.LOAN_APPLICATION}" width="210"/>
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
									    <c:if test="${pd == null || pd.IDENTITY_DOCUMENT == '' || pd.IDENTITY_DOCUMENT == null }">
											<img src="img/a11.png" class="add-img">
										 </c:if>
										 <c:if test="${pd != null && pd.IDENTITY_DOCUMENT != '' && pd.IDENTITY_DOCUMENT != null }">
										 <img src="${pd.IDENTITY_DOCUMENT}" width="210"/>
										 </c:if>
										 <input type="hidden" name="IDENTITY_DOCUMENT" id="IDENTITY_DOCUMENT1" value="${pd.IDENTITY_DOCUMENT}"/>
										<input type="file" name="IDENTITY_DOCUMENT" id="IDENTITY_DOCUMENT"  class="file" accept="image/jpg,image/jpeg,image/png,image/bmp,image/JPG,image/JPEG,image/PNG,image/BMP"/>
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
											<option value="${checkUser.USER_ID }"<c:if test="${pd.CHECK_SYS_ID==checkUser.USER_ID}">selected</c:if>>
												${checkUser.NAME}
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<%--<tr>
								<td class="align-right width-35">微信企业号审核标识:<span class="red ">*</span></td>
								<td>
									<select class="chosen-select form-control width-75"  name="IS_WX_CHECK" id="IS_WX_CHECK">
										<option value="0" <c:if test="${pd.IS_WX_CHECK=='0'}">selected</c:if>>否</option>	
										<option value="1" <c:if test="${pd.IS_WX_CHECK=='1'}">selected</c:if>>是</option>	
									</select>
								</td>
							</tr>--%>
							<tr>
							     <td class="align-center" colSpan=2>
							     	<a class="btn btn-orange btn-size1" onclick="save();">保&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</a>
									<a class="btn btn-size1 btn-default" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
								</td>
							</tr>
							<tr style="color:red">
							     <td class="align-center" colSpan=2>
							     	
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
	<!-- 上传控件 -->
	<script src="js/common/imgUp.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
	    dict.init({ids:['CREDENTIALS_NO_TYPE']});
		dict.init({ids:['FIND_VERSION']});
		dict.init({ids:['FIND_TYPE']}); 
        dict.init({ids:['FIND_REASON']});		
		$(top.hangge());
		$(function() {
			//上传
			$('#WARRANT,#LOAN_APPLICATION,#IDENTITY_DOCUMENT').ace_file_input({
				no_file:'请选择图片...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				//whitelist:'xls|xls',
				blacklist:'gif|png|jpg|jpeg'
				//onchange:''
			});
		});
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
			

			var myDate = new Date();
			var year ="",month="",date="";
			var year =myDate.getFullYear();
			var month = myDate.getMonth()+1;
			var date = myDate.getDate();
			if(month == 11 || month == 12){
				
			}else{
				month= "0" + month;
			}
			date = date+"";
			if(date.length == 1){
				date = "0"+date;
			}
			var time = year+""+month+""+date;
			var matdate = $("#WARRANT_MATURITY_DATE").val();
			var num = time-matdate;
			
			if($("#WARRANT_MATURITY_DATE").val()==""){
				$("#WARRANT_MATURITY_DATE").tips({
					side:3,
		            msg:'请输入授权到期日',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WARRANT_MATURITY_DATE").focus();
				return false;
			}
			if(num > 0){
				$("#WARRANT_MATURITY_DATE").tips({
					side:3,
		            msg:'授权到期日不能早于当前时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WARRANT_MATURITY_DATE").focus();
				return false;
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
			if($("#FIND_REASON").val()!="03"){
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