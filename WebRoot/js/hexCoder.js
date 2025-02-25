/**
*
*  HexCoder encode / decode
*
**/
 
var HexCoder = {
	prefix: "_~!u!~_",
	parseStandard: function (str){
		if(str.length==1){
			return "000"+str;
		}else if(str.length==2){
			return "00"+str;
		}else if(str.length==3){
			return "0"+str;
		}else{
			return str;
		}
	},
 
	/* 
	 * 将字符串编码成16进制数字,适用于所有字符（包括中文） 
	 */ 
	encode : function (str){
		var val = ""; 
		for (var i = 0; i < str.length; i++) {
			val += HexCoder.parseStandard(str.charCodeAt(i).toString(16)); 
		}
		if(val.length > 0){
			val = HexCoder.prefix + val;
		}
		return val; 
	},
 
	/* 
	 * 将16进制数字解码成字符串,适用于所有字符（包括中文） 
	 */ 
	decode : function (str){
		var val = "";
		if(0==str.indexOf(HexCoder.prefix)){
			str = str.substring(HexCoder.prefix.length, str.length);
			for(var i=0; i<str.length; i+=4){
				val += String.fromCharCode(parseInt(str.substring(i,i+4),16));
			}
		}else {
			val = str;
		}
		return val;
	}
};