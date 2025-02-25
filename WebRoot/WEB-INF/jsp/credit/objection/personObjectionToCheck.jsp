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
    .margin2-5{
		margin-right:10px;
	}
	#tab tr td{
		width:150px;
	}
	#tab{
		border-collapse:separate;
		border-spacing:0px 10px;
	}
	td{
		 overflow:hidden;
		 text-overflow:ellipsis;
		 white-space:nowrap;
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
					<form action="personObjection/listToCheck.do?menuId=92" method="post" name="Form" id="Form">
						<table class="" id="tab">
							<tr>
								<td align="right">
								     <c:if test="${admin == '1'}">								        
									       处理机构名称:&nbsp;&nbsp;
									     </td>
								         <td>
										   <input id="ORG_NAME" type="text" value="${pd.ORG_NAME}" name="ORG_NAME" placeholder="处理机构名称" />
									    </td>
								        <td align="right">
								    </c:if>									   	
									    开始日期:&nbsp;&nbsp;
								</td>
								<td>
										<input class="span10 date-picker" data-date-format="yyyy-mm-dd" id="BEGINDATE" type="text" value="${pd.BEGINDATE}" name="BEGINDATE" placeholder="开始日期" />
								</td>
								<td align="right">
									    结束日期:&nbsp;&nbsp;
							    </td>
								<td>
										<input class="span10 date-picker" data-date-format="yyyy-mm-dd" id="ENDDATE" type="text" value="${pd.ENDDATE}" name="ENDDATE" placeholder="结束日期" />
								</td>
								<td align="right">	
									    异议事项号:&nbsp;&nbsp;
								</td>
								<td>
										<input id="OBJCHECKID" type="text" value="${pd.OBJCHECKID}" name="OBJCHECKID" placeholder="异议事项号" />
								</td>
							 </tr><tr>
								<td align="right">	
									    异议事项流水号:&nbsp;&nbsp;
								</td>
								<td>
										<input id="OBJCHECKNUM" type="text" value="${pd.OBJCHECKNUM}" name="OBJCHECKNUM" placeholder="异议事项流水号" />
								</td>
								<td align="right">	
									    是否存在附件:&nbsp;&nbsp;
								</td>
								<td>
										<select name="ENCLOSUREFLAG" id="ENCLOSUREFLAG" value="${pd.ENCLOSUREFLAG}" style="width:163px">
										    <option value="">选择是否存在附件</option>
										    <option value="Y" <c:if test="${pd.ENCLOSUREFLAG== 'Y'}">selected</c:if>>是</option>
										    <option value="N" <c:if test="${pd.ENCLOSUREFLAG== 'N'}">selected</c:if>>否</option>
									    </select>
								</td><td>
									<div class="float-l margin2-5"">&nbsp;&nbsp;</div>									
									<div class="btn-group float-l margin2-5">
										<a class="btn btn-mini btn-blue1 paddingt-5"  onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
								</td>
								<c:if test="${admin == '1'}">
								<td colspan="3"></td>
								<td class="align-right">
									<div class="btn-group" >
										<a class="btn btn-mini btn-orange" onclick="makeAll();" title="分配异议处理机构" ><i class="iconfont icon-duihao" style="font-size: 18px !important;"></i></a>
									</div>
								</td>
								</c:if>
							</tr>
						</table>
					</form>
					
					<form action="personObjection/batchUpdateObjOrg" id="Form2" name="Form2" method="post">
						<div style="width:100%;height:100%;overflow-x:scroll;">
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<!--<th class="center width35">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center minwidth100">操作</th>
									<th class="center width50">序号</th>
									<th class="center">异议处理机构</th>
									<th class="center">用户姓名</th>
									<th class="center">数据提供机构代码</th>
									<th class="center">发起机构代码</th>
								    <th class="center">发起用户代码</th>
									<th class="center">处理结果描述</th>
									<th class="center">开始日期</th>
									<th class="center">结束日期</th>
									<th class="center">异议事项单个数</th>-->
									<th class="center"  style="min-width:60px">序号</th>
									<th class="center" style="min-width:100px">异议事项号</th>
									<th class="center" style="min-width:100px">处理机构名称</th>
									<th class="center" style="min-width:120px">历史核查信息</th>
									<th class="center" style="min-width:120px">是否存在附件</th>
									<!--<th class="center" style="min-width:130px">开始日期</th>
									<th class="center" style="min-width:130px">结束日期</th>-->
									<th class="center" style="min-width:150px">异议事项流水号</th>
									<th class="center" style="min-width:130px">核查开始日期</th>
									<th class="center" style="min-width:130px">核查到期日期</th>
								    <th class="center" style="min-width:100px">姓名</th>
									<th class="center" style="min-width:100px" dict-name="CRED_TYPE">证件类型</th>
									<th class="center" style="min-width:100px">证件号码</th>
									<th class="center" style="min-width:100px">有效联系电话</th>
									<th class="center" style="min-width:100px">异议事项信息</th>
									<th class="center" style="min-width:100px">异议说明</th>
									<th class="center" style="min-width:100px">数据提供机构代码</th>
									<th class="center" style="min-width:100px">数据发生机构代码</th>
									<th class="center" style="min-width:100px">业务标识号</th>
									<th class="center" style="min-width:100px" dict-name="ywzl">业务种类</th>
									
									<th class="center" style="min-width:130px">数据发生日期</th>
									<th class="center" style="min-width:130px">数据发生金额</th>
								</tr> 
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>${vs.index+1}</td>
											<td class='center'>${var.OBJCHECKID}</td>
											<input type="hidden" name="objectItem[${vs.index}].ID" value="${var.ID}"/>
											<td class='center'>
												<c:if test="${admin == '1'}">
													<select name="objectItem[${vs.index}].ORG_ID" >
														<option value="">--</option>
														<c:forEach items="${orgs}" var="org">
															<option value="${org.ORG_ID}" <c:if test="${var.ORG_ID == org.ORG_ID}">selected</c:if>>${org.NAME}</option>
														</c:forEach>
													</select>
												</c:if>
												<c:if test="${admin != '1'}">
													${pd.ORG_NAME}
												</c:if>
											</td>
											<td class="center">
												<a  href="javascript:goSubLast('${var.OBJCHECKID}');">
													查看
												</a>
											</td>
											<td class='center'>
											<c:if test="${var.ENCLOSUREFLAG == 'Y'}">
												<a  href="javascript:attrInfo('${var.ID}');">${var.ENCLOSUREFLAG}</a>
											</c:if>
											<c:if test="${var.ENCLOSUREFLAG != 'Y'}">
												${var.ENCLOSUREFLAG}
											</c:if>
											</td>
											<td class='center'>${var.OBJCHECKNUM}</td>
											<td class='center'>${var.CHECKBEGINDATE}</td>
											<td class='center'>
											${var.RELATIVE_ENDDATE}
											</td>
											<td class='center'>${var.NAME}</td>
											<td class='center'>${var.IDTYPE}</td>
											<td class='center'>${var.IDNUM}</td>
											<td class='center'>${var.PHONENUM}</td>											
											<td class='center'>
											   <c:if test ="${not empty var.OBJITEMINF}">
											       <a  href="javascript:download('${var.OBJITEMINF}');">
													<i class="iconfont icon-xiazai" title="下载"></i></a>
											   </c:if>	
											   <c:if test ="${empty var.OBJITEMINF}">
											       无
											   </c:if>										  
											</td>										
											<td class='center'>${var.OBJITEMDESC}</td>
											<td class='center'>${var.DATAPROVIDERORGCODE}</td>
											<td class='center'>${var.DATAOCCURORGCODE}</td>
											<td class='center'>${var.BUSINESSCODE}</td>
											<td class='center'>${var.BUSINESSTYPE}</td>
											<td class='center'>${var.DATAOCCURDATE}</td>
											<td class='center'>${var.DATAOCCURAMOUNT}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;text-align: center;"><div class="pagination" style="padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
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
	
	</div>
	<!-- /.main-container -->

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
		dict.init({ids:['simple-table'],buildType:'grid'});
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		//下载异议事项信息
		function download(OBJITEMINF){	
             top.jzts();
            $.ajax({
            	url:'<%=basePath%>personObjection/download_ITEMINF.do',
            	type:'POST',
            	data:{OBJITEMINF:OBJITEMINF},
            	dataType:'json',
            	success:function(data){
            		$(top.hangge());
            		var msg = "";
            		if("success" == (data.msg)){			
            			window.location.href='<%=basePath%>/personObjection/downloadlocal_ITEMINF.do?OBJITEMINF='+OBJITEMINF;
            		}else{
            			 msg="下载失败，可能是人为删除附件信息！";
							bootbox.dialog({
								message: "<span class='bigger-110'>"+msg+"</span>",
								buttons: 			
									{ "button":
										{"label":"确定",
									  "className":"btn-sm btn-success"
													}}
							});
            		}

            	}
            });
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
		
		//异议信息
		function goSub(ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="异议信息";
			 diag.URL = '<%=basePath%>personObjection/listSubToCheck.do?ID='+ID;
			 diag.Width = 800;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show();
		}
		function writeResult(ID){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="处理结果填写";
			 diag.URL = '<%=basePath%>distributeObjOrg/objResultAtt.do?ID='+ID;
			 diag.Width = 500;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//分配异议处理机构
		function makeAll(){
			$("#Form2").ajaxSubmit({
				success:function(data){
					top.hangge();
					bootbox.dialog({
						message: "<span class='bigger-110'>"+data.msg+"</span>",
						buttons: 			
						{
							"button" :
							{
								"label" : "确定",
								"className" : "btn-sm btn-success",
								"callback": function() {
									$("#Form2").attr("action","personObjection/listToCheck.do");
									$("#Form2").submit();
								}
							}
						}
					});
				}
			});
		}
		
		//历史信息
		function goSubLast(OBJCHECKID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="历史信息";
			 diag.URL = '<%=basePath%>personObjection/listSubLastToCheck.do?OBJCHECKID='+OBJCHECKID;
			 diag.Width = 800;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//附件信息
		function attrInfo(ID){
			$.ajax({
				url:'<%=basePath%>personObjection/isExists?ID='+ID,
				type:'post',
				dataType:'json',
				success:function(data){
					if(data.msg=='Y'){
						window.location.href='<%=basePath%>personObjection/downloadAttr.do?filepath='+data.filePath;
					}else{
						bootbox.dialog({
							message: "<span class='bigger-110'>"+"下载失败，可能是人为删除异议附件信息！"+"</span>",
							buttons: 			
							{
								"button" :
								{
									"label" : "确定",
									"className" : "btn-sm btn-success"
								}
							}
						});
					}
				}
			});
			
		}
	</script>


</body>
</html>