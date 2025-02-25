var TabOption = function () {};
TabOption.prototype = {
    containerId: "",
    pageid: "",
    cid: "",
    position: top,
    action: function (b, a) {}
};
var TabItemOption = function () {};
TabItemOption.prototype = {
    id: "tab_",
    title: "",
    url: "",
    isClosed: true
};
function TabView(f) {
    var a = {
        current: null,
        current_index: 0,
        current_page: null
    };
    var g = new TabOption();
    $.extend(g, f);
    var b = g.position == "bottom" ? "_bottom" : "";
    this.id = g.cid;
    this.pid = g.pageid;
    this.tabs = null;
    this.tabContainer = null;
    //var c = '<table class="tab_item"  id="{0}" border="0" cellpadding="0" cellspacing="0"><tr><td class="tab_item1"></td><td class="tab_item2 tab_title">{1}</td><td class="tab_item2"><div class="tab_close"></div></td><td class="tab_item3"></td></tr></table>';
	var c = '<table class="tab_item"  id="{0}" border="0" cellpadding="0" cellspacing="0"><tr style="height:34px;"><td class="tab_item2 tab_title">{1}</td><td class="tab_item2"><div class="iconfont icon-cuohao" style="font-size:8px;color:#595959;"></div></td></tr></table>';
    var h = '<div class="benma_ui_tab" id="{0}"><div class="tab_hr"></div></div>';
    var i;
    if ($("#scrollContent").attr("childScrollContent") == "true") {
        i = '<iframe id="{0}" scrolling="no" allowTransparency="true" frameborder="0" width="100%" height="100%" src="{1}"></iframe>'
    } else {
        i = '<iframe id="{0}" style="overflow-x:hidden;" allowTransparency="true" frameborder="0" width="100%" height="100%" src="{1}"></iframe>'
    }
    if (g.position == "bottom") {
        //c = '<table class="tab_item_bottom"  id="{0}" border="0" cellpadding="0" cellspacing="0"><tr><td class="tab_item1_bottom"></td><td class="tab_item2_bottom tab_title">{1}</td><td class="tab_item2_bottom"><div class="tab_close tab_close_bottom"></div></td><td class="tab_item3_bottom"></td></tr></table>';
		c = '<table class="tab_item_bottom"  id="{0}" border="0" cellpadding="0" cellspacing="0"><tr style="height:34px;"><td class="tab_item2_bottom tab_title">{1}</td><td class="tab_item2_bottom"><div class="iconfont icon-cuohao tab_close_bottom" style="font-size:8px;color:#595959;"></div></td></tr></table>';
        h = '<div class="benma_ui_tab benma_ui_tab_bottom" id="{0}"><div class="tab_hr tab_hr_bottom"></div></div>'
    }
    $("#" + g.containerId).append(h.replace("{0}", this.id));

    function e(n) {
        var p = $(n);
        var m = $(p).find(".tab_item1" + b);
        var l = $(p).find(".tab_item2" + b);
        var k = $(p).find(".tab_item3" + b);
        if (a.current == null || a.current != this) {
			if($(n).attr("id") == "tab1_index1"){ //针对主页面的样式，事件做特殊处理
			  $(p).click(function () {
                if (a.current != null) {
                    $(a.current).find(".tab_item2" + b).removeClass("tab_item2_selected" + b);
				 }
                l.addClass("tab_item2_selected" + b);
                a.current = this;
                $(a.current).find(".iconfont").removeClass("icon-cuohao");
                d($(this).attr("id"), false)
			  });
			} else {
			   $(p).mouseover(function () {
					m.addClass("tab_item1_mouseover" + b);
					l.addClass("tab_item2_mouseover" + b);
					l.parent().parent().parent().css("background-color","#ffffff").css("border-top","3px solid #1693f1");
					k.addClass("tab_item3_mouseover" + b);
					//主页样式不变
		            $("#tab1_index1").css("background-color","#eeeff0").css("border-top","3px solid #eeeff0");
              }).mouseout(function () {
            		m.removeClass("tab_item1_mouseover" + b);
            		l.removeClass("tab_item2_mouseover" + b);
            		l.parent().parent().parent().css("background-color","#eeeff0").css("border-top","3px solid #eeeff0");
            		$(a.current).css("background-color","#ffffff").css("border-top","3px solid #1693f1");//当前click的tab样式不变
            		k.removeClass("tab_item3_mouseover" + b);
            		//主页样式不变
                    $("#tab1_index1").css("background-color","#eeeff0").css("border-top","3px solid #eeeff0");
            }).click(function () {
                if (a.current != null) {
                    $(a.current).find(".tab_item1" + b).removeClass("tab_item1_selected" + b);
                    $(a.current).find(".tab_item2" + b).removeClass("tab_item2_selected" + b);
                    $(a.current).find(".tab_item3" + b).removeClass("tab_item3_selected" + b);
                    $(a.current).find(".icon-cuohao").addClass("tab_close_noselected");
					$(a.current).parent().parent().parent().find("table").css("background-color","#eeeff0");
					$(a.current).parent().parent().parent().find("table").css("border-top","3px solid #eeeff0");
                }
                /* */
                $(window.parent.document).find("#menuli").find("#li_"+$(n).attr("id")).addClass("blue2").css("font-weight","bold");
                $(window.parent.document).find("#menuli").find("#li_"+$(a.current).attr("id")).removeClass("blue2").css("font-weight","normal");
                /* */
                m.addClass("tab_item1_selected" + b);
                l.addClass("tab_item2_selected" + b);
                k.addClass("tab_item3_selected" + b);
				l.parent().parent().parent().css("border-top","3px solid #1693f1");
				l.parent().parent().parent().css("background-color","#ffffff");
                a.current = this;
                $(a.current).find(".icon-cuohao").removeClass("tab_close_noselected");
                d($(this).attr("id"), false)
            });
            var o = $(p).find(".icon-cuohao").mouseover(function () {
                $(this).addClass("tab_close_mouseover")
            }).mouseout(function () {
                $(this).removeClass("tab_close_mouseover")
            }).click(function () {
                j(p.attr("id"))
            })
			}
        }
    }
    function d(l, k) {
        if (k) {}
        if (a.current_page) {
            a.current_page.hide()
        }
        a.current_page = $("#page_" + l);
        a.current_page.show();
        g.action($("#" + l), a.current_page)
    }
    function j(o) {
        var n = $("#page_" + o);
        var k = $("#" + o);
        var ll = $(window.parent.document).find("#menuli");
        if ($(a.current).attr("id") == k.attr("id")) {
            var l = k.next();
            if (l.attr("id")) {
                $("#" + l.attr("id")).trigger("click");
                ll.find("#li_"+l.attr("id")).addClass("blue2").css("font-weight","bold");
            } else {
                var m = k.prev();
                if (m.attr("id")) {
                    $("#" + m.attr("id")).trigger("click");
                    ll.find("#li_"+m.attr("id")).addClass("blue2").css("font-weight","bold");
                }
            }
        } else {}
        ll.find("#li_"+o).remove();//关闭tab页的同时，remove相应的li标签
        n.remove();
        k.remove();
        if($.trim(ll.html()) == ""){
        	$(window.parent.document).find("#menudiv").css("display","none");
        };
    }
    this.init = function () {
        this.tabContainer = $("#" + this.id);
        this.tabs = this.tabContainer.find(".tab_item" + b);
        this.tabs.each(function () {
            e(this)
        })
    };
    this.add = function (n) {
        var m = new TabItemOption();
        $.extend(m, n);
        if ($("#" + m.id).length > 0) {
            this.activate(m.id);
            closeProgress()
        } else {
            if (m.title.length > 10) {
               m.title = m.title.substring(0, 10)
            }
            if (m.title.length < 4) {
                m.title = "&nbsp;&nbsp;" + m.title + "&nbsp;"
            }
            var k = i.replace("{0}", "page_" + m.id).replace("{1}", m.url);
            $("#" + this.pid).append(k);
            var l = c.replace("{0}", m.id).replace("{1}", m.title);
            $("#tab1_index1").after(l);
           // this.tabContainer.append(l);
            e($("#" + m.id));
            if (!m.isClosed) {
                $($("#" + m.id)).find(".icon-cuohao").hide()
            }
            this.activate(m.id)
        }
    };
	this.addZhuYe = function (n) {
        var m = new TabItemOption();
        $.extend(m, n);
        if ($("#" + m.id).length > 0) {
            this.activate(m.id);
            closeProgress()
        } else {
            var k = i.replace("{0}", "page_" + m.id).replace("{1}", m.url);
            $("#" + this.pid).append(k);
            var l = c.replace("{0}", m.id).replace("{1}", m.title);
            this.tabContainer.append(l);
            e($("#" + m.id));
            if (!m.isClosed) {
                $($("#" + m.id)).find(".icon-cuohao").hide()
            }
            this.activate(m.id)
        }
    };
    this.update = function (k) {
        var l = k.id;
        $("#" + l).find(".tab_title").html(k.title);
        $("#" + l).trigger("click");
        $("#page_" + l).attr("src", k.url)
    };
    this.activate = function (k) {
        $("#" + k).trigger("click")
    };
    this.close = function (k) {
        j(k)
    };
    this.init()
};