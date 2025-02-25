var cur_xhr;

function ajaxPost( url, param, successCallback,async ) {
	var maxRetryCount = 2;
	var retryCount =0;
	cur_xhr =  $.ajax({
		type:"POST",
		url:url,
		cache: false,
		data:param,
		dataType:"json",
		async: async,
		success: successCallback,
		error:function(xhr,errCode,exception){  //retry
		    cur_xhr.abort();
		    cur_xhr = $.ajax({
				type:"POST",
				url:url,
				cache: false,
				data:param,
				dataType:"json",
				async: async,
				success: successCallback,
				error:function(xhr,errCode,exception){
					alert("访问服务器出错！ "  + xhr.status + " : " + xhr.statusText);
				}
			});
		}
	});
	return cur_xhr;
}

function ajaxUrlCall( url , param, callback, async){
	if(callback) {
		ajaxPost(  url,//"${proxyUrl}",   //ajaxPost( "${proxyUrl}RegularReport",
			param,callback ,async);
	} else {
		alert("必须定义回调函数！");
	}
}

var PostWindowLocation = function( url ) {
	var urlArr = url.split("?");
	var postUrl = urlArr[0];
	var postData = urlArr[1].split("&");
	
	var form = document.getElementById("postData_form");
	if (!form) {
		form= document.createElement("form");
		form.id = "postData_form";
		form.method = "post";
		form.target = "_self";
		form.style.display = "none";
		
		document.body.appendChild(form);
	}
	
	var innerHTML = "";
	for ( var i = 0; i < postData.length; i++ ) {
		var index = postData[i].indexOf("=");
		var par0 = postData[i].substring(0, index);
		var par1 = postData[i].substring(index+1, postData[i].length);
		innerHTML += ("<input type='text' name='"+par0+"' value='"+par1+"'>");
	}
	form.innerHTML = innerHTML;
	form.action = postUrl;
	form.submit();
};

var PostNewWin = function( url ) {
	var urlArr = url.split("?");
	var postUrl = urlArr[0];
	var postData = urlArr[1].split("&");
	
	var iframe = document.getElementById("postData_iframe");
	if (!iframe) {
		iframe = document.createElement("iframe");
		iframe.id = "postData_iframe";
		iframe.src = "about:blank";
		iframe.frameborder = "0";
		iframe.style.width = "0px";
		iframe.style.height = "0px";
	
		var form= document.createElement("form");
		form.id = "postData_form";
		form.method = "post";
		form.target = "_blank";
		
		document.body.appendChild(iframe);
		iframe.contentWindow.document.write("<body>" + form.outerHTML + "</body>");
	}
	
	var innerHTML = "";
	for ( var i = 0; i < postData.length; i++ ) {
		var index = postData[i].indexOf("=");
		var par0 = postData[i].substring(0, index);
		var par1 = postData[i].substring(index+1, postData[i].length);
		innerHTML += ("<input type='text' name='"+par0+"' value='"+par1+"'>");
	}
	iframe.contentWindow.document.getElementById("postData_form").innerHTML = innerHTML;
	iframe.contentWindow.document.getElementById("postData_form").action = postUrl;
	iframe.contentWindow.document.getElementById("postData_form").submit();
};

function newPostWindow(postUrl, args, dontOpen){
	var iframe = document.getElementById("postData_iframe");
	if (!iframe) {
		iframe = document.createElement("iframe");
		iframe.id = "postData_iframe";
		iframe.src = "about:blank";
		iframe.frameborder = "0";
		iframe.style.width = "0px";
		iframe.style.height = "0px";
	
		var form= document.createElement("form");
		form.id = "postData_form";
		form.method = "post";
		if(!dontOpen){
			form.target = "_blank";
		}
		document.body.appendChild(iframe);
		iframe.contentWindow.document.write("<body>" + form.outerHTML + "</body>");
	}
	
	var innerHTML = "";
	/*
	for ( var i = 0; i < postData.length; i++ ) {
		var index = postData[i].indexOf("=");
		var par0 = postData[i].substring(0, index);
		var par1 = postData[i].substring(index+1, postData[i].length);
		innerHTML += ("<input type='text' name='"+par0+"' value='"+par1+"'>");
	}*/
	for(var i in args){ 
		innerHTML += ("<input type='text' name='"+i+"' value='"+args[i]+"'>");
	} 
	iframe.contentWindow.document.getElementById("postData_form").innerHTML = innerHTML;
	iframe.contentWindow.document.getElementById("postData_form").action = postUrl;
	iframe.contentWindow.document.getElementById("postData_form").submit();

}

