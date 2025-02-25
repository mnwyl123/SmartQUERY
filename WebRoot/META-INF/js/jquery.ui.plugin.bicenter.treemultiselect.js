(function($,undefined ){	
	var treeMultiSelectArray= new Array(); 
	var curIndex=-1;
	var curMullis="";
	function TreeMultiSelect()
	{
		this.defaultOption={
			inputOption:"",
			dataType:" ",	
			varName:"",
			varCapName:"",
			disableCondition:"",
			dataFormat:"",
			inputScopeDef:"",	
			inputScopeData:"",
			usage:" ",
			inputCtrlAttrs:"",
			dafaultValDef:"",
			defaultVal:"",
			nodeName:"",
			pickerName:""
		};
	}
	
	$.extend(TreeMultiSelect.prototype,{
		getvarTreeMultiSelect:function(selector)
		{		
			var varVal="";		
			if($(selector).hasClass("treeSelect")){		
				var cap = $.trim($(selector).val());
				if(cap!=""){
		    		var treeId = $(selector).attr("id") + "-tree";
			    	var zTree = $.fn.zTree.getZTreeObj(treeId);	
		    		var nodes = zTree.getSelectedNodes();
		    	    varVal=nodes[0]["id"];
		    	}				    		    	
		    }else if($(selector).hasClass("multiSelect")) {
		    	var cap = $.trim($(selector).val());
				if(cap!=""){
			    	var treeId = $(selector).attr("id") + "-tree";
			    	var zTree = $.fn.zTree.getZTreeObj(treeId);		    	
					var nodes = zTree.getCheckedNodes(true);
					varVal = "";//"multiSelectInput:";
					for(var i=0;i<nodes.length;i++){
						varVal += nodes[i]["id"];
						if(i<nodes.length-1){
							varVal += ",";
						}
					}
				}						
		    }else {	    	
		    	varVal= $.trim($(selector).val());
			}	
			
			return varVal;  
		},
		
		getvarCapTreeMultiSelect:function(selector)
		{	
			var varCap="";		
		    if($(selector).hasClass("treeSelect")){
			   varCap= $.trim($(selector).val());
		    } else if($(selector).hasClass("multiSelect")){
		    	varCap= $.trim($(selector).val());
		    } else {	    	
		    	varCap=$.trim($(selector).val());		
			}
			return varCap;
		},
		
		getChildNodeClass:function($this){
			var className=$($this).attr("class");
			return treeMultiSelectArray[curIndex].defaultOption.nodeName+"."+className+">input[type=text]";
		},
		
		getChildNodeID:function($this){
			return treeMultiSelectArray[curIndex].inputID;
		}
	  }
	);
	function addDivElement($this,inputID)
	{
		var divID=inputID+"-box";
		var selectAndCancleID="selectCancle"+inputID; 
		var treeTopID=inputID+"-tree";
		var bind=inputID;
		var defaultValDef=treeMultiSelectArray[curIndex].defaultOption.defaultValDef;
		//bind="param-hyml" default="03" lvls="1" maxlen="1" mask="$cy"		
		var dependVal=treeMultiSelectArray[curIndex].defaultOption.dataFormat;
		$($this).after("<div id='"+divID+"' class='menuContent' style='display:none; position: absolute;width:15em;z-index:100;'></div>");
		$("#"+divID).append("<ul id='"+treeTopID+"'bind='"+bind+"'default='"+defaultValDef+"' lvls='4' maxlen='29' mask='"+dependVal+"' style='margin-top:0; padding:0; width:100%; height: 300px;'></ul>");
		$("#"+divID).append("<div id='"+selectAndCancleID+"' style='width:100%;background-color:#ffffff;height:1.5em;line-height:1.5em;'></div>");
			
		if(treeMultiSelectArray[curIndex].defaultOption.pickerName == "treeselect"){
			$("#"+treeTopID).addClass("ztree dmcontent singleSel");//
		}else{		
			$("#"+treeTopID).addClass("ztree dmcontent");
			var selectAll ="<a class='treeOp' href='#' treeid='"+treeTopID+"' op='selectAll'>全选</a>";
			var diselectAll ="<a class='treeOp' href='#' treeid='"+treeTopID+"' op='diselectAll'>全消</a>";
			var toggle="<a class='treeOp' href='#' treeid='"+treeTopID+"' op='toggle'>反选</a>";
			if($("#"+inputID).attr("depends").length>0){
				$("#"+selectAndCancleID).html(selectAll+diselectAll+toggle);
			}else{
				$("#"+selectAndCancleID).html(selectAll+diselectAll);
			}
			
			if(treeMultiSelectArray[curIndex].defaultOption.inputOption=="必输"||
				treeMultiSelectArray[curIndex].defaultOption.inputOption=="必选"){
					var parentID=$("#"+inputID).parent().attr("id");
					if(parentID){
						 $("#"+parentID).after("<span style='color:red;'>*</span>");
					}
			}
		}
		
		 if(!$("#"+treeTopID).attr("bind")){
			 $("#"+treeTopID).attr("bind",bind);
		 }
		 
		if(!$("#"+treeTopID).attr("default")){
			$("#"+treeTopID).attr("default",defaultValDef);
		}
		
	};
	function initMultiSelect($this,inputID) {
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
		},
		
		this.onCheck = function (e, treeId, treeNode) {
			var paramKey = $("#"+treeId).attr("bind");
			var zTree = $.fn.zTree.getZTreeObj(treeId);//("treeInput"),
			var cityObj = $("#" + paramKey);
			nodes = zTree.getCheckedNodes(true);
			if(nodes.length == treeMultiSelectArray[curIndex].defaultOption.inputScopeData.length){ 
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
		},
		
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
		},
		
		this.onBeforeClick = function(treeId, treeNode,clickFlag){
			if(!canSelect(treeId,treeNode)) { //L stard for leaf
				return false;
			}
		},
		
		this.onClick = function(e, treeId, treeNode) {
			var paramKey = $("#"+treeId).attr("bind");
			//var zTree = $.fn.zTree.getZTreeObj(treeId);//("treeInput"),
			var cityObj = $("#" + paramKey);
			
			if(canSelect(treeId,treeNode)) { //L stard for leaf
					cityObj.val(treeNode.name);
			}
			
		},
		
		this.onBodyDown = function(event) {
			if (!(event.target.id == "menuBtn" ||
					event.target.id == "citySel" || event.target.id == "menuContent" ||
					$(event.target).parents("#" + thisCtrl.curShow).length>0)) {
				$("#" + thisCtrl.curShow).css("display","none");//fadeOut("fast");
				$("body").unbind("mousedown", thisCtrl.onBodyDown);
				thisCtrl.show = null;
				var bindInput = $("#" + thisCtrl.curShow + " .ztree").attr("bind");
				$("#" + bindInput).trigger("change");
			}
		};
		
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
			//var treeView = $("#" + thisCtrl.curShow + " .ztree");
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
//				treeView.css("width",$(this).width());
			} else {
				$("#" + thisCtrl.curShow).width(100);
//				treeView.css("width",width);
			}
			
			$("body").bind("mousedown", thisCtrl.onBodyDown);
		});
		
		var treeTopID=inputID+"-tree";
		$("#"+treeTopID).each(function(){
			var activeSetting = $(this).hasClass("singleSel") ? singleSetting : setting; 
			var chkboxType = $(this).attr("checkboxtype");
			if(!$(this).hasClass("singleSel")){
				if(chkboxType && "autocheckchildren"== chkboxType.toLowerCase()) {
					activeSetting.check.chkboxType = {"Y":"s","N":"s"};
				} else {
					activeSetting.check.chkboxType = {"Y":"","N":""};
				}
			}
			
			//var zTree = $.fn.zTree.init($(this), activeSetting, znodeses[$(this).attr("bind")]);
			var zTree = $.fn.zTree.init($(this), activeSetting,treeMultiSelectArray[curIndex].defaultOption.inputScopeData);
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

//						var node = zTree.getNodeByParam(key,token);
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
	var addElementID=function(target){
		if(target.id){ return target.id;}
		var idsubX="";
		if(treeMultiSelectArray[curIndex].defaultOption.varName==" ")
		{
			idsubX="param-hy"+curMullis;
		}else{
			idsubX="param-"+$.trim(treeMultiSelectArray[curIndex].defaultOption.varName).toLowerCase();
		}
		
		$(target).attr("id",idsubX);
		return idsubX;
	};
	
	var addAttritue=function($this)
	{			
		var varName="";
		if(treeMultiSelectArray[curIndex].defaultOption.varName.length==0){
			varName ="var_"+curMullis;
		}else{
			varName =$.trim(treeMultiSelectArray[curIndex].defaultOption.varName).toLowerCase();
		}
		
		if(!$($this).attr("var"))
		{
			$($this).attr("var",varName);
		}
		
		var varCap="";
		if(treeMultiSelectArray[curIndex].defaultOption.varCapName.length==0)
		{
			varCap="varCap_"+curMullis;
		}else{
			varCap=$.trim(treeMultiSelectArray[curIndex].defaultOption.varCapName).toLowerCase();
		}
		
		if(!$($this).attr("varcap"))
		{
			$($this).attr("varCap",varCap);
		}
		
	
		if(!$($this).attr("class")){
			if(treeMultiSelectArray[curIndex].defaultOption.pickerName == "treeselect"){
				$($this).addClass("paramInput treeSelect");//
			}else{
				$($this).addClass("paramInput multiSelect");
			}			
		}else{	
			var className=$($this).attr("class");
			if(treeMultiSelectArray[curIndex].defaultOption.pickerName == "treeselect"){
				if(className.indexOf("treeSelect")>0){
					$($this).addClass("paramInput");
				}else if(className.indexOf("paramInput")>0){
					$($this).addClass("treeSelect");
				}
			}else{
				if(className.indexOf("multiSelect")>0){
					$($this).addClass("paramInput");
				}else if(className.indexOf("paramInput")>0){
					$($this).addClass("multiSelect");
				}
			}	
		}	
		
		 var format=$.trim(treeMultiSelectArray[curIndex].defaultOption.dataFormat).toLowerCase();
		 if(!$($this).attr("format")){
			$($this).attr("format",format);
		 }
		 
		 var dependsVal="";		 
		 if(format.indexOf("$")>=0){		
			  dependsVal="param-"+format.substr(1);		
		 }
		 
		 if(!$($this).attr("depends")){
				$($this).attr("depends",dependsVal);
		 }
		 
		 if(!$($this).attr("dc")){
				$($this).attr("dc",treeMultiSelectArray[curIndex].defaultOption.disableCondition);
		 }
		 
		 if(treeMultiSelectArray[curIndex].defaultOption.inputOption=="必选"||
				treeMultiSelectArray[curIndex].defaultOption.inputOption=="必输"){
			if(!$($this).attr("inputO")){
				$($this).attr("inputO",1);
			}
		}  
		 
		return $this;
	};
	
	$.fn.treeMultiSelect = function(options)
	{		
		/* Verify an empty collection wasn't passed - Fixes #6976 */
		if ( !this.length ) {
			return this;
		}
			
		if($.isArray(options)&&options.length==2)
		{	
			if(curIndex==-1){
				return this;
			}
			
			if(options[1] == "getvar"){			
				return treeMultiSelectArray[curIndex].getvarTreeMultiSelect(options[0]);
			}else if(options[1] == "getvarCap"){
				return treeMultiSelectArray[curIndex].getvarCapTreeMultiSelect(options[0]);
			}
		}
		else if(typeof options == "string" )
		{			
			if(curIndex==-1){
				return this;
			}
			
			if(options=="getChildClass"){
				return treeMultiSelectArray[curIndex].getChildNodeClass(this);		
			}else if(options=="getChildID"){
				var selector =treeMultiSelectArray[curIndex].inputID;
				
				return selector;			
			} else{
				return this;
			}
		}else if(typeof options == "object"){		
			/* Initialise the date picker. */
			var treeMultiSelect= new TreeMultiSelect();		
			curIndex++;			
			$.extend(treeMultiSelect.defaultOption,options||{});
			/* Initialise the date picker. */
			curMullis=new Date().getMilliseconds();
			treeMultiSelectArray.push(treeMultiSelect);
		}else{
			return this;
		}
			
		nodeName=treeMultiSelectArray[curIndex].defaultOption.nodeName.toLowerCase();		
		if(nodeName=="span" ||nodeName=="div"){				
		}else{return this;}		
		
		var className="dropdown";	
		if(!$(this).attr("class")){	
			$(this).attr("class",className);
		}
		
		var elementID=nodeName+"_"+curMullis;
;		if(!this.id){	
			$(this).attr("id",elementID);
		}
		
		$(this).html("<input type='text' readonly='' capformat='null' value='' an='true' style=''></input>");						
		var selector= treeMultiSelectArray[curIndex].defaultOption.nodeName+"."+className+">input[type=text]";
		var inputID="";
		$(selector).each(function(){
			inputID=addElementID(this);
		});
		
		$(selector +"#"+inputID).each(function(){
			addAttritue(this);	
			return true;	
		});
		
		if(treeMultiSelectArray[curIndex].defaultOption.inputCtrlAttrs.length>0){
			$("#"+inputID).attr("style",treeMultiSelectArray[curIndex].defaultOption.inputCtrlAttrs);
		}
		
		treeMultiSelectArray[curIndex].inputID = inputID ;
		
		addDivElement(this,inputID);
		initMultiSelect(this,inputID);
		/*
		$(selector +"#"+inputID).each(function(){
			var disablecondition = $(this).attr("dc");			  
		    if(disablecondition!=undefined&&disablecondition!=""){
			   if(disablecondition.toLowerCase()=="true"){
				   $("#"+inputID).attr("disabled",true);
			   }
		    }	
			return true;	
		});
		*/
		
	    return $(this);     
	};
})(jQuery);

	