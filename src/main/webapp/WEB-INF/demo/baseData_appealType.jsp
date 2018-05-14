<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>诉求类别</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="appealTypeMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">诉求类别新增(appealType/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>name:</td><td><input type="text" class="add-name"/></td></tr>
						<tr><td>acceptDays:</td><td><input type="text" class="add-acceptDays"/></td></tr>
						<tr><td>handleDays:</td><td><input type="text" class="add-handleDays"/></td></tr>
						<tr><td><input type="button" class="add-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="add-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="edit">
		<label class="font-bold">诉求类别编辑(appealType/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealTypeId:</td><td><input type="text" class="edit-appealTypeId"/></td></tr>
						<tr><td>name</td><td><input type="text" class="edit-name"/></td></tr>
						<tr><td>acceptDays:</td><td><input type="text" class="edit-acceptDays"/></td></tr>
						<tr><td>handleDays:</td><td><input type="text" class="edit-handleDays"/></td></tr>
						<tr><td><input type="button" class="edit-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="edit-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="delete">
		<label class="font-bold">诉求类别删除(appealType/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealTypeIds:</td><td><input type="text" class="delete-appealTypeIds"/></td></tr>
						<tr><td><input type="button" class="delete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="delete-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="list">
		<label class="font-bold">诉求类别列表(appealType/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="list-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="list-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>

	<div class="detail">
		<label class="font-bold">诉求类别详情(appealType/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealTypeId:</td><td><input type="text" class="detail-appealTypeId"/></td></tr>
						<tr><td><input type="button" class="detail-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="detail-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".appealTypeMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "appealType/add",
					type: "POST",
					data: {
						name: $add.find(".add-name").val(),
						acceptDays: $add.find(".add-acceptDays").val(),
						handleDays: $add.find(".add-handleDays").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".appealTypeMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "appealType/edit",
					type: "POST",
					data: {
						appealTypeId: $edit.find(".edit-appealTypeId").val(),
						name: $edit.find(".edit-name").val(),
						acceptDays: $edit.find(".edit-acceptDays").val(),
						handleDays: $edit.find(".edit-handleDays").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".appealTypeMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "appealType/delete",
					type: "POST",
					data: {
						appealTypeIds: $delete.find(".delete-appealTypeIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".appealTypeMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "appealType/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".appealTypeMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "appealType/detail",
					type: "POST",
					data: {
						appealTypeId: $detail.find(".detail-appealTypeId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
		})(jQuery);
	</script>
</body>
</html>
