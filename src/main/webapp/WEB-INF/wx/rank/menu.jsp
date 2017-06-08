<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>全市排名</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

</head>

<body>
	<div>
		<div class="weui_cells weui_cells_access">
            <a class="weui_cell " href="${ctx}/wx/rank/addition">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>工业增加值</p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
            <a class="weui_cell " href="${ctx}/wx/rank/business">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>主营业务收入</p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
			<a class="weui_cell " href="${ctx}/wx/rank/tax">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>利税总额</p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
            <a class="weui_cell " href="${ctx}/wx/rank/profit">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>利润总额</p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
            <a class="weui_cell " href="${ctx}/wx/rank/electricity">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>工业用电</p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
            <a class="weui_cell " href="${ctx}/wx/rank/output">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>工业总产值</p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
            <a class="weui_cell " href="${ctx}/wx/rank/vat">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>增值税</p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
        </div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	
</body>

</html>