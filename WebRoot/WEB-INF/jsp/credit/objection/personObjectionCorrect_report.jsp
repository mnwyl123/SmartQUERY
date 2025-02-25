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
<!-- 个人异议事项更正结果上报页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
<style>
    .margin2-5{
		margin-right:10px;
	}
</style>
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
						<!-- 检索  -->
						<form action="personObjection/correctResultReport.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<div id="zhongxin" class="paddingt-13">
						<table id="table_report" class="table table-striped "><!-- table-bordered table-hover -->
							<input type="hidden" type="text" id="ID" name="ID" value="${pd.ID}"/>
							<input type="hidden" id="BTN_TYPE" name="BTN_TYPE" />
							<input type="hidden" id="CORRECT_ENCLOSUREINF" name="CORRECT_ENCLOSUREINF" value="${pd.CORRECT_ENCLOSUREINF}"/>
							<tr>
								<td class="align-right width-25">异议事项号:<span class="red ">*</span></td>
								<td colspan="3"><input type="text" name="OBJCHECKID" id="OBJCHECKID" value="${pd.OBJCHECKID}" maxlength="255" title="异议事项号" class="width-75" readOnly="true"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">异议事项流水号:<span class="red ">*</span></td>
								<td colspan="3"><input type="text" name="OBJCHECKNUM" id="OBJCHECKNUM" value="${pd.OBJCHECKNUM}" maxlength="255" title="异议事项号" class="width-75" readOnly="true"/></td>
							</tr>
							<tr>
								<td class="align-right width-25">异议更正结果:<span class="red ">*</span></td>
								<td colspan="3">
									<select style="width:180px" class="width-75" name="CORRECTRESULT" id="CORRECTRESULT">
										<option value="">--</option>
										<option value="1" <c:if test="${pd.CORRECTRESULT == '1'}">selected</c:if>>已更正</option>
										<option value="2" <c:if test="${pd.CORRECTRESULT == '2'}">selected</c:if>>无需更正</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="align-right width-25">异议更正结果描述:<span class="red ">*</span></td>
								<td colspan="3"><input type="text" name="CORRECTDESC" id="CORRECTDESC" value="${pd.CORRECTDESC}" maxlength="255" title="异议核查结果描述" class="width-75"/></td>
							</tr>
							
							<c:if test="${pd.CORRECT_ENCLOSUREINF != null}">
								<tr name="${pd.CORRECT_ENCLOSUREINF}">
									<td class="align-right" style="width:40px">附件下载</td>
									<td><div style="width:190px" class="ellipsis-2" title="${pd.CORRECT_ENCLOSUREINF}">${pd.CORRECT_ENCLOSUREINF}</div></td>
									<td><input type="button" onclick="downloadAtt('${pd.ID}','${pd.CORRECT_ENCLOSUREINF}')" value="下载"/></td>
									<td><input type="button" onclick="deleteAtt('${pd.ID}','${pd.OBJCHECKID}')" value="删除"/></td>
								</tr>
							</c:if>
							<tr name="upload">
								<td class="align-right">附件上传</td>
								<td colspan="3">
									<input type="file" id="multiUploadFile" name="multiUploadFile"/>
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
<div class="center">
		<c:if test="${admin != '0'}">
			<a class="btn btn-orange btn-size1 b" onclick="save('1');" id="btn" style="margin-left:50px;">保存并上报</a>
		</c:if>
		
			<a class="btn btn-orange btn-size1 b" onclick="save('2');" id="btn">保&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</a>
		
		<c:if test="${admin != '0'}">
			<a class="btn btn-orange btn-size1 b" onclick="save('3');" id="btn">上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;报</a>
		</c:if>
			<a class="btn btn-size1 btn-default b" onclick="top.Dialog.close();">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a> 
</div>
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		dict.init({ids:['CREDENTIALS_TYPE']});
		dict.init({ids:['simple-table'],buildType:'grid'});
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//保存
		function save(type){
			if($("#OBJCHECKID").val()==""){
				$("#OBJCHECKID").tips({
					side:3,
		            msg:'请输入异议事项号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OBJCHECKID").focus();
			return false;
			}
			if($("#OBJCHECKNUM").val()==""){
				$("#OBJCHECKNUM").tips({
					side:3,
		            msg:'请输入异议事项流水号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OBJCHECKNUM").focus();
			return false;
			}
			
			if($("#CORRECTRESULT").val()==""){
				$("#CORRECTRESULT").tips({
					side:3,
		            msg:'请选择异议更正结果',
		            bg:'#AE81FF',
		            time:2
		        }); 
				$("#CORRECTRESULT").focus();
			return false;
			}
			if($("#CORRECTDESC").val()==""){
				$("#CORRECTDESC").tips({
					side:3,
		            msg:'请输入异议更正结果描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CORRECTDESC").focus();
			return false;
			}					
			$("#BTN_TYPE").val(type);
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		//下载附件
		function downloadAtt(id,filename){
			$("#Form").attr("action","<%=basePath%>/personObjection/downloadAtt.do?ID="+id+"&CORRECT_ENCLOSUREINF="+filename);
			$("#Form").submit();
			$("#Form").attr("action","personObjection/correctResultReport.do");
		}
		//删除附件
		function deleteAtt(ID,OBJCHECKID){
			$("#Form").attr("action","<%=basePath%>/personObjection/deleteAtt.do?ID="+ID+"&OBJCHECKID="+OBJCHECKID);
			$("tr[name='${pd.CORRECT_ENCLOSUREINF}']").remove();
			$("#Form").ajaxSubmit({
				success:function(data){
					bootbox.alert("删除成功！");
				},
				complete:function(){
					$("#Form").attr("action","personObjection/correctResultReport.do");
				}
			});
		}
		
	</script>


</body>
</html>