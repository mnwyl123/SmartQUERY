var lastRefreshTime = 0;
var refreshTimeInterval = 3;	//刷新时间间隔,单位：秒

function onCommander(id) {
	switch(id) {
	case 'refreshReportBtn':
		if( !validateInputs() ) {
			return;
		}
		if(new Date().getTime()-lastRefreshTime < refreshTimeInterval*1000)
	   		return;
	   	lastRefreshTime = new Date().getTime();
		if( confirm("刷新操作将清除报表缓存，重新查询数据库，这可能会给数据库服务器带来不必要的负荷，继续么？") ){
			collectParams(params);
			doRefreshReport();
		}
		break;
	case 'enlargeFont':
	case 'shrinkFont':
		var size = $("table.regularTable").css("font-size");
		var org = parseInt(size);
		var diff = org * 0.1 ;
		if(diff < 1) {
			diff = 1;
		}
		if(id == "enlargeFont") {		 			
			$("table.regularTable").css("font-size",org + diff + "px");			
		} else if(id == "shrinkFont") {
			if(org - diff < 10) {
				return;
			}
			$("table.regularTable").css("font-size",org - diff + "px");
		}
		
		if(window.fixGridHeader) {
			deFixTable("gridTable");
			fixTable("gridTable",window.fixGridHeader.row,window.fixGridHeader.col);
			/*
			var TableID = "gridTable";
			var $container = $(window).height() > 100 ? $(window) : $("body");	
			var keepWidth = 40;	//表格右边的预留宽度
			var width = $('#'+TableID).width() ;
			var height = $('#'+TableID).outerHeight();
				
			var gridLeftWidth = $('#'+TableID).offset().left;
			var gridTopHeight = $('#'+TableID).offset().top;
			//计算底部的高度，并预留出来
			var bottomHeight = $('#centerPan table').outerHeight() + $('#centerPan table').offset().top
								- (height + gridTopHeight);
			
			if(bottomHeight > 0){
				if(bottomHeight > keepHeight || bottomHeight > 40)		
					keepHeight += 40;
				else
					keepHeight += bottomHeight;
				if(bottomHeight > keepHeight && (width + gridLeftWidth + keepWidth > $container.width()))
					keepWidth = 80;
			}
			
			if(width + gridLeftWidth + keepWidth > $container.width()){
				width = $container.width() - gridLeftWidth - keepWidth;	
			}
	
			if($('#'+TableID).width() > width){
			    $("#"+TableID+"_tableData").css("overflow-x","scroll");
			}else{
			 	$("#"+TableID+"_tableData").css("overflow-x","hidden");
			}
			*/
		}
		break;
	
	case 'exportPdfBtn':
		//exportFile('pdf');
//		if($("#downloading").size() <= 0) {
//			$("body").append("<div id='downloading'></div>");
//			$("#downloading").click(function(){
//				showCommentsPan(true);	
//			});
//		} else {
//			$("#downloading").removeClass("hide");			
//			$("#downloading").slideDown('slow');
//		}
		params.op = "view";
		downloadStart("pdf");
		downloadMoni(false);
		break;
		
	case 'exportExcellBtn':
		//exportFile('xls');
		params.op = "view";
		downloadStart("xls");
		break;
	case 'downloadPdf':
		fetchFile('pdf');
		showCommentsPan(false);
		break;
	case 'downloadXls':
		fetchFile('xls');
		showCommentsPan(false);
		break;
	case 'redownloadPdf':
	case 'redownloadXls':
		downloadMoni(true);
		showCommentsPan(false);
		break;
	case 'cancelPdf':
		cancelDownload(id,"pdf");
		break; 
	case 'cancelXls':
		cancelDownload(id,"xls");
		break;
	case 'printBtn':
		print();
		break;
	}
}

function cancelDownload(id,type){
	var $download = $("#"+id).parents(".download");
	if($download.hasClass("error")){
		var exportType = type;
		var newParams = $.extend({}, params,{exportType:exportType,cancel:true});
		ajaxCall(newParams,function(data){
			//needn't consern
		},true);
	}
	$("#downloading").addClass("hide");
	showCommentsPan(false);
}

