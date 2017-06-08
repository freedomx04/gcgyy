<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>上传下载</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="fileMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="upload">
		<form id="upload-file-form">
			<label for="upload-file-input">上传文件(uploadFile):</label> 
			<input id="upload-file-input" type="file" name="uploadfile" accept="*" /> 
			<input id="upload-file-btn" type="button" value="confirm" />
		</form>
		<div>
			<textarea class="upload-textarea" style="width: 800px; height: 150px;"></textarea>
		</div>
	</div>
	<div class="divide"></div>
	
	<div class="download">
		<label class="font-bold">下载文件(downloadFile?filepath=):</label>
		<div>
			<label for="download-file-input">文件路径:</label>
			<input id="download-file-input" type="text" style="width: 400px;"/>
 			<input id="download-file-btn" type="button" value="download"/>
		</div>
	</div>
	<div class="divide"></div>
	
	<div class="uploadImage">
		<form id="upload-image-form">
			<label for="upload-image-input">上传图片(uploadImage):</label> 
			<input id="upload-image-input" type="file" name="uploadImage" accept="*" /> 
			<input id="upload-image-btn" type="button" value="uploadImage" />
		</form>
		<div>
			<textarea class="uploadImage-textarea" style="width: 800px; height: 150px; margin-top: 20px;"></textarea>
		</div>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			var $fileMgr = $(".fileMgr");
			$fileMgr
			.on("click", "#upload-file-btn", function() {
				$.ajax({
					url: "uploadFile",
					type: "POST",
					data: new FormData($("#upload-file-form")[0]),
					enctype : 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					success: function(data) {
						$fileMgr.find(".upload-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(data) {
						$fileMgr.find(".upload-textarea").val(JSON.stringify(data, undefined, 4));
					}
				});
			})
			.on("click", "#download-file-btn", function() {
				location.href = "downloadFile?filepath=" + $("#download-file-input").val();
			})
			.on("click", "#upload-image-btn", function() {
				$.ajax({
					url: "uploadImage",
					type: "POST",
					data: new FormData($("#upload-image-form")[0]),
					enctype : 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					success: function(data) {
						$fileMgr.find(".uploadImage-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(data) {
						$fileMgr.find(".uploadImage-textarea").val(JSON.stringify(data, undefined, 4));
					}
				});
			});
		})(jQuery);
	</script>	
</body>
</html>
