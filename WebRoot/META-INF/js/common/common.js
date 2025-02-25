function getContainer(target, tagName) {
	var parent = target;

	while (parent
			&& (!parent.tagName || parent.tagName.toUpperCase() != tagName
					.toUpperCase())) {
		parent = parent.parentNode;
	}

	return parent;
}

function getInnerTags(parent, tagName) {
	var tags = [];
	if (parent.childNodes) {
		for ( var i = 0; i < parent.childNodes.length; i++) {
			var node = parent.childNodes[i];
			if (node.tagName.toUpperCase() == tagName.toUpperCase()) {
				tags.push(node);
			}
		}
	}
	return tags;
}

function getEventTarget  (event) {
	var elem = event.srcElement ? event.srcElement : event.target;
	return elem;
}

function  createCommandParam(oper,pa) {
	var o = new Object();
	o.op = oper;
	o.param = pa;
	return o;	
}

function trim(str) {
	var whitespace = new String(" ");
	var s = str.split(" ");
	var str = "";
	for ( var index = 0; index < s.length; index++) {
		str = str + s[index];
	}
	return str;
}

function refreshPage() {
	window.location.reload();
}
/*
function arrayToString(array){	
	var r = '';
	for(var i = 0 ; i < array.length ; i++) {
		r += "'"+array[i]+"',";
	}
	if(r.length > 1) {
		r = r.substring(0,r.length - 1);
	}
	return r;
}
*/
function splitUrl(urlParam) {
	urlParam = urlParam.substring(1, urlParam.length);
	var result = new Array();
	var count = 0;
	var paramArray = urlParam.split("&");
	if (paramArray.length < 1)
		return null;
	for ( var i = 0; i < paramArray.length; i++) {
		if (paramArray[i] == null || paramArray[i] == "") {
			continue;
		}
		result[count] = paramArray[i];
		count++;
	}
	return result;
}

