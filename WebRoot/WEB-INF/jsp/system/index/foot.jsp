		<%
			String pathf = request.getContextPath();
			String basePathf = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ pathf + "/";
		%>
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=basePathf%>static/js/jquery-3.1.1.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='<%=basePathf%>static/ace/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<%=basePathf%>static/ace/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="static/ace/js/bootstrap.js"></script>
		<script src="static/js/common/dict.js"></script>
		<script src="static/js/jquery.form.js"></script>