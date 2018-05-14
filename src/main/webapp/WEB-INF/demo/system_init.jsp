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
			<tr class="init_report">
				<td class="init_label">上报时间</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_county">
				<td class="init_label">区县管理</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr><td>&nbsp; <td></tr>
			<tr class="init_enterprise">
				<td class="init_label">企业信息</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_department">
				<td class="init_label">政府部门信息</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_dynamic">
				<td class="init_label">动态</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			
			<tr class="init_enterprise_name">
				<td class="init_label">企业名称</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_national_tax">
				<td class="init_label">国税</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_local_tax">
				<td class="init_label">地税</td>
				<td><input type="button" class="init_btn" value="confirm"/></td>
				<td class="init_msg"></td>
			</tr>
			<tr class="init_energy">
				<td class="init_label">能源</td>
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
				case "init_role":			url = "init/role"; 			break;
				case "init_administrator":	url = "init/administrator";	break;
				
				case "init_area":			url = "init/area";			break;
				case "init_product_type":	url = "init/productType";	break;
				case "init_business_type":	url = "init/businessType";	break;
				case "init_appeal_type":	url = "init/appealType";	break;
				case "init_report":			url = "init/report";		break;
				case "init_county":			url = "init/county";		break;
				
				case "init_enterprise":		url = "init/enterprise";	break;
				case "init_department":		url = "init/department";	break;
				case "init_dynamic":		url = "init/dynamic";		break;
				
				case "init_enterprise_name":	url = "init2/enterpriseName";	break;
				case "init_national_tax":		url = "init2/nationalTax";		break;
				case "init_local_tax":			url = "init2/localTax";			break;
				case "init_energy":				url = "init2/energy";			break;
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
