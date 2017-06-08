<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>招工信息</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="hireMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">招工新增(hire/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>imagePath:</td><td><input type="text" class="add-imagePath"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="add-enterpriseId"/></td></tr>
						<tr><td>position:</td><td><input type="text" class="add-position"/></td></tr>
						<tr><td>telephone:</td><td><input type="text" class="add-telephone"/></td></tr>
						<tr><td>salary:</td><td><input type="text" class="add-salary"/></td></tr>
						<tr><td>businessId:</td><td><input type="text" class="add-businessId"/></td></tr>
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
		<label class="font-bold">招工编辑(hire/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>hireId:</td><td><input type="text" class="edit-hireId"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="edit-imagePath"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="edit-enterpriseId"/></td></tr>
						<tr><td>position:</td><td><input type="text" class="edit-position"/></td></tr>
						<tr><td>telephone:</td><td><input type="text" class="edit-telephone"/></td></tr>
						<tr><td>salary:</td><td><input type="text" class="edit-salary"/></td></tr>
						<tr><td>businessId:</td><td><input type="text" class="edit-businessId"/></td></tr>
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
		<label class="font-bold">招工删除(hire/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>hireIds:</td><td><input type="text" class="delete-hireIds"/></td></tr>
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
		<label class="font-bold">招工列表(hire/list)</label>
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
		<label class="font-bold">招工详情(hire/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>hireId:</td><td><input type="text" class="detail-hireId"/></td></tr>
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
	
	<div class="findByEnterpriseId">
		<label class="font-bold">根据用户关联企业Id显示该企业招工信息(hire/findByUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="findByEnterpriseId-userId"/></td></tr>
						<tr><td><input type="button" class="findByEnterpriseId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="findByEnterpriseId-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listPaging">
		<label class="font-bold">招工信息分页列表(hire/listPaging)</label>
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
	
	<div class="listPagingByEnterpriseId">
		<label class="font-bold">招工信息分页列表(hire/listPagingByUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="listPagingByEnterpriseId-userId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listPagingByEnterpriseId-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listPagingByEnterpriseId-size"/></td></tr>
						<tr><td><input type="button" class="listPagingByEnterpriseId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listPagingByEnterpriseId-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			var $apply = $(".receiveMgr .apply");
			
			var $add = $(".hireMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "hire/add",
					type: "POST",
					data: {
						imagePath: $add.find(".add-imagePath").val(),
						enterpriseId: $add.find(".add-enterpriseId").val(),
						position: $add.find(".add-position").val(),
						telephone: $add.find(".add-telephone").val(),
						salary:$add.find(".add-salary").val(),
						businessId: $add.find(".add-businessId").val(),
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
			
			var $edit = $(".hireMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "hire/edit",
					type: "POST",
					data: {
						hireId: $edit.find(".edit-hireId").val(),
						imagePath: $edit.find(".edit-imagePath").val(),
						enterpriseId: $edit.find(".edit-enterpriseId").val(),
						position: $edit.find(".edit-position").val(),
						telephone: $edit.find(".edit-telephone").val(),
						salary: $edit.find(".edit-salary").val(),
						businessId: $edit.find(".edit-businessId").val(),
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
			
			var $delete = $(".hireMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "hire/delete",
					type: "POST",
					data: {
						hireIds: $delete.find(".delete-hireIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".hireMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "hire/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".hireMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "hire/detail",
					type: "POST",
					data: {
						hireId: $detail.find(".detail-hireId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $findByEnterpriseId = $(".hireMgr .findByEnterpriseId");
			$findByEnterpriseId.on("click", ".findByEnterpriseId-btn", function() {
				$.ajax({
					url: "hire/findByUserId",
					type: "POST",
					data: {
						userId: $findByEnterpriseId.find(".findByEnterpriseId-userId").val()
					},
					success: function(data) {
						$findByEnterpriseId.find(".findByEnterpriseId-textarea")
						.val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$findByEnterpriseId.find(".findByEnterpriseId-textarea")
						.val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPaging = $(".hireMgr .listPaging");
			$listPaging.on("click", ".listPaging-btn", function() {
				$.ajax({
					url: "hire/listPaging",
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
			
			var $listPagingByEnterpriseId = $(".hireMgr .listPagingByEnterpriseId");
			$listPagingByEnterpriseId.on("click", ".listPagingByEnterpriseId-btn", function() {
				$.ajax({
					url: "hire/listPagingByUserId",
					type: "POST",
					data: {
						userId: $listPagingByEnterpriseId.find(".listPagingByEnterpriseId-userId").val(),
						page: $listPagingByEnterpriseId.find(".listPagingByEnterpriseId-page").val(),
						size: $listPagingByEnterpriseId.find(".listPagingByEnterpriseId-size").val(),
					},
					success: function(data) {
						$listPagingByEnterpriseId.find(".listPagingByEnterpriseId-textarea")
						.val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listPagingByEnterpriseId.find(".listPagingByEnterpriseId-textarea")
						.val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
		})(jQuery);
	</script>
</body>
</html>
