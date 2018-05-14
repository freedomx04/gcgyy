<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>诉求中心</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/js/highcharts/4.2.5/highcharts.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/utils.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/constant.js"></script>
	
</head>

<body class="wx-appealCenter-info" style="width: 100%;">
	<div class="weui_tab appealCenter-tab" style="width: 100%;">
		<div class="weui_tab_nav" style="padding: 10px 20px;">
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="0">诉求列表</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="1">诉求分类</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="2">诉求预警</a>
		</div>
		
		<div style="width: 100%;">
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty appealList}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="appeal" items="${appealList}">
						<a class="weui_cell appeal-info" href="javascript:;" data-appeal-id="${appeal.id}">
			                <div class="weui_cell_hd">
			                	<p style="font-size: 16px; margin-bottom: 8px;">${appeal.title}</p>
								<p style="font-size: 13px; color: #999"><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
			                </div>
			                <div class="weui_cell_bd weui_cell_primary"><p></p></div>
			                <div style="color: #999;">
			                	${appeal.appealType.name}
			                	<span class="weui-badge" style="margin-left: 5px; background-color: #04be02;" data-status="${appeal.status}"></span>
			                </div>
            			</a>
					</c:forEach>
				</div>
			</div>
			
			<div class="weui_tab_bd_item" style="width: 100%;">
				<div class="weui_cells_title">诉求分类分布图</div>
				<div id="appealType-chart-container" style="margin-top: 10px; width: 100%;"></div>
				
				<div class="weui_cells_title" >诉求分类状态统计图</div>
				<div id="appealStatus-chart-container" style="margin-top: 10px; width: 100%;"></div>
			</div>
			
			<div class="weui_tab_bd_item" style="width: 100%;">
				<div class="weui_cells_title">诉求预警提醒</div>
				<div id="appeal-warning-chart-container" style="margin-top: 10px; width: 100%;"></div>
			</div>
			
		</div>
		
	</div>

	<script type="text/javascript">
	$(function() {
		var $page = $('.wx-appealCenter-info');
		var userId = $k.util.getRequestParam("userId");
		var defaultIndex = Url.queryString("index");
		if (!defaultIndex) {
			defaultIndex = 0;
		}
		$page.find('.appealCenter-tab').tab({
			defaultIndex: defaultIndex,
			activeClass: 'bg_green'
		});
		
		$.each($page.find(".weui-badge"), function(k, y) {
			var status = $page.find(".weui-badge").eq(k).data('status');
			$page.find(".weui-badge").eq(k).text($k.constant.getAppealStatus(status));
		});
		
		getAppealTypeChart($page.find("#appealType-chart-container"));
		getAppealStatusChart($page.find("#appealStatus-chart-container"));
		getWarnigChart($page.find("#appeal-warning-chart-container"))
		
		
		$page
		.on('click', '.appeal-info', function() {
			var appealId = $(this).data('appealId');
			window.location = '${ctx}/wx/appealCenter/appealinfo?appealId=' + appealId +"&role=gv&userId=" + userId;
		})
		.on('click', '.weui_navbar_item', function() {
			var index = $(this).data('index');
			Url.updateSearchParam("index", index);
		});
		
		
		function getAppealTypeChart($chartContainer) {
			$.ajax({
				url: "${ctx}/appeal/getAppealCountByType",
				type: "POST",
				data: {
					departmentId: parseInt("${departmentId}")
				},
				success: function(data) {
					var seriesData = [];
					$.each(data.data, function(key, val) {
						seriesData.push({name: val.appealTypeName, y: val.count, value: val.appealTypeId});
		            });
					var chart = $chartContainer.highcharts({
						 chart: { plotBackgroundColor: null, plotBorderWidth: null, plotShadow: false }, 
						 title: { text: '诉求分类分布图' }, 
						 credits: {
				             text: '',
				             href: '#'
				         },
						 tooltip: { 
							 formatter: function() {
					            return '<b>'+ this.point.name +'</b>: '+ Highcharts.numberFormat(this.percentage, 1) +'% ('+
		                         Highcharts.numberFormat(this.y, 0, ',') +' 条)';
		         
							 } 		
				         }, 
						 plotOptions: { 
							 pie: { 
								 allowPointSelect: true, 
								 cursor: 'pointer', 
								 dataLabels: { enabled: false }, 
								 showInLegend: true,
							},
							series: {
	                            events: {
	                               legendItemClick: function (event){                                    
	                                  return false;
	                               }
	                            }
	                       }
						 }, 
					    series: [{
					    	type: "pie",
					    	name: "占",
					    	data: seriesData
					    }]
					});
				},
				error: function(err) {}
			});
		}
		
		function getAppealStatusChart($chartContainer){
			$.ajax({
				url: "${ctx}/appeal/appealStatusCount",
				type: "POST",
				data: {
					departmentId: parseInt("${departmentId}")
				},
				success: function(data) {
					if(data.status != 0 || data.data.length == 0) {
						$chartContainer.html("暂无数据！");
						return;
					}
					var seriesData = [];
					$.each(data.data, function(key, val) {
						var statusData = [];
						$.each(val, function(ky, vl) {
							if(ky != 0 && ky != 1) {
								statusData.push(vl.length);
							}
						})
						seriesData.push({name: key, data: statusData});
		            });
					
					 $chartContainer.highcharts({ 
						 chart: { type: 'column' }, 
						 title: { text: '诉求分类状态统计图' }, 
						 credits: {
				             text: '',
				             href: '#'
				         },
						 xAxis: { categories: ['待处理', '处理中', '待确认', '办结', '驳回'] }, 
						 yAxis: { 
							 min: 0, title: { text: '记录(条)' }, 
						 	 stackLabels: { 
							 	enabled: true, 
							 	style: { 
								 	fontWeight: 'bold', 
								 	color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray' 
							 	} 
						 	} 	
						}, 
						tooltip: { 
							formatter: function() { 
								return '<b>'+ this.x +'</b><br/>'+ this.series.name +': '+ this.y +'<br/>'+ '总计: '+ this.point.stackTotal; 
								} 
						}, 
						plotOptions: { 
							column: { 
								stacking: 'normal', 
								dataLabels: { 
									enabled: true, 
									color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white' 
								},
							},
						   series: {
	                            events: {
	                               legendItemClick: function (event){                                    
	                                  return false;
	                               },
	                               click: function(e) {  
	                            	   
		                           	} 
	                            }
	                       }
						}, 
						series: seriesData 
					});
				},
				error: function(err) {}
			});
		}
		
		function getWarnigChart($chartContainer) {
			$.ajax({
				url: "${ctx}/appeal/overAppealDaysPC",
				type: "POST",
				data: {
					departmentId: parseInt("${departmentId}")
				},
				success: function(data) {
					var result = data.data;
					if(data.status != 0 || result == null || result.length == 0) {
						$chartContainer.html("暂无数据！");
						return;
					}
					
					var appealTypeName = [];
					var acceptDays = [];
					var handleDays = [];
					$.each(data.data, function(key, val) {
						appealTypeName.push(val.appealTypeName);
						acceptDays.push({y: val.acceptDays.length, extra: val.acceptDays});
						handleDays.push({y: val.handleDays.length, extra: val.handleDays});
		            });
					$chartContainer.highcharts({
						 chart: { type: 'bar' }, 
						 title: { text: '诉求预警提醒' }, 
						 credits: {
				             text: '',
				             href: '#'
				         },
						 xAxis: { 
							 categories: appealTypeName, 
							 title: { text: null },
						 }, 
						 yAxis: { 
							 min: 0, 
							 title: { text: '记录 (条)', align: 'high' }, 
							 labels: { overflow: 'justify', step: 4 } 
						}, 
						 tooltip: { valueSuffix: ' 条' }, 
						 plotOptions: { 
							 bar: { dataLabels: { enabled: true } },
					         series: {
								cursor: 'pointer', 
	                            events: {
	                               legendItemClick: function (event){                                    
	                                  return false;
	                               }
	                            }
	                         }
						 }, 
						 credits: { enabled: false }, 
						 series: [
					         { name: '超过受理天数', data: acceptDays},
					         { name: '超过处理天数', data: handleDays}
						 ] 
				    });
				},
				error: function(err) {}
		    });
		}
	});
	</script>

</body>

</html>