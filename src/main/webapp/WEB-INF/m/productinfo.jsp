<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<script src="../js/jquery/1.10.1/jquery.js"></script>
<script src="../js/base/base.js"></script>
<script src="../js/base/constant.js"></script>
<script src="../js/base/utils.js"></script>
<link rel="stylesheet" type="text/css" href="../css/wx.css">
<title>好产品</title>
</head>
<style>
#content {
	font-size: 14px;
}
table {
	border-collapse: separate;
	border-spacing: 10px;
}
.item-name {
	color: #aaa;
}
.item-detail {
	word-break:break-all;
}
.item-detail#product-name {
	color: #06c; 
	font-size: 1.5rem;
}
#content td {
	min-width: 120px;
}
</style>
<body class="">
	<div class="pagebanner" style="height:35px">
		<div class="bannertitle">
			<div class="titlebg">
				<div class="tit" style="">好产品</div>
			</div>
		</div>
	</div>
	<div id="content" style="padding-left:15px;padding-right:15px;">
		<table style="width: 85%; margin: 0 auto;"> 
			<tbody>
				<tr>  
					<td><img id="product-img" src="" style="max-width: 180px; max-height: 180px;"></td>
				</tr> 
				<tr class="item"> 
					<td><span class="item-name">产品名称：</span></td> 
					<td><span id="product-name" class="item-detail"></span></td>
				</tr> 
				<tr class="item">
					<td><span class="item-name">产品规格参数：</span></td>
					<td><span id="product-specification" class="item-detail"></span></td>
				</tr> 
				<tr class="item"> 
					<td><span class="item-name">公司名称：</span></td>
					<td><span id="product-enterprise" class="item-detail"></span></td>
				</tr> 
				<tr class="item"> 
					<td><span class="item-name">产品介绍：</span></td>
					<td><span id="product-introduction" class="item-detail"></span></td> 
				</tr>
			</tbody> 
		</table>
		
	</div>
	<script type="text/javascript">
		;(function($) {
			var type = parseInt($k.util.getRequestParam("type"));
			var id = $k.util.getRequestParam("id");
			var $content = $("#content");
			
			$.ajax({
				url: "../enterprise/product/detail",
				type: "POST",
				data: {
					productId: id,
				},
				success: function(data) {
					if(data.status == 0) {
						$content.find("#product-img").attr("src", "../img/enterprise_default.jpg");
						$content.find("#product-name").text(data.data.name);
						$content.find("#product-specification").text(data.data.specification);
						$content.find("#product-enterprise").text(data.data.enterprise.name);
						$content.find("#product-introduction").text(data.data.introduction);
					}
				},
				error: function() {}
			});
		})(jQuery);
	</script>
</body>
</html>
