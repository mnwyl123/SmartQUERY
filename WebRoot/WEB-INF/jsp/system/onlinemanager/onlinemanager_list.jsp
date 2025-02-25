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
						<div class="col-xs-12">
	
						<table class="margin-5 width-100">
							<tr class="width-100">
								<td bgcolor="#dddddd" class="align-left width-10">
								<div class="float-l" style="margin-left: 5px;">在线人数：</div>
								<div class="float-l" id="onlineCount">0</div></td>
								<td class="width-85">
								   <c:if test="${QX.batchDelete == 1 }"> 
									<div class="btn-group float-r" >
									<a class="btn btn-mini btn-orange" title="批量强制下线" onclick="makeAll('确定要把这些用户强制下线吗?');" ><i style="font-size: 18px;" class="iconfont icon-xiaxiantubiao"></i></a>
									</div>
									 </c:if>
								</td>
							</tr>
						</table>
	
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
							<thead>
								<tr>
									<th class="center width35">
										<label><input class="ace" type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
										<input type="hidden" name="company" id="company" value="${pd.COMPANY}"/>
										<input type="hidden" name="isCompany" id="isCompany" value="${pd.isC}"/>
									</th>
									<th class='center width50'>序号</th>
									<th class='center'>用户名</th>
									<th class='center'>法人</th>
									<th class="center width-10" >操作</th>
								</tr>
							</thead>
												
							<tbody id="userlist">
							</tbody>
						</table>
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
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		</script>
		
		
		<script type="text/javascript">
		//初始化
		$(function(){
			online();
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
		
		var websocketonline;//websocke对象
		var userCount = 0;	//在线总数
		function online(){
			if (window.WebSocket) {
				websocketonline = new WebSocket(encodeURI('ws://'+top.oladress)); //oladress在main.jsp页面定义
				websocketonline.onopen = function() {
					websocketonline.send('[onlinemanager]');//连接成功
				};
				websocketonline.onerror = function() {
					//连接失败
				};
				websocketonline.onclose = function() {
					//连接断开
				};
				//消息接收
				websocketonline.onmessage = function(message) {			    
					var message = JSON.parse(message.data);
					if (message.type == 'count') {
						userCount = message.msg;
					}else if(message.type == 'userlist'){
						$("#userlist").html('');
						 $.each(message.list, function(i, users){
						    us = users.split("+");
						    var user = us[0];
						    var comp = us[1];
						   var str = '<div class="action-buttons">'+
							'<a  title="强制下线" onclick="goOutTUser(\''+users+'\')"><i class="iconfont icon-xiaxiantubiao red1"></i></button>'+
						  '</div>';
						     if('${QX.forceUp}' != 1 ){
						    	str='<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>';
						    }
							 $("#userlist").append(
								'<tr>'+	 
									 '<td class="center">'+
										'<label><input type="checkbox" name="ids" value="'+users+'" class="ace" /><span class="lbl"></span></label>'+
									'</td>'+
									'<td class="center">'+(i+1)+'</td>'+
									'<td class="center"><a onclick="editUser(\''+users+'\')" style="cursor:pointer;">'+user+'</a></td>'+
									'<td class="center">'+comp+'</td>'+
									'<td class="center">'+
										str+
									'</td>'+
								'</tr>'
							 );
							 userCount = i+1;
						 });
						 $("#onlineCount").html(userCount);
					}else if(message.type == 'addUser'){
							us = message.user.split("+");
						    var user = us[0];
						    var comp = us[1];
						    var str = '<div class="action-buttons">'+
							'<a  title="强制下线" onclick="goOutTUser(\''+message.user+'\')"><i class="iconfont icon-xiaxiantubiao red1"></i></button>'+
						  '</div>';
						    if('${QX.forceUp}' != 1 ){
						    	str='<span ><i class="iconfont icon-wuquanxianchakan1 green1" title="无权限"></i></span>';
						    }
						 $("#userlist").append(
							'<tr>'+	 
								 '<td class="center">'+
									'<label><input type="checkbox" name="ids" value="'+message.user+'" class="ace" /><span class="lbl"></span></label>'+
								'</td>'+
								'<td class="center">'+(userCount+1)+'</td>'+
								'<td><a onclick="editUser(\''+message.user+'\')" style="cursor:pointer;">'+user+'</a></td>'+
								'<td class="center">'+comp+'</td>'+
								'<td class="center">'+
									str+
								'</td>'+
							'</tr>'
						);
						 userCount = userCount+1;
						 $("#onlineCount").html(userCount);
					}
				};
			}
		}
		
		//强制某用户下线
		function goOutUser(theuser){
			websocketonline.send('[goOut]'+theuser);
		}
		
		//强制某用户下线
		function goOutTUser(theuser){
			userComp = theuser.split("+");
			var user = userComp[0];
			var comp = userComp[1];
			var COMPANY = '${pd.COMPANY}';
			if('super' == user){
				bootbox.dialog({
					message: "<span class='bigger-110'>不能强制下线super用户!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				return;
			}
			if(comp != COMPANY){
				bootbox.dialog({
					message: "<span class='bigger-110'>不能强制其他法人用户下线!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				return;
			}
			bootbox.confirm("确定要强制["+theuser+"]下线吗?", function(result) {
				if(result) {
					goOutUser(theuser);
					 location.reload();
				}
			});
		}
		
		//查看修改用户
		function editUser(USERCOMP){
			str = USERCOMP.split("+");
			var USERNAME = str[0];
			var COMPANY = str[1];
			if('super' == USERNAME){
				bootbox.dialog({
					message: "<span class='bigger-110'>不能查看修改super用户!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				return;
			}
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = '<%=basePath%>user/goEditUfromOnline.do?USERNAME='+USERNAME+'&company='+COMPANY;
			 diag.Width = 469;
			 diag.Height = 350;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
							  if('admin' != document.getElementsByName('ids')[i].value){
								  if(str=='') str += document.getElementsByName('ids')[i].value;
								  else str += ',' + document.getElementsByName('ids')[i].value;
							  }else{
								  document.getElementsByName('ids')[i].checked  = false;
								  $("#zcheckbox").tips({
										side:3,
							            msg:'admin用户不能强制下线',
							            bg:'#AE81FF',
							            time:5
							        });
							  }
						  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何用户!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:3
				        });
						return;
					}else{
						top.jzts();
						var arField = str.split(',');
						for(var i=0;i<arField.length;i++){
							websocketonline.send('[goOut]'+arField[i]);
						}
						top.hangge();
					}
				}
			});
		}
		</script>
		<c:if test="${QX.cha == 0 }">
			<script type="text/javascript">
				alert("您无权查看");
			</script>
		</c:if>
	</body>
</html>

