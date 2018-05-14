<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>初始化数据</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
<style type="text/css">
.initMgr .init_btn {
	margin-left: 20px;
}
.initMgr .init_msg {
	padding-left: 20px;
}
</style>
</head>
<body class="initMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="init">
		<table style="line-height: 30px; margin-top: 20px;">
			<tr class="init_role">
				<td class="init_label">角色管理</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_administrator">
				<td class="init_label">管理员账号</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr><td>&nbsp; <td></tr>
			<tr class="init_area">
				<td class="init_label">区域管理</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_product_type">
				<td class="init_label">企业产业类别</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_business_type">
				<td class="init_label">行业类别</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_appeal_type">
				<td class="init_label">诉求分类</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr><td>&nbsp; <td></tr>
			<tr class="init_enterprise">
				<td class="init_label">企业信息</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
		</table>
	</div>
	
	<script type="text/javascript">
	;(function($) {
		
		var $init = $(".initMgr .init");
		$init.on("click", ".init_btn", function() {
			var $this = $(this);
			var type = $this.closest("tr").attr("class");
			var url = "";
			switch (type) {
				case "init_role":			url = "init_nc/role"; 			break;
				case "init_administrator":	url = "init_nc/administrator";	break;
				
				case "init_area":			url = "init_nc/area";			break;
				case "init_product_type":	url = "init_nc/productType";	break;
				case "init_business_type":	url = "init_nc/businessType";	break;
				case "init_appeal_type":	url = "init_nc/appealType";	break;
				
				case "init_enterprise":		url = "init_nc/enterprise";	break;
				
				default: break;
			}
			
			$.ajax({
				url: url,
				type: "POST",
				success: function(data) {
					$this.closest("tr").find(".init_msg").text("ok");
				},
				error: function(err) {
					$this.closest("tr").find(".init_msg").text("error");
				}
			});
		});
		
	})(jQuery);
	</script>
</body>
</html>
