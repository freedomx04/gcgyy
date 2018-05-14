<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>网上申报-审核</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

</head>

<body class="wx-declare-approve">
	<div class="weui_panel">
    	<div class="weui_cell weui_cell_select">
            <div class="weui_cell_hd"><label for="" class="weui_label">审核状态:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <select class="weui_select" name="status" id="status">
                	<option value="">请选择</option>
                    <option value="2">通过</option>
                    <option value="3">未通过</option>
                </select>
            </div>
        </div>
    	<div class="weui_cell">
    	   <div class="weui_cell_hd"><label for="" class="weui_label">审核原因:</label></div>
           <textarea class="weui_textarea" placeholder="请输入文本" rows="10" id="textarea-opinion"></textarea>
        </div>
    </div>
	
	<div class="weui_btn_area">
    	<a href="javascript:;" class="weui_btn weui_btn_primary btn-declare-approve">保存</a>
    </div>
    
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/utils.js"></script>
	
	<script type="text/javascript">
	$(function() {
		var $page = $(".wx-declare-approve");
		var declareApplyId = $k.util.getRequestParam("declareApplyId");
		
		$page.on('click', ".btn-declare-approve", function() {
			$.ajax({
				url: '${ctx}/declareApply/approve',
				type: 'POST',
				data: {
					declareApplyId: declareApplyId,
					status: $page.find('#status').val(),
					opinion: $page.find('#textarea-opinion').val()
				},
				success: function(ret) {
					if (ret.status == 0) {
						$.toast('保存成功');
						setTimeout(function () {
							window.location = '${ctx}/wx/declareApplyInfo?declareApplyId=' + declareApplyId + "&role=gv";
						}, 1000);
					} else {
						$.toast('保存失败!', 'cancel');
					}
				},
				error: function(err) {
					$.toast('保存失败!', 'cancel');
				}
			});
		})
	});
	</script>
	
</body>

</html>