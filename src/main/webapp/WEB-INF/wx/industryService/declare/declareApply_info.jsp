<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>企业申报项目信息</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script src="${ctx}/plugins/wx/select.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<style type="text/css">
		.weui_cell_bd {
			min-width: 5em;
		}
		.weui_cell_ft {
			word-break: break-all;
		}
	</style>
	
</head>

<body>
	<div class="weui-weixin_ui">
		
		<div class="weui_cells">
			<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>项目名称</p>
	            </div>
	            <div class="weui_cell_ft">${declareApply.declare.itemName}</div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>申报企业名称</p>
	            </div>
	            <div class="weui_cell_ft">
	            	<a class="weui-weixin-a enterprise-info" href="javascript:;" data-enterprise-id="${declareApply.enterprise.id}">${declareApply.enterprise.name}</a>
	            </div>
        	</div>
		</div>
		
		<div class="weui_cells">
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>审核状态</p>
	            </div>
	            <div class="weui_cell_ft declareApply-status" data-declare-apply-status="${declareApply.status}">${declareApply.status=="2" ? "通过": declareApply.status=="3" ? "未通过" : declareApply.status=="1" ? "未审核" : "新增"}</div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>审核原因</p>
	            </div>
	            <div class="weui_cell_ft">${declareApply.opinion}</div>
        	</div>
		</div>
		
		<div class="weui_cells">
			<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>申报材料</p>
	            </div>
	            <div class="weui_cell_ft">
					<a href="${ctx}/downloadFile?filepath=${declareApply.attachPath}">${declareApply.attachName}</a>
				</div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>发布人</p>
	            </div>
	            <div class="weui_cell_ft">${declare.user !=null ? declare.user.name : ""}</div>
        	</div>
		</div>
		
		<c:if test="${role == 'gv'}">
		<div class="weui_btn_area">
	    	<a href="${ctx}/wx/declareApprove?declareApplyId=${declareApply.id}" class="weui_btn weui_btn_disabled weui_btn_primary btn-declare-approve">审核</a>
	    </div>
	    </c:if>
		
	</div>
	
	<script type="text/javascript">
	$(function() {
		var declareApplyStatus = $(".declareApply-status").data('declareApplyStatus');
		if (declareApplyStatus ==2 || declareApplyStatus == 3) {
			var $approveBtn = $(".btn-declare-approve");
			$approveBtn.addClass("weui_btn_disabled");
			$approveBtn.attr("href", "javascript:;");
		}
	});
	</script>
	
</body>
</html>