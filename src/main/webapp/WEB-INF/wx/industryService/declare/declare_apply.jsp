<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>工业服务平台</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

</head>

<body class="wx-declare-apply">
	<div class="weui_panel">
    	<div class="weui_cell weui_cell_select">
            <div class="weui_cell_hd"><label for="" class="weui_label">申报文件:</label></div>
            <div class="weui_cell_bd weui_cell_primary">
            	<div class="weui_uploader_input_wrp">
                    <input class="weui_uploader_input" id="upload-file-input" type="file" accept="*"/>
                </div>
                <input type="text" id="attachName" name="attachName" class="am-form-field" style="display: none;"/>
				<input type="text" id="attachPath" name="attachPath" class="am-form-field" style="display: none;"/>
            </div>
        </div>
    	<div class="weui_cell">
    	   <div class="weui_cell_hd"><label for="" class="weui_label">申报描述:</label></div>
           <textarea class="weui_textarea" placeholder="请输入文本" rows="10" id="textarea-description"></textarea>
        </div>
    </div>
	
	<div class="weui_btn_area">
    	<a href="javascript:;" class="weui_btn weui_btn_primary btn-declare-apply">保存</a>
    </div>
    
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/utils.js"></script>
	
	<script type="text/javascript">
	$(function() {
		var $page = $(".wx-declare-apply");
		var declareId = $k.util.getRequestParam("declareId");
		
		$page
		.on('click', ".btn-declare-apply", function() {
			$.ajax({
				url: '${ctx}/declareApply/add',
				type: 'POST',
				data: {
					declareId: declareId,
					enterpriseId: 188,
					description: $page.find('#textarea-description').val(),
					attachPath: $page.find('#attachPath').val(),
					attachName: $page.find('#attachName').val()
				},
				success: function(ret) {
					if (ret.status == 0) {
						$.toast('保存成功');
						setTimeout(function () {
							window.location = '${ctx}/wx/declare?userId=115&index=1' + declareId;
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
		
		.on('change', '#upload-file-input', function() {
			alert("ssss")
		      $.ajax({
					url: "uploadFile",
					type: "POST",
					data: $(this).files[0],
					enctype : 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					success: function(data) {
						if(data.status=="0"){
							$page("#attachPath").val(data.data.filePath);
							$page("#attachName").val(data.data.fileName);
						}
					},
					error: function(data) {}
			});
	    });
	});
	</script>
	
</body>

</html>