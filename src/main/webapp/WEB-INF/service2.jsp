<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
<script type="text/javascript" src="js/jquery/1.10.1/jquery.js"></script>
<script type="text/javascript" src="js/slideBox/jquery.slideBox.min.js"></script>
<link rel="stylesheet" href="js/slideBox/jquery.slideBox.css" type="text/css"/>
<link rel="stylesheet" href="css/main.css" type="text/css"/>
<link rel="stylesheet" href="css/service.css" type="text/css"/>

<title></title>
</head>
<body>
	<div id="top">
		<div class="con100px">
	      	<div class="login">
	           <a href="">&nbsp;首页</a>
	           <a id="login_div" href="javascript:void(0);">登录</a>
	           <a href="" id="registe">注册</a>
               <a id="welcom_div" style="cursor: default; text-decoration: none; display: none;"><span> | </span><span style="cursor: pointer;" href="javascript:void(0);" id="_login_out" class="">退出</span><span id="username"></span><span>欢迎您:</span></a>
	           <span id="welcome" style="display: none;"> </span>
			</div>
			<div class="topmid" id="topMenuName"><a id="navName">服务平台</a></div>
	    </div>
	</div>
	<div id="menu">
		<div class="con100px">
	        <ul>
	            <li><a href="javascript:void(0)" class="menuhover">技术服务</a></li>
	            <li><a href="javascript:void(0)">人才服务</a></li>
	            <li><a href="javascript:void(0)">资金服务</a></li>
	            <li><a href="javascript:void(0)">物流服务</a></li>
	            <li><a href="javascript:void(0)">智能制造服务</a></li>
	        </ul>
	    </div>
	</div>
	<div class="content">
		<div class="con100px">
			<div class="currentNav">
				当前位置：<a href="">首页</a>&nbsp;&gt;&nbsp;<a href="javascript:void(0);">技术服务</a>
			</div>
			<div class="banner">
				<div class="banner-left banner-left-rlzy  float-left">
					<h1>人力资源</h1>
					<ul class="sl-list">
						<li><a href="javascript:void(0);" id="fuwushenqing">服务申请</a>
						</li>
						<li><a href="javascript:void(0);" id="jinruxitong">进入系统</a>
						</li>
					</ul>
				</div>
				<div id="scoll_wraper" class="slideBox">
					<ul class="items">
						<li style='width: 690px; height: 275px'>
							<a href='' title='' target='_blank'>
								<img src="img/service/banner1.jpg">
							</a>
						</li>
						<li style='width: 690px; height: 275px'>
							<a href='' title='' target='_blank'>
								<img src="img/service/banner2.jpg">
							</a>
						</li>
						<li style='width: 690px; height: 275px'>
							<a href='' title='' target='_blank'>
								<img src="img/service/banner3.jpg">
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="about-article">
				<ul class="articleNav">
					<li class="articleNavHover"><span>服务介绍</span></li>
					<li><span>明星HR</span></li>
					<li><span>数据统计</span></li>
					<li><span>客户案例</span></li>
					<li id="serverApply"><span>服务申请</span></li>
					<li class="evaluationState"><span>评价</span></li>
				</ul>
				<div class="main-article">
					<div class="sphy-article1"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="con100px">
			<div class="foot">
				<p>广昌工业管理委员会 版权所有 - 赣ICP备042132号</p>
			</div>
		</div>
	</div>
</body>
<script>
;(function() {
	$("#scoll_wraper").slideBox({
		duration: 1,	//滚动持续时间，单位：秒
		easing: 'linear',	//swing,linear//滚动特效
		delay: 2,	//滚动延迟时间，单位：秒
		hideClickBar: true,
		effect:"fold",
		hideBottomBar: true,
	});
	var $menu = $("#menu");
	var $content = $(".content");
	$menu.on("click", "a", function() {
		$menu.find("a").removeClass("menuhover");
		$(this).addClass("menuhover");
	});
	$content.on("click", ".articleNav li", function() {
		$(this).parent().find("li").removeClass("articleNavHover");
		$(this).addClass("articleNavHover");
	});
})();
</script>
</html>