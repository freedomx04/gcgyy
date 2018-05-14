<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>网上申报-申报企业</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
</head>

<body class="wx-declare-enterprise-info">

	<div class="wx-declare-enterprise-list">
		<div class="weui_cells weui_cells_access">
			<c:if test="${empty declareApplyList}">
				<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
			</c:if>
			<c:forEach var="declareApply" items="${declareApplyList}">
		        <a class="weui_cell declare-enterprise-info" href="javascript:;" data-declare-apply-id="${declareApply.id}">
		            <div class="weui_cell_bd">
		                <p style="font-size: 16px; margin-bottom: 8px;">${declareApply.enterprise.name}</p>
						<p style="font-size: 13px; color: #999"><fmt:formatDate value="${declareApply.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
		            </div>
		        </a>
			</c:forEach>
	    </div>
	    
	</div>
	  
	<script type="text/javascript">
	$(function() {
		var $page = $('.wx-declare-enterprise-info');
		var $list = $page.find('.wx-declare-enterprise-list');
		var $search = $page.find('.wx-declare-enterprise-search');
		
		
		$page
		.on('click', '.declare-enterprise-info', function() {
			var declareApplyId = $(this).data('declareApplyId');
			window.location = '${ctx}/wx/declareApplyInfo?declareApplyId=' + declareApplyId + "&role=gv";
		})
		
	});
	</script>

</body>

</html>