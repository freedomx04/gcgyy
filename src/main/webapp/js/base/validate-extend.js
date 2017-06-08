jQuery.validator.addMethod("compareDate", function(value, element, param) {
    value = new Date(Date.parse(value));
    var startDate = new Date(Date.parse(jQuery(param).val()));
    return startDate <= value;
}); 

//手机号码验证
jQuery.validator.addMethod("phone", function(value, element) {
    var length = value.length;
    var mobile =  /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "手机号码格式错误");

//电话号码验证   
jQuery.validator.addMethod("tel", function(value, element) {
    var tel = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/;
    return this.optional(element) || (tel.test(value));
}, "电话号码格式错误");

//号码验证   
jQuery.validator.addMethod("telORphone", function(value, element) {
    var tel = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/;
    var length = value.length;
    var mobile =  /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
    return this.optional(element) || (length == 11 && mobile.test(value)) || (tel.test(value));
}, "号码格式错误");

//验证用户名已存在
jQuery.validator.addMethod("usernameIsexist", function(value, element) {
	var status = 0;
	$.ajax({
		url: "user/findByUsername",
		type: "POST",
		async: false,
		data: {
			username: value
		},
		success: function(data) {
			status = data.status
		},
		error: function(err) {}
	});
    return this.optional(element) || (status==2);
}, "用户名已存在");

//字符验证，只能包含英文、数字、下划线等字符。    
jQuery.validator.addMethod("stringCheck", function(value, element) {       
     return this.optional(element) || /^[a-zA-Z0-9-_]+$/.test(value);       
}, "只能包含英文、数字、下划线等字符");   

//年月格式
jQuery.validator.addMethod("yearMonth", function(value, element) {       
    return this.optional(element) || /^\d{4}-?(?:0[1-9]|1[0-2])$/.test(value);       
}, "输入正确的年月格式");  

