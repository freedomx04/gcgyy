<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>求职详情</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/lazyimg.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<style type="text/css">
		.weui-weixin-content .hm-weixin-title {
			margin-bottom: 6px;
		}
		.weui-weixin-content .hm-weixin-content {
			font-size: 14px;
		}
	</style>
	
</head>

<body>
	<div class="weui-weixin_ui">
	
		<div class="weui-weixin-page">
			<h2 class="weui-weixin-title">${job.business.name}</h2>
			
			<div class="weui-weixin-content">
				<p class="hm-weixin-title">姓名</p>
				<p class="hm-weixin-content">${job.user.name}</p>
			
				<p class="hm-weixin-title">性别</p>
				<p class="hm-weixin-content">${job.user.sex=="0"?"女":job.user.sex=="1"?"男":""}</p>
				
				<p class="hm-weixin-title">年龄</p>
				<p class="hm-weixin-content">${job.age != null ? job.age : ""}</p>
			
				<p class="hm-weixin-title">个人电话</p>
				<p class="hm-weixin-content">${job.telephone}</p>
				
				<p class="hm-weixin-title">薪资</p>
				<p class="hm-weixin-content">${job.salary}</p>
				
				<p class="hm-weixin-title">自我描述</p>
				<p class="hm-weixin-content">${job.description}</p>
				
				<p class="hm-weixin-title">工作经历</p>
				<p class="hm-weixin-content">${job.experience}</p>
			</div>
			
		</div>
		
	</div>
	
</body>
</html>