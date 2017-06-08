<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>报表</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="rankingReportMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div>
		<div><strong>类型:</strong></div>
		<div>1： 工业增加值</div>
		<div>2： 主营业务收入</div>
		<div>3：利税总额</div>
		<div>4： 工业用电</div>
		<div>5： 工业总产值</div>
		<div>6： 增值税</div>
	</div>
	<div class="divide"></div>

	<div class="template">
		<label class="font-bold">报表模板下载(ranking/template)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="template-monthly"/></td></tr>
						<tr><td>type:</td><td><input type="text" class="template-type"/></td></tr>
						<tr><td colspan="2"><input type="button" class="template-btn" value="confirm"/></td></tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="import">
		<table>
			<tr>
				<td>
					<form id="import-form">
						<label for="import-input">上传能源消耗(reportForm/importEnergy):</label> 
						<input id="import-input" type="file" name="uploadfile" accept="*" /> 
						<div>type: <input type="text" name="type"/></div>
						<input id="import-btn" type="button" value="confirm" />
					</form>
				</td>
				<td>
					<div>
						<textarea class="import-textarea" style="width: 600px; height: 250px;"></textarea>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="export">
		<label class="font-bold">报表导出(ranking/export)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="export-monthly"/></td></tr>
						<tr><td>type:</td><td><input type="text" class="export-type"/></td></tr>
						<tr><td colspan="2"><input type="button" class="export-btn" value="confirm"/></td></tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $template = $(".rankingReportMgr .template");
			$template.on("click", ".template-btn", function() {
				location.href = "rankingReport/template?monthly=" + $template.find(".template-monthly").val() + "&type=" + $template.find(".template-type").val();
			});
			
			var $export = $(".rankingReportMgr .export");
			$export.on("click", ".export-btn", function() {
				location.href = "rankingReport/export?monthly=" + $export.find(".export-monthly").val() + "&type=" + $export.find(".export-type").val();
			});
			
			var $import = $(".rankingReportMgr .import");
			$import.on("click", "#import-btn", function() {
				$.ajax({
					url: "rankingReport/importReport",
					type: "POST",
					data: new FormData($("#import-form")[0]),
					enctype : 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					success: function(data) {
						$import.find(".import-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(data) {
						$import.find(".import-textarea").val(JSON.stringify(data, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>