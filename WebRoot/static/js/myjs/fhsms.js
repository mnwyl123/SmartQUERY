var locat = (window.location+'').split('/'); 

$(function() {
	$("#sendbox").click(function() {
		if($("#sendbox").html()=="全部"){
			//$(".text").animate({height:"100px"});
			$("#USERNAME").css("height","auto");
			$("#sendbox").html("隐藏");
		}else{
			//$(".text").animate({height:"32px"});
			$("#USERNAME").css("height","27px");
			$("#sendbox").html("全部");
		}
	});
	
	if ('fhsms' == locat[3]) {
		locat = locat[0] + '//' + locat[2];
	} else {
		locat = locat[0] + '//' + locat[2] + '/' + locat[3];
	}
	;});

$(top.hangge());
function changeDiv(){
		//$(".text").animate({height:"100px"});
	$("#USERNAME").css("height","auto");
	$("#sendbox").html("隐藏");
}
//发送
function sendFhsms(){
	//校验用户是否存在
	if($("#TYPE").val()=="1"){
		$("#CONTENT").val(getContentTxt());
	}else{
		$("#CONTENT").val(getContent());
	}
	if($("#USERNAME").html()==""){
		$("#USERNAME").tips({
			side:3,
            msg:'请输入用户名',
            bg:'#AE81FF',
            time:2
        });
		$("#USERNAME").focus();
		return false;
	}
	if($("#CONTENT").val()==""){
		$("#nr").tips({
			side:3,
            msg:'请输入内容',
            bg:'#AE81FF',
            time:3
        });
		return false;
	}
	$("#zhongxin").hide();
	$("#zhongxin2").show();
	var USERNAME = $("#USERNAME").html();
	var CONTENT = $("#CONTENT").val();
	$.ajax({
		type: "POST",
		url: locat+'/fhsms/save.do?tm='+new Date().getTime(),
    	data: {USERNAME:USERNAME,CONTENT:CONTENT},
		dataType:'json',
		//beforeSend: validateData,
		cache: false,
		success: function(data){
			 $.each(data.list, function(i, list){
				 if(list.msg == 'ok'){
					 var count = list.count;
					 var ecount = list.ecount;
					 $("#msg").tips({
						side:3,
			            msg:'成功发出'+count+'条,失败'+ecount+'条',
			            bg:'#68B500',
			            time:3
				      });
					 top.fhsmsmsg(USERNAME); //websocket即时通讯去通知收信人有站内信接收 ，fhsmsmsg()函数 editUserH()在 WebRoot\static\js\myjs\head.js
				 }else{
					 $("#msg").tips({
							side:3,
				            msg:'发送失败,请联系管理员!',
				            bg:'#FF0000',
				            time:6
					 });
				 }
				 setTimeout("close()",3000);
				 timer(2);
			 });
		}
	});
	
}

//倒计时
function timer(intDiff){
	window.setInterval(function(){
	$('#second_shows').html('<s></s>'+intDiff+'秒');
	if(intDiff>0){
		intDiff--;
	}else{
		window.location.href=document.referrer;
	}
	}, 1000);
} 

function setType(value){
	$("#TYPE").val(value);
}
function close(){
	//top.Dialog.close();
	window.location.href=document.referrer;
}

//打开查看
function dialog_open(){
	$("#USERNAMES").val($("#USERNAME").val());
	$("#dialog-add").css("display","block");
}
//关闭查看
function cancel_pl(){
	$("#dialog-add").css("display","none");
}
//ueditor纯文本
function getContentTxt() {
    var arr = [];
    arr.push(UE.getEditor('editor').getContentTxt());
    return arr.join("");
}
//ueditor有标签文本
function getContent() {
    var arr = [];
    arr.push(UE.getEditor('editor').getContent());
    return arr.join("");
}

setTimeout("ueditor()",500);
function ueditor(){
	var ue = UE.getEditor('editor');
}
function hasU(){
	if($("#USERNAME").html()==""){
		$("#USERNAME").tips({
			side:3,
            msg:'请输入用户名',
            bg:'#AE81FF',
            time:2
        });
		$("#USERNAME").focus();
		return false;
	}
	var USERNAME = $("#USERNAME").html();
	$.ajax({
		type: "POST",
		url: locat+'/fhsms/findUser.do?',
    	data: {USERNAME:USERNAME},
		dataType:'json',
		//beforeSend: validateData,
		cache: false,
		success: function(data){
			if("success" == data.result){
				 $("#USERNAME").tips({
						side:3,
			            msg:'用户 ' + data.msg + ' 不存在',
			            bg:'#AE81FF',
			            time:2
			        });
				 $("#USERNAME").focus();
				 $("#send").attr("disabled", true); 
			 }else{
				 $("#send").attr("disabled", false);
			 }
		}
	});
}