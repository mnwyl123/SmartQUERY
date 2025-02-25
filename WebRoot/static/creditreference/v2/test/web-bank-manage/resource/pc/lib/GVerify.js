;(function(window, $) {
    var size = 5;//设置验证码长度
    function GVerify(options) { //创建一个验证码对象，接收options对象为参数 
        options = $.extend({},options,{"dom":this});
        return new js_GVerify(options);
    }
    function js_GVerify(params){
        var _default = { //默认options参数值
            dom: "", //容器Id
            canvasId: "verifyCanvas", //canvas的ID
            width: "100", //默认canvas宽度
            height: "30", //默认canvas高度
            type: "blend", //验证码默认类型blend:数字字母混合类型、number:纯数字、letter:纯字母、sms:短信验证码
            code: "",

            link:null,
			count:60,
            curCount:60,
            currentAjax:null,
            callback:null
		};
        var js_options = {};
        if(Object.prototype.toString.call(params) == "[object Object]"){//判断传入参数类型
            js_options = $.extend({},_default,params);
        }else{
            js_options.dom = params;
        }
        js_options = $.extend({},js_options,{
            "numArr":"0,1,2,3,4,5,6,7,8,9".split(","),
            "letterArr":getAllLetter()
        });
        var _self = this;
        this.timer = null;
        this.options = js_options;
		if(js_options.dom && js_options.dom!=null){
            if(js_options.type != "sms"){  this._initCode(); }
            else{ this._initSms();  }
        }
    } 
    js_GVerify.prototype = {
        /**版本号**/
        version: '1.0.0',
        /**初始化方法**/
        _initSms:function(){
            var that = this;
            var js_dom = $(that.options.dom);
            js_dom.bind("click",function(){
				that._send_message();
			})
        },
        _initCode: function() {
            var js_dom = $(this.options.dom);
			this.options.width = js_dom.width() > 0 ? js_dom.width() : "100";
			this.options.height = js_dom.height() > 0 ?  js_dom.height() : "30";
			js_dom.html("<canvas width='"+this.options.width+"' height='"+this.options.height+"' style='cursor:pointer'></canvas>");
            var parent = this;
            window.onload= function(){parent.refresh();};
			js_dom.on("click","canvas",function(){ parent.refresh(); });
        },
        stop:function(){
            var that = this;
            var js_options = that.options;
            var currentAjax = js_options.currentAjax;
            if(Object.prototype.toString.call(currentAjax) == "[object Object]"){
                currentAjax.abort();
                js_options = $.extend({},js_options,{
                    count:60,
                    curCount:60,
                    currentAjax:null
                });
                var js_root_dom = $(js_options.dom);
                js_root_dom.html("获取验证码");  
                that.options = js_options;
            }
        },
        _set_remain_time:function(that) {
			var options = that.options;
			var js_root_dom = $(options.dom);
			var curCount = options.curCount;
			if (curCount == 0) {                  
				clearInterval(that.timer);//停止计时器  
				js_root_dom.removeAttr("disabled");//启用按钮  
				js_root_dom.html("重新发送");  
			} else {  
				curCount--; 
				that.options.curCount =  curCount;
				js_root_dom.html(curCount + "s");  
			}
		},
		_send_message:function () {
            var that = this;
            var options = that.options;
			var js_root_dom = $(options.dom);
		　	curCount = options.count;
			var  SetRemainTime = that._set_remain_time;  
		　　//设置button效果，开始计时  
			console.log(options);
			js_root_dom.attr("disabled", "true");  
			js_root_dom.html(curCount + "s");  
			that.timer = setInterval(function(){
				SetRemainTime(that);
			}, 1000); //启动计时器，1秒执行一次  
		　　  //向后台发送处理数据  
            options.currentAjax = $.ajax({  
			　　type: "POST", //用POST方式传输  
			　　dataType: "json", //数据格式:JSON  
			　　url: options.link, //目标地址 
				cache: false,
				//async: false, 
			　　data: {}, 
			　　error: function (XMLHttpRequest, textStatus, errorThrown) { },  
			　　success: function (msg){ options.code = msg.code }  
			});  
		},
        /**生成验证码**/
        refresh: function() {
            this.options.code = "";
            var canvas = $(this.options.dom).find("canvas");
            canvas = canvas.get(0);
            if(!canvas || !canvas.getContext){return ;}
            var ctx = canvas.getContext('2d');
            ctx.textBaseline = "middle";
            ctx.fillStyle = randomColor(180, 240);
            ctx.fillRect(0, 0, this.options.width, this.options.height);

            if(this.options.type == "blend") { //判断验证码类型
                var txtArr = this.options.numArr.concat(this.options.letterArr);
            } else if(this.options.type == "number") {
                var txtArr = this.options.numArr;
            } else {
                var txtArr = this.options.letterArr;
            }

            for(var i = 1; i <=size; i++) {
                var txt = txtArr[randomNum(0, txtArr.length)];
                this.options.code += txt;
                ctx.font = randomNum(this.options.height/2, this.options.height) + 'px SimHei'; //随机生成字体大小
                ctx.fillStyle = randomColor(50, 160); //随机生成字体颜色        
                ctx.shadowOffsetX = randomNum(-3, 3);
                ctx.shadowOffsetY = randomNum(-3, 3);
                ctx.shadowBlur = randomNum(-3, 3);
                ctx.shadowColor = "rgba(0, 0, 0, 0.3)";
                var x = this.options.width / (size+1) * i;
                var y = this.options.height / 2;
                var deg = randomNum(-30, 30);
                /**设置旋转角度和坐标原点**/
                ctx.translate(x, y);
                ctx.rotate(deg * Math.PI / 180);
                ctx.fillText(txt, 0, 0);
                /**恢复旋转角度和坐标原点**/
                ctx.rotate(-deg * Math.PI / 180);
                ctx.translate(-x, -y);
            }
            /**绘制干扰线**/
            for(var i = 0; i < 4; i++) {
                ctx.strokeStyle = randomColor(40, 180);
                ctx.beginPath();
                ctx.moveTo(randomNum(0, this.options.width), randomNum(0, this.options.height));
                ctx.lineTo(randomNum(0, this.options.width), randomNum(0, this.options.height));
                ctx.stroke();
            }
            /**绘制干扰点**/
            for(var i = 0; i < this.options.width/4; i++) {
                ctx.fillStyle = randomColor(0, 255);
                ctx.beginPath();
                ctx.arc(randomNum(0, this.options.width), randomNum(0, this.options.height), 1, 0, 2 * Math.PI);
                ctx.fill();
            }
        },
        
        /**验证验证码**/
        validate: function(code){
            var code = code.toLowerCase();
            var v_code = this.options.code.toLowerCase();
            if(code == v_code){
                return true;
            }else{
                this.refresh();
                return false;
            }
        }
    };
    /**生成字母数组**/
    function getAllLetter() {
        var letterStr = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
        return letterStr.split(",");
    };
    /**生成一个随机数**/
    function randomNum(min, max) {
        return Math.floor(Math.random() * (max - min) + min);
    };
    /**生成一个随机色**/
    function randomColor(min, max) {
        var r = randomNum(min, max);
        var g = randomNum(min, max);
        var b = randomNum(min, max);
        return "rgb(" + r + "," + g + "," + b + ")";
    };
    $.fn.GVerify = GVerify;
})(window, jQuery||window.jQuery);