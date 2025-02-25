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
<%@ include file="../index/top.jsp"%>
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
						<div class="col-xs-12 no-padding" >

						<div id="accordion" class="width-100">
							
							<div ><!-- class="panel panel-default" -->
								<!-- <div class="panel-heading">
									<h4 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false">
											<i class="bigger-110 ace-icon fa fa-angle-right" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
											&nbsp;连接数据库
										</a>
									</h4>
								</div> -->
								<div class="panel-collapse collapse in margin-5 bgreen1" id="collapseTwo" aria-expanded="true">
									<div class="panel-body">
										<div class="float-l">
											<table>
												<tr>
													<td id="fhdb">数据库：</td>
													<%--
													<td>
														<select name="dbtype" id="dbtype" data-placeholder="请选择数据库"  style="vertical-align:top;width: 100%;" onchange="selectDb(this.value)">
															<option value="mysql">Mysql</option>
															<option value="oracle">Oracle</option>
															<option value="sqlserver">Sqlserver</option>
														</select>
													</td>
													--%>	
													<td>	
														<select class="chosen-select form-control" dict-name="DbType" name="dbtype" id="dbtype" >
														</select>
													</td>
													
													<td class="align-right width-15">地址：</td>
													<td><input type="text" name="dbAddress" id="dbAddress" value="localhost" maxlength="200" placeholder="数据库连接地址" title="数据库连接地址"/></td>
													<td class="align-right width-15">端口：</td>
													<td><input type="number" name="dbport" id="dbport" value="3306"  maxlength="10" placeholder="输入端口" title="端口"/></td>
												</tr>
												<tr>
													<td class="paddingt-5">用户名：</td>
													<td class="paddingt-5"><input type="text" name="username" id="username" value="root"  maxlength="32" placeholder="输入用户名" title="用户名"/></td>
													<td class="align-right paddingt-5">密码：</td>
													<td class="paddingt-5"><input type="password" name="password" id="password"  maxlength="32" placeholder="输入密码" title="密码"/></td>
													<td class="align-right paddingt-5">库名：</td>
													<td class="paddingt-5"><input type="text" name="databaseName" id="databaseName"  maxlength="32" placeholder="输入数据库名" title="数据库名"/></td>
												</tr>
											</table>
										</div>
										<div class="float-r margint-13 width-10">
											<a class="btn btn-hanzi btn-green1 " onclick="connDb();" id="condb">
												连接数据库
											</a>
										</div>
									</div>
								</div>
							</div>
							
						</div>

						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center width50">序号</th>
									<th class='left'>表名</th>
									<th class="center" style="width:96px;">操作</th>
								</tr>
							</thead>
												
							<tbody id="valuelist">
								<tr class='center'>
									<td colspan="10">数据显示区</td>
								</tr>
							</tbody>
						</table>
				<div id ="dataPagination" class="center"></div>
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
	<%@ include file="../index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		dict.init({ids:['dbtype']});
		//选择数据库
		function selectDb(value){
			$("#dbAddress").val('localhost');	//连接地址
			if("mysql" == value){
				$("#dbport").val(3306);				//端口
				$("#username").val('root');			//用户名
			}else if("oracle" == value){
				$("#dbport").val(1521);				//端口
				$("#username").val('orcl');			//用户名
			}else{
				$("#dbport").val(1433);				//端口
				$("#username").val('sa');			//用户名
			}
		}
		
		//连接数据库,读取数据库中的表
		function connDb(){
			var dbtype = $("#dbtype").val();				//数据库类型
			var dbAddress = $("#dbAddress").val();			//连接地址
			var dbport = $("#dbport").val();				//端口
			var username = $("#username").val();			//用户名
			var password = $("#password").val();			//密码
			var databaseName = $("#databaseName").val();	//数据库名
			
			if("" == dbAddress){
				$("#dbAddress").tips({
					side:1,
		            msg:'请输入连接地址！',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#dbAddress").focus();
				return;
			}
			if("" == dbport){
				$("#dbport").tips({
					side:1,
		            msg:'请输入端口！',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#dbport").focus();
				return;
			}
			if("" == username){
				$("#username").tips({
					side:1,
		            msg:'请输入用户名！',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#username").focus();
				return;
			}
			if("" == password){
				$("#password").tips({
					side:1,
		            msg:'请输入密码！',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#password").focus();
				return;
			}
			if("" == databaseName){
				$("#databaseName").tips({
					side:1,
		            msg:'请输入数据库名！',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#databaseName").focus();
				return;
			}
			 top.jzts();
			 $.ajax({
					type: "POST",
					url: '<%=basePath%>recreateCode/listAllTable.do?tm='+new Date().getTime(),
			    	data: {dbtype:dbtype,dbAddress:dbAddress,dbport:dbport,username:username,password:password,databaseName:databaseName},
					dataType:'json',
					//beforeSend: validateData,
					cache: false,
					success: function(data){
						 $.each(data.list, function(i, list){
							 if("ok" == list.msg){
								 $("#condb").tips({
										side:1,
							            msg:'连接成功',
							            bg:'#009933',
							            time:3
							        });
								 dataList = data.tblist;
								 currentPage = 1;
								 refreshTable();
								// $("#valuelist").html('');	//初始清空值列表
								// $.each(data.tblist, function(n, tblist){ 	//列出每条记录
								//	 $("#valuelist").append('<tr><td class="center">'+(n+1)+'</td><td>'+tblist+'</td><td class="center"><div class="action-buttons"><a style="cursor:pointer;" onclick="productCode(\''+tblist+'\')"><i class="iconfont icon-yingshe01 orange1" title="反射" ></i></a></div></td></tr>');
								// }); 
							 }else{
								 $("#condb").tips({
										side:3,
							            msg:'连接失败,检查连接参数是否正确！',
							            bg:'#cc0033',
							            time:5
							        });
							 }
							top.hangge();
						 });
					}
				});
		}
		
		//启动代码生成器
		function productCode(table){
			var dbtype = $("#dbtype").val();				//数据库类型
			var dbAddress = $("#dbAddress").val();			//连接地址
			var dbport = $("#dbport").val();				//端口
			var username = $("#username").val();			//用户名
			var password = $("#password").val();			//密码
			var databaseName = $("#databaseName").val();	//数据库名
			databaseName = databaseName.replace("#","%23");
			databaseName = databaseName.replace("#","%23");
			top.jzts();
			top.mainFrame.tabAddHandler(table, table, '<%=basePath%>recreateCode/goProductCode.do?table='+table+'&dbtype='+dbtype+'&dbAddress='+dbAddress+'&dbport='+dbport+'&username='+username+'&password='+password+'&databaseName='+databaseName); 
		}
		
		var dataList = [];
		var currentPage = 1;
		
		function refreshTable(){
			var html = '';
			var startItem = (currentPage - 1) * 10;
			var endItem = startItem + 10;
			if(endItem > dataList.length){
				endItem = dataList.length;
			}
			for(var i = startItem; i < endItem; i++){
				html += '<tr><td class="center">' + (i + 1) + '</td><td>' + dataList[i] + '</td><td class="center"><div class="action-buttons"><a style="cursor:pointer;" onclick="productCode(\'' + dataList[i] + '\')"><i class="iconfont icon-yingshe01 orange1" title="反射" ></i></a></div></td></tr>'
			}
			$("#valuelist").html(html);
			
			var maxNum = 1,
			    startNum = 1,
			    endNum = 1;
		    if(dataList.length > 1){
			    maxNum = parseInt((dataList.length - 1) / 10 + 1);
		    }
			html = '<ul class="pagination no-margin">';
			if(currentPage == 1){
				html +=  '<li><a>首页</a></li>'
				     +  '<li><a>上一页</a></li>';
			}else{
				html +=  '<li style="cursor:pointer;"><a onclick="changePage(1)">首页</a></li>'
					 +  '<li style="cursor:pointer;"><a onclick="changePage(' + (currentPage - 1) + ')">上一页</a></li>';
			}
			if(maxNum > 5){
				startNum = parseInt((currentPage - 1) / 5) * 5 + 1;
				endNum = startNum + 5;
				if(maxNum < endNum){
					endNum = maxNum + 1;
				}
			}else{
				endNum = maxNum + 1;
			}
			for(var i = startNum; i < endNum; i++){
				if(currentPage == i){
					html += '<li class="active"><a><font color="white">' + i + '</font></a></li>';
				}else{
					html += '<li style="cursor:pointer;"><a onclick="changePage(' + i + ')">' + i + '</a></li>';
				}
			}
			if(currentPage == maxNum){
				html += '<li><a>下一页</a></li>';
				html += '<li><a>尾页</a></li></ul>';
			}else{
				html += '<li style="cursor:pointer;"><a onclick="changePage(' + (currentPage + 1) + ')">下一页</a></li>';
				html += '<li style="cursor:pointer;"><a onclick="changePage(' + maxNum + ')">尾页</a></li></ul>';
			}
			html += '<span style="position: absolute; margin-left: 10px; margin-top: 7px;">  共 ' + maxNum + ' 页</span>';
			$('#dataPagination').html(html);
		}
		
		function changePage(num){
			currentPage = num;
			refreshTable();
		}
	</script>


</body>
</html>