<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>申报(企业)</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="declareApplyMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">申请新增(declareApply/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareId:</td><td><input type="text" class="add-declareId"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="add-enterpriseId"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="add-description"/></td></tr>
						<tr><td>attachName:</td><td><input type="text" class="add-attachName"/></td></tr>
						<tr><td>attachPath:</td><td><input type="text" class="add-attachPath"/></td></tr>
						<tr><td><input type="button" class="add-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="add-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="edit">
		<label class="font-bold">申请编辑(declareApply/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareApplyId:</td><td><input type="text" class="edit-declareApplyId"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="edit-description"/></td></tr>
						<tr><td>attachName:</td><td><input type="text" class="edit-attachName"/></td></tr>
						<tr><td>attachPath:</td><td><input type="text" class="edit-attachPath"/></td></tr>
						<tr><td><input type="button" class="edit-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="edit-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="delete">
		<label class="font-bold">申请删除(declareApply/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareApplyIds:</td><td><input type="text" class="delete-declareApplyIds"/></td></tr>
						<tr><td><input type="button" class="delete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="delete-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseId">
		<label class="font-bold">企业申请列表(declareApply/listByEnterpriseId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseId-enterpriseId"/></td></tr>
						<tr><td><input type="button" class="listByEnterpriseId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterpriseId-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseIdPaging">
		<label class="font-bold">企业申请列表分页(declareApply/listByEnterpriseIdPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseIdPaging-enterpriseId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByEnterpriseIdPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByEnterpriseIdPaging-size"/></td></tr>
						<tr><td><input type="button" class="listByEnterpriseIdPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterpriseIdPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>

	<div class="detail">
		<label class="font-bold">申请详情(declareApply/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareApplyId:</td><td><input type="text" class="detail-declareApplyId"/></td></tr>
						<tr><td><input type="button" class="detail-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="detail-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="approve">
		<label class="font-bold">审核(declareApply/approve)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareApplyId:</td><td><input type="text" class="approve-declareApplyId"/></td></tr>
						<tr><td>status:</td><td><input type="text" class="approve-status"/></td></tr>
						<tr><td>opinion:</td><td><input type="text" class="approve-opinion"/></td></tr>
						<tr><td>类型:</td><tr>
						<tr><td>0： 新增</td><tr>
						<tr><td>1： 未审核</td><tr>
						<tr><td>2： 通过</td><tr>
						<tr><td>3： 未通过</td><tr>
						<tr><td><input type="button" class="approve-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="approve-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".declareApplyMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "declareApply/add",
					type: "POST",
					data: {
						declareId: $add.find(".add-declareId").val(),
						enterpriseId: $add.find(".add-enterpriseId").val(),
						description: $add.find(".add-description").val(),
						attachName: $add.find(".add-attachName").val(),
						attachPath: $add.find(".add-attachPath").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".declareApplyMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "declareApply/edit",
					type: "POST",
					data: {
						declareApplyId: $edit.find(".edit-declareApplyId").val(),
						description: $edit.find(".edit-description").val(),
						attachName: $edit.find(".edit-attachName").val(),
						attachPath: $edit.find(".edit-attachPath").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".declareApplyMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "declareApply/delete",
					type: "POST",
					data: {
						declareApplyIds: $delete.find(".delete-declareApplyIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByEnterpriseId = $(".declareApplyMgr .listByEnterpriseId");
			$listByEnterpriseId.on("click", ".listByEnterpriseId-btn", function() {
				$.ajax({
					url: "declareApply/listByEnterpriseId",
					type: "POST",
					data: {
						enterpriseId: $listByEnterpriseId.find(".listByEnterpriseId-enterpriseId").val()
					},
					success: function(data) {
						$listByEnterpriseId.find(".listByEnterpriseId-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByEnterpriseId.find(".listByEnterpriseId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByEnterpriseIdPaging = $(".declareApplyMgr .listByEnterpriseIdPaging");
			$listByEnterpriseIdPaging.on("click", ".listByEnterpriseIdPaging-btn", function() {
				$.ajax({
					url: "declareApply/listByEnterpriseIdPaging",
					type: "POST",
					data: {
						enterpriseId: $listByEnterpriseIdPaging.find(".listByEnterpriseIdPaging-enterpriseId").val(),
						page: $listByEnterpriseIdPaging.find(".listByEnterpriseIdPaging-page").val(),
						size: $listByEnterpriseIdPaging.find(".listByEnterpriseIdPaging-size").val(),
					},
					success: function(data) {
						$listByEnterpriseIdPaging.find(".listByEnterpriseIdPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByEnterpriseIdPaging.find(".listByEnterpriseIdPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".declareApplyMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "declareApply/detail",
					type: "POST",
					data: {
						declareApplyId: $detail.find(".detail-declareApplyId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $approve = $(".declareApplyMgr .approve");
			$approve.on("click", ".approve-btn", function() {
				$.ajax({
					url: "declareApply/approve",
					type: "POST",
					data: {
						declareApplyId: $approve.find(".approve-declareApplyId").val(),
						status: $approve.find(".approve-status").val(),
						opinion: $approve.find(".approve-opinion").val(),
					},
					success: function(data) {
						$approve.find(".approve-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$approve.find(".approve-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>
