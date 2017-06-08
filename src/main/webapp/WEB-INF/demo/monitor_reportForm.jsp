<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>报表</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="reportFormMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="template">
		<label class="font-bold">报表模板下载(reportForm/template)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="template-monthly"/></td></tr>
						<tr><td>type:</td><td><input type="text" class="template-type"/></td></tr>
						<tr><td>类型:</td><tr>
						<tr><td>1： 能源消耗</td><tr>
						<tr><td>2： 效益指标</td><tr>
						<tr><td>3：工业增加值与主营业务收入</td><tr>
						<tr><td>4： 国税</td><tr>
						<tr><td>5： 地税</td><tr>
						<tr><td colspan="2"><input type="button" class="template-btn" value="confirm"/></td></tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="importEnergy">
		<table>
			<tr>
				<td>
					<form id="importEnergy-file-form">
						<label for="importEnergy-file-input">上传能源消耗(reportForm/importEnergy):</label> 
						<input id="importEnergy-file-input" type="file" name="uploadfile" accept="*" /> 
						<input id="importEnergy-file-btn" type="button" value="confirm" />
					</form>
				</td>
				<td>
					<div>
						<textarea class="importEnergy-textarea" style="width: 600px; height: 150px;"></textarea>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="importNationalTax">
		<table>
			<tr>
				<td>
					<form id="importNationalTax-file-form">
						<label for="importNationalTax-file-input">上传国税(reportForm/importNationalTax):</label> 
						<input id="importNationalTax-file-input" type="file" name="uploadfile" accept="*" /> 
						<input id="importNationalTax-file-btn" type="button" value="confirm" />
					</form>
				</td>
				<td>
					<div>
						<textarea class="importNationalTax-textarea" style="width: 600px; height: 150px;"></textarea>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="importLocalTax">
		<table>
			<tr>
				<td>
					<form id="importLocalTax-file-form">
						<label for="importLocalTax-file-input">上传地税(reportForm/importLocalTax):</label> 
						<input id="importLocalTax-file-input" type="file" name="uploadfile" accept="*" /> 
						<input id="importLocalTax-file-btn" type="button" value="confirm" />
					</form>
				</td>
				<td>
					<div>
						<textarea class="importLocalTax-textarea" style="width: 600px; height: 150px;"></textarea>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="export">
		<label class="font-bold">报表导出(reportForm/export)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="export-monthly"/></td></tr>
						<tr><td>type:</td><td><input type="text" class="export-type"/></td></tr>
						<tr><td>类型:</td><tr>
						<tr><td>1： 企业能源消耗明细	</td><td>2： 行业能源消耗明细	</td><td>3：园区能源消耗明细	</td><tr>
						<tr><td>4： 企业效益指标明细	</td><td>5： 行业效益指标明细	</td><td>6： 园区效益指标明细	</td><tr>
						<tr><td>7： 企业增长明细	</td><td>8： 行业增长明细	</td><td>9： 园区增长明细	</td><tr>
						<tr><td>10： 企业国税明细	</td><td>11： 行业国税明细	</td><td>12： 园区国税明细	</td><tr>
						<tr><td>13： 企业地税明细</td><td>14： 行业地税明细	</td><td>15： 园区地税明细	</td><tr>
						<tr><td colspan="2"><input type="button" class="export-btn" value="confirm"/></td></tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="exportByEnterpriseId">
		<label class="font-bold">企业报表导出(reportForm/exportByEnterpriseId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="exportByEnterpriseId-enterpriseId"/></td></tr>
						<tr><td>type:</td><td><input type="text" class="exportByEnterpriseId-type"/></td></tr>
						<tr><td>类型:</td><tr>
						<tr><td>16： 能源消耗明细</td><tr>
						<tr><td>17： 效益指标明细</td><tr>
						<tr><td>18： 工业增加值和主营业务收入明细</td><tr>
						<tr><td>19： 国税明细</td><tr>
						<tr><td>20： 地税明细</td><tr>
						<tr><td colspan="2"><input type="button" class="exportByEnterpriseId-btn" value="confirm"/></td></tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $template = $(".reportFormMgr .template");
			$template.on("click", ".template-btn", function() {
				location.href = "reportForm/template?monthly=" + $template.find(".template-monthly").val() + "&type=" + $template.find(".template-type").val();
			});
			
			var $export = $(".reportFormMgr .export");
			$export.on("click", ".export-btn", function() {
				location.href = "reportForm/export?monthly=" + $export.find(".export-monthly").val() + "&type=" + $export.find(".export-type").val();
			});
			
			var $exportByEnterpriseId = $(".reportFormMgr .exportByEnterpriseId");
			$exportByEnterpriseId.on("click", ".exportByEnterpriseId-btn", function() {
				location.href = "reportForm/exportByEnterpriseId?enterpriseId=" + $exportByEnterpriseId.find(".exportByEnterpriseId-enterpriseId").val() + "&type=" + $exportByEnterpriseId.find(".exportByEnterpriseId-type").val();
			});
			
			var $reportFormMgr = $(".reportFormMgr");
			$reportFormMgr
			.on("click", "#importEnergy-file-btn", function() {
				$.ajax({
					url: "reportForm/importEnergy",
					type: "POST",
					data: new FormData($("#importEnergy-file-form")[0]),
					enctype : 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					success: function(data) {
						$reportFormMgr.find(".importEnergy-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(data) {
						$reportFormMgr.find(".importEnergy-textarea").val(JSON.stringify(data, undefined, 4));
					}
				});
			})
			.on("click", "#importNationalTax-file-btn", function() {
				$.ajax({
					url: "reportForm/importNationalTax",
					type: "POST",
					data: new FormData($("#importNationalTax-file-form")[0]),
					enctype : 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					success: function(data) {
						$reportFormMgr.find(".importNationalTax-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(data) {
						$reportFormMgr.find(".importNationalTax-textarea").val(JSON.stringify(data, undefined, 4));
					}
				});
			})
			.on("click", "#importLocalTax-file-btn", function() {
				$.ajax({
					url: "reportForm/importLocalTax",
					type: "POST",
					data: new FormData($("#importLocalTax-file-form")[0]),
					enctype : 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					success: function(data) {
						$reportFormMgr.find(".importLocalTax-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(data) {
						$reportFormMgr.find(".importLocalTax-textarea").val(JSON.stringify(data, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>