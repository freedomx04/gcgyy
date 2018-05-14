<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>产品信息</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/updown.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/lazyimg.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
</head>

<body class="wx-product">
	<div class="searchbar_wrap"></div>
	
	<div class="wx-product-list">
		<div class="weui_cells weui_cells_access" style="margin-top: 0;">
			<div class="weui_cells_bd"></div>
		</div>
	</div>
	
	<div class="wx-product-search" style="display: none;">
		<div class="weui_cells weui_cells_access" style="margin-top: 0;"></div> 
	</div>
	
	<script type="text/javascript">
	$(function() {
		
		var $page = $('.wx-product');
		var $list = $page.find('.wx-product-list');
		var $search = $page.find('.wx-product-search');
		
		var page = -1;
		var size = 10;
		
		$('.weui_cells').dropload({
			scrollArea: window,
			autoLoad: true,
			domUp: { // 下拉
				domClass	: 	'dropload-up',
	            domRefresh  : 	'<div class="dropload-refresh"><i class="icon icon-114"></i>上拉加载更多</div>',
	            domUpdate   : 	'<div class="dropload-load f15"><i class="icon icon-20"></i>释放更新...</div>',
	            domLoad     : 	'<div class="dropload-load f15"><span class="weui-loading"></span>正在加载中...</div>'
			},
 			domDown: { // 上拉
				domClass	:	'dropload-down',
				domRefresh	: 	'<div class="dropload-refresh f15"><i class="icon icon-20"></i>上拉加载更多</div>',
				domLoad    	: 	'<div class="dropload-load f15"><span class="weui-loading"></span>正在加载中...</div>',
	            domNoData  	: 	'<div class="dropload-noData">没有更多数据了</div>'
			}, 
 			loadUpFn: function(me) { // 刷新
 				var result = '';
 			
				$.ajax({
					url: '${ctx}/enterprise/product/listAllPaging',
					type: 'POST',
					data: {
						page: 0,
						size: size
					},
					success: function(ret) {
						var products = ret.data;
						$.each(products, function(key, product) {
							result +='<a href="javascript:;" class="weui_cell product-info" data-product-id="' + product.id + '">'
								+ '<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">'
								+ '<img src="${icon}" data-src="${ctx}/' + product.imagePath + '" style="width: 80px; display: block;">'
								+ '</div>'
								+ '<div class="weui_cell_bd">'
								+ '<p>' + product.name + '</p>'
								+ '<p style="font-size: 13px; color: #999; margin-top: 10px;">' + product.enterprise.name + '</p>'
								+ '</div>'
								+ '</a>';
						});
						
						$page.find('.weui_cells_bd').html(result);
						$k.util.lazyLoadImg('.weui-updown [data-src]');
						me.resetload();
						page = 0;
						me.unlock();
						me.noData(false);
					},
					error: function(err) {
						$.alert('加载异常');
                        me.resetload();
					}
				});
			}, 
			loadDownFn: function(me) { // 加载更多
				var result = '';
				// 分页加一
				page++;
				
				$.ajax({
					url: '${ctx}/enterprise/product/listAllPaging',
					type: 'POST',
					data: {
						page: page,
						size: size
					},
					success: function(ret) {
						var products = ret.data;
						var arrLen = products.length;
						if (arrLen > 0) {
							$.each(products, function(key, product) {
								result +='<a href="javascript:;" class="weui_cell product-info" data-product-id="' + product.id + '">'
									+ '<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">'
									+ '<img src="${icon}" data-src="${ctx}/' + product.imagePath + '" style="width: 80px; display: block;">'
									+ '</div>'
									+ '<div class="weui_cell_bd">'
									+ '<p>' + product.name + '</p>'
									+ '<p style="font-size: 13px; color: #999; margin-top: 10px;">' + product.enterprise.name + '</p>'
									+ '</div>'
									+ '</a>';
							});
						} else {
							me.lock();	// 锁定
							me.noData();// 无数据
						}
						
						$page.find('.weui_cells_bd').append(result);
						$k.util.lazyLoadImg('.weui-updown [data-src]');
						me.resetload();
					},
					error: function(err) {
						$.alert('加载异常');
                        me.resetload();
					}
				});
			}
		});
		
		$page
		.on('click', '.product-info', function() {
			var productId = $(this).data('productId');
			window.location = '${ctx}/wx/enterprise/product?productId=' + productId;
		});
		
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
					url: '${ctx}/enterprise/product/search',
					data: {
						input: value
					},
					success: function(ret) {
						if (ret.status == 0) {
							var productList = ret.data;
							if (productList.length > 0) {
								$.each(productList, function(key, product) {
									$('<a href="javascript:;" class="weui_cell product-info" data-product-id="' + product.id + '">'
										+ '<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">'
										+ '<img src="${icon}" data-src="${ctx}/' + product.imagePath + '" style="width: 80px; display: block;">'
										+ '</div>'
										+ '<div class="weui_cell_bd">'
										+ '<p>' + product.name + '</p>'
										+ '<p style="font-size: 13px; color: #999; margin-top: 10px;">' + product.enterprise.name + '</p>'
										+ '</div>'
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
		
	});
	</script>
    
</body>
</html>