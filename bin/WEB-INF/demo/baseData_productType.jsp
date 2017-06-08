<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>产品类型</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="productTypeMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">产品类型新增(productType/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>name:</td><td><input type="text" class="add-name"/></td></tr>
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
		<label class="font-bold">产品类型编辑(productType/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>productTypeId:</td><td><input type="text" class="edit-productTypeId"/></td></tr>
						<tr><td>name</td><td><input type="text" class="edit-name"/></td></tr>
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
		<label class="font-bold">产品类型删除(productType/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>productTypeIds:</td><td><input type="text" class="delete-productTypeIds"/></td></tr>
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
		<label class="font-bold">产品类型列表(productType/list)</label>
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
		<label class="font-bold">产品类型详情(productType/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>productTypeId:</td><td><input type="text" class="detail-productTypeId"/></td></tr>
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
			
			var $add = $(".productTypeMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "productType/add",
					type: "POST",
					data: {
						name: $add.find(".add-name").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".productTypeMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "productType/edit",
					type: "POST",
					data: {
						productTypeId: $edit.find(".edit-productTypeId").val(),
						name: $edit.find(".edit-name").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".productTypeMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "productType/delete",
					type: "POST",
					data: {
						productTypeIds: $delete.find(".delete-productTypeIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".productTypeMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "productType/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".productTypeMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "productType/detail",
					type: "POST",
					data: {
						productTypeId: $detail.find(".detail-productTypeId").val()
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
