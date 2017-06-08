<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>国税</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="nationalTaxMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">国税新增(nationalTax/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="add-enterpriseId"></td></tr>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="add-monthly"/></td></tr>
						<tr><td>sale:</td><td><input type="text" class="add-sale"/></td></tr>
						<tr><td>taxes:</td><td><input type="text" class="add-taxes"/></td></tr>
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
		<label class="font-bold">国税编辑(nationalTax/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>nationalTaxId:</td><td><input type="text" class="edit-nationalTaxId"/></td></tr>
						<tr><td>enterpriseId:</td><td><input type="text" class="edit-enterpriseId"/></td></tr>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="edit-monthly"/></td></tr>
						<tr><td>sale:</td><td><input type="text" class="edit-sale"/></td></tr>
						<tr><td>taxes:</td><td><input type="text" class="edit-taxes"/></td></tr>
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
		<label class="font-bold">国税删除(nationalTax/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>nationalTaxIds:</td><td><input type="text" class="delete-nationalTaxIds"/></td></tr>
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
		<label class="font-bold">国税详情(nationalTax/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>nationalTaxId:</td><td><input type="text" class="detail-nationalTaxId"/></td></tr>
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
	
	<div class="listBetweenMonthly">
		<label class="font-bold">国税查询(nationalTax/listBetweenMonthly)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>startMonthly:</td><td><input type="text" class="listBetweenMonthly-startMonthly"/></td></tr>
						<tr><td>endMonthly:</td><td><input type="text" class="listBetweenMonthly-endMonthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listBetweenMonthly-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listBetweenMonthly-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listBetweenMonthlyPaging">
		<label class="font-bold">国税分页查询(nationalTax/listBetweenMonthlyPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>startMonthly:</td><td><input type="text" class="listBetweenMonthlyPaging-startMonthly"/></td></tr>
						<tr><td>endMonthly:</td><td><input type="text" class="listBetweenMonthlyPaging-endMonthly"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listBetweenMonthlyPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listBetweenMonthlyPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listBetweenMonthlyPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listBetweenMonthlyPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseId">
		<label class="font-bold">根据企业获取国税列表(nationalTax/listByEnterpriseId)</label>
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
		<label class="font-bold">根据企业获取国税列表分页(nationalTax/listByEnterpriseIdPaging)</label>
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
	
	<div class="listBetweenMonthlyByArea">
		<label class="font-bold">园区能源消耗明细(nationalTax/listBetweenMonthlyByArea)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>startMonthly:</td><td><input type="text" class="listBetweenMonthlyByArea-startMonthly"/></td></tr>
						<tr><td>endMonthly:</td><td><input type="text" class="listBetweenMonthlyByArea-endMonthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listBetweenMonthlyByArea-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listBetweenMonthlyByArea-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listBetweenMonthlyByProductType">
		<label class="font-bold">行业能源消耗明细(nationalTax/listBetweenMonthlyByProductType)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>startMonthly:</td><td><input type="text" class="listBetweenMonthlyByProductType-startMonthly"/></td></tr>
						<tr><td>endMonthly:</td><td><input type="text" class="listBetweenMonthlyByProductType-endMonthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listBetweenMonthlyByProductType-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listBetweenMonthlyByProductType-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".nationalTaxMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "nationalTax/add",
					type: "POST",
					data: {
						enterpriseId: $add.find(".add-enterpriseId").val(),
						monthly: $add.find(".add-monthly").val(),
						sale: $add.find(".add-sale").val(),
						taxes: $add.find(".add-taxes").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".nationalTaxMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "nationalTax/edit",
					type: "POST",
					data: {
						nationalTaxId: $edit.find(".edit-nationalTaxId").val(),
						enterpriseId: $edit.find(".edit-enterpriseId").val(),
						monthly: $edit.find(".edit-monthly").val(),
						sale: $edit.find(".edit-sale").val(),
						taxes: $edit.find(".edit-taxes").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".nationalTaxMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "nationalTax/delete",
					type: "POST",
					data: {
						nationalTaxIds: $delete.find(".delete-nationalTaxIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".nationalTaxMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "nationalTax/detail",
					type: "POST",
					data: {
						nationalTaxId: $detail.find(".detail-nationalTaxId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listBetweenMonthly = $(".nationalTaxMgr .listBetweenMonthly");
			$listBetweenMonthly.on("click", ".listBetweenMonthly-btn", function() {
				$.ajax({
					url: "nationalTax/listBetweenMonthly",
					type: "POST",
					data: {
						startMonthly: $listBetweenMonthly.find(".listBetweenMonthly-startMonthly").val(),
						endMonthly: $listBetweenMonthly.find(".listBetweenMonthly-endMonthly").val()
					},
					success: function(data) {
						$listBetweenMonthly.find(".listBetweenMonthly-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listBetweenMonthly.find(".listBetweenMonthly-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listBetweenMonthlyPaging = $(".nationalTaxMgr .listBetweenMonthlyPaging");
			$listBetweenMonthlyPaging.on("click", ".listBetweenMonthlyPaging-btn", function() {
				$.ajax({
					url: "nationalTax/listBetweenMonthlyPaging",
					type: "POST",
					data: {
						startMonthly: $listBetweenMonthlyPaging.find(".listBetweenMonthlyPaging-startMonthly").val(),
						endMonthly: $listBetweenMonthlyPaging.find(".listBetweenMonthlyPaging-endMonthly").val(),
						page: $listBetweenMonthlyPaging.find(".listBetweenMonthlyPaging-page").val(),
						size: $listBetweenMonthlyPaging.find(".listBetweenMonthlyPaging-size").val(),
					},
					success: function(data) {
						$listBetweenMonthlyPaging.find(".listBetweenMonthlyPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listBetweenMonthlyPaging.find(".listBetweenMonthlyPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByEnterpriseId = $(".nationalTaxMgr .listByEnterpriseId");
			$listByEnterpriseId.on("click", ".listByEnterpriseId-btn", function() {
				$.ajax({
					url: "nationalTax/listByEnterpriseId",
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
			
			var $listByEnterpriseIdPaging = $(".nationalTaxMgr .listByEnterpriseIdPaging");
			$listByEnterpriseIdPaging.on("click", ".listByEnterpriseIdPaging-btn", function() {
				$.ajax({
					url: "nationalTax/listByEnterpriseIdPaging",
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
			
			var $listBetweenMonthlyByArea = $(".nationalTaxMgr .listBetweenMonthlyByArea");
			$listBetweenMonthlyByArea.on("click", ".listBetweenMonthlyByArea-btn", function() {
				$.ajax({
					url: "nationalTax/listBetweenMonthlyByArea",
					type: "POST",
					data: {
						startMonthly: $listBetweenMonthlyByArea.find(".listBetweenMonthlyByArea-startMonthly").val(),
						endMonthly: $listBetweenMonthlyByArea.find(".listBetweenMonthlyByArea-endMonthly").val()
					},
					success: function(data) {
						$listBetweenMonthlyByArea.find(".listBetweenMonthlyByArea-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listBetweenMonthlyByArea.find(".listBetweenMonthlyByArea-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listBetweenMonthlyByProductType = $(".nationalTaxMgr .listBetweenMonthlyByProductType");
			$listBetweenMonthlyByProductType.on("click", ".listBetweenMonthlyByProductType-btn", function() {
				$.ajax({
					url: "nationalTax/listBetweenMonthlyByProductType",
					type: "POST",
					data: {
						startMonthly: $listBetweenMonthlyByProductType.find(".listBetweenMonthlyByProductType-startMonthly").val(),
						endMonthly: $listBetweenMonthlyByProductType.find(".listBetweenMonthlyByProductType-endMonthly").val()
					},
					success: function(data) {
						$listBetweenMonthlyByProductType.find(".listBetweenMonthlyByProductType-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listBetweenMonthlyByProductType.find(".listBetweenMonthlyByProductType-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			
		})(jQuery);
	</script>
		
</body>
</html>