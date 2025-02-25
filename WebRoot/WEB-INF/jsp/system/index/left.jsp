<div id="sidebar" class="	sidebar      h-sidebar                navbar-collapse collapse          ace-save-state"><!--  menu-min -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
					<div class="sidebar-shortcuts" id="sidebar-shortcuts" style="min-height: 38px;">
					<div class="sidebar-shortcuts-large" style="text-align: left;padding-left: 12px;background-color:#737373" id="liebiao">
						<span class="iconfont icon-liebiao" style="font-size:15px;-webkit-text-stroke-width:0;"><span id="currentMenuName">${menuList[0].title}</span></span>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="iconfont icon-liebiao sidebar-toggle sidebar-collapse" style="font-size:15px;-webkit-text-stroke-width:0;"></span>
						<!--<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>-->
					</div>
				</div>

				<ul class="nav nav-list" id="searchMu">

					<c:forEach items="${menuList[0].childNodeList}" var="menu">
					<li class="hover" id="n${menu.id }">
						<a style="cursor:pointer;"
						   <c:if test="${not empty menu.url && '#' != menu.url}">target="mainFrame" onclick="siMenu('z${menu.id }','lm${menu.id }','${menu.title }','${menu.url }')"</c:if>
								<c:if test="${null != menu.childNodeList}"> class="dropdown-toggle"</c:if>>
							<i class="${menu.icon == null ? 'menu-icon fa fa-leaf black' : menu.icon} "></i>
							<span class="menu-text"> ${menu.title }</span>
							<c:if test="${null != menu.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
						</a>
						<b class="arrow"></b>
						<c:if test="${null != menu.childNodeList}">
						<ul class="submenu can-scroll">
							<c:forEach items="${menu.childNodeList}" var="menu1">
							<li class="hover" id="n${menu1.id }">
								<a style="cursor:pointer;"
								   <c:if test="${not empty menu1.url && '#' != menu1.url}">target="mainFrame" onclick="siMenu('z${menu1.id }','lm${menu1.id }','${menu1.title }','${menu1.url }')"</c:if>
										<c:if test="${null != menu1.childNodeList}"> class="dropdown-toggle"</c:if>>
									<i class="${menu.icon == null ? 'menu-icon fa fa-leaf black' : menu1.icon} "></i>
									<span class="menu-text"> ${menu1.title }</span>
									<c:if test="${null != menu1.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
								</a>
								<b class="arrow"></b>
								<c:if test="${null != menu1.childNodeList}">
								<ul class="submenu can-scroll">
									<c:forEach items="${menu1.childNodeList}" var="menu2">
									<li class="hover" id="n${menu2.id }">
										<a style="cursor:pointer;"
										   <c:if test="${not empty menu2.url && '#' != menu2.url}">target="mainFrame" onclick="siMenu('z${menu2.id }','lm${menu2.id }','${menu2.title }','${menu2.url }')"</c:if>
												<c:if test="${null != menu2.childNodeList}"> class="dropdown-toggle"</c:if>>
											<i class="${menu2.icon == null ? 'menu-icon fa fa-leaf black' : menu2.icon} "></i>
											<span class="menu-text"> ${menu2.title }</span>
											<c:if test="${null != menu2.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
										</a>
										<b class="arrow"></b>
										<c:if test="${null != menu2.childNodeList}">
										<ul class="submenu can-scroll">
											<c:forEach items="${menu2.childNodeList}" var="menu3">
											<li class="hover" id="n${menu3.id }">
												<a style="cursor:pointer;"
												   <c:if test="${not empty menu3.url && '#' != menu3.url}">target="mainFrame" onclick="siMenu('z${menu3.id }','lm${menu3.id }','${menu3.title }','${menu3.url }')"</c:if>
														<c:if test="${null != menu3.childNodeList}"> class="dropdown-toggle"</c:if>>
													<i class="${menu3.icon == null ? 'menu-icon fa fa-leaf black' : menu3.icon} "></i>
													<span class="menu-text"> ${menu3.title }</span>
													<c:if test="${null != menu3.childNodeList}"><b class="arrow fa fa-angle-down"></b></c:if>
												</a>
												<b class="arrow"></b>
												</c:forEach>
										</ul>
										</c:if>
										</c:forEach>
								</ul>
								</c:if>
								</c:forEach>
						</ul>
						</c:if>
						</c:forEach>
				</ul><!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<!-- <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse" style="display:none;">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>  -->

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
				<script type="text/javascript">
					// console.log(${menuList});
					function queryTree(){
						var searchMenu = $.trim($("#nav-search-input").val());
						if(searchMenu!=null && searchMenu !="" && searchMenu !="搜索..."){
							$('#searchMu').find('li').each(function(){
								if(($(this).text()).indexOf(searchMenu)>-1){
									console.log($(this).html()+"....");
									this.focus();
								} else {
									$(this).blur();
								}
							})
						}
					}
				</script>
			</div>