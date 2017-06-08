<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
.target select {
	height: 2.6rem;
	width: 200px;
}
</style>

<script class="template Target" type="text/x-jquery-tmpl">
<div class="admin-content target" style="height: auto!important;">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">{{=it.title}}</strong></div>
	</div>

	<div class="am-g">
		<div class="am-u-sm-12">
			<div class="padding-horizontal-o" style="height: 50px;">
				<select class="selectList am-align-left" data-am-selected="{btnSize: 'sm', searchBox: 1}" >
				{{? it.item == 'enterpriseTarget'}}
					<option value="0" selected>企业总览</option>
					{{~ it.enterpriseData: enterprise}}	
						<option value="{{=enterprise.id}}">{{=enterprise.name}}</option>
					{{~}}
				{{?? it.item == 'businessTarget'}}
					<option value="0" selected>行业总览</option>
					{{~ it.businessData: business}}	
						<option value="{{=business.id}}">{{=business.name}}</option>
					{{~}}
				{{?? it.item == 'areaTarget'}}
					<option value="0" selected>区域总览</option>
					{{~ it.areaData: area}}	
						<option value="{{=area.id}}">{{=area.name}}</option>
					{{~}}
				{{?? it.item == 'pointEnterpriseTarget'}}
					<option value="0" selected>重点企业总览</option>
					{{~ it.pointEnterpriseData: enterprise}}	
						<option value="{{=enterprise.id}}">{{=enterprise.name}}</option>
					{{~}}
				{{?}}
				</select>

				<input id="monthlyStart" type="text" class="am-form-field am-align-left datetimepicker monthly" style="height: 30px; line-height: 16px;width: 150px;" placeholder="请选择年月"/>
				<label class="am-form-label am-text-sm am-align-left" style="line-height: 2.8rem;">到</label>
				<input id="monthlyEnd" type="text" class="am-form-field am-align-left datetimepicker monthly" style="height: 30px; line-height: 16px;width: 150px;" placeholder="请选择年月"/>

				<button type="button" class="am-btn am-radius am-btn-default am-btn-sm search">查询</button>
			</div>			
		</div>

		<div class="am-g">
			<div class="sk-three-bounce">
				<div class="sk-child sk-bounce1"></div>
				<div class="sk-child sk-bounce2"></div>
				<div class="sk-child sk-bounce3"></div>
			</div>
			<div class="am-u-sm-12 target-panel">
			</div>
		</div>

	</div>
</div>
</script>

<script class="template EconomicTarget" type="text/x-jquery-tmpl">
	<div class="am-panel am-panel-primary" style="margin: 0 20px 20px 20px;">
  		<div class="am-panel-hd">{{=it.title}}图表分析</div>
 		<div class="am-panel-bd" id="economic-chart-container">
  		</div>
	</div>

	<div class="am-panel am-panel-primary" style="margin: 0 20px 20px 20px;">
  		<div class="am-panel-hd">{{=it.title}}数据详情</div>
 		<div class="am-panel-bd">
  			<table class="am-table am-table-striped am-table-hover table-main" id="economicTarget-table">
				<thead>
					<tr>
						<th class="table-id">#</th>
						<th>月份</th>
						<th>本月止{{=it.title}}(千元)</th>
						<th>同比增长%</th>
						<th>环比增长%</th>
					</tr>
				</thead>
				<tbody>
					{{~ it.data : data : index}}
					<tr class="table-tr">
						<td>{{=index+1}}</td>
						<td class="">{{=data.monthly || ""}}</td>
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
			</table>
  		</div>
	</div>
</script>

<script class="template EnergyTarget" type="text/x-jquery-tmpl">
	<div class="am-panel am-panel-primary" style="margin: 0 20px 20px 20px;">
  		<div class="am-panel-hd">{{=it.title}}图表分析</div>
 		<div class="am-panel-bd" id="energy-chart-container">
  		</div>
	</div>

	<div class="am-panel am-panel-primary" style="margin: 0 20px 20px 20px;">
  		<div class="am-panel-hd">{{=it.title}}数据详情</div>
 		<div class="am-panel-bd">
  			<table class="am-table am-table-striped am-table-hover table-main" id="energyTarget-table">
				<thead>
					<tr>
						<th class="table-id">#</th>
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
						<td>{{=index+1}}</td>
						<td class="">{{=data.monthly || ""}}</td>
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
			</table>
  		</div>
	</div>
