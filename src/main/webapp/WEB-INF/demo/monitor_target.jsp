<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>全县主要指标</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="economicMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="listRange">
		<label class="font-bold">所有企业经济运行明细(economic/listRange)</label>
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
		<label class="font-bold">指定企业经济运行明细(economic/listByEnterpriseIdRange)</label>
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
		<label class="font-bold">指定产业类别经济运行明细(economic/listByProductTypeIdRange)</label>
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
		<label class="font-bold">指定园区经济运行明细(economic/listByAreaIdRange)</label>
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
			
			var $listRange = $(".economicMgr .listRange");
			$listRange.on("click", ".listRange-btn", function() {
				$.ajax({
					url: "economic/listRange",
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
			
			var $listByEnterpriseIdRange = $(".economicMgr .listByEnterpriseIdRange");
			$listByEnterpriseIdRange.on("click", ".listByEnterpriseIdRange-btn", function() {
				$.ajax({
					url: "economic/listByEnterpriseIdRange",
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
			
			var $listByProductTypeIdRange = $(".economicMgr .listByProductTypeIdRange");
			$listByProductTypeIdRange.on("click", ".listByProductTypeIdRange-btn", function() {
				$.ajax({
					url: "economic/listByProductTypeIdRange",
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
			
			var $listByAreaIdRange = $(".economicMgr .listByAreaIdRange");
			$listByAreaIdRange.on("click", ".listByAreaIdRange-btn", function() {
				$.ajax({
					url: "economic/listByAreaIdRange",
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