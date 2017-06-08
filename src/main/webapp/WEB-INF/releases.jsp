<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>广昌工业</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
<%@ include file="/WEB-INF/template/top.jsp"%>
<%@ include file="/WEB-INF/template/footer.jsp"%>
<link rel="stylesheet" href="css/portal.css" type="text/css"/>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="./img/favicon.ico" type="image/x-icon" />
</head>

<body style="height: 100%; margin: 0 auto; min-width: 1024px; width: 1024px; padding: 0; font-size: 14px; color: #686868;">
	<div class="portal" style="height: 100%;position: relative;">
		<div class="top"></div>
		<div style="margin-top: 20px;">
			<h1>变更记录</h1>
			<ul class="am-list admin-sidebar-list" id="collapase-nav-1">
				<li class="am-panel">
				    <a  class="am-margin-left-sm am-text-xl" data-am-collapse="{parent: '#collapase-nav-1', target: '#user-nav'}">
				        <div class="am-inline-block" style="font-weight: bold;">广昌互联网+工业V1.0 (2017.05.01)</div>
				    </a>
				    <div class="am-collapse" id="user-nav">
			        	<ul class="" style="list-style-type: disc;margin-left:4.5em;padding-bottom:10px;font-size:16px;">
			        		<li>新增网站首页-企业信息的搜索功能</li>
			        		<li>修改网站首页平台功能版块样式</li>
			        		<li>新增版本变更记录</li>
			        	</ul>
			    	</div>
			  	</li>
			</ul>
		</div>
		<div class="footer" style="position: absolute;bottom: 0;width: 100%;"></div>
	</div>
	
	<script type="text/javascript">
		new $k.proto.Top().init($(".top")).draw();
		new $k.proto.Footer().init($(".footer")).draw();
	</script>
</body>
</html>
