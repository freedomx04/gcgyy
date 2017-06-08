<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>企业产品</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/lazyimg.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<style type="text/css">
		.weui-weixin-content .hm-weixin-title {
			margin-bottom: 6px;
		}
		.weui-weixin-content .hm-weixin-content {
			font-size: 14px;
		}
	</style>
	
</head>

<body>
	<div class="weui-weixin_ui">
	
		<div class="weui-weixin-img weui-updown" style="margin-bottom: 0;">
			<img src="${img}" data-src="${ctx}/${product.imagePath}" class="weixin">
		</div>
	
		<div class="weui-weixin-page">
			<h2 class="weui-weixin-title">${product.name}</h2>
			
			<div class="weui-weixin-info">
				<a class="weui-weixin-a enterprise-info" href="javascript:;" data-enterprise-id="${product.enterprise.id}">${product.enterprise.name}</a>
			</div>
			
			<div class="weui-weixin-content">
				<p class="hm-weixin-title">规格参数</p>
				<p class="hm-weixin-content">${product.specification}</p>
			
				<p class="hm-weixin-title">产品介绍</p>
				<p class="hm-weixin-content">${product.introduction}</p>
				
				<p class="hm-weixin-title">联系电话</p>
				<p class="hm-weixin-content">${product.telephone}</p>
			</div>
			
		</div>
		
		
	</div>
	
	<script type="text/javascript">
	$(function() {
		
		$k.util.lazyLoadImg('.weui-updown [data-src]');
		
		$('.weui-weixin-page').on('click', '.enterprise-info', function() {
			var enterpriseId = $(this).data('enterpriseId');
			window.location = '${ctx}/wx/enterprise/get?enterpriseId=' + enterpriseId;
		});
		
	});
	</script>
    
</body>
</html>