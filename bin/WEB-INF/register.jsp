<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>注册</title>
<script type="text/javascript" src="js/jquery/1.10.1/jquery.js"></script>
<script type="text/javascript" src="js/base/base.js"></script>
<script type="text/javascript" src="js/base/user.js"></script>
<script type="text/javascript" src="js/base/utils.js"></script>
<script type="text/javascript" src="js/date/date.format-1.2.3.js"></script>
<script type="text/javascript" src="js/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery/jquery.session.js"></script>
<script type="text/javascript" src="js/CryptoJS/3.1.2/rollups/tripledes.js"></script>
<script type="text/javascript" src="js/CryptoJS/3.1.2/components/mode-ecb.js"></script>
<script type="text/javascript" src="js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/validate/jquery.validate.messages_cn.js"></script>
<script type="text/javascript" src="js/base/validate-extend.js"></script>
<link type="text/css" rel="stylesheet" href="css/main.css" />
<link type="text/css" rel="stylesheet" href="js/amaze-ui/2.7.0/css/amazeui.custom.min.css" />
<link type="text/css" rel="stylesheet" href="css/login_register.css" />
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="./img/favicon.ico" type="image/x-icon" />
</head>

<script type="text/javascript">
$(function() {
	var $register_input_form = $("#register-input-form");
	var $warnningDiv = $register_input_form.find(".warnningDiv");
	
	document.onkeydown = function(e){
		var ev = document.all ? window.event : e;
		if(ev.keyCode==13) {
			e.preventDefault();
			$register_input_form.find("#registerBtn").trigger("click");
		}
	}
	
	$register_input_form.validate({
		  errorElement: "em",
	      errorPlacement: function(error, element) { //指定错误信息位置
	    	  error.appendTo(element.parent().next());
	  	  },
	      focusCleanup: true,
	      onkeyup: function(element) { $(element).valid(); },
	      rules: {
	    	  username: {required: true, usernameIsexist: true, stringCheck: true, rangelength: [1,20]},
	    	  password: {required: true, rangelength: [6,12], equalTo: '#confirmPSW'},
	    	  telephone: {required: true, phone: true},
	    	  confirmPSW :{required: true, equalTo: '#password'}
	      },
	      messages: {
	    	  password: {required: "密码不能为空", equalTo: "两次密码不一致"},
	  		  confirmPSW: {required: "请再次确认密码", equalTo: "两次密码不一致"},
	  		  telephone: {required: "请输入手机号",phone: "请输入正确的手机格式"}
	      }
  	});
	$register_input_form.on('click', "#registerBtn", function() {
		//if ($register_input_form.valid()) {//如果表单验证成功，则进行提交。
			$.ajax({
				url: "account/register",
				type: "POST",
				data:{
					username: $register_input_form.find("input[name='username']").val(),
					password: $k.util.encrptByDES($register_input_form.find("input[name='password']").val()),
					telephone: $register_input_form.find("input[name='telephone']").val(),
				},
				success: function(data) {
					if(data.status!="12"){
						$warnningDiv.removeClass("am-hide").html("用户名已存在！");
						setTimeout(function(){
							$warnningDiv.addClass("am-hide");
						},"2000")
					}else{
						window.location.href="login?username="+$("#username").val();
					} 
				},
				error: function(err) {
				}
			});
	     //}
	});
	
})
</script>

<body style="background-color: #eef1f6;">
	<div class="header">
        <div class="header_title am-padding-vertical">
        	<span>广昌县智慧园区管理平台</span>
        	<a href="./login" class="headerBtn">登 录</a>
        </div>
    </div>
	<div class="main">
		<div class="container">
            <div class="am-text-center am-text-lg am-margin-bottom text-black">欢迎您注册智慧园区</div>
            <form id="register-input-form">
               <div class="warnningDiv am-hide"></div>
               <div class="am-form-group am-form-icon margin-bottom-o ">
			    	<i class="am-icon-user"></i>
			    	<input style="display:none"><!-- for disable autocomplete on chrome -->
			    	<input type="text" class="am-form-field" name="username" id="username" placeholder="用户名: 只能包含英文、数字、下划线等字符" autocomplete="off">
		  		</div>
		    	<div class="am-text-center am-margin-bottom"></div>
		    	
               <div class="am-form-group am-form-icon margin-bottom-o ">
			    	<i class="am-icon-lock"></i>
			    	<input type="password" style="display:none">
			    	<input type="password" class="am-form-field" name="password" id="password" placeholder="密码: 6到12位" autocomplete="off">
		  		</div>
		    	<div class="am-text-center am-margin-bottom"></div>
		    	
               <div class="am-form-group am-form-icon margin-bottom-o">
			    	<i class="am-icon-lock"></i>
			    	<input style="display:none">
			    	<input type="password" class="am-form-field" name="confirmPSW" id="confirmPSW" placeholder="再次输入密码" autocomplete="off">
		  		</div>
		    	<div class="am-text-center am-margin-bottom"></div>
		    	
               <div class="am-form-group am-form-icon margin-bottom-o">
			    	<i class="am-icon-mobile"></i>
			    	<input style="display:none">
			    	<input type="text" class="am-form-field" name="telephone" id="telephone" placeholder="手机号" autocomplete="off">
		  		</div>
		    	<div class="am-text-center am-margin-bottom"></div>
		    	
                <div class="am-form-group am-form-icon am-g-collapse am-hide">
				    <div class="am-u-sm-7 am-margin-bottom">
				        <i class="am-icon-keyboard-o"></i>
	    				<input type="text" class="am-form-field" name="verification_code " id="verification_code" placeholder="请输入验证码">
				    </div>
				    <div class="am-u-sm-5 am-text-right">
				    	<button class="am-btn am-btn-primary radiu-4 am-text-sm" id="validate-btn">获取验证码</button>
				    </div>
				</div>
				
           		<span class="am-btn am-btn-primary am-inline-block radiu-4 am-text-sm" value="注 册" id="registerBtn" style="width: 100%;">注册</span>
           		
               <div class="am-text-xs am-padding-top">
                   <span class=""><a target="_blank" href="">收不到验证码？</a></span>
                   <span class="am-fr">注册即同意<a target="_blank" href="">《用户手册》</a></span>
                   <div class="Clear"></div>
               </div>
           </form>
       </div>
   </div>
</body>

</html>