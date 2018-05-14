<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>消息平台</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	
</head>

<body>

	<div class="weui_btn_area">
        <a id="btn" href="javascript:" class="weui_btn weui_btn_primary">发送</a>
    </div>
	
	<script type="text/javascript">
	$(function() {
		
		var token = 'LQo3FQ13WQ5V_a-tp0OAau_O8Q86gTVf2ZpXQ57YENtQRtJ6eTpnrb-G3vTSFJ7o';
		
		$('#btn').on('click', function() {
			$.ajax({
				url: '${ctx}/wx/message/send',
				type: 'POST',
				data: {
					toUser: 'sunyiyun',
					agentid: '51',
					content: 'MSCI中国指数走高！与李克强的“新动能”啥关系？'
				},
				success: function(ret) {
					if (ret.status == 0) {
						alert('send message success');
					}
				},
				error: function(err) {}
			}); 
		});
		
	});
	</script>
    
</body>
</html>