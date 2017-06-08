<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>求职信息</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="jobMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">求职新增(job/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="add-userId"/></td></tr>
						<tr><td>age:</td><td><input type="text" class="add-age"/></td></tr>
						<tr><td>businessId:</td><td><input type="text" class="add-businessId"/></td></tr>
						<tr><td>salary:</td><td><input type="text" class="add-salary"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="add-description"/></td></tr>
						<tr><td>experience:</td><td><input type="text" class="add-experience"/></td></tr>
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
		<label class="font-bold">求职编辑(job/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>jobId:</td><td><input type="text" class="edit-jobId"/></td></tr>
						<tr><td>userId:</td><td><input type="text" class="edit-userId"/></td></tr>
						<tr><td>age:</td><td><input type="text" class="edit-age"/></td></tr>
						<tr><td>businessId:</td><td><input type="text" class="edit-businessId"/></td></tr>
						<tr><td>salary:</td><td><input type="text" class="edit-salary"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="edit-description"/></td></tr>
						<tr><td>experience:</td><td><input type="text" class="edit-experience"/></td></tr>
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
		<label class="font-bold">求职删除(job/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>jobIds:</td><td><input type="text" class="delete-jobIds"/></td></tr>
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
		<label class="font-bold">求职列表(job/list)</label>
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
		<label class="font-bold">求职详情(job/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>jobId:</td><td><input type="text" class="detail-jobId"/></td></tr>
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
	
	<div class="findByUserId">
		<label class="font-bold">求职详情(job/findByUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="findByUserId-userId"/></td></tr>
						<tr><td><input type="button" class="findByUserId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="findByUserId-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listPaging">
		<label class="font-bold">求职信息分页列表(job/listPaging)</label>
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
	
	<div class="listPagingByUserId">
		<label class="font-bold">求职信息分页列表(job/listPagingByUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="listPagingByUserId-userId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listPagingByUserId-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listPagingByUserId-size"/></td></tr>
						<tr><td><input type="button" class="listPagingByUserId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listPagingByUserId-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			var $apply = $(".receiveMgr .apply");
			
			var $add = $(".jobMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "job/add",
					type: "POST",
					data: {
						userId: $add.find(".add-userId").val(),
						age: $add.find(".add-age").val(),
						businessId: $add.find(".add-businessId").val(),
						salary: $add.find(".add-salary").val(),
						description: $add.find(".add-description").val(),
						experience: $add.find(".add-experience").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".jobMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "job/edit",
					type: "POST",
					data: {
						jobId: $edit.find(".edit-jobId").val(),
						userId: $edit.find(".edit-userId").val(),
						age: $edit.find(".edit-age").val(),
						businessId: $edit.find(".edit-businessId").val(),
						salary: $edit.find(".edit-salary").val(),
						description: $edit.find(".edit-description").val(),
						experience: $edit.find(".edit-experience").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".jobMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "job/delete",
					type: "POST",
					data: {
						jobIds: $delete.find(".delete-jobIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".jobMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "job/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".jobMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "job/detail",
					type: "POST",
					data: {
						jobId: $detail.find(".detail-jobId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $findByUserId = $(".jobMgr .findByUserId");
			$findByUserId.on("click", ".findByUserId-btn", function() {
				$.ajax({
					url: "job/findByUserId",
					type: "POST",
					data: {
						userId: $findByUserId.find(".findByUserId-userId").val()
					},
					success: function(data) {
						$findByUserId.find(".findByUserId-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$findByUserId.find(".findByUserId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPaging = $(".jobMgr .listPaging");
			$listPaging.on("click", ".listPaging-btn", function() {
				$.ajax({
					url: "job/listPaging",
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
			
			var $listPagingByUserId = $(".jobMgr .listPagingByUserId");
			$listPagingByUserId.on("click", ".listPagingByUserId-btn", function() {
				$.ajax({
					url: "job/listPagingByUserId",
					type: "POST",
					data: {
						userId: $listPagingByUserId.find(".listPagingByUserId-userId").val(),
						page: $listPagingByUserId.find(".listPagingByUserId-page").val(),
						size: $listPagingByUserId.find(".listPagingByUserId-size").val(),
					},
					success: function(data) {
						$listPagingByUserId.find(".listPagingByUserId-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listPagingByUserId.find(".listPagingByUserId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
		})(jQuery);
	</script>
</body>
</html>
