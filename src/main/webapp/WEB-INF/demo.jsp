<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>示例页面</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
<style type="text/css">
.demo ul {
	margin: 0 20px;
}	
</style>
</head>
<body class="demo" style="width:1024; min-width: 1024px; padding-left: 20px;">
	
	<label>基础模块</label>
	<ul>
		<li><a class="clickableText" page="system_account">登录注册</a></li>
		<li><a class="clickableText" page="system_file">上传下载</a></li>
		<li><a class="clickableText" page="system_init">初始化数据</a></li>
		<li><a class="clickableText" page="system_push">推送</a></li>
		<li><a class="clickableText" page="system_version">版本</a></li>
		<li><a class="clickableText" page="system_init_nc">南城初始化</a></li>
	</ul>
	
	<label>权限管理</label>
	<ul>
		<li><a class="clickableText" page="authority_role">角色管理</a></li>
		<li><a class="clickableText" page="authority_department">部门管理</a></li>
		<li><a class="clickableText" page="authority_enterprise">企业管理</a></li>
		<li><a class="clickableText" page="authority_user">用户管理</a></li>
	</ul>
	
	<label>基础数据</label>
	<ul>
		<li><a class="clickableText" page="baseData_area">区域</a></li>
		<li><a class="clickableText" page="baseData_productType">产品类型</a></li>
		<li><a class="clickableText" page="baseData_appealType">诉求类型</a></li>
		<li><a class="clickableText" page="baseData_business">行业管理</a></li>
		<li><a class="clickableText" page="baseData_report">上报时间</a></li>
	</ul>
	
	<label>帮扶平台</label>
	<ul>
		<li><a class="clickableText" page="assist_appeal">诉求中心</a></li>
		<li><a class="clickableText" page="assist_appeal_enterprise">诉求中心_企业</a></li>
		<li><a class="clickableText" page="assist_appeal_department">诉求中心_部门</a></li>
	</ul>
	
	<label>监测平台</label>
	<ul>
		<li><a class="clickableText" page="monitor_energy">能源消耗</a></li>
		<li><a class="clickableText" page="monitor_benefit">效益指标</a></li>
		<li><a class="clickableText" page="monitor_economic">经济运行</a></li>
		<li><a class="clickableText" page="monitor_target">全县主要指标</a></li>
		<li><a class="clickableText" page="monitor_ranking">积分排名系统</a></li>
		<li><a class="clickableText" page="monitor_alert">企业预警信息</a></li>
		<li><a class="clickableText" page="monitor_nationalTax">国税</a></li>
		<li><a class="clickableText" page="monitor_localTax">地税</a></li>
		<li><a class="clickableText" page="monitor_tax">纳税系统</a></li>
		<li><a class="clickableText" page="monitor_reportForm">报表</a></li>
	</ul>
	
	<label>招工平台</label>
	<ul>
		<li><a class="clickableText" page="service_hire">招工信息</a></li>
		<li><a class="clickableText" page="service_job">求职信息</a></li>
		<li><a class="clickableText" page="service_declare">申报（工信委）</a></li>
		<li><a class="clickableText" page="service_declareApply">申报（企业）</a></li>
	</ul>
	
	<label>设置</label>
	<ul>
		<li><a class="clickableText" page="setting_dynamic">动态</a></li>
	</ul>
	
	<label>全市排名</label>
	<ul>
		<li><a class="clickableText" page="ranking_report">报表</a></li>
	</ul>
	
</body>

<script type="text/javascript">
;(function( $ ) {
	
	var $body = $(".demo");
	$body.on("click", ".clickableText", function() {
		window.open('demoPage?page=' + $(this).attr("page"));
	});
	
})( jQuery );
</script>
</html>
