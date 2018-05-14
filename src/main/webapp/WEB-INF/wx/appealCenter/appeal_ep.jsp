<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>诉求中心</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/utils.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/constant.js"></script>
	
</head>

<body class="wx-appealCenter-info">
	<div class="weui_tab appealCenter-tab">
		<div class="weui_tab_nav" style="padding: 10px 20px;">
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="0">诉求列表</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="1">诉求预警</a>
		</div>
		
		<div>
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty appealList}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="appeal" items="${appealList}">
						<a class="weui_cell appeal-info" href="javascript:;" data-appeal-id="${appeal.id}">
			                <div class="weui_cell_hd">
			                	<p style="font-size: 16px; margin-bottom: 8px;">${appeal.title}</p>
								<p style="font-size: 13px; color: #999"><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
			                </div>
			                <div class="weui_cell_bd weui_cell_primary"><p></p></div>
			                <div style="color: #999;">
			                	${appeal.appealType.name}
			                	<span class="weui-badge" style="margin-left: 5px; background-color: #04be02;" data-status="${appeal.status}"></span>
			                </div>
            			</a>
					</c:forEach>
				</div>
			</div>
			
			<div class="weui_tab_bd_item">
				<h1 class="page-hd-title" style="margin-left: 1em;"> 超过受理天数诉求</h1>
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${acceptDayAppealLength == 0}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="list" items="${overDaysList}">
						<c:forEach var="appeal" items="${list.acceptDays}">
							<a class="weui_cell appeal-info" href="javascript:;" data-appeal-id="${appeal.id}">
				                <div class="weui_cell_hd">
				                	<p style="font-size: 16px; margin-bottom: 8px;">${appeal.title}</p>
									<p style="font-size: 13px; color: #999"><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
				                </div>
				                <div class="weui_cell_bd weui_cell_primary"><p></p></div>
				                <div style="color: #999;">${appeal.appealType.name}</div>
	            			</a>
	            		</c:forEach>
					</c:forEach>
				</div>
				
				<h1 class="page-hd-title" style="margin-left: 1em; margin-top: 50px;">超过处理天数诉求</h1>
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${handleDayAppealLength == 0}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="list" items="${overDaysList}">
						<c:forEach var="appeal" items="${list.handleDays}">
							<a class="weui_cell appeal-info" href="javascript:;" data-appeal-id="${appeal.id}">
				                <div class="weui_cell_hd">
				                	<p style="font-size: 16px; margin-bottom: 8px;">${appeal.title}</p>
									<p style="font-size: 13px; color: #999"><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
				                </div>
				                <div class="weui_cell_bd weui_cell_primary"><p></p></div>
				                <div style="color: #999;">${appeal.appealType.name}</div>
	            			</a>
            			</c:forEach>
					</c:forEach>
				</div>
			</div>
			
		</div>
		
	</div>

	<script type="text/javascript">
	$(function() {
		var $page = $('.wx-appealCenter-info');
		var userId = $k.util.getRequestParam("userId");
		var defaultIndex = Url.queryString("index");
		
		if (!defaultIndex) {
			defaultIndex = 0;
		}
		$page.find('.appealCenter-tab').tab({
			defaultIndex: defaultIndex,
			activeClass: 'bg_green'
		});
		
		$.each($page.find(".weui-badge"), function(k, y) {
			var status = $page.find(".weui-badge").eq(k).data('status');
			$page.find(".weui-badge").eq(k).text($k.constant.getAppealStatus(status));
		});
		
		$page
		.on('click', '.appeal-info', function() {
			var appealId = $(this).data('appealId');
			window.location = '${ctx}/wx/appealCenter/appealinfo?appealId=' + appealId + "&role=ep&userId=" + userId;
		})
		.on('click', '.weui_navbar_item', function() {
			var index = $(this).data('index');
			Url.updateSearchParam("index", index);
		});
		
	});
	</script>

</body>

</html>