<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>主要指标</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

</head>

<body>
	<div>
		<c:choose>
		<c:when test="${user.role.resource.indexOf('agency_enterprise') > -1 || user.role.resource.indexOf('agency_department') > -1}">
		<div class="searchbar_wrap"></div>
	    <div class="page-bd wx-monitor-list">  
			<ul>
				<c:forEach var="type" begin="0" end="3"  step="1" varStatus="i" items="企业主要指标,行业主要指标,区域主要指标,重点企业主要指标">
					<li>
						<div class="weui-flex js-category">
							<p class="weui-flex-item">${type}</p>
							<i class="icon icon-74"></i>
						</div>
						<div class="page-category js-categoryInner">
							<c:if test="${user.role.resource.indexOf('agency_department') > -1}">
							<div class="weui_cells weui_cells_access" style="margin-top: 0px;">
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-1">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>工业增加值及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>   
					             <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-2">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>主营业务收入及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a> 
	                         	<a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-3">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>利润总额及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-4">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>税金总额及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-5">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>用电量及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-6">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>用气量及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-7">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>国税及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-8">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>地税及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-9">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>应收账款及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-10">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>产存品存货及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-11">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>资产累计及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=${i.index}-12">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>负债累计及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					        </div>
					        </c:if>
					        
					        <c:if test="${user.role.resource.indexOf('agency_enterprise') > -1}">
							<div class="weui_cells weui_cells_access" style="margin-top: 0px;">
					            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-1&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>工业增加值及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>   
					             <a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-2&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>主营业务收入及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a> 
	                         	<a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-3&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>利润总额及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-4&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>税金总额及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-5&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>用电量及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-6&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>用气量及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-7&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>国税及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-8&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>地税及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-9&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>应收账款及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=${i.index}-10&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>产存品存货及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitor_gv?type=${i.index}-11&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>资产累计及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					            <a class="weui_cell" href="${ctx}/wx/monitor_gv?type=${i.index}-12&userId=${user.id}">
					                <div class="weui_cell_bd weui_cell_primary">
					                    <p>负债累计及增幅图表</p>
					                </div>
					                <div class="weui_cell_ft"></div>
					            </a>
					        </div>
					        </c:if>
					        
				        </div>
				    </li>
				</c:forEach>
			</ul>
		</div> 
		</c:when>
		
		<c:otherwise>
		<div class="weui_msg">
			<div class="weui_icon_area"><i class="weui_icon_info weui_icon_msg"></i></div>
			<div class="weui_text_area">
				<p class="weui_msg_desc">您的账号没有权限！</p>
			</div>
		</div>
		</c:otherwise>
		
		</c:choose>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	
	<script type="text/javascript">
	$(function( $ ) {
		$('.js-category').click(function(){
			$parent = $(this).parent('li');
			if($parent.hasClass('js-show')){
				$parent.removeClass('js-show');
				$(this).children('i').removeClass('icon-35').addClass('icon-74');
			}else{
				$parent.siblings().removeClass('js-show');
				$parent.addClass('js-show');
				$(this).children('i').removeClass('icon-74').addClass('icon-35');
				$parent.siblings().find('i').removeClass('icon-35').addClass('icon-74');
			}
		});
	});
	</script>

</body>

</html>