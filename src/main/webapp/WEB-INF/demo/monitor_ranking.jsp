<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>积分排名系统</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="rankingMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="score">
		<label class="font-bold">企业填报得分排名(ranking/score)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="score-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="score-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="industryDesc">
		<label class="font-bold">工业总产值环比增幅排名(ranking/industryDesc)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="industryDesc-monthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="industryDesc-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="industryDesc-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="industryAsc">
		<label class="font-bold">工业总产值环比降幅排名(ranking/industryAsc)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>monthly(yyyy-MM):</td><td><input type="text" class="industryAsc-monthly"/></td></tr>
						<tr><td colspan="2"><input type="button" class="industryAsc-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="industryAsc-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $score = $(".rankingMgr .score");
			$score.on("click", ".score-btn", function() {
				$.ajax({
					url: "ranking/score",
					type: "POST",
					success: function(data) {
						$score.find(".score-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$score.find(".score-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $industryDesc = $(".rankingMgr .industryDesc");
			$industryDesc.on("click", ".industryDesc-btn", function() {
				$.ajax({
					url: "ranking/industryDesc",
					type: "POST",
					data: {
						monthly: $industryDesc.find(".industryDesc-monthly").val(),
					},
					success: function(data) {
						$industryDesc.find(".industryDesc-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$industryDesc.find(".industryDesc-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $industryAsc = $(".rankingMgr .industryAsc");
			$industryAsc.on("click", ".industryAsc-btn", function() {
				$.ajax({
					url: "ranking/industryAsc",
					type: "POST",
					data: {
						monthly: $industryAsc.find(".industryAsc-monthly").val(),
					},
					success: function(data) {
						$industryAsc.find(".industryAsc-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$industryAsc.find(".industryAsc-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>