var Url = {
	// public method for url encoding
	encode : function(string) {
		return escape(this._utf8_encode(string));
	},
	// public method for url decoding
	decode : function(string) {
		return this._utf8_decode(unescape(string));
	},
	// private method for UTF-8 encoding
	_utf8_encode : function(string) {
		string = string.replace(/\r\n/g, "\n");
		var utftext = "";
		for ( var n = 0; n < string.length; n++) {
			var c = string.charCodeAt(n);
			if (c < 128) {
				utftext += String.fromCharCode(c);
			} else if ((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			} else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
		}
		return utftext;
	},
	// private method for UTF-8 decoding
	_utf8_decode : function(utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;
		while (i < utftext.length) {
			c = utftext.charCodeAt(i);
			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			} else if ((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i + 1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			} else {
				c2 = utftext.charCodeAt(i + 1);
				c3 = utftext.charCodeAt(i + 2);
				string += String.fromCharCode(((c & 15) << 12)
						| ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}
		}
		return string;
	}
}
function escapeChart(chr){
	if(chr.indexOf("%")>-1){
		chr = chr.replace("%","%25");
	}
	if(chr.indexOf("&")>-1){
		chr = chr.replace("&","%26");
	}
	if(chr.indexOf("+")>-1){
		//chr = chr.replace("+","");
	}
	return chr;
}

function openAnalysisWindow(url) {
	newWindow(url);	
}	

var _analysisWinName= new Date().getTime();

function newWindow(url){
	var option = "height=" + screen.availHeight + ",width="+screen.availWidth 
		+ ",left=0,top=0,status=yes,resizable=no,toolbar=no,menubar=no,location=no,scrollbars=yes";
	 
	option = "left=0,top=0,status=yes,resizable=no,toolbar=no,menubar=no,location=no,scrollbars=yes";
	var newWindow = window.open(url,_analysisWinName,option,false);
	_analysisWinName++;
	newWindow.resizeTo(window.screen.availWidth,window.screen.availHeight);
	//window.location = "../analyser?dsn=" + dsn + "&cn=" + cubeName;	
}

function newDialog(dsn,cubeName){
	var option = "dialogHeight:" + screen.availHeight + "px;dialogWidth:"+screen.availWidth 
		+ "px;status:yes;resizable:yes;";
	
	//showModalDialog("analyser?dsn=" + dsn + "&cn=" + cubeName,"",option);
	showModalDialog(url,"",option);
}

function FindParentElement(element, tagName)
{
	while(element != null && element.tagName != tagName )
	{
		element = element.parentElement;
	}
	if ( element != null && element.tagName == tagName )
	{
		return element;
	}
	return null;
}

function FindChildElement(element, tagName)
{
	var isFounded = false;
	var elements = element;
	var result = element;
	if ( element.tagName == tagName )
	{
		return element;
	}
	while(!isFounded && elements != null && result != null && result.tagName != tagName)
	{
		elements = elements.childNodes;
		for( var i=0 ; elements != null && i < elements.length ; i++ )
		{
			result = elements.item(i);
			var result2 = FindChildElement(result, tagName);
			if ( result == null || result2 == null )
			{
				continue;
			}
			if ( result.tagName == tagName || result2.tagName == tagName )
			{
				if ( result2.tagName == tagName )
				{
					result = result2;
				}
				isFounded = true;
				break;
			}
		}
	}
	if ( isFounded )
	{
		return result;
	}
	else
	{
		return null;
	}
}

function titleCheck(obj)
{ 
  var table = getContainer(obj,'TABLE');
  var inputs = table.all.tags('INPUT');
  for(var i=0;i<inputs.length;i++)
  {
    if (inputs[i] != obj)
    {
		inputs[i].checked = obj.checked;
    }
  }
}
function itemCheck(obj)
{
	var table =  getContainer(obj,'TABLE');
	var inputs = table.all.tags('INPUT');
	var allchecked = true;
	var tc;
	for(var i=0;i<inputs.length;i++)
	{
		if(inputs[i].id == "titlecheck") {
			tc = inputs[i];
		}
		if (inputs[i].id != "titlecheck" && inputs[i] != obj)
		{
			if (!inputs[i].checked)
			{
				//alert(inputs[i].id);
				allchecked = false;
				break;
			}
		}
	}
	tc.checked = (allchecked && obj.checked);
}

function checkCanMoveOrDel(obj,requiredCheckText)
{
	var value = getValues(obj);
	if (value == -1 || value == "")
	{
		alert(requiredCheckText);
		return "";
	}
	return value;
}

function getValues(obj,noItem)
{
	var span = FindParentElement(obj,'TABLE');
	var trs = span.all.tags("TR");
	var tr ;
	var list = new Array();
	for(var i=0;i<trs.length;i++)
	{
		if(trs[i].user_type == null)
		{
			tr = trs[i];
			var input = FindChildElement( tr,"INPUT");
			if(input != obj  && input.checked) {
				list.push(input.value);
			}
		}
	}
	var ids = "";
	if(list.length > 0) {
		ids = arrayToString(list);
	}
	return ids;
}

function isSafeString(str){
	var invChars = ['&','?','\\','$','@',':','"','\'','{','}','[',']','%','-','=','+','\"','—'];
	for(var i=0;i<invChars.length;i++){
		if( str.indexOf(invChars[i]) >= 0){
			return false;
		}
	}
	return true;
}

function isNumber(str){
	if(str.match(/^\d+$/) != null)
		return true;
	else
		return false;
}

function isDoubleNumber(str){
	if(str.match(/^(-)?\d+(\.\d+)?$/) != null)
		return true;
	else
		return false;
}

function isFormatDate(str){
	if(str.match(/^\d{4}-\d{2}-\d{2}$/) != null)
		return true;
	else
		return false;
}

function showDialog(url,title,iWidth,iHeight,params) {
	if(window.showModalDialog) {
		var sFeatures="dialogHeight:"+iHeight+"px;dialogWidth:"+iWidth+"px;location=no;center:true;status:no;resizable:yes;";//
		showModalDialog(url, params,  sFeatures);
	} else {
		var iTop = window.screen.availHeight == iHeight ? 0 : (window.screen.availHeight - 30 - iHeight) / 2;
		var iLeft = window.screen.availWidth == iWidth ? 0 : (window.screen.availWidth - 10 - iWidth) / 2;
		var sFeatures="width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft +",toolbar=no, menubar=no,location=no,center=true,status=no,resizable=yes";//
		window.paramsToDialog = params;
		open(url,title,sFeatures);
	}
}