function _postData(postUrl,args) {
    $("#postData_iframe").remove();
    $("body").append("<iframe id='postData_iframe' src='about:blank' style='width:0;height:0' />")
    var iframe = $("#postData_iframe").get(0);
  //target='postReturn_iframe'
	iframe.contentWindow.document.write("<body><form id='postData_form' method='post'  ></form></body>");
	
	var innerHTML = "";

	for(var i in args){ 
		innerHTML += ("<input type='text' name='"+i+"' value='"+args[i]+"'>");
	} 
	iframe.contentWindow.document.getElementById("postData_form").innerHTML = innerHTML;
	iframe.contentWindow.document.getElementById("postData_form").action = postUrl;
	iframe.contentWindow.document.getElementById("postData_form").submit();
    //return iframe.contentWindow.innerHTML;
}



/** 
* 以POST表单方式打开新窗口的JQUERY实现 
@param:url 需要打开的URL 
@param:args URL的参数，数据类型为object 
@param:name 打开URL窗口的名字，如果同一按钮需要重复地打开新窗口， 
而不是在第一次打开的窗口做刷新，此参数应每次不同 
----@param:windowParam 新打开窗口的参数配置 
* @author: haijiang.mo 
*/ 
function openPostWindow(url,args,name,windowConfigStr){ 


	//创建表单对象 
	var _form = $("<form></form>",{ 
		'id':'tempForm', 
		'method':'post', 
		'action':url, 
		'target':name, 
		'style':'display:none' 
		}).appendTo($("body")); 
	
	//将隐藏域加入表单 
	for(var i in args){ 
		_form.append($("<input>",{'type':'hidden','name':i,'value':args[i]})); 
	} 
/*	
	//克隆窗口参数对象 
	var windowConfig = clone(windowDefaultConfig); 
	
	//配置窗口 
	for(var i in windowParam){ 
		windowConfig[i] = windowParam[i]; 
	} 
	
	//窗口配置字符串 
	var windowConfigStr = ""; 
	
	for(var i in windowConfig){ 
		windowConfigStr += i+"="+windowConfig[i]+","; 
	} 
*/	
	//绑定提交触发事件 
	_form.bind('submit',function(){ 
		window.open("RegularReport",name,windowConfigStr,false); 
	}); 
	
	//触发提交事件 
	_form.trigger("submit"); 
	//表单删除 
	_form.remove(); 
} 

function disableCtrls() {
	$(".inputPanel input.paramInput.disable,.inputPanel select.paramInput.disable,.inputPanel .paramInput.disable select,.inputPanel .paramInput.disable input").attr("disabled",true);
}

function inputNumberCallback(e){
	if( e.which == 46 ){ // .
		if($(this).attr("value").indexOf(".") >= 0) {
			return false;
		}
	} else if(e.which == 45) { //-
		if($(this).attr("value").indexOf("-") >= 0){
		 	return false;
		}
		$(this).attr("value", "-" + $(this).attr("value"));
		return false;
		}
	else if( 48 > e.which || 57 < e.which ){
		return false;
	} 	
}

function initTreeSelect() {
	var thisCtrl = this;
	var setting = {
			check: {
				enable: true,
				chkboxType:{"Y":"", "N":""} //{"Y":"ps", "N":"ps"}
			},
			view: {
				dblClickExpand: false,
				showLine:false,
				showIcon:false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				//beforeClick: thisCtrl.beforeClick,
				onClick: thisCtrl.onCheck
			}
		};
	$(".dmcontent").each(function(){
		var zTree = $.fn.zTree.init($(this), setting, znodeses[$(this).attr("bind")]);
	});
	
	this.onClick = function(e, treeId, treeNode) {
		alert(treeNode.name);
	}
}

