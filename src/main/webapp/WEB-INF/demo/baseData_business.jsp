<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>行业</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="businessMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">行业新增(business/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>name:</td><td><input type="text" class="add-name"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="add-description"/></td></tr>
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
		<label class="font-bold">行业编辑(business/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>businessId:</td><td><input type="text" class="edit-businessId"/></td></tr>
						<tr><td>name</td><td><input type="text" class="edit-name"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="edit-description"/></td></tr>
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
		<label class="font-bold">行业删除(business/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>businessIds:</td><td><input type="text" class="delete-businessIds"/></td></tr>
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
		<label class="font-bold">行业列表(business/list)</label>
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
		<label class="font-bold">行业详情(business/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>businessId:</td><td><input type="text" class="detail-businessId"/></td></tr>
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
			var $apply = $(".receiveMgr .apply");
			
			var $add = $(".businessMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "business/add",
					type: "POST",
					data: {
						name: $add.find(".add-name").val(),
						description: $add.find(".add-description").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".businessMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "business/edit",
					type: "POST",
					data: {
						businessId: $edit.find(".edit-businessId").val(),
						name: $edit.find(".edit-name").val(),
						description: $edit.find(".edit-description").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".businessMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "business/delete",
					type: "POST",
					data: {
						businessIds: $delete.find(".delete-businessIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".businessMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "business/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".businessMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "business/detail",
					type: "POST",
					data: {
						businessId: $detail.find(".detail-businessId").val()
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
