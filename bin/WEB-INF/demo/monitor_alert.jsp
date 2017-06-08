<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>企业预警信息</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="alertMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="listEnterprise">
		<label class="font-bold">企业预警(alert/listEnterprise)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="listEnterprise-monthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listEnterprise-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listEnterprise-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listEnterprisePaging">
		<label class="font-bold">企业预警分页(alert/listEnterprisePaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="listEnterprisePaging-monthly"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listEnterprisePaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listEnterprisePaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listEnterprisePaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listEnterprisePaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listEnterpriseByMonthlyRange">
		<label class="font-bold">指定企业和月报表范围获取企业预警列表(alert/listEnterpriseByMonthlyRange)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listEnterpriseByMonthlyRange-enterpriseId"/></td></tr>
						<tr><td>monthlyStart</td><td><input type="text" class="listEnterpriseByMonthlyRange-monthlyStart"/></td></tr>
						<tr><td>monthlyEnd:</td><td><input type="text" class="listEnterpriseByMonthlyRange-monthlyEnd"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listEnterpriseByMonthlyRange-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listEnterpriseByMonthlyRange-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listReport">
		<label class="font-bold">报表预警(alert/listReport)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="listReport-monthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listReport-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listReport-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listReportPaging">
		<label class="font-bold">报表预警分页(alert/listReportPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="listReportPaging-monthly"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listReportPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listReportPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listReportPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listReportPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listReportByMonthlyRange">
		<label class="font-bold">指定企业和月报表范围获取报表预警列表(alert/listReportByMonthlyRange)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listReportByMonthlyRange-enterpriseId"/></td></tr>
						<tr><td>monthlyStart</td><td><input type="text" class="listReportByMonthlyRange-monthlyStart"/></td></tr>
						<tr><td>monthlyEnd:</td><td><input type="text" class="listReportByMonthlyRange-monthlyEnd"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listReportByMonthlyRange-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listReportByMonthlyRange-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $listEnterprise = $(".alertMgr .listEnterprise");
			$listEnterprise.on("click", ".listEnterprise-btn", function() {
				$.ajax({
					url: "alert/listEnterprise",
					type: "POST",
					data: {
						monthly: $listEnterprise.find(".listEnterprise-monthly").val(),
					},
					success: function(data) {
						$listEnterprise.find(".listEnterprise-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listEnterprise.find(".listEnterprise-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listEnterprisePaging = $(".alertMgr .listEnterprisePaging");
			$listEnterprisePaging.on("click", ".listEnterprisePaging-btn", function() {
				$.ajax({
					url: "alert/listEnterprisePaging",
					type: "POST",
					data: {
						monthly: $listEnterprisePaging.find(".listEnterprisePaging-monthly").val(),
						page: $listEnterprisePaging.find(".listEnterprisePaging-page").val(),
						size: $listEnterprisePaging.find(".listEnterprisePaging-size").val(),
					},
					success: function(data) {
						$listEnterprisePaging.find(".listEnterprisePaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listEnterprisePaging.find(".listEnterprisePaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listEnterpriseByMonthlyRange = $(".alertMgr .listEnterpriseByMonthlyRange");
			$listEnterpriseByMonthlyRange.on("click", ".listEnterpriseByMonthlyRange-btn", function() {
				$.ajax({
					url: "alert/listEnterpriseByMonthlyRange",
					type: "POST",
					data: {
						enterpriseId: $listEnterpriseByMonthlyRange.find(".listEnterpriseByMonthlyRange-enterpriseId").val(),
						monthlyStart: $listEnterpriseByMonthlyRange.find(".listEnterpriseByMonthlyRange-monthlyStart").val(),
						monthlyEnd: $listEnterpriseByMonthlyRange.find(".listEnterpriseByMonthlyRange-monthlyEnd").val(),
					},
					success: function(data) {
						$listEnterpriseByMonthlyRange.find(".listEnterpriseByMonthlyRange-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listEnterpriseByMonthlyRange.find(".listEnterpriseByMonthlyRange-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listReport = $(".alertMgr .listReport");
			$listReport.on("click", ".listReport-btn", function() {
				$.ajax({
					url: "alert/listReport",
					type: "POST",
					data: {
						monthly: $listReport.find(".listReport-monthly").val(),
					},
					success: function(data) {
						$listReport.find(".listReport-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listReport.find(".listReport-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listReportPaging = $(".alertMgr .listReportPaging");
			$listReportPaging.on("click", ".listReportPaging-btn", function() {
				$.ajax({
					url: "alert/listReportPaging",
					type: "POST",
					data: {
						monthly: $listReportPaging.find(".listReportPaging-monthly").val(),
						page: $listReportPaging.find(".listReportPaging-page").val(),
						size: $listReportPaging.find(".listReportPaging-size").val(),
					},
					success: function(data) {
						$listReportPaging.find(".listReportPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listReportPaging.find(".listReportPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listReportByMonthlyRange = $(".alertMgr .listReportByMonthlyRange");
			$listReportByMonthlyRange.on("click", ".listReportByMonthlyRange-btn", function() {
				$.ajax({
					url: "alert/listReportByMonthlyRange",
					type: "POST",
					data: {
						enterpriseId: $listReportByMonthlyRange.find(".listReportByMonthlyRange-enterpriseId").val(),
						monthlyStart: $listReportByMonthlyRange.find(".listReportByMonthlyRange-monthlyStart").val(),
						monthlyEnd: $listReportByMonthlyRange.find(".listReportByMonthlyRange-monthlyEnd").val(),
					},
					success: function(data) {
						$listReportByMonthlyRange.find(".listReportByMonthlyRange-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listReportByMonthlyRange.find(".listReportByMonthlyRange-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>