function initMultiSelect() {
	$(".dropdown").hover(function(){
		$(this).css("background-color","silver");
	},function(){
		$(this).css("background-color","");
	});
	
	var thisCtrl = this;
	
	this.curShow = null;
		
	this.beforClick = function(treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj(treeId);//("treeInput");
		zTree.checkNode(treeNode, !treeNode.checked, null, true);
		return false;
	}
	
	this.onCheck = function (e, treeId, treeNode) {
		var paramKey = $("#"+treeId).attr("bind");
		var zTree = $.fn.zTree.getZTreeObj(treeId);//("treeInput"),
		var cityObj = $("#" + paramKey);
		nodes = zTree.getCheckedNodes(true);
//		alert($("#"+treeId).attr("bind"));
//		alert($("#"+treeId).attr("bind") + "   "+ znodeses[$("#"+treeId).attr("bind")].length );
		if(nodes.length == znodeses[paramKey].length) { //zTree.getNodes().length) {
			cityObj.val("所有");
		} else {
			v = "";
			var size = nodes.length>3?3:nodes.length;
			for (var i=0, l=size; i<l; i++) {
				v += nodes[i].name + ",";
			}
			if (v.length > 0 ) {
				v = v.substring(0, v.length-1);
				if(nodes.length>3)
					v += "...";
			}
			
			cityObj.val(v);//attr("value", v);
		}
	}
	
	this.canSelect = function(treeId,treeNode) {
		var mask = $("#"+treeId).attr("mask");
		//alert(mask);
		var levelMark = treeNode["lvl"];
		if(!levelMark){
			return true;
		}
		if(mask != null && mask.indexOf("1") >= 0) { // one stard for can select
			var level =  parseInt(levelMark);
			if(mask.length - level -1 >=0 && mask.charAt(mask.length - level -1) == "1") {
				return true;
			}
			/*
			for(var i=0;i<mask.length;i++){
				if( mask.charAt(mask.length-i-1) == "1"){				
					if( level == i) {
						return true;
					}
				}
			}
			*/
		} else {
			if(levelMark.indexOf("l") > 0) { //L stard for leaf
				return true;
			}
		}
		return false;
	}
	
	this.onBeforeClick = function(treeId, treeNode,clickFlag){
		if(!canSelect(treeId,treeNode)) { //L stard for leaf
			return false;
		}
	}
	
	this.onClick = function(e, treeId, treeNode) {
		var paramKey = $("#"+treeId).attr("bind");
		var zTree = $.fn.zTree.getZTreeObj(treeId);//("treeInput"),
		var cityObj = $("#" + paramKey);
		
		if(canSelect(treeId,treeNode)) { //L stard for leaf
				cityObj.val(treeNode.name);
				thisCtrl.hideDropdown();
		}
	}
	
	this.onBodyDown = function(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#" + thisCtrl.curShow).length>0)) {
			/*
			$("#" + thisCtrl.curShow).css("display","none");//fadeOut("fast");
			$("body").unbind("mousedown", thisCtrl.onBodyDown);
			thisCtrl.show = null;
			var bindInput = $("#" + thisCtrl.curShow + " .ztree").attr("bind");
			$("#" + bindInput).trigger("change");
			*/
			thisCtrl.hideDropdown();
		}
	}
	
	this.hideDropdown = function(){
		$("#" + thisCtrl.curShow).css("display","none");//fadeOut("fast");
		$("body").unbind("mousedown", thisCtrl.onBodyDown);
		thisCtrl.show = null;
		var bindInput = $("#" + thisCtrl.curShow + " .ztree").attr("bind");
		$("#" + bindInput).trigger("change");
	}
	
	var setting = {
		check: {
			enable: true,
			chkboxType:{"Y":"", "N":""} //{"Y":"ps", "N":"ps"}
		},
		view: {
			dblClickExpand: false,
			showLine:false,
			showIcon:false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: thisCtrl.beforeClick,
			onCheck: thisCtrl.onCheck
		}
	};
	
	var singleSetting = {
			view: {
				dblClickExpand: false,
				showLine:false,
				showIcon:false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: thisCtrl.onBeforeClick,
				onClick: thisCtrl.onClick
			}
		};
	
	$("a.treeOp").click(function(event){
		event.stopPropagation();
		var zTree = $.fn.zTree.getZTreeObj($(this).attr("treeId"));
		//zTree.setting.check.autoCheckTrigger = true;
		switch($(this).attr("op")) {
		case "selectAll":{
			zTree.checkAllNodes(true);
			onCheck(null,$(this).attr("treeId"),null);
			break;
		} case "diselectAll":{
			zTree.checkAllNodes(false);
			onCheck(null,$(this).attr("treeId"),null);
			break;
		} case "toggle":{
			for(var i=0;i<zTree.getNodes().length;i++){
				zTree.checkNode(zTree.getNodes()[i], null, false, true);
			}
			break;
		}
		}
		return false;
	});
	
	//$(".multiSelect").click(function(){
	$(".dropdown").click(function(event){
		/*
		if(thisCtrl.curInputCtrlId != $(this).attr("id")) {
			thisCtrl.curInputCtrlId = $(this).attr("id");
			$.fn.zTree.init($("#treeInput"), setting, znodeses[thisCtrl.curInputCtrlId]);
		}*/
		
		thisCtrl.curShow =  $(this).children().attr("id") + "-box";//$(this).attr("id") + "-box";
		var treeView = $("#" + thisCtrl.curShow + " .ztree");
/*
		var width = parseInt(treeView.attr("maxLen")) + parseInt(treeView.attr("lvls")) ;
		if(width < 15) {
			width = 15;
		} else if(width > 30) {
			width = 30;
		}
*/		
		var offset = $(this).position();	
		var left = offset.left;
		if(event.screenX > $(window).width() / 2){
			//left = 
		}
		$("#" + thisCtrl.curShow).css({left: left + "px", top:offset.top + $(this).outerHeight() + "px"}).css("display","block");//.slideDown("fast");		
		if( $(this).width() + 12 > 100 ) {
			$("#" + thisCtrl.curShow).width($(this).width() + 12);
//			treeView.css("width",$(this).width());
		} else {
			$("#" + thisCtrl.curShow).width(100);
//			treeView.css("width",width);
		}
		$("body").bind("mousedown", thisCtrl.onBodyDown);
	});
	
	$(".dmcontent").each(function(){
		var activeSetting = $(this).hasClass("singleSel") ? singleSetting : setting; 
		var chkboxType = $(this).attr("checkboxtype");
		if(!$(this).hasClass("singleSel")){
			if(chkboxType && "autocheckchildren"== chkboxType.toLowerCase()) {
				activeSetting.check.chkboxType = {"Y":"s","N":"s"};
			} else {
				activeSetting.check.chkboxType = {"Y":"","N":""};
			}
		}
		var zTree = $.fn.zTree.init($(this), activeSetting, znodeses[$(this).attr("bind")]);
		var defVals = $(this).attr("default");
		if(defVals && defVals != "") {
			if(defVals == '所有') {
				for(var i=0;i<zTree.getNodes().length;i++){
					zTree.checkNode(zTree.getNodes()[i], null, false, true);
				}
			} else if(defVals.toLowerCase() == "_top" || defVals.toLowerCase() =="根节点") {
				if(canSelect($(this).attr("id"), zTree.getNodes()[0])){
					if($(this).hasClass("singleSel")) {
						var paramKey = $(this).attr("bind");
						zTree.selectNode(zTree.getNodes()[0],false);
						$("#" + paramKey).val(zTree.getNodes()[0].name);
					} else {
						zTree.checkNode(zTree.getNodes()[0],null,false,true);
					}
				}
			}
			else {
				var str = defVals;
				var tokens = str.split(",");		
				if(tokens.length<=1) {
					tokens = str.split("，");
				}
				for(var i = 0 ; i<tokens.length; i++) {
					var token = tokens[i];
					var key = "name";
					var node=null;
					if("(（".indexOf(token.substring(0,1))>=0
				    		&& ")）".indexOf(token.substring(token.length-1,token.length))>=0) {
				    	key = "id";
				    	token = token.substring(1,token.length-1);
				    	node = zTree.getNodeByParam(key,token);
				    } else {
				    	node = zTree.getNodeByParam("name",token); //try caption match
				    	if(!node){
				    		node = zTree.getNodeByParam("id",token); //try id match
				    	}
				    }

//					var node = zTree.getNodeByParam(key,token);
					if(!node) {
						node = zTree.getNodes()[0];
					}
					if(node) {
						if(canSelect($(this).attr("id"), node)){
							if($(this).hasClass("singleSel")) {
								var paramKey = $(this).attr("bind");
								zTree.selectNode(node,false);
								$("#" + paramKey).val(node.name);
								break;
							} else {
								zTree.checkNode(node, null, false, true);
							}
						}
					} 
				}
			/*
				for(var i=0;i<zTree.getNodes().length;i++){
					var node = zTree.getNodes()[i];
					for(var j=0;j<tokens.length;j++){
				    	if(node.name == $.trim(tokens[j])) {
				    		zTree.checkNode(node, null, false, true);
				    	}
					}	
				}
				*/
			}
		}
	});
	
}

