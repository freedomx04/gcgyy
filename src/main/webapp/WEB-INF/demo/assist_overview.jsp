<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>Overview</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="overviewMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">add</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>title:</td><td><input type="text" class="add-title"/></td></tr>
						<tr><td>overviewTypeId:</td><td><input type="text" class="add-overviewTypeId"/></td></tr>
						<tr><td>allHtml:</td><td><input type="text" class="add-allHtml"/></td></tr>
						<tr><td><input type="button" class="add-btn" value="add"/></td></tr>
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
		<label class="font-bold">edit</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>overviewId:</td><td><input type="text" class="edit-overviewId"/></td></tr>
						<tr><td>title</td><td><input type="text" class="edit-title"/></td></tr>
						<tr><td>overviewTypeId:</td><td><input type="text" class="edit-overviewTypeId"/></td></tr>
						<tr><td>allHtml:</td><td><input type="text" class="edit-allHtml"/></td></tr>
						<tr><td><input type="button" class="edit-btn" value="edit"/></td></tr>
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
		<label class="font-bold">delete</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>overviewIds:</td><td><input type="text" class="delete-overviewIds"/></td></tr>
						<tr><td><input type="button" class="delete-btn" value="delete"/></td></tr>
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
		<label class="font-bold">list</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="list-btn" value="list"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="list-textarea" style="width: 400px; height: 250px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listPaging">
		<label class="font-bold">listPaging</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>page:</td><td><input type="text" class="listPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listPaging-size"/></td></tr>
						<tr><td><input type="button" class="listPaging-btn" value="listPaging"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listPaging-textarea" style="width: 400px; height: 250px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>

	<div class="detail">
		<label class="font-bold">detail</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>overviewId:</td><td><input type="text" class="detail-overviewId"/></td></tr>
						<tr><td><input type="button" class="detail-btn" value="detail"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="detail-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".overviewMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "overview/add",
					type: "POST",
					data: {
						title: $add.find(".add-title").val(),
						overviewTypeId: $add.find(".add-overviewTypeId").val(),
						allHtml: $add.find(".add-allHtml").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".overviewMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "overview/edit",
					type: "POST",
					data: {
						overviewId: $edit.find(".edit-overviewId").val(),
						title: $edit.find(".edit-title").val(),
						overviewTypeId: $edit.find(".edit-overviewTypeId").val(),
						allHtml: $edit.find(".edit-allHtml").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".overviewMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "overview/delete",
					type: "POST",
					data: {
						overviewIds: $delete.find(".delete-overviewIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".overviewMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "overview/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPaging = $(".overviewMgr .listPaging");
			$listPaging.on("click", ".listPaging-btn", function() {
				$.ajax({
					url: "overview/listPaging",
					type: "POST",
					data: {
						page: $listPaging.find(".listPaging-page").val(),
						size: $listPaging.find(".listPaging-size").val(),
					},
					success: function(data) {
						$listPaging.find(".listPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listPaging.find(".listPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".overviewMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "overview/detail",
					type: "POST",
					data: {
						overviewId: $detail.find(".detail-overviewId").val()
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
