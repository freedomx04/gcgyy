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
<title>企业风</title>
</head>
<body class="">
	<div class="pagebanner" style="height:35px">
		<div class="bannertitle">
			<div class="titlebg">
				<div class="tit" style="">企业风</div>
			</div>
		</div>
	</div>
	<div id="content" style="padding-left:15px;padding-right:15px;">
		<h4 class="dynamicinfo-title"></h4>
		<div class="enterpriseinfo" style="font-size: 14px;"></div>
	</div>
	<script type="text/javascript">
		;(function($) {
			var type = parseInt($k.util.getRequestParam("type"));
			var id = $k.util.getRequestParam("id");
			var $content = $("#content");
			
			$.ajax({
				url: "../enterprise/detail",
				type: "POST",
				data: {
					enterpriseId: id,
				},
				success: function(data) {
					if(data.status == 0) {
						$content.find(".dynamicinfo-title").text(data.data.name);
						//$content.find("#enterpriseinfo").text(data.data.introduction);
					}
				},
				error: function() {}
			});
		})(jQuery);
	</script>
</body>
</html>