function initDependsInputControls() {

	$("select.paramInput").each(function(){
		var dependeeId = $(this).attr("id");
		var dependeeVar = $(this).attr("var");
		var dependsId = $(this).attr("depends");
		if(dependsId && dependsId != ""){
			
			if($(this).hasClass("dataPrecision")){
				dependsInputChange($("#"+dependsId),dependeeId,dependeeVar);
			}
			
			if(dependsId.indexOf("|") > 0) {
				var dids = dependsId.split("|");
				for(var i=0;i<dids.length;i++){
					$("#" + dids[i]).change(function(){
						dependsInputChange($(this),dependeeId,dependeeVar);
					});
				}
			} else {
				$("#" + dependsId).change(function(){
					dependsInputChange($(this),dependeeId,dependeeVar);
				});
			}
		}
	});	
	
	$(".paramInput.multiSelect").each(function(){
		var dependeeId = $(this).attr("id");
		var dependeeVar = $(this).attr("var");
		var dependsId = $(this).attr("depends");
		if(dependsId && dependsId != ""){

			$("#" + dependsId).change(function(){
				dependsInputChange4Multi($(this),dependeeId,dependeeVar,"multiSelect");
			});
		}
	});
	
	$(".itext").each(function(){
		var dependeeId = $(this).attr("id");
		var dependeeVar = $(this).attr("var");
		var dependsId = $(this).attr("depends");
		if(dependsId && dependsId != ""){
			var param = {
					ajax:1,
					type:params.type,
					ctrl:"itext",
					op:"updateCtrl",
					dependee:dependeeVar,
					depends:dependsId,
					val:$("#"+dependsId).selectedValues()[0],
					cap:$("#"+dependsId).selectedTexts()[0]
					};
				mask();
				ajaxCall(param,function(data){
				    if( data.HeadInfo.Code == 0 ){
				    	
				    	var key = dependeeId;
				    	
				    	autocompletes[key] = data.DataInfo.options;
				    	var maxlen = 6;
						for(var i=0;i<autocompletes[key].length;i++){
							maxlen = autocompletes[key][i][0].length>maxlen ? autocompletes[key][i][0].length : maxlen;
						}
						
						//alert(key);
						$("#"+key).setOptions({"data":autocompletes[key]}).css("width",maxlen + "em");
						
				    	
				    } else {
				    	alert(data.HeadInfo.Message);
				    }
					unmask();
				});
			$("#" + dependsId).change(function(){
				var ps = {
					ajax:1,
					type:params.type,
					ctrl:"itext",
					op:"updateCtrl",
					dependee:dependeeVar,
					depends:dependsId,
					val:$(this).selectedValues()[0],
					cap:$(this).selectedTexts()[0]
					};
				
				mask();
				ajaxCall(ps,function(data){
				    if( data.HeadInfo.Code == 0 ){
				    	
				    	var key = dependeeId;
				    	$("#"+key).val("");
				    	autocompletes[key] = data.DataInfo.options;
				    	var maxlen = 6;
						for(var i=0;i<autocompletes[key].length;i++){
							maxlen = autocompletes[key][i][0].length>maxlen ? autocompletes[key][i][0].length : maxlen;
						}
						
						$("#"+key).setOptions({"data":autocompletes[key]}).css("width",maxlen + "em");
						
				    	
				    } else {
				    	alert(data.HeadInfo.Message);
				    }
					unmask();
				});
			});
		}
	});	

	$("span.DateSelect").each(function(){
	    var dependeeId = $(this).attr("id");
		var dependsId = $(this).attr("depends");
		if(dependsId && dependsId != ""){
			var formatStr = $(this).attr("optionType");
			
			if(formatStr.indexOf("$")>=0) {				
			    $(this).attr("optionType", $("#" + dependsId).val());
				$("#" + dependsId).change(function(){
				    $("#" + dependeeId).attr("optionType", $("#" + dependsId).val());
					initInputControl(dependeeId);
				});
			}
		}
	});
	
}

