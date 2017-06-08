<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>诉求中心_部门</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="appealMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">

	<div class="listByDepartmentId">
		<label class="font-bold">部门诉求列表(appeal/listByDepartmentId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="listByDepartmentId-departmentId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByDepartmentId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByDepartmentId-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByDepartmentIdPaging">
		<label class="font-bold">部门诉求列表分页(appeal/listByDepartmentIdPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="listByDepartmentIdPaging-departmentId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByDepartmentIdPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByDepartmentIdPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByDepartmentIdPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByDepartmentIdPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByDepartmentIdUnconfirm">
		<label class="font-bold">部门未办结诉求列表(appeal/listByDepartmentIdUnconfirm)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="listByDepartmentIdUnconfirm-departmentId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByDepartmentIdUnconfirm-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByDepartmentIdUnconfirm-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByDepartmentIdUnconfirmPaging">
		<label class="font-bold">部门未办结诉求列表分页(appeal/listByDepartmentIdUnconfirmPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="listByDepartmentIdUnconfirmPaging-departmentId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByDepartmentIdUnconfirmPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByDepartmentIdUnconfirmPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByDepartmentIdUnconfirmPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByDepartmentIdUnconfirmPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByDepartmentIdConfirmed">
		<label class="font-bold">部门已办结诉求列表(appeal/listByDepartmentIdConfirmed)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="listByDepartmentIdConfirmed-departmentId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByDepartmentIdConfirmed-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByDepartmentIdConfirmed-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByDepartmentIdConfirmedPaging">
		<label class="font-bold">部门已办结诉求列表分页(appeal/listByDepartmentIdConfirmedPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="listByDepartmentIdConfirmedPaging-departmentId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByDepartmentIdConfirmedPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByDepartmentIdConfirmedPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByDepartmentIdConfirmedPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByDepartmentIdConfirmedPaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="searchByDepartmentIdAndEnterpriseName">
		<label class="font-bold">根据企业名称搜索部门诉求列表(appeal/searchByDepartmentIdAndEnterpriseName)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="searchByDepartmentIdAndEnterpriseName-departmentId"/></td></tr>
						<tr><td>name:</td><td><input type="text" class="searchByDepartmentIdAndEnterpriseName-name"/></td></tr>
						<tr><td colspan="2"><input type="button" class="searchByDepartmentIdAndEnterpriseName-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="searchByDepartmentIdAndEnterpriseName-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="searchByDepartmentIdAndEnterpriseNamePaging">
		<label class="font-bold">根据企业名称搜索部门诉求列表分页(appeal/searchByDepartmentIdAndEnterpriseNamePaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>departmentId:</td><td><input type="text" class="searchByDepartmentIdAndEnterpriseNamePaging-departmentId"/></td></tr>
						<tr><td>name:</td><td><input type="text" class="searchByDepartmentIdAndEnterpriseNamePaging-name"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="searchByDepartmentIdAndEnterpriseNamePaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="searchByDepartmentIdAndEnterpriseNamePaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="searchByDepartmentIdAndEnterpriseNamePaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="searchByDepartmentIdAndEnterpriseNamePaging-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
	;(function($) {
		
		var $listByDepartmentId = $(".appealMgr .listByDepartmentId");
		$listByDepartmentId.on("click", ".listByDepartmentId-btn", function() {
			$.ajax({
				url: "appeal/listByDepartmentId",
				type: "POST",
				data: {
					departmentId: $listByDepartmentId.find(".listByDepartmentId-departmentId").val(),
				},
				success: function(data) {
					$listByDepartmentId.find(".listByDepartmentId-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByDepartmentId.find(".listByDepartmentId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByDepartmentIdPaging = $(".appealMgr .listByDepartmentIdPaging");
		$listByDepartmentIdPaging.on("click", ".listByDepartmentIdPaging-btn", function() {
			$.ajax({
				url: "appeal/listByDepartmentIdPaging",
				type: "POST",
				data: {
					departmentId: $listByDepartmentIdPaging.find(".listByDepartmentIdPaging-departmentId").val(),
					page: $listByDepartmentIdPaging.find(".listByDepartmentIdPaging-page").val(),
					size: $listByDepartmentIdPaging.find(".listByDepartmentIdPaging-size").val(),
				},
				success: function(data) {
					$listByDepartmentIdPaging.find(".listByDepartmentIdPaging-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByDepartmentIdPaging.find(".listByDepartmentIdPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByDepartmentIdUnconfirm = $(".appealMgr .listByDepartmentIdUnconfirm");
		$listByDepartmentIdUnconfirm.on("click", ".listByDepartmentIdUnconfirm-btn", function() {
			$.ajax({
				url: "appeal/listByDepartmentIdUnconfirm",
				type: "POST",
				data: {
					departmentId: $listByDepartmentIdUnconfirm.find(".listByDepartmentIdUnconfirm-departmentId").val(),
				},
				success: function(data) {
					$listByDepartmentIdUnconfirm.find(".listByDepartmentIdUnconfirm-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByDepartmentIdUnconfirm.find(".listByDepartmentIdUnconfirm-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByDepartmentIdUnconfirmPaging = $(".appealMgr .listByDepartmentIdUnconfirmPaging");
		$listByDepartmentIdUnconfirmPaging.on("click", ".listByDepartmentIdUnconfirmPaging-btn", function() {
			$.ajax({
				url: "appeal/listByDepartmentIdUnconfirmPaging",
				type: "POST",
				data: {
					departmentId: $listByDepartmentIdUnconfirmPaging.find(".listByDepartmentIdUnconfirmPaging-departmentId").val(),
					page: $listByDepartmentIdUnconfirmPaging.find(".listByDepartmentIdUnconfirmPaging-page").val(),
					size: $listByDepartmentIdUnconfirmPaging.find(".listByDepartmentIdUnconfirmPaging-size").val(),
				},
				success: function(data) {
					$listByDepartmentIdUnconfirmPaging.find(".listByDepartmentIdUnconfirmPaging-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByDepartmentIdUnconfirmPaging.find(".listByDepartmentIdUnconfirmPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByDepartmentIdConfirmed = $(".appealMgr .listByDepartmentIdConfirmed");
		$listByDepartmentIdConfirmed.on("click", ".listByDepartmentIdConfirmed-btn", function() {
			$.ajax({
				url: "appeal/listByDepartmentIdConfirmed",
				type: "POST",
				data: {
					departmentId: $listByDepartmentIdConfirmed.find(".listByDepartmentIdConfirmed-departmentId").val(),
				},
				success: function(data) {
					$listByDepartmentIdConfirmed.find(".listByDepartmentIdConfirmed-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByDepartmentIdConfirmed.find(".listByDepartmentIdConfirmed-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $listByDepartmentIdConfirmedPaging = $(".appealMgr .listByDepartmentIdConfirmedPaging");
		$listByDepartmentIdConfirmedPaging.on("click", ".listByDepartmentIdConfirmedPaging-btn", function() {
			$.ajax({
				url: "appeal/listByDepartmentIdConfirmedPaging",
				type: "POST",
				data: {
					departmentId: $listByDepartmentIdConfirmedPaging.find(".listByDepartmentIdConfirmedPaging-departmentId").val(),
					page: $listByDepartmentIdConfirmedPaging.find(".listByDepartmentIdConfirmedPaging-page").val(),
					size: $listByDepartmentIdConfirmedPaging.find(".listByDepartmentIdConfirmedPaging-size").val(),
				},
				success: function(data) {
					$listByDepartmentIdConfirmedPaging.find(".listByDepartmentIdConfirmedPaging-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$listByDepartmentIdConfirmedPaging.find(".listByDepartmentIdConfirmedPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $searchByDepartmentIdAndEnterpriseName = $(".appealMgr .searchByDepartmentIdAndEnterpriseName");
		$searchByDepartmentIdAndEnterpriseName.on("click", ".searchByDepartmentIdAndEnterpriseName-btn", function() {
			$.ajax({
				url: "appeal/searchByDepartmentIdAndEnterpriseName",
				type: "POST",
				data: {
					departmentId: $searchByDepartmentIdAndEnterpriseName.find(".searchByDepartmentIdAndEnterpriseName-departmentId").val(),
					name: $searchByDepartmentIdAndEnterpriseName.find(".searchByDepartmentIdAndEnterpriseName-name").val(),
				},
				success: function(data) {
					$searchByDepartmentIdAndEnterpriseName.find(".searchByDepartmentIdAndEnterpriseName-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$searchByDepartmentIdAndEnterpriseName.find(".searchByDepartmentIdAndEnterpriseName-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $searchByDepartmentIdAndEnterpriseNamePaging = $(".appealMgr .searchByDepartmentIdAndEnterpriseNamePaging");
		$searchByDepartmentIdAndEnterpriseNamePaging.on("click", ".searchByDepartmentIdAndEnterpriseNamePaging-btn", function() {
			$.ajax({
				url: "appeal/searchByDepartmentIdAndEnterpriseNamePaging",
				type: "POST",
				data: {
					departmentId: $searchByDepartmentIdAndEnterpriseNamePaging.find(".searchByDepartmentIdAndEnterpriseNamePaging-departmentId").val(),
					name: $searchByDepartmentIdAndEnterpriseNamePaging.find(".searchByDepartmentIdAndEnterpriseNamePaging-name").val(),
					page: $searchByDepartmentIdAndEnterpriseNamePaging.find(".searchByDepartmentIdAndEnterpriseNamePaging-page").val(),
					size: $searchByDepartmentIdAndEnterpriseNamePaging.find(".searchByDepartmentIdAndEnterpriseNamePaging-size").val(),
				},
				success: function(data) {
					$searchByDepartmentIdAndEnterpriseNamePaging.find(".searchByDepartmentIdAndEnterpriseNamePaging-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$searchByDepartmentIdAndEnterpriseNamePaging.find(".searchByDepartmentIdAndEnterpriseNamePaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
	})(jQuery);
	</script>
</body>
</html>
