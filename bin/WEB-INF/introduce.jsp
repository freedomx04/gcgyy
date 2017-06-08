<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>广昌工业</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
<%@ include file="/WEB-INF/template/top.jsp"%>
<%@ include file="/WEB-INF/template/footer.jsp"%>
<%@ include file="/WEB-INF/template/product_all.jsp"%>
<%@ include file="/WEB-INF/template/enterprise_all.jsp"%>
<%@ include file="/WEB-INF/template/hire_all.jsp"%>
<%@ include file="/WEB-INF/template/hireInfo.jsp"%>
<%@ include file="/WEB-INF/template/productInfo.jsp"%>
<%@ include file="/WEB-INF/template/areaIntroduce.jsp"%>
<%@ include file="/WEB-INF/template/enterpriseInfo.jsp"%>
<link rel="stylesheet" href="css/portal.css" type="text/css"/>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="./img/favicon.ico" type="image/x-icon" />
</head>
<body style="height: 100%; margin: 0 auto; min-width: 1024px; width: 1024px; padding: 0; font-size: 14px; color: #686868;">
	<div class="portal introduce" style="height: 200px;">
		<div class="top"></div>
		
		<div id="position">
			<span>当前位置： </span>
			<a href="./">首页</a>/
			<a class="weizhi" href="#">园区介绍</a>
		</div>
		
		<div class="jieshao">
			<div class="introduce_left float-left">
				<ul style="border-right: 1px #CCC solid;padding-bottom:100px;">
					<!-- <li class="introduce_menu introduce_area"><img src="./img/area_menu.png" width="150" height="40"></li> -->
					<li class="introduce_menu introduce_enterprise"><img src="./img/enterprise_menu.png" width="150" height="40"></li>
					<li class="introduce_menu introduce_hire"><img src="./img/hire_menu.png" width="150" height="40"></li>
					<li class="introduce_menu introduce_product"><img src="./img/product_menu.png" width="150" height="40"></li>
				</ul>
			</div>
			<div class="jieshao_right"></div>
		</div>
		
		<div style="clear:both;"></div>
		
		<div class="footer">
		</div>
	</div>
	
	<script type="text/javascript">
	;(function($) {
		
		var $page = $(".portal");
		new $k.proto.Top().init($page.find(".top")).draw();
		new $k.proto.Footer().init($page.find(".footer")).draw();
		var $right = $page.find(".jieshao_right");
		
		$page.find(".introduce_left")
		.on("click", ".introduce_area", function() {
			$right.html("");
			$page.find(".weizhi").text("平台介绍");
			new $k.proto.AreaIntroduce().init($page.find(".jieshao_right")).draw();
		})
		.on("click", ".introduce_enterprise", function() {
			$right.html("");
			$page.find(".weizhi").text("企业宣传");
			new $k.proto.EnterpriseAll().init($page.find(".jieshao_right")).draw();
		})
		.on("click", ".introduce_hire", function() {
			$right.html("");
			$page.find(".weizhi").text("招聘信息");
			new $k.proto.HireAll().init($page.find(".jieshao_right")).draw();
		})
		.on("click", ".introduce_product", function() {
			$right.html("");
			$page.find(".weizhi").text("产品宣传");
			new $k.proto.ProductAll().init($page.find(".jieshao_right")).draw();
		});
		
		var type = parseInt($k.util.getRequestParam("type"));
		var id = parseInt($k.util.getRequestParam("id"));
		switch (type) {
		case 1:
			$page.find(".weizhi").text("平台介绍");
			new $k.proto.AreaIntroduce().init($page.find(".jieshao_right")).draw();
			break;
		case 2:
			$page.find(".weizhi").text("企业宣传");
			new $k.proto.EnterpriseAll().init($page.find(".jieshao_right")).draw();
			break;
		case 3:
			$page.find(".weizhi").text("招聘信息");
			new $k.proto.HireAll().init($page.find(".jieshao_right")).draw();
			break;
		case 4:
			$page.find(".weizhi").text("招聘信息");
			new $k.proto.HireInfo().init($page.find(".jieshao_right")).draw(id);
			break;
		case 5:
			$page.find(".weizhi").text("企业信息");
			new $k.proto.EnterpriseInfo().init($page.find(".jieshao_right")).draw(id);
			break;
		case 6:
			$page.find(".weizhi").text("产品宣传");
			new $k.proto.ProductAll().init($page.find(".jieshao_right")).draw().load(0);
			break;
		case 7:
			$page.find(".weizhi").text("产品信息");
			new $k.proto.ProductInfo().init($page.find(".jieshao_right")).draw(id);
			break;
		default:
			break;
		}
		
		/* if(type == 1) {
			$page.find(".weizhi").text("平台介绍");
			new $k.proto.AreaIntroduce().init($page.find(".jieshao_right")).draw();
		} else if(type == 2) {
			$page.find(".weizhi").text("企业宣传");
			new $k.proto.EnterpriseAll().init($page.find(".jieshao_right")).draw();
		} else if(type == 3) {
			$page.find(".weizhi").text("招聘信息");
			new $k.proto.HireAll().init($page.find(".jieshao_right")).draw();
		} else if(type == 4) {
			$page.find(".weizhi").text("招聘信息");
			new $k.proto.HireInfo().init($page.find(".jieshao_right")).draw(id);
		} else if(type == 5) {
			$page.find(".weizhi").text("企业信息");
			new $k.proto.EnterpriseInfo().init($page.find(".jieshao_right")).draw(id);
		} else if(type == 6) {
			$page.find(".weizhi").text("产品宣传");
			new $k.proto.ProductAll().init($page.find(".jieshao_right")).draw();
		} else if(type == 7) {
			$page.find(".weizhi").text("产品信息");
			new $k.proto.ProductInfo().init($page.find(".jieshao_right")).draw(id);
		} */
		
	})(jQuery);
	</script>
</body>
</html>