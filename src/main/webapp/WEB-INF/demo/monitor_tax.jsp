<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>纳税系统</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="taxMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">

	<div class="listByEnterprise">
		<label class="font-bold">纳税系统企业明细(tax/listByEnterprise)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly:</td><td><input type="text" class="listByEnterprise-monthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterprise-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterprise-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterprisePaging">
		<label class="font-bold">纳税系统企业明细分页(tax/listByEnterprisePaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly:</td><td><input type="text" class="listByEnterprisePaging-monthly"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByEnterprisePaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByEnterprisePaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterprisePaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterprisePaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByProductType">
		<label class="font-bold">纳税系统行业明细(tax/listByProductType)</label>
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
		<label class="font-bold">纳税系统园区明细(tax/listByArea)</label>
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
	
	<div class="listByEnterpriseIdRange">
		<label class="font-bold">指定企业根据范围获取纳税信息(tax/listByEnterpriseIdRange)</label>
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
	
	<script type="text/javascript">
		;(function($) {
			
			var $listByEnterprise = $(".taxMgr .listByEnterprise");
			$listByEnterprise.on("click", ".listByEnterprise-btn", function() {
				$.ajax({
					url: "tax/listByEnterprise",
					type: "POST",
					data: {
						monthly: $listByEnterprise.find(".listByEnterprise-monthly").val()
					},
					success: function(data) {
						$listByEnterprise.find(".listByEnterprise-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByEnterprise.find(".listByEnterprise-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByEnterprisePaging = $(".taxMgr .listByEnterprisePaging");
			$listByEnterprisePaging.on("click", ".listByEnterprisePaging-btn", function() {
				$.ajax({
					url: "tax/listByEnterprisePaging",
					type: "POST",
					data: {
						monthly: $listByEnterprisePaging.find(".listByEnterprisePaging-monthly").val(),
						page: $listByEnterprisePaging.find(".listByEnterprisePaging-page").val(),
						size: $listByEnterprisePaging.find(".listByEnterprisePaging-size").val(),
					},
					success: function(data) {
						$listByEnterprisePaging.find(".listByEnterprisePaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByEnterprisePaging.find(".listByEnterprisePaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByProductType = $(".taxMgr .listByProductType");
			$listByProductType.on("click", ".listByProductType-btn", function() {
				$.ajax({
					url: "tax/listByProductType",
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
			
			var $listByArea = $(".taxMgr .listByArea");
			$listByArea.on("click", ".listByArea-btn", function() {
				$.ajax({
					url: "tax/listByArea",
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
			
			var $listByEnterpriseIdRange = $(".taxMgr .listByEnterpriseIdRange");
			$listByEnterpriseIdRange.on("click", ".listByEnterpriseIdRange-btn", function() {
				$.ajax({
					url: "tax/listByEnterpriseIdRange",
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
			
		})(jQuery);
	</script>
		
</body>
</html>