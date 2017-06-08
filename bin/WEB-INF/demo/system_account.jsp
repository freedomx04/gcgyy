<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>账号</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="accountMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="status">
		<label class="font-bold">登录状态： </label>
		<label class="loginStatus"></label>
	</div>
	<div class="divide"></div>
	
	<div class="login">
		<label class="font-bold">登录(account/login)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>username:</td><td><input type="text" class="login-username"/></td></tr>
						<tr><td>password:</td><td><input type="password" class="login-password"/></td></tr>
						<tr><td>deviceToken:</td><td><input type="text" class="login-deviceToken"/></td></tr>
						<tr><td colspan="2"><input type="button" class="login-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="login-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="logout">
		<label class="font-bold">登出(account/logout)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="logout-userId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="logout-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="logout-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="register">
		<label class="font-bold">注册(account/register)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>username:</td><td><input type="text" class="register-username"/></td></tr>
						<tr><td>password:</td><td><input type="password" class="register-password"/></td></tr>
						<tr><td>telephone:</td><td><input type="text" class="register-telephone"/></td></tr>
						<tr><td colspan="2"><input type="button" class="register-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="register-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
	;(function($) {
		
		checkStatus();
		
		// check is login
		function checkStatus() {
			$.ajax({
				url: "account/loginStatus",
				type: "POST",
				success: function(data) {
					data == true ? $(".accountMgr .loginStatus").text("已登录") : $(".accountMgr .loginStatus").text("未登录");
				},
				error: function(data) {}
			});
		}
		
		var $login = $(".accountMgr .login");
		$login.on("click", ".login-btn", function() {
			$.ajax({
				url: "account/login",
				type: "POST",
				data: {
					username: $login.find(".login-username").val(),
					password: $k.util.encrptByDES($login.find(".login-password").val()),
					deviceToken: $login.find(".login-deviceToken").val(),
				},
				success: function(data) {
					$login.find(".login-textarea").val(JSON.stringify(data, undefined, 4));
					checkStatus();
				},
				error: function(err) {
					$login.find(".login-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $logout = $(".accountMgr .logout");
		$logout.on("click", ".logout-btn", function() {
			$.ajax({
				url: "account/logout",
				type: "POST",
				data: {
					userId: $logout.find(".logout-userId").val(),
				},
				success: function(data) {
					$logout.find(".logout-textarea").val(JSON.stringify(data, undefined, 4));
					checkStatus();
				},
				error: function(err) {
					$logout.find(".logout-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $register = $(".accountMgr .register");
		$register.on("click", ".register-btn", function() {
			$.ajax({
				url: "account/register",
				type: "POST",
				data: {
					username: $register.find(".register-username").val(),
					password: $k.util.encrptByDES($register.find(".register-password").val()),
					telephone: $register.find(".register-telephone").val(),
				},
				success: function(data) {
					$register.find(".register-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$register.find(".register-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
	})(jQuery);
	</script>
</body>
</html>
