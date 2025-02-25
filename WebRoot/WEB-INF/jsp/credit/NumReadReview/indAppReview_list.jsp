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
<!-- <style>
	input[disabled] {
	    color: #f4f8fd !important;
	    background-color: #f97e11 !important;
    }
</style>
 --></head>
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
						<form action="checkNumRead/listIndAppRe.do?menuId=${pd.menuId}" method="post" name="Form" id="Form">
						<table class="margin-5 width-100">
							<tr>
									<td class="align-left width-70">
										<div class="float-l margin2-5">
											<span>客户名称:</span>
											<input type="text" style="width:180px" name="CLIENT_NAME" id="CLIENT_NAME" placeholder="请输入客户名称" />
										</div>
										<div class="float-l margin2-5">
										    <span>&nbsp;证件类型:</span>
											<select style="width:180px" dict-name="CRED_TYPE_PER" name="CREDENTIALS_TYPE" id="CREDENTIALS_TYPE">
												<option value="">请选择证件类型</option>
											</select>
										</div>
										<div class="float-l margin2-5">
											<span>&nbsp;证件号码:</span>
											<input type="text"style="width:180px" name="CREDENTIALS_NO" id="CREDENTIALS_NO" placeholder="请输入证件号码" />
										</div>
										<div class="float-l btn-group">
										   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="goSearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
										</div>
									</td>
									<td class="align-right width-30">
										<div class="btn-group">
											<input id="AllButton" type="button" value="批量审核" onclick="makeAll('确定要批量审核选中的数据吗?');" style="border-radius: 4px;background-color: #f97e11;border-color: #f97e11;color: white;border: 0px;padding-bottom: 3px;padding-top: 3px;"></input>
										</div>
									</td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
									<th class="center width35">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<!-- <th class="center width50">序号</th> -->
									<th class="center">客户名称</th>
									<th class="center" dict-name="CRED_TYPE_PER">证件类型</th>
									<th class="center">证件号码</th>
									<th class="center">查询申请时间</th>
									<th class="center" dict-name="FIND_REASON">查询原因</th>
									<th class="center">申请机构</th>
									<th class="center">产品时间</th>
								</tr>
							</thead>
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty listInfo}">
										<c:forEach items="${listInfo}" var="var" varStatus="vs">	
											<tr>
												<td class='center'>
													<label><input type='checkbox' name='ids' value="${var.ID}" id="${var.INTERNAL}" class="ace"/><span class="lbl"></span></label>
												</td>
												<%-- <td class='center'>${var.ID}</td> --%>
												<td class="center">${var.CLIENT_NAME }</td>
												<td class="center">${var.CREDENTIALS_TYPE }</td>
												<td class="center">${var.CREDENTIALS_NO }</td>
												<td class="center">${var.APPLICATION_TIME}</td>
												<td class="center">${var.QUERY_REASON}</td>
												<td class="center">${var.ORG_NAME}</td>
												<td class="center">${var.PRODUCE_DATE}</td>
											</tr>
										</c:forEach>
								
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="10" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table class="width-100">
							<tr>
								<td class="align-top center"><div class="pagination">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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
dict.init({ids:['CREDENTIALS_TYPE']});
dict.init({ids:['simple-table'],buildType:'grid'});
$(top.hangge());
/* var countdown = 60;
var flag = "Y";
var enb = "Y";

function refreshButton(){
	if(countdown==0){
		document.getElementById("AllButton").removeAttribute("disabled");
		document.getElementById("AllButton").value="批量提交";
		countdown=60;
		flag = "N";
		enb = "Y";
	}else if(flag == "Y"){
		document.getElementById("AllButton").setAttribute("disabled",true);
		document.getElementById("AllButton").value="批量提交("+countdown+")";
		countdown--;
		enb = "N";
	}
	setTimeout(function(){
		refreshButton();
	},1*1000);
} */
//检索
function goSearch(){
	top.jzts();
	$("#Form").submit();
}

$(function() {
	/* if(${pd.flag}=="0"){
		refreshButton();
	} */
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

//审核
function goCheck(ID,USER_SYS_ID){
	/* if(enb == "N"){
		bootbox.dialog({
			message: "<span class='bigger-110'>请等待批量审核倒计时完成!</span>",
			buttons: 			
			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
		});
		return;
	} */
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="个人信息审核";
	 diag.URL = '<%=basePath%>checkNumRead/goAppCheck.do?ID='+ID+'&USER_SYS_ID='+USER_SYS_ID;
	 diag.Width = 500;
	 diag.Height = 650;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location=self.location",100);
			 }else{
				 nextPage(${page.currentPage});
			 }
		}
		diag.close();
	 };
	 diag.show();
}

//批量操作
function makeAll(msg){
	bootbox.confirm(msg, function(result) {
		if(result) {
			var str = '';
			var emstr = '';
			
			var count =0;
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(str=='') str += document.getElementsByName('ids')[i].value;
				  	else str += ',' + document.getElementsByName('ids')[i].value;
				  	
				  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
				  	else emstr += ';' + document.getElementsByName('ids')[i].id;
				  	/* count++; */
				  }
			}
			
			if(str==''){
				bootbox.dialog({
					message: "<span class='bigger-110'>您没有选择任何内容!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				$("#zcheckbox").tips({
					side:3,
		            msg:'点这里全选',
		            bg:'#AE81FF',
		            time:8
		        });
				
				return;
			}/* else if(count>5){
				bootbox.dialog({
					message: "<span class='bigger-110'>一次最多只能提交五笔!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				return;
			} */else{
				if(msg == '确定要批量审核选中的数据吗?'){
					top.jzts();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>checkNumRead/goCheckAll.do?tm='+new Date().getTime(),
				    	data: {IDS:str,INTER:emstr},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							<%-- window.location.href="<%=basePath%>checkNumRead/listIndAppRe.do?menuId=${pd.menuId}&flag=0"; --%>
							nextPage(${page.currentPage});
						}
					});
				}
			}
		}
	});
	
}	
</script>
</html>
