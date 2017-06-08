<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>推送</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="pushMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	
	<div class="delete">
		<label class="font-bold">推送删除(push/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>pushIds:</td><td><input type="text" class="delete-pushIds"/></td></tr>
						<tr><td colspan="2"><input type="button" class="delete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="delete-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByUserId">
		<label class="font-bold">根据用户ID获取推送列表(push/listByUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="listByUserId-userId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByUserId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByUserId-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByUserIdPaging">
		<label class="font-bold">根据用户ID获取推送列表分页(push/listByUserIdPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="listByUserIdPaging-userId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByUserIdPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByUserIdPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByUserIdPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByUserIdPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>

	<div class="detail">
		<label class="font-bold">推送详情(push/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>pushId:</td><td><input type="text" class="detail-pushId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="detail-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="detail-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="pushByUserId">
		<label class="font-bold">根据用户ID推送信息(push/pushByUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="pushByUserId-userId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="pushByUserId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="pushByUserId-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
	;(function($) {
		
		var $delete = $(".pushMgr .delete");
		$delete.on("click", ".delete-btn", function() {
			$.ajax({
				url: "push/delete",
				type: "POST",
				data: {
					pushIds: $delete.find(".delete-pushIds").val()
				},
				success: function(data) {
					$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByUserId = $(".pushMgr .listByUserId");
		$listByUserId.on("click", ".listByUserId-btn", function() {
			$.ajax({
				url: "push/listByUserId",
				type: "POST",
				data: {
					userId: $listByUserId.find(".listByUserId-userId").val()
				},
				success: function(data) {
					$listByUserId.find(".listByUserId-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByUserId.find(".listByUserId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByUserIdPaging = $(".pushMgr .listByUserIdPaging");
		$listByUserIdPaging.on("click", ".listByUserIdPaging-btn", function() {
			$.ajax({
				url: "push/listByUserIdPaging",
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
		
		var $detail = $(".pushMgr .detail");
		$detail.on("click", ".detail-btn", function() {
			$.ajax({
				url: "push/detail",
				type: "POST",
				data: {
					pushId: $detail.find(".detail-pushId").val()
				},
				success: function(data) {
					$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $pushByUserId = $(".pushMgr .pushByUserId");
		$pushByUserId.on("click", ".pushByUserId-btn", function() {
			$.ajax({
				url: "push/pushByUserId",
				type: "POST",
				data: {
					userId: $pushByUserId.find(".pushByUserId-userId").val()
				},
				success: function(data) {
					$pushByUserId.find(".pushByUserId-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$pushByUserId.find(".pushByUserId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
	})(jQuery);
	</script>
</body>
</html>
