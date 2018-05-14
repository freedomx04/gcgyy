<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>Appeal</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="appealMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">诉求新增(appeal/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="add-enterpriseId"/></td></tr>
						<tr><td>title:</td><td><input type="text" class="add-title"/></td></tr>
						<tr><td>appealTypeId:</td><td><input type="text" class="add-appealTypeId"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="add-description"/></td></tr>
						<tr><td colspan="2"><input type="button" class="add-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">诉求编辑(appeal/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="edit-appealId"/></td></tr>
						<tr><td>title:</td><td><input type="text" class="edit-title"/></td></tr>
						<tr><td>appealTypeId:</td><td><input type="text" class="edit-appealTypeId"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="edit-description"/></td></tr>
						<tr><td colspan="2"><input type="button" class="edit-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">诉求删除(appeal/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealIds:</td><td><input type="text" class="delete-appealIds"/></td></tr>
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
	
	<div class="list">
		<label class="font-bold">诉求列表(appeal/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="list-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">诉求列表分页(appeal/listPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>page:</td><td><input type="text" class="listPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByUserId">
		<label class="font-bold">根据用户ID获取诉求列表(appeal/listByUserId)</label>
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
		<label class="font-bold">根据用户ID获取诉求列表分页(appeal/listByUserIdPaging)</label>
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
	
	<div class="listByPointUserId">
		<label class="font-bold">根据挂点人ID获取诉求列表(appeal/listByPointUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>pointUserId:</td><td><input type="text" class="listByPointUserId-pointUserId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByPointUserId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByPointUserId-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByPointUserIdPaging">
		<label class="font-bold">根据挂点人ID获取诉求列表分页(appeal/listByPointUserIdPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>pointUserId:</td><td><input type="text" class="listByPointUserIdPaging-pointUserId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByPointUserIdPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByPointUserIdPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByPointUserIdPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByPointUserIdPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listUnconfirm">
		<label class="font-bold">未办结诉求列表(appeal/listUnconfirm)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="listUnconfirm-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listUnconfirm-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listUnconfirmPaging">
		<label class="font-bold">未办结诉求列表分页(appeal/listUnconfirmPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>page:</td><td><input type="text" class="listUnconfirmPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listUnconfirmPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listUnconfirmPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listUnconfirmPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listConfirmed">
		<label class="font-bold">已办结列表(appeal/listConfirmed)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="listConfirmed-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listConfirmed-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listConfirmedPaging">
		<label class="font-bold">已办结列表分页(appeal/listConfirmedPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>page:</td><td><input type="text" class="listConfirmedPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listConfirmedPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listConfirmedPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listConfirmedPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByAppealTypeId">
		<label class="font-bold">根据诉求类别获取列表(appeal/listByAppealTypeId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealTypeId:</td><td><input type="text" class="listByAppealTypeId-appealTypeId"/></td></tr>
						<tr><td>departmentId:</td><td><input type="text" class="listByAppealTypeId-departmentId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByAppealTypeId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByAppealTypeId-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByAppealTypeIdPaging">
		<label class="font-bold">根据诉求类别获取列表分页(appeal/listByAppealTypeIdPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealTypeId:</td><td><input type="text" class="listByAppealTypeIdPaging-appealTypeId"/></td></tr>
						<tr><td>departmentId:</td><td><input type="text" class="listByAppealTypeIdPaging-departmentId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByAppealTypeIdPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByAppealTypeIdPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByAppealTypeIdPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByAppealTypeIdPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="detail">
		<label class="font-bold">诉求详情(appeal/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="detail-appealId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="detail-btn" value="confirm"/></td></tr>
						<tr><td>status:</td><tr>
						<tr><td>0： 新增</td><tr>
						<tr><td>1： 待派发</td><tr>
						<tr><td>2： 待处理</td><tr>
						<tr><td>3： 处理中</td><tr>
						<tr><td>4： 处理完/待确认</td><tr>
						<tr><td>5： 办结</td><tr>
						<tr><td>6： 驳回</td><tr>
					</table>
				</td>
				<td>
					<textarea class="detail-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="send">
		<label class="font-bold">诉求发送(appeal/send)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="send-appealId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="send-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="send-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="dispatch">
		<label class="font-bold">诉求派发(appeal/dispatch)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="dispatch-appealId"/></td></tr>
						<tr><td>departmentId:</td><td><input type="text" class="dispatch-departmentId"/></td></tr>
						<tr><td>dispatchOpinion:</td><td><input type="text" class="dispatch-dispatchOpinion"/></td></tr>
						<tr><td colspan="2"><input type="button" class="dispatch-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="dispatch-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="urge">
		<label class="font-bold">诉求催办(appeal/urge)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="urge-appealId"/></td></tr>
						<tr><td>userId:</td><td><input type="text" class="urge-userId"/></td></tr>
						<tr><td>content:</td><td><input type="text" class="urge-content"/></td></tr>
						<tr><td colspan="2"><input type="button" class="urge-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="urge-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listUrge">
		<label class="font-bold">诉求催办列表(appeal/listUrge)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="listUrge-appealId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listUrge-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listUrge-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listUrgePaging">
		<label class="font-bold">诉求催办列表分页(appeal/listUrgePaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="listUrgePaging-appealId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listUrgePaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listUrgePaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listUrgePaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listUrgePaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="reject">
		<label class="font-bold">诉求驳回(appeal/reject)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="reject-appealId"/></td></tr>
						<tr><td>rejectOpinion:</td><td><input type="text" class="reject-rejectOpinion"/></td></tr>
						<tr><td colspan="2"><input type="button" class="reject-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="reject-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="accept">
		<label class="font-bold">诉求受理(appeal/accept)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="accept-appealId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="accept-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="accept-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="handle">
		<label class="font-bold">诉求处理(appeal/handle)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="handle-appealId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="handle-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="handle-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="confirm">
		<label class="font-bold">诉求确认办结(appeal/confirm)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>appealId:</td><td><input type="text" class="confirm-appealId"/></td></tr>
						<tr><td>acceptSpeed:</td><td><input type="text" class="confirm-acceptSpeed"/></td></tr>
						<tr><td>processSpeed:</td><td><input type="text" class="confirm-processSpeed"/></td></tr>
						<tr><td>result:</td><td><input type="text" class="confirm-result"/></td></tr>
						<tr><td>evaluation:</td><td><input type="text" class="confirm-evaluation"/></td></tr>
						<tr><td colspan="2"><input type="button" class="confirm-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="confirm-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="typeCount">
		<label class="font-bold">诉求记录数(按诉求分类)(appeal/getAppealCountByType)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="typeCount-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="typeCount-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="daysCount">
		<label class="font-bold">预警诉求记录数(appeal/overAppealDaysCount)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="daysCount-departmentId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="daysCount-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="daysCount-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="overDays">
		<label class="font-bold">所有预警诉求(appeal/overAppealDays)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="overDays-departmentId"/></td></tr>
						<tr><td>appealTypeId:</td><td><input type="text" class="overDays-appealTypeId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="overDays-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="overDays-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="overDays-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="overDays-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".appealMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "appeal/add",
					type: "POST",
					data: {
						enterpriseId: $add.find(".add-enterpriseId").val(),
						title: $add.find(".add-title").val(),
						appealTypeId: $add.find(".add-appealTypeId").val(),
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
			
			var $edit = $(".appealMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "appeal/edit",
					type: "POST",
					data: {
						appealId: $edit.find(".edit-appealId").val(),
						title: $edit.find(".edit-title").val(),
						appealTypeId: $edit.find(".edit-appealTypeId").val(),
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
			
			var $delete = $(".appealMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "appeal/delete",
					type: "POST",
					data: {
						appealIds: $delete.find(".delete-appealIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".appealMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "appeal/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPaging = $(".appealMgr .listPaging");
			$listPaging.on("click", ".listPaging-btn", function() {
				$.ajax({
					url: "appeal/listPaging",
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
			
			var $listByUserId = $(".appealMgr .listByUserId");
			$listByUserId.on("click", ".listByUserId-btn", function() {
				$.ajax({
					url: "appeal/listByUserId",
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
			
			var $listByUserIdPaging = $(".appealMgr .listByUserIdPaging");
			$listByUserIdPaging.on("click", ".listByUserIdPaging-btn", function() {
				$.ajax({
					url: "appeal/listByUserIdPaging",
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
			
			var $listByPointUserId = $(".appealMgr .listByPointUserId");
			$listByPointUserId.on("click", ".listByPointUserId-btn", function() {
				$.ajax({
					url: "appeal/listByPointUserId",
					type: "POST",
					data: {
						pointUserId: $listByPointUserId.find(".listByPointUserId-pointUserId").val(),
					},
					success: function(data) {
						$listByPointUserId.find(".listByPointUserId-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByPointUserId.find(".listByPointUserId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByPointUserIdPaging = $(".appealMgr .listByPointUserIdPaging");
			$listByPointUserIdPaging.on("click", ".listByPointUserIdPaging-btn", function() {
				$.ajax({
					url: "appeal/listByPointUserIdPaging",
					type: "POST",
					data: {
						pointUserId: $listByPointUserIdPaging.find(".listByPointUserIdPaging-pointUserId").val(),
						page: $listByPointUserIdPaging.find(".listByPointUserIdPaging-page").val(),
						size: $listByPointUserIdPaging.find(".listByPointUserIdPaging-size").val(),
					},
					success: function(data) {
						$listByPointUserIdPaging.find(".listByPointUserIdPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByPointUserIdPaging.find(".listByPointUserIdPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listUnconfirm = $(".appealMgr .listUnconfirm");
			$listUnconfirm.on("click", ".listUnconfirm-btn", function() {
				$.ajax({
					url: "appeal/listUnconfirm",
					type: "POST",
					success: function(data) {
						$listUnconfirm.find(".listUnconfirm-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listUnconfirm.find(".listUnconfirm-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listUnconfirmPaging = $(".appealMgr .listUnconfirmPaging");
			$listUnconfirmPaging.on("click", ".listUnconfirmPaging-btn", function() {
				$.ajax({
					url: "appeal/listUnconfirmPaging",
					type: "POST",
					data: { 
						page: $listUnconfirmPaging.find(".listUnconfirmPaging-page").val(),
						size: $listUnconfirmPaging.find(".listUnconfirmPaging-size").val(),
					},
					success: function(data) {
						$listUnconfirmPaging.find(".listUnconfirmPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listUnconfirmPaging.find(".listUnconfirmPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listConfirmed = $(".appealMgr .listConfirmed");
			$listConfirmed.on("click", ".listConfirmed-btn", function() {
				$.ajax({
					url: "appeal/listConfirmed",
					type: "POST",
					success: function(data) {
						$listConfirmed.find(".listConfirmed-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listConfirmed.find(".listConfirmed-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listConfirmedPaging = $(".appealMgr .listConfirmedPaging");
			$listConfirmedPaging.on("click", ".listConfirmedPaging-btn", function() {
				$.ajax({
					url: "appeal/listConfirmedPaging",
					type: "POST",
					data: { 
						page: $listConfirmedPaging.find(".listConfirmedPaging-page").val(),
						size: $listConfirmedPaging.find(".listConfirmedPaging-size").val(),
					},
					success: function(data) {
						$listConfirmedPaging.find(".listConfirmedPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listConfirmedPaging.find(".listConfirmedPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByAppealTypeId = $(".appealMgr .listByAppealTypeId");
			$listByAppealTypeId.on("click", ".listByAppealTypeId-btn", function() {
				$.ajax({
					url: "appeal/listByAppealTypeId",
					type: "POST",
					data: {
						appealTypeId: $listByAppealTypeId.find(".listByAppealTypeId-appealTypeId").val(),
						departmentId: $listByAppealTypeId.find(".listByAppealTypeId-departmentId").val(),
					},
					success: function(data) {
						$listByAppealTypeId.find(".listByAppealTypeId-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByAppealTypeId.find(".listByAppealTypeId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByAppealTypeIdPaging = $(".appealMgr .listByAppealTypeIdPaging");
			$listByAppealTypeIdPaging.on("click", ".listByAppealTypeIdPaging-btn", function() {
				$.ajax({
					url: "appeal/listByAppealTypeIdPaging",
					type: "POST",
					data: {
						appealTypeId: $listByAppealTypeIdPaging.find(".listByAppealTypeIdPaging-appealTypeId").val(),
						departmentId: $listByAppealTypeIdPaging.find(".listByAppealTypeIdPaging-departmentId").val(),
						page: $listByAppealTypeIdPaging.find(".listByAppealTypeIdPaging-page").val(),
						size: $listByAppealTypeIdPaging.find(".listByAppealTypeIdPaging-size").val(),
					},
					success: function(data) {
						$listByAppealTypeIdPaging.find(".listByAppealTypeIdPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByAppealTypeIdPaging.find(".listByAppealTypeIdPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $searchByEnterpriseName = $(".appealMgr .searchByEnterpriseName");
			$searchByEnterpriseName.on("click", ".searchByEnterpriseName-btn", function() {
				$.ajax({
					url: "appeal/searchByEnterpriseName",
					type: "POST",
					data: {
						name: $searchByEnterpriseName.find(".searchByEnterpriseName-name").val(),
					},
					success: function(data) {
						$searchByEnterpriseName.find(".searchByEnterpriseName-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$searchByEnterpriseName.find(".searchByEnterpriseName-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $searchByEnterpriseNamePaging = $(".appealMgr .searchByEnterpriseNamePaging");
			$searchByEnterpriseNamePaging.on("click", ".searchByEnterpriseNamePaging-btn", function() {
				$.ajax({
					url: "appeal/searchByEnterpriseNamePaging",
					type: "POST",
					data: {
						name: $searchByEnterpriseNamePaging.find(".searchByEnterpriseNamePaging-name").val(),
						page: $searchByEnterpriseNamePaging.find(".searchByEnterpriseNamePaging-page").val(),
						size: $searchByEnterpriseNamePaging.find(".searchByEnterpriseNamePaging-size").val(),
					},
					success: function(data) {
						$searchByEnterpriseNamePaging.find(".searchByEnterpriseNamePaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$searchByEnterpriseNamePaging.find(".searchByEnterpriseNamePaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".appealMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "appeal/detail",
					type: "POST",
					data: { appealId: $detail.find(".detail-appealId").val() },
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $send = $(".appealMgr .send");
			$send.on("click", ".send-btn", function() {
				$.ajax({
					url: "appeal/send",
					type: "POST",
					data: { 
						appealId: $send.find(".send-appealId").val(), 
					},
					success: function(data) {
						$send.find(".send-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$send.find(".send-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $dispatch = $(".appealMgr .dispatch");
			$dispatch.on("click", ".dispatch-btn", function() {
				$.ajax({
					url: "appeal/dispatch",
					type: "POST",
					data: { 
						appealId: $dispatch.find(".dispatch-appealId").val(),
						departmentId: $dispatch.find(".dispatch-departmentId").val(), 
						dispatchOpinion: $dispatch.find(".dispatch-dispatchOpinion").val(), 
					},
					success: function(data) {
						$dispatch.find(".dispatch-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$dispatch.find(".dispatch-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $urge = $(".appealMgr .urge");
			$urge.on("click", ".urge-btn", function() {
				$.ajax({
					url: "appeal/urge",
					type: "POST",
					data: { 
						appealId: $urge.find(".urge-appealId").val(), 
						userId: $urge.find(".urge-userId").val(), 
						content: $urge.find(".urge-content").val(),
					},
					success: function(data) {
						$urge.find(".urge-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$urge.find(".urge-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listUrge = $(".appealMgr .listUrge");
			$listUrge.on("click", ".listUrge-btn", function() {
				$.ajax({
					url: "appeal/listUrge",
					type: "POST",
					data: { 
						appealId: $listUrge.find(".listUrge-appealId").val(), 
					},
					success: function(data) {
						$listUrge.find(".listUrge-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listUrge.find(".listUrge-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listUrgePaging = $(".appealMgr .listUrgePaging");
			$listUrgePaging.on("click", ".listUrgePaging-btn", function() {
				$.ajax({
					url: "appeal/listUrgePaging",
					type: "POST",
					data: { 
						appealId: $listUrgePaging.find(".listUrgePaging-appealId").val(),
						page: $listUrgePaging.find(".listUrgePaging-page").val(),
						size: $listUrgePaging.find(".listUrgePaging-size").val(),
					},
					success: function(data) {
						$listUrgePaging.find(".listUrgePaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listUrgePaging.find(".listUrgePaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $reject = $(".appealMgr .reject");
			$reject.on("click", ".reject-btn", function() {
				$.ajax({
					url: "appeal/reject",
					type: "POST",
					data: { 
						appealId: $reject.find(".reject-appealId").val(), 
						rejectOpinion: $reject.find(".reject-rejectOpinion").val(),
					},
					success: function(data) {
						$reject.find(".reject-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$reject.find(".reject-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $accept = $(".appealMgr .accept");
			$accept.on("click", ".accept-btn", function() {
				$.ajax({
					url: "appeal/accept",
					type: "POST",
					data: { 
						appealId: $accept.find(".accept-appealId").val(), 
					},
					success: function(data) {
						$accept.find(".accept-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$accept.find(".accept-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $handle = $(".appealMgr .handle");
			$handle.on("click", ".handle-btn", function() {
				$.ajax({
					url: "appeal/handle",
					type: "POST",
					data: { 
						appealId: $handle.find(".handle-appealId").val(), 
					},
					success: function(data) {
						$handle.find(".handle-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$handle.find(".handle-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $confirm = $(".appealMgr .confirm");
			$confirm.on("click", ".confirm-btn", function() {
				$.ajax({
					url: "appeal/confirm",
					type: "POST",
					data: { 
						appealId: $confirm.find(".confirm-appealId").val(),
						acceptSpeed: $confirm.find(".confirm-acceptSpeed").val(),
						processSpeed: $confirm.find(".confirm-processSpeed").val(),
						result: $confirm.find(".confirm-result").val(),
						evaluation: $confirm.find(".confirm-evaluation").val(),
					},
					success: function(data) {
						$confirm.find(".confirm-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$confirm.find(".confirm-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $typeCount = $(".appealMgr .typeCount");
			$typeCount.on("click", ".typeCount-btn", function() {
				$.ajax({
					url: "appeal/getAppealCountByType",
					type: "POST",
					success: function(data) {
						$typeCount.find(".typeCount-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$typeCount.find(".typeCount-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $daysCount = $(".appealMgr .daysCount");
			$daysCount.on("click", ".daysCount-btn", function() {
				$.ajax({
					url: "appeal/overAppealDaysCount",
					type: "POST",
					data: {
						departmentId: $daysCount.find(".daysCount-departmentId").val(),
					},
					success: function(data) {
						$daysCount.find(".daysCount-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$daysCount.find(".daysCount-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $overDays = $(".appealMgr .overDays");
			$overDays.on("click", ".overDays-btn", function() {
				$.ajax({
					url: "appeal/overAppealDays",
					type: "POST",
					data: {
						departmentId: $overDays.find(".overDays-departmentId").val(),
						appealTypeId: $overDays.find(".overDays-appealTypeId").val(),
						page: $overDays.find(".overDays-page").val(),
						size: $overDays.find(".overDays-size").val()
					},
					success: function(data) {
						$overDays.find(".overDays-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$overDays.find(".overDays-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
		})(jQuery);
	</script>
</body>
</html>