function downloadStart(exportType){
	if($("#downloading").size() <= 0) {
		$("body").append("<div id='downloading' exportType='"+exportType+"' ></div>");
		$("#downloading").click(function(){
			resetCommentPan();
			showCommentsPan(true);	
		});
	} else {
		$("#downloading").attr("exportType",exportType);
		$("#downloading").removeClass("hide");			
		$("#downloading").slideDown('slow');
	}
}

function downloadMoni(reload){
	var $downloading = $("#downloading");
	if(!reload && ($downloading.size() <= 0 || $downloading.hasClass("hide"))){
		return;
	}
	var exportType = $downloading.attr("exportType");
	var uuid = $("#regularReportViewer").attr("uuid");
	var newParams = $.extend({}, params,{exportType:exportType,redownload:reload,uuid:uuid});
	ajaxCall(newParams,function(data){
		if(reload){
			$downloading.removeClass("hide");	
		}
		if($downloading.hasClass("hide")){
			return; //avoid download twice
		}
		var $msgBox = null , $download=null;
		if(exportType == "pdf"){
			$("#commentsPan").removeClass("xls").addClass(exportType);
			$msgBox = $("#commentsPan .download.pdf .detail");
			$download = $("#commentsPan .download.pdf");
		} else {
			$("#commentsPan").removeClass("pdf").addClass(exportType);
			$msgBox = $("#commentsPan .download.xls .detail");
			$download = $("#commentsPan .download.xls");
		}
		switch(data.HeadInfo.Message){
			case "done": {
				//$("#commentsPan").addClass(exportType);
				$msgBox.html(data.DataInfo.msg);
				$download.removeClass("info").removeClass("error");
				showCommentsPan(true);//fetchFile('pdf');			
				$downloading.addClass("hide");					
			}
			break;
			case "error": {
				//$("#commentsPan").addClass(exportType);
				$msgBox.html(data.DataInfo.msg);
				$download.addClass("error");
				showCommentsPan(true);
				$downloading.addClass("hide");										
			}
			break;
			case "running":{
				//$("#commentsPan").addClass(exportType);
				$msgBox.html(data.DataInfo.msg);
				$download.addClass("info");
			}
			break;
		} 
		
		//window.lastQueryDownloadTime = timeTiker;
	},true);
}

function resetCommentPan(){
	$msgBox = $("#commentsPan .download .detail");
	$download = $("#commentsPan .download");
	$msgBox.html("...");
	$download.addClass("info");
}

function fetchFile(type) {
	var option = "left=0,top=0,status=yes,resizable=yes,toolbar=no,menubar=yes,location=yes,scrollbars=yes";
	params.op = "view";
	var url = "RegularReport?_code=" + encodeURI("汉语") + "&" + getQueryString(params)
	  +"&fetchType=" + type;
	if(url.indexOf("${proxyUrl}")!=0){
//    	url = "${proxyUrl}?target=" + encodeURI(url.replace(/&/g,"^"));
    }  
	window.open(url,"",option,false);
}


function exportFile(type) {
	var option = "left=0,top=0,status=yes,resizable=yes,toolbar=no,menubar=yes,location=yes,scrollbars=yes";
	params.op = "view";
	var url = "RegularReport?_code=" + encodeURI("汉语") + "&" + getQueryString(params)
	  +"&exportType=" + type;
	if(url.indexOf("${proxyUrl}")!=0){
//    	url = "${proxyUrl}?target=" + encodeURI(url.replace(/&/g,"^"));
    }  
//	var url = "RegularReport?type=" + encodeURI(params.type) + "&code=" + encodeURI("汉语") + "&" + getQueryString(params)
//	  +"&exportType=pdf";
	//  alert(url);
	//var url = "servlet/DownloadServlet&exportType=xls"			
	//		+"&enging=exportRegular"
	//		+"&" + document.location.search
	//		+"&" + getQueryString(params);
	//window.open("opencontrol.jsp?action=" + url,"",option,false);
	window.open(url,"",option,false);
}