<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>诉求详情-催办</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

</head>

<body class="wx-appeal-urge">
	<div class="weui_panel">
    	<div class="weui_cell">
    	   <div class="weui_cell_hd"><label for="" class="weui_label">催办意见:</label></div>
           <textarea class="weui_textarea" placeholder="请输入文本" rows="10" id="textarea-content"></textarea>
        </div>
    </div>
	
	<div class="weui_btn_area">
    	<a href="javascript:;" class="weui_btn weui_btn_primary btn-appeal-urge">保存</a>
    </div>
    
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/utils.js"></script>
	
	<script type="text/javascript">
	$(function() {
		var $page = $(".wx-appeal-urge");
		var appealId = $k.util.getRequestParam("appealId");
		var userId = parseInt($k.util.getRequestParam("userId"));
		
		$page.on('click', ".btn-appeal-urge", function() {
			$.ajax({
				url: '${ctx}/appeal/urge',
				type: 'POST',
				data: {
					appealId: appealId,
					userId: userId,
					content: $page.find('#textarea-content').val()
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
	});
	</script>
	
</body>

</html>