function initInputControl(id){
    var $comp = $("#" + id);
	if( $comp.hasClass("DateSelect") ){
		initDateSelect($comp);
	}
}


function dependsInputChange($ctrl, dependeeId, dependeeVar) {
	if($("#"+dependeeId).hasClass("dataPrecision")) {
		var val = $ctrl.selectedValues()[0];
		$("#"+dependeeId).selectOptions(getDataPrecision(val));
		return;
	}

	collectParams(params);
	var ps = $.extend({},params,
			{
			ajax:1,
			type:params.type,			
			ctrl:"select",
			op:"updateCtrl",
			dependee:dependeeVar,
			def:$("#"+dependeeId).attr("default"),
			depends:$ctrl.attr("id"),//dependsId,
			val:$ctrl.selectedValues()[0],
			cap:$ctrl.selectedTexts()[0],
			params:JSON.stringify(params)
			});
		
//		mask();
		ajaxCall(ps,function(data){
		    if( data.HeadInfo.Code == 0 ){
		    	var html = data.DataInfo.options;
		    	if($.trim(html)==""){
		    		html = "<option />";
		    	}
		    	$("#"+dependeeId).html(html);
		    	//$("#"+dependeeId).html(data.DataInfo.options);
		    } else {
		    	alert(data.HeadInfo.Message);
		    }
		    var $dependeeee = $("select.paramInput[depends='"+ dependeeId +"']"); 
		    if($dependeeee.size() > 0) {
		    	dependsInputChange($("#"+dependeeId),$dependeeee.attr("id"),$dependeeee.attr("var"));
		    }
		    $dependeeee = $(".paramInput.multiSelect[depends='"+ dependeeId +"']");
		    if($dependeeee.size() > 0) {
		    	dependsInputChange4Multi($("#"+dependeeId),$dependeeee.attr("id"),$dependeeee.attr("var"));
		    }
//			unmask();
		});
}

