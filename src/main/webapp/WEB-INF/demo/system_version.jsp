<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>版本</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="versionMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<form id="version-upload-form">
			<label for="upload-file-input">版本上传:</label>
			<table>
				<tr>
					<td class="demo-td1">
						<table>
							<tr><td>code:</td><td><input type="text" class="add-code"/></td></tr>
							<tr><td>name:</td><td><input type="text" class="add-name"/></td></tr>
							<tr><td>description:</td><td><input type="text" class="add-description"/></td></tr>
							<tr><td colspan="2"><input id="add-file-input" type="file" name="uploadfile" accept="*" /></td></tr>
							<tr><td><input type="button" class="add-btn" value="confirm"/></td></tr>
						</table>
					</td>
					<td>
						<textarea class="add-textarea" style="width: 600px; height: 200px;"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="divide"></div>
	
	<div class="lastest">
		<label class="font-bold">获取最新版本(version/lastest)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="lastest-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="lastest-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="list">
		<label class="font-bold">版本列表(version/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="list-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="list-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="delete">
		<label class="font-bold">版本删除(version/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>versionIds:</td><td><input type="text" class="delete-versionIds"/></td></tr>
						<tr><td><input type="button" class="delete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="delete-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $versionMgr = $(".versionMgr");
			$versionMgr
			.on("click", ".add-btn", function() {
				$.ajax({
					url: "uploadFile",
					type: "POST",
					data: new FormData($("#version-upload-form")[0]),
					enctype : 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					success: function(ret) {
						$.ajax({
							url: "version/add",
							type: "POST",
							data: {
								code: $versionMgr.find(".add-code").val(),
								name: $versionMgr.find(".add-name").val(),
								description: $versionMgr.find(".add-description").val(),
								url: ret.data.filePath
							},
							success: function(data) {
								$versionMgr.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
							}, 
							error: function(data) {
								$versionMgr.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
							}
						});
					},
					error: function(ret) {
						$versionMgr.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					}
				});
			});
			
			var $lastest = $(".versionMgr .lastest");
			$lastest.on("click", ".lastest-btn", function() {
				$.ajax({
					url: "version/lastest",
					type: "POST",
					success: function(data) {
						$lastest.find(".lastest-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$lastest.find(".lastest-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".versionMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "version/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".versionMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "version/delete",
					type: "POST",
					data: {
						versionIds: $delete.find(".delete-versionIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>	
</body>
</html>
