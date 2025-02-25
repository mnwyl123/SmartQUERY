         
			            <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
<style>
	.btn-green1, .btn-green1:focus {
	    background-color: #f97e11 !important;
	    border-color: #f97e11;
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
						<form action="queryLoanCard/queryPage.do?menuId=${pd.menuId}&&flag=1" method="post" name="Form" id="Form">
						<table class="margin-5 width-100" style="background-color: rgba(22, 147, 241, 0.22);">
							<tr>
								<td class="align-right" style="padding: 10px;width: 400px;">机构信用代码:</td>
								<td class="align-left" style="width: 220px;"><input style="width:200px" type="text" name="CreditCode" id="CreditCode" value="${pd.CreditCode}" maxlength="20"/></td>
								<td class="align-right" style="width: 180px;">组织机构代码:</td>
								<td class="align-left" ><input type="text" style="width:200px"  name="SdepOrgCode" id="SdepOrgCode" value="${pd.SdepOrgCode}" maxlength="20"/></td>
							</tr>
							<tr>
								<td class="align-right" style="padding: 10px;">登记注册类型:</td>
								<td class="align-left">
									<select style="width:200px" dict-name="register_type" name="RegisterType" id="RegisterType" default-value="${pd.RegisterType}">
										<option value="">请选择</option>
									</select>
								</td>
								<td class="align-right">登记注册号:</td>
								<td class="align-left"><input type="text" style="width:200px" name="RegisterCode" id="RegisterCode" value="${pd.RegisterCode}" maxlength="20"/></td>
							</tr>
							<tr>
								<td class="align-right" style="padding: 10px;">纳税人识别号（国税）:</td>
								<td class="align-left"><input type="text" style="width:200px" name="SdepNationalTaxCode" id="SdepNationalTaxCode" value="${pd.SdepNationalTaxCode}" maxlength="20"/></td>
								<td class="align-right">纳税人识别号（地税）:</td>
								<td class="align-left"><input type="text" style="width:200px" name="SdeplandTaxCode" id="SdeplandTaxCode" value="${pd.SdeplandTaxCode}" maxlength="20"/></td>
							</tr>
							<c:if test="${QX.query == 1 }">
								<tr>
									<td class="width35 align-right" colspan="4" style="padding: 10px;">
										<div class="float-l btn-group">
											<a class="btn btn-green1 btn-size1 paddingt-5" onclick="goSearch();" style="margin-left: 1100px;padding-left: 1px;padding-right: 1px;width: 100px;padding-bottom: 5px;">查       询</a>
										</div>
									</td>
								</tr>
							</c:if>
						</table>
						<hr/>
						<!-- 检索  -->
						<c:if test="${pd.flag == 1 }">
							<table id="simple-table" class="table table-striped table-bordered table-hover" >
								<thead>
									<tr>
										<th class="center">企业名称</th>
						                <th class="center">中征码</th>
						                <th class="center">统一社会信用代码</th>
						                <th class="center">组织机构代码</th>
						                <th class="center">机构信用代码</th>									
						                <th class="center">工商注册号</th>			
						                <th class="center">社会团体登记号</th>
						                <th class="center">机关和事业单位登记号</th>
				   	                    <th class="center">民办非企业登记号</th>
						                <th class="center">基金会登记号</th>
						                <th class="center">其他</th>
						                <th class="center">宗教证书登记号</th>
						                <th class="center">纳税人识别号（地税）</th>
						                <th class="center">纳税人识别号（国税）</th> 
									</tr>
								</thead>
								<tbody>
									
								<!-- 开始循环 -->	
								<c:choose>
									<c:when test="${not empty listPd}">
										<c:forEach items="${listPd}" var="var" varStatus="vs">	
											<tr>
												<td class="center">${var.COM_NAME}</td>
												<td class="center">${var.LOANCARDNO}</td>
												<td class="center">${var.SOCIALCREDIT}</td>
												<td class="center">${var.SDEPORGCODE}</td>
												<td class="center">${var.CREDITCODE}</td>
												<td class="center">${var.BUSINESSNUM}</td>
												<td class="center">${var.SOCIALGROUPNO}</td>
												<td class="center">${var.PUBLICNUM}</td>
												<td class="center">${var.CIVILNO}</td>
												<td class="center">${var.FUNDNO}</td>
												<td class="center">${var.OTHER}</td>
												<td class="center">${var.RELIGIONNO}</td>
												<td class="center">${var.SDEPLANDTAXCODE}</td>
												<td class="center">${var.SDEPNATIONALTAXCODE}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<c:if test="${pd.code == '01' }">
												<td colspan="14" class="center">没有相关数据</td>
											</c:if>
											<c:if test="${pd.code != '01' }">
												<td colspan="14" class="center" style="color:red;">${pd.msg}</td>
											</c:if>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						</c:if>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>

<script type="text/javascript">
dict.init({ids:['RegisterType']});
$(top.hangge());

/**
 * 验证机构信用代码是否合法
 * @param code 整个代码含最后一位校验位
 * @return 
 */
var pattern = /[A-Z]{1}[0-9]{16}[0-9A-Z\\*]{1}/;  
function isValid(code){
	if (code.length != 18 || !pattern.exec(code))
		return false;
	var m = 36;
	var s = m;
	for(var i=0; i<=code.length-2; i++){
		s = (parseInt(s) + parseInt(char2num(code.toUpperCase().substring(i,i+1))))%m;
		if(s==0)s=m;
		s = (s*2)%(parseInt(m)+1);
	}
	return (parseInt(s)+parseInt(char2num(code.substring(code.length-1,code.length))))%m == 1 ;
}
/**
	 * 求字符的数值
	 */
	function  char2num(a) {
		if (a == '*')
			return 36;
		if (a >= 0 && a <= 9) {
			return a;
		} else{
			//a.replace("/[^\d]/g,");
			return (a.charCodeAt(0) - 55);
		}
		
	}
	/**
	 * 组织机构代码校验
	 * @param SdepOrgCode
	 * @return
	 */
	function isCorpNo(financecode) {
	  if (!checkstring_allSpace(financecode)) {
			return false;
	  }
	  var financecode=trim(financecode);
	   var code = financecode;
	   if (code == "00000000-0") {
		 $("#SdepOrgCode").tips({
				side:3,
				msg:'组织机构代码错误!',
				bg:'#AE81FF',
				time:2
			});
		 return false;
	   }

	   var re = /[A-Z0-9]{8}-[A-Z0-9]/;    
	   var r = code.match(re);   
	   if (r == null) {
		   $("#SdepOrgCode").tips({
				side:3,
				msg:'组织机构代码错误!',
				bg:'#AE81FF',
				time:2
			});
		 return false;
	   }      
		 
	   return true;
	}
	/**
	 * 检验数据是否全是空格
	 * @param data 要检验的数据
	 */
	function checkstring_allSpace(data) {
		if (data.length>0 && trim(data)=="") {
			$("#SdepOrgCode").tips({
				side:3,
				msg:'错误：您输入的都是空格！',
				bg:'#AE81FF',
				time:2
			});
			return false;
		}
		for (var i = 0; i < data.length; i++) {
			if (data.substring(i,i+1) == "'" || data.substring(i,i+1) == '"') {
				$("#SdepOrgCode").tips({
					side:3,
					msg:'输入项中不能含有单引号或双引号！',
					bg:'#AE81FF',
					time:2
				});
				return false;
			}
		}
		return true;
	}
/**
 * 将数据去掉空格
 * @param val 要校验的数据
 */
function trim(val)
{
	var str = val+"";
	if (str.length == 0) return str;
	var re = /^\s*/;
	str = str.replace(re,'');
	re = /\s*$/;
	return str.replace(re,'');
}
//检索
function goSearch(){	
	if($("#CreditCode").val()!=""){
		if($("#CreditCode").val().length !=18){
			$("#CreditCode").tips({
				side:3,
				msg:'机构信用代码长度必须18位！',
				bg:'#AE81FF',
				time:2
			});
			return false;
		}
		if(!isValid($("#CreditCode").val())){
			$("#CreditCode").tips({
				side:3,
				msg:'机构信用代码不正确！',
				bg:'#AE81FF',
				time:2
			});
			return false;
		}
	}
	if($("#SdepOrgCode").val()!=""){
		if(!isCorpNo($("#SdepOrgCode").val())){
			return false;
		}
	}

	if($("#RegisterType").val()==""&&$("#RegisterCode").val()!=""){
		$("#RegisterType").tips({
			side:3,
			msg:'请选择注册类型',
			bg:'#AE81FF',
			time:2
		});
		return false;
	}
	if($("#RegisterType").val()!=""&&$("#RegisterCode").val()==""){
		$("#RegisterCode").tips({
			side:3,
			msg:'请填写登记注册号',
			bg:'#AE81FF',
			time:2
		});
		return false;
	}
	if($("#RegisterCode").val()!=""){
	  var lengthTemp = $("#RegisterCode").val().replace(/[^\x00-\xff]/g,"**").length;
		if(lengthTemp>32){
			$("#RegisterCode").tips({
				side:3,
				msg:'登记注册号不能超过32个字符',
				bg:'#AE81FF',
				time:2
			});
			return false;
		}
	}
	if($("#SdepNationalTaxCode").val()!=""){
		var lengthTemp = $("#SdepNationalTaxCode").val().replace(/[^\x00-\xff]/g,"**").length;
		if(lengthTemp>60){
			$("#SdepNationalTaxCode").tips({
				side:3,
				msg:'国税登记证号码不能超过60个字符',
				bg:'#AE81FF',
				time:2
			});
			return false;
		}
	}
	if($("#SdeplandTaxCode").val()!=""){
		if(lengthTemp>60){
			$("#SdeplandTaxCode").tips({
				side:3,
				msg:'地税登记证号码不能超过60个字符',
				bg:'#AE81FF',
				time:2
			});
			return false;
		}
	}
	if($("#CreditCode").val()==""&&$("#SdepOrgCode").val()==""&&$("#RegisterType").val()==""&&$("#RegisterCode").val()==""&&$("#SdepNationalTaxCode").val()==""&&$("#SdeplandTaxCode").val()==""){
		$("#CreditCode").tips({
			side:3,
			msg:'至少输入一项',
			bg:'#AE81FF',
			time:2
		});
		return false;
	}
	top.jzts();
	$("#Form").submit();

}

$(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
	
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

</script>
</html>
