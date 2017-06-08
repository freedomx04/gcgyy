<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>企业新闻</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/updown.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/lazyimg.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<style type="text/css">
        .weui-weixin-content .hm-weixin-title {
            margin-bottom: 6px;
        }
    </style>
	
</head>

<body class="wx-bulletin">
	<div class="weui_tab wx-bulletin-tab">
		<div class="weui_tab_nav" style="padding: 10px;">
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="0" data-loaded="false" data-type="3">图片新闻</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="1" data-loaded="false" data-type="0">公示公告</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="2" data-loaded="false" data-type="1">政策法规</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="3" data-loaded="false" data-type="2">工业信息</a>
		</div>
		
		<div>
			<div class="weui_tab_bd_item weui_tab_bd_item_active bulletin_3">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<div class="weui_cells_bd"></div>
				</div>
			</div>
			
			<div class="weui_tab_bd_item bulletin_0">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<div class="weui_cells_bd"></div>
				</div>
			</div>
			
			<div class="weui_tab_bd_item bulletin_1">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<div class="weui_cells_bd"></div>
				</div>
			</div>
			
			<div class="weui_tab_bd_item bulletin_2">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<div class="weui_cells_bd"></div>
				</div>
			</div>
		</div>
		
		
				<%-- <c:if test="${empty list}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="bulletin" items="${list}">
						<a href="javascript:;" class="weui_cell bulletin-info" data-bulletin-id="${bulletin.id}">
							<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">
								<img src="${icon}" data-src="${ctx}/${product.imagePath}" style="width: 80px; display: block;">
							</div>
							<div class="weui_cell_bd">
								<p style="font-size: 16px; margin-bottom: 8px;">${bulletin.title}</p>
								<p style="font-size: 13px; color: #999"><fmt:formatDate value="${bulletin.createTime}" pattern="yyyy-MM-dd"/></p>
							</div>
						</a>
					</c:forEach> --%>
		
	</div>
	
	<script type="text/javascript">
	$(function() {
		
		// 每个页面的分页独立
		var page = page0 = page1 = page2 = page3 = -1;
		// 分页大小
		var size = 10;
		
		var $page = $('.wx-bulletin');
		
		// 根据index跳转的指定tab
		var defaultIndex = Url.queryString('index');
		if (!defaultIndex) {
			defaultIndex = 0;
		}
		$page.find('.wx-bulletin-tab').tab({
			defaultIndex: defaultIndex,
			activeClass: 'bg_green'
		});
		// 根据index初始化页面
		var $item = $page.find('.weui_navbar_item[data-index="' + defaultIndex + '"]');
		var itemType = $item.data('type');
		initBulletin($page.find('.bulletin_' + itemType), itemType);
		
		$page
		.on('click', '.bulletin-info', function() {
			var bulletinId = $(this).data('bulletinId');
			window.location = '${ctx}/wx/bulletin/get?bulletinId=' + bulletinId;
		})
		.on('click', '.weui_navbar_item', function() {
			var loaded = $(this).data('loaded');
			var type = $(this).data('type');
			
			if (!loaded) {
				var $bulletin = $page.find('.bulletin_' + type);
				// 初始化公告页面
				initBulletin($bulletin, type);
				// 加载过的不再重新加载
				$(this).data('loaded', 'true');
			}
			
			// 设置index,刷新页面时直接跳到该tab
			var index = $(this).data('index');
			Url.updateSearchParam("index", index);
		});
		
		function initBulletin($bulletin, type) {
			$bulletin.find('.weui_cells').dropload({
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
						url: '${ctx}/dynamic/listByTypePaging',
						type: 'POST',
						data: {
							type: type,
							page: 0,
							size: size
						},
						success: function(ret) {
							var bulletins = ret.data;
							$.each(bulletins, function(key, bulletin) {
								var imgDiv = '';
								if (bulletin.type == 3) {
									imgDiv = '<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">'
										+ '<img src="${icon}" data-src="${ctx}/' + bulletin.imagePath + '" style="width: 80px; display: block;">'
										+ '</div>';
								}
								
								result += '<a href="javascript:;" class="weui_cell bulletin-info" data-bulletin-id="' + bulletin.id + '">'
									+ imgDiv
									+ '<div class="weui_cell_bd">'
									+ '<p style="font-size: 16px; margin-bottom: 8px;">' + bulletin.title + '</p>'
									+ '<p style="font-size: 13px; color: #999">' + new Date(bulletin.createTime).Format("yyyy-MM-dd") + '</p>'
									+ '</div>'
									+ '</a>'
							});
							
							$bulletin.find('.weui_cells_bd').html(result);
							$k.util.lazyLoadImg('.weui-updown [data-src]');
							
							me.resetload();
							
							switch (type) {
							case 0:	   page0 = 0;	 break;
							case 1:    page1 = 0;    break;
							case 2:    page2 = 0;	 break;
							case 3:	   page3 = 0;	 break;
							}
							
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
				
					switch (type) {
					case 0:		page0++;	page = page0;	break;
					case 1:		page1++;	page = page1;	break;
					case 2: 	page2++;	page = page2;	break;
					case 3:		page3++;	page = page3;	break;
					}
					
					$.ajax({
						url: '${ctx}/dynamic/listByTypePaging',
						type: 'POST',
						data: {
							type: type,
							page: page,
							size: size
						},
						success: function(ret) {
							var bulletins = ret.data;
							var arrLen = bulletins.length;
							if (arrLen > 0) {
								$.each(bulletins, function(key, bulletin) {
									var imgDiv = '';
									if (bulletin.type == 3) {
										imgDiv = '<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">'
											+ '<img src="${icon}" data-src="${ctx}/' + bulletin.imagePath + '" style="width: 80px; display: block;">'
											+ '</div>';
									}
									
									result += '<a href="javascript:;" class="weui_cell bulletin-info" data-bulletin-id="' + bulletin.id + '">'
										+ imgDiv
										+ '<div class="weui_cell_bd">'
										+ '<p style="font-size: 16px; margin-bottom: 8px;">' + bulletin.title + '</p>'
										+ '<p style="font-size: 13px; color: #999">' + new Date(bulletin.createTime).Format("yyyy-MM-dd") + '</p>'
										+ '</div>'
										+ '</a>'
								});
							} else {
								me.lock();	// 锁定
								me.noData();// 无数据
							}
							
							$bulletin.find('.weui_cells_bd').append(result);
							$k.util.lazyLoadImg('.weui-updown [data-src]');
							me.resetload();
							
						},
						error: function(err) {
							$.alert('加载异常');
	                        me.resetload();
						}
					});
					
					// 分页加一
					/**debugger;
					switch (type) {
					case 0:		page0++;	break;
					case 1:		page1++;	break;
					case 2: 	page2++;	break;
					case 3:		page3++;	break;
					} */
				}
			});
		}
		
	});
	</script>
    
</body>
</html>