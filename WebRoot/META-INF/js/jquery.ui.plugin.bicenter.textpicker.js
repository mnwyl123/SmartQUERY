(function($,undefined ){	
	function TextPicker()
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
			inputCtrlAttrs:"",
			name:""
		};
	}
	$.extend(TextPicker.prototype,{
		getvarTextPicker :function($this){
	   		var selectVal= $($this).val();
	   		
	   		/*if(selectVal==""&&$($this).attr("inputo")==1){
	   			alert(curText+":必须有输入值!");
	   		}*/
	   		
	   		return selectVal;
		}		
	});
	
	$.fn.textPicker = function(options)
	{		
		/* Initialise the date picker. */
		if (!textpickerObj.initialized) {
			textpickerObj.initialized = true;
		}
		
		if(typeof options == "string" )
		{
			if(options == "getvar"){			
				return textpickerObj.getvarTextPicker(this);
			}else if(options=="getChildID"){
				return textpickerObj.id;
			} else{
				return this;
			}
		}else if(typeof options=="object" ){
			textpickerObj.defaultOption={};
			$.extend(textpickerObj.defaultOption,options||{});
		}else{
			return false ;
		}	
		addElementID(this);		
	    return $(this);     
	};
	var addElementID=function(target){
		
		var idsubX="";
		var varName="";
		if(textpickerObj.defaultOption.varName.length==0){
			varName ="var_"+textpickerObj.uuid;
		}else{
			varName =$.trim(textpickerObj.defaultOption.varName).toLowerCase();
		}
		
		if(varName&&varName.length>0){
			idsubX="param-"+$.trim(varName).toLowerCase();
		}else{
			idsubX="param-"+textpickerObj.uuid;
		}
		
		var elementStr="<input id='"+idsubX+"' type='text'></input>";
		$(target).html(elementStr);
		$("#"+idsubX).attr("var",varName);
		defaultVal=$.trim(textpickerObj.defaultOption.defaultVal);
		if(defaultVal!=""){
			$("#"+idsubX).val(defaultVal);
		}
		var an=0;
		if(textpickerObj.defaultOption.inputOption=="必输"||
			textpickerObj.defaultOption.inputOption=="必选"){
			an=1;
			$("#"+idsubX).after("<span style='color:red;'>*</span>");
		}
		$("#"+idsubX).attr("inputo",an);
		
		var dc =textpickerObj.defaultOption.disableCondition;
		if(dc!=""&&$.trim(dc).toLowerCase()=="true"){
			$("#"+idsubX).attr("disabled",true);
		}
		
		if($.trim(textpickerObj.defaultOption.inputCtrlAttrs)!=""){
			$("#"+idsubX).attr("style",textpickerObj.defaultOption.inputCtrlAttrs);
		}
		
		textpickerObj.id=idsubX;
		return true;
	};
	
	textpickerObj = new TextPicker(); // singleton instance
	textpickerObj.initialized = false;
	textpickerObj.id="";
	var date = new Date(); 
	textpickerObj.uuid = date.getTime();
})(jQuery);

	