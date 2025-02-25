var locat = (window.location+'').split('/'); 
$(function(){if('main'== locat[3]){locat =  locat[0]+'//'+locat[2];}else{locat =  locat[0]+'//'+locat[2]+'/'+locat[3];};});

var fmid = "fhindex";	//菜单点中状态
var mid = "fhindex";	//菜单点中状态
var fhsmsCount = 0;		//站内信总数
var USER_ID;			//用户ID
var user = "FH";		//用于即时通讯（ 当前登录用户）
var TFHsmsSound = '1';	//站内信提示音效
var websocket;			//websocket对象
var wimadress="";		//即时聊天服务器IP和端口
var oladress="";		//在线管理和站内信服务器IP和端口
//alert($('.sidebar').width()+"..."+($(window).width()) * 0.14);
	/*if(parseInt($('.sidebar').width()) == 189){
		$('.navbar').css('width',$(window).width()-190);
	} else{
		$('.navbar').css('width',$(window).width()-43);
	}*/
function siMenu(id,fid,MENU_NAME,MENU_URL){
	if(id != mid){
		$("#"+mid).removeClass();
		mid = id;
	}
	if(fid != fmid){
		$("#"+fmid).removeClass();
		fmid = fid;
	}
	$("#"+fid).attr("class","active open");
	$("#"+id).attr("class","active");
	if(MENU_URL!="#"){
		top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
		if(MENU_URL != "druid/index.html"){
			jzts();
		}
		var sign = false;//判断是否已存在
//		alert("..."+$(window.frames["mainFrame"].document).find("#tab1").find("table").html());
		$("#menuli").find("li").each(function(){
			if($.trim($(this).text()) == $.trim(MENU_NAME)){
				sign = true;
				$(this).addClass("blue2").css("font-weight","bold");
			}else{
				$(this).removeClass("blue2").css("font-weight","normal");
			}
		});
		if(!sign){
			var str = "<li id=\"li_"+id+"\"  class=\"blue2\" style=\"font-weight:bold;cursor: pointer;\" onclick=\"siMenu('"+id+"','"+fid+"','"+MENU_NAME+"','"+MENU_URL+"')\">"+MENU_NAME +"</li>";
			$("#menuli").prepend(str);
		}
	}
	
}

$(function(){
	getHeadMsg();	//初始页面最顶部信息
	$("#liebiao").click(function(){
		if($(".sidebar").hasClass("menu-min")){
			$('.sidebar').removeClass('menu-min');
		} else {
			$('.sidebar').addClass('menu-min');
		} 
	});
	$("#tabinfo").click(function(){
		if($.trim($("#menuli").html())!=""){
			if($("#menudiv").css("display")=="none"){
				$("#menudiv").css("display","block");
			}else{
				$("#menudiv").css("display","none");
			}
		}
	});
	/*$("#menudiv").mouseout(function(){
	 	$("#menudiv").css("display","none");
	});*/
});

//初始页面信息
function getHeadMsg(){
	$.ajax({
		type: "POST",
		url: locat+'/head/getList.do?tm='+new Date().getTime(),
    	data: encodeURI(""),
		dataType:'json',
		//beforeSend: validateData,
		cache: false,
		success: function(data){
			 $.each(data.list, function(i, list){
				 $("#user_info").html('<small>Welcome</small> '+list.NAME+'');//登陆者资料
				 us = list.USERNAME;
				 user = list.USERNAME+"+"+list.COMPANY;
				 USER_ID = list.USER_ID;		//用户ID
				 if(list.USERNAME != 'super'){
					 $("#systemset").hide();	//隐藏系统设置
				 }else{
					 $("#orgset").hide();	//隐藏系统设置
				 }
			 });
			 fhsmsCount = Number(data.fhsmsCount);
			 $("#fhsmsCount").html(Number(fhsmsCount));	//站内信未读总数
			 TFHsmsSound = data.FHsmsSound;				//站内信提示音效
			 wimadress = data.wimadress;				//即时聊天服务器IP和端口
			 oladress = data.oladress;					//在线管理和站内信服务器IP和端口
			 online();									//连接在线
		}
	});
}

//获取站内信未读总数(在站内信删除未读新信件时调用此函数更新未读数)
function getFhsmsCount(){
	$.ajax({
		type: "POST",
		url: locat+'/head/getFhsmsCount.do?tm='+new Date().getTime(),
    	data: encodeURI(""),
		dataType:'json',
		cache: false,
		success: function(data){
			 fhsmsCount = Number(data.fhsmsCount);
			 $("#fhsmsCount").html(Number(fhsmsCount));	//站内信未读总数
		}
	});
}

//加入在线列表
function online(){
	if (window.WebSocket) {
		websocket = new WebSocket(encodeURI('ws://'+oladress)); //oladress在main.jsp页面定义
		websocket.onopen = function() {
			//websocket.send('[goOut]'+user);
			//连接成功
			websocket.send('[join]'+user);
		};
		websocket.onerror = function() {
			//连接失败
		};
		websocket.onclose = function() {
			//连接断开
		};
		//消息接收
		websocket.onmessage = function(message) {
			var message = JSON.parse(message.data);
			if(message.type == 'goOut'){
				$("body").html("");
				goOut("1");
			}else if(message.type == 'thegoout'){
				$("body").html("");
				goOut("2");
			}else if(message.type == 'senFhsms'){
				fhsmsCount = Number(fhsmsCount)+1;
				$("#fhsmsCount").html(Number(fhsmsCount));
				$("#fhsmsobj").html('<audio style="display: none;" id="fhsmstsy" src="static/sound/'+TFHsmsSound+'.mp3" autoplay controls></audio>');
				$("#fhsmstss").tips({
					side:3,
		            msg:'有新消息',
		            bg:'#AE81FF',
		            time:30
		        });
			}
		};
	}
}

//下线
function goOut(msg){
	window.location.href=locat+"/logout.do?msg="+msg+"&USER_ID="+USER_ID+"&USERNAME="+us;
}

//去通知收信人有站内信接收
function fhsmsmsg(USERNAME){
	var arrUSERNAME = USERNAME.split(';');
	for(var i=0;i<arrUSERNAME.length;i++){
		websocket.send('[fhsms]'+arrUSERNAME[i]);//发送通知
	}
}

//读取站内信时减少未读总数
function readFhsms(){
	fhsmsCount = Number(fhsmsCount)-1;
	$("#fhsmsCount").html(Number(fhsmsCount) <= 0 ?'0':fhsmsCount);
}

//修改个人资料
function editUserH(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="个人资料";
	 diag.URL = locat+'/head/goCurrEditU.do?USER_ID='+USER_ID+'&fx=head';
	 diag.Width = 469;
	 diag.Height = 320;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//系统设置
function editSys(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="系统设置";
	 diag.URL = locat+'/head/goSystem.do';
	 diag.Width = 600;
	 diag.Height = 526;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//机构切换
function changeOrg(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="机构切换";
	 diag.URL = locat+'/head/changeOrg.do';
	 diag.Width = 800;
	 //diag.Height = 526;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//站内信
function fhsms(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="站内信";
	 diag.URL = locat+'/fhsms/list.do?';
	 diag.Width = 800;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//切换菜单
function changeMenus(){
	window.location.href=locat+'/main/yes';
}

//清除加载进度
function hangge(){
	$("#jzts").hide();
}

//显示加载进度
function jzts(){
	$("#jzts").show();
}