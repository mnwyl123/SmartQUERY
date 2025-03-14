/**
 * @FH  
 */	
	//生成
	function save(){
		if($("#TITLE").val()==""){
			$("#TITLE").tips({
				side:3,
	            msg:'输入说明',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TITLE").focus();
			return false;
		}
		if($("#modelName").val()==""){
			$("#modelName").tips({
				side:3,
	            msg:'输入模块名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#modelName").focus();
			return false;
		}
		
		if($("#packageName").val()==""){
			$("#packageName").tips({
				side:3,
	            msg:'输入包名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#packageName").focus();
			return false;
		}else{
			var pat = new RegExp("^[A-Za-z]+$");
			if(!pat.test($("#packageName").val())){
				$("#packageName").tips({
					side:3,
		            msg:'只能输入字母',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#packageName").focus();
				return false;
			}
		}
		
		if($("#objectName").val()==""){
			$("#objectName").tips({
				side:3,
	            msg:'输入类名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#objectName").focus();
			return false;
		}else{
			var headstr = $("#objectName").val().substring(0,1);
			var pat = new RegExp("^[a-z0-9]+$");
			if(pat.test(headstr)){
				$("#objectName").tips({
					side:3,
		            msg:'类名首字母必须为大写字母或下划线',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#objectName").focus();
				return false;
			}
		}
		
		if($("#fields").html() == ''){
			$("#table_report").tips({
				side:3,
	            msg:'请添加属性',
	            bg:'#AE81FF',
	            time:2
	        });
			return false;
		}
		bootbox.confirm("确定要生成吗?", function(result) {
			if(result) {
				var strArField = '';
				for(var i=0;i<arField.length;i++){
					strArField = strArField + arField[i] + "Dcits";
				}
				$("#FIELDLIST").val(strArField); 	//属性集合
				$("#Form").submit();				//提交
				$("#objectName").val('');
				$("#fields").html('');
				$("#zhongxin").hide();
				$("#zhongxin2").show();
				timer(4);
				setTimeout("window.location.href=document.referrer;",5000);
				
			}
		});
	}
	
	//倒计时
	function timer(intDiff){
		window.setInterval(function(){
			if(intDiff > 0) {
				$('#second_show').html('<s></s>'+intDiff+'秒');
				intDiff--;
			}else {
				window.location.href=document.referrer;
			}
		}, 1000);
	} 
	
	//保存编辑属性
	function saveD(){
		var dname = $("#dname").val(); 	 		 //属性名
		var dtype = $("#dtype").val(); 	 		 //类型
		var dbz	  = $("#dbz").val();   	 		 //备注
		var isQian = $("#isQian").val(); 		 //是否前台录入
		var ddefault = $("#ddefault").val(); 	 //默认值
		var msgIndex = $("#msgIndex").val(); 	 //msgIndex不为空时是修改
		var flength = $("#flength").val(); 	 	 //长度
		
		if(dname==""){
			$("#dname").tips({
				side:3,
	            msg:'输入属性名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#dname").focus();
			return false;
		}else{
			dname = dname.toUpperCase();		//转化为大写
			if(isSame(dname)){
				var headstr = dname.substring(0,1);
				var pat = new RegExp("^[0-9]+$");
				if(pat.test(headstr)){
					$("#dname").tips({
						side:3,
			            msg:'属性名首字母必须为字母或下划线',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#dname").focus();
					return false;
				}
			}else{
				
				if(msgIndex != ''){
					var hcdname = $("#hcdname").val();
					if(hcdname != dname){
						if(!isSame(dname)){
							$("#dname").tips({
								side:3,
					            msg:'属性名重复',
					            bg:'#AE81FF',
					            time:2
					        });
							$("#dname").focus();
							return false;
						}
					}
				}else{
					
					$("#dname").tips({
						side:3,
			            msg:'属性名重复',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#dname").focus();
					return false;
					
				}
			}
		}
		
		if(dbz==""){
			$("#dbz").tips({
				side:3,
	            msg:'输入备注',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#dbz").focus();
			return false;
		}
		
		if((0-flength >=0) || flength==""){
			$("#flength").tips({
				side:3,
	            msg:'输入长度',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#flength").focus();
			return false;
		}
		
		dbz = dbz == '' ? '无':dbz;
		ddefault = ddefault == '' ? '无':ddefault;
		var fields = dname + ',fh,' + dtype + ',fh,' + dbz + ',fh,' + isQian + ',fh,' + ddefault + ',fh,' + flength;;
		if(msgIndex == ''){
			arrayField(fields);
		}else{
			editArrayField(fields,msgIndex);
		}
		$("#dialog-add").css("display","none");
	}
	//打开编辑属性(新增)
	function dialog_open(){
		$("#dialog-add").css("display","block");
		$("#dname").val('');
		$("#dbz").val('');
		$("#ddefault").val('');
		$("#msgIndex").val('');
		$("#dtype").val('String');
		$("#isQian").val('是');
		$("#form-field-radio1").attr("checked",true);
		$("#form-field-radio1").click();
		$("#form-field-radio4").attr("checked",true);
		$("#form-field-radio4").click();
		$("#flength").val(255);
		$("#ddefault").attr("disabled",true);
	}
	//打开编辑属性(修改)
	function editField(value,msgIndex){
		$("#dialog-add").css("display","block");
		var efieldarray = value.split(',fh,');
		$("#dname").val(efieldarray[0]);
		$("#hcdname").val(efieldarray[0]);
		$("#dbz").val(efieldarray[2]);
		$("#ddefault").val(efieldarray[4]);
		$("#msgIndex").val(msgIndex);
		if(efieldarray[1] == 'String'){
			$("#form-field-radio1").attr("checked",true);
			$("#form-field-radio1").click();
			$("#dtype").val('String');
		}else if(efieldarray[1] == 'Integer'){
			$("#form-field-radio2").attr("checked",true);
			$("#form-field-radio2").click();
			$("#dtype").val('Integer');
		}else{
			$("#form-field-radio3").attr("checked",true);
			$("#form-field-radio3").click();
			$("#dtype").val('Date');
		}
		if(efieldarray[3] == '是'){
			$("#form-field-radio4").attr("checked",true);
			$("#form-field-radio4").click();
			$("#isQian").val('是');
		}else{
			$("#form-field-radio5").attr("checked",true);
			$("#form-field-radio5").click();
			$("#isQian").val('否');
		}
		$("#flength").val(efieldarray[5]);
	}
	//关闭编辑属性
	function cancel_pl(){
		$("#dialog-add").css("display","none");
	}
	//赋值类型
	function setType(value){
		$("#dtype").val(value);
		 if(value == 'Integer'){
			if(Number($("#flength").val())-0>11){
				$("#flength").val(11);
			}
		}else if(value == 'Date'){
			$("#flength").val(32);
		}else{
			$("#flength").val(255);
		}
	}
	
	//赋值是否前台录入
	function isQian(value){
		if(value == '是'){
			$("#isQian").val('是');
			$("#ddefault").val("无");
			$("#ddefault").attr("disabled",true);
		}else{
			$("#isQian").val('否');
			$("#ddefault").val('');
			$("#ddefault").attr("disabled",false);
		}
	}
	
	var arField = new Array();
	var index = 0;
	//追加属性列表
	function appendC(value){
		var startItem = (currentPage - 1) * 10;
		var fieldarray = value.split(',fh,');
		if(startItem <= index && index < (startItem + 10)){
			$("#fields").append(
				'<tr>'+
				'<td class="center">'+Number(index+1)+'</td>'+
				'<td class="center">'+fieldarray[0]+'<input type="hidden" name="field0'+index+'" value="'+fieldarray[0]+'"></td>'+
				'<td class="center">'+fieldarray[1]+'<input type="hidden" name="field1'+index+'" value="'+fieldarray[1]+'"></td>'+
				'<td class="center">'+fieldarray[5]+'<input type="hidden" name="field2'+index+'" value="'+fieldarray[5]+'"></td>'+
				'<td class="center">'+fieldarray[2]+'<input type="hidden" name="field2'+index+'" value="'+fieldarray[2]+'"></td>'+
				'<td class="center">'+fieldarray[3]+'<input type="hidden" name="field3'+index+'" value="'+fieldarray[3]+'"></td>'+
				'<td class="center">'+fieldarray[4]+'<input type="hidden" name="field4'+index+'" value="'+fieldarray[4]+'"></td>'+
				'<td class="center" style="width:100px;">'+
					'<input type="hidden" name="field'+index+'" value="'+value+'">'+
					'<div class="action-buttons">'+
					'<a title="编辑" style="cursor:pointer;"  onclick="editField(\''+value+'\',\''+index+'\')"><i class="iconfont icon-bianji red1"></i></a>&nbsp;'+
					'<a title="删除" style="cursor:pointer;" onclick="removeField(\''+index+'\')"><i class="iconfont icon-shape7 green2"></i></a>'+
					'</div>'+
					'</td>'+
				'</tr>'
			);
		}
		index++;
		$("#zindex").val(index);
	}
	
	//保存属性后往数组添加元素
	function arrayField(value){
		arField[index] = value;
		currentPage = 1;
		num=1;
		var itemCounts = arField.length;
		if(itemCounts > 1){
			num = parseInt((itemCounts - 1) / 10 + 1);
		}
		changePage(num);
	}
	
	//修改属性
	function editArrayField(value,msgIndex){
		arField[msgIndex] = value;
		index = 0;
		$("#fields").html('');
		for(var i=0;i<arField.length;i++){
			appendC(arField[i]);
		}
	}
	
	//删除数组添加元素并重组列表
	function removeField(value){
		bootbox.confirm("确定要删除吗?", function(result) {
			if(result) {
				index = 0;
				currentPage = 1;
				$("#fields").html('');
				arField.splice(value,1);
				for(var i=0;i<arField.length;i++){
					appendC(arField[i]);
				}
				refreshPagination();
			}
		});
	}
	
	//判断属性名是否重复
	function isSame(value){
		for(var i=0;i<arField.length;i++){
			var array0 = arField[i].split(',fh,')[0];
			if(array0 == value){
				return false;
			}
		}
		return true;
	}
	
	var currentPage = 1;
	
	function refreshPagination(){
		var itemCounts = arField.length,
		    maxNum = 1,
		    startNum = 1,
		    endNum = 1;
		if(itemCounts > 1){
			maxNum = parseInt((itemCounts - 1) / 10 + 1);
		}
		    
		var html = '<ul class="pagination no-margin">';
		if(currentPage == 1){
			html +=  '<li><a>首页</a></li>'
			     +  '<li><a>上一页</a></li>';
		}else{
			html +=  '<li style="cursor:pointer;"><a onclick="changePage(1)">首页</a></li>'
				 +  '<li style="cursor:pointer;"><a onclick="changePage(' + (currentPage - 1) + ')">上一页</a></li>';
		}
		if(maxNum > 5){
			startNum = parseInt((currentPage - 1) / 5) * 5 + 1;
			endNum = startNum + 5;
			if(maxNum < endNum){
				endNum = maxNum + 1;
			}
		}else{
			endNum = maxNum + 1;
		}
		for(var i = startNum; i < endNum; i++){
			if(currentPage == i){
				html += '<li class="active"><a><font color="white">' + i + '</font></a></li>';
			}else{
				html += '<li style="cursor:pointer;"><a onclick="changePage(' + i + ')">' + i + '</a></li>';
			}
		}
		if(currentPage == maxNum){
			html += '<li><a>下一页</a></li>';
			html += '<li><a>尾页</a></li></ul>';
		}else{
			html += '<li style="cursor:pointer;"><a onclick="changePage(' + (currentPage + 1) + ')">下一页</a></li>';
			html += '<li style="cursor:pointer;"><a onclick="changePage(' + maxNum + ')">尾页</a></li></ul>';
		}
		html += '<span style="position: absolute; margin-left: 10px; margin-top: 7px;">  共 ' + maxNum + ' 页</span>';
		$('#dataPagination').html(html);
	}
	
	function changePage(num){
		currentPage = num;
		index = 0;
		$("#fields").html('');
		for(var i = 0; i < arField.length; i++){
			appendC(arField[i]);
		}
		refreshPagination();
	}
	
	
	/**
	 * @FH QQ: 3 1 3 596790
	 */