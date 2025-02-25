(function($,undefined ){
	
	function GridTableHeader()
	{
		this.option={
			TableID:"", 
			FixColumnNumber:0, 
			FixRowNumber:0,
			nodeName:""			
		};
	}	
	 /// <summary>
	 ///     锁定表头和列
	 /// </summary>
	 /// <param name="TableID" type="String">
	 ///     要锁定的Table的ID
	 /// </param>
	 /// <param name="FixColumnNumber" type="Number">
	 ///     要锁定列的个数
	 /// </param>
	 /// <param name="FixRowNumber" type="Number">
	 ///     要锁定行的个数，不设则以<thead>的高度为准
	 /// </param>
	 var fixTable = function (TableID, FixColumnNumber, FixRowNumber) {
	 	
	 	if(FixColumnNumber == null || FixRowNumber == null 
	 			|| (FixColumnNumber == 0 && FixRowNumber == 0)){
	 		return;
	 	}
	 	
	 	var keepWidth = 40;	//表格右边的预留宽度
	 	var keepHeight = 70;	//表格下方的预留高度
	 	
	 	var $container = $(window).height() > 100 ? $(window) : $("body");	
	 	
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
	 	
	 	if(height + gridTopHeight + keepHeight > $container.height()){
	 		height = $container.height() - gridTopHeight - keepHeight;
	 	}
	 	height += 6;
	 	
	 	$("#"+TableID).css("width",width);
	 	
	 	if ($("#" + TableID + "_tableLayout").length != 0) {
	 	    $("#" + TableID + "_tableLayout").before($("#" + TableID));
	 	    $("#" + TableID + "_tableLayout").empty();
	 	}
	 	else {
	 	    $("#" + TableID).after("<div id='" + TableID + "_tableLayout' style='overflow:hidden;height:" + height + "px; width:" + width + "px;margin:0 auto;'></div>");
	 	}
	 	
	 	$('<div id="' + TableID + '_tableFix"></div>'
	 	+ '<div id="' + TableID + '_tableHead"></div>'
	 	+ '<div id="' + TableID + '_tableColumn"></div>'
	 	+ '<div id="' + TableID + '_tableData"></div>').appendTo("#" + TableID + "_tableLayout");
	 	
	 	
	 	var oldtable = $("#" + TableID);
	 	
	 	var tableFixClone = oldtable.clone(true);
	 	
	 	tableFixClone.attr("id", TableID + "_tableFixClone");
	 	$("#" + TableID + "_tableFix").append(tableFixClone);
	 	var tableHeadClone = oldtable.clone(true);
	 	tableHeadClone.attr("id", TableID + "_tableHeadClone");
	 	$("#" + TableID + "_tableHead").append(tableHeadClone);
	 	var tableColumnClone = oldtable.clone(true);
	 	tableColumnClone.attr("id", TableID + "_tableColumnClone");
	 	$("#" + TableID + "_tableColumn").append(tableColumnClone);
	 	$("#" + TableID + "_tableData").append(oldtable);
	 	
	 	$("#" + TableID + "_tableLayout table").each(function () {
	 	    $(this).css("margin", "0");
	 	});
	 	
	 	var HeadHeight = 0;
	 	if(FixRowNumber){
	 		var totleTrCount = $("#" + TableID + "_tableHead tr").length;
	 		if(FixRowNumber > totleTrCount){
	 			FixRowNumber = totleTrCount;
	 		}
	 		for(i = 0; i < FixRowNumber; i++){
	 			HeadHeight += $("#" + TableID + "_tableHead tr").eq(i).outerHeight();
	 		}
	 	}else{
	 	   HeadHeight = $("#" + TableID + "_tableHead thead").outerHeight();
	 	}
	 	HeadHeight += 2;
	 	
	 	var ColumnsWidth = 0;
	 	var ColumnsNumber = 0;
	 	
	 	/** 计算行表头宽度*/
	 	for(colIdx = 0; colIdx <  FixColumnNumber; colIdx ++){
	 		ColumnsWidth += $("#g_"+colIdx).outerWidth();
	 		if($("#g_"+colIdx).attr("colspan")){
	 			colIdx += ($("#g_"+colIdx).attr("colspan") - 1)
	 		}
	 		ColumnsNumber++;
	 	}
	 	
	 	/*$("#" + TableID + "_tableColumn tr:last td:lt(" + FixColumnNumber + ")").each(function () {
	 		alert($(this).attr("colspan"));		
	 	    ColumnsWidth += $(this).outerWidth(true);
	 	    ColumnsNumber++;
	 	});*/
	 	ColumnsWidth += 2;
	 	var agent = navigator.userAgent.toLowerCase();
	 	if(agent.indexOf("msie") > 0){
	 		var regStr = /msie [\d.]+/gi;
	 		var brower = agent.match(regStr);
	 		var version = (brower+"").replace(/[^0-9.]/ig,"");
	 		switch (version) {
	 	        case "7.0":
	 	            if (ColumnsNumber > 1) ColumnsWidth ++;
	 	            HeadHeight ++;
	 	            break;
	 	        case "8.0":
	 	        //  if (ColumnsNumber < 2) ColumnsWidth++;
	 	            break;
	 		}
	 	}
	 	
	 	$("#" + TableID + "_tableHead").css("height", HeadHeight);
	 	$("#" + TableID + "_tableFix").css("height", HeadHeight);
	 	
	 	var tableColumnIndex = 40;
	 	if(FixColumnNumber == 0 || $("#" + TableID + "_tableLayout").outerWidth() >= $("#" + TableID).outerWidth()){
	 		$("#" + TableID + "_tableFix").css("width", tableFixClone.outerWidth());
	 		$("#" + TableID + "_tableColumn").css("width", tableFixClone.outerWidth());
	 		tableColumnIndex = 30;
	 	}
	 	else{
	 		$("#" + TableID + "_tableFix").css("width", ColumnsWidth);
	 		$("#" + TableID + "_tableColumn").css("width", ColumnsWidth);
	 	}
	 	
	 	$("#" + TableID + "_tableData").scroll(function () {
	 	    $("#" + TableID + "_tableHead").scrollLeft($("#" + TableID + "_tableData").scrollLeft());
	 	    $("#" + TableID + "_tableColumn").scrollTop($("#" + TableID + "_tableData").scrollTop());
	 	});
	 	
	 	/* $("#" + TableID + "_tableData")
	      .bind('mousewheel', function(event, delta) {
	          var dir = delta > 0 ? 'Up' : 'Down';
	        	 alert(dir + ' at tableData ');
	          return true;
	      });
	 	$("#" + TableID + "_tableColumn")
	     .bind('mousewheel', function(event, delta) {
	         var dir = delta > 0 ? 'Up' : 'Down';
	       	 alert(dir + ' at tableColumn ');
	         return true;
	     }); */
	 	
	 	$("#" + TableID + "_tableFix").css({ "overflow": "hidden","position": "relative", "z-index": "50", "background-color": "Silver" });
	 	$("#" + TableID + "_tableHead").css({ "overflow": "hidden", "width": width, "position": "relative", "z-index": "45", "background": "-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f9fcfd), color-stop(1, #e4f0f7) )" });
	 	$("#" + TableID + "_tableColumn").css({ "overflow": "hidden", "height": height, "position": "relative", "z-index": tableColumnIndex, "background-color": "Silver" });
	 	$("#" + TableID + "_tableData").css({ "overflow": "scroll", "width": width, "height": height, "position": "relative", "z-index": "35" });
	 	if ($("#" + TableID + "_tableHead").width() > $("#" + TableID + "_tableFix table").outerWidth()) {
	 	    $("#" + TableID + "_tableHead").css("width", $("#" + TableID + "_tableFix table").outerWidth());
	 	}
	 	if ($("#" + TableID + "_tableColumn").height() > $("#" + TableID + "_tableColumn table").outerHeight()) {
	 	    $("#" + TableID + "_tableColumn").css("height", $("#" + TableID + "_tableColumn table").outerHeight());
	 	}
	 	
	 	if($("#"+TableID).height()>height){
	 		$("#"+TableID+"_tableLayout").width($("#"+TableID+"_tableLayout").width()+17);
	 	    $("#"+TableID+"_tableData").width($("#"+TableID+"_tableData").width()+17);
	 	    $("#"+TableID+"_tableData table").css("float","left");
	 	}else{
	 		$("#"+TableID+"_tableData").css("overflow-y","hidden");
	 	}
	 	
	 	if($('#'+TableID).width() > width){
	 		$("#"+TableID+"_tableLayout").height($("#"+TableID+"_tableLayout").height()+17);
	 	    $("#"+TableID+"_tableData").height($("#"+TableID+"_tableColumn").height()+17);
	 	}else{
	 	 	$("#"+TableID+"_tableData").css("overflow-x","hidden");
	 	}
	 	
	 	$("#" + TableID + "_tableFix").offset($("#" + TableID + "_tableLayout").offset());
	 	$("#" + TableID + "_tableHead").offset($("#" + TableID + "_tableLayout").offset());
	 	$("#" + TableID + "_tableColumn").offset($("#" + TableID + "_tableLayout").offset());
	 	$("#" + TableID + "_tableData").offset($("#" + TableID + "_tableLayout").offset());
	 } ;
	 
	$.fn.gridtableheader = function(options)
	{	
		if ( !this.length ) {
			return this;
		}
			
		if(typeof options == "object"){	
			/* Initialise the date picker. */
			if (gridTableHeader.initialized==0) {
				gridTableHeader.initialized++;
			}
		
			$.extend(gridTableHeader.option,options||{});			
		}
		
	   fixTable(gridTableHeader.option.TableID, 
				 gridTableHeader.option.FixColumnNumber, 
				 gridTableHeader.option.FixRowNumber);
	   return this;
	};
	
	gridTableHeader= new GridTableHeader(); // singleton instance
	gridTableHeader.initialized = 0 ;
})(jQuery);

	