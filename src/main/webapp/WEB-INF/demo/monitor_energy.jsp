<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>能源消耗</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="energyMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">能源消耗新增(energy/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="add-monthly"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="add-enterpriseId"/></td></tr>
						<tr><td>electricity:</td><td><input type="text" class="add-electricity"/></td></tr>
						<tr><td>gas:</td><td><input type="text" class="add-gas"/></td></tr>
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
		<label class="font-bold">能源消耗编辑(energy/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>energyId:</td><td><input type="text" class="edit-energyId"/></td></tr>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="edit-monthly"/></td></tr>
						<tr><td>enterpriseId</td><td><input type="text" class="edit-enterpriseId"/></td></tr>
						<tr><td>electricity:</td><td><input type="text" class="edit-electricity"/></td></tr>
						<tr><td>gas:</td><td><input type="text" class="edit-gas"/></td></tr>
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
		<label class="font-bold">能源消耗删除(energy/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>energyIds:</td><td><input type="text" class="delete-energyIds"/></td></tr>
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
		<label class="font-bold">能源消耗详情(energy/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>energyId:</td><td><input type="text" class="detail-energyId"/></td></tr>
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
		<label class="font-bold">企业能源消耗明细(energy/listByMonthly)</label>
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
		<label class="font-bold">企业能源消耗明细分页(energy/listByMonthlyPaging)</label>
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
		<label class="font-bold">根据企业获取能源消耗列表(energy/listByEnterpriseId)</label>
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
		<label class="font-bold">根据企业获取能源消耗列表分页(energy/listByEnterpriseIdPaging)</label>
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
		<label class="font-bold">行业能源消耗明细(energy/listByProductType)</label>
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
		<label class="font-bold">园区能源消耗明细(energy/listByArea)</label>
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
		<label class="font-bold">根据企业和月报范围获取能源消耗明细(energy/listByMonthlyRange)</label>
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
	
	<div class="listRange">
		<label class="font-bold">所有企业能源消耗明细(energy/listRange)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthlyStart:</td><td><input type="text" class="listRange-monthlyStart"/></td></tr>
						<tr><td>monthlyEnd:</td><td><input type="text" class="listRange-monthlyEnd"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listRange-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listRange-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseIdRange">
		<label class="font-bold">指定企业经济运行明细(energy/listByEnterpriseIdRange)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseIdRange-enterpriseId"/></td></tr>
						<tr><td>monthlyStart:</td><td><input type="text" class="listByEnterpriseIdRange-monthlyStart"/></td></tr>
						<tr><td>monthlyEnd:</td><td><input type="text" class="listByEnterpriseIdRange-monthlyEnd"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterpriseIdRange-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterpriseIdRange-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByProductTypeIdRange">
		<label class="font-bold">指定产业类别能源消耗明细(energy/listByProductTypeIdRange)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>productTypeId:</td><td><input type="text" class="listByProductTypeIdRange-productTypeId"/></td></tr>
						<tr><td>monthlyStart:</td><td><input type="text" class="listByProductTypeIdRange-monthlyStart"/></td></tr>
						<tr><td>monthlyEnd:</td><td><input type="text" class="listByProductTypeIdRange-monthlyEnd"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByProductTypeIdRange-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByProductTypeIdRange-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByAreaIdRange">
		<label class="font-bold">指定园区能源消耗明细(energy/listByAreaIdRange)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>areaId:</td><td><input type="text" class="listByAreaIdRange-areaId"/></td></tr>
						<tr><td>monthlyStart:</td><td><input type="text" class="listByAreaIdRange-monthlyStart"/></td></tr>
						<tr><td>monthlyEnd:</td><td><input type="text" class="listByAreaIdRange-monthlyEnd"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByAreaIdRange-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByAreaIdRange-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".energyMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "energy/add",
					type: "POST",
					data: {
						monthly: $add.find(".add-monthly").val(),
						enterpriseId: $add.find(".add-enterpriseId").val(),
						electricity: $add.find(".add-electricity").val(),
						gas: $add.find(".add-gas").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".energyMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "energy/edit",
					type: "POST",
					data: {
						energyId: $edit.find(".edit-energyId").val(),
						monthly: $edit.find(".edit-monthly").val(),
						enterpriseId: $edit.find(".edit-enterpriseId").val(),
						electricity: $edit.find(".edit-electricity").val(),
						gas: $edit.find(".edit-gas").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".energyMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "energy/delete",
					type: "POST",
					data: {
						energyIds: $delete.find(".delete-energyIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".energyMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "energy/detail",
					type: "POST",
					data: {
						energyId: $detail.find(".detail-energyId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByMonthly = $(".energyMgr .listByMonthly");
			$listByMonthly.on("click", ".listByMonthly-btn", function() {
				$.ajax({
					url: "energy/listByMonthly",
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
			
			var $listByMonthlyPaging = $(".energyMgr .listByMonthlyPaging");
			$listByMonthlyPaging.on("click", ".listByMonthlyPaging-btn", function() {
				$.ajax({
					url: "energy/listByMonthlyPaging",
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
			
			var $listByEnterpriseId = $(".energyMgr .listByEnterpriseId");
			$listByEnterpriseId.on("click", ".listByEnterpriseId-btn", function() {
				$.ajax({
					url: "energy/listByEnterpriseId",
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
			
			var $listByEnterpriseIdPaging = $(".energyMgr .listByEnterpriseIdPaging");
			$listByEnterpriseIdPaging.on("click", ".listByEnterpriseIdPaging-btn", function() {
				$.ajax({
					url: "energy/listByEnterpriseIdPaging",
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
			
			var $listByProductType = $(".energyMgr .listByProductType");
			$listByProductType.on("click", ".listByProductType-btn", function() {
				$.ajax({
					url: "energy/listByProductType",
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
			
			var $listByArea = $(".energyMgr .listByArea");
			$listByArea.on("click", ".listByArea-btn", function() {
				$.ajax({
					url: "energy/listByArea",
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
			
			var $listByMonthlyRange = $(".energyMgr .listByMonthlyRange");
			$listByMonthlyRange.on("click", ".listByMonthlyRange-btn", function() {
				$.ajax({
					url: "energy/listByMonthlyRange",
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
			
			var $listRange = $(".energyMgr .listRange");
			$listRange.on("click", ".listRange-btn", function() {
				$.ajax({
					url: "energy/listRange",
					type: "POST",
					data: {
						monthlyStart: $listRange.find(".listRange-monthlyStart").val(),
						monthlyEnd: $listRange.find(".listRange-monthlyEnd").val(),
					},
					success: function(data) {
						$listRange.find(".listRange-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listRange.find(".listRange-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByEnterpriseIdRange = $(".energyMgr .listByEnterpriseIdRange");
			$listByEnterpriseIdRange.on("click", ".listByEnterpriseIdRange-btn", function() {
				$.ajax({
					url: "energy/listByEnterpriseIdRange",
					type: "POST",
					data: {
						enterpriseId: $listByEnterpriseIdRange.find(".listByEnterpriseIdRange-enterpriseId").val(),
						monthlyStart: $listByEnterpriseIdRange.find(".listByEnterpriseIdRange-monthlyStart").val(),
						monthlyEnd: $listByEnterpriseIdRange.find(".listByEnterpriseIdRange-monthlyEnd").val(),
					},
					success: function(data) {
						$listByEnterpriseIdRange.find(".listByEnterpriseIdRange-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByEnterpriseIdRange.find(".listByEnterpriseIdRange-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByProductTypeIdRange = $(".energyMgr .listByProductTypeIdRange");
			$listByProductTypeIdRange.on("click", ".listByProductTypeIdRange-btn", function() {
				$.ajax({
					url: "energy/listByProductTypeIdRange",
					type: "POST",
					data: {
						productTypeId: $listByProductTypeIdRange.find(".listByProductTypeIdRange-productTypeId").val(),
						monthlyStart: $listByProductTypeIdRange.find(".listByProductTypeIdRange-monthlyStart").val(),
						monthlyEnd: $listByProductTypeIdRange.find(".listByProductTypeIdRange-monthlyEnd").val(),
					},
					success: function(data) {
						$listByProductTypeIdRange.find(".listByProductTypeIdRange-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByProductTypeIdRange.find(".listByProductTypeIdRange-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByAreaIdRange = $(".energyMgr .listByAreaIdRange");
			$listByAreaIdRange.on("click", ".listByAreaIdRange-btn", function() {
				$.ajax({
					url: "energy/listByAreaIdRange",
					type: "POST",
					data: {
						areaId: $listByAreaIdRange.find(".listByAreaIdRange-areaId").val(),
						monthlyStart: $listByAreaIdRange.find(".listByAreaIdRange-monthlyStart").val(),
						monthlyEnd: $listByAreaIdRange.find(".listByAreaIdRange-monthlyEnd").val(),
					},
					success: function(data) {
						$listByAreaIdRange.find(".listByAreaIdRange-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByAreaIdRange.find(".listByAreaIdRange-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>