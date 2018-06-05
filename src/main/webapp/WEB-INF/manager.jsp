<%@page import="com.google.gson.Gson"%>
<%@page import="com.hongmeng.gcgyy.entity.authority.BaseUserEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>广昌工业后台管理</title>

<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="./img/favicon.ico" type="image/x-icon" />

<jsp:include flush="true" page="/WEB-INF/include/html_head_preload.jsp">
	<jsp:param name="html_head_preload" value="html_head_preload"/> 
</jsp:include>
<%@ include file="/WEB-INF/dialog.jsp"%>
<!-- 权限管理   -->
<%@ include file="/WEB-INF/page/authority/department.jsp"%>
<%@ include file="/WEB-INF/page/authority/role.jsp"%>
<%@ include file="/WEB-INF/page/authority/user.jsp"%>
<%@ include file="/WEB-INF/page/authority/enterprise.jsp"%>
<%@ include file="/WEB-INF/page/authority/visit.jsp"%>

<!-- 基础数据   -->
<%@ include file="/WEB-INF/page/baseData/area.jsp"%>
<%@ include file="/WEB-INF/page/baseData/productType.jsp"%>
<%@ include file="/WEB-INF/page/baseData/appealType.jsp"%>
<%@ include file="/WEB-INF/page/baseData/business.jsp" %>
<%-- <%@ include file="/WEB-INF/page/baseData/report.jsp" %> --%>
<jsp:include flush="true" page="/WEB-INF/page/baseData/county.jsp">
	<jsp:param name="county" value="county"/> 
</jsp:include>

<!-- 帮扶平台   -->
<jsp:include flush="true" page="/WEB-INF/page/assist/appeal/appealCenter_ep.jsp">
	<jsp:param name="appealCenterEP" value="appealCenterEP"/> 
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/assist/appeal/appealCenter_gv.jsp">
	<jsp:param name="appealCenterGV" value="appealCenterGV"/> 
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/assist/appeal/appealCenter_dispatcher.jsp">
	<jsp:param name="appealCenterDispatcher" value="appealCenterDispatcher"/> 
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/assist/appeal/appealCenter_point.jsp">
    <jsp:param name="appealCenterPoint" value="appealCenterPoint"/>  
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/assist/enterpriseInfo/enterpriseInfo_ep.jsp">
	<jsp:param name="enterpriseInfo_ep" value="enterpriseInfo_ep"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/assist/enterpriseInfo/enterpriseInfo_gv.jsp">
	<jsp:param name="enterpriseInfo_gv" value="enterpriseInfo_gv"/>
</jsp:include>
<%-- <%@ include file="/WEB-INF/page/assist/enterpriseInfo/enterpriseInfo_point.jsp"%> --%>
<jsp:include flush="true" page="/WEB-INF/page/assist/enterpriseInfo/product.jsp">
	<jsp:param name="product" value="product"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/assist/enterpriseInfo/news.jsp">
	<jsp:param name="news" value="news"/>
</jsp:include>
<%@ include file="/WEB-INF/page/assist/dynamic.jsp"%>

<!-- 工业平台 -->
<%@ include file="/WEB-INF/page/industryService/jobplatform.jsp" %>
<jsp:include flush="true" page="/WEB-INF/page/industryService/declare/declare_ep.jsp">
	<jsp:param name="declare_ep" value="declare_ep"/> 
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/industryService/declare/declare_gv.jsp">
	<jsp:param name="declare_gv" value="declare_gv"/> 
</jsp:include>

<!-- 个人中心 -->
<%@ include file="/WEB-INF/page/personalCenter/personalInfo.jsp"%>

<jsp:include flush="true" page="/WEB-INF/page/monitor/energy.jsp">
    <jsp:param name="energy" value="energy"/>  
</jsp:include>

<jsp:include flush="true" page="/WEB-INF/page/monitor/warning.jsp">
    <jsp:param name="warning" value="warning"/>  
</jsp:include>

<!-- 信息直报 -->
<jsp:include flush="true" page="/WEB-INF/page/report/energyGV.jsp">
    <jsp:param name="energyGV" value="energyGV"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/report/energyEP.jsp">
    <jsp:param name="energyEP" value="energyEP"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/report/taxGV.jsp">
    <jsp:param name="taxGV" value="taxGV"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/report/taxEP.jsp">
    <jsp:param name="taxEP" value="taxEP"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/report/economicGV.jsp">
    <jsp:param name="economicGV" value="economicGV"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/report/economicEP.jsp">
    <jsp:param name="economicEP" value="economicEP"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/report/benefitGV.jsp">
    <jsp:param name="benefitGV" value="benefitGV"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/report/benefitEP.jsp">
    <jsp:param name="benefitEP" value="benefitEP"/>
</jsp:include>

<jsp:include flush="true" page="/WEB-INF/page/target.jsp">
    <jsp:param name="target" value="target"/>  
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/targetEP.jsp">
    <jsp:param name="targetEP" value="targetEP"/>  
</jsp:include>

<jsp:include flush="true" page="/WEB-INF/page/ranking.jsp">
    <jsp:param name="ranking" value="ranking"/>  
</jsp:include>

