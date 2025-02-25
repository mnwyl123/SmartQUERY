function initDateSelect() {
	var onChange = function($changeCtrl) {
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
		if(dependVar) {
			var $dependDateCtrl = $(".DateSelect[var=" + dependVar.substr(1) + "]");
			var dateCode = getDateSelectValue($dependDateCtrl)[0];
			var maxDate = getDateSelectValue($dateCtrl)[0];
			if(dateCode > maxDate) {
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
	}
	
	var getOptionType = function($dateCtrl) {
		var type = $.trim($dateCtrl.attr("optionType"));
		if(type.indexOf("$")==0) {
			return $.trim($(".paramInput[var="+type.substr(1)+"]").val());
		} else {
			return type;
		}
	}
	
	var parseDependDateCtrl = function(str) {
		if(str.indexOf("|") >= 0) {
			return $.trim(str.split("|")[1]);
		}
		return null;
	}
	
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
	} 
	
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
	}
	
	var setDateSelectValue = function ($dateCtrl,dateCode) {
		var id = $dateCtrl.attr("id");
		var yearWrap = $("#" + id + " .year");
		var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
		var dWrap = $("#" + id + " .TenDay");
		switch($dateCtrl.attr("optionType").toLowerCase()){
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
	}

	
	
	$(".DateSelect").each(function(){
		initDataSelect($(this));
	}); 
	
	
	
	function initDataSelect($dateSelect) {
		var day = new Date(); 
        var defaultYear = day.getFullYear(); 
        var defaultSQM = day.getMonth() + 1; 
        var defaultTD = day.getDate(); 
        var optionType = $dateSelect.attr("optionType").toLowerCase(); 
        var magic = optionType.substr(optionType.length-1);
        if( $dateSelect.attr("defaultY")!=0 ){ 
            defaultYear = $dateSelect.attr("defaultY");        
            if(defaultYear < 0) {
            	var id = $dateSelect.attr("id");
            	var dayWraper = $("#" + id + " .TenDay"); 
                var mothWraper = $("#" + id + " .SemesterQuarterMonthWeek");
                mothWraper.css("visibility","hidden");
         	    dayWraper.css("visibility","hidden");//dayWraper.hide();
            }
        } 
        if( $dateSelect.attr("defaultM")!=0 ){ 
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

         
       var start = $dateSelect.attr("start").substr(0,4); 
       var end = $dateSelect.attr("end").substr(0,4); 
       var id = $dateSelect.attr("id"); 
       $("#" + id + " select").each(function(){ 
               //$(this).removeOption(/./); 
    	       if( $(this).hasClass("year") ){ 
                   if(!$(this).containsOption(defaultYear+"")){
	                   for(var y = start;y<= end; y++){ 
	                           $(this).addOption(y +"", y + "年",false); 
	                   } 
	                   $(this).selectOptions(defaultYear+""); 
                   }
               } else if ($(this).hasClass("SemesterQuarterMonthWeek")){ 
                   if(optionType == "y") {
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
                   else if(optionType.indexOf("m")>=0) { 
                	   $(this).removeOption(/./);
                           for(var m = 1;m<= 12; m++){ 
                                   $(this).addOption(m<10 ? "0" + m : "" + m , m + "月"); 
                           } 
 
                           $(this).selectOptions(defaultSQM);
                   } 
                   else if(optionType.indexOf("w")>=0) { 
                	   $(this).removeOption(/./);
                           for(var i=1;i<= 365 / 7 + 1;i++){ 
                                   $(this).addOption(i+"" , "第" + i + "周",false); 
                           } 
                           $(this).selectOptions(defaultSQM+"");
                   } 
                    
               } else if($(this).hasClass("TenDay")){ 
                   if(optionType == "y" || optionType == "ys" || optionType == "yq"
                   		|| optionType=="ym" || optionType=="yw") { 
                           $(this).hide(); 
                   } else { 
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
       }); 
	}
	
	$(".DateSelect .year").change(function(){ 
        var id = $(this).parent().attr("id"); 
        var dayWraper = $("#" + id + " .TenDay"); 
        var mothWraper = $("#" + id + " .SemesterQuarterMonthWeek");
        
       var year = $(this).selectedValues()[0]; 
       if(year == "") {
    	   /*
    	   mothWraper.removeOption(/./);
    	   mothWraper.addOption("","----"); 
    	   dayWraper.removeOption(/./);
    	   dayWraper.addOption("","----"); 
    	   */
    	   mothWraper.css("visibility","hidden");
    	   dayWraper.css("visibility","hidden");//dayWraper.hide();
       } else {
    	   mothWraper.css("visibility","visible");//mothWraper.show();
    	   dayWraper.css("visibility","visible");//dayWraper.show();
       }
       var optionType = $(this).parent().attr("optionType").toLowerCase(); 
        if(optionType.indexOf("ymd")>=0){ 
            var curDay = $("#" + id + " .TenDay").selectedValues()[0]; 
            var dayWraper = $("#" + id + " .TenDay"); 
            var mothWraper = $("#" + id + " .SemesterQuarterMonthWeek");
            var month = mothWraper.selectedValues()[0]; 
           var year = $(this).selectedValues()[0]; 
               
    	   if(mothWraper.containsOption("")) {
    		   /*
    		   mothWraper.removeOption(0);
    		   dayWraper.removeOption(0);
    		   initDataSelect($(this).parent());
    		   */
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
	
	$(".DateSelect .SemesterQuarterMonthWeek").change(function(){ 
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
	
	$(".DateSelect .TenDay").change(function(){ 
		onChange($(this));
	});
}

function getDateSelectValue($dateCtrl) {
	var id = $dateCtrl.attr("id");
	var yearWrap = $("#" + id + " .year");
	if(yearWrap.selectedValues()[0] == "") {
		return "";
	}
	var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
	var dWrap = $("#" + id + " .TenDay");
	switch($dateCtrl.attr("optionType").toLowerCase()){
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


function getDateCode(day,format) {
	switch(format){
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

function setDateSelectValueByDate($dateCtrl,day) {
	var id = $dateCtrl.attr("id");
	var yearWrap = $("#" + id + " .year");
	var mWrap = $("#" + id + " .SemesterQuarterMonthWeek");
	var dWrap = $("#" + id + " .TenDay");
	switch($dateCtrl.attr("optionType").toLowerCase()){
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
}