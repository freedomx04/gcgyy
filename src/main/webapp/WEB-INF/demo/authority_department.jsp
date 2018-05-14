<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>部门</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="departmentMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">部门新增(department/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>name:</td><td><input type="text" class="add-name"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="add-description"/></td></tr>
						<tr><td>principal:</td><td><input type="text" class="add-principal"/></td></tr>
						<tr><td>areaId:</td><td><input type="text" class="add-areaId"/></td></tr>
						<!-- <tr><td>userIds:</td><td><input type="text" class="add-userIds"/></td></tr> -->
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
		<label class="font-bold">部门编辑(department/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="edit-departmentId"/></td></tr>
						<tr><td>name:</td><td><input type="text" class="edit-name"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="edit-description"/></td></tr>
						<tr><td>principal:</td><td><input type="text" class="edit-principal"/></td></tr>
						<tr><td>areaId:</td><td><input type="text" class="edit-areaId"/></td></tr>
						<!-- <tr><td>userIds:</td><td><input type="text" class="edit-userIds"/></td></tr> -->
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
		<label class="font-bold">部门删除(department/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentIds:</td><td><input type="text" class="delete-departmentIds"/></td></tr>
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
		<label class="font-bold">部门列表(department/list)</label>
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
		<label class="font-bold">部门详情(department/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="detail-departmentId"/></td></tr>
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
			
			var $add = $(".departmentMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "department/add",
					type: "POST",
					data: {
						name: $add.find(".add-name").val(),
						description: $add.find(".add-description").val(),
						principal: $add.find(".add-principal").val(),
						areaId: $add.find(".add-areaId").val(),
						/* userIds: $add.find(".add-userIds").val(), */
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".departmentMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "department/edit",
					type: "POST",
					data: {
						departmentId: $edit.find(".edit-departmentId").val(),
						name: $edit.find(".edit-name").val(),
						description: $edit.find(".edit-description").val(),
						principal: $edit.find(".edit-principal").val(),
						areaId: $edit.find(".edit-areaId").val(),
						/* userIds: $edit.find(".edit-userIds").val(), */
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".departmentMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "department/delete",
					type: "POST",
					data: {
						departmentIds: $delete.find(".delete-departmentIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".departmentMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "department/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".departmentMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "department/detail",
					type: "POST",
					data: {
						departmentId: $detail.find(".detail-departmentId").val()
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