<!-- 全市上报 -->
<jsp:include flush="true" page="/WEB-INF/page/rank/industry_addition.jsp">
	<jsp:param name="industry_addition" value="industry_addition"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/rank/main_business.jsp">
	<jsp:param name="main_business" value="main_business"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/rank/profit_tax.jsp">
	<jsp:param name="profit_tax" value="profit_tax"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/rank/profit.jsp">
	<jsp:param name="profit" value="profit"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/rank/electricity.jsp">
	<jsp:param name="electricity" value="electricity"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/rank/industry_output.jsp">
	<jsp:param name="industry_output" value="industry_output"/>
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/rank/vat.jsp">
	<jsp:param name="vat" value="vat"/>
</jsp:include>

<style type="text/css">
li.admin-parent {
	background-color: #0e90d2;
}
li.admin-parent > a {
	color: #fff!important;
}
.admin-sidebar-sub > li > a {
	font-size: 14px;
}
.am-nav > li > a:hover,
.am-nav > li > a:focus {
  text-decoration: none;
  background-color: inherit;
}
</style>

</head>
<body>
	<div class="page"></div>
		
	<script class="template managerPage" type="text/x-jquery-tmpl">
		<header class="am-topbar admin-header" style="background-image: url('img/top.png'); color: white;">
			<div style="float: left; padding: 25px;">
				<div style="font-weight: bold; font-size: 2.2rem;">广昌互联网+工业管理平台</div>
				<div>Guangchang Internet + Industrial Management Platform</div>
			</div>
			<div class="am-collapse am-topbar-collapse" id="topbar-collapse" style="margin-top: 10px;">
				<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
					<li class="am-dropdown" data-am-dropdown>
						<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;" style="color: white;">
							<span class="am-icon-user"></span>
							<span class="user-name">{{=it.user.name}}</span>
							<span class="am-icon-caret-down"></span>
				        </a>
				        <ul class="am-dropdown-content">
				        	<li class="personalInfo-btn"><a href="#"><span class="am-icon-user"></span>个人信息</a></li>
				        	<li class="logout-btn"><a href="#"><span class="am-icon-power-off"></span>退出</a></li>
				        </ul>
				    </li>
				</ul>
				<div class="am-fr" style="line-height: 50px;margin-right: 10px;"><a href="./" target="_blank" style="color: #fff;">首页</a></div>
			</div>
		</header>
		<div class="am-cf admin-main">
			<div class="sidebar admin-sidebar am-offcanvas" id="admin-offcanvas">
				<div class="">
					<ul class="am-list admin-sidebar-list">

						<!-- 权限管理    -->
						{{? it.resource.indexOf('authority_role') > -1 || it.resource.indexOf('authority_enterprise') > -1 || it.resource.indexOf('authority_department') > -1 || it.resource.indexOf('authority_user') > -1 }}
				        <li class="adminManage admin-parent">
				        	<a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}">
					        	<span class="am-icon-reorder"></span> 权限管理<span class="am-icon-angle-right am-fr am-margin-right"></span>
				        	</a>
				            <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav1">
								{{? it.resource.indexOf('authority_role') > -1 }}
				            	<li class="role module clickable" module="role" id="collapse-nav-1.1">
				            		<a class="am-cf"><span class="am-icon-check am-icon-fw"></span> 角色设置</a>
				            	</li>
								{{?}}
								{{? it.resource.indexOf('authority_enterprise') > -1 }}
				            		<li class="enterprise module clickable" module="enterprise" id="collapse-nav-1.2">
				            			<a class="am-cf"><span class="am-icon-puzzle-piece am-icon-fw"></span> 企业管理</a>
				            		</li>
								{{?}}
								{{? it.resource.indexOf('authority_department') > -1 }}
				            		<li class="department module clickable" module="department" id="collapse-nav-1.3">
				            			<a class="am-cf"><span class="am-icon-puzzle-piece am-icon-fw"></span> 政府部门管理</a>
				            		</li>
								{{?}}
								{{? it.resource.indexOf('authority_user') > -1 }}
				            	<li class="user module clickable" module="user" id="collapse-nav-1.4">
				            		<a class="am-cf"><span class="am-icon-user am-icon-fw"></span> 用户管理</a>
				            	</li>
								{{?}}
								{{? it.resource.indexOf('authority_visit') > -1 }}
				            	<li class="visit module clickable" module="visit" id="collapse-nav-1.5">
				            		<a class="am-cf"><span class="am-icon-users am-icon-fw"></span> 访问量</a>
				            	</li>
								{{?}}
				          	</ul>
				        </li>
						{{?}}

				        <!--  基础数据   -->
						{{? it.resource.indexOf('base_area') > -1 || it.resource.indexOf('base_productType') > -1 || it.resource.indexOf('base_appealType') > -1 || it.resource.indexOf('base_industryType') > -1 }}
						<li class="baseData admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}">
					        	<span class="am-icon-calculator"></span> 基础数据<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
    						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav2">
								{{? it.resource.indexOf('base_area') > -1 }}		
				            	<li class="area module clickable" module="area" id="collapse-nav-2.1">
				            		<a class="am-cf"><span class="am-icon-sitemap am-icon-fw"></span> 区域管理</a>
				            	</li>
								{{?}}
								{{? it.resource.indexOf('base_productType') > -1 }}	
				            	<li class="productType module clickable" module="productType" id="collapse-nav-2.2">
				            		<a class="am-cf"><span class="am-icon-sliders am-icon-fw"></span> 企业产业类别</a>
				            	</li>
								{{?}}
								{{? it.resource.indexOf('base_appealType') > -1 }}	
				            	<li class="appealType module clickable" module="appealType" id="collapse-nav-2.3">
				            		<a class="am-cf"><span class="am-icon-bookmark am-icon-fw"></span> 诉求分类</a>
				            	</li>
								{{?}}
								{{? it.resource.indexOf('base_industryType') > -1 }}	
				            	<li class="business module clickable" module="business" id="collapse-nav-2.4">
				            		<a class="am-cf"><span class="am-icon-list-alt am-icon-fw"></span> 招工行业类别</a>
				            	</li>
								{{?}}
								/** {{? it.resource.indexOf('base_report') > -1 }}	
				            	<li class="report module clickable" module="report" id="collapse-nav-2.5">
				            		<a class="am-cf"><span class="am-icon-list-alt am-icon-fw"></span> 上报时间</a>
				            	</li>
								{{?}} **/
								{{? it.resource.indexOf('base_county') > -1 }}	
								<li class="county module clickable" module="county" id="collapse-nav-2.6">
				            		<a class="am-cf"><span class="am-icon-list-alt am-icon-fw"></span> 县区管理</a>
				            	</li>
								{{?}}
      						</ul>
     					</li>
						{{?}}

						<!-- 信息直报   -->
						{{? it.resource.indexOf('monitor_report') > -1 }}
						<li class="monitor admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}">
					        	<span class="am-icon-edit"></span> 信息直报<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>	
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav3">
								{{? it.resource.indexOf('agency_enterprise') > -1}}
								<li class="module clickable" module="energyEP">
				            		<a class="am-cf"><span class="am-icon-flash am-icon-fw"></span> 能源消耗</a>
				            	</li>
								<li class="taxEP module clickable" module="taxEP">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 纳税系统</a>
				            	</li>
								<li class="economicEP module clickable" module="economicEP">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 主要指标</a>
				            	</li>			
								{{?}}
								{{? it.resource.indexOf('agency_department') > -1}}
								<li class="module clickable" module="energyGV">
				            		<a class="am-cf"><span class="am-icon-flash am-icon-fw"></span> 能源消耗</a>
				            	</li>
								<li class="taxGV module clickable" module="taxGV">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 纳税系统</a>
				            	</li>
								<li class="economicGV module clickable" module="economicGV">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 主要指标</a>
				            	</li>
								{{?}}
							</ul>	
						</li>
						{{?}}	

						<!-- 全市排名上报   -->
						{{? it.resource.indexOf('rank_report') > -1}}
						<li class="ranking_report admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav14'}">
					        	<span class="am-icon-edit"></span> 全市排名上报<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>	
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav14">
								<li class="reportIndustryAddition module clickable" module="reportIndustryAddition">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 工业增加值</a>
				            	</li>
								<li class="reportMainBusiness module clickable" module="reportMainBusiness">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 主营业务收入</a>
				            	</li>			
								<li class="reportProfit module clickable" module="reportProfit">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 利润总额</a>
				            	</li>
								<li class="reportElectricity module clickable" module="reportElectricity">
				            		<a class="am-cf"><span class="am-icon-flash am-icon-fw"></span> 工业用电</a>
				            	</li>
								<li class="reportIndustryOutput module clickable" module="reportIndustryOutput">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 工业总产值</a>
				            	</li>
								<li class="reportProfitTax module clickable" module="reportProfitTax">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 主营业务成本</a>
				            	</li>
								<li class="reportVat module clickable" module="reportVat">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 亏损企业亏损总额</a>
				            	</li>	
							</ul>	
						</li>
						{{?}}

						<!-- 企业主要指标   -->
						{{? it.resource.indexOf('monitor_enterprise_target') > -1}}
						<li class="enterpriseTarget admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav4'}">
					        	<span class="am-icon-bar-chart"></span> 企业主要指标<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav4">
							{{ var arr = ['工业总产值', '主营业务收入', '利润总额', '税金总额', '用电量', '用气量', '国税', '地税', '应收账款', '产存品存货', '资产累计', '负债累计'];}}
							{{~ arr: item: index}}
								{{? item == '主营业务收入' || item == '利润总额' || item == '税金总额' || item == '用电量' || item == '国税' || item == '地税'}}
									{{? it.resource.indexOf('agency_enterprise') > -1}}
									<li class="module clickable" module="targetEP" type="enterpriseTarget-{{=index+1}}" id="collapse-nav-4.{{=index+1}}">
				            			<a class="am-cf">{{=item}}及增幅图表</a>
				            		</li>
									{{??}}
									<li class="module clickable" module="target" type="enterpriseTarget-{{=index+1}}" id="collapse-nav-4.{{=index+1}}">
				            			<a class="am-cf">{{=item}}及增幅图表</a>
				            		</li>
									{{?}}
								{{?}}
							{{~}}
							</ul>
						</li>
						{{?}}	

						<!-- 行业主要指标   -->
						{{? it.resource.indexOf('monitor_business_target') > -1}}
						<li class="businessTarget admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav5'}">
					        	<span class="am-icon-bar-chart"></span> 行业主要指标<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav5">
							{{ var arr = ['工业总产值', '主营业务收入', '利润总额', '税金总额', '用电量', '用气量', '国税', '地税', '应收账款', '产存品存货', '资产累计', '负债累计'];}}
							{{~ arr: item: index}}
								{{? item == '主营业务收入' || item == '利润总额' || item == '税金总额' || item == '用电量' || item == '国税' || item == '地税'}}
								<li class="module clickable" module="target" type="businessTarget-{{=index+1}}" id="collapse-nav-5.{{=index+1}}">
				            		<a class="am-cf">{{=item}}及增幅图表</a>
				            	</li>
								{{?}}
							{{~}}
							</ul>
						</li>
						{{?}}	

						<!-- 区域主要指标   -->
						{{? it.resource.indexOf('monitor_area_target') > -1}}
						<li class="areaTarget admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav6'}">
					        	<span class="am-icon-bar-chart"></span> 区域主要指标<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav6">
							{{ var arr = ['工业总产值', '主营业务收入', '利润总额', '税金总额', '用电量', '用气量', '国税', '地税', '应收账款', '产存品存货', '资产累计', '负债累计'];}}
							{{~ arr: item: index}}
								{{? item == '主营业务收入' || item == '利润总额' || item == '税金总额' || item == '用电量' || item == '国税' || item == '地税'}}
								<li class="module clickable" module="target" type="areaTarget-{{=index+1}}" id="collapse-nav-6.{{=index+1}}">
				            		<a class="am-cf">{{=item}}及增幅图表</a>
				            	</li>
								{{?}}
							{{~}}
							</ul>
						</li>
						{{?}}	

						<!-- 重点企业主要指标   -->
						{{? it.resource.indexOf('monitor_point_enterprise_target') > -1}}
						<li class="pointEnterpriseTarget admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav7'}">
					        	<span class="am-icon-bar-chart"></span> 重点企业主要指标<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav7">
							{{ var arr = ['工业总产值', '主营业务收入', '利润总额', '税金总额', '用电量', '用气量', '国税', '地税', '应收账款', '产存品存货', '资产累计', '负债累计'];}}
							{{~ arr: item: index}}
								{{? item == '主营业务收入' || item == '利润总额' || item == '税金总额' || item == '用电量' || item == '国税' || item == '地税'}}
								<li class="module clickable" module="target" type="pointEnterpriseTarget-{{=index+1}}" id="collapse-nav-7.{{=index+1}}">
				            		<a class="am-cf">{{=item}}及增幅图表</a>
				            	</li>
								{{?}}
							{{~}}
							</ul>
						</li>
						{{?}}	

						<!-- 全市排名查看   -->
						{{? it.resource.indexOf('rank_read') > -1}}
						<li class="ranking_read admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav15'}">
					        	<span class="am-icon-edit"></span> 全市排名<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>	
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav15">
								<li class="readIndustryAddition module clickable" module="readIndustryAddition">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 工业增加值</a>
				            	</li>
								<li class="readMainBusiness module clickable" module="readMainBusiness">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 主营业务收入</a>
				            	</li>			
								<li class="readProfit module clickable" module="readProfit">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 利润总额</a>
				            	</li>
								<li class="readElectricity module clickable" module="readElectricity">
				            		<a class="am-cf"><span class="am-icon-flash am-icon-fw"></span> 工业用电</a>
				            	</li>
								<li class="readIndustryOutput module clickable" module="readIndustryOutput">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 工业总产值</a>
				            	</li>
								<li class="readProfitTax module clickable" module="readProfitTax">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 主营业务成本</a>
				            	</li>
								<li class="readVat module clickable" module="readVat">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 亏损企业亏损总额</a>
				            	</li>	
							</ul>	
						</li>
						{{?}}

						<!-- 企业预警   -->
						{{? it.resource.indexOf('monitor_warning') > -1}}
						<li class="monitor admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav8'}">
					        	<span class="am-icon-exclamation-triangle"></span> 企业预警<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav8">
								<li class="warning module clickable" module="warning" type="1">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 企业预警信息</a>
				            	</li>	
								<li class="warning module clickable" module="warning" type="2">
				            		<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span> 报表预警</a>
				            	</li>
							</ul>	
						</li>	
						{{?}}	

						<!-- 积分排名   -->
						<!--
						{{? it.resource.indexOf('monitor_ranking') > -1}}
						<li class="ranking admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav9'}">
					        	<span class="am-icon-list"></span> 积分排名<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav9">
								/** <li class="module clickable" module="ranking" type="1" id="collapse-nav-9.1">
				            		<a class="am-cf"><span class="am-icon-th-list am-icon-fw"></span> 企业填报得分排名</a>
				            	</li> **/
								<li class="module clickable" module="ranking" type="2" id="collapse-nav-9.2">
				            		<a class="am-cf"><span class="am-icon-arrow-up am-icon-fw"></span> 工业总产值环比增幅排名</a>
				            	</li>
								<li class="module clickable" module="ranking" type="3" id="collapse-nav-9.3">
				            		<a class="am-cf"><span class="am-icon-arrow-down am-icon-fw"></span> 工业总产值环比降幅排名</a>
				            	</li>
							</ul>	
						</li>
						{{?}}
						-->

						<!-- 
						{{? it.resource.indexOf('monitor_tax') > -1 || it.resource.indexOf('monitor_energy') > -1 
							|| it.resource.indexOf('monitor_economic') > -1 || it.resource.indexOf('monitor_warning') > -1 
							|| it.resource.indexOf('monitor_energy_report') > -1 || it.resource.indexOf('monitor_economic_report') > -1
							|| it.resource.indexOf('monitor_ranking') > -1 }}
						<li class="monitor admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}">
					        	<span class="am-icon-calculator"></span>工业经济监测分析平台<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
    						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav3">
								{{? it.resource.indexOf('monitor_tax') > -1}}
									{{? it.resource.indexOf('agency_enterprise') > -1}}
										<li class="taxEP module clickable" module="taxEP" id="collapse-nav-3.3">
				            				<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span>纳税系统</a>
				            			</li>
									{{?}}
									{{? it.resource.indexOf('agency_department') > -1}}
										<li class="taxGV module clickable" module="taxGV" id="collapse-nav-3.6">
				            				<a class="am-cf"><span class="am-icon-skype am-icon-fw"></span>纳税系统</a>
				            			</li>
									{{?}}
								{{?}}
								{{? it.resource.indexOf('monitor_energy') > -1}}
									{{? it.resource.indexOf('agency_enterprise') > -1}}
										<li class="energyEP module clickable" module="energyEP" id="collapse-nav-3.2">
				            				<a class="am-cf"><span class="am-icon-table am-icon-fw"></span>信息直报</a>
				            			</li>
									{{?}}
									{{? it.resource.indexOf('agency_department') > -1}}
				            			<li class="energyGV module clickable" module="energyGV" id="collapse-nav-3.5">
				            				<a class="am-cf"><span class="am-icon-table am-icon-fw"></span>信息直报</a>
				            			</li>
									{{?}}
								{{?}}
								{{? it.resource.indexOf('monitor_economic') > -1}}
									<li class="economic module clickable" module="economic" id="collapse-nav-3.9">
				            			<a class="am-cf"><span class="am-icon-table am-icon-fw"></span>工业总产值与主营业务收入</a>
				            		</li>
								{{?}}
								{{? it.resource.indexOf('monitor_economic') > -1}}
									<li class="warning module clickable" module="warning" id="collapse-nav-3.10">
				            			<a class="am-cf"><span class="am-icon-bell-slash am-icon-fw"></span>企业预警</a>
				            		</li>
								{{?}}
								{{? it.resource.indexOf('monitor_energy_report') > -1}}
									<li class="energy module clickable" module="energy" id="collapse-nav-3.7">
				            			<a class="am-cf"><span class="am-icon-bar-chart am-icon-fw"></span>能耗报表</a>
				            		</li>
								{{?}}
								{{? it.resource.indexOf('monitor_energy_report') > -1}}
									{{? it.resource.indexOf('agency_enterprise') > -1}}
										<li class="economicChartEP module clickable" module="economicChartEP" id="collapse-nav-3.1">
				            				<a class="am-cf"><span class="am-icon-bar-chart am-icon-fw"></span>经济运行</a>
				            			</li>
									{{?}}
									{{? it.resource.indexOf('agency_department') > -1}}
										<li class="economicChartGV module clickable" module="economicChartGV" id="collapse-nav-3.4">
				            				<a class="am-cf"><span class="am-icon-bar-chart am-icon-fw"></span>经济运行</a>
				            			</li>
									{{?}}
								{{?}}
								{{? it.resource.indexOf('monitor_energy_report') > -1}}
									<li class="ranking module clickable" module="ranking" id="collapse-nav-3.8">
				            			<a class="am-cf"><span class="am-icon-list am-icon-fw"></span>积分排名系统</a>
				            		</li>
								{{?}}
      						</ul>
     					</li>
						{{ } }} 
						-->

     					<!--  企业精准帮扶平台   -->
						{{? it.resource.indexOf('agency_enterprise') > -1 || it.resource.indexOf('agency_department') > -1 
							|| it.resource.indexOf('assist_appeal_dispatcher') > -1 || it.resource.indexOf('assist_appeal_monitor') > -1}}
						<li class="assist admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav10'}">
					        	<span class="am-icon-hand-paper-o"></span> 企业精准帮扶平台<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
      						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav10">

								{{? it.resource.indexOf('agency_enterprise') > -1}}
				            	<li class="appealCenter module clickable" module="appealCenter" id="collapse-nav-4.1">
				            		<a class="am-cf"><span class="am-icon-hand-grab-o am-icon-fw"></span> 诉求中心</a>
				            	</li>
				            	<li class="enterpriseInfo module clickable" module="enterpriseInfo" id="collapse-nav-4.2">
				            		<a class="am-cf"><span class="am-icon-folder-open"></span> 企业信息</a>
				            	</li>
								{{?? it.resource.indexOf('agency_department') > -1}}
				            	<li class="appealCenterGV module clickable" module="appealCenterGV" id="collapse-nav-4.3">
				            		<a class="am-cf"><span class="am-icon-hand-grab-o am-icon-fw"></span> 诉求中心</a>
				            	</li>
				            	<li class="enterpriseInfoGV module clickable" module="enterpriseInfoGV" id="collapse-nav-4.4">
				            		<a class="am-cf"><span class="am-icon-folder-open am-icon-fw"></span> 企业信息</a>
				            	</li>
								{{?}}

								{{? it.resource.indexOf('assist_appeal_dispatcher') > -1}}
								<li class="appealCenterDispatcher module clickable" module="appealCenterDispatcher" id="collapse-nav-4.5">
				            		<a class="am-cf"><span class="am-icon-hand-grab-o am-icon-fw"></span> 诉求中心(派单)</a>
								</li>
								{{?}}

				            	<li class="appealCenterPoint module clickable am-hide" module="appealCenterPoint" id="collapse-nav-4.6">
				            		<a class="am-cf"><span class="am-icon-hand-pointer-o am-icon-fw"></span> 挂点企业</a>
				            	</li>
				            	<!--<li class="enterpriseInfoPoint module clickable am-hide" module="enterpriseInfoPoint" id="collapse-nav-4.7">
				            		<a class="am-cf"><span class="am-icon-folder-open am-icon-fw"></span> 企业信息</a>
				            	</li>-->
     						</ul>
     					</li>
						{{?}}

     					<!--  工业服务平台   -->
						{{? it.resource.indexOf('service_jobPlatform') > -1 }}		
      					<li class="assist admin-parent">
       						<a class="am-cf" data-am-collapse="{target: '#collapse-nav11'}">
						        <span class="am-icon-building-o"></span> 工业服务平台<span class="am-icon-angle-right am-fr am-margin-right"></span>
				        	</a>
       						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav11">
								{{? it.resource.indexOf('service_jobPlatform') > -1 }}									
					            <li class="jobplatform module clickable" module="jobplatform" id="collapse-nav-5.1">
					            	<a class="am-cf"><span class="am-icon-th-large am-icon-fw"></span> 招工平台</a>
					            </li>
								{{?}}
								{{? it.resource.indexOf('agency_enterprise') > -1}}
								<li class="declareEP module clickable" module="declareEP" id="collapse-nav-5.2">
					            	<a class="am-cf"><span class="am-icon-th-large am-icon-fw"></span> 网上申报</a>
					            </li>
								{{?? it.resource.indexOf('agency_department') > -1}}
								<li class="declareGV module clickable" module="declareGV" id="collapse-nav-5.3">
					            	<a class="am-cf"><span class="am-icon-th-large am-icon-fw"></span> 网上申报</a>
					            </li>
								{{??}}
								{{?}}
       						</ul>
      					</li>
						{{?}}

						<!-- 新闻发布  -->
						{{? it.resource.indexOf('news_photo') > -1 || it.resource.indexOf('news_announce') > -1
							|| it.resource.indexOf('news_policy') > -1 || it.resource.indexOf('news_overview') > -1 }}
						<li class="news admin-parent">
      						<a class="am-cf" data-am-collapse="{target: '#collapse-nav12'}">
					        	<span class="am-icon-newspaper-o"></span> 新闻发布<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>	
							<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav12">
								{{? it.resource.indexOf('point_news_photo') > -1}}
								<li class="dynamic module clickable" module="dynamic" type="4">
				            		<a class="am-cf"><span class="am-icon-image am-icon-fw"></span> 首页图片</a>
				            	</li>	
								{{?}}
								{{? it.resource.indexOf('news_photo') > -1}}
								<li class="dynamic module clickable" module="dynamic" type="3">
				            		<a class="am-cf"><span class="am-icon-image am-icon-fw"></span> 图片新闻</a>
				            	</li>	
								{{?}}
								{{? it.resource.indexOf('news_announce') > -1}}
								<li class="dynamic module clickable" module="dynamic" type="0">
				            		<a class="am-cf"><span class="am-icon-newspaper-o am-icon-fw"></span> 公示公告 </a>
				            	</li>
								{{?}}
								{{? it.resource.indexOf('news_policy') > -1}}
								<li class="dynamic module clickable" module="dynamic" type="1">
				            		<a class="am-cf"><span class="am-icon-newspaper-o am-icon-fw"></span> 政策法规</a>
				            	</li>
								{{?}}
								{{? it.resource.indexOf('news_overview') > -1}}
								<li class="dynamic module clickable" module="dynamic" type="2">
				            		<a class="am-cf"><span class="am-icon-newspaper-o am-icon-fw"></span> 工业信息</a>
				            	</li>
								{{?}}
							</ul>	
						</li>	
						{{?}}

						<!-- 个人中心 -->
						<li class="personalCenter admin-parent">
							<a class="am-cf am-collapsed" data-am-collapse="{target: '#collapse-nav13'}">
					        	<span class="am-icon-home"></span> 个人中心<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        		</a>
							<ul class="am-list admin-sidebar-sub am-in" id="collapse-nav13">
								<li class="personalInfo module clickable am-in" module="personalInfo" id="collapse-nav-13.1">
					            	<a class="am-cf am-collapsed am-active"><span class="am-icon-user am-icon-fw"></span> 个人信息</a>
					            </li>
							</ul>
						</li>

					</ul>
				</div>
			</div>
			<div class="content"></div>
			<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
		</div>
	</script>
	
	<script type="text/javascript">
		;(function($) {
			
			// set session
			<% 
				Gson gson = new Gson();
				BaseUserEntity user = (BaseUserEntity) session.getAttribute("cur_user");
				String str = gson.toJson(user);
			%>
			var user = JSON.parse('<%=str%>');
			$k.user.set(user);
			
			var $page = $(".page");
			$page.html($(".template.managerPage").doT({
				user: user,
				resource: (user.role!=null?user.role.resource:"")
			}));
			$page.html($(".template.managerPage").doT({
				user: user,
				resource: (user.role!=null?user.role.resource:"")
			}));
			var $sidebar = $page.find(".sidebar");
			var $content = $page.find(".content");
			
			$k.util.datatableDefaults();
			
			$k.util.getEnterpriseListByPointUserId({
				success: function(data) {
					if(data.data != null && data.data.length != 0){
						$sidebar.find(".appealCenterPoint").removeClass("am-hide");
					}
				}
			});
			
			init();
			
			var redirect = $k.util.getRequestParam("redirect");
			if (redirect) {
				if (redirect == 'assist') {
					//$sidebar.find(".appealCenter.module").trigger("click");
					$k.page.appealCenter.draw().load();
				}
			}
			
			$page
			.on("click", ".sidebar .module", function() {
				var moduleName = $(this).attr("module");
				var type = $(this).attr('type');
				if (type) {
					$k.page[moduleName].draw(type).load();
				} else {
					$k.page[moduleName].draw().load();
				}
				$content.find(".modulePage").hide();
				$content.find('.' + moduleName + 'Page').show();
				menuChange(this);
			})
			.on("click", ".personalInfo-btn", function() {
				$sidebar.find(".personalInfo.module").trigger("click");
			})
			.on("click", ".logout-btn", function() {
				$.ajax({
					url: "account/logout",
					type: "POST",
					data: { userId: $k.user.get().id },
					success: function(data) {
						if (data.status == 0) {
							window.location.href = "./login";
						}
						$k.user.logout();
					},
					error: function(err) {}
				});
			});
			
			function menuChange(obj){
				<!-- 点击左侧菜单样式   -->
				var $menuli = $(obj)
				var $adminParent = $(".admin-parent");
				$adminParent.find("ul").find("li").find("a").removeClass("am-active");
				$(".admin-parent a").addClass("am-collapsed");
				$(".admin-parent ul").removeClass("am-in");
				$(".admin-parent ul").addClass("am-collapse");
				$(".admin-parent ul").css("height","0px");
				
				$menuli.find('a').addClass("am-active");
				$(".am-active").parent().parent().addClass("am-in");
				$(".am-active").parent().parent().css("height","auto")
			}
			
			function init() {
				// 权限管理
				$('<div class="rolePage modulePage"></div>').appendTo($content);
				$k.page.role = new $k.proto.Role().init($content.find(".rolePage"));
				$('<div class="enterprisePage modulePage"></div>').appendTo($content);
				$k.page.enterprise = new $k.proto.Enterprise().init($content.find(".enterprisePage"));
				$('<div class="departmentPage modulePage"></div>').appendTo($content);
				$k.page.department = new $k.proto.Department().init($content.find(".departmentPage"));
				$('<div class="userPage modulePage"></div>').appendTo($content);
				$k.page.user = new $k.proto.User().init($content.find(".userPage"));
				$('<div class="visitPage modulePage"></div>').appendTo($content);
				$k.page.visit = new $k.proto.Visit().init($content.find(".visitPage"));
				
				// 基础数据
				$('<div class="areaPage modulePage"></div>').appendTo($content);
				$k.page.area = new $k.proto.Area().init($content.find(".areaPage"));
				$('<div class="productTypePage modulePage"></div>').appendTo($content);
				$k.page.productType = new $k.proto.ProductType().init($content.find(".productTypePage"));
				$('<div class="appealTypePage modulePage"></div>').appendTo($content);
				$k.page.appealType = new $k.proto.AppealType().init($content.find(".appealTypePage"));
				$('<div class="businessPage modulePage"></div>').appendTo($content);
				$k.page.business = new $k.proto.Business().init($content.find(".businessPage"));
				/* $('<div class="reportPage modulePage"></div>').appendTo($content);
				$k.page.report = new $k.proto.Report().init($content.find(".reportPage")); */
				$('<div class="countyPage modulePage"></div>').appendTo($content);
				$k.page.county = new $k.proto.County().init($content.find(".countyPage"));
				
				$('<div class="targetPage modulePage"></div>').appendTo($content);
				$k.page.target = new $k.proto.Target().init($content.find(".targetPage"));
				$('<div class="targetEPPage modulePage"></div>').appendTo($content);
				$k.page.targetEP = new $k.proto.TargetEP().init($content.find(".targetEPPage"));
				
				// 工业经济监测分析平台
				//信息直报相关部门
				$('<div class="energyGVPage modulePage"></div>').appendTo($content);
				$k.page.energyGV = new $k.proto.EnergyGV().init($content.find(".energyGVPage"));
				$('<div class="energyEPPage modulePage"></div>').appendTo($content);
				$k.page.energyEP = new $k.proto.EnergyEP().init($content.find(".energyEPPage"));
				$('<div class="taxGVPage modulePage"></div>').appendTo($content);
				$k.page.taxGV = new $k.proto.TaxGV().init($content.find(".taxGVPage"));
				$('<div class="taxEPPage modulePage"></div>').appendTo($content);
				$k.page.taxEP = new $k.proto.TaxEP().init($content.find(".taxEPPage"));
				$('<div class="economicGVPage modulePage"></div>').appendTo($content);
				$k.page.economicGV = new $k.proto.EconomicGV().init($content.find(".economicGVPage"));
				$('<div class="economicEPPage modulePage"></div>').appendTo($content);
				$k.page.economicEP = new $k.proto.EconomicEP().init($content.find(".economicEPPage"));
				$('<div class="benefitGVPage modulePage"></div>').appendTo($content);
				$k.page.benefitGV = new $k.proto.BenefitGV().init($content.find(".benefitGVPage"));
				$('<div class="benefitEPPage modulePage"></div>').appendTo($content);
				$k.page.benefitEP = new $k.proto.BenefitEP().init($content.find(".benefitEPPage"));
				//积分排名系统
				$('<div class="rankingPage modulePage"></div>').appendTo($content);
				$k.page.ranking = new $k.proto.Ranking().init($content.find(".rankingPage"));
				//企业预警
				$('<div class="warningPage modulePage"></div>').appendTo($content);
				$k.page.warning = new $k.proto.Warning().init($content.find(".warningPage"));
				
				// 企业精准帮扶平台
				//企业
				$('<div class="appealCenterPage modulePage"></div>').appendTo($content);
				$k.page.appealCenter = new $k.proto.AppealCenter().init($content.find(".appealCenterPage"));
				$('<div class="enterpriseInfoPage modulePage"></div>').appendTo($content);
				$k.page.enterpriseInfo = new $k.proto.EnterpriseInfo().init($content.find(".enterpriseInfoPage"));
				//政府
				$('<div class="appealCenterGVPage modulePage"></div>').appendTo($content);  
				$k.page.appealCenterGV = new $k.proto.AppealCenterGV().init($content.find(".appealCenterGVPage"));
				$('<div class="enterpriseInfoGVPage modulePage"></div>').appendTo($content);
				$k.page.enterpriseInfoGV = new $k.proto.EnterpriseInfoGV().init($content.find(".enterpriseInfoGVPage"));
				//派单员诉求中心
				$('<div class="appealCenterDispatcherPage modulePage"></div>').appendTo($content);
				$k.page.appealCenterDispatcher = new $k.proto.AppealCenterDispatcher().init($content.find(".appealCenterDispatcherPage"));
				//挂点人
				$('<div class="appealCenterPointPage modulePage"></div>').appendTo($content);  
				$k.page.appealCenterPoint = new $k.proto.AppealCenterPoint().init($content.find(".appealCenterPointPage"));
				
				$('<div class="dynamicPage modulePage"></div>').appendTo($content);
				$k.page.dynamic = new $k.proto.Dynamic().init($content.find(".dynamicPage"));
				
				//  招工平台
				$('<div class="jobplatformPage modulePage"></div>').appendTo($content);
				$k.page.jobplatform = new $k.proto.Jobplatform().init($content.find(".jobplatformPage"));
				//网上申报
				$('<div class="declareEPPage modulePage"></div>').appendTo($content);
				$k.page.declareEP = new $k.proto.DeclareEP().init($content.find(".declareEPPage"));
				$('<div class="declareGVPage modulePage"></div>').appendTo($content);
				$k.page.declareGV = new $k.proto.DeclareGV().init($content.find(".declareGVPage"));
				
				// 个人中心
				$('<div class="personalInfoPage modulePage"></div>').appendTo($content);
				$k.page.personalInfo = new $k.proto.PersonalInfo().init($content.find(".personalInfoPage"));
				
				//全市上报
				$('<div class="reportIndustryAdditionPage modulePage"></div>').appendTo($content);
				$k.page.reportIndustryAddition = new $k.proto.IndustryAddition().init($content.find(".reportIndustryAdditionPage"), true);
				$('<div class="reportMainBusinessPage modulePage"></div>').appendTo($content);
				$k.page.reportMainBusiness = new $k.proto.MainBusiness().init($content.find(".reportMainBusinessPage"), true);
				$('<div class="reportProfitTaxPage modulePage"></div>').appendTo($content);
				$k.page.reportProfitTax = new $k.proto.ProfitTax().init($content.find(".reportProfitTaxPage"), true);
				$('<div class="reportProfitPage modulePage"></div>').appendTo($content);
				$k.page.reportProfit = new $k.proto.Profit().init($content.find(".reportProfitPage"), true);
				$('<div class="reportElectricityPage modulePage"></div>').appendTo($content);
				$k.page.reportElectricity = new $k.proto.Electricity().init($content.find(".reportElectricityPage"), true);
				$('<div class="reportIndustryOutputPage modulePage"></div>').appendTo($content);
				$k.page.reportIndustryOutput = new $k.proto.IndustryOutput().init($content.find(".reportIndustryOutputPage"), true);
				$('<div class="reportVatPage modulePage"></div>').appendTo($content);
				$k.page.reportVat = new $k.proto.Vat().init($content.find(".reportVatPage"), true);
				
				$('<div class="readIndustryAdditionPage modulePage"></div>').appendTo($content);
				$k.page.readIndustryAddition = new $k.proto.IndustryAddition().init($content.find(".readIndustryAdditionPage"), false);
				$('<div class="readMainBusinessPage modulePage"></div>').appendTo($content);
				$k.page.readMainBusiness = new $k.proto.MainBusiness().init($content.find(".readMainBusinessPage"), false);
				$('<div class="readProfitTaxPage modulePage"></div>').appendTo($content);
				$k.page.readProfitTax = new $k.proto.ProfitTax().init($content.find(".readProfitTaxPage"), false);
				$('<div class="readProfitPage modulePage"></div>').appendTo($content);
				$k.page.readProfit = new $k.proto.Profit().init($content.find(".readProfitPage"), false);
				$('<div class="readElectricityPage modulePage"></div>').appendTo($content);
				$k.page.readElectricity = new $k.proto.Electricity().init($content.find(".readElectricityPage"), false);
				$('<div class="readIndustryOutputPage modulePage"></div>').appendTo($content);
				$k.page.readIndustryOutput = new $k.proto.IndustryOutput().init($content.find(".readIndustryOutputPage"), false);
				$('<div class="readVatPage modulePage"></div>').appendTo($content);
				$k.page.readVat = new $k.proto.Vat().init($content.find(".readVatPage"), false);
				
				$k.page.personalInfo.draw().load();
			}
			
		})(jQuery);
	</script>
</body>
</html>