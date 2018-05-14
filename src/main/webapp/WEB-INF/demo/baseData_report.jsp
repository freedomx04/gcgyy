<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>上报时间</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="reportMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">上报时间新增(report/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>type:</td><td><input type="text" class="add-type"/></td></tr>
						<tr><td>days:</td><td><input type="text" class="add-days"/></td></tr>
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
		<label class="font-bold">上报时间编辑(report/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>reportId:</td><td><input type="text" class="edit-reportId"/></td></tr>
						<tr><td>days:</td><td><input type="text" class="edit-days"/></td></tr>
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
		<label class="font-bold">上报时间删除(report/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>reportIds:</td><td><input type="text" class="delete-reportIds"/></td></tr>
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
		<label class="font-bold">上报时间列表(report/list)</label>
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

	<div class="detail">
		<label class="font-bold">上报时间详情(report/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>reportId:</td><td><input type="text" class="detail-reportId"/></td></tr>
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
	
	<script type="text/javascript">
		;(function($) {
			var $apply = $(".receiveMgr .apply");
			
			var $add = $(".reportMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "report/add",
					type: "POST",
					data: {
						type: $add.find(".add-type").val(),
						days: $add.find(".add-days").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".reportMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "report/edit",
					type: "POST",
					data: {
						reportId: $edit.find(".edit-reportId").val(),
						days: $edit.find(".edit-days").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".reportMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "report/delete",
					type: "POST",
					data: {
						reportIds: $delete.find(".delete-reportIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".reportMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "report/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".reportMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "report/detail",
					type: "POST",
					data: {
						reportId: $detail.find(".detail-reportId").val()
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
