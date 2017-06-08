<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>诉求中心_企业</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="appealMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">

	<div class="listByEnterpriseId">
		<label class="font-bold">企业诉求列表(appeal/listByEnterpriseId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseId-enterpriseId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterpriseId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterpriseId-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseIdPaging">
		<label class="font-bold">企业诉求列表分页(appeal/listByEnterpriseIdPaging)</label>
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
					<textarea class="listByEnterpriseIdPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseIdUnconfirm">
		<label class="font-bold">企业未办结诉求列表(appeal/listByEnterpriseIdUnconfirm)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseIdUnconfirm-enterpriseId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterpriseIdUnconfirm-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterpriseIdUnconfirm-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseIdUnconfirmPaging">
		<label class="font-bold">企业未办结诉求列表分页(appeal/listByEnterpriseIdUnconfirmPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseIdUnconfirmPaging-enterpriseId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByEnterpriseIdUnconfirmPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByEnterpriseIdUnconfirmPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterpriseIdUnconfirmPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterpriseIdUnconfirmPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseIdConfirmed">
		<label class="font-bold">企业已办结诉求列表(appeal/listByEnterpriseIdConfirmed)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseIdConfirmed-enterpriseId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterpriseIdConfirmed-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterpriseIdConfirmed-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByEnterpriseIdConfirmedPaging">
		<label class="font-bold">企业已办结诉求列表分页(appeal/listByEnterpriseIdConfirmedPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="listByEnterpriseIdConfirmedPaging-enterpriseId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByEnterpriseIdConfirmedPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByEnterpriseIdConfirmedPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByEnterpriseIdConfirmedPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByEnterpriseIdConfirmedPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="searchByEnterpriseName">
		<label class="font-bold">根据企业名称搜索诉求列表(appeal/searchByEnterpriseName)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>name:</td><td><input type="text" class="searchByEnterpriseName-name"/></td></tr>
						<tr><td colspan="2"><input type="button" class="searchByEnterpriseName-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="searchByEnterpriseName-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="searchByEnterpriseNamePaging">
		<label class="font-bold">根据企业名称搜索诉求列表分页(appeal/searchByEnterpriseNamePaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>name:</td><td><input type="text" class="searchByEnterpriseNamePaging-name"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="searchByEnterpriseNamePaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="searchByEnterpriseNamePaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="searchByEnterpriseNamePaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="searchByEnterpriseNamePaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>

	
	<script type="text/javascript">
	;(function($) {
		
		var $listByEnterpriseId = $(".appealMgr .listByEnterpriseId");
		$listByEnterpriseId.on("click", ".listByEnterpriseId-btn", function() {
			$.ajax({
				url: "appeal/listByEnterpriseId",
				type: "POST",
				data: {
					enterpriseId: $listByEnterpriseId.find(".listByEnterpriseId-enterpriseId").val(),
				},
				success: function(data) {
					$listByEnterpriseId.find(".listByEnterpriseId-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByEnterpriseId.find(".listByEnterpriseId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByEnterpriseIdPaging = $(".appealMgr .listByEnterpriseIdPaging");
		$listByEnterpriseIdPaging.on("click", ".listByEnterpriseIdPaging-btn", function() {
			$.ajax({
				url: "appeal/listByEnterpriseIdPaging",
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
		
		var $listByEnterpriseIdUnconfirm = $(".appealMgr .listByEnterpriseIdUnconfirm");
		$listByEnterpriseIdUnconfirm.on("click", ".listByEnterpriseIdUnconfirm-btn", function() {
			$.ajax({
				url: "appeal/listByEnterpriseIdUnconfirm",
				type: "POST",
				data: {
					enterpriseId: $listByEnterpriseIdUnconfirm.find(".listByEnterpriseIdUnconfirm-enterpriseId").val(),
				},
				success: function(data) {
					$listByEnterpriseIdUnconfirm.find(".listByEnterpriseIdUnconfirm-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByEnterpriseIdUnconfirm.find(".listByEnterpriseIdUnconfirm-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByEnterpriseIdUnconfirmPaging = $(".appealMgr .listByEnterpriseIdUnconfirmPaging");
		$listByEnterpriseIdUnconfirmPaging.on("click", ".listByEnterpriseIdUnconfirmPaging-btn", function() {
			$.ajax({
				url: "appeal/listByEnterpriseIdUnconfirmPaging",
				type: "POST",
				data: {
					enterpriseId: $listByEnterpriseIdUnconfirmPaging.find(".listByEnterpriseIdUnconfirmPaging-enterpriseId").val(),
					page: $listByEnterpriseIdUnconfirmPaging.find(".listByEnterpriseIdUnconfirmPaging-page").val(),
					size: $listByEnterpriseIdUnconfirmPaging.find(".listByEnterpriseIdUnconfirmPaging-size").val(),
				},
				success: function(data) {
					$listByEnterpriseIdUnconfirmPaging.find(".listByEnterpriseIdUnconfirmPaging-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByEnterpriseIdUnconfirmPaging.find(".listByEnterpriseIdUnconfirmPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByEnterpriseIdConfirmed = $(".appealMgr .listByEnterpriseIdConfirmed");
		$listByEnterpriseIdConfirmed.on("click", ".listByEnterpriseIdConfirmed-btn", function() {
			$.ajax({
				url: "appeal/listByEnterpriseIdConfirmed",
				type: "POST",
				data: {
					enterpriseId: $listByEnterpriseIdConfirmed.find(".listByEnterpriseIdConfirmed-enterpriseId").val(),
				},
				success: function(data) {
					$listByEnterpriseIdConfirmed.find(".listByEnterpriseIdConfirmed-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByEnterpriseIdConfirmed.find(".listByEnterpriseIdConfirmed-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByEnterpriseIdConfirmedPaging = $(".appealMgr .listByEnterpriseIdConfirmedPaging");
		$listByEnterpriseIdConfirmedPaging.on("click", ".listByEnterpriseIdConfirmedPaging-btn", function() {
			$.ajax({
				url: "appeal/listByEnterpriseIdConfirmedPaging",
				type: "POST",
				data: {
					enterpriseId: $listByEnterpriseIdConfirmedPaging.find(".listByEnterpriseIdConfirmedPaging-enterpriseId").val(),
					page: $listByEnterpriseIdConfirmedPaging.find(".listByEnterpriseIdConfirmedPaging-page").val(),
					size: $listByEnterpriseIdConfirmedPaging.find(".listByEnterpriseIdConfirmedPaging-size").val(),
				},
				success: function(data) {
					$listByEnterpriseIdConfirmedPaging.find(".listByEnterpriseIdConfirmedPaging-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByEnterpriseIdConfirmedPaging.find(".listByEnterpriseIdConfirmedPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
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
		
	})(jQuery);
	</script>
</body>
</html>
