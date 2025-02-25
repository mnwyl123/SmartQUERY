(function($,undefined ){	
	function CommonPicker(){
	}
	$.extend(CommonPicker.prototype,{
		displayInputpanel:function(selectID){
			if(!commonpicker.inputPanelFlags){
				commonpicker.inputPanelFlags=true;			
				addHeader(selectID);
				displayInfo();
				addSearchPanel();
				displaySearchFlags();
				searchContentDisplay();
				footerDisplay();				
				registerEvent();
			}
		},
		sendAjaxRequest:function(params){
			if(params.url==""){
				alert("AJAX请求中URL为空!");
				return false;
			}
			
			if(params.callback==null){
				$(".toolbar li.tab").each(function() {
					$(this).removeClass("selected");});		
				$(".tabPanel").each(function() {
					$(this).css("display", "none");	});	
				
				$("div#centerPan").html("");
				$("div#errorDisplay").html("");
				
				mask();
				params.callback=ajaxCallback;	
			}	
			
			ajaxCall(params.url,
					params.data,
					params.callback,
					params.asyn);
		}
	});
	
	$.fn.commonPicker = function(options)
	{		
		if(!this.length){
			return this;
		}	
		
		if(!commonpicker.initialized){
			commonpicker.initialized = true;
		}
		
		if(typeof options == "string" ){
			
		}else if(typeof options=="object" ){
			if(options.type=="ajaxRequest"){
				if(commonpicker.selectorID==""){
					commonpicker.selectorID=options.selectorID;
				}				
				commonpicker.sendAjaxRequest(options);
			}
		}else{
			return false ;
		}
			
	    return $(this);     
	};
	
	var refreshReport=function(sync, newParams) {						
		mask();
		if(newParams)
			ajaxCall(commonpicker.curUrl,newParams,loadReportWorker, sync ? false : true );
		else
			ajaxCall(commonpicker.curUrl,commonpicker.params,loadReportWorker, sync ? false : true );
	};
	
	var doGotoPage=function() 
	{
		var pageNo = $("#gotoPage").val();
		if($.trim(pageNo) == ""){
			alert("请录入页码！");
			return false;
		}
		
		commonpicker.params.op = "view";
		commonpicker.params.page = pageNo - 1; //$("#gotoPage").attr("value") - 1;
		commonpicker.params.section = "all";
		commonpicker.params.uuid = $("#regularReportViewer").attr("uuid");
		//refreshReport(false,commonpicker.params);	
		ajaxCall(commonpicker.curUrl,commonpicker.params,loadReportWorker,true);
	};
		
	var cssDisplay=function(){
		$("#guider").each(function() {
			$(this).css("display", "block");
		});	
		
		$("#firstTimeComments").each(function() {
			$(this).css("display", "block");});	
		
		$("#inputTab").addClass("selected");
		$("div#inputPanel").each(function() {
				$(this).css("display", "block");});	
	};
	
	var registerEvent=function()
	{		
		$("#cancelBtn").click(function(){
			commonpicker.isExistPannel=false;	
			abortLoading();
		});	
		
		$(".toolbar li.tab").hover(function(){						
			currentTab = $(this).attr("panel");
			if (currentTab) {
				$(".toolbar li.tab").each(function() {
						if ($(this).attr("panel") == currentTab) {
								$(this).addClass("selected");
							} else {
								$(this).removeClass("selected");
							}
						});
				$(".tabPanel").each(function() {
					if ($(this).attr("id") == currentTab) {
						$(this).css("display", "block");										
					} else {
						$(this).css("display", "none");
					}
				});
			} else {
				$(".toolbar li.tab").removeClass("selected");	
				if($(".tabPanel:visible").size() > 0){
					closeTab();
				}
			}
		}, function() {						
		});
								
		$("#commentsPanel").hover(
			function() {										
			}, function(){																											
				$(".toolbar li.tab").each(function() {	
						if ("inputPanel" != currentTab){
							$(this).removeClass("selected");	
						}									
					});
									
				$(".tabPanel").each(function() {
					if ("inputPanel" != currentTab){
						  $(this).css("display", "none");
						}
					});														
			});
		
		$("#resetBtn").click(function(){
			closeTab();
		});		
		
		/*content search event*/
		$("#prevPageBtn,#nextPageBtn,#firstPageBtn,#lastPageBtn").bind('click',function(event){
			hiddenSearchPannel();
			event.stopPropagation();
			var uuid = $("#regularReportViewer").attr("uuid");
			var newParams = $.extend({}, commonpicker.params,{op:"view",page:$(this).attr("page"),section:$(this).attr("section"), uuid:uuid});	
			//refreshReport(false,newParams);	
			ajaxCall(commonpicker.curUrl,newParams,loadReportWorker,true);
			return false;
		});
						
		$("#gotoPageBtn").bind('click',function(event){
			event.stopPropagation();
			hiddenSearchPannel();
			doGotoPage();				
			return false;
		});
		
		$("#gotoPage").bind('keyup',function(event){
			if(event.keyCode == 13) {
				hiddenSearchPannel();
				doGotoPage();
			}
			return false;
		});	
	};
	
   var mask=function(){
		$("#mask").css("display","block");
		$("#mask").css({top:"0px",left:"0px"});
		commonpicker.maskCount++;
	};

	var unmask=function() {
		commonpicker.maskCount--;	
		$("#mask").css("display","none");
		$("#mask").css({top:"-9999px",left:"-9999px"});
	};
	
	var abortLoading=function(){unmask();};
	var hiddenSearchPannel=function()
	{
		$(".toolbar li.tab").each(function() {
			$(this).removeClass("selected");});		
		$(".tabPanel").each(function() {
			$(this).css("display", "none");	});	
		
		$("#guider").each(function() {
			$(this).css("display", "none");	});	
		$("#firstTimeComments").each(function() {
			$(this).css("display", "none");	});		
	};
	
	function closeTab() {
		$(".tabPanel").css("display", "none");
		$(".toolbar li.tab").css("width", "").css("background-color", "")
				.css("padding-left", "").children().css("display","none");//.html("");
	};
	var addHeader =function(id)
	{	
		$("div#"+id).html("<ul class='toolbar'><li id='commentsTab' class='tab normal' caption='温馨提示' panel='commentsPanel'></LI></ul>");
	    $("#commentsTab").after("<Li id='inputTab' class='tab normal' caption='查询条件' panel='inputPanel'></LI>");
		$("#inputTab").after("<LI  class='cmd' id='refreshReportBtn' title='刷新'></LI>");
		$("#refreshReportBtn").after("<LI  class='cmd' id='exportExcellBtn' title='导出Excel文件'></LI>");
		$("#exportExcellBtn").after("<LI  class='cmd' id='exportPdfBtn' title='导出Pdf文件'></LI>");
		$("#exportPdfBtn").after("<LI  class='cmd'  id='printBtn'  title='打印'></LI>");
		$("#printBtn").after("<LI  class='cmd'  id='shrinkFont'  title='字体缩小' ></LI>");
		$("#shrinkFont").after("<LI  class='cmd'  id='enlargeFont'  title='字体放大' ></LI>");
		
		$("ul.toolbar .cmd").each( function(){
			$(this).hide();							
		});		
	};
	
	var displayInfo=function()
	{
		$("ul.toolbar").after("<div class='tabPanel' id='commentsPanel'></div>");
		$("#commentsPanel").wrapInner("<span class='tabtitle' style=''>提示信息：</span>");
		$("#commentsPanel span").after("<div id='indicateInfo'>纯清单型报表：<br/>列出了第一产业的详细信息。<br/></div>");
	};
	
	var searchContentDisplay=function()
	{
		$("div#mask").after("<div id='centerPan' class='ui-layout-center'></div><DIV id='firstTimeComments'></DIV>");
		$("#centerPan").after("<DIV id='guider' >还没有录入查询条件，请把鼠标移到这里</DIV>");
		$("#firstTimeComments").wrapInner("<DIV id='firstTimeTitle' >报表标题：<br/></DIV>");
		$("#firstTimeTitle").after("<DIV id='firstTimeCommentsContent' >纯清单型报表：<br/>列出了第一产业的详细信息.</DIV>");
	};
	
	var footerDisplay=function()
	{
		$("div#firstTimeComments").after("<div id='southPan' class='statusbar'>"
				+"<div id='statusMsg' style='float: left;'></div>"
				+"<div id='pageNavi' style='display: none; float: right;'>"
				+"<span id=totalPages></span>"
				+"<a id=firstPageBtn href=# page=0 section=0>首页</a>"
				+"<a id=prevPageBtn href=# page=0 section=0>上一页</a>"
				+"<span id=curPage></span>"
				+"<a id=nextPageBtn href=# page=0 section=0’>下一页</a>"
				+"<a id=lastPageBtn href=# page=0 section=0>末页</a>"
				+"<a id=gotoPageBtn href='#'>转到</a>"
				+"<input id='gotoPage' type='text' maxlength='5' />页</div></div>");	
	};
		
	var addSearchPanel=function()
	{
		$("div#commentsPanel").after("<div class='tabPanel' id='inputPanel'>"
				+"<span class='tabtitle' style=''>请录入查询条件:</span>"
				+"<TABLE class='inputPanel'></TABLE>"
				+"<div id='buttonPanel'>"
				+"<input id='viewReportBtn' type='button' value='确定'/>"
				+"<input id='resetBtn' type='button' value='取消'/></div>"
				+"</div>");		
	};
	
    var displaySearchFlags =function()
	{
		$("div#inputPanel").after("<div id='mask'>"
							+"<div style='margin: 20%; margin-left: 10%; text-align: center;'>"
							+"<img src='images/loading.gif'/>"
							+"<div id='cancelBtn' style='cursor: pointer; margin: 1em; color: red;'>点击这里取消</div>"
							+"</div></div>");
	};
	var drawTopLeftCell=function()
	{	
		 $("td.topLeft2bottomRightLine").each(function(){
				var width=$(this).width();
				var height=$(this).height();	
				var paper=new Raphael("0,1",width,height);			
				var position="M"+paper._left+" "+paper._top+"L "+width+" "+height;
				paper.path(position).attr({'stroke-width':1,stroke:'#A1BCDD'});			
				
				x1 =$(this).offset().left;
				x2 =$("td.topLeft2bottomRightLine >svg").offset().left;	
				width=$(this).width();
				var r1=x1+width;
				var r2 =x2+$("td.topLeft2bottomRightLine >svg").width();
				
				$("td.topLeft2bottomRightLine >svg").css("margin","-3px "+(r2-r1)+"px -3px "+(x1-x2)+"px");						
				
				//$(this).css("width",$("td.topLeft2bottomRightLine >svg").width());
				//$(this).css("height",h2);	
				//$("td.topLeft2bottomRightLine >svg").css({width:"100%",height:"100%"});
				
				$(this).css("padding","0.5px");
				$(this).css("margin","-0.5px");
				return false;
		});
	};
	var dependsInputChange=function($ctrl, dependeeId, dependeeVar) {
		if(collectParams(false)==false){return false;}
		var ps = $.extend({},commonpicker.params,
				{
				ajax:1,
				type:commonpicker.params.type,			
				ctrl:"select",
				op:"updateCtrl",
				dependee:dependeeVar,
				def:$("#"+dependeeId).attr("default"),
				depends:$ctrl.attr("id"),//dependsId,
				val:$ctrl.selectedValues()[0],
				cap:$ctrl.selectedTexts()[0],
				params:JSON.stringify(commonpicker.params)
				});
			ajaxCall("RegularReport",ps,function(data){
			    if( data.HeadInfo.Code == 0 ){
			    	var html = data.DataInfo.options;
			    	if($.trim(html)==""){
			    		html = "<option />";
			    	}
			    	$("#"+dependeeId).html(html);
			    } else {
			    	alert(data.HeadInfo.Message);
			    }
			},true);
	};

	var dependsInputChange4Multi=function($ctrl, dependeeId, dependeeVar) {
		if(collectParams(false)==false){return false;}
		var ps = $.extend({},commonpicker.params,
				{
				ajax:1,
				type:commonpicker.params.type,			
				ctrl:"multiSelect",
				op:"updateCtrl",
				dependee:dependeeVar,
				def:$("#"+dependeeId).attr("default"),
				depends:$ctrl.attr("id"),//dependsId,
				val:$ctrl.selectedValues()[0],
				cap:$ctrl.selectedTexts()[0],
				params:JSON.stringify(commonpicker.params)
				});					
				ajaxCall("RegularReport",ps,function(data){
			    if( data.HeadInfo.Code == 0 ){
			    	var treeId = dependeeId + "-tree";
			    	var zTree = $.fn.zTree.getZTreeObj(treeId);
			    	$("#" + dependeeId).val("");
			    	zTree.destroy();
			    	$.fn.zTree.init($("#"+treeId),zTree.setting,data.DataInfo.options);			    		    
			    } else {
			    	alert(data.HeadInfo.Message);
			    }		
			},true);
	};
	
   var dataNaviClick=function(event) {
		event.preventDefault();
		event.stopPropagation();
		//var option = "left=0,top=0,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,scrollbars=yes";
		var href = $(this).attr("href");
		var id = $(this).attr("id");
		if(id) {
			href = window.bigStrs[id];
		}
		PostNewWin(href);
		return false;
	};
   
	var addTDElement=function(name,id,str,id2,trID)
	{
		//var id="td-caption"+i ;
		$("#"+trID).append("<TD id='"+id+"' class='caption' colIdx='0' nowrap='true'></TD>");
		$("#"+id).html(name);
		$("#"+id).after("<TD id='"+id2+"' class='input' colIdx='1' nowrap='true'></TD>");
		if(str!=""){
			$("#"+id2).wrapInner(str);
		}		
	};
	var addNextTDElement=function(name,id,str,id1,id2){
		//var id="td-caption"+i ;
		$("#"+id1).after("<TD id='"+id+"' class='caption' colIdx='0' nowrap='true'></TD>");
		$("#"+id).wrapInner(name);
		$("#"+id).after("<TD id='"+id2+"' class='input' colIdx='1' nowrap='true'></TD>");
		$("#"+id2).wrapInner(str);
	};

	  var loadReportWorker=function(data)
	  {	
			if( data.HeadInfo.Code == 0 )
			{		
				$("#southPan").removeClass("hide");
				$("#statusMsg").text(data.DataInfo.statusMsg ? data.DataInfo.statusMsg : "");
				
				if(!data.DataInfo.cacheUuid){
					alert("maybe there is a bug! liuxjg");
				}
				
				//$("#regularReportViewer").attr("uuid",data.DataInfo.cacheUuid);			
				if(data.DataInfo.curPage != null)
				{
					$("#pageNavi").css("display","block");
					var msg = "";
					if(data.DataInfo.totalPages && data.DataInfo.totalPages > 0) {
						msg = "共 " + data.DataInfo.totalPages +" 页";
					} else if(data.DataInfo.ongoingPage && data.DataInfo.ongoingPage >= 0) {
						msg = "正在处理";
						if(data.DataInfo.totalSections > 1) {
							msg += (parseInt(data.DataInfo.ongoingSection)+1) + "部分  第";
						}
						msg +=  data.DataInfo.ongoingPage +" 页";
					}
					
					if(data.DataInfo.totalPages > 1 || data.DataInfo.ongoingPage >= 0)
					{
						$("#totalPages").text(msg);	
						
						if(data.DataInfo.curPage == 0) {
							//alert("dsadsadas");
							$("#prevPageBtn").addClass("hide");//.css("display","none");
							$("#firstPageBtn").addClass("hide");
							
							//$("#prevPageBtn,#firstPageBtn").css("display","none");
						} else {
							$("#prevPageBtn,#firstPageBtn").removeClass("hide");//css("display","inline-block");
							$("#prevPageBtn").attr("page",data.DataInfo.prevPage);
							$("#prevPageBtn").attr("section",data.DataInfo.prevSection);
						}

						$("#curPage").text("第 "+ (parseInt(data.DataInfo.curPage) + 1) +" 页");
						
						if(data.DataInfo.isLastPage) {
							$("#nextPageBtn,#lastPageBtn").addClass("hide");//.css("display","none");
						} else {
							if(data.DataInfo.totalPages > 1) {
								$("#nextPageBtn,#lastPageBtn").removeClass("hide");
							} else {
								$("#nextPageBtn").removeClass("hide");//.css("display","inline-block");
								$("#lastPageBtn").addClass("hide");
							}
							$("#nextPageBtn").attr("page",data.DataInfo.nextPage);
							$("#nextPageBtn").attr("section",data.DataInfo.nextSection);
							$("#lastPageBtn").attr("page",data.DataInfo.lastPage);
							$("#lastPageBtn").attr("section","all");
						}
					} 
					else 
					{			
						$("#pageNavi").css("display","none");				
					}
				}
				else 
				{
					$("#pageNavi").css("display","none");
				}
				
//			if(data.DataInfo.originalVals) {
				originalVals = data.DataInfo.originalVals;
//			}		
//			if(data.DataInfo.modifyDraftVals){
				modifyDraftVals =  data.DataInfo.modifyDraftVals;
//			}		
//			if(data.DataInfo.modifyDraftComments){
				modifyDraftComments = data.DataInfo.modifyDraftComments;
//			}

		    canDoEdit = data.DataInfo.canDoEdit;
		    canDoAuditEdit = data.DataInfo.canDoAuditEdit;
		    
		    window.bigStrs = data.DataInfo.bigStrs;      
				$("#centerPan").html(data.DataInfo.content);	
				$("a.dataNavi").click(dataNaviClick);			
			} 
			else 
			{
				$("#centerPan").html("<div style='margin:1em;color:red;font:10pt;'>" + data.HeadInfo.Message + "</div>");
				if(data.HeadInfo.Message.indexOf("查询中") > -1)
				{
					$("#centerPan").append("<input type='button' onclick='queryReport()' value='重试'/>");
				}
			}
			
			drawTopLeftCell();
			unmask();			
			if($("body").height() <= 0 ) {
				needRelayout = true;
			}
			
			if(data.DataInfo && data.DataInfo.isFixHeader){
				$("#gridTable").gridtableheader({
					TableID:"gridTable", 
					FixColumnNumber:data.DataInfo.rowHeaderWidth, 
					FixRowNumber:data.DataInfo.colHeaderHeight
				});
			}
		};
		var initQueryParams=function(){
			commonpicker.params={};
			commonpicker.params.ajax=1;
			commonpicker.params.type= commonpicker.urlType;
		};
	    var collectParams=function(flags)
	    {
	    	if(commonpicker.selectorArray.length==0){return null;}    	
	    	initQueryParams();   	
			var name="";
			var rmlpar = "";
			var paraDef = "";
			var reportId =commonpicker.params.type;
			
	    	var varNameArray=new Array();
	    	var varCapNameArray=new Array();
	    	var varArray=new Array();
	    	var varCapArray=new Array(); 
	     	var ret=true;
	    	for(var i=0;i<commonpicker.selectorArray.length;++i)
	    	{
	    		name=commonpicker.selectorArray[i].pickerName;		
	    		if(paraDef != ""){
					paraDef += "|";
				}					
				paraDef += "str";		
				switch(name)	
	    		{
	    			case "datepicker":
	    			{
	    				var varname="";
	    				var varVal="";
	    				var varCapName="";
	    				var varCapVal="";
	    				varName=$.trim($(commonpicker.selectorArray[i].selector).attr("var"));
	    				varVal=$(commonpicker.selectorArray[i].selector).dateSelectPicker("getvar");
	    				varCapName=$.trim($(commonpicker.selectorArray[i].selector).attr("varcap"));
	    				varCapVal=$(commonpicker.selectorArray[i].selector).dateSelectPicker("getvarCap");  				
	    				
	    				if(varName.length>0){ 
	    					varArray.push(varVal);
	        				varNameArray.push(varName);
	        				commonpicker.params[varName]=varVal;
	    				}
	    				 
	    				if(varCapName.length>0){  	
	    					varCapArray.push(varCapVal); 
	        				varCapNameArray.push(varCapName); 
	        				commonpicker.params[varCapName]=varCapVal;
	    				}
	    				
	    				if(rmlpar!="") {
	    					rmlpar += "|";
	    				}
	    				
	    				rmlpar += varVal;
	    				
	    				break;
	        		}
	    			case "treeselect":
	        		case "treemultiselect":{
	        			/*invoke datapicker plugin API*/
	        			var childSelector=commonpicker.selectorArray[i].childSelector ;
	        			var optionsVar =new Array();
	        			optionsVar[0]=childSelector;
	        			optionsVar[1]="getvar";
	        			var varp=commonpicker.params[$(childSelector).attr("var")]=$(commonpicker.selectorArray[i].selector).treeMultiSelect(optionsVar);        			
	     	        	optionsVar[0]=childSelector;
	        			optionsVar[1]="getvarCap";		
	        			var varCap=$(commonpicker.selectorArray[i].selector).treeMultiSelect(optionsVar);     			   				
	        			commonpicker.params[$(childSelector).attr("varCap")]=varCap;
	        			if(varp==""||varCap==""){
	        				/*必输必选判断*/
	        				var curText=$("#"+commonpicker.selectorArray[i].tdID).text();
	        				if($(childSelector).attr("inputo")==1&&flags==true){
	        					ret=false;
	        					alert(curText+":必须有输入值!");
	        				}
	        			}
	    				if(rmlpar!="") {
	    					rmlpar += "|";
	    				}
	    				
	    				rmlpar += varCap;
	        			break;
	            	}
	        		case "text":
	        		{	
	        			var varp=commonpicker.params[$(commonpicker.selectorArray[i].childSelector).attr("var")]=$(commonpicker.selectorArray[i].childSelector).textPicker("getvar");
	    				//commonpicker.params[$(commonpicker.selectorArray[i].selector).attr("varCap")]=$(commonpicker.selectorArray[i].selector).selectPicker("getvarCap");
	        			if(varp==""){
	        				/*必输必选判断*/
	        				var curText=$("#"+commonpicker.selectorArray[i].tdID).text();
	        				if($(commonpicker.selectorArray[i].childSelector).attr("inputo")==1&&flags==true){
	        					ret=false;
	        					alert(curText+":必须有输入值!");
	        				}
	        			}
	        			if(rmlpar!="") {
	    					rmlpar += "|";
	    				}
	    				
	    				rmlpar += varp;
	        			break;
	        		}	
	        		case "calendar":
	    			{	
	       				var varp=commonpicker.params[$(commonpicker.selectorArray[i].childSelector).attr("var")]=$(commonpicker.selectorArray[i].childSelector).attr("curdate");
	       				commonpicker.params[$(commonpicker.selectorArray[i].childSelecchildSelectortor).attr("varCap")]=$(commonpicker.selectorArray[i].childSelector).attr("curdatecap");
	    				if(rmlpar!="") {
	    					rmlpar += "|";
	    				}
	    				
	    				rmlpar += varp;
	        			break;
	    			}
	        		case "select":
	        		{
	    				var varp=commonpicker.params[$(commonpicker.selectorArray[i].selector).attr("var")]=$(commonpicker.selectorArray[i].selector).selectPicker("getvar");
	    				commonpicker.params[$(commonpicker.selectorArray[i].selector).attr("varCap")]=$(commonpicker.selectorArray[i].selector).selectPicker("getvarCap");
	    				if(rmlpar!="") {
	    					rmlpar += "|";
	    				}
	    				
	    				rmlpar += varp;
	        			break;
	            	}
	        		default:
	        			break;
	    		}
	    	}
	    	
	    	if(varArray.length>1){
	    		sendSearchByAjax(varArray,varCapArray,varNameArray,varCapNameArray);
	    	}
	    	
	    	commonpicker.params.rmlpar = rmlpar;
	    	commonpicker.params.paraDef = paraDef;
	    	commonpicker.params.reportid = reportId;  //for doAuth
	    	commonpicker.params.S_ID = reportId;
		    return ret;
	    } ;
	    
	var sendSearchByAjax =function (varArray,varCapArray,varNameArray,varCapNameArray)
	{								
		function compareSize(a ,b){
			return a-b;
		}
		
		varArray.sort(compareSize);		
		if(varCapArray.length>0){
			varCapArray.sort(compareSize);
		}
		
		for(var i=0;i<varArray.length;++i)
		{  
			commonpicker.params[varNameArray[i]]=varArray[i];
			if(varCapNameArray.length>=1)
			{
				commonpicker.params[varCapNameArray[i]]=varCapArray[i];
			}
		}
	};	
	var initParams=function(){
		if(commonpicker.selectorArray.length>0){
			var len=commonpicker.selectorArray.length;
			for(var i=0;i<len;++i){
				commonpicker.selectorArray.pop();
			}
		}
	};
	var displayPicker=function(contentJson){
		initParams();
		var IDCaptionArray=[];			
		var strElement="";	
		var cnt=0;
		var dependsId="";
		var dependeeId="";
		var childSelector="";
		var selector="";		
		var pickerName="";
		var trID="inputPanelTR_"+cnt++;	
		$("table.inputPanel").html("");
		$("table.inputPanel").unbind();
		$("table.inputPanel").append("<TR id='"+trID+"'></TR>");
		for(var i=0;i<contentJson.length;i++)
		{	
			var ctrl = contentJson[i];
			var name=ctrl.name;
			IDCaptionArray[i]="IDCaption"+(i+1);
			if((i+1)%4 == 0){
				trID="inputPanelTR_"+cnt++;	
				$("table.inputPanel").append("<TR id='"+trID+"'></TR>");
			}
			
			var tdID="td-caption"+(i+1) ;
			childSelector="";
			selector="";
			dependsId="";
			dependeeId="";
			pickerName=ctrl.inputCtrl.toLowerCase();
			
			switch(ctrl.inputCtrl.toLowerCase())
			{	
				case "datepicker":
					strElement="<span></span>";
					if(i==0){
						addTDElement(name,tdID,strElement,IDCaptionArray[i],trID);							
					}else{
						addNextTDElement(name,tdID,strElement,IDCaptionArray[i-1],IDCaptionArray[i]);		
					}
					
					/*test callback api*/
					ctrl.callBackFunc=function(message){
						//alert(this.defaultVal+","+this.inputScopeData+","+message);
					};
					
					childSelector=selector="#"+IDCaptionArray[i]+" span";
					var thisOBj=$(selector).dateSelectPicker(ctrl);
					break;
				case "calendar":
				{	
					strElement="<span></span>";	
					addTDElement(name,tdID,strElement,IDCaptionArray[i],trID);								
					ctrl.nodeName="span";
					selector="#"+IDCaptionArray[i]+" span";
					var curSelector=$(selector).calendarPicker(ctrl);							
					var childSelector="#"+$(curSelector).calendarPicker("getChildID");
					break;
				}
				case "treemultiselect":
				case "treeselect":
				{	
					strElement="<span></span>";
					addTDElement(name,tdID,strElement,IDCaptionArray[i],trID);					
					ctrl.nodeName="span";
					ctrl.pickerName=pickerName;	
					selector="#"+IDCaptionArray[i]+" span";
					var curSelector=$(selector).treeMultiSelect(ctrl);
					childSelector="#"+curSelector.treeMultiSelect("getChildID");
					dependeeId = $(childSelector).attr("id");				
					dependsId = $(childSelector).attr("depends");											
					break;
				}
				case "text":
				{	
					addTDElement(name,tdID,"",IDCaptionArray[i],trID);
					selector="#"+IDCaptionArray[i];
					$(selector).textPicker(ctrl);				
					childSelector="#"+$(selector).textPicker("getChildID");				
					break;	
				}
				case "itext":
				{
					$("div#errorDisplay").html("");
					var info ="目前"+pickerName+" 控件不支持!";
					$("div#"+commonpicker.selectorID).after("<div id='errorDisplay'><p>"+info+"</p></div>");
					break;
				}						
				case "select":
				{	
					strElement="<select></select>";
					addTDElement(name,tdID,strElement,IDCaptionArray[i],trID);	
					childSelector=selector="#"+IDCaptionArray[i]+" select";
					var curThis=$(selector).selectPicker(ctrl);		
					dependeeId = curThis.attr("id");				
					dependsId = curThis.attr("depends");	
					break;
				}
				default :
					break;
			 } 
			
			var selectorObj={
					selector:selector,
					childSelector:childSelector,
					dependsId:dependsId,
					dependeeId:dependeeId,
					pickerName:pickerName,
					usage:ctrl.usage,
					tdID:tdID
			};
			
			if(selectorObj.selector!=""){
				commonpicker.selectorArray.push(selectorObj);
			}
		}	
		
		for(var m=0;m<commonpicker.selectorArray.length;++m){
			if(commonpicker.selectorArray[m].pickerName=="datepicker"){
				$(commonpicker.selectorArray[m].selector).dateSelectPicker("addEvent");
			}else if(commonpicker.selectorArray[m].usage=="数据精度"){
				$(commonpicker.selectorArray[m].selector).selectPicker("addEvent");
			}else{
				var dependsId="";
				var dependeeId="";
				var selector=commonpicker.selectorArray[m].childSelector;
				dependeeId = $(selector).attr("id");				
				dependsId = $(selector).attr("depends");							
				if(dependsId && dependsId != ""){
					$("#" + dependsId).change(function(event){	
						var dependsIdVar = this.id;
						var tempDependeeId = "";
						var tempDependeeVar = "";
						var name ="";
						for(var m=0;m<commonpicker.selectorArray.length;++m){
							if(commonpicker.selectorArray[m].dependsId==dependsIdVar){
								tempDependeeId = $(commonpicker.selectorArray[m].childSelector).attr("id");
								tempDependeeVar = $(commonpicker.selectorArray[m].childSelector).attr("var");
								name=commonpicker.selectorArray[m].pickerName;
								break;
							}
						}
						var ret=null;
						if(name=="select"){
							ret=dependsInputChange($("#"+dependsIdVar),tempDependeeId,tempDependeeVar);
						}else{
							ret=dependsInputChange4Multi($("#"+dependsIdVar),tempDependeeId,tempDependeeVar);								
						}
						if(ret==false){
							return false;
						}
					});
				}				
			}			
		}
	};
	var ajaxCallback=function(data) 
	{			
		commonpicker.curUrl = data.HeadInfo.ServerUrl + data.HeadInfo.ResourcePath;	
		if(commonpicker.inputPanelFlags==false){
			addHeader(commonpicker.selectorID);
			displayInfo();
			addSearchPanel();
			displaySearchFlags();
			searchContentDisplay();
			footerDisplay();
			registerEvent();
			commonpicker.inputPanelFlags=true;					
		}
				
		$("#centerPan").html("");
		$("div#errorDisplay").html("");	
		$("#southPan").addClass("hide");
		//commonpicker.checkBtm=false;
		if(data.HeadInfo.Code == 0)
		{				
			if(data.HeadInfo.SendbackParams){
				commonpicker.urlType=data.HeadInfo.SendbackParams._type;
			}else{
				alert("data.HeadInfo.SendbackParams is null!");
			}
			
			var contentType = data.HeadInfo.ContentType;	
			if(contentType.indexOf("inputPanel")>=0){
				$("#inputTab").css("display","block");	
				$("#inputPanel").css("display","block");
				commonpicker.isExistPannel=true;
				commonpicker.lastUrl=data.HeadInfo.SendbackParams._type;
				var contentJson = data.DataInfo.content;
				if(data.HeadInfo.ContentMime.toLowerCase().indexOf("text/json")==0){
					contentJson = JSON.parse(contentJson);
				}	
				displayPicker(contentJson);				
			    cssDisplay();				    
			    $("div #buttonPanel #viewReportBtn").unbind('click');
				$("div #buttonPanel #viewReportBtn").click(function(){		
					$("#centerPan").html("");
					commonpicker.checkBtm=true;
					var url = data.HeadInfo.ServerUrl + data.HeadInfo.ResourcePath;	
					var ret=collectParams(true);
					if(ret){
						hiddenSearchPannel();	
						ajaxCall(url,commonpicker.params,ajaxCallback,true);		
						mask();
					}					
				});
			}else if(contentType.indexOf("report/bicenter")>=0){					
				$(".toolbar .cmd").each( function(){						
					$(this).show();
				});
				hiddenSearchPannel();	
				loadReportWorker(data);	
				
				var curType=data.HeadInfo.SendbackParams._type;
				if(commonpicker.isExistPannel==false){
					if(curType==commonpicker.lastUrl){						
					}else{		
						$("#inputTab").css("display","none");	
						$("#inputPanel").css("display","none");
						initParams();
						initQueryParams();						
					}									
				}else{								 
					commonpicker.isExistPannel=false;
					if(commonpicker.checkBtm==false){
						$("#inputTab").css("display","none");	
						$("#inputPanel").css("display","none");
						initParams();
						initQueryParams(); 
					}	
				}									
			} else if(contentType.indexOf("chart/fusionchart")>=0){
				 /*String to Json */
				 // var jsonT = eval("("+data.DataInfo.content+")");    
				$(".toolbar .cmd").each( function(){						
					$(this).show();
				});
				hiddenSearchPannel();					
               var respText=data.DataInfo.content;
              if(respText!="")
              {
            	  var jsonT1 =(new Function("","return"+respText))();
            	  $("#centerPan").css("height","500px");
	              var myChart = echarts.init(document.getElementById('centerPan'));
	              myChart.setOption(jsonT1);
              }         
			} else if(contentType.indexOf("kpi/bicenter")>=0){
				$("#centerPan").text(JSON.stringify(data.DataInfo.content));
			} else if(contentType.indexOf("dashboard/bicenter")>=0){
				var contentJson = data.DataInfo.content;
				if(data.HeadInfo.ContentMime.toLowerCase().indexOf("text/json")==0){
					contentJson = JSON.parse(contentJson);
				}
				$("#centerPan").html("");
				for(var i=0;i<contentJson.units.length;i++){
					$("#centerPan").append("<a target='new' href='" + contentJson.units[i].datasourceUrl + "' >" + contentJson.units[i].id + "__" + contentJson.units[i].name + "</a>");
				}
			}
			else {
				alert("目前不支持:"+contentType);
			}
		}else{
			commonpicker.isExistPannel=false;	
			hiddenSearchPannel();
			$("#inputTab").css("display","block");	
			//$("#inputPanel").css("display","block");
			//alert(data.HeadInfo.Message);
			$("div#errorDisplay").html("");
			$("div#"+commonpicker.selectorID).after("<div id='errorDisplay'><p>"+data.HeadInfo.Message+"</p></div>");
		}
		commonpicker.checkBtm=false;
		unmask();
	};
	
	var ajaxCall=function(url, param , callback, async){
		ajaxUrlCall(url,param,callback,async);
	};
	commonpicker = new CommonPicker(); // singleton instance
	commonpicker.initialized = false;
	commonpicker.inputPanelFlags = false;
	commonpicker.currentTab=null;
	commonpicker.maskCount = 0;
	commonpicker.curUrl="" ;
	commonpicker.selectorArray=new Array();
	commonpicker.params={ajax:1};
	commonpicker.selectorID="";
	commonpicker.isExistPannel=false;
	commonpicker.urlType="";
	commonpicker.checkBtm=false;
	commonpicker.lastUrl="";
})(jQuery);

	