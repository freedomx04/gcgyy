<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>广昌工业</title>
	<meta name="keywords" content="广昌工业平台,广昌工业园区,广昌工信委,广昌县工信委,广昌互联网+,广昌县互联网+工业平台,广昌工业和信息化委员会">
    <meta name="description" content="广昌县互联网+工业平台">
    
    <!-- 验证网站所有权 -->
    <meta name="baidu-site-verification" content="ZcpehrubTN" />
    <meta name="360-site-verification" content="ff4d76c51f55df27217349bbd8b7a9f0" />

	<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
	<%@ include file="/WEB-INF/template/dynamic_menu.jsp"%>
	<%@ include file="/WEB-INF/template/photoNews.jsp"%>
	<%@ include file="/WEB-INF/template/top.jsp"%>
	<%@ include file="/WEB-INF/template/footer.jsp"%>
	<%@ include file="/WEB-INF/template/product_all.jsp"%>
	<link rel="stylesheet" href="css/portal.css" type="text/css"/>
	<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon" />
	<link rel="icon" href="./img/favicon.ico" type="image/x-icon" />

	<style type="text/css">
		.portal .announce, 
		.portal .policy, 
		.portal .overview {
			float: left;
			width: 500px;
			height: 270px;
			background-color: #f8f8f8;
			text-align: left;
			margin-right: 6px;
		}
		.portal .announce_menu, 
		.portal .overview_menu,
		.portal .policy_menu {
			height: 34px;
			font-size: 16px;
			color: #0692db;
			text-align: center;
			font-weight: bold;
			line-height: 34px;
			border-bottom: 1px solid #ddd;
		}
		.portal .ellipsis {
			width: 420px;
		    overflow: hidden;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    color: #686868;
		}
		.unit_slide.slideBox {
			width: 500px!important;
			height: 270px;
		}
		.download_qrcode {
			cursor: default;
		    position: relative;
		    text-align: left;
		    color: #787878;
		    background-color: #e1e1e1;
		    padding: 13px 0;
		    padding-left: 28px;
		    border-radius: 6px;
		    border: none;
		    display: inline-block;
		}
		.arrow-left:after, .arrow-left:before {
		    position: absolute;
		    top: 39%;
		    left: -10px;
		    content: "";
		    display: inline-block;
		    border-left: 9px solid transparent;
		    border-top: 9px solid transparent;
		    border-bottom: 9px solid transparent;
		}
		.arrow-left:after {
		    left: -18px;
		    border-right: 9px solid #fff;
		}
		.download_qrcode:hover {
			color: #787878!important;
		}
		.download_qrcode span {
			font-size: 18px;
    		vertical-align: middle;
		}
		.download_qrcode div {
			position: absolute;
		    bottom: -14px;
		    right: -20px;
		    width: 80px;
		    height: 80px;
		    background-color: #fff;
		    box-shadow: 0 0 15px rgba(0,0
		}
	</style>

</head>
<body style="height: 100%; margin: 0 auto; min-width: 1024px; width: 1024px; padding: 0; font-size: 14px; 
	color: #686868;">
	
	<div class="portal" style="background-color: #fff;">
		<div class="top"></div>
		
		<div class="platform">
			<table style="width: 100%; font-size: 32px; margin: 30px;">
				<tr>
					<td>
						<a href="./monitor" target="_blank">
							<img src="img/platform_monitor.png" width="54" height="62">
							<span>监测平台</span>
						</a>
					</td>							
					<td>
						<a href="#" class="assist">
							<img src="img/platform_assist.png" width="54" height="62">
							<span>帮扶平台</span>
						</a>
					</td>
					<td>
						<a class='a-service' target="_blank">
							<img src="img/platform_service.png" width="54" height="62">
							<span>服务平台</span>
						</a>
					</td>
				</tr>
			</table>			
		</div>
		
		<div class="announce-policy" style="height: 605px;">
			<div class="menu">
				<img src="img/menu_01.jpg" width="1024" height="30">
			</div>
			<div>
				<div class="main">
					<div class="unit" style="float: left; margin-right: 6px; margin-left: 10px;"></div> 
				
					<div class="announce border">
						<div class="announce_menu">
							<ul>
								<li class="float-left" style="width: 80px;">公示公告</li>
								<li class="more"><a href="./noteList?type=0" target="_blank">更多</a></li>
							</ul>
						</div>
						<div class="announce-list"></div>
					</div>
				</div>
			</div>
			
			<div class="main">
			
				<div class="policy border" style="margin-top: 20px;clear: both; margin-left: 10px;">
					<div class="policy_menu">
						<ul>
							<li class="float-left" style="width: 80px;">政策法规</li>
							<li class="more"><a href="./noteList?type=1" target="_blank">更多</a></li>
						</ul>
					</div>
					<div class="policy-list"></div>
				</div>
				
				<div class="overview border" style="margin-top: 20px;">
					<div class="overview_menu">
						<ul>
							<li class="float-left" style="width: 80px;">工业信息</li>
							<li class="more"><a href="./noteList?type=2" target="_blank">更多</a></li>
						</ul>
					</div>
					<div class="overview-list"></div>
				</div>
			</div>
		</div>
		
		<!-- <div class="platform-features" style="padding-top: 20px;">
			<div class="menu">
				<img src="img/menu_03.jpg" width="1024" height="30">
			</div>
			<div class="main" style="height: 110px;">
				<div>
					<div class="introduct" style="float: left; margin-right: 24px;">
						<a href="./introduce?type=1" target="_blank"><img src="img/platform_introduct.jpg" width="700" height="110"></a>
					</div>
				</div>
				<div>
					<div class="download" style="float: left; width: 300px; height: 110px;">
						<div style="float: left;">
							<div><img src="img/download_title.gif" width="163" height="30"></div>
							<div>
								<div style="float: left; height: 79px;">
									<a class="download_andriod">
										<img src="img/download_andriod.gif" width="80" height="80">
									</a>
								</div>
								<div>
									<a class="download_ios">
										<img src="img/download_ios.gif" width="83" height="80">
									</a>
								</div>
							</div>
						</div>
						<div style="float: right;">
							<img src="img/download_QRcode.jpg" width="137" height="110">
						</div>
					</div>
				</div>
			</div>
		</div> -->
		
		<div class="industry-service" style="height: 365px; padding-top: 20px;">
			<div class="menu">
				<img src="img/menu_02.jpg" width="1024" height="30">
			</div>
			<div class="main" style="height: 200px;">
				<div class="enterprise border">
					<a href="./introduce?type=2" target="_blank;"><img src="img/enterprise_01.jpg" width="340" height="270"></a>
				</div>
				
				<div class="product border">
					<a href="./introduce?type=6" target="_blank;"><img src="img/product_01.jpg" width="340" height="270"></a>
				</div>
				
				<div class="hire border" style="margin: 0;">
					<a href="./introduce?type=3" target="_blank"><img src="img/hire_01.jpg" width="300" height="270"></a>
				</div>
			</div>
		</div>
		
		<div class="platform-download" style="padding-top: 20px;">
			<div class="menu">
				<img src="img/menu_03.jpg" width="1024" height="30">
			</div>
			<div class="main" style="padding: 30px; text-align: center;">
				<span style="font-size: 20px;">欢迎你使用广昌互联网+工业服务平台</span>
				<!-- <a href="releases" target="_blank" style="margin-left:20px;">2017-05-01 | 广昌互联网+工业V1.0 发布</a> -->
				
				<div style="padding-top: 30px;">
					<a class="download_andriod"><img src="img/download_andriod.png"></a>
					<a class="download_qrcode" style=" margin-left: 20px; width: 180px;">
						<span>APP下载</span>
						<div class="arrow-left">
							<img src="img/app_qrcode.png" alt="Download app qrcode" width="100%">
						</div>	
					</a>
					<a class="download_qrcode" style="margin-left: 40px; width: 200px;">
						<span>微信服务号</span>
						<div class="arrow-left">
							<img src="img/weixin_service.jpg" alt="Download app qrcode" width="100%">
						</div>	
					</a>
				</div>
				
			</div>
		</div>
		
		<div style="text-align: center;">
			<div class="footer"></div>
			<div style="display: inline-block; vertical-align: middle;">
				<script type="text/javascript">
					document.write(unescape("%3Cspan id='_ideConac' %3E%3C/span%3E%3Cscript  src='http://dcs.conac.cn/js/15/225/0839/41095134/CA152250839410951340004.js' type='text/javascript'%3E%3C/script%3E"));
				</script>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	;(function($) {
		// visit
		$.ajax({
			url: 'visit/add',
			type: 'POST',
			success: function(data) {},
			error: function(data) {}
		});
		
		var $page = $(".portal");
		
		new $k.proto.DynamicMenu().init($page.find(".announce-list")).draw(0);
		new $k.proto.DynamicMenu().init($page.find(".policy-list")).draw(1);
		new $k.proto.DynamicMenu().init($page.find(".overview-list")).draw(2);
		new $k.proto.PhotoNews().init($page.find(".unit")).draw();
		
		new $k.proto.Top().init($page.find(".top")).draw();
		new $k.proto.Footer().init($page.find(".footer")).draw();
		
		$page
		.on("click", ".download_andriod", function() {	// andriod最新版下载
			$.ajax({
				url: "version/lastest",
				type: "POST",
				success: function(data) {
					var url = data.data.url;
					location.href = "downloadFile?filepath=" + url;
				},
				error: function(err) {}
			});
		})
		.on("click", ".assist", function() {
			window.location.href = "./manager?redirect=assist";
		})
		.on("click", ".download_ios", function() {
			alert("该功能暂不开放！");
		})
		.on("click", ".not_yet_open", function() {
			alert("该功能暂不开放！");
			return;
		})
		.on('click', '.a-service', function() {
			window.open($k.config.serviceUrl);
		});
		
		$page.on("click", ".login_btn", function() {
			var $warningDiv = $page.find(".warningDiv");
			var $username = $page.find("#username").val();
			var $password = $page.find("#password").val()
			if ( $username!= "" && $password != "") {
				$.ajax({
					url: "account/login",
					type: "POST",
					data:{
						username: $username,
						password: $k.util.encrptByDES($password),
					},
					success: function(data) {
						switch (data.status) {
						case 0:
							window.location.href = "./manager";
							// insert to session
							$k.user.set(data.data);
							break;
						case 2:
							$warningDiv.html("用户名不存在！");
							break;
						case 11:
							$warningDiv.html("密码错误！！");
							break;
						case 13:
							$warningDiv.html("用户已被禁用！！");
							break;
						default:
							break;
						}

						setTimeout(function() {
							$warningDiv.html("");
							$warningDiv.html("");
						}, "2000");
					},
					error: function(err) {
					}
				});
			} else {
				if ($password == "") {
					$warningDiv.html("密码不能为空！");
				}
				if ($username == "") {
					$warningDiv.html("用户名不能为空！");
				}
				setTimeout(function() {
					$warningDiv.html("");
					$warningDiv.html("");
				}, "2000");
			}
		});
	})(jQuery);
	</script>
	
	<script>
		(function(){
		    var bp = document.createElement('script');
		    var curProtocol = window.location.protocol.split(':')[0];
		    if (curProtocol === 'https') {
		        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';        
		    }
		    else {
		        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
		    }
		    var s = document.getElementsByTagName("script")[0];
		    s.parentNode.insertBefore(bp, s);
		})();
	</script>
	
	<script>
		(function(){
		   var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?b20973cff2bf5e26404d9a6e25c42e0e":"https://jspassport.ssl.qhimg.com/11.0.1.js?b20973cff2bf5e26404d9a6e25c42e0e";
		   document.write('<script src="' + src + '" id="sozz"><\/script>');
		})();
	</script>
	
</body>
</html>