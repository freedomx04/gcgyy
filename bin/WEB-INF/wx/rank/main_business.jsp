<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>全市排名-主营业务收入</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

	<style type="text/css">
		.weui-table td, .weui-table th {
			text-align: left;
		}	
		
		.weui-table th + th, .weui-table td + td {
			padding-left: 20px;
		}
		
	</style>
</head>

<body class="wx-business">
	<div class="weui_cells weui_cells_form" style="margin-top: 0;">
		<div class="weui_cell weui_vcode">
			<div class="weui_cell_hd">
				<label class="weui_label">时间</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" placeholder="月报表时间 " value="${monthly}" id="monthly">
			</div>
			<div class="weui_cell_ft">
				<a href="javascript:;" class="weui-vcode-btn" id="search">&nbsp;查询&nbsp;</a>
			</div>
		</div>
	</div>
	
	<div class="business-list">
		<c:forEach var="business" items="${businessList}">
			<div class="weui_panel">
				<div class="weui_panel_bd">
					<div class="weui_media_box weui_media_text">
						<h4 class="weui_media_title">${business.county.name}</h4>
						<table class="weui-table weui-border-tb" style="font-size: 14px; color: #999;">
							<thead>
								<tr>
									<th>本月止累计(万元)</th>
									<th>同比±%</th>
									<th>增幅排序</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><fmt:formatNumber type="number" value="${business.total}" pattern="0" maxFractionDigits="0"/></td>
									<td><fmt:formatNumber type="number" value="${business.yearGrowth}" pattern="0.00" maxFractionDigits="2"/></td>
									<td>${business.sort}</td>
								</tr>
							</tbody>
						</table> 
						
					</div>
				</div>
			</div>		
		</c:forEach>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script src="${ctx}/plugins/wx/picker.js"></script>
	
	<script type="text/javascript">
	$(function( $ ) {
		
		var $list = $('.business-list');
        
		$('#monthly').picker({
			title:"选择日期",
	        cols: [
	          {
	            textAlign: 'center',
	            values: ['2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022']
	          },
	          {
	            textAlign: 'center',
	            values: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
	          }
	        ],
	        onClose: function(ret) {
	        },
	        onChange: function(result) {
	        }
		});

		$('#search').on('click', function() {
			var monthly = $('#monthly').val().replace(' ', '-');
			var result = '';
			
			$.ajax({
				url: '${ctx}/mainBusiness/listByMonthly',
				type: 'POST',
				data: {
					monthly: monthly
				},
				success: function(ret) {
					if (ret.status == 0) {
						
						$.each(ret.data, function(key, business) {
							result += '<div class="weui_panel">'
								+ '<div class="weui_panel_bd">'
								+ '<div class="weui_media_box weui_media_text">'
								+ '<h4 class="weui_media_title">' + business.county.name + '</h4>'
								+ '<table class="weui-table weui-border-tb" style="font-size: 14px; color: #999;">'
								+ '<thead><tr><th>本月止累计(万元)</th><th>同比±%</th><th>增幅排序</th></tr></thead>'
								+ '<tbody><tr>'
								+ '<td>' + (business.total || "") + '</td>'
								+ '<td>' + (business.yearGrowth != null ? business.yearGrowth.toFixed(2) : "") + '</td>'
								+ '<td>' + (business.sort || "") + '</td>'
								+ '</tr></tbody></table></div></div></div>'
						});
						
						$list.empty();
						$list.append(result);
						
					} else {
						
					}
				},
				error: function(err) {}
			});
			
		});
	});
	</script>

</body>

</html>