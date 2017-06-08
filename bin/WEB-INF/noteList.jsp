<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>广昌工业</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
<%@ include file="/WEB-INF/template/dynamic_menu.jsp"%>
<%@ include file="/WEB-INF/template/dynamic_all.jsp"%>
<%@ include file="/WEB-INF/template/noteInfo.jsp"%>
<%@ include file="/WEB-INF/template/top.jsp"%>
<%@ include file="/WEB-INF/template/footer.jsp"%>
<link rel="stylesheet" href="css/portal.css" type="text/css"/>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="./img/favicon.ico" type="image/x-icon" />
</head>
<body style="height: 100%; margin: 0 auto; min-width: 1024px; width: 1024px; padding: 0; font-size: 14px; color: #686868;">
	<div class="portal noteList" style="height: 200px;">
		<div class="top"></div>
		
		<div id="position">
			<span>当前位置： </span>
			<a href="./">首页</a>/
			<a class="weizhi" href="#"></a>
		</div>
		<div class="float-left" style="display: none;">
			<div class="news border" style="margin: 0; float: initial;">
				<div class="news_menu" type="3">
					<ul>
						<li class="float-left" style="width: 80px;">图片新闻</li>
						<li class="more"><a href="./noteList?type=3" target="_blank">更多</a></li>
					</ul>
				</div>
				<div class="news-list"></div>
			</div>
			<div class="announce border" style="float: initial;">
				<div class="announce_menu" type="0">
					<ul>
						<li class="float-left" style="width: 80px;">公示公告</li>
						<li class="more"><a href="./noteList?type=0" target="_blank">更多</a></li>
					</ul>
				</div>
				<div class="announce-list"></div>
			</div>
			<div class="policy border" style="margin: 0; float: initial;">
				<div class="policy_menu" type="1">
					<ul>
						<li class="float-left" style="width: 80px;">政策法规</li>
						<li class="more"><a href="./noteList?type=1" target="_blank">更多</a></li>
					</ul>
				</div>
				<div class="policy-list"></div>
			</div>
			<div class="overview  border" style="margin: 0; float: initial;">
				<div class="overview_menu" type="2">
					<ul>
						<li class="float-left" style="width: 80px;">工业信息</li>
						<li class="more"><a href="./noteList?type=2" target="_blank">更多</a></li>
					</ul>
				</div>
				<div class="overview-list"></div>
			</div>
		</div>
		
		<div class="list-all" style="margin-top: 20px;">
		</div>
		
		<div style="clear:both;"></div>
		
		<div class="footer"></div>
	</div>
	
	<script type="text/javascript">
	;(function($) {
		
		var $page = $(".portal");
		//new $k.proto.DynamicMenu().init($page.find(".announce-list")).draw(0);
		//new $k.proto.DynamicMenu().init($page.find(".policy-list")).draw(1);
		//new $k.proto.DynamicMenu().init($page.find(".overview-list")).draw(2);
		//new $k.proto.DynamicMenu().init($page.find(".news-list")).draw(3);
		new $k.proto.Top().init($page.find(".top")).draw();
		new $k.proto.Footer().init($page.find(".footer")).draw();
		
		var type = parseInt($k.util.getRequestParam("type"));
		var id = $k.util.getRequestParam("id");
		$page.find("[type='"+type+"']").find("li").eq(0).addClass("currNote");
		$page.find(".weizhi").text($k.constant.getDynamicType(type));
		if(id == "") {
			new $k.proto.DynamicAll().init($page.find(".list-all"), type).draw();
		} else {
			if(type == 4) {
				$page.find(".weizhi").html("重要新闻");
			}
			new $k.proto.NoteInfo().init($page.find(".list-all")).draw(id);
		}
		
		$page.find(".portal_slide").slideBox({
			duration: 0.5,	//滚动持续时间，单位：秒
			easing: 'linear',	//swing,linear//滚动特效
			delay: 5,	//滚动延迟时间，单位：秒
		});
		
	})(jQuery);
	</script>
</body>
</html>