<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>网上申报</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
</head>

<body class="wx-declare-info">
	<div class="weui_tab declare-tab">
		<div class="weui_tab_nav" style="padding: 10px 20px;">
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="0">申报项目</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="1">我的申报</a>
		</div>
		
		<div>
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty declareList}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="declare" items="${declareList}">
				        <a class="weui_cell declare-info" href="javascript:;" data-declare-id="${declare.id}">
				            <div class="weui_cell_bd">
				                <p style="font-size: 16px; margin-bottom: 8px;">${declare.itemName}</p>
								<p style="font-size: 13px; color: #999">${declare.status=="1" ? "展示中": declare.status=="2" ? "下架" : "新增"}</p>
				            </div>
				        </a>
					</c:forEach>
				</div>
			</div>
			
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty declareApplyList}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="declareApply" items="${declareApplyList}">
				        <a class="weui_cell declareApply-info" href="javascript:;" data-declare-apply-id="${declareApply.id}">
				            <div class="weui_cell_bd">
				                <p style="font-size: 16px; margin-bottom: 8px;">${declareApply.declare.itemName}</p>
								<p style="font-size: 13px; color: #999">${declareApply.status=="1" ? "未审核": declareApply.status=="2" ? "通过" : declareApply.status=="3" ? "未通过" : "新增"}</p>
				            </div>
				        </a>
					</c:forEach>
				</div>
			</div>
			
		</div>
		
	</div>
	
	<script type="text/javascript">
	$(function() {
		var $page = $('.wx-declare-info');
		
		var defaultIndex = Url.queryString("index");
		if (!defaultIndex) {
			defaultIndex = 0;
		}
		$page.find('.declare-tab').tab({
			defaultIndex: defaultIndex,
			activeClass: 'bg_green'
		});
		
		$page
		.on('click', '.declare-info', function() {
			var declareId = $(this).data('declareId');
			window.location = '${ctx}/wx/declareinfo?declareId=' + declareId + "&role=ep";
		})
		.on('click', '.declareApply-info', function() {
			var declareApplyId = $(this).data('declareApplyId');
			window.location = '${ctx}/wx/declareApplyInfo?declareApplyId=' + declareApplyId + "&role=ep";
		})
		.on('click', '.weui_navbar_item', function() {
			var index = $(this).data('index');
			Url.updateSearchParam("index", index);
		});
		
	});
	</script>
	
</body>

</html>