<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>动态</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="dynamicMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">动态新增(dynamic/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>title:</td><td><input type="text" class="add-title"/></td></tr>
						<tr><td>type:</td><td><input type="text" class="add-type"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="add-imagePath"/></td></tr>
						<tr><td>content:</td><td><input type="text" class="add-content"/></td></tr>
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
		<label class="font-bold">动态编辑(dynamic/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>dynamicId:</td><td><input type="text" class="edit-dynamicId"/></td></tr>
						<tr><td>title:</td><td><input type="text" class="edit-title"/></td></tr>
						<tr><td>type:</td><td><input type="text" class="edit-type"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="edit-imagePath"/></td></tr>
						<tr><td>content:</td><td><input type="text" class="edit-content"/></td></tr>
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
		<label class="font-bold">动态删除(dynamic/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>dynamicIds:</td><td><input type="text" class="delete-dynamicIds"/></td></tr>
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
		<label class="font-bold">动态列表(dynamic/list)</label>
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
	
	<div class="listPaging">
		<label class="font-bold">动态列表分页(dynamic/listPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>page:</td><td><input type="text" class="listPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listPaging-size"/></td></tr>
						<tr><td><input type="button" class="listPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByType">
		<label class="font-bold">根据类型获取动态列表(dynamic/listByType)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>type:</td><td><input type="text" class="listByType-type"/></td></tr>
						<tr><td><input type="button" class="listByType-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByType-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByTypePaging">
		<label class="font-bold">根据类型获取动态列表分页(dynamic/listByTypePaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>type:</td><td><input type="text" class="listByTypePaging-type"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByTypePaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByTypePaging-size"/></td></tr>
						<tr><td><input type="button" class="listByTypePaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByTypePaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>	

	<div class="detail">
		<label class="font-bold">动态详情(dynamic/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>dynamicId:</td><td><input type="text" class="detail-dynamicId"/></td></tr>
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
			
			var $add = $(".dynamicMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "dynamic/add",
					type: "POST",
					data: {
						title: $add.find(".add-title").val(),
						type: $add.find(".add-type").val(),
						imagePath: $add.find(".add-imagePath").val(),
						content: $add.find(".add-content").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".dynamicMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "dynamic/edit",
					type: "POST",
					data: {
						dynamicId: $edit.find(".edit-dynamicId").val(),
						title: $edit.find(".edit-title").val(),
						type: $edit.find(".edit-type").val(),
						imagePath: $edit.find(".edit-imagePath").val(),
						content: $edit.find(".edit-content").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".dynamicMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "dynamic/delete",
					type: "POST",
					data: {
						dynamicIds: $delete.find(".delete-dynamicIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".dynamicMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "dynamic/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPaging = $(".dynamicMgr .listPaging");
			$listPaging.on("click", ".listPaging-btn", function() {
				$.ajax({
					url: "dynamic/listPaging",
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
			
			var $listByType = $(".dynamicMgr .listByType");
			$listByType.on("click", ".listByType-btn", function() {
				$.ajax({
					url: "dynamic/listByType",
					type: "POST",
					data: {
						type: $listByType.find(".listByType-type").val(),
					},
					success: function(data) {
						$listByType.find(".listByType-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByType.find(".listByType-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByTypePaging = $(".dynamicMgr .listByTypePaging");
			$listByTypePaging.on("click", ".listByTypePaging-btn", function() {
				$.ajax({
					url: "dynamic/listByTypePaging",
					type: "POST",
					data: {
						type: $listByTypePaging.find(".listByTypePaging-type").val(),
						page: $listByTypePaging.find(".listByTypePaging-page").val(),
						size: $listByTypePaging.find(".listByTypePaging-size").val(),
					},
					success: function(data) {
						$listByTypePaging.find(".listByTypePaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByTypePaging.find(".listByTypePaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".dynamicMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "dynamic/detail",
					type: "POST",
					data: {
						dynamicId: $detail.find(".detail-dynamicId").val()
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
