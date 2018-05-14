<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>企业详情</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/lazyimg.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<style type="text/css">
		.weui-weixin-content .hm-weixin-title {
			margin-bottom: 6px;
		}
	</style>
	
</head>

<body class="wx-enterprise-info">
	<div class="weui_tab enterprise-info-tab">
		<div class="weui_tab_nav" style="padding: 10px 20px;">
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="0">企业信息</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="1">企业产品</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="2">企业新闻</a>
		</div>
		
		<div>
			<div class="weui_tab_bd_item weui_tab_bd_item_active">
				<div class="weui-weixin-ui">
					<div class="weui-weixin-page">

						<h2 class="weui-weixin-title">${enterprise.name}</h2>
						
						<div class="weui-weixin-img weui-updown">
					    	<img src="${img}" data-src="${ctx}/${enterprise.imagePath}" class="weixin">
					    </div>
						
						<div class="weui-weixin-content">
							<p class="hm-weixin-title">主营产品</p>
							<p class="hm-weixin-content">${enterprise.mainProduct}</p>
							
							<p class="hm-weixin-title">企业地址</p>
							<p class="hm-weixin-content">${enterprise.address}</p>
							
							<p class="hm-weixin-title">联系电话</p>
							<p class="hm-weixin-content">${enterprise.telephone}</p>
						</div>
					
					    <div class="weui-weixin-content">
							<p class="hm-weixin-title">企业简介</p>
							<p class="hm-weixin-content">${enterprise.introduction}</p>
						</div>
					
					</div>
				</div>			
			</div>
			
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty enterprise.products}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="product" items="${enterprise.products}">
						<a href="javascript:;" class="weui_cell product-info" data-product-id="${product.id}">
							<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">
								<img src="${icon}" data-src="${ctx}/${product.imagePath}" style="width: 80px; display: block;">
							</div>
							<div class="weui_cell_bd">
								<p>${product.name}</p>
								<p class="introduction" style="font-size: 13px; color: #999">${product.introduction}</p>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
			
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty enterprise.newsList}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="news" items="${enterprise.newsList}">
						<a href="javascript:;" class="weui_cell news-info" data-news-id="${news.id}">
							<div class="weui_cell_bd">
								<p style="font-size: 16px; margin-bottom: 8px;">${news.title}</p>
								<p style="font-size: 13px; color: #999"><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd"/></p>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
			
		</div>
		
	</div>

	<script type="text/javascript">
	$(function() {
		
		var $page = $('.wx-enterprise-info');
		
		$k.util.subText($('.introduction'), 36);
		$k.util.lazyLoadImg('.weui-updown [data-src]');
		
		var defaultIndex = Url.queryString("index");
		if (!defaultIndex) {
			defaultIndex = 0;
		}
		$page.find('.enterprise-info-tab').tab({
			defaultIndex: defaultIndex,
			activeClass: 'bg_green'
		});
		
		$page
		.on('click', '.product-info', function() {
			var productId = $(this).data('productId');
			window.location = '${ctx}/wx/enterprise/product?productId=' + productId;
		})
		.on('click', '.news-info', function() {
			var newsId = $(this).data('newsId');
			window.location = '${ctx}/wx/enterprise/news?newsId=' + newsId;
		})
		.on('click', '.weui_navbar_item', function() {
			var index = $(this).data('index');
			Url.updateSearchParam("index", index);
		});
		
	});
	</script>

</body>

</html>