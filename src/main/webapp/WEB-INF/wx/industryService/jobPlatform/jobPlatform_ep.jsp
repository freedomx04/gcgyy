<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>招工平台</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/lazyimg.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
</head>

<body class="wx-jobPlatform-info">
	<div class="weui_tab jobPlatform-tab">
		<div class="weui_tab_nav" style="padding: 10px 20px;">
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="0">招工信息</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="1">求职信息</a>
		</div>
		
		<div>
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty hireList}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="hire" items="${hireList}">
						<a href="javascript:;" class="weui_cell hire-info" data-hire-id="${hire.id}">
							<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">
								<img src="${icon}" data-src="${ctx}/${hire.imagePath}" style="width: 60px; display: block;">
							</div>
							<div class="weui_cell_bd">
								<p>${hire.position}</p>
								<p style="font-size: 13px; color: #999">${hire.enterprise.name}</p>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
			
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty jobList}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="job" items="${jobList}">
						<a class="weui_cell job-info" href="javascript:;" data-job-id="${job.id}">
			                <div class="weui_cell_hd">
			                	<p style="font-size: 16px; margin-bottom: 8px;">${job.user.name}</p>
								<p style="font-size: 13px; color: #999"><fmt:formatDate value="${job.createTime}" pattern="yyyy-MM-dd"/></p>
			                </div>
			                <div class="weui_cell_bd weui_cell_primary"><p></p></div>
			                <div style="color: #999;">${job.business.name}</div>
            			</a>
					</c:forEach>
				</div>
			</div>
			
		</div>
		
	</div>

	<script type="text/javascript">
	$(function() {
		var $page = $('.wx-jobPlatform-info');
		
		$k.util.lazyLoadImg('.weui-updown [data-src]');
		
		var defaultIndex = Url.queryString("index");
		if (!defaultIndex) {
			defaultIndex = 0;
		}
		$page.find('.jobPlatform-tab').tab({
			defaultIndex: defaultIndex,
			activeClass: 'bg_green'
		});
		
		$page
		.on('click', '.hire-info', function() {
			var hireId = $(this).data('hireId');
			window.location = '${ctx}/wx/jobPlatform/hireinfo?hireId=' + hireId;
		})
		.on('click', '.job-info', function() {
			var jobId = $(this).data('jobId');
			window.location = '${ctx}/wx/jobPlatform/jobinfo?jobId=' + jobId;
		})
		.on('click', '.weui_navbar_item', function() {
			var index = $(this).data('index');
			Url.updateSearchParam("index", index);
		});
		
	});
	</script>

</body>

</html>