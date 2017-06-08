<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>绑定用户</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
</head>

<body>
	<div class="weui_msg">
		<div class="weui_icon_area"><i class="weui_icon_info weui_icon_msg"></i></div>
		<div class="weui_text_area">
			<h2 class="weui_msg_title">绑定用户</h2>
			<p class="weui_msg_desc">由于您的微信号还没有绑定平台用户<br>请输入平台用户名和密码进行用户账号绑定！</p>
		</div>
	
	</div>
	
	<div class="weui_cells weui_cells_form form-bind">
		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">用户名</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="text" name="username" placeholder="请输入用户名" emptyTips="请输入用户名" required>
			</div>
		</div>
		
		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">密码</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="password" name="password" placeholder="请输入密码" emptyTips="请输入密码" required>
			</div>
		</div>
		
	</div>
	
	<div class="weui_btn_area">
		<a class="weui_btn weui_btn_primary" href="javascript:" id="btn">确定</a>
    </div>
	
	<script type="text/javascript">
	$(function() {
		
		var wxUserId = '${wxUserId}';
		
		//var wxUserId = 'sunyiyun';
		var redirect = '${redirect}';
		
		var $form = $(".form-bind");
		$form.form();
		
		$('#btn').on('click', function() {
			$form.validate(function(error) {
		        if (error){
		            
		        } else {
		        	$.ajax({
		        		url: '${ctx}/user/bind',
		        		type: 'POST',
		        		data: {
		        			username: $form.find('input[name="username"]').val(),
		        			password: $form.find('input[name="password"]').val(),
		        			wxUserId: wxUserId
		        		},
		        		success: function(ret) {
		        			switch(ret.status) {
		        			case 0:
		        				$.toptips('绑定成功','ok');
		        				
		        				setTimeout(function() {
		        					window.location = redirect + '?userId=' + ret.data.id;
		        				}, 1000);
		        				
		        				break;
		        			case 2:		$.toptips('用户不存在');	break;
		        			case 11:	$.toptips('密码错误');		break;
		        			case 13:	$.toptips('用户已被禁用');	break;
		        			case 14: 	$.toptips('用户已绑定微信');	break;
		        			default:	break;
		        			}
		        			
		        		},
		        		error: function(err) {}
		        	});
		        }
		    });
		});
		
	});
	</script>
    
</body>
</html>