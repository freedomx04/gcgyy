<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>申报(工信委)</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="declareMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">申报新增(declare/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>itemName:</td><td><input type="text" class="add-itemName"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="add-description"/></td></tr>
						<tr><td>startTime:</td><td><input type="text" class="add-startTime datepicker"/></td></tr>
						<tr><td>endTime:</td><td><input type="text" class="add-endTime datepicker"/></td></tr>
						<tr><td>attachName:</td><td><input type="text" class="add-attachName"/></td></tr>
						<tr><td>attachPath:</td><td><input type="text" class="add-attachPath"/></td></tr>
						<tr><td>userId:</td><td><input type="text" class="add-userId"/></td></tr>
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
		<label class="font-bold">申报编辑(declare/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareId:</td><td><input type="text" class="edit-declareId"/></td></tr>
						<tr><td>itemName:</td><td><input type="text" class="edit-itemName"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="edit-description"/></td></tr>
						<tr><td>startTime:</td><td><input type="text" class="edit-startTime datepicker"/></td></tr>
						<tr><td>endTime:</td><td><input type="text" class="edit-endTime datepicker"/></td></tr>
						<tr><td>attachName:</td><td><input type="text" class="edit-attachName"/></td></tr>
						<tr><td>attachPath:</td><td><input type="text" class="edit-attachPath"/></td></tr>
						<tr><td>userId:</td><td><input type="text" class="edit-userId"/></td></tr>
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
		<label class="font-bold">申报删除(declare/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareIds:</td><td><input type="text" class="delete-declareIds"/></td></tr>
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
	
	<div class="list">
		<label class="font-bold">申报列表(declare/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="list-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="list-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listPaging">
		<label class="font-bold">申报列表分页(declare/listPaging)</label>
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
					<textarea class="listPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByUserId">
		<label class="font-bold">根据UserId获取申报列表(declare/listByUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="listByUserId-userId"/></td></tr>
						<tr><td><input type="button" class="listByUserId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByUserId-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByUserIdPaging">
		<label class="font-bold">根据UserId获取申报列表分页(declare/listByUserIdPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="listByUserIdPaging-userId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByUserIdPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByUserIdPaging-size"/></td></tr>
						<tr><td><input type="button" class="listByUserIdPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByUserIdPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listOnline">
		<label class="font-bold">上架申报列表(declare/listOnline)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listOnline-enterpriseId"/></td></tr>
						<tr><td><input type="button" class="listOnline-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listOnline-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listOnlinePaging">
		<label class="font-bold">上架申报列表分页(declare/listOnlinePaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listOnlinePaging-enterpriseId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listOnlinePaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listOnlinePaging-size"/></td></tr>
						<tr><td><input type="button" class="listOnlinePaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listOnlinePaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="detail">
		<label class="font-bold">申报详情(declare/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareId:</td><td><input type="text" class="detail-declareId"/></td></tr>
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
	
	<div class="online">
		<label class="font-bold">上架(declare/online)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareId:</td><td><input type="text" class="online-declareId"/></td></tr>
						<tr><td><input type="button" class="online-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="online-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="downline">
		<label class="font-bold">下架(declare/downline)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>declareId:</td><td><input type="text" class="downline-declareId"/></td></tr>
						<tr><td><input type="button" class="downline-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="downline-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			$(".declareMgr").find(".datepicker").datepicker();
			
			var $add = $(".declareMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "declare/add",
					type: "POST",
					data: {
						itemName: $add.find(".add-itemName").val(),
						description: $add.find(".add-description").val(),
						startTime: strToDate($add.find(".add-startTime").val()),
						endTime: strToDate($add.find(".add-endTime").val()),
						attachName: $add.find(".add-attachName").val(),
						attachPath: $add.find(".add-attachPath").val(),
						userId: $add.find(".add-userId").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".declareMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "declare/edit",
					type: "POST",
					data: {
						declareId: $edit.find(".edit-declareId").val(),
						itemName: $edit.find(".edit-itemName").val(),
						description: $edit.find(".edit-description").val(),
						startTime: strToDate($edit.find(".edit-startTime").val()),
						endTime: strToDate($edit.find(".edit-endTime").val()),
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
			
			var $delete = $(".declareMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "declare/delete",
					type: "POST",
					data: {
						declareIds: $delete.find(".delete-declareIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".declareMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "declare/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPaging = $(".declareMgr .listPaging");
			$listPaging.on("click", ".listPaging-btn", function() {
				$.ajax({
					url: "declare/listPaging",
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
			
			var $listByUserId = $(".declareMgr .listByUserId");
			$listByUserId.on("click", ".listByUserId-btn", function() {
				$.ajax({
					url: "declare/listByUserId",
					type: "POST",
					data: {
						userId: $listByUserId.find(".listByUserId-userId").val(),
					},
					success: function(data) {
						$listByUserId.find(".listByUserId-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByUserId.find(".listByUserId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByUserIdPaging = $(".declareMgr .listByUserIdPaging");
			$listByUserIdPaging.on("click", ".listByUserIdPaging-btn", function() {
				$.ajax({
					url: "declare/listByUserIdPaging",
					type: "POST",
					data: {
						userId: $listByUserIdPaging.find(".listByUserIdPaging-userId").val(),
						page: $listByUserIdPaging.find(".listByUserIdPaging-page").val(),
						size: $listByUserIdPaging.find(".listByUserIdPaging-size").val(),
					},
					success: function(data) {
						$listByUserIdPaging.find(".listByUserIdPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByUserIdPaging.find(".listByUserIdPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listOnline = $(".declareMgr .listOnline");
			$listOnline.on("click", ".listOnline-btn", function() {
				$.ajax({
					url: "declare/listOnline",
					type: "POST",
					data: {
						enterpriseId: $listOnline.find(".listOnline-enterpriseId").val(),
					},
					success: function(data) {
						$listOnline.find(".listOnline-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listOnline.find(".listOnline-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listOnlinePaging = $(".declareMgr .listOnlinePaging");
			$listOnlinePaging.on("click", ".listOnlinePaging-btn", function() {
				$.ajax({
					url: "declare/listOnlinePaging",
					type: "POST",
					data: {
						enterpriseId: $listOnlinePaging.find(".listOnlinePaging-enterpriseId").val(),
						page: $listOnlinePaging.find(".listOnlinePaging-page").val(),
						size: $listOnlinePaging.find(".listOnlinePaging-size").val(),
					},
					success: function(data) {
						$listOnlinePaging.find(".listOnlinePaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listOnlinePaging.find(".listOnlinePaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".declareMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "declare/detail",
					type: "POST",
					data: {
						declareId: $detail.find(".detail-declareId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $online = $(".declareMgr .online");
			$online.on("click", ".online-btn", function() {
				$.ajax({
					url: "declare/online",
					type: "POST",
					data: {
						declareId: $online.find(".online-declareId").val()
					},
					success: function(data) {
						$online.find(".online-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$online.find(".online-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $downline = $(".declareMgr .downline");
			$downline.on("click", ".downline-btn", function() {
				$.ajax({
					url: "declare/downline",
					type: "POST",
					data: {
						declareId: $downline.find(".downline-declareId").val()
					},
					success: function(data) {
						$downline.find(".downline-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$downline.find(".downline-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			function strToDate(str) {
				if (str == "") {
					return undefined;
				}
				var val = Date.parse(str);
				var newDate = new Date(val);
				return newDate;
			}
			
		})(jQuery);
	</script>
</body>
</html>
