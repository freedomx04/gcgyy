<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>用户</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="userMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">用户新增(user/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>username:</td><td><input type="text" class="add-username"/></td></tr>
						<tr><td>name:</td><td><input type="text" class="add-name"/></td></tr>
						<tr><td>officephone:</td><td><input type="text" class="add-officephone"/></td></tr>
						<tr><td>telephone:</td><td><input type="text" class="add-telephone"/></td></tr>
						<tr><td>sex:</td><td><input type="text" class="add-sex"/></td></tr>
						<tr><td>email:</td><td><input type="text" class="add-email"/></td></tr>
						<tr><td>address:</td><td><input type="text" class="add-address"/></td></tr>
						<tr><td>departmentId:</td><td><input type="text" class="add-departmentId"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="add-enterpriseId"/></td></tr>
						<tr><td>roleId:</td><td><input type="text" class="add-roleId"/></td></tr>
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
		<label class="font-bold">用户编辑(user/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="edit-userId"/></td></tr>
						<tr><td>name</td><td><input type="text" class="edit-name"/></td></tr>
						<tr><td>officephone</td><td><input type="text" class="edit-officephone"/></td></tr>
						<tr><td>telephone:</td><td><input type="text" class="edit-telephone"/></td></tr>
						<tr><td>sex:</td><td><input type="text" class="edit-sex"/></td></tr>
						<tr><td>email:</td><td><input type="text" class="edit-email"/></td></tr>
						<tr><td>address:</td><td><input type="text" class="edit-address"/></td></tr>
						<tr><td>departmentId:</td><td><input type="text" class="edit-departmentId"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="edit-enterpriseId"/></td></tr>
						<tr><td>roleId:</td><td><input type="text" class="edit-roleId"/></td></tr>
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
	
	<div class="status">
		<label class="font-bold">设置用户状态(user/status)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="status-userId"/></td></tr>
						<tr><td>status:</td><td><input type="text" class="status-status"/></td></tr>
						<tr><td><input type="button" class="status-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="status-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listBase">
		<label class="font-bold">用户基础信息列表(user/listBase)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="listBase-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listBase-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="list">
		<label class="font-bold">用户列表(user/list)</label>
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
		<label class="font-bold">用户列表分页(user/listPaging)</label>
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

	<div class="detail">
		<label class="font-bold">用户详情(user/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="detail-userId"/></td></tr>
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
	
	<div class="changePassword">
		<label class="font-bold">更改密码(user/changePassword)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="changePassword-userId"/></td></tr>
						<tr><td>oldPassword:</td><td><input type="text" class="changePassword-oldPassword"/></td></tr>
						<tr><td>newPassword:</td><td><input type="text" class="changePassword-newPassword"/></td></tr>
						<tr><td><input type="button" class="changePassword-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="changePassword-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="changeImage">
		<label class="font-bold">更改头像(user/changeImage)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="changeImage-userId"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="changeImage-imagePath"/></td></tr>
						<tr><td><input type="button" class="changeImage-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="changeImage-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="infoEdit">
		<label class="font-bold">用户中心编辑(user/infoEdit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="infoEdit-userId"/></td></tr>
						<tr><td>name:</td><td><input type="text" class="infoEdit-name"/></td></tr>
						<tr><td>sex:</td><td><input type="text" class="infoEdit-sex"/></td></tr>
						<tr><td>description:</td><td><input type="text" class="infoEdit-description"/></td></tr>
						<tr><td>position:</td><td><input type="text" class="infoEdit-position"/></td></tr>
						<tr><td>officephone:</td><td><input type="text" class="infoEdit-officephone"/></td></tr>
						<tr><td><input type="button" class="infoEdit-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="infoEdit-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="changeImage">
		<label class="font-bold">更改头像(user/changeImage)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="changeImage-userId"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="changeImage-imagePath"/></td></tr>
						<tr><td><input type="button" class="changeImage-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="changeImage-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listDispatcher">
		<label class="font-bold">派单员列表(user/listDispatcher)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="listDispatcher-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listDispatcher-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listMonitor">
		<label class="font-bold">监督员列表(user/listMonitor)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="listMonitor-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listMonitor-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".userMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "user/add",
					type: "POST",
					data: {
						username: $add.find(".add-username").val(),
						name: $add.find(".add-name").val(),
						officephone: $add.find(".add-officephone").val(),
						telephone: $add.find(".add-telephone").val(),
						sex: $add.find(".add-sex").val(),
						email: $add.find(".add-email").val(),
						address: $add.find(".add-address").val(),
						departmentId: $add.find(".add-departmentId").val(),
						enterpriseId: $add.find(".add-enterpriseId").val(),
						roleId: $add.find(".add-roleId").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".userMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "user/edit",
					type: "POST",
					data: {
						userId: $edit.find(".edit-userId").val(),
						name: $edit.find(".edit-name").val(),
						officephone: $edit.find(".edit-officephone").val(),
						telephone: $edit.find(".edit-telephone").val(),
						sex: $edit.find(".edit-sex").val(),
						email: $edit.find(".edit-email").val(),
						address: $edit.find(".edit-address").val(),
						departmentId: $edit.find(".edit-departmentId").val(),
						enterpriseId: $edit.find(".edit-enterpriseId").val(),
						roleId: $edit.find(".edit-roleId").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $status = $(".userMgr .status");
			$status.on("click", ".status-btn", function() {
				$.ajax({
					url: "user/status",
					type: "POST",
					data: {
						userId: $status.find(".status-userId").val(),
						status: $status.find(".status-status").val(),
					},
					success: function(data) {
						$status.find(".status-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$status.find(".status-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listBase = $(".userMgr .listBase");
			$listBase.on("click", ".listBase-btn", function() {
				$.ajax({
					url: "user/listBase",
					type: "POST",
					success: function(data) {
						$listBase.find(".listBase-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listBase.find(".listBase-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".userMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "user/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPaging = $(".userMgr .listPaging");
			$listPaging.on("click", ".listPaging-btn", function() {
				$.ajax({
					url: "user/listPaging",
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
			
			var $detail = $(".userMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "user/detail",
					type: "POST",
					data: {
						userId: $detail.find(".detail-userId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $changePassword = $(".userMgr .changePassword");
			$changePassword.on("click", ".changePassword-btn", function() {
				$.ajax({
					url: "user/changePassword",
					type: "POST",
					data: {
						userId: $changePassword.find(".changePassword-userId").val(),
						oldPassword: $k.util.encrptByDES($changePassword.find(".changePassword-oldPassword").val()),
						newPassword: $k.util.encrptByDES($changePassword.find(".changePassword-newPassword").val()),
					},
					success: function(data) {
						$changePassword.find(".changePassword-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$changePassword.find(".changePassword-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $changeImage = $(".userMgr .changeImage");
			$changeImage.on("click", ".changeImage-btn", function() {
				$.ajax({
					url: "user/changeImage",
					type: "POST",
					data: {
						userId: $changeImage.find(".changeImage-userId").val(),
						imagePath : $changeImage.find(".changeImage-imagePath").val(),
					},
					success: function(data) {
						$changeImage.find(".changeImage-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$changeImage.find(".changeImage-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $infoEdit = $(".userMgr .infoEdit");
			$infoEdit.on("click", ".infoEdit-btn", function() {
				$.ajax({
					url: "user/infoEdit",
					type: "POST",
					data: {
						userId: $infoEdit.find(".infoEdit-userId").val(),
						name: $infoEdit.find(".infoEdit-name").val(),
						sex: $infoEdit.find(".infoEdit-sex").val(),
						description: $infoEdit.find(".infoEdit-description").val(),
						position: $infoEdit.find(".infoEdit-position").val(),
						officephone: $infoEdit.find(".infoEdit-officephone").val(),
					},
					success: function(data) {
						$infoEdit.find(".infoEdit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$infoEdit.find(".infoEdit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listDispatcher = $(".userMgr .listDispatcher");
			$listDispatcher.on("click", ".listDispatcher-btn", function() {
				$.ajax({
					url: "user/listDispatcher",
					type: "POST",
					success: function(data) {
						$listDispatcher.find(".listDispatcher-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listDispatcher.find(".listDispatcher-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listMonitor = $(".userMgr .listMonitor");
			$listMonitor.on("click", ".listMonitor-btn", function() {
				$.ajax({
					url: "user/listMonitor",
					type: "POST",
					success: function(data) {
						$listMonitor.find(".listMonitor-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listMonitor.find(".listMonitor-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>