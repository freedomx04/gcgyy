<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>申报项目信息</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/utils.js"></script>
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

<body class="wx-declare-info">
	<div class="weui-weixin_ui">
	
		<div class="weui_cells">
			<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>项目名称</p>
	            </div>
	            <div class="weui_cell_ft">${declare.itemName}</div>
        	</div>
        	<c:if test="${role == 'ep'}">
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>申报状态</p>
	            </div>
	            <div class="weui_cell_ft declare-Applystatus" data-declare-apply-status="${declare.applyStatus}">${declare.applyStatus=="1" ? "已申报": declare.applyStatus=="0" ? "未申报" : ""}</div>
        	</div>
        	</c:if>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>状态</p>
	            </div>
	            <div class="weui_cell_ft declare-status" data-declare-status="${declare.status}">${declare.status=="1" ? "展示中": declare.status=="2" ? "下架" : "新增"}</div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>已申报企业数</p>
	            </div>
	            <div class="weui_cell_ft">${declare.declareApplys.size()}</div>
        	</div>
		</div>
		
		<div class="weui_cells">
			<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>申报开始时间</p>
	            </div>
	            <div class="weui_cell_ft"><fmt:formatDate value="${declare.startTime}" pattern="yyyy-MM-dd HH:mm"/></div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>申报结束时间</p>
	            </div>
	            <div class="weui_cell_ft"><fmt:formatDate value="${declare.endTime}" pattern="yyyy-MM-dd HH:mm"/></div>
        	</div>
		</div>
		
		<div class="weui_cells">
			<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>申报模板</p>
	            </div>
	            <div class="weui_cell_ft"><a href="${ctx}/downloadFile?filepath=${declare.attachPath}">${declare.attachName}</a></div>
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
	    	<a href="javascript:;" class="weui_btn weui_btn_primary btn-declare-display">发布 / 结束</a>
	    	<a href="javascript:;" class="weui_btn weui_btn_plain_primary btn-declare-enterprise">查看申报企业</a>
	    </div>
	    </c:if>
		
	</div>
	
	<script type="text/javascript">
	;(function( $ ) {
		var $page = $(".wx-declare-info");
		var $declareStatus = $page.find(".declare-status");
		var declareStatus = $declareStatus.data('declareStatus');
		
		$page
		.on("click", ".btn-declare-enterprise", function() {
			var declareId = $k.util.getRequestParam("declareId");
			window.location = '${ctx}/wx/declareEnterprise?declareId=' + declareId;
		})
		
		.on("click", ".btn-declare-display", function() {
			var display = "";
			var url = declareStatus == "0" || declareStatus == "2" ? "declare/online" : "declare/downline";
			
			if (declareStatus == 0 || declareStatus == 2) {
				display = "上架";
				declareStatus = 1;
			} else if (declareStatus == 1){
				display = "下架";
				declareStatus = 2;
			}
	        $.confirm("您确定要"+display+"吗?", "确认"+display+"?", function() {
	        	$.ajax({
					url: url,
					type: "POST",
					data: {
						declareId: id,
					},
					success: function(data) {
						if(data.status=="0"){
							$.toast(""+display+"成功!");
					        $declareStatus.text(declareStatus == 1 ? "展示中": "下架");
					        $declareStatus.attr("data-declare-status", declareStatus);
						}
					},
					error: function(err) {}
				});
	        }, function() {
	          //取消操作
	        });
      	})
		
		/* .on("click", ".btn-declare-apply", function() {
			var declareId = $k.util.getRequestParam("declareId");
			window.location = '${ctx}/wx/declareApply?declareId=' + declareId;
      	}); */
	})( jQuery );
	
	</script>
	
</body>
</html>