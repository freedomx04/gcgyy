<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>区域</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="areaMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">区域新增(area/add)</label>
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
		<label class="font-bold">区域编辑(area/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>areaId:</td><td><input type="text" class="edit-areaId"/></td></tr>
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
		<label class="font-bold">区域删除(area/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>areaIds:</td><td><input type="text" class="delete-areaIds"/></td></tr>
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
		<label class="font-bold">区域列表(area/list)</label>
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
		<label class="font-bold">区域详情(area/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>areaId:</td><td><input type="text" class="detail-areaId"/></td></tr>
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
			
			var $add = $(".areaMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "area/add",
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
			
			var $edit = $(".areaMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "area/edit",
					type: "POST",
					data: {
						areaId: $edit.find(".edit-areaId").val(),
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
			
			var $delete = $(".areaMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "area/delete",
					type: "POST",
					data: {
						areaIds: $delete.find(".delete-areaIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".areaMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "area/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".areaMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "area/detail",
					type: "POST",
					data: {
						areaId: $detail.find(".detail-areaId").val()
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
