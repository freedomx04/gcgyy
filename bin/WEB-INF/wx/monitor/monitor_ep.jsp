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

<body class="wx-monitor" style="background-color: #f8f8f8; padding: 0; margin: 0;">
	<div style="width: 100%;">
		<div class="weui_cell" id="select-div">
			<div class="weui_cell_hd"><label for="" class="weui_label select-label"></label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <select class="weui_select" id="selectList" style="padding-left: 0;">
                   	<option selected="" value="0">总览</option>
                	<c:forEach var="data" items="${selectList}">
                		<option value="${data.id}">${data.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
	        
		<div class="search-wrap" style="width: 100%;">
	        <div class="weui_cell">
	            <div class="weui_cell_hd"><label for="" class="weui_label">年份:</label></div>
	            <div class="weui_cell_bd weui_cell_primary">
	                <input class="weui_input" type="text" id='monthly'/>
	            </div>
	        </div> 
	    </div>
	    
	    <div class="weui_cells_title chart-title">工业总产值图表分析</div>
		<div id="container" style="margin-top: 10px; width: 100%;"></div>
		
		<div class="weui_cells_title table-title">工业总产值数据详情</div>
		<table class="weui-table weui-border-tb monitor-table" style="margin-bottom: 30px; width: 100%;">
        </table>
	</div>
	
	
	<script class="template EconomicTarget" type="text/x-jquery-tmpl">
	<thead>
		<tr><th>月份</th><th>本月止{{=it.title}}(千元)</th><th>同比增长%</th><th>环比增长%</th></tr>
	</thead>
	<tbody>
		{{~ it.data : data : index}}
		<tr class="table-tr">
			<td style="min-width: 60px;">{{=data.monthly || ""}}</td>
			{{? it.subItem == '1'}}
				<td>{{=data.economic_current !=null ? data.economic_current.industryAddition : "-"}}</td>
				<td>{{=data.industryAddition_yearGrowth !=null ? (data.industryAddition_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.industryAddition_monthGrowth !=null ? (data.industryAddition_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '2'}}
				<td>{{=data.economic_current !=null ? data.economic_current.mainBusiness : "-"}}</td>
				<td>{{=data.mainBusiness_yearGrowth !=null ? (data.mainBusiness_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.mainBusiness_monthGrowth !=null ? (data.mainBusiness_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '3'}}
				<td>{{=data.economic_current !=null ? data.economic_current.profit : "-"}}</td>
				<td>{{=data.profit_yearGrowth !=null ? (data.profit_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.profit_monthGrowth !=null ? (data.profit_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '4'}}
				<td>{{=data.economic_current !=null ? data.economic_current.tax : "-"}}</td>
				<td>{{=data.tax_yearGrowth !=null ? (data.tax_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.tax_monthGrowth !=null ? (data.tax_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?}}
		</tr>
		{{~}}
	</tbody>
	</script>
	
	<script class="template EnergyTarget" type="text/x-jquery-tmpl">
	<thead>
		<tr>
			<th>月份</th>
			{{? it.subItem == '5'}}
			<th>本月用电量(度)</th>
			{{?? it.subItem == '6'}}
			<th>本月用气量(立方米)</th>
			{{?}}
			<th>同比增长%</th>
			<th>环比增长%</th>
		</tr>
	</thead>
	<tbody>
		{{~ it.data : data : index}}
		<tr class="table-tr">
			<td>{{=data.monthly || ""}}</td>
			{{? it.subItem == '5'}}
				<td class="am-text-primary">{{=data.energy_current != null ? data.energy_current.electricity : "-"}}</td>
				<td>{{=data.electricity_yearGrowth !=null ? (data.electricity_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.electricity_monthGrowth !=null ? (data.electricity_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '6'}}
				<td class="am-text-primary">{{=data.energy_current != null ? data.energy_current.gas : "-"}}</td>
				<td>{{=data.gas_yearGrowth !=null ? (data.gas_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.gas_monthGrowth !=null ? (data.gas_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?}}
		</tr>
		{{~}}
	</tbody>
	</script>
	
	<script class="template TaxTarget" type="text/x-jquery-tmpl">
	<thead>
		<tr>
			<th>月份</th>
			{{? it.subItem == '7'}}
			<th>本月止国税(元)</th>
			<th>同比增长%</th>
			<th>环比增长%</th>
			<th>本月止销售收入(元)</th>
			<th>同比增长%</th>
			<th>环比增长%</th>
			{{?? it.subItem == '8'}}
			<th>本月止地税(元)</th>
			<th>同比增长%</th>
			<th>环比增长%</th>
			{{?}}
		</tr>
	</thead>
	<tbody>
		{{~ it.data : data : index}}
		<tr class="table-tr">
			<td>{{=data.monthly || ""}}</td>
			{{? it.subItem == '7'}}
				<td class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.taxes : "-"}}</td>
				<td>{{=data.nationalTax_yearGrowth !=null ? (data.nationalTax_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.nationalTax_monthGrowth !=null ? (data.nationalTax_monthGrowth*100).toFixed(2) : "-"}}</td>
				<td class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.sale : "-"}}</td>
				<td>{{=data.nationalTax_yearGrowth !=null ? (data.nationalTax_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.nationalTax_monthGrowth !=null ? (data.nationalTax_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '8'}}
				<td class="am-text-primary">{{=data.localTax_current != null ? data.localTax_current.taxes : "-"}}</td>
				<td>{{=data.localTax_yearGrowth !=null ? (data.localTax_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.localTax_monthGrowth !=null ? (data.localTax_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?}}
		</tr>
		{{~}}
	</tbody>
	</script>
	
	<script class="template BenefitTarget" type="text/x-jquery-tmpl">
	<thead>
		<tr>
			<th>月份</th>
			{{? it.subItem == '9'}}
			<th>应收账款(千元)</th>
			{{?? it.subItem == '10'}}
			<th>产存品存货(千元)</th>
			{{?? it.subItem == '11'}}
			<th>资产累计(千元)</th>
			{{?? it.subItem == '12'}}
			<th>负债累计(千元)</th>
			{{?}}
			<th>同比增长%</th>
			<th>环比增长%</th>
		</tr>
	</thead>
	<tbody>
		{{~ it.data : data : index}}
		<tr class="table-tr">
			<td>{{=data.monthly || ""}}</td>
			{{? it.subItem == '9'}}
				<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.receivable : "-"}}</td>
				<td>{{=data.receivable_yearGrowth !=null ? (data.receivable_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.receivable_monthGrowth !=null ? (data.receivable_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '10'}}
				<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.inventory : "-"}}</td>
				<td>{{=data.inventory_yearGrowth !=null ? (data.inventory_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.inventory_monthGrowth !=null ? (data.inventory_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '11'}}
				<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.assets : "-"}}</td>
				<td>{{=data.assets_yearGrowth !=null ? (data.assets_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.assets_monthGrowth !=null ? (data.assets_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '12'}}
				<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.debt : "-"}}</td>
				<td>{{=data.debt_yearGrowth !=null ? (data.debt_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.debt_monthGrowth !=null ? (data.debt_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?}}
		</tr>
		{{~}}
	</tbody>
	</script>
	
	
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/utils.js"></script>
	<script type="text/javascript" src="${ctx}/js/doT/1.0.1/doT.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery/jquery-doT.js"></script>
	<script src="${ctx}/plugins/wx/picker.js"></script>
	<script type="text/javascript" src="${ctx}/js/highcharts/4.2.5/highcharts.js"></script>
	
	<script type="text/javascript">
	var type = $k.util.getRequestParam("type");
	var item = type.split('-')[0];
	var subItem = type.split('-')[1];
	var $page = $(".wx-monitor");
	$(function( $ ) {
		
		var date = new Date;
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        month = (month < 10 ? "0" + month:month);
        
		var searchTitle = "";
		
		document.title = getTargetTitle(type) + "-" + getItemTitle(type);
		$page.find(".chart-title").text(getItemTitle(type) + "图表分析");
		$page.find(".table-title").text(getItemTitle(type) + "数据详情");
		
		if (item == 0) {
			$page.find("#select-div").hide();
		} else {
			$page.find("#select-div").show();
		}
		
		switch (item) {
		case '0':	searchTitle = '企业 ';	break;
		case '1':	searchTitle = '行业';		break;
		case '2':	searchTitle = '区域';		break;
		case '3': 	searchTitle = '重点企业';	break;			
		}
		$page.find(".select-label").text(searchTitle);
		
		getData(year, month);
		
        $page.find("#monthly").val(year.toString() + "- " + month.toString());
		$("#monthly").picker({
			title:"选择年份",
			cols: [
	          {
	            textAlign: 'center',
	            values: (function () {
	                var arr = [];
	                for (var i = 1980; i <= year + 20; i++) { arr.push(i + "-"); }
	                return arr;
	            })(),
	            displayValues: (function () {
	                var arr = [];
	                for (var i = 1980; i <= year + 20; i++) { arr.push(i); }
	                return arr;
	            })()
	            
	          },
	          {
	            textAlign: 'center',
	            values:  (function () {
	                var arr = [];
	                for (var i = 1; i <= 12; i++) { arr.push(i < 10 ? '0' + i : i); }
	                return arr;
	            })(),
	          }
	        ],
	        onClose: function(result) {
	        	getData(result.displayValue[0], result.displayValue[1]);
	        }
		});
		
		
		$page.on("change", "#selectList",function() {
			var monthly = $page.find("#monthly").val().replace(" ", "");
			getData(monthly.split("-")[0], monthly.split("-")[1]);
		});
		
		function getItemTitle(type) {
			var title;
			switch (type.split('-')[1]) {
			case '1':	title = subItemTitle = '工业总产值';		break;
			case '2':	title = subItemTitle = '主营业务收入';		break;
			case '3':	title = subItemTitle = '利润总额';			break;
			case '4':	title = subItemTitle = '税金总额';			break;
			case '5':	title = subItemTitle = '用电量';			break;
			case '6':	title = subItemTitle = '用气量';			break;
			case '7':	title = subItemTitle = '国税';			break;
			case '8':	title = subItemTitle = '地税';			break;
			case '9':	title = subItemTitle = '应收账款';			break;
			case '10':	title = subItemTitle = '产存品存货';		break;
			case '11':	title = subItemTitle = '资产累计';			break;
			case '12':	title = subItemTitle = '负债累计';			break;
			}
			return title;
		}
		
		function getTargetTitle(type) {
			var title;
			switch (type.split('-')[0]) {
			case '0':	 title = '企业主要指标 ';		break;
			case '1':		 title = '行业主要指标';		break;
			case '2':			 title = '区域主要指标';		break;
			case '3':title = '重点企业主要指标';	break;			
			}
			return title;
		}
		
		function getData(year, month) {
			var id = $page.find("#selectList").val();
			var end_month = parseInt(month) + 1;
			var monthlyStart = (parseInt(year) - 1) + "-" + (end_month < 10 ? "0" + end_month : end_month);
			var monthlyEnd = year + "-" + month;
			var url, data, $template;
			
			var overViewData = {
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			var enterpriseData = {
				enterpriseId: parseInt("${enterprise.id}"),
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			var productTypeData = {
				productTypeId: id,
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			var areaData = {
				areaId: id,
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			
			if (id == '0') // 总览
			{
				switch (subItem) {
				case '1':case '2':case '3':case '4':
					data = overViewData;
					$template = $(".template.EconomicTarget");
					
					switch (item) {
					case '0':case '1':case '2':
						url = '${ctx}/economic/listRange';
						break;
					case '3':
						url = '${ctx}/economic/listPointEnterpriseRange';
						break;
					}
					break;
				case '5':case '6':
					data = overViewData;
					$template = $(".template.EnergyTarget");
					
					switch (item) {
					case '0':case '1':case '2':
						url = '${ctx}/energy/listRange';
						break;
					case '3':
						url = '${ctx}/energy/listPointEnterpriseRange';
						break;
					}
					break;
				case '7':
					data = overViewData;
					$template = $(".template.TaxTarget");
					
					switch (item) {
					case '0':case '1':case '2':
						url = '${ctx}/nationalTax/listRange';
						break;
					case '3':
						url = '${ctx}/nationalTax/listPointEnterpriseRange';
						break;
					}
					break;
				case '8':
					data = overViewData;
					$template = $(".template.TaxTarget");
					
					switch (item) {
					case '0':case '1':case '2':
						url = '${ctx}/localTax/listRange';
						break;
					case '3':
						url = '${ctx}/localTax/listPointEnterpriseRange';
						break;
					}
					break;
				case '9':case '10':case '11':case '12':
					data = overViewData;
					$template = $(".template.BenefitTarget");
					
					switch (item) {
					case '0':case '1':case '2':
						url = '${ctx}/benefit/listRange';
						break;
					case '3':
						url = '${ctx}/benefit/listPointEnterpriseRange';
						break;
					break;
					}
				}
			}
			else 
			{
				switch (subItem) {
				case '1':case '2':case '3':case '4':
					$template = $(".template.EconomicTarget");
					switch (item) {
					case '0':case '3':
						data = enterpriseData;
						url = '${ctx}/economic/listByEnterpriseIdRange';
						break;
					case '1':
						url = '${ctx}/economic/listByProductTypeIdRange';
						data = productTypeData;
						break;
					case '2':
						url = '${ctx}/economic/listByAreaIdRange';
						data = areaData;
						break;
					}
					break;
				case '5':case '6':
					$template = $(".template.EnergyTarget");
					switch (item) {
					case '0':case '3':
						url = '${ctx}/energy/listByEnterpriseIdRange';
						data = enterpriseData;
						break;
					case '1':
						url = '${ctx}/energy/listByProductTypeIdRange';
						data = productTypeData;
						break;
					case '2':
						url = '${ctx}/energy/listByAreaIdRange';
						data = areaData;
						break;
					}
					break;
				case '7':
					$template = $(".template.TaxTarget");
					switch (item) {
					case '0':case '3':
						url = '${ctx}/nationalTax/listByEnterpriseIdRange';
						data = enterpriseData;
						break;
					case '1':
						url = '${ctx}/nationalTax/listByProductTypeIdRange';
						data = productTypeData;
						break;
					case '2':
						url = '${ctx}/nationalTax/listByAreaIdRange';
						data = areaData;
						break;
					}
					break;
				case '8':
					$template = $(".template.TaxTarget");
					switch (item) {
					case '0':case '1':
						url = '${ctx}/localTax/listByEnterpriseIdRange';
						data = enterpriseData;
						break;
					case '2':
						url = '${ctx}/localTax/listByProductTypeIdRange';
						data = productTypeData;
						break;
					case '3':
						url = '${ctx}/localTax/listByAreaIdRange';
						data = areaData;
						break;
					}
					break;
				case '9':case '10':case '11':case '12':
					$template = $(".template.BenefitTarget");
					switch (item) {
					case '0': case '3':
						url = '${ctx}/benefit/listByEnterpriseIdRange';
						data = enterpriseData;
						break;
					case '1':
						url = '${ctx}/benefit/listByProductTypeIdRange';
						data = productTypeData;
						break;
					case '2':
						url = '${ctx}/benefit/listByAreaIdRange';
						data = areaData;
						break;
					}
					break;
				}
			}
			
			$.ajax({
				url: url,
				type: 'POST',
				data: data,
				success: function(data) {
					$page.find(".monitor-table").html(
							$template.doT({
								title: getItemTitle(type),
								subItem: subItem,
								data: data.data, 
							})
					);
					getChart(data.data, $page.find("#container"));
				},
				error: function(err) {}
			});
			
		}
	});
	function getChart(data, $obj) {
		$obj.html("");
		if(subItem == "7") {
			getNationalTaxChart(data, $obj);
			return;
		}
		var xAxisArr = [];
		var arr1 = [];
		var arr2 = [];
		var arr3 = [];
		var text1 = "";
		var unit = "";
		$.each(data, function(key, val) {
			xAxisArr.push(val.monthly);
			if(subItem == "1") {
				text1 = "本月止工业总产值";
				unit = "千元";
				var industryAddition = val.economic_current != null ? val.economic_current.industryAddition : 0;
				var industryAddition_yearGrowth = val.industryAddition_yearGrowth != null && val.industryAddition_yearGrowth != "" ? (parseFloat(val.industryAddition_yearGrowth)*100).toFixed(2) : 0;
				var industryAddition_monthGrowth = val.industryAddition_monthGrowth != null && val.industryAddition_monthGrowth != "" ? (parseFloat(val.industryAddition_monthGrowth)*100).toFixed(2) : 0;
				arr1.push({y: industryAddition, extra: val.economic_current==null ? "-" : industryAddition + "千元"});
				arr2.push({y: parseFloat(industryAddition_yearGrowth), extra: val.industryAddition_yearGrowth==null ? "-" : industryAddition_yearGrowth});
				arr3.push({y: parseFloat(industryAddition_monthGrowth), extra: val.industryAddition_monthGrowth==null ? "-" : industryAddition_monthGrowth});
			} else if(subItem == "2") {
				text1 = "本月止主营业务收入";
				unit = "千元";
				var mainBusiness = val.economic_current != null ? val.economic_current.mainBusiness : 0;
				var mainBusiness_yearGrowth = val.mainBusiness_yearGrowth != null && val.mainBusiness_yearGrowth != "" ? (parseFloat(val.mainBusiness_yearGrowth)*100).toFixed(2) : 0;
				var mainBusiness_monthGrowth = val.mainBusiness_monthGrowth != null && val.mainBusiness_monthGrowth != "" ? (parseFloat(val.mainBusiness_monthGrowth)*100).toFixed(2) : 0;
				arr1.push({y: mainBusiness, extra: val.economic_current==null ? "-" : mainBusiness + "千元"});
				arr2.push({y: parseFloat(mainBusiness_yearGrowth), extra: val.mainBusiness_yearGrowth==null ? "-" : mainBusiness_yearGrowth});
				arr3.push({y: parseFloat(mainBusiness_monthGrowth), extra: val.mainBusiness_monthGrowth==null ? "-" : mainBusiness_monthGrowth});
			} else if(subItem == "3") {
				text1 = "本月止利润总额";
				unit = "千元";
				var profit = val.economic_current != null ? val.economic_current.profit : 0;
				var profit_yearGrowth = val.profit_yearGrowth != null && val.profit_yearGrowth != "" ? (parseFloat(val.profit_yearGrowth)*100).toFixed(2) : 0;
				var profit_monthGrowth = val.profit_monthGrowth != null && val.profit_monthGrowth != "" ? (parseFloat(val.profit_monthGrowth)*100).toFixed(2) : 0;
				arr1.push({y: profit, extra: val.economic_current==null ? "-" : profit + "千元"});
				arr2.push({y: parseFloat(profit_yearGrowth), extra: val.profit_yearGrowth==null ? "-" : profit_yearGrowth});
				arr3.push({y: parseFloat(profit_monthGrowth), extra: val.profit_monthGrowth==null ? "-" : profit_monthGrowth});
			} else if(subItem == "4") {
				text1 = "本月止税金总额";
				unit = "千元";
				var tax = val.economic_current != null ? val.economic_current.tax : 0;
				var tax_yearGrowth = val.tax_yearGrowth != null && val.tax_yearGrowth != "" ? (parseFloat(val.tax_yearGrowth)*100).toFixed(2) : 0;
				var tax_monthGrowth = val.tax_monthGrowth != null && val.tax_monthGrowth != "" ? (parseFloat(val.tax_monthGrowth)*100).toFixed(2) : 0;
				arr1.push({y: tax, extra: val.economic_current==null ? "-" : tax + "千元"});
				arr2.push({y: parseFloat(tax_yearGrowth), extra: val.tax_yearGrowth==null ? "-" : tax_yearGrowth});
				arr3.push({y: parseFloat(tax_monthGrowth), extra: val.tax_monthGrowth==null ? "-" : tax_monthGrowth});
			} else if(subItem == "5") {
				text1 = "本月用电量";
				unit = "度";
				var electricity = val.energy_current != null ? parseFloat(val.energy_current.electricity) : 0;
				var electricity_yearGrowth = val.electricity_yearGrowth != null ? (parseFloat(val.electricity_yearGrowth)*100).toFixed(2) : 0; 
				var electricity_monthGrowth = val.electricity_monthGrowth != null ? (parseFloat(val.electricity_monthGrowth)*100).toFixed(2) : 0; 
				arr1.push({y: electricity, extra: val.energy_current == null ? "-" :  electricity+ unit});
				arr2.push({y: parseFloat(electricity_yearGrowth), extra: val.electricity_yearGrowth == null ? "-" : parseFloat(electricity_yearGrowth)});
				arr3.push({y: parseFloat(electricity_monthGrowth), extra: val.electricity_monthGrowth == null ? "-" : parseFloat(electricity_monthGrowth)});
			} else if(subItem == "6") {
				text1 = "本月用气量";
				unit = "立方米";
				var gas = val.energy_current != null ? parseFloat(val.energy_current.gas) : 0;
				var gas_yearGrowth = val.gas_yearGrowth != null ? (parseFloat(val.gas_yearGrowth)*100).toFixed(2) : 0; 
				var gas_monthGrowth = val.gas_monthGrowth != null ? (parseFloat(val.gas_monthGrowth)*100).toFixed(2) : 0; 
				arr1.push({y: gas, extra: val.energy_current == null ? "-" : gas + unit});
				arr2.push({y: parseFloat(gas_yearGrowth), extra: val.gas_yearGrowth == null ? "-" : parseFloat(gas_yearGrowth)});
				arr3.push({y: parseFloat(gas_monthGrowth), extra: val.gas_monthGrowth == null ? "-" : parseFloat(gas_monthGrowth)});
			} else if(subItem == "8") {
				text1 = "本月止地税";
				unit = "元";
				var localTax = val.localTax_current != null ? parseFloat(val.localTax_current.taxes) : 0;
				var localTax_yearGrowth = val.localTax_yearGrowth != null ? (parseFloat(val.localTax_yearGrowth)*100).toFixed(2) : 0; 
				var localTax_monthGrowth = val.localTax_monthGrowth != null ? (parseFloat(val.localTax_monthGrowth)*100).toFixed(2) : 0; 
				arr1.push({y: localTax, extra: val.localTax_current == null ? "-" : localTax + unit});
				arr2.push({y: parseFloat(localTax_yearGrowth), extra: val.localTax_yearGrowth == null ? "-" : parseFloat(localTax_yearGrowth)});
				arr3.push({y: parseFloat(localTax_monthGrowth), extra: val.localTax_monthGrowth == null ? "-" : parseFloat(localTax_monthGrowth)});
			} else if(subItem == "9") {
				text1 = "应收账款";
				unit = "千元";
				var receivable = val.benefit_current != null ? val.benefit_current.receivable : 0;
				var receivable_yearGrowth = val.receivable_yearGrowth != null ? (parseFloat(val.receivable_yearGrowth)*100).toFixed(2) : 0; 
				var receivable_monthGrowth = val.receivable_monthGrowth != null ? (parseFloat(val.receivable_monthGrowth)*100).toFixed(2) : 0; 
				arr1.push({y: receivable, extra: val.benefit_current == null ? "-" : receivable + unit});
				arr2.push({y: parseFloat(receivable_yearGrowth), extra: val.receivable_yearGrowth == null ? "-" : parseFloat(receivable_yearGrowth)});
				arr3.push({y: parseFloat(receivable_monthGrowth), extra: val.receivable_monthGrowth == null ? "-" : parseFloat(receivable_monthGrowth)});
			} else if(subItem == "10") {
				text1 = "产存品存货";
				unit = "千元";
				var inventory = val.benefit_current != null ? val.benefit_current.inventory : 0;
				var inventory_yearGrowth = val.inventory_yearGrowth != null ? (parseFloat(val.inventory_yearGrowth)*100).toFixed(2) : 0; 
				var inventory_monthGrowth = val.inventory_monthGrowth != null ? (parseFloat(val.inventory_monthGrowth)*100).toFixed(2) : 0; 
				arr1.push({y: inventory, extra: val.benefit_current == null ? "-" : inventory + unit});
				arr2.push({y: parseFloat(inventory_yearGrowth), extra: val.inventory_yearGrowth == null ? "-" : parseFloat(inventory_yearGrowth)});
				arr3.push({y: parseFloat(inventory_monthGrowth), extra: val.inventory_monthGrowth == null ? "-" : parseFloat(inventory_monthGrowth)});
			} else if(subItem == "11") {
				text1 = "资产累计";
				unit = "千元";
				var assets = val.benefit_current != null ? val.benefit_current.assets : 0;
				var assets_yearGrowth = val.assets_yearGrowth != null ? (parseFloat(val.assets_yearGrowth)*100).toFixed(2) : 0; 
				var assets_monthGrowth = val.assets_monthGrowth != null ? (parseFloat(val.assets_monthGrowth)*100).toFixed(2) : 0; 
				arr1.push({y: assets, extra: val.benefit_current == null ? "-" : assets + unit});
				arr2.push({y: parseFloat(assets_yearGrowth), extra: val.assets_yearGrowth == null ? "-" : parseFloat(assets_yearGrowth)});
				arr3.push({y: parseFloat(assets_monthGrowth), extra: val.assets_monthGrowth == null ? "-" : parseFloat(assets_monthGrowth)});
			} else if(subItem == "12") {
				text1 = "负债累计";
				unit = "千元";
				var debt = val.benefit_current != null ? val.benefit_current.debt : 0;
				var debt_yearGrowth = val.debt_yearGrowth != null ? (parseFloat(val.debt_yearGrowth)*100).toFixed(2) : 0; 
				var debt_monthGrowth = val.debt_monthGrowth != null ? (parseFloat(val.debt_monthGrowth)*100).toFixed(2) : 0; 
				arr1.push({y: debt, extra: val.benefit_current == null ? "-" : debt + unit});
				arr2.push({y: parseFloat(debt_yearGrowth), extra: val.debt_yearGrowth == null ? "-" : parseFloat(debt_yearGrowth)});
				arr3.push({y: parseFloat(debt_monthGrowth), extra: val.debt_monthGrowth == null ? "-" : parseFloat(debt_monthGrowth)});
			}
        });
		$obj.highcharts({
			chart: { zoomType: 'x' }, 
			credits: { enabled: false }, 
			title: { text: '' },
			xAxis: [{ 
				categories: xAxisArr
			}], 
			yAxis: [{ // Primary yAxis
	            labels: {
	                formatter: function() {
	                    return this.value +'%';
	                },
	            },
	            title: {
	                text: '',
	            },
	            opposite: true

	        },{ 
	            title: {
	                text: unit,
	            },
	            labels: {
	                formatter: function() {
	                    return this.value;
	                },
	            }

	        }], 
			tooltip: { shared: true }, 
			series: [{ 
				name: text1, 
				color: '#4572A7', 
				type: 'column', 
				data: arr1,
				yAxis: 1,
				tooltip: { 
					valueSuffix: ' '+unit,
					pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
				}
			},
			{ 
				name: "同比增长%", 
				color: '#3bb4f2', 
				type: 'spline', 
				data: arr2,
				tooltip: { 
					valueSuffix: ' %',
					pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
				} 
			},
			{ 
			    name: '环比增长%', 
			    color: '#F7A35C', 
			    type: 'spline', 
			    data: arr3, 
			    tooltip: { 
			    	valueSuffix: '%', 
			    	pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
			    } 
			}] 
		});
	}
	
	function getNationalTaxChart(data, $obj) {
		var xAxisArr = [];
		var arr1 = [];
		var arr2 = [];
		var arr3 = [];
		var arr4 = [];
		var arr5 = [];
		var arr6 = [];
		var text1 = "";
		var text2 = "";
		var unit = "";
		$.each(data, function(key, val) {
			xAxisArr.push(val.monthly);
			text1 = "本月止国税";
			text2 = "本月止销售收入";
			var taxes = val.nationalTax_current != null ? parseFloat(val.nationalTax_current.taxes) : 0;
			var nationalTax_yearGrowth = val.nationalTax_yearGrowth != null && val.nationalTax_yearGrowth != "" ? (parseFloat(val.nationalTax_yearGrowth)*100).toFixed(2) : 0;
			var nationalTax_monthGrowth = val.nationalTax_monthGrowth != null && val.nationalTax_monthGrowth != "" ? (parseFloat(val.nationalTax_monthGrowth)*100).toFixed(2) : 0;
			arr1.push({y: taxes, extra: val.nationalTax_current==null ? "-" : taxes + "元"});
			arr2.push({y: parseFloat(nationalTax_yearGrowth), extra: val.nationalTax_yearGrowth==null ? "-" : nationalTax_yearGrowth});
			arr3.push({y: parseFloat(nationalTax_monthGrowth), extra: val.nationalTax_monthGrowth==null ? "-" : nationalTax_monthGrowth});
			
			var sale = val.nationalTax_current != null ? parseFloat(val.nationalTax_current.sale) : 0;
			var sale_yearGrowth = val.sale_yearGrowth != null && val.sale_yearGrowth != "" ? (parseFloat(val.sale_yearGrowth)*100).toFixed(2) : 0;
			var sale_monthGrowth = val.sale_monthGrowth != null && val.sale_monthGrowth != "" ? (parseFloat(val.sale_monthGrowth)*100).toFixed(2) : 0;
			arr4.push({y: sale, extra: val.nationalTax_current==null ? "-" : sale + "元"});
			arr5.push({y: parseFloat(sale_yearGrowth), extra: val.sale_yearGrowth==null ? "-" : sale_yearGrowth});
			arr6.push({y: parseFloat(sale_monthGrowth), extra: val.sale_monthGrowth==null ? "-" : sale_monthGrowth});
        });
		$obj.highcharts({
			chart: { zoomType: 'xy' }, 
			credits: { enabled: false }, 
			title: { text: '' },
			xAxis: [{ 
				categories: xAxisArr
			}], 
			yAxis: [{ // Primary yAxis
	            labels: {
	                formatter: function() {
	                    return this.value +'%';
	                },
	            },
	            title: {
	                text: '',
	            },
	            opposite: true

	        },{ 
	            title: {
	                text: '元',
	            },
	            labels: {
	                formatter: function() {
	                    return this.value;
	                },
	            }

	        }], 
			tooltip: { shared: true }, 
			series: [{ 
				name: text1, 
				color: '#4572A7', 
				type: 'column', 
				data: arr1,
				yAxis: 1,
				tooltip: { 
					valueSuffix: ' 元',
					pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
				}
			},
			{ 
				name: "税收同比增长%", 
				color: '#3bb4f2', 
				type: 'spline', 
				data: arr2,
				tooltip: { 
					valueSuffix: ' %',
					pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
				} 
			},
			{ 
			    name: '税收环比增长%', 
			    color: '#F7A35C', 
			    type: 'spline', 
			    data: arr3, 
			    tooltip: { 
			    	valueSuffix: '%', 
			    	pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
			    }
			},
			{ 
				name: text2, 
				color: '#4572A7', 
				type: 'column', 
				data: arr4,
				yAxis: 1,
				tooltip: { 
					valueSuffix: ' 元',
					pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
				}
			},
			{ 
				name: "销售收入同比增长%", 
				color: '#3bb4f2', 
				type: 'spline', 
				data: arr5,
				tooltip: { 
					valueSuffix: ' %',
					pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
				} 
			},
			{ 
			    name: '销售收入环比增长%', 
			    color: '#F7A35C', 
			    type: 'spline', 
			    data: arr6, 
			    tooltip: { 
			    	valueSuffix: '%', 
			    	pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
			    } 
			}] 
		});
	}
	</script>

</body>

</html>