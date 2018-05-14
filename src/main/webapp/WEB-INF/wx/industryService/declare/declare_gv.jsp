<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>网上申报</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
</head>

<body class="wx-declare-info">

	<div class="searchbar_wrap"></div>
	
	<div class="wx-declare-list">
		<div class="weui_cells weui_cells_access">
			<c:if test="${empty declareList}">
				<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
			</c:if>
			<c:forEach var="declare" items="${declareList}">
		        <a class="weui_cell declare-info" href="javascript:;" data-declare-id="${declare.id}">
		            <div class="weui_cell_bd">
		                <p style="font-size: 16px; margin-bottom: 8px;">${declare.itemName}</p>
						<p style="font-size: 13px; color: #999">${declare.status=="1" ? "展示中": declare.status=="2" ? "下架" : "新增"}</p>
		            </div>
		        </a>
			</c:forEach>
	    </div>
	    
	</div>
	  
	<div class="wx-declare-search" style="display: none;">
		<div class="weui_cells weui_cells_access" style="margin-top: 0;"></div> 
	</div>

	<script type="text/javascript">
	$(function() {
		var $page = $('.wx-declare-info');
		var $list = $page.find('.wx-declare-list');
		var $search = $page.find('.wx-declare-search');
		
		$('.searchbar_wrap').searchBar({
			cancelText : "取消",
			searchText : '搜索',
			onfocus: function(value) {
			},
			onblur: function(value) {
			},
			oninput: function(value) {
			},
			onsubmit: function(value) {
				if (value == '') {
					return;
				}
				
				$search.find('.weui_cells_access').empty();
				$list.hide();
				$search.show();
				
				$.ajax({
					url: '${ctx}/enterprise/search',
					data: {
						input: value
					},
					success: function(ret) {
						if (ret.status == 0) {
							var enterpriseList = ret.data;
							if (enterpriseList.length > 0) {
								$.each(enterpriseList, function(key, enterprise) {
									$('<a href="javascript:;" class="weui_cell enterprise-info" data-enterprise-id="' + enterprise.id + '">'
										+ '<div class="weui_cell_hd weui-updown">'
										+ '<img src="${icon}" data-src="${ctx}/' + enterprise.imagePath + '" style="width: 40px; height: 40px; margin-right: 10px; display: block;"/>'
										+ '</div>'
										+ '<div class="weui_cell_bd weui_cell_primary"><p>' + enterprise.name + '</p></div>'
										+ '</a>')
									.appendTo($search.find('.weui_cells_access'));
								});
								
								$k.util.lazyLoadImg('.weui-updown [data-src]');
							} else {
								$search.find('.weui_cells_access').html('<div class="weui-footer" style="padding: 10px;"><p>未找到内容</p></div>');
							}
						}
					},
					error: function(err) {}
				});
			},
			oncancel: function() {
				$search.hide();
				$list.show();
			},
			onclear: function() {
			}
		});
		
		$page
		.on('click', '.declare-info', function() {
			var declareId = $(this).data('declareId');
			window.location = '${ctx}/wx/declareinfo?declareId=' + declareId + "&role=ep";
		})
		
	});
	</script>

</body>

</html>