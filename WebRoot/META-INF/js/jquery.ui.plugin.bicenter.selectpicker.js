(function($,undefined ){	
	function Selectpicker()
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
			defaultValDef:"",
			defaultVal:"",	
			inputCtrlAttrs:""
		};
	}

	$.extend(Selectpicker.prototype,{
		 addDependsEvent:function($this){
			$this.each(function(){
			    var dependeeId = $(this).attr("id");
				var dependsId = $(this).attr("depends");
				if(dependsId && dependsId != ""){				
					$("#" + dependsId).change(function(){								
							var selectVal=$(this).selectedValues()[0];
							var val =$(this).val();
							switch(selectVal){
							case "1.00":
								$("#"+dependeeId).val("0");	
								break;
							case "0.1":
								$("#"+dependeeId).val("1");
								break;
							case "0.01":
								$("#"+dependeeId).val("2");
								break;
							case "0.001":
								$("#"+dependeeId).val("3");
								break;
							case "0.0001":
								$("#"+dependeeId).val("4");
								break;
							case "0.00001":
								$("#"+dependeeId).val("5");
								break;
							case "0.000001":
								$("#"+dependeeId).val("6");
								break;
							case "0.0000001":
								$("#"+dependeeId).val("7");
								break;
							case "0.00000001":
								$("#"+dependeeId).val("8");
								break;
							}						
							//return false;
						});
				}
				return true;
			});
		},
		getvarSelectPicker :function($this){
	   		var selectVal= $($this).selectedValues()[0] ? $($this).selectedValues()[0] : '';
	   		return selectVal;
		},
		
		getvarCapSelectPicker:function($this){
			var varCap = $.trim($($this).attr("varCap"));
   			if(varCap != null && $.trim(varCap)!="") {
   				return $($this).selectedTexts()[0] ? $($this).selectedTexts()[0].replace(/\u00a0+/,"") : '';
   			}else{
   				return "";
   			}	 
		}
	});
	
	$.fn.selectPicker = function(options)
	{		
		if ( !this.length ) {
			return this;
		}	
		/* Initialise the date picker. */
		if (!selectpickerObj.initialized) {
			selectpickerObj.initialized = true;
		}
		
		if(typeof options == "string" )
		{
			if(options == "getvar"){			
				return selectpickerObj.getvarSelectPicker(this);
			}else if(options == "getvarCap"){
				return selectpickerObj.getvarCapSelectPicker(this);
			}else if(options=="addEvent"){
				return selectpickerObj.addDependsEvent($(this));
			} 
			else if(options){
				
			} else{
				return this;
			}
		}else if(typeof options=="object" ){
			selectpickerObj.defaultOption={};
			$.extend(selectpickerObj.defaultOption,options||{});
		}else{
			return false ;
		}
			
		this.each(function()
		{ 		
			var nodeName=this.nodeName.toLowerCase();		
			if(nodeName=="select"){				
			}else{return this;}				
			addAttritue(this);
			addElementID(this);			
			if(selectpickerObj.defaultOption.inputScopeData.constructor!=Array)
			{	
				return this;
			}	
			
			var $dateSelect =$(this);   
			var id = $dateSelect.attr("id").toLowerCase();	
			var len=selectpickerObj.defaultOption.inputScopeData.length;
			for(var i=0;i<len;++i)
			{
				var tempObj=selectpickerObj.defaultOption.inputScopeData[i];
			    if(tempObj.caption==selectpickerObj.defaultOption.defaultVal)
			    {
			    	 $(this).addOption(tempObj.value +"", tempObj.caption,true); 
			    }else{
			    	 $(this).addOption(tempObj.value +"", tempObj.caption,false); 
			    }	   	
			}
			
			var defaultVal=$dateSelect.attr("default").toLowerCase();	
			$(this).selectOptions(defaultVal+""); 
			
			if(selectpickerObj.defaultOption.inputCtrlAttrs!=""){
				$("#"+id).attr("style",selectpickerObj.defaultOption.inputCtrlAttrs);	
	    	}
			
			var paramVal=$.trim(selectpickerObj.defaultOption.disableCondition).toLowerCase();
			if(paramVal.length>0){
				 $("#" +id + " select").attr("disabled",true);
      	    }
			
			if(selectpickerObj.defaultOption.inputOption=="可选"){
				$(this).addOption(" "," ");  
				$(this).selectOptions(" ");
		   }
			
			var disablecondition = $(this).attr("dc");			  
		    if(disablecondition!=undefined&&disablecondition!=""){
			   if(disablecondition.toLowerCase()=="true"){
				   $(this).attr("disabled",true);
			   }
		    }	
		});
		
	    return $(this);     
	};
	var addElementID=function(target){
		if(target.id){ return true;}
		var idsubX="";
		var varName=$(target).attr("var");
		if(varName&&varName.length>0){
			idsubX="param-"+$.trim(varName).toLowerCase();
		}else{
			idsubX="param-"+selectpickerObj.uuid;
		}
		
		$(target).attr("id",idsubX);	
		return true;
	};
	
	var addAttritue=function($this)
	{			
		var varName="";
		if(selectpickerObj.defaultOption.varName.length==0){
			varName ="var_"+selectpickerObj.uuid;
		}else{
			varName =$.trim(selectpickerObj.defaultOption.varName).toLowerCase();
		}
		
		if(!$($this).attr("var")){
			$($this).attr("var",varName);
		}
		
		var varCap="";
		if(selectpickerObj.defaultOption.varCapName.length==0)
		{
			varCap="varCap_"+selectpickerObj.uuid;
		}else{
			varCap=$.trim(selectpickerObj.defaultOption.varCapName).toLowerCase();
		}
		
		if(!$($this).attr("varcap"))
		{
			$($this).attr("varCap",varCap);
		}
			
		if(!$($this).attr("class")){
			$($this).addClass("paramInput");
		}
		
		var defaultVal="";	
		defaultVal=$.trim(selectpickerObj.defaultOption.defaultVal);
		if(defaultVal==null||defaultVal==""||defaultVal=="null"){
			defaultVal =selectpickerObj.defaultOption.defaultValDef;
		}
		
		if(!$($this).attr("default"))
		{
			$($this).attr("default",defaultVal);
		}
		
		 var format=$.trim(selectpickerObj.defaultOption.dataFormat).toLowerCase();
		 if(!$($this).attr("format")){
			$($this).attr("format",format);
		 }
		 
		 var dependsVal="";		 
		 if(format.indexOf("$")>=0){		
			  dependsVal=format;	
		 }else if(defaultVal.indexOf("$")>=0){
			 dependsVal=defaultVal;			
		 }
		 
		if(dependsVal!=""){
			 var temp=dependsVal.split('.')[1];	
			 if(temp==undefined){
				 dependsVal="param-"+dependsVal.substr(1);
			 }else{
				 temp=temp.substr(0,temp.length-1);
				 dependsVal="param-"+temp;	
			 }				 
		}
		
		if(!$($this).attr("depends")){
			$($this).attr("depends",dependsVal);
		}
		
		if(!$($this).attr("dc")){
			$($this).attr("dc",selectpickerObj.defaultOption.disableCondition);
		}
		return $this;
	};
	
	selectpickerObj = new Selectpicker(); // singleton instance
	selectpickerObj.initialized = false;
	var date = new Date(); 
	selectpickerObj.uuid = date.getTime();
})(jQuery);

	