</script>

<script class="template TaxTarget" type="text/x-jquery-tmpl">
	<div class="am-panel am-panel-primary" style="margin: 0 20px 20px 20px;">
  		<div class="am-panel-hd">{{=it.title}}图表分析</div>
 		<div class="am-panel-bd" id="tax-chart-container">
  		</div>
	</div>

	<div class="am-panel am-panel-primary" style="margin: 0 20px 20px 20px;">
  		<div class="am-panel-hd">{{=it.title}}数据详情</div>
 		<div class="am-panel-bd">
  			<table class="am-table am-table-striped am-table-hover table-main" id="taxTarget-table">
				<thead>
					<tr>
						<th class="table-id">#</th>
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
						<td>{{=index+1}}</td>
						<td class="">{{=data.monthly || ""}}</td>
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
			</table>
  		</div>
	</div>
</script>

<script class="template BenefitTarget" type="text/x-jquery-tmpl">
	<div class="am-panel am-panel-primary" style="margin: 0 20px 20px 20px;">
  		<div class="am-panel-hd">{{=it.title}}图表分析</div>
 		<div class="am-panel-bd" id="benefit-chart-container">
  		</div>
	</div>

	<div class="am-panel am-panel-primary" style="margin: 0 20px 20px 20px;">
  		<div class="am-panel-hd">{{=it.title}}数据详情</div>
 		<div class="am-panel-bd">
  			<table class="am-table am-table-striped am-table-hover table-main" id="benefitTarget-table">
				<thead>
					<tr>
						<th class="table-id">#</th>
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
						<td>{{=index+1}}</td>
						<td class="">{{=data.monthly || ""}}</td>
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
			</table>
  		</div>
	</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Target";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on('click', '.search', function() {
					self.reload();
				});
				return self;
			}
		},
		draw: {
			value: function(type) {
				var self = this;
				self.type = type;
				
				switch (self.getItem(type)) {
				case 'enterpriseTarget':
					$k.util.getEnterpriseList({
						success: function(data) {
							self.$tar.html(self.$tempTar.doT({
								title: self.getNavTitle(type),
								enterpriseData: data.data,
								item: self.getItem(type)
							}));
							self.initTime();
							self.reload();
						}
					});
					break;
				case 'businessTarget':
					$k.util.getProductTypeList({
						success: function(data) {
							self.$tar.html(self.$tempTar.doT({
								title: self.getNavTitle(type),
								businessData: data.data,
								item: self.getItem(type)
							}));
							self.initTime();
							self.reload();
						}
					});
					break;
				case 'areaTarget':
					$k.util.getAreaList({
						success: function(data) {
							self.$tar.html(self.$tempTar.doT({
								title: self.getNavTitle(type),
								areaData: data.data,
								item: self.getItem(type)
							}));
							self.initTime();
							self.reload();
						}
					});
					break;
				case 'pointEnterpriseTarget':
					$k.util.getPointEnterpriseList({
						success: function(data) {
							self.$tar.html(self.$tempTar.doT({
								title: self.getNavTitle(type),
								pointEnterpriseData: data.data,
								item: self.getItem(type)
							}));
							self.initTime();
							self.reload();
						}
					});
					break;
				}
				
				
				return self;
			}
		},
		initTime: {
			value: function() {
				var self = this;
				
				var now = new Date();
				// start time
				$k.util.datePicker(self.$tar.find("#monthlyStart"));
				now.setYear(now.getFullYear() - 1);
				self.$tar.find("#monthlyStart").val(now.format("yyyy-mm"));
				// end time 
				$k.util.datePicker(self.$tar.find("#monthlyEnd"));
				now.setDate(1);
				now.setMonth(now.getMonth() - 1);
				now.setYear(now.getFullYear() + 1);
				self.$tar.find("#monthlyEnd").val(now.format("yyyy-mm"));
				
				return self;
			}
		},
		reload: {
			value: function() {
				var self = this;
				if (self.table) {
					self.table.fnDestroy();
				}
				self.$tar.find(".target-panel").html("");
				self.$tar.find(".sk-three-bounce").show();
				var id = self.$tar.find(".selectList").val();
				var monthlyStart = self.$tar.find("#monthlyStart").val();
				var monthlyEnd = self.$tar.find("#monthlyEnd").val();
				
				var item = self.getItem(self.type);
				var subItem = self.getSubItem(self.type);
				
				var url, data;
				var $template, chart, table;
				
				var overViewData = {
					monthlyStart: monthlyStart,
					monthlyEnd: monthlyEnd
				};
				var enterpriseData = {
					enterpriseId: id,
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
						table = "#economicTarget-table";
						chart = "#economic-chart-container";
						switch (item) {
						case 'enterpriseTarget':case 'businessTarget':case 'areaTarget':
							url = 'economic/listRange';
							break;
						case 'pointEnterpriseTarget':
							url = 'economic/listPointEnterpriseRange';
							break;
						}
						break;
					case '5':case '6':
						data = overViewData;
						$template = $(".template.EnergyTarget");
						table = "#energyTarget-table";
						chart = "#energy-chart-container";
						switch (item) {
						case 'enterpriseTarget':case 'businessTarget':case 'areaTarget':
							url = 'energy/listRange';
							break;
						case 'pointEnterpriseTarget':
							url = 'energy/listPointEnterpriseRange';
							break;
						}
						break;
					case '7':
						data = overViewData;
						$template = $(".template.TaxTarget");
						table = "#taxTarget-table";
						chart = "#tax-chart-container";
						switch (item) {
						case 'enterpriseTarget':case 'businessTarget':case 'areaTarget':
							url = 'nationalTax/listRange';
							break;
						case 'pointEnterpriseTarget':
							url = 'nationalTax/listPointEnterpriseRange';
							break;
						}
						break;
					case '8':
						data = overViewData;
						$template = $(".template.TaxTarget");
						table = "#taxTarget-table";
						chart = "#tax-chart-container";
						switch (item) {
						case 'enterpriseTarget':case 'businessTarget':case 'areaTarget':
							url = 'localTax/listRange';
							break;
						case 'pointEnterpriseTarget':
							url = 'localTax/listPointEnterpriseRange';
							break;
						}
						break;
					case '9':case '10':case '11':case '12':
						data = overViewData;
						$template = $(".template.BenefitTarget");
						table = "#benefitTarget-table";
						chart = "#benefit-chart-container";
						switch (item) {
						case 'enterpriseTarget':case 'businessTarget':case 'areaTarget':
							url = 'benefit/listRange';
							break;
						case 'pointEnterpriseTarget':
							url = 'benefit/listPointEnterpriseRange';
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
						table = "#economicTarget-table";
						chart = "#economic-chart-container";
						switch (item) {
						case 'enterpriseTarget':case 'pointEnterpriseTarget':
							url = 'economic/listByEnterpriseIdRange';
							data = enterpriseData;
							break;
						case 'businessTarget':
							url = 'economic/listByProductTypeIdRange';
							data = productTypeData;
							break;
						case 'areaTarget':
							url = 'economic/listByAreaIdRange';
							data = areaData;
							break;
						}
						break;
					case '5':case '6':
						$template = $(".template.EnergyTarget");
						table = "#energyTarget-table";
						chart = "#energy-chart-container";
						switch (item) {
						case 'enterpriseTarget':case 'pointEnterpriseTarget':
							url = 'energy/listByEnterpriseIdRange';
							data = enterpriseData;
							break;
						case 'businessTarget':
							url = 'energy/listByProductTypeIdRange';
							data = productTypeData;
							break;
						case 'areaTarget':
							url = 'energy/listByAreaIdRange';
							data = areaData;
							break;
						}
						break;
					case '7':
						$template = $(".template.TaxTarget");
						table = "#taxTarget-table";
						chart = "#tax-chart-container";
						switch (item) {
						case 'enterpriseTarget':case 'pointEnterpriseTarget':
							url = 'nationalTax/listByEnterpriseIdRange';
							data = enterpriseData;
							break;
						case 'businessTarget':
							url = 'nationalTax/listByProductTypeIdRange';
							data = productTypeData;
							break;
						case 'areaTarget':
							url = 'nationalTax/listByAreaIdRange';
							data = areaData;
							break;
						}
						break;
					case '8':
						$template = $(".template.TaxTarget");
						table = "#taxTarget-table";
						chart = "#tax-chart-container";
						switch (item) {
						case 'enterpriseTarget':case 'pointEnterpriseTarget':
							url = 'localTax/listByEnterpriseIdRange';
							data = enterpriseData;
							break;
						case 'businessTarget':
							url = 'localTax/listByProductTypeIdRange';
							data = productTypeData;
							break;
						case 'areaTarget':
							url = 'localTax/listByAreaIdRange';
							data = areaData;
							break;
						}
						break;
					case '9':case '10':case '11':case '12':
						$template = $(".template.BenefitTarget");
						table = "#benefitTarget-table";
						chart = "#benefit-chart-container";
						switch (item) {
						case 'enterpriseTarget': case 'pointEnterpriseTarget':
							url = 'benefit/listByEnterpriseIdRange';
							data = enterpriseData;
							break;
						case 'businessTarget':
							url = 'benefit/listByProductTypeIdRange';
							data = productTypeData;
							break;
						case 'areaTarget':
							url = 'benefit/listByAreaIdRange';
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
						self.$tar.find(".sk-three-bounce").hide();
						self.$tar.find(".target-panel").html(
							$template.doT({
								title: self.getItemTitle(self.type),
								subItem: self.getSubItem(self.type),
								data: data.data, 
							})
						);
						self.table = self.$tar.find(table).dataTable();
						self.getChart(subItem, data.data, self.$tar.find(chart));
					},
					error: function(err) {}
				});
				
				return self;
			}
		},
		load: {
			value: function() {
				var self = this;
				return self;
			}
		},
		getItem: {
			value: function(type) {
				return type.split('-')[0];
			}
		},
		getSubItem: {
			value: function(type) {
				return type.split('-')[1];
			}
		},
		getNavTitle: {
			value: function(type) {
				var self = this;
				return self.getTargetTitle(type) + " > " + self.getItemTitle(type);
			}
		},
		getTargetTitle: {
			value: function(type) {
				var title;
				switch (type.split('-')[0]) {
				case 'enterpriseTarget':	 title = '企业主要指标 ';		break;
				case 'businessTarget':		 title = '行业主要指标';		break;
				case 'areaTarget':			 title = '区域主要指标';		break;
				case 'pointEnterpriseTarget':title = '重点企业主要指标';	break;			
				}
				return title;
			}
		},
		getItemTitle: {
			value: function(type) {
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
		},
		getChart: {
			value: function(subItem, data, $obj) {
				var self = this;
				switch (subItem) {
				case '1':case '2':case '3':case '4':case '5':case '6':case '8':case '9':case '10':case '11':case '12':
					self.getCommonChart(data, $obj);
					break;
				case '7':
					self.getNationalTaxChart(data, $obj);
					break;
				}
			}
		},
		getCommonChart: {
			value: function(data, $obj) {
				var self = this;
				if(data == null) {
					$obj.html("没有可展示的数据");
					return;
				} else {
					$obj.html("");
				}
				
				var subItem = self.getSubItem(self.type);
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
		},
		getNationalTaxChart: {
			value: function(data, $obj) {
				var self = this;
				if(data == null) {
					$obj.html("没有可展示的数据");
					return;
				} else {
					$obj.html("");
				}
				
				var subItem = self.getSubItem(self.type);
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
		}
	});
	
})( jQuery );
</script>