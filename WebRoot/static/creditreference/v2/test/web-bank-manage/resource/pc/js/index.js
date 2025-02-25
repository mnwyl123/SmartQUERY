// function colorbg(colorbg){
// 	console.log(colorbg)
// 	$(".page").css("background",colorbg)
// }
// function newasp_fontsize(nums,masks,zooms,event){
// 	//console.log(colorbg)
// 	//$(".page").css("background",colorbg)
// 	var js_className = $(".nr").attr("class");
// 	var fontsize = "zy-"+nums;
// 	js_className  = js_className.replace(new RegExp("zy-[0-9]","g"),fontsize);
// 	$(".nr").attr("class",js_className);
// 	console.log($(event))
// 	$(event).addClass("active").siblings().removeClass("active")
// }
window.console = window.console || (function(){ 
	var c = {}; c.log = c.warn = c.debug = c.info  = c.error = c.time = c.dir = c.profile = c.clear = c.exception = c.trace = c.assert = function(){}; 
	return c; 
})(); 




(function(win,$){
	if($(".flexslider").length>0){
		$(".flexslider").slide({
			mainCell:".slides",
			effect:"leftLoop",
			autoPlay:true,
			trigger:"click",
			interTime:5000,
			delayTime:0,
			titCell:".slides-nav li",
			startFun:function( i, c, slider, titCell, mainCell, targetCell, prevCell, nextCell ){
				i= i+1;
				var data_bg = $(slider).find(".slides li").eq(i).attr("data-bg")||"#538aa8"
				slider.css({"background":data_bg})
			}
		});
	}
	if($(".small-banner").length>0){
		function images(){
			$(".small-banner img").jqthumb({
                classname: 'jqthumb',
                width: '100%',
                height: '100%',
                position: {
                    x: '50%',
                    y: '50%'
                },
                source: 'src',
                show: false,
                responsive: 10,
                zoom: 1,
                method: 'auto',
                showoncomplete : true,
                after: function (imgObj) {
                   // console.log(imgObj);
                },
                done: function (imgArray) { 
                	for (i in imgArray) { $(imgArray[i]).fadeIn();  }
                }
       		});
       	}
		images();
        $(window).resize(function () { images(); })
	}
	//验证�?
	if($.fn.GVerify){
		var verifyCode = $("#js_GVerify").GVerify();
		var verifySmsCode = $("#js_smsCode").GVerify({
			type:"sms",
			link:"http://www.xxx.com/smscode"
		})
	}
	if($(".left-list a").length>0){
		$(".left-list a").on("click",function(){
			var datanum = $(this).attr("data-num");
			var js_className = $(".nr").attr("class");
			var fontsize = "zy-"+datanum;
			js_className  = js_className.replace(new RegExp("zy-[0-9]","g"),fontsize);
			$(".nr").attr("class",js_className);
			
			$(this).addClass("active").siblings().removeClass("active")
		})
	}
	if($(".right-list a").length>0){
		$(".right-list a").on("click",function(){
			var databg = $(this).attr("data-bg");
			$(".list-main").css("background",databg)
		})
	}
		
	//verifySmsCode.stop();
})(window,jQuery||window.jQuery);