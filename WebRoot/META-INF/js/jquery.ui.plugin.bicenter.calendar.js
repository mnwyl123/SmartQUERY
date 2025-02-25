(function($,undefined ){	
	
	function CalendarPicker()
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
			defaultValDef:"",
			defaultVal:"",
			nodeName:""			
		};
	}
	
	$.extend(CalendarPicker.prototype,{
		 addDependsEvent:function($this){
			
		},
		getvar:function()
		{		
			return calendarPickerObj.selectedDate ;
		},
		
		getvarCap:function()
		{	
			return calendarPickerObj.selectedDateCap;
		},
		
		getChildNodeClass:function($this){
			var className=$($this).attr("class");
			return calendarPickerObj.defaultOption.nodeName+"."+className+">input[type=text]";
		},
		
		getChildNodeID:function($this){
			return "#"+calendarPickerObj.inputID;
		}
	}
	);
	var getYearMonth =function(curDate,year,month,set)
	{	
		var tmpVal="";
		if(curDate.length>=4&&curDate.length<=8){
			var tempyear=curDate.substr(0,4);
			if(tempyear>year){
				tmpVal =year+"-";
			}else{
				tmpVal=tempyear+"-";
			}
											
			var subStr=curDate.substr(4,2);
			switch(subStr.length)
			{
				case 0:{							
					tmpVal+="01";
					break;
				}
				case 1:
				case 2:
				{		
					var val=parseInt(subStr);
					if(val<=0){
						subStr ="0"+1;
			        }else if(val<10){
			        	subStr ="0"+val;
			        }else if(val>10){
			        	subStr =12;
			        }  
					
					tmpVal+=subStr;   
					break;
				}
			}
		}else{
			if(set=="start"){
				tmpVal ="1990-"+"0"+1;
			}else{
				tmpVal =year+"-"+month;
			}
			
		}

		return tmpVal ;
	};
	
	var addDataScope =function($this)
	{
		var start="";
		var end="" ;
		var len=0;
		if(calendarPickerObj.defaultOption.inputScopeData==""){
			len=0;
		}else{
			if(calendarPickerObj.defaultOption.inputScopeData.split(',').length==2){
				len=2;
			}else{
				len=1;
			}
		}
		var date = new Date(); 
		var year = date.getFullYear(); 
        var month = date.getMonth() + 1;   
        var day=date.getDate();
        if(day<10){
        	day="0"+day;
        }
        
        if(month<10){
        	month ="0"+month;
        }  
        
		switch(len){
			case 0:{
				 start ="1990-"+"0"+1;
				 end =(year)+"-"+month;
			     break;
			}	
			case 1:{					
				start =getYearMonth(calendarPickerObj.defaultOption.inputScopeData,month);
				pareseDepends(calendarPickerObj.defaultOption.inputScopeData,"start");
				end =(year)+"-"+month;				
				break;
			}
			case 2:{
				var inputScopeData=calendarPickerObj.defaultOption.inputScopeData.split(',');											
				start=pareseDepends($.trim(inputScopeData[0]),"start");
				start =getYearMonth(start,year,month,"start");
				end=pareseDepends($.trim(inputScopeData[1]),"end");
				end =getYearMonth(end,year,month,"end");			
				break;
			}
		}
		
		calendarPickerObj.start=start+"-%d";
		calendarPickerObj.end=end+"-%d";		
		return $this;
	};
	
	var pareseDepends=function(dependsVal,set){
		if(dependsVal.indexOf("|")>=0){		
			var array=dependsVal.split('|');
			var temp=array[1];
			 if(temp){
				 if(temp.indexOf("$")>=0){
					 dependsVal="Calendar-"+temp.substr(1);
				}else{
					dependsVal="Calendar-"+temp;
				}
				 
				calendarPickerObj.dependsVal=dependsVal+"*"+set;
			 }	
			 return $.trim(array[0]);
		}
		return $.trim(dependsVal);
	};
	
	var addElementID=function(target){
		if(target.id){ return target.id;}
		var idsubX="";
		if(calendarPickerObj.defaultOption.varName==" ")
		{
			idsubX="Calendar"+curMullis;
		}else{
			idsubX="Calendar-"+$.trim(calendarPickerObj.defaultOption.varName).toLowerCase();
		}
		
		$(target).attr("id",idsubX);	
		return idsubX;
	};
	
	var addAttritue=function($this)
	{			
		var varName="";
		if(calendarPickerObj.defaultOption.varName.length==0){
			varName ="day"+curMullis;
		}else{
			varName =$.trim(calendarPickerObj.defaultOption.varName).toLowerCase();
		}
		
		if(!$($this).attr("var"))
		{
			$($this).attr("var",varName);
		}
		
		var varCap="";
		if(calendarPickerObj.defaultOption.varCapName.length==0)
		{
			varCap="dayCap"+curMullis;
		}else{
			varCap=$.trim(calendarPickerObj.defaultOption.varCapName).toLowerCase();
		}
		
		if(!$($this).attr("varcap"))
		{
			$($this).attr("varCap",varCap);
		}
		
		if(!$($this).attr("class")){		
			$($this).addClass("Wdate");					
		}
		
		 var format=$.trim(calendarPickerObj.defaultOption.dataFormat).toLowerCase();
		 if(!$($this).attr("format")){
			$($this).attr("format",format);
		 }
		 
		 return $this;
	};
	
	var getDefaultVal =function()
	{	
		var defaultY="";
		var curY="";
		var defaultM="";
		var defaultD="";	
		var date = new Date(); 
	
		curY = date.getFullYear(); 
		defaultM = date.getMonth() + 1;   
		defaultD =date.getDate();	
		var len=calendarPickerObj.defaultOption.defaultValDef.length;
		var val=calendarPickerObj.defaultOption.defaultValDef;
		if(len==8||len==7)
		{
			defaultY=val.substr(0,4);
			defaultM=val.substr(4,2);
			//defaultD=val.substr(6);
		}else if(len==6||len==5){
			defaultY=val.substr(0,4);
			defaultM=val.substr(4);	
		}else if(len==4){
			defaultY=val.substr(0);
		}
		
		var startY=calendarPickerObj.start.substr(0,4);
		var endY=calendarPickerObj.end.substr(0,4);
		if(startY.indexOf("$")>=0){
			startY=curY;
		}
		if(endY.indexOf("$")>=0){
			endY=curY;
		}
			
		if(defaultY<startY){
			defaultY=startY;
		}else if(defaultY>=endY){
			defaultY=endY-1;
		}
		
		var startM=calendarPickerObj.start.substr(4,2);
		var endM=calendarPickerObj.end.substr(5,2);		
		if(defaultM<startM){
			defaultY=startM;
		}else if(defaultM>=endM){
			defaultM=endM-1;
		}
	
		calendarPickerObj.defaultValCap=defaultY+"年"+defaultM+"月"+defaultD+"日";
		
		if(parseInt(defaultM)<10){
			defaultM ="0"+parseInt(defaultM);
		}
		
		if(parseInt(defaultD)<10){
			defaultD ="0"+parseInt(defaultD);
		}
		
		calendarPickerObj.defaultVal=defaultY+defaultM+defaultD ;
	};
	
	$.fn.calendarPicker = function(options)
	{		
		if ( !this.length ) {
			return this;
		}
			
		if(typeof options == "object"){	
			/* Initialise the date picker. */
			if (calendarPickerObj.initialized==0) {
				calendarPickerObj.initialized++;
			}
		
			$.extend(calendarPickerObj.defaultOption,options||{});
			/* Initialise the date picker. */
			curMullis=new Date().getMilliseconds();
			
		}else if(typeof options == "string" ){				
			if(options=="getChildClass"){
				return calendarPickerObj.getChildNodeClass(this);;			
			}else if(options=="getChildID"){
				var selector =calendarPickerObj.inputID;
				return selector;			
			}else if(options == "getvar"){			
				return calendarPickerObj.getvar();
			}else if(options == "getvarCap"){
				return calendarPickerObj.getvarCap();
			}
			else{
				return this;
			}
		}
		else{
			return this;
		}
		
		calendarPickerObj.dependsVal="";
		nodeName=calendarPickerObj.defaultOption.nodeName.toLowerCase();		
		if(nodeName=="span" ||nodeName=="div"){				
		}else{return this;}		
	
		if(!$(this).attr("class")){
			var className="calendarPicker";		
			$(this).attr("class",className);
		}
		
		if(!this.id){	
			$(this).attr("id",(nodeName+"_"+curMullis));
		}
		
		addDataScope(this);	
		getDefaultVal();	
		
		calendarPickerObj.selectedDateCap=calendarPickerObj.defaultValCap;
		calendarPickerObj.selectedDate=calendarPickerObj.defaultVal;
		
		$(this).html("<input type='text' readonly='readonly' value='"+calendarPickerObj.defaultValCap+"  ' an='true'></input>");						
		var selector=calendarPickerObj.getChildNodeClass(this);
		var inputID="";
		$(selector).each(function(){
			inputID=addElementID(this);
			addAttritue(this);	
		});	
		
		calendarPickerObj.inputID = inputID ;		
		$("#"+inputID).css("width","120px");
		/*set default val */
		$("#"+inputID).attr("curdate",calendarPickerObj.selectedDate);
		$("#"+inputID).attr("curdatecap",calendarPickerObj.selectedDateCap);
		$("#"+inputID).attr("st",calendarPickerObj.start);
		$("#"+inputID).attr("end",calendarPickerObj.end);
		$("#"+inputID).attr("depends",calendarPickerObj.dependsVal);
		
		if(calendarPickerObj.dependsVal!=""){			
			$(this).after("<span style='color:red;'>*</span>");
		}
		setCalendar(inputID);
	    return $(this);     
	};
	var setCalendar=function(inputID){
		 
		$("#"+inputID).click(function(){
			var options={};
			options={
					dateFmt:"yyyy年M月d日",
					startDate:calendarPickerObj.defaultVal ,
					isShowWeek:false,					
					minDate:$.trim($("#"+inputID).attr("st")),
					maxDate:$.trim($("#"+inputID).attr("end")),
					onpicking:function(dp)
					{			
						if(dp.cal.getNewP('y')!=undefined){
							calendarPickerObj.selectedDateCap=dp.cal.getNewDateStr();
							calendarPickerObj.selectedDate=dp.cal.getNewP('y')+dp.cal.getNewP('M')+dp.cal.getNewP('d');						
						}else{
							calendarPickerObj.selectedDateCap=dp.cal.getDateStr();
							calendarPickerObj.selectedDate=dp.cal.getP('y')+dp.cal.getP('M')+dp.cal.getP('d');						
						}
						
						$("#"+inputID).attr("curdate",calendarPickerObj.selectedDate);
						$("#"+inputID).attr("curdatecap",calendarPickerObj.selectedDateCap);
						
						var type="";
						var date = new Date(); 
						var year = date.getFullYear(); 
				        var month = date.getMonth() + 1; 
						var dependsVal =$(this).attr("depends");
						if(dependsVal!=""){
							dependsVal =dependsVal.split('*');
							dependsId=dependsVal[0];
						    type=dependsVal[1];
						    var curDate= $(this).attr("curdate");	
							var curDateCap= $(this).attr("curdatecap");						
							var deppendsDate= $("#"+dependsId).attr("curdate");
						    if(type=="start"){						    	
									if(deppendsDate>curDate){
										$("#"+dependsId).val(curDateCap);	
										$("#"+dependsId).attr("curdate",curDate);
										$("#"+dependsId).attr("curdatecap",curDateCap);
									}
										
									//curDate =getYearMonth(curDate,year,month,"start");	
									//curDate=curDate+"-%d";				
									//$("#"+dependsId).attr("end",curDate);
									//setCalendar(dependsId);		
						    }else if(type=="end"){
									if(curDate>deppendsDate){
										$("#"+dependsId).val(curDateCap);	
										$("#"+dependsId).attr("curdate",curDate);
										$("#"+dependsId).attr("curdatecap",curDateCap);
									}
																										  			       									curDate =getYearMonth(curDate,year,month,"start");	
									//curDate=curDate+"-%d";			
									//$("#"+dependsId).attr("st",curDate);
									//setCalendar(dependsId);	
						    }
						  				
						}						
					}
				};
				WdatePicker(options);
				});
	};
	
    calendarPickerObj= new CalendarPicker(); // singleton instance
	calendarPickerObj.initialized = 0 ;
	calendarPickerObj.dependsVal="";
	var curMullis=0;
})(jQuery);
	