function dependsInputChange4Multi($ctrl, dependeeId, dependeeVar) {
	collectParams(params);
	var ps = $.extend({},params,
			{
			ajax:1,
			type:params.type,			
			ctrl:"multiSelect",
			op:"updateCtrl",
			dependee:dependeeVar,
			def:$("#"+dependeeId).attr("default"),
			depends:$ctrl.attr("id"),//dependsId,
			val:$ctrl.selectedValues()[0],
			cap:$ctrl.selectedTexts()[0],
			params:JSON.stringify(params)
			});
		
//		mask();
		ajaxCall(ps,function(data){
		    if( data.HeadInfo.Code == 0 ){
		    	var treeId = dependeeId + "-tree";
		    	var paramKey = $("#"+treeId).attr("bind");
		    	znodeses[paramKey] = data.DataInfo.options;
		    	var zTree = $.fn.zTree.getZTreeObj(treeId);
		    	var setting = zTree.setting;
		    	$("#" + dependeeId).val("");
		    	zTree.destroy();
		    	$.fn.zTree.init($("#"+treeId),setting,znodeses[paramKey]);
		    } else {
		    	alert(data.HeadInfo.Message);
		    }
		    var $dependeeee = $("select.paramInput[depends='"+ dependeeId +"']"); 
		    if($dependeeee.size() > 0) {
		    	dependsInputChange($("#"+dependeeId),$dependeeee.attr("id"),$dependeeee.attr("var"));
		    }
		    $dependeeee = $(".paramInput.multiSelect[depends='"+ dependeeId +"']");
		    if($dependeeee.size() > 0) {
		    	dependsInputChange4Multi($("#"+dependeeId),$dependeeee.attr("id"),$dependeeee.attr("var"));
		    }
//			unmask();
		});
}