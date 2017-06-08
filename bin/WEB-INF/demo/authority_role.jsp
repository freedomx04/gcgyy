<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>角色</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="roleMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">角色新增(role/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>name:</td><td><input type="text" class="add-name"/></td></tr>
						<tr><td>code:</td><td><input type="text" class="add-code"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="add-description"/></td></tr>
						<tr><td>resource:</td><td><input type="text" class="add-resource"/></td></tr>
						<tr><td colspan="2"><input type="button" class="add-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">角色编辑(role/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>roleId:</td><td><input type="text" class="edit-roleId"/></td></tr>
						<tr><td>name</td><td><input type="text" class="edit-name"/></td></tr>
						<tr><td>code</td><td><input type="text" class="edit-code"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="edit-description"/></td></tr>
						<tr><td>resource:</td><td><input type="text" class="edit-resource"/></td></tr>
						<tr><td colspan="2"><input type="button" class="edit-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">角色删除(role/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>roleIds:</td><td><input type="text" class="delete-roleIds"/></td></tr>
						<tr><td colspan="2"><input type="button" class="delete-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">角色列表(role/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="list-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">角色详情(role/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>roleId:</td><td><input type="text" class="detail-roleId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="detail-btn" value="confirm"/></td></tr>
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
			
			var $add = $(".roleMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "role/add",
					type: "POST",
					data: {
						name: $add.find(".add-name").val(),
						code: $add.find(".add-code").val(),
						description: $add.find(".add-description").val(),
						resource: $add.find(".add-resource").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".roleMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "role/edit",
					type: "POST",
					data: {
						roleId: $edit.find(".edit-roleId").val(),
						name: $edit.find(".edit-name").val(),
						code: $edit.find(".edit-code").val(),
						description: $edit.find(".edit-description").val(),
						resource: $edit.find(".edit-resource").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".roleMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "role/delete",
					type: "POST",
					data: {
						roleIds: $delete.find(".delete-roleIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".roleMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "role/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".roleMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "role/detail",
					type: "POST",
					data: {
						roleId: $detail.find(".detail-roleId").val()
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