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
<style>
.loadli .title {
    font-size: 1.2em;
    padding: 0 0 5px;
}
#loading {
	color: #8e8e8e;
}
</style>
<body>
	<div id="container">
		<div class="pagebanner">
			<img src="">
			<div class="bannertitle">
				<div class="titlebg">
					<div class="tit"></div>
				</div>
			</div>
		</div>
		<div id="mo-list-wrapper">
			<ul class="mo-list picinfo">
			</ul>
		</div>
	</div>
	
	<script type="text/javascript">
	var pagenum = -1;
	var $container = $("#container");
		;(function($) {
			var type = parseInt($k.util.getRequestParam("type"));
			var url = "../dynamic/listByTypePaging";
			var bgsrc = "../img/wx/bg01.jpg";
			
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
			case 4:
				title = "企业风";
				url = "../enterprise/listPaging";
				bgsrc = "../img/wx/bg02.png";
				break;
			case 5:
				title = "好产品";
				url = "../enterprise/product/listAllPaging";
				bgsrc = "../img/wx/bg03.png";
				break;
			}
			
			$(document).attr("title", title);
			$container.find(".pagebanner .tit").text(title);
			$container.find(".pagebanner").find("img").attr("src", bgsrc);
			
			getMore(type, url);
			
			$container.on("click", "#loading", function() {
				$container.find("#loading").text("加载中...");
				getMore(type, url);
			});
		})(jQuery);
		
		function getMore(type, url) {
			pagenum = pagenum + 1;
			$.ajax({
				url: url,
				type: "POST",
				data: {
					type: type,
					page: pagenum,
					size: 12
				},
				success: function(data) {
					if(data.status == 0) {
						$container.find("#loadli").remove();
						if(data.data.length <= 0) {
							return;
						}
						$.each(data.data, function(key, val) {
							var title = val.title;
							var desc = (val.createTime == null ? "" : $k.util.getDateString2(val.createTime));
							var linkPath = '../m/dynamicinfo?id='+ val.id + '&type=' + type;
							var html = "";
							switch(type) {
							case 0: case 1: case 2:
								html = '<li class="noimg-item"><a href="../m/dynamicinfo?id='+ val.id +'&type='+ type +'">'+
									'<div class="title">'+ title +'</div>'+
									'<div class="time">'+ desc +'</div></a>'+
								'</li>';
								$(html).appendTo($container.find(".mo-list"));
								return;
							case 4:
								title = val.name;
								desc = (val.introduction == null ? "" : val.introduction);
								linkPath = '../m/enterpriseinfo?id='+ val.id;
								break;
							case 5:
								title = val.name;
								desc = val.enterprise.name;
								linkPath = '../m/productinfo?id='+ val.id;
								break;
							}
							html = '<li><a href="'+ linkPath +'">'+
								'<div class="pic">'+
									'<img src="../'+ (val.imagePath || './img/wx/empty_default.jpg') +'" height="100%">'+
								'</div>'+
								'<div class="title">'+ title +'</div>'+
								'<div class="time">'+ desc +'</div></a>'+
							'</li>';
							$(html).appendTo($container.find(".mo-list"));
						});
						if(pagenum != 0 || data.data.length >= 12) {
							$('<li id="loadli">'+
									'<div class="title" style="padding-top: 5px;text-align: center;">'+
									'<span id="loading">加载更多...</span>'+
								'</div></li>').appendTo($container.find(".mo-list"));
						}
					}
				},
				error: function() {}
			});
		}
	</script>
</body>
</html>
