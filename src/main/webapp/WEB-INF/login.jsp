<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>登录</title>
<script type="text/javascript" src="js/jquery/1.10.1/jquery.js"></script>
<script type="text/javascript" src="js/base/base.js"></script>
<script type="text/javascript" src="js/base/user.js"></script>
<script type="text/javascript" src="js/base/utils.js"></script>
<script type="text/javascript" src="js/date/date.format-1.2.3.js"></script>
<script type="text/javascript" src="js/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="js/CryptoJS/3.1.2/rollups/tripledes.js"></script>
<script type="text/javascript" src="js/CryptoJS/3.1.2/components/mode-ecb.js"></script>
<link type="text/css" rel="stylesheet" href="css/main.css" />
<link type="text/css" rel="stylesheet" href="js/amaze-ui/2.7.0/css/amazeui.custom.min.css" />
<link type="text/css" rel="stylesheet" href="css/login_register.css" />
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="./img/favicon.ico" type="image/x-icon" />
</head>
<script type="text/javascript">
$(function() {
	var $loginForm = $("#loginForm");
	var $username = $loginForm .find("#username");
	var $password = $loginForm .find("#password");
	var $rememberPassword = $loginForm .find("#rememberPassword");

	document.onkeydown = function(e){
		var ev = document.all ? window.event : e;
		if(ev.keyCode==13) {
			$loginForm.find(".login_btn").trigger("click");
		}
	}
	
	if ($k.util.getRequestParam('username') != "") {
		$username.val($k.util.getRequestParam('username'));
	} else {
		$rememberPassword.prop("checked", getCookie("rememberPassword") == "" ? false : true);
		if (getCookie("rememberPassword") != "") {
			$username.val(getCookie("username"));
			$password.val(getCookie("password"));
		} else {
			$username.val("");
			$password.val("");
		}
	}

	$rememberPassword.click(function() {
		var checked = $(this).prop('checked');
		if (checked) {
			setCookie("username", $password.val(), "d7");
			setCookie("rememberLoginName", checked, "d7");
			setCookie("password", $password.val(), "d7");
			setCookie("rememberPassword", checked, "d7");
		} else {
			setCookie("username", "", "d7");
			setCookie("rememberLoginName", "", "d7");
			setCookie("password", "", "d7");
			setCookie("rememberPassword", "", "d7");
		}
	});
	
	$loginForm.on("click", ".login_btn", function() {
		var redirect = $k.util.getRequestParam("redirect");
		if ($rememberPassword.prop("checked")) {
			setCookie("username", $username.val(), "d7")
			setCookie("password", $password.val(), "d7")
		}
		if ($username.val() != "" && $password.val() != "") {
			$.ajax({
				url: "account/login",
				type: "POST",
				data:{
					username: $loginForm.find("input[name='username']").val(),
					password: $k.util.encrptByDES($loginForm.find("input[name='password']").val()),
				},
				success: function(data) {
					switch (data.status) {
					case 0:
						if (redirect == "") {
							window.location.href = "./manager";
						} else {
							window.location.href = redirect + '?uid=' + data.data.id + '&uname=' + data.data.username + '&utel=' + data.data.telephone + '&platform=gc';
						}
						
						// insert to session
						$k.user.set(data.data);
						break;
					case 2:
						$username.parent().next().find("em").addClass("error").html("用户名不存在！");
						break;
					case 11:
						$password.parent().next().find("em").addClass("error").html("密码错误！");
						break;
					case 13:
						$username.parent().next().find("em").addClass("error").html("用户已被禁用！");
						break;
					default:
						break;
					}

					setTimeout(function() {
						$username.parent().next().find("em").removeClass("error").html("");
						$password.parent().next().find("em").removeClass("error").html("");
					}, "2000");
				},
				error: function(err) {
				}
			});
		} else {
			if ($username.val() == "") {
				$username.parent().next().find("em").addClass("error").html("用户名不能为空！");
			}
			if ($password.val() == "") {
				$password.parent().next().find("em").addClass("error").html("密码不能为空！");
			}
			setTimeout(function() {
				$username.parent().next().find("em").removeClass("error").html("");
				$password.parent().next().find("em").removeClass("error").html("");
			}, "2000");
		}
	});
});
</script>
<body style="padding-top: 50px;">
	<div class="top">
		<p>广昌县互联网+工业管理平台</p>
	</div>
	<div id="login_bg">
		<div class="login">
			<div class="login_form">
				<div class="login_title">账号登录</div>
				<form class="am-form" id="loginForm">
					<div class="am-form-group am-form-icon margin-bottom-o">
				    	<i class="am-icon-user"></i>
				    	<input style="display:none"><!-- for disable autocomplete on chrome -->
				    	<input type="text" class="am-form-field" name="username" id="username"  style="line-height: 1.3;" placeholder="请输入用户名" autocomplete="off">
			  		</div>
			  		<div class="am-text-center am-margin-bottom"><em></em></div>
			  		
			  		<div class="am-form-group am-form-icon margin-bottom-o">
				    	<i class="am-icon-lock"></i>
				    	<input style="display:none">
				    	<input type="password" class="am-form-field" name="password" id="password" placeholder="请输入密码" autocomplete="off">
			  		</div>
			  		<div class="am-text-center am-margin-bottom"><em></em></div>
			  		
			        <input type="checkbox" id="rememberPassword">记住密码
			    	<a href="register.html" class="am-fr">注册</a>
					<div class="am-form-group am-margin-top-xs">
					    <div>
					      <span class="am-btn am-btn-primary am-btn-block login_btn">登录</span>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="footer">
		<span>技术支持：江西移动</span>
	</div>
</body>
</html>
