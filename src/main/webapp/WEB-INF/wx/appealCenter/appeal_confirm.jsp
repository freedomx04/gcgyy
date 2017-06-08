<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>诉求详情-确认办结</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

</head>

<body class="wx-appeal-confirm">
	<div class="weui_panel">
		<div class="weui_cell">
			<div class="weui_cell_hd"><label for="" class="weui_label">受理速度:</label></div>
			<div class="weui_cell_bd weui_cell_primary" id="acceptSpeed">
	    	   <c:forEach var="star" items="1,2,3,4,5">
				<span class="icon icon-49 star-${star}" star="${star}" style="font-size: 1.3em;"></span>
	    	   </c:forEach>
    	  	</div>
        </div>
        <div class="weui_cell">
			<div class="weui_cell_hd"><label for="" class="weui_label">办结速度:</label></div>
			<div class="weui_cell_bd weui_cell_primary" id="processSpeed">
	    	   <c:forEach var="star" items="1,2,3,4,5">
				<span class="icon icon-49 star-${star}" star="${star}" style="font-size: 1.3em;"></span>
	    	   </c:forEach>
			</div>
        </div>
        <div class="weui_cell">
			<div class="weui_cell_hd"><label for="" class="weui_label">办结结果:</label></div>
			<div class="weui_cell_bd weui_cell_primary" id="result">
	    	   <c:forEach var="star" items="1,2,3,4,5">
				<span class="icon icon-49 star-${star}" star="${star}" style="font-size: 1.3em;"></span>
	    	   </c:forEach>
			</div>
        </div>
    	<div class="weui_cell">
    	   <div class="weui_cell_hd"><label for="" class="weui_label">评价:</label></div>
           <textarea class="weui_textarea" placeholder="请输入文本" rows="10" id="textarea-evaluation"></textarea>
        </div>
    </div>
	
	<div class="weui_btn_area">
    	<a href="javascript:;" class="weui_btn weui_btn_primary btn-appeal-confirm">保存</a>
    </div>
    
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/utils.js"></script>
	
	<script type="text/javascript">
	$(function() {
		var $page = $(".wx-appeal-confirm");
		var appealId = $k.util.getRequestParam("appealId");
		var userId = $k.util.getRequestParam("userId");
		
		$page
		.on('click', ".btn-appeal-confirm", function() {
			
			$.ajax({
				url: '${ctx}/appeal/confirm',
				type: 'POST',
				data: {
					appealId: appealId,
					acceptSpeed: $page.find("#acceptSpeed").find(".icon-48").length,
					processSpeed: $page.find("#processSpeed").find(".icon-48").length,
					result: $page.find("#result").find(".icon-48").length,
					evaluation: $page.find('#textarea-evaluation').val()
				},
				success: function(ret) {
					if (ret.status == 0) {
						$.toast('保存成功');
						setTimeout(function () {
							window.location = '${ctx}/wx/appealCenter/appealinfo?appealId=' + appealId + "&role=${role}&userId=" + userId;
						}, 1000);
					} else {
						$.toast('保存失败!', 'cancel');
					}
				},
				error: function(err) {
					$.toast('保存失败!', 'cancel');
				}
			});
		})
		.on("tap", ".icon-49, .icon-48", function() {
			var starNum = $(this).attr("star");
			for(var i = 1; i <= 5; i++) {
				if(i <= starNum && $(this).hasClass("icon-49")){
					$(this).parent().find(".star-"+i).removeClass("icon-49").addClass("icon-48");
				} else if(i > starNum){
					$(this).parent().find(".star-"+i).removeClass("icon-48").addClass("icon-49");
				}
			}
		});
	});
	</script>
	
</body>

</html>