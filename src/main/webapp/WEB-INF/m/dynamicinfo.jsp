<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<script src="../js/jquery/1.10.1/jquery.js"></script>
<script src="../js/date/date.format-1.2.3.js"></script>
<script src="../js/date/date.js"></script>
<script src="../js/base/base.js"></script>
<script src="../js/base/constant.js"></script>
<script src="../js/base/utils.js"></script>
<link rel="stylesheet" type="text/css" href="../css/wx.css">
<title></title>
</head>
<script>
	function changeFrameHeight(){
		var ifm = document.getElementById("articleIframe");  
        var subWeb = document.frames ? document.frames["articleIframe"].document : ifm.contentDocument;  
        if (ifm != null && subWeb != null) {  
            ifm.height = subWeb.body.scrollHeight;  
        }  
        $("iframe img").css("width", "100%");
	 }
</script>
<body class="">
	<div class="pagebanner" style="height:35px">
		<div class="bannertitle">
			<div class="titlebg">
				<div class="tit" style=""></div>
			</div>
		</div>
	</div>
	<div id="content" style="padding-left:15px;padding-right:15px;">
		<h4 class="dynamicinfo-title"></h4>
		<div class="dynamicinfo-time"></div>
		<iframe id="articleIframe" src="" width="100%"  onload="changeFrameHeight()" frameborder="no" border="0" marginwidth="0" 
			marginheight="0" scrolling="auto" allowtransparency="yes"></iframe>
	</div>
	<script type="text/javascript">
		;(function($) {
			var type = parseInt($k.util.getRequestParam("type"));
			var id = $k.util.getRequestParam("id");
			var	title = "";
			var $content = $("#content");
			
			switch(type) {
			case 0:
				title = "公示公告";
				break;
			case 1:
				title = "政策法规";
				break;
			case 2:
				title = "工业信息";
				break;
			case 3: 
				title = "最新动态";
				break;
			}
			
			$(document).attr("title", title);
			$(".pagebanner .tit").text(title);
			
			$.ajax({
				url: "../dynamic/detail",
				type: "POST",
				data: {
					dynamicId: id,
				},
				success: function(data) {
					if(data.status == 0) {
						$content.find(".dynamicinfo-title").text(data.data.title);
						$content.find(".dynamicinfo-time").text(data.data.createTime == null ? "" : $k.util.getDateString2(data.data.createTime));
						
						var $iframe = $content.find("#articleIframe");
						$iframe.attr("src", "../" + data.data.linkPath);
						$iframe.load(function() {
							$($iframe.prop('contentWindow').document).find('img').attr('width', '100%');
						});
					}
				},
				error: function() {}
			});
		})(jQuery);
	</script>
</body>
</html>
