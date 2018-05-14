<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>企业新闻</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/lazyimg.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
</head>

<body>
	<div class="weui-weixin_ui">
		<div class="weui-weixin-page">
			<h2 class="weui-weixin-title">${bulletin.title}</h2>
			<div class="weui-weixin-info">
				<em class="weui-weixin-em"><fmt:formatDate value="${bulletin.createTime}" pattern="yyyy-MM-dd"/></em>
			</div>
			
			<div class="weui-weixin-content">${bulletin.content}</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function() {
		
		var $content = $('.weui-weixin-content');
		
		var imgs = $content.find('img');
		$.each(imgs, function(key, img) {
			var $img = $(img);
			
			$img.attr('src', '${img}');
			var src = $img.attr('data-src');
			if (src.startsWith('/')) {
				$img.attr('data-src', '${ctx}' + src);
			}
		});
		
		$k.util.lazyLoadImg('p [data-src]'); 
		
	});
	</script>
    
</body>
</html>