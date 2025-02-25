(function($,undefined ){	
	
	function DatepickerStruct()
	{
		this.defaultOption={
			monthNames: ["January","February","March","April","May","June",
					"July","August","September","October","November","December"], // Names of months for drop-down and formatting
			monthNamesShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], // For formatting
			dayNames: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"], // For formatting
			dayNamesShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], // For formatting	
			inputOption:"必选",
			dataType:"date",	
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
			callBackFunc:""				
		};
	}
	
	$.extend(DatepickerStruct.prototype,{
			addDependsEvent:function($this)
			{	
				$this.each(function(){
				    var dependeeId = $(this).attr("id");
					var dependsId = $(this).attr("depends");
					if(dependsId && dependsId != ""){										
						$("#" + dependsId).change(function(){
							$("#"+dependsId).selectOptions($("#" + dependsId).val()+"");
						    $("#" + dependeeId).attr("optionType", $("#" + dependsId).val());
						    $("#"+dependeeId).dateSelectPicker("changeDateSelect");
						});						
					}
				});	
			},
			
			getvarDatepicker:function($dateCtrl) 
			{
				var id = $dateCtrl.attr("id");
				var yearWrap = $("#" + id + " .year");
				if(yearWrap.selectedValues()[0] == "") {
					return "";
				}
				
				var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
				var dWrap = $("#" + id + " .TenDay");
				switch($dateCtrl.attr("optionType").toLowerCase())
				{
					case "ymd":
					case "ymt":
						return yearWrap.selectedValues()[0] + mWrap.selectedValues()[0] + dWrap.selectedValues()[0];						
					case "ym":
					case "ys":
					case "yq":
					case "yw": 
						return yearWrap.selectedValues()[0] + mWrap.selectedValues()[0];										
					case "y":
						return yearWrap.selectedValues()[0];	
				}
			},
			
			getvarCapDatepicker:function($dateCtrl) 
			{
				var id = $dateCtrl.attr("id");
				var yearWrap = $("#" + id + " .year");
				if(yearWrap.selectedValues()[0] == "") {
					return "";
				}
				
				var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
				var dWrap = $("#" + id + " .TenDay");
				switch($dateCtrl.attr("optionType").toLowerCase())
				{
					case "ymd":
					case "ymt":
						return yearWrap.selectedTexts()[0] + mWrap.selectedTexts()[0] + dWrap.selectedTexts()[0];						
					case "ym":
					case "ys":
					case "yq":
					case "yw": 
						return yearWrap.selectedTexts()[0] + mWrap.selectedTexts()[0] ;										
					case "y":
						return yearWrap.selectedTexts()[0];
				}
			},
			
			changeDateSelect :function($dateSelect)
			{
				var id = $dateSelect.attr("id").toLowerCase();		
		        var optionType = $dateSelect.attr("optionType").toLowerCase(); 	       
		        var defaultYear = $dateSelect.attr("defaultY"); 
		        var date = new Date(); 
		        var defaultSQM = date.getMonth() + 1; 
		        var defaultTD = date.getDate();          
		        var magic = optionType.substr(optionType.length-1);
		        if( $dateSelect.attr("defaultY")!=0){ 
		        	$("#"+id).html("<select class='year'></select>");
		        	if(datepickerObj.defaultOption.inputCtrlAttrs!=" "){
		        		$(".year").attr("style",datepickerObj.defaultOption.inputCtrlAttrs);
		        	}
		        } 
		        
		        if( $dateSelect.attr("defaultM")!=0 ){ 
		        	if($("#"+id+" select").hasClass("year") &&magic!="y"
		        		&&!$("#"+id+" select").hasClass("SemesterQuarterMonthWeek")){        	  
		        		$("#"+id+" .year").after("<select class='SemesterQuarterMonthWeek'></select>");	        	        	  	
		        	}
		        	
		        	if(datepickerObj.defaultOption.inputCtrlAttrs!=" "){
		        		$("#"+id +" .SemesterQuarterMonthWeek").attr("style",datepickerObj.defaultOption.inputCtrlAttrs);
		        	}
		        	
		        	if(magic == "t" || magic == "d" || magic == "m") {
		        		defaultSQM = $dateSelect.attr("defaultM"); 
		        		if(defaultSQM.length < 2) {
		        			defaultSQM = "0" + defaultSQM;
		        		}
		        	} else if(magic == "q") {
		        		var v = parseInt($dateSelect.attr("defaultM"));
		        		if(v <= 3) {
		        			defaultSQM = "1";
		        		} else if(v <= 6) {
		        			defaultSQM = "2";
		        		} else if(v <=9) {
		        			defaultSQM = "3";
		        		} else {
		        			defaultSQM = "4";
		        		}
		        	} else if(magic == "s") {
		        		var v = parseInt($dateSelect.attr("defaultM"));
		        		if(v>=6) {
		        			defaultSQM = "6";
		        		} else {
		        			defaultSQM = "5";
		        		}
		        	}
		        } 
		        
		        if( $dateSelect.attr("defaultD")!=0 ){
		        	if(magic=="d"||magic=="t"){
		        		if($("#"+id+" select").hasClass("SemesterQuarterMonthWeek")
		        			&&!$("#"+id+" select").hasClass("TenDay")){
			        		$("#"+id +" .SemesterQuarterMonthWeek").after("<select class='TenDay'></select>");	        		
			        	}
		        		
		        		if(datepickerObj.defaultOption.inputCtrlAttrs!=" "){
		            		$("#"+id +" .TenDay").attr("style",datepickerObj.defaultOption.inputCtrlAttrs);
		            	}
		        	}
		        	
		        	if(magic == "d") {
		        		defaultTD = $dateSelect.attr("defaultD");
		        		if(defaultTD.length < 2) {
		        			defaultTD = "0" + defaultTD;
		        		}
		        		
		        	} else if(magic == "t") {
		        		var v = parseInt($dateSelect.attr("defaultD"));
		        		if(v<=10) {
		        			defaultTD = "1";
		        		} else if(v<=20) {
		        			defaultTD = "2";
		        		} else {
		        			defaultTD = "3";
		        		}
		        	}
		        } 
		        /**product select options*/       
		        $("#" +id + " select").each(function(){ 
		               //$(this).removeOption(/./); 
		    	       if( $(this).hasClass("year"))
		    	       { 
		    	    	   var start = $dateSelect.attr("start").substr(0,4);     	   	    
		    		       var end = $dateSelect.attr("end").substr(0,4);	    		      
		    		       start =parseInt(start)
		    		       end =parseInt(end); 
		    		       if(start>end){
		    		    	   var temp=start;
		    		    	   start=end;
		    		    	   end =temp;
		    		       }   
		    		   
		                   if(!$(this).containsOption(defaultYear+"")){
			                   for(var y = start;y<= end;y++){ 
			                       $(this).addOption(y +"", y + "年",false); 
			                   }  		
			                   
			                   $(this).selectOptions(defaultYear+""); 		                                  
		                   }
		               }
		    	       else if ($(this).hasClass("SemesterQuarterMonthWeek"))
		    	       { 
		                   if(optionType =="y") {
		                   		$(this).hide();
		                   } else {
		                	   $(this).show();
		                   }
		                   
		               	   if(optionType.indexOf("s")>=0) { 
		               		  if(!$(this).containsOption(5 +"")){
		               			  $(this).removeOption(/./);
		               			  $(this).addOption(5 +"", "上半年",false); 
		               			  $(this).addOption(6 +"", "下半年",false); 
		               			  $(this).selectOptions(defaultSQM+"");
		               		  }
			               } 
		                   else if(optionType.indexOf("q")>=0) { 
		                	   $(this).removeOption(/./);
		                       $(this).addOption(1+"" , "1季度",false); 
		                       $(this).addOption(2+"" , "2季度",false); 
		                       $(this).addOption(3+"" , "3季度",false); 
		                       $(this).addOption(4+"" , "4季度",false); 
		                       $(this).selectOptions(defaultSQM+"");              
		                   } 
		                   else if(optionType.indexOf("m")>=0) 
		                   { 
							   $(this).removeOption(/./);		
							   	for(var m = 1;m<= 12; m++){ 
							   		$(this).addOption(m<10 ? "0" + m : "" + m , m + "月"); 
							   	} 
								
							   	$(this).selectOptions(defaultSQM+"");	                                                                     
		                   } 
		               	   /*
		                   else if(optionType.indexOf("w")>=0) { 
		                	   $(this).removeOption(/./);
		                           for(var i=1;i<= 365 / 7 + 1;i++){ 
		                                   $(this).addOption(i+"" , "第" + i + "周",false); 
		                           } 
		                           $(this).selectOptions(defaultSQM+"");
		                   }*/
			               		             
		               }
		    	       else if($(this).hasClass("TenDay"))
		    	       { 
		                   if(optionType == "y" || optionType == "ys" || optionType == "yq"
		                   		|| optionType=="ym" || optionType=="yw") { 
		                           $(this).hide(); 
		                   } 
		                   else 
		                   { 
		                	   $(this).show();
		                	   $(this).removeOption(/./);
		                       if(optionType.indexOf("t") >= 0 ) { 
		                           $(this).addOption(1+"" , "上旬",false); 
		                           $(this).addOption(2+"" , "中旬",false); 
		                           $(this).addOption(3+"" , "下旬",false); 
		                           $(this).selectOptions(defaultTD); 
		                       } else if(optionType.indexOf("d") >= 0){ 
		                           var month = $("#" + id + " .SemesterQuarterMonthWeek").selectedValues()[0]; 
		                           var year = $("#" + id + " .year").selectedValues()[0]; 
		                           var count = getMonthDays(year,month); 
		                               for(var i=1;i<=count;i++){ 
		                                       $(this).addOption(i<10 ? "0" + i : ""+i , i + "日",false); 
		                               } 
		                               $(this).selectOptions(defaultTD); 
		                       } 
		                               
		                   } 
		               }
		    	       
		    	       if(datepickerObj.defaultOption.inputOption=="可选"){
							$(this).addOption(" "," ");  
							$(this).selectOptions(" ");
					   }   
		       	}); 
		         		        	       
				$("#"+id+" .year").change(function(){ 
		           var id = $(this).parent().attr("id"); 
			       var optionType = $(this).parent().attr("optionType").toLowerCase(); 
			       if(optionType.indexOf("ymd")>=0)
			       { 
			            var curDay = $("#" + id + " .TenDay").selectedValues()[0]; 
			            var dayWraper = $("#" + id + " .TenDay"); 
			            var mothWraper = $("#" + id + " .SemesterQuarterMonthWeek");
			            var month = mothWraper.selectedValues()[0]; 
			            var year = $(this).selectedValues()[0]; 
			               
			    	   if(mothWraper.containsOption("")) {
			    		 
			    	   } else {
			               var count = getMonthDays(year,month); 
			                if(count == 31 && dayWraper.containsOption(31)){ 
			                       return; 
			               } 
			               if(count == 30 && dayWraper.containsOption(30) && !dayWraper.containsOption(30)){ 
			                       return; 
			               } 
			               
			               dayWraper.removeOption(/./); 
			               for(var i=1;i<=count;i++){ 
			            	   dayWraper.addOption(i<10 ? "0" + i : "" + i , i + "日"); //dayWraper.addOption(i , i + "日"); 
			               } 
			               
			               dayWraper.selectOptions(curDay + "");
			    	   }     
			        } 
			       	onChange($(this));   
		       }); 

				$("#"+id+" .SemesterQuarterMonthWeek").change(function(){ 
				        var id = $(this).parent().attr("id"); 
				        var optionType = $(this).parent().attr("optionType").toLowerCase(); 
				        if(optionType.indexOf("ymd")>=0){ 
				               var dayWraper = $("#" + id + " .TenDay"); 
				               var curDay = dayWraper.selectedValues()[0]; 
				                
				               var year = $("#" + id + " .year").selectedValues()[0]; 
				               var month = $(this).selectedValues()[0]; 
				               var count = getMonthDays(year,month); 
				               if(count == 31 && dayWraper.containsOption(31)){ 
				                       return; 
				               } 
				               if(count == 30 && dayWraper.containsOption(30) && !dayWraper.containsOption(30)){ 
				                       return; 
				               } 
				               dayWraper.removeOption(/./); 
				                   for(var i=1;i<=count;i++){ 
				                           dayWraper.addOption(i<10 ? "0" + i : "" + i , i + "日"); 
				                   } 
				                   
				                   dayWraper.selectOptions(curDay + ""); 
				        } 
				        
				       onChange($(this));
				}); 
				
				$("#"+id+" .TenDay").change(function(){ 
					onChange($(this)); 
				});
				
			   var disablecondition = $("#" +id).attr("dc");			  
			   if(disablecondition!=undefined&&disablecondition!=""){
				   disablecondition=disablecondition.toLowerCase();
				   if(disablecondition=="true"){
					   $("#" +id + " select").attr("disabled",true);
				   }
			   }
			   
			   /*if($.trim(datepickerObj.defaultOption.disableCondition).toLowerCase()=="true"){
		    	   $("#" +id + " select").attr("disabled",true);
		  	   }*/
			   
			},
			
			/* Format a date object into a string value.
			 * The format can be combinations of the following:
			 * d  - day of month (no leading zero)
			 * dd - day of month (two digit)
			 * o  - day of year (no leading zeros)
			 * oo - day of year (three digit)
			 * D  - day name short
			 * DD - day name long
			 * m  - month of year (no leading zero)
			 * mm - month of year (two digit)
			 * M  - month name short
			 * MM - month name long
			 * y  - year (two digit)
			 * yy - year (four digit)
			 * @ - Unix timestamp (ms since 01/01/1970)
			 * ! - Windows ticks (100ns since 01/01/0001)
			 * "..." - literal text
			 * '' - single quote
			 *
			 * @param  format string - the desired format of the date
			 * @param  date Date - the date value to format
			 * @param  settings Object - attributes include:
			 *					dayNamesShort	string[7] - abbreviated names of the days from Sunday (optional)
			 *					dayNames		string[7] - names of the days from Sunday (optional)
			 *					monthNamesShort string[12] - abbreviated names of the months (optional)
			 *					monthNames		string[12] - names of the months (optional)
			 * @return  string - the date in the above format
			 */
			formatDate: function (format, date, settings) {
				if (!date) {
					return "";
				}

				var iFormat,
					dayNamesShort = (settings ? settings.dayNamesShort : null) || this._defaults.dayNamesShort,
					dayNames = (settings ? settings.dayNames : null) || this._defaults.dayNames,
					monthNamesShort = (settings ? settings.monthNamesShort : null) || this._defaults.monthNamesShort,
					monthNames = (settings ? settings.monthNames : null) || this._defaults.monthNames,
					// Check whether a format character is doubled
					lookAhead = function(match) {
						var matches = (iFormat + 1 < format.length && format.charAt(iFormat + 1) === match);
						if (matches) {
							iFormat++;
						}
						return matches;
					},
					// Format a number, with leading zero if necessary
					formatNumber = function(match, value, len) {
						var num = "" + value;
						if (lookAhead(match)) {
							while (num.length < len) {
								num = "0" + num;
							}
						}
						return num;
					},
					// Format a name, short or long as requested
					formatName = function(match, value, shortNames, longNames) {
						return (lookAhead(match) ? longNames[value] : shortNames[value]);
					},
					output = "",
					literal = false;

				if (date) {
					for (iFormat = 0; iFormat < format.length; iFormat++) {
						if (literal) {
							if (format.charAt(iFormat) === "'" && !lookAhead("'")) {
								literal = false;
							} else {
								output += format.charAt(iFormat);
							}
						} else {
							switch (format.charAt(iFormat)) {
								case "d":
									output += formatNumber("d", date.getDate(), 2);
									break;
								case "D":
									output += formatName("D", date.getDay(), dayNamesShort, dayNames);
									break;
								case "o":
									output += formatNumber("o",
										Math.round((new Date(date.getFullYear(), date.getMonth(), date.getDate()).getTime() - new Date(date.getFullYear(), 0, 0).getTime()) / 86400000), 3);
									break;
								case "m":
									output += formatNumber("m", date.getMonth() + 1, 2);
									break;
								case "M":
									output += formatName("M", date.getMonth(), monthNamesShort, monthNames);
									break;
								case "y":
									output += (lookAhead("y") ? date.getFullYear() :
										(date.getYear() % 100 < 10 ? "0" : "") + date.getYear() % 100);
									break;
								case "@":
									output += date.getTime();
									break;
								case "!":
									output += date.getTime() * 10000 + this._ticksTo1970;
									break;
								case "'":
									if (lookAhead("'")) {
										output += "'";
									} else {
										literal = true;
									}
									break;
								default:
									output += format.charAt(iFormat);
							}
						}
					}
				}
				return output;
			}
		}
	);
		
	var onChange = function($changeCtrl)
	{
		var $dateCtrl = $changeCtrl.parent();
		var startStr = $dateCtrl.attr("start");
		var endStr = $dateCtrl.attr("end");
		var format = getOptionType($dateCtrl);
		var startCode = getDateCode(startStr,format);
		var endCode = getDateCode(endStr,format);
		var inputVal  = getDateSelectValue($dateCtrl)[0];
		if(endCode < inputVal) {
			setDateSelectValue($dateCtrl,endCode);
			
		} else if (startCode > inputVal){
			setDateSelectValue($dateCtrl,startCode);
		}
				
		var dependVar = parseDependDateCtrl(startStr);
		if(dependVar)
		{
			var $dependDateCtrl = $(".DateSelect[var=" + dependVar.substr(1) + "]");
			var dateCode = getDateSelectValue($dependDateCtrl)[0];
			var maxDate = getDateSelectValue($dateCtrl)[0];
			if(dateCode > maxDate) 
			{
				setDateSelectValue($dependDateCtrl,maxDate);
			}
		}
		
		dependVar = parseDependDateCtrl(endStr);
		if(dependVar) {
			var $dependDateCtrl = $(".DateSelect[var=" + dependVar.substr(1) + "]");
			var dateCode = getDateSelectValue($dependDateCtrl)[0];
			var minDate = getDateSelectValue($dateCtrl)[0];
			if(dateCode < minDate) {
				setDateSelectValue($dependDateCtrl,minDate);
			}
		}
	};
	
	var getOptionType = function($dateCtrl) {
		var type = $.trim($dateCtrl.attr("optionType"));
		if(type.indexOf("$")==0){ 
			return $.trim($(".paramInput[var="+type.substr(1)+"]").val());
		} else {
			return type;
		}
	};
	
	 var parseDependDateCtrl= function(str) {
		if(str.indexOf("|") >= 0) {
			return $.trim(str.split("|")[1]);
		}
		
		return null;
	};
	
	var getMonthDays = function(year,month){ 
       var bigMonths = [1,3,5,7,8,10,12];   
	   var count = 30; 
	   if( month == 2 ) { 
	           if( year % 400 == 0 || ( year % 4 == 0 && year % 100 != 0)){ 
	                   count = 29; 
	           } else { 
	                   count = 28; 
	           } 
	   } 
	   for(var i=0;i<bigMonths.length;i++){ 
	           if( month == bigMonths[i]){ 
	                   count = 31; 
	           } 
	   } 
	   return count; 
	};
	
	 var refreshDayOptions = function(year , month, dayWraper) {
		var count = getMonthDays(year,month); 
        if(count == 31 && dayWraper.containsOption(31)){ 
                return; 
        } 
        if(count == 30 && dayWraper.containsOption(30) && !dayWraper.containsOption(30)){ 
                return; 
        } 
        
        dayWraper.removeOption(/./); 
        for(var i=1;i<=count;i++){ 
                dayWraper.addOption(i<10 ? "0" + i : "" + i , i + "日"); 
        } 
	};
	
	var setDateSelectValue = function ($dateCtrl,dateCode) {
		var id = $dateCtrl.attr("id");
		var yearWrap = $("#" + id + " .year");
		var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
		var dWrap = $("#" + id + " .TenDay");
		switch($dateCtrl.attr("optionType").toLowerCase())
		{
			case "ymd":{
				yearWrap.selectOptions(dateCode.substr(0,4));
				mWrap.selectOptions(dateCode.substr(4,2));
				refreshDayOptions(yearWrap.val(),mWrap.val(),dWrap);
				dWrap.selectOptions(dateCode.substr(6,2));
				break;
			}
			case "ymt": {
				yearWrap.selectOptions(dateCode.substr(0,4));
				mWrap.selectOptions(dateCode.substr(4,2));
				dWrap.selectOptions(dateCode.substr(6,1));
				break;			
			}
			case "ym":

			case "yw": {
				yearWrap.selectOptions(dateCode.substr(0,4));
				mWrap.selectOptions(dateCode.substr(4,2));
				break;
			}
			case "ys":
			case "yq":{
				yearWrap.selectOptions(dateCode.substr(0,4));
				mWrap.selectOptions(dateCode.substr(4,1));
				break;
			}
			case "y":{
				yearWrap.selectOptions(dateCode.substr(0,4));
				break;
			}
		}
	};
	
	function getDateSelectValue($dateCtrl) 
	{
		var id = $dateCtrl.attr("id");
		var yearWrap = $("#" + id + " .year");
		if(yearWrap.selectedValues()[0] == "") {
			return "";
		}
		
		var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
		var dWrap = $("#" + id + " .TenDay");
		switch($dateCtrl.attr("optionType").toLowerCase())
		{
			case "ymd":
			case "ymt":{
				return[ yearWrap.selectedValues()[0] + mWrap.selectedValues()[0] + dWrap.selectedValues()[0],
				        yearWrap.selectedTexts()[0] + mWrap.selectedTexts()[0] + dWrap.selectedTexts()[0]];
				
			}
			case "ym":
			case "ys":
			case "yq":
			case "yw": {
				return [yearWrap.selectedValues()[0] + mWrap.selectedValues()[0] ,
				        yearWrap.selectedTexts()[0] + mWrap.selectedTexts()[0]] ;				
				
			}
			case "y":{
				return [yearWrap.selectedValues()[0],
				        yearWrap.selectedTexts()[0]];				
			}
		}
	}

	function getDateCode(day,format)
	{
		switch(format)
		{
			case "ymd":{
				return day.substr(0,8);
			} case "ymt":{
				var date = day.substr(6,2);
				if(date<'10') {
					return day.substr(0,6)+"1";
				} else if(date < '20') {
					return day.substr(0,6) + "2";
				} else {
					return day.substr(0,6) + "3";
				}			
			}
			case "ym":{
				return day.substr(0,6);
			}
			case "ys": {
				var m=day.substr(4,2);
				if(m<"06") {
					return day.substr(0,4) + "5";
				} else {
					return day.substr(0,4) + "6";
				}
			}
			case "yq": {
				var m=day.substr(4,2);
				if(m<"03") {
					return day.substr(0,4) + "1";
				} else if(m<"06") {
					return day.substr(0,4) + "2";
				} else if(m<"09") {
					return day.substr(0,4) + "3";
				} else {
					return day.substr(0,4) + "4";
				}
			}
			case "yw": {
				
			}
			case "y":{
				return day.substr(0,4);
			}
		}
	}

	function setDateSelectValueByDate($dateCtrl,day) 
	{
		var id = $dateCtrl.attr("id");
		var yearWrap = $("#" + id + " .year");
		var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
		var dWrap = $("#" + id + " .TenDay");
		switch($dateCtrl.attr("optionType").toLowerCase())
		{
			case "ymd":{
				yearWrap.selectOptions(day.getFullYear());
				mWrap.selectOptions(day.getMonth());
				dWrap.selectOptions(day.getDate());
				break;
			} case "ymt":{
				yearWrap.selectOptions(day.getFullYear());
				mWrap.selectOptions(day.getMonth());
				break;
			}
			case "ym":{
				yearWrap.selectOptions(day.getFullYear());
				mWrap.selectOptions(day.getMonth());
				break;
			}
			case "ys": {
				yearWrap.selectOptions(day.getFullYear());
				break;
			}
			case "yq": {
				yearWrap.selectOptions(day.getFullYear());
				break;
			}
			case "yw": {
				yearWrap.selectOptions(day.getFullYear());			
				break;
			}
			case "y":{
				yearWrap.selectOptions(day.getFullYear());
				break;
			}
		}
	};	
	/*
	var addDependsEventBak=function($this)
	{	
		$this.each(function(){
		    var dependeeId = $(this).attr("id");
			var dependsId = $(this).attr("depends");
			if(dependsId && dependsId != ""){
				var formatStr=$.trim(datepickerObj.defaultOption.dataFormat).toLowerCase();
				if(formatStr.indexOf("$")>=0) {				
					$("#" + dependsId).change(function(){
						$("#"+dependsId).selectOptions($("#" + dependsId).val()+"");
					    $("#" + dependeeId).attr("optionType", $("#" + dependsId).val());
					    $("#"+dependeeId).dateSelectPicker("changeDateSelect");
					});
				}
			}
		});	
	};
	*/
	var exchangeOptionType=function($this)
	{
		var dependsId="";
		var optionType=$.trim(datepickerObj.defaultOption.dataFormat).toLowerCase();	
		var type =optionType;
		if(optionType==""||optionType.length<=0){
			type ="ymd";
		}
		else if(optionType.indexOf("$")>=0)
		{
			  var temp=optionType.split('.')[1];	
			  temp=temp.substr(0,temp.length-1);
			  dependsId="param-"+temp;
			  if(!$($this).attr("depends")){
				 $($this).attr("depends",dependsId);
			  }
			  if(dependsId && dependsId != ""){
					type=$("#" + dependsId).val();
					if(type==undefined){
						type="ym";
					}
			  }else{
				  dependsId ="";
				  type ="ymd";
			  }
		}
		else
		{	
			if(optionType.indexOf("y")>=0){
				type="y";
				if(optionType.indexOf("m")>0)
				{
					type+="m";
					if(optionType.indexOf("d")>0){
						type+="d";
					}else if(optionType.indexOf("t")>0){
						type+="t";
					}
					else{
						var endStr=optionType.substr(optionType.length-1);
						var intVal=parseInt(endStr);
						if(intVal>=0){
							type+="t";
						}
					}
				}else if(optionType.indexOf("s")>0){
					type+="s";
				}else if(optionType.indexOf("q")>0){
					type+="q";
				}
				else 
				{
					var endStr=optionType.subStr(optionType.length-1);
					var intVal=parseInt(endStr);
					if(intVal>=1&&intVal<=4){
						type+="q";
					}else if(intVal>=5){
						type+="s";
					}
				}
			}else{
				type ="ymd";	
			}
		}
		
		if(!$($this).attr("optiontype"))
		{
			$($this).attr("optiontype",type);
		}	
		
		return $this;
	};
	
	var addElementID=function(target){
		if(target.id){ return true;}
		var idsubX="";
		var varName=$(target).attr("var");
		if(varName&&varName.length>0){
			idsubX="param-"+$.trim(varName).toLowerCase();
		}else{
			idsubX=""+datepickerObj.iDCount;
		}
		
		$(target).attr("id",idsubX);	
		
		return true;
	};
	
	var addDataScope =function($this)
	{
		var start="";
		var end="" ;
		var len=0;
		if(datepickerObj.defaultOption.inputScopeData==""){
			len=0;
		}else{
			if(datepickerObj.defaultOption.inputScopeData.split(',').length==2){
				len=2;
			}else{
				len=1;
			}
		}
		var date = new Date(); 
		var year = date.getFullYear(); 
        var month = date.getMonth() + 1;   
        if(month<10){
        	month ="0"+month;
        }  
        
		switch(len){
			case 0:{
				 start ="1990"+"0"+1;
			     end =(year)+month;
			     break;
			}	
			case 1:{
				var curDate=datepickerObj.defaultOption.inputScopeData;
				if(curDate.length>=4){
					var tempyear=curDate.substr(0,4);
					if(tempyear>=date.getFullYear()){
					    end =(year)+month;
					    start ="1990"+"0"+1;
					}else{
						start=curDate;
						end =(year)+month;
					}
				}else{
					 start ="1990"+"0"+1;
				     end =(year)+month;
				}
				break;
			}
			case 2:{
				var inputScopeData=datepickerObj.defaultOption.inputScopeData.split(',');	
				if(inputScopeData.length==2){
					start =$.trim(inputScopeData[0]);
					end =$.trim(inputScopeData[1]);
					var startVal=parseInt(start);
					if(isNaN(startVal)){
						 start ="1990"+"0"+1;
					}
					
					if(isNaN(parseInt(end))){
						 end =(year)+month;
					}
				}else{
					 start ="1990"+"0"+1;
				     end =(year)+month;
				}
				break;
			}
			
			default:
				break;
		}

		if(!$($this).attr("start"))
		{
			$($this).attr("start",start);
		}
		
		if(!$($this).attr("end"))
		{
			$($this).attr("end",end);
		}	
		
		return $this;
	};
	
	var addAttritue=function($this)
	{				
		var varName="";
		if(datepickerObj.defaultOption.varName.length==0){
			varName ="var_"+datepickerObj.iDCount;
		}else{
			varName =$.trim(datepickerObj.defaultOption.varName).toLowerCase();
		}
		
		if(!$($this).attr("var"))
		{
			$($this).attr("var",varName);
		}
		
		var varCap="";
		if(datepickerObj.defaultOption.varCapName.length==0)
		{
			varCap="varCap"+datepickerObj.iDCount;
		}else{
			varCap=$.trim(datepickerObj.defaultOption.varCapName).toLowerCase();
		}
		
		if(!$($this).attr("varcap"))
		{
			$($this).attr("varCap",varCap);
		}
			
		if(!$($this).attr("class")){
			$($this).addClass("DateSelect paramInput");
		}else{			
			var className=$($this).attr("class");
			if(className.indexOf("DateSelect")>0&&className.indexOf("paramInput")<0){
				$($this).addClass("paramInput");
			}else if(className.indexOf("paramInput")>0&&className.indexOf("DateSelect")<0){
				$($this).addClass("DateSelect");
			}
		}
		
		var defaultY="";
		var defaultM="";
		var defaultD="";	
		var date = new Date(); 
		defaultY = date.getFullYear(); 
		defaultM = date.getMonth() + 1;   
		defaultD =date.getDate();
		
		if(datepickerObj.defaultOption.defaultVal.length==8)
		{
			defaultY=datepickerObj.defaultOption.defaultVal.substr(0,4);
			defaultM=datepickerObj.defaultOption.defaultVal.substr(4,2);
			defaultD=datepickerObj.defaultOption.defaultVal.substr(6);
		}else if(datepickerObj.defaultOption.defaultVal.length==6){
			defaultY=datepickerObj.defaultOption.defaultVal.substr(0,4);
			defaultM=datepickerObj.defaultOption.defaultVal.substr(4);	
		}else if(datepickerObj.defaultOption.defaultVal.length==4){
			defaultY=datepickerObj.defaultOption.defaultVal.substr(0);
		}
	
		if(!$($this).attr("defaultY")&&defaultY!="")
		{
			$($this).attr("defaultY",defaultY);
		}

		if(!$($this).attr("defaultM")&&defaultM!="")
		{
			$($this).attr("defaultM",defaultM);
		}
		
		if(!$($this).attr("defaultD")&&defaultD!="")
		{
			$($this).attr("defaultD",defaultD);
		}
		
		if(!$($this).attr("dc")){
			$($this).attr("dc",datepickerObj.defaultOption.disableCondition);
		}
		
		if(datepickerObj.defaultOption.inputOption=="必选"||
				datepickerObj.defaultOption.inputOption=="必输"){
			if(!$($this).attr("inputO")){
				$($this).attr("inputO",1);
			}
		}   
		return $this;
	};
	
	getSelect=function($this){
		var selector="";
		$this.each(function(){
			var nodeName=this.nodeName.toLowerCase();		
			if(nodeName=="span"||nodeName=="div"){}
			else{return this;}					
			var parentID=$(this).parent().attr("id"); 
			selector="#"+parentID+" "+nodeName;
			return true;
		});
		
		return selector;
	};
	$.fn.dateSelectPicker = function(options)
	{		
		/* Verify an empty collection wasn't passed - Fixes #6976 */
		if ( !this.length ) {
			return this;
		}
		
		/* Initialise the date picker. */
		if (!datepickerObj.initialized) {
			datepickerObj.initialized = true;
		}
		//formatDate
		if(typeof options == "string" )
		{
			if(options == "getvar"){
				return datepickerObj.getvarDatepicker(this);
			}else if(options == "getvarCap"){
				return datepickerObj.getvarCapDatepicker(this);
			}
			else if(options =="changeDateSelect"){
				return datepickerObj.changeDateSelect($(this));
			}else if(options=="addEvent"){
				var selector=getSelect($(this));			
				return datepickerObj.addDependsEvent($(selector));
			} else{
				return this;
			}
		}else if(typeof options == "Array" ){
			if(options[0]== "formatDate")
			{
				return datepickerObj.formatDate(options[0],options[1],options[2]);
			}
			else if(options[0]== "parseDate")
			{
				return datepickerObj.getDateDatepicker(this);
			}
		}else{
			datepickerObj.iDCount++;
			if(options!=undefined){
				datepickerObj.defaultOption={};
				$.extend(datepickerObj.defaultOption,options||{});
			}		
		}
				
		var selector=getSelect($(this));
		$(selector).each(function()
		{ 			
			exchangeOptionType(this);
		    addDataScope(this);
		    addAttritue(this);	
		    addElementID(this);				
			datepickerObj.changeDateSelect($(this));
			//addDependsEventBak($(this));
		});
		
		var callBack=datepickerObj.defaultOption.callBackFunc;
		if (callBack!="")
		{		
			callBack.apply(datepickerObj.defaultOption,[datepickerObj.defaultOption.dataType]);
		}
		 
		if(datepickerObj.defaultOption.inputOption=="可选"){
			datepickerObj.defaultOption.inputOption="必选";
		}   
		
		return $(this);
	};
	
	datepickerObj = new DatepickerStruct(); // singleton instance
	datepickerObj.initialized = false;
	datepickerObj.iDCount =0;
})(jQuery);

	