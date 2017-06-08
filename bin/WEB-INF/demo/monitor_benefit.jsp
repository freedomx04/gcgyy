<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>效益指标</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="benefitMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">效益指标新增(benefit/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="add-monthly"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="add-enterpriseId"/></td></tr>
						<tr><td>receivable:</td><td><input type="text" class="add-receivable"/></td></tr>
						<tr><td>inventory:</td><td><input type="text" class="add-inventory"/></td></tr>
						<tr><td>assets:</td><td><input type="text" class="add-assets"/></td></tr>
						<tr><td>debt:</td><td><input type="text" class="add-debt"/></td></tr>
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
		<label class="font-bold">能听消耗编辑(benefit/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>benefitId:</td><td><input type="text" class="edit-benefitId"/></td></tr>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="edit-monthly"/></td></tr>
						<tr><td>enterpriseId</td><td><input type="text" class="edit-enterpriseId"/></td></tr>
						<tr><td>receivable:</td><td><input type="text" class="edit-receivable"/></td></tr>
						<tr><td>inventory:</td><td><input type="text" class="edit-inventory"/></td></tr>
						<tr><td>assets:</td><td><input type="text" class="edit-assets"/></td></tr>
						<tr><td>debt:</td><td><input type="text" class="edit-debt"/></td></tr>
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
		<label class="font-bold">效益指标删除(benefit/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>benefitIds:</td><td><input type="text" class="delete-benefitIds"/></td></tr>
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
		<label class="font-bold">效益指标详情(benefit/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>benefitId:</td><td><input type="text" class="detail-benefitId"/></td></tr>
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
		<label class="font-bold">企业效益指标明细(benefit/listByMonthly)</label>
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
		<label class="font-bold">企业效益指标明细分页(benefit/listByMonthlyPaging)</label>
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
		<label class="font-bold">根据企业获取效益指标列表(benefit/listByEnterpriseId)</label>
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
		<label class="font-bold">根据企业获取效益指标列表分页(benefit/listByEnterpriseIdPaging)</label>
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
		<label class="font-bold">行业效益指标明细(benefit/listByProductType)</label>
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
		<label class="font-bold">园区效益指标明细(benefit/listByArea)</label>
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
	
	<div class="report">
		<label class="font-bold">发送(benefit/report)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>benefitId:</td><td><input type="text" class="report-benefitId"/></td></tr>
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
		<label class="font-bold">通过(benefit/pass)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>benefitId:</td><td><input type="text" class="pass-benefitId"/></td></tr>
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
		<label class="font-bold">驳回(benefit/reject)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>benefitId:</td><td><input type="text" class="reject-benefitId"/></td></tr>
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
			
			var $add = $(".benefitMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "benefit/add",
					type: "POST",
					data: {
						monthly: $add.find(".add-monthly").val(),
						enterpriseId: $add.find(".add-enterpriseId").val(),
						receivable: $add.find(".add-receivable").val(),
						inventory: $add.find(".add-inventory").val(),
						assets: $add.find(".add-assets").val(),
						debt: $add.find(".add-debt").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".benefitMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "benefit/edit",
					type: "POST",
					data: {
						benefitId: $edit.find(".edit-benefitId").val(),
						monthly: $edit.find(".edit-monthly").val(),
						enterpriseId: $edit.find(".edit-enterpriseId").val(),
						receivable: $edit.find(".edit-receivable").val(),
						inventory: $edit.find(".edit-inventory").val(),
						assets: $edit.find(".edit-assets").val(),
						debt: $edit.find(".edit-debt").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".benefitMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "benefit/delete",
					type: "POST",
					data: {
						benefitIds: $delete.find(".delete-benefitIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".benefitMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "benefit/detail",
					type: "POST",
					data: {
						benefitId: $detail.find(".detail-benefitId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByMonthly = $(".benefitMgr .listByMonthly");
			$listByMonthly.on("click", ".listByMonthly-btn", function() {
				$.ajax({
					url: "benefit/listByMonthly",
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
			
			var $listByMonthlyPaging = $(".benefitMgr .listByMonthlyPaging");
			$listByMonthlyPaging.on("click", ".listByMonthlyPaging-btn", function() {
				$.ajax({
					url: "benefit/listByMonthlyPaging",
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
			
			var $listByEnterpriseId = $(".benefitMgr .listByEnterpriseId");
			$listByEnterpriseId.on("click", ".listByEnterpriseId-btn", function() {
				$.ajax({
					url: "benefit/listByEnterpriseId",
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
			
			var $listByEnterpriseIdPaging = $(".benefitMgr .listByEnterpriseIdPaging");
			$listByEnterpriseIdPaging.on("click", ".listByEnterpriseIdPaging-btn", function() {
				$.ajax({
					url: "benefit/listByEnterpriseIdPaging",
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
			
			var $listByProductType = $(".benefitMgr .listByProductType");
			$listByProductType.on("click", ".listByProductType-btn", function() {
				$.ajax({
					url: "benefit/listByProductType",
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
			
			var $listByArea = $(".benefitMgr .listByArea");
			$listByArea.on("click", ".listByArea-btn", function() {
				$.ajax({
					url: "benefit/listByArea",
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
			
			var $report = $(".benefitMgr .report");
			$report.on("click", ".report-btn", function() {
				$.ajax({
					url: "benefit/report",
					type: "POST",
					data: {
						benefitId: $report.find(".report-benefitId").val()
					},
					success: function(data) {
						$report.find(".report-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$report.find(".report-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $pass = $(".benefitMgr .pass");
			$pass.on("click", ".pass-btn", function() {
				$.ajax({
					url: "benefit/pass",
					type: "POST",
					data: {
						benefitId: $pass.find(".pass-benefitId").val()
					},
					success: function(data) {
						$pass.find(".pass-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$pass.find(".pass-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $reject = $(".benefitMgr .reject");
			$reject.on("click", ".reject-btn", function() {
				$.ajax({
					url: "benefit/reject",
					type: "POST",
					data: {
						benefitId: $reject.find(".reject-benefitId").val()
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