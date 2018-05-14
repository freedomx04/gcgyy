<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>关于我们</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" type="text/css" href="../js/swiper/swiper.min.css">
<link rel="stylesheet" type="text/css" href="../js/swiper/animate.min.css">
<script src="../js/jquery/1.10.1/jquery.min.js"></script>
<script>
	function setFontSize(){
		var w = $(window).width();
			$("html").css({
				fontSize: w/320 * 10
            });
        }
	setFontSize();
</script>
<style type="text/css">
.swiper-container {
	position: relative;
	width: 100%;
	height: 100%;
	background-size: cover !important;
	background: url("../img/wx/m_bg_1.jpg") no-repeat;
}
.swiper-container .intro {
	width: 90%;
	background: url("../img/wx/m_bg_2.png") no-repeat center;
	background-size: 96%;
	height: 18rem;
	margin: 25% auto 0 auto;
}
.swiper-container .intro p {
	width: 80%;
	height: 17rem;
	padding-top: 2.2rem;
	line-height: 1.6rem;
	color: #fff;
	margin: 0 auto;
	font-size: 1.3rem;
}
.swiper-container1 .swiper-slide {
	position: relative;
	width: 100%;
	background-size: cover!important;
	background: no-repeat
}
.swiper-container1 {
 	width: 100%;
    height: 100%;
}
</style>
</head>
<body style="margin: 0;">
	<div class="swiper-container">
		<div class="intro ani zoomIn animated" swiper-animate-effect="zoomIn">
			<p>这里是广昌县工业和信息化委员会官方微信公众平台，每天会在这里及时推送工业经济和信息化工作动态，展现广昌企业名优产品和企业风采，我们诚挚的邀请社会各界了解、关注、支持广昌县工业和信息化工作，我们也真诚的期待与您的互动和交流，您的意见与建议将是我们最大的鼓励和帮助。</p>
		</div>
		
		<div style="width: 36%; height: 35%; position: absolute; bottom: 6rem; z-index: 1000; left: 32%;">
			<div class="swiper-container1">
				<div class="swiper-wrapper">
            		<div class="swiper-slide" style="background-image:url(../img/wx/about_intro_01.jpg)"></div>
            		<div class="swiper-slide" style="background-image:url(../img/wx/about_intro_02.jpg)"></div>
            		<div class="swiper-slide" style="background-image:url(../img/wx/about_intro_03.jpg)"></div>
            		<div class="swiper-slide" style="background-image:url(../img/wx/about_intro_04.jpg)"></div>
            		<div class="swiper-slide" style="background-image:url(../img/wx/about_intro_05.jpg)"></div>
        		</div>
        	</div>
        </div>
	</div>
</body>
<script src="../js/swiper/swiper.animate1.0.2.min.js"></script>
<script src="../js/swiper/swiper.min.js"></script>
<script>
	var swiper1 = new Swiper('.swiper-container1', {
		effect: 'coverflow',
   	 	grabCursor: true,
   	 	centeredSlides: true,
    	slidesPerView: 'auto',
    	autoplay: 3000,
    	autoplayDisableOnInteraction: false,
    	loop: true,
    	coverflow: {
        	rotate: 50,
        	stretch: 0,
        	depth: 100,
        	modifier: 1,
        	slideShadows: true
    	}
	});
    </script>
</html>
