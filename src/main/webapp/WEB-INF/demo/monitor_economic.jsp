<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>经济运行</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="economicMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">经济运行新增(economic/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="add-monthly"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="add-enterpriseId"/></td></tr>
						<tr><td>industryAddition:</td><td><input type="text" class="add-industryAddition"/></td></tr>
						<tr><td>mainBusiness:</td><td><input type="text" class="add-mainBusiness"/></td></tr>
						<tr><td>profit:</td><td><input type="text" class="add-profit"/></td></tr>
						<tr><td>tax:</td><td><input type="text" class="add-tax"/></td></tr>
						<tr><td colspan="2"><input type="button" class="add-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">经济运行编辑(economic/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>economicId:</td><td><input type="text" class="edit-economicId"/></td></tr>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="edit-monthly"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="edit-enterpriseId"/></td></tr>
						<tr><td>industryAddition:</td><td><input type="text" class="edit-industryAddition"/></td></tr>
						<tr><td>mainBusiness:</td><td><input type="text" class="edit-mainBusiness"/></td></tr>
						<tr><td>profit:</td><td><input type="text" class="edit-profit"/></td></tr>
						<tr><td>tax:</td><td><input type="text" class="edit-tax"/></td></tr>
						<tr><td colspan="2"><input type="button" class="edit-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">经济运行删除(economic/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>economicIds:</td><td><input type="text" class="delete-economicIds"/></td></tr>
						<tr><td colspan="2"><input type="button" class="delete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="delete-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="detail">
		<label class="font-bold">经济运行详情(economic/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>economicId:</td><td><input type="text" class="detail-economicId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="detail-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="detail-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByMonthly">
		<label class="font-bold">企业经济运行明细(economic/listByMonthly)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly:</td><td><input type="text" class="listByMonthly-monthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByMonthly-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByMonthly-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByMonthlyPaging">
		<label class="font-bold">企业经济运行明细分页(economic/listByMonthlyPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly:</td><td><input type="text" class="listByMonthlyPaging-monthly"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByMonthlyPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByMonthlyPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByMonthlyPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByMonthlyPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseId">
		<label class="font-bold">根据企业获取经济运行列表(economic/listByEnterpriseId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseId-enterpriseId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterpriseId-btn" value="confirm"/></td></tr>
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
		<label class="font-bold">根据企业获取经济运行列表分页(economic/listByEnterpriseIdPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseIdPaging-enterpriseId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByEnterpriseIdPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByEnterpriseIdPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterpriseIdPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterpriseIdPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByProductType">
		<label class="font-bold">行业经济运行明细(economic/listByProductType)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly:</td><td><input type="text" class="listByProductType-monthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByProductType-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByProductType-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByArea">
		<label class="font-bold">园区经济运行明细(economic/listByArea)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly:</td><td><input type="text" class="listByArea-monthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByArea-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByArea-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByMonthlyRange">
		<label class="font-bold">根据企业和月报范围获取经济运行明细(economic/listByMonthlyRange)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByMonthlyRange-enterpriseId"/></td></tr>
						<tr><td>monthlyStart:</td><td><input type="text" class="listByMonthlyRange-monthlyStart"/></td></tr>
						<tr><td>monthlyEnd:</td><td><input type="text" class="listByMonthlyRange-monthlyEnd"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByMonthlyRange-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByMonthlyRange-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="targetAdd">
		<label class="font-bold">新增企业工业增加值年度目标数(economic/targetAdd)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="targetAdd-enterpriseId"/></td></tr>
						<tr><td>year:</td><td><input type="text" class="targetAdd-year"/></td></tr>
						<tr><td>value:</td><td><input type="text" class="targetAdd-value"/></td></tr>
						<tr><td colspan="2"><input type="button" class="targetAdd-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="targetAdd-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="targetEdit">
		<label class="font-bold">编辑企业工业增加值年度目标数(economic/targetEdit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>economicTargetId:</td><td><input type="text" class="targetEdit-economicTargetId"/></td></tr>
						<tr><td>year:</td><td><input type="text" class="targetEdit-year"/></td></tr>
						<tr><td>value:</td><td><input type="text" class="targetEdit-value"/></td></tr>
						<tr><td colspan="2"><input type="button" class="targetEdit-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="targetEdit-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="report">
		<label class="font-bold">发送(economic/report)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>economicId:</td><td><input type="text" class="report-economicId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="report-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="report-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="pass">
		<label class="font-bold">通过(economic/pass)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>economicId:</td><td><input type="text" class="pass-economicId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="pass-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="pass-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="reject">
		<label class="font-bold">驳回(economic/reject)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>economicId:</td><td><input type="text" class="reject-economicId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="reject-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="reject-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".economicMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "economic/add",
					type: "POST",
					data: {
						monthly: $add.find(".add-monthly").val(),
						enterpriseId: $add.find(".add-enterpriseId").val(),
						industryAddition: $add.find(".add-industryAddition").val(),
						mainBusiness: $add.find(".add-mainBusiness").val(),
						profit: $add.find(".add-profit").val(),
						tax: $add.find(".add-tax").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".economicMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "economic/edit",
					type: "POST",
					data: {
						economicId: $edit.find(".edit-economicId").val(),
						monthly: $edit.find(".edit-monthly").val(),
						enterpriseId: $edit.find(".edit-enterpriseId").val(),
						industryAddition: $edit.find(".edit-industryAddition").val(),
						mainBusiness: $edit.find(".edit-mainBusiness").val(),
						profit: $edit.find(".edit-profit").val(),
						tax: $edit.find(".edit-tax").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".economicMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "economic/delete",
					type: "POST",
					data: {
						economicIds: $delete.find(".delete-economicIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".economicMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "economic/detail",
					type: "POST",
					data: {
						economicId: $detail.find(".detail-economicId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByMonthly = $(".economicMgr .listByMonthly");
			$listByMonthly.on("click", ".listByMonthly-btn", function() {
				$.ajax({
					url: "economic/listByMonthly",
					type: "POST",
					data: {
						monthly: $listByMonthly.find(".listByMonthly-monthly").val()
					},
					success: function(data) {
						$listByMonthly.find(".listByMonthly-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByMonthly.find(".listByMonthly-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByMonthlyPaging = $(".economicMgr .listByMonthlyPaging");
			$listByMonthlyPaging.on("click", ".listByMonthlyPaging-btn", function() {
				$.ajax({
					url: "economic/listByMonthlyPaging",
					type: "POST",
					data: {
						monthly: $listByMonthlyPaging.find(".listByMonthlyPaging-monthly").val(),
						page: $listByMonthlyPaging.find(".listByMonthlyPaging-page").val(),
						size: $listByMonthlyPaging.find(".listByMonthlyPaging-size").val(),
					},
					success: function(data) {
						$listByMonthlyPaging.find(".listByMonthlyPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByMonthlyPaging.find(".listByMonthlyPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByEnterpriseId = $(".economicMgr .listByEnterpriseId");
			$listByEnterpriseId.on("click", ".listByEnterpriseId-btn", function() {
				$.ajax({
					url: "economic/listByEnterpriseId",
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
			
			var $listByEnterpriseIdPaging = $(".economicMgr .listByEnterpriseIdPaging");
			$listByEnterpriseIdPaging.on("click", ".listByEnterpriseIdPaging-btn", function() {
				$.ajax({
					url: "economic/listByEnterpriseIdPaging",
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
			
			var $listByProductType = $(".economicMgr .listByProductType");
			$listByProductType.on("click", ".listByProductType-btn", function() {
				$.ajax({
					url: "economic/listByProductType",
					type: "POST",
					data: {
						monthly: $listByProductType.find(".listByProductType-monthly").val()
					},
					success: function(data) {
						$listByProductType.find(".listByProductType-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByProductType.find(".listByProductType-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByArea = $(".economicMgr .listByArea");
			$listByArea.on("click", ".listByArea-btn", function() {
				$.ajax({
					url: "economic/listByArea",
					type: "POST",
					data: {
						monthly: $listByArea.find(".listByArea-monthly").val()
					},
					success: function(data) {
						$listByArea.find(".listByArea-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByArea.find(".listByArea-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByMonthlyRange = $(".economicMgr .listByMonthlyRange");
			$listByMonthlyRange.on("click", ".listByMonthlyRange-btn", function() {
				$.ajax({
					url: "economic/listByMonthlyRange",
					type: "POST",
					data: {
						enterpriseId: $listByMonthlyRange.find(".listByMonthlyRange-enterpriseId").val(),
						monthlyStart: $listByMonthlyRange.find(".listByMonthlyRange-monthlyStart").val(),
						monthlyEnd: $listByMonthlyRange.find(".listByMonthlyRange-monthlyEnd").val(),
					},
					success: function(data) {
						$listByMonthlyRange.find(".listByMonthlyRange-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByMonthlyRange.find(".listByMonthlyRange-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $targetAdd = $(".economicMgr .targetAdd");
			$targetAdd.on("click", ".targetAdd-btn", function() {
				$.ajax({
					url: "economic/targetAdd",
					type: "POST",
					data: {
						enterpriseId: $targetAdd.find(".targetAdd-enterpriseId").val(),
						year: $targetAdd.find(".targetAdd-year").val(),
						value: $targetAdd.find(".targetAdd-value").val(),
					},
					success: function(data) {
						$targetAdd.find(".targetAdd-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$targetAdd.find(".targetAdd-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $targetEdit = $(".economicMgr .targetEdit");
			$targetEdit.on("click", ".targetEdit-btn", function() {
				$.ajax({
					url: "economic/targetEdit",
					type: "POST",
					data: {
						economicTargetId: $targetEdit.find(".targetEdit-economicTargetId").val(),
						year: $targetEdit.find(".targetEdit-year").val(),
						value: $targetEdit.find(".targetEdit-value").val(),
					},
					success: function(data) {
						$targetEdit.find(".targetEdit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$targetEdit.find(".targetEdit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $report = $(".economicMgr .report");
			$report.on("click", ".report-btn", function() {
				$.ajax({
					url: "economic/report",
					type: "POST",
					data: {
						economicId: $report.find(".report-economicId").val()
					},
					success: function(data) {
						$report.find(".report-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$report.find(".report-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $pass = $(".economicMgr .pass");
			$pass.on("click", ".pass-btn", function() {
				$.ajax({
					url: "economic/pass",
					type: "POST",
					data: {
						economicId: $pass.find(".pass-economicId").val()
					},
					success: function(data) {
						$pass.find(".pass-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$pass.find(".pass-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $reject = $(".economicMgr .reject");
			$reject.on("click", ".reject-btn", function() {
				$.ajax({
					url: "economic/reject",
					type: "POST",
					data: {
						economicId: $reject.find(".reject-economicId").val()
					},
					success: function(data) {
						$reject.find(".reject-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$reject.find(".reject-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>