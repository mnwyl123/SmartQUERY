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
<%@ include file="../../system/index/top.jsp"%>
<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="static/ace/iconfont/iconfont.css">
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
						<form action="dictionaries/list.do?menuId=7" method="post" name="Form" id="Form">
						<input type="hidden" name="parentId" id="parentId" value="${DICTIONARIES_ID }"/>
						<table class="margin-5 width-100">
							<tr>
								<td class="align-left width-50 searchM">
								<c:if test="${QX.query == 1 }"> 
									<div class="nav-search float-l">
										<span class="input-icon">
											<input type="text" placeholder="搜&nbsp;索..." class="nav-search-input" id="keywords" name="keywords" autocomplete="off" value="${page.pd.keywords }" />
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>						
									</div>
								   <div class="float-l">
									<select name="DICTIONARIES_ID" id="DICTIONARIES_ID">
										<option value="0" <c:if test="${DICTIONARIES_ID != ''}">selected</c:if>>本级</option>
										<option value="" <c:if test="${DICTIONARIES_ID == ''}">selected</c:if>>全部</option>
									</select>
									</div>
									<div class="btn-group float-l">
									   <a class="btn btn-mini btn-blue1 paddingt-5" onclick="gsearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon witch picSize"></i></a>
									</div>
									</c:if>
								</td>
								<td   class="align-right width-50" >
								    <c:if test="${QX.add == 1 }"> 
								      <div class="btn-group">
								   	    <a class="btn btn-mini btn-orange" onclick="add('${DICTIONARIES_ID}');"><i class="iconfont icon-tianjia" title="新增"></i></a>
									  </div>
									</c:if>
									<c:if test="${null != pd.DICTIONARIES_ID && pd.DICTIONARIES_ID != ''}">
									   <div class="btn-group">
									    <a class="btn btn-mini btn-orange" onclick="goSondict('${pd.PARENT_ID}');"><i class="iconfont icon-fanhui" title="新增"></i></a>
									  </div>
									</c:if> 
								</td>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="dynamic-table" class="table table-striped table-bordered table-hover">	
							<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class="center">名称</th>
									<th class="center">英文</th>
									<th class="center">过滤条件列取值</th>
									<th class="center">排序</th>
									<th class="center">排查表</th>
									<th class="center">备注</th>
									<th class="center width-10">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.query == 1 }"> 
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>${vs.index+1}</td>
											<td class='left'><a href="javascript:goSondict('${var.DICTIONARIES_ID }')">${var.NAME}&nbsp;<i class="iconfont icon-chakanxiaji orange1"></i></a></td>
											<td class='left'>${var.NAME_EN}</td>
											<td class='center'>${var.DICTIONARIES_ID}</td>
											<td class='center'>${var.ORDER_BY}</td>
											<td class='center'>${var.TBSNAME}</td>
											<td class='left'>${var.BZ}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.delete != 1 }">
													<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>
												</c:if>
												<div class="action-buttons">
												<c:if test="${QX.edit == 1 }">
												 <a>
											 		 <i class="iconfont icon-bianji red1 marginLR-10" title="编辑" onclick="edit('${var.DICTIONARIES_ID}');" ></i>
											 	</a>
												 </c:if>
											 	<c:if test="${QX.delete == 1 }">
												 <a>
											 		 <i class="iconfont icon-shape7 green2 marginLR-10"  title="删除" onclick="del('${var.DICTIONARIES_ID}');"></i>
											 	 </a>
												 </c:if>
											 </div>
											</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.query != 1 }"> 
										<tr class="main_info">
											<td colspan="100" class="center" >无权限查看</td>
										</tr>
									</c:if>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function gsearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		//去此ID下子列表
		function goSondict(DICTIONARIES_ID){
			top.jzts();
			window.location.href="<%=basePath%>dictionaries/list.do?DICTIONARIES_ID="+DICTIONARIES_ID;
		};
		
		//新增
		function add(DICTIONARIES_ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>dictionaries/goAdd.do?DICTIONARIES_ID='+DICTIONARIES_ID+'&url=<%=basePath%>dictionaries/goAdd.do';
			 diag.Width = 510;
			 diag.Height = 507;
			 diag.CancelEvent = function(){ //关闭事件
				 if('none' == diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display){
					 parent.location.href="<%=basePath%>dictionaries/listAllDict.do?DICTIONARIES_ID=${DICTIONARIES_ID}&dnowPage=${page.currentPage}";
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>dictionaries/delete.do?DICTIONARIES_ID="+Id+"&tm="+new Date().getTime()+"&url=<%=basePath%>dictionaries/delete.do";
					$.get(url,function(data){
						
						if("success" == data.result){
							parent.location.href="<%=basePath%>dictionaries/listAllDict.do?DICTIONARIES_ID=${DICTIONARIES_ID}&dnowPage=${page.currentPage}";
						}else if("false" == data.result){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败！请先删除子级或删除占用资源.</span>",
								buttons: 			
								{
									"button" :
									{
										"label" : "确定",
										"className" : "btn-sm btn-success"
									}
								}
							});
						}else if("false2" == data.result){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败！排查表不存在或其表中没有DICT_CODE字段.</span>",
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
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>dictionaries/goEdit.do?DICTIONARIES_ID='+Id+'&url=<%=basePath%>dictionaries/goEdit.do';
			 diag.Width = 510;
			 diag.Height = 507;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 parent.location.href="<%=basePath%>dictionaries/listAllDict.do?DICTIONARIES_ID=${DICTIONARIES_ID}&dnowPage=${page.currentPage}";
				}
				diag.close();
			 };
			 diag.show();
		}
		
	</script>


</body>
</html>