/*
 * author:zhaoyang
 * date:2016年12月9日
*/

var dict = function() {
  	//深拷贝
	function T$extend(des, src) { for(var p in src) { des[p] = src[p]; } return des; }
	//获取服务器根目录下
	function getContextPath() {
	    var pathName = document.location.pathname;
	    var index = pathName.substr(1).indexOf("/");
	    var result = pathName.substr(0,index+1);
	    return result;
	}
	
	//默认配置
	var defaultConfig = {
		ids:null,   //页面加载字典id  数组类型
		localStorage:true,    //是否缓存本地
		dictId:'dict-name',     //页面字典属性名
		url:getContextPath()+"/cache/getCache.do",  //映射地址
		buildType:"select",    //页面生成字典结构
		dataId:"id",           //返回字典id
		dataDictName:"dict",   //返回字典名称
		displayValue:"key",     //字典显示值
		fieldValue:"value"		//字典实际值
	}; 

	//构造函数
	var DicMain = function(config) {
		var self = this;
		if (!(self instanceof DicMain)) {
			return new DicMain(config);
		}  

		if (!(config.ids)) { 
			return;
		}
		self.config = T$extend(defaultConfig, config || {});
	};

	//公共方法
	DicMain.prototype = {
		constructor: DicMain,
		formartParamType: function(type) {  //方法名标准化
			var self = this;
			var funcName = {};
			 if(type == 'select'){
			 	funcName.paramFuncName = 'formartParamSelect';
			 	funcName.dataFuncName = 'formartDataSelect';
			 	funcName.buildFuncName = 'buildDictSelect';
			 	funcName.async = true;
			 }

			 if(type == 'grid'){
			 	funcName.paramFuncName= 'formartParamGrid';
			 	funcName.dataFuncName= 'formartDataGrid';
			 	funcName.buildFuncName = 'buildDictGrid';
			 	funcName.async = false;
			 }

		  	return funcName;
		},
		formartParamSelect: function() {  //格式化下拉框参数
			var self = this;
	        var list = [];
		  	$.each(self.config.ids,function(i,item){
				var map ={};
				map.id = item; 
				map.dictId = $("#"+item).attr(self.config.dictId);
	
				list.push(map);
				
			});
		  	return list;
		},
		formartParamGrid: function() {  //格式化表格参数
			var self = this;
			var list = [];
			$.each(self.config.ids,function(i,j){
				$("#"+j).find("thead tr th").each(function(i,item){
					if($(item).attr(self.config.dictId)){
						var map ={};
						map.id = i;
						map.dictId = $(item).attr(self.config.dictId);
						list.push(map);
					}
				})
			});
			return list;
		},
	    formartDataSelect:function(data){  //格式化数据
	    	var self = this;
	    	var arr =[];
	    	$.each(data,function(i,item){
	    		var ctn={}
	    		var str="";
				var defaultVal = $("#"+item[self.config.dataId]).attr("default-value")
				
	    		$.each(item[self.config.dataDictName],function(i,subitem){
	    			var selected = "";

	    			if( defaultVal == subitem[self.config.displayValue] ){
	    				selected = "selected='selected'";
	    			}

	    			str+="<option "+selected+" value="+subitem[self.config.displayValue]+">"+subitem[self.config.fieldValue]+"</option>";
	    		})
	    		ctn.str = str ;
	    		ctn[self.config.dataId] = item[self.config.dataId];
	    		arr.push(ctn);
	    	});
	    	return arr;
	    },
	    formartDataGrid:function(data){  //格式化数据
	    	return data;
	    },
	    buildDictSelect:function(arr){  //构建下拉框
	    	var self = this;
	    	$.each(arr,function(i,item){
	    		$("#"+item[self.config.dataId]).append(item.str);
	    	})
	    	
	    },  
	    buildDictGrid:function(data){   //构建表格
	    	var self = this;

	  		$.each(self.config.ids,function(i1,item1){
				$("#"+item1).find("tbody tr").each(function(i2,item2){
					$.each(data,function(i3,item3){
						$.each(item3[self.config.dataDictName],function(i4,item4){
							if($(item2).find("td:eq("+item3.id+")").text() == item4[self.config.displayValue]){
								$(item2).find("td:eq("+item3.id+")").text(item4[self.config.fieldValue]);
							}
						});
					});
				});
			});
	    },
	    sendAjax:function(){   //后台请求
		    var self = this;
		    var funcName = self.formartParamType(self.config.buildType);
			var list = self[funcName.paramFuncName]();

			$.ajax({
				url:self.config.url,
				data:{list:JSON.stringify(list),type:self.config.buildType},
				type:'post',
				dataType:'json',
				async : funcName.async,
				success:function(data) {  
					var arr = self[funcName.dataFuncName](data);
           			self[funcName.buildFuncName](arr);
		      	}  
			})
/*          $.post(self.config.url,{list:JSON.stringify(list),type:self.config.buildType},function(data){
           		var arr = self[funcName.dataFuncName](data);
           		self[funcName.buildFuncName](arr);
            },'json');	*/	   	

	    },
	    cache:function(data){
	    	//未实现
	    }
	};

	//出口
	return {
		init:function(config){
			$(function(){
				var st = DicMain(config);
				st.sendAjax();
			})
		}
	}
    
}();

/*   dict.init({ids:[xx,xx]})*/