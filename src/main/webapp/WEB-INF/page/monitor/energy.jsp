<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Energy" type="text/x-jquery-tmpl">
<div class="admin-content" style="height:initial!important;">
	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">能源消耗</strong></div>
	</div>
	<div class="am-g">
		<div class="am-u-sm-12">
			<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
			</div>
		</div>
		<form id="searchForm">
			<div class="am-u-sm-12 am-margin-bottom">
				{{ if(it.resource.indexOf('agency_department') > -1) { }}
				<div class="am-u-sm-2 padding-horizontal-o">
					<select class="searchType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
						<option value="1">企业明细</option>
						<option value="2">产业明细</option>
						<option value="3">园区明细</option>
					</select>
				</div>
				<div class="am-u-sm-3">
					<select class="searchTypeList" name="searchId" id="searchId" data-am-selected="{btnSize: 'xs', searchBox: 1}">
					</select>
				</div>
				{{ } }}
				<div class="am-u-sm-2 padding-horizontal-o">
					<input type="text" id="monthlyStart" name="monthlyStart" class="am-form-field datetimepicker am-input-sm monthly"  placeholder="请选择年月"/>
				</div>
				<div class="am-u-sm-1 padding-horizontal-o am-text-center" style="width: 4%;">
					<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">到</label>
				</div>
				<div class="am-u-sm-2 padding-horizontal-o">
					<input type="text" id="monthlyEnd" name="monthlyEnd" class="am-form-field datetimepicker am-input-sm monthly" placeholder="请选择年月"/>
				</div>
				<div class="am-u-sm-1 am-u-sm-offset-1 padding-horizontal-o am-text-right">
					<button type="button" class="am-btn am-btn-sm energy-search-btn">查询</button>
				</div>
			</div>
		</form>
	    <div class="am-u-sm-12">
	        <form id="energy" class="am-cf">
	         	<table class="am-table am-table-striped am-table-hover table-main" id="energy-table" style="width:100%;">
	           		<thead>
             			<tr>
	               			<th class="table-check"><input type="checkbox" class="box_all"/></th>
	               			<th class="table-id">序号</th>
							<th>月份</th>
	               			<th>用电总量（度）</th>
							<th>同比增长%</th>
							<th>环比增长%</th>
	               			<th>用气总量（立方米）</th>
	               			<th>同比增长%</th>
							<th>环比增长%</th>
             			</tr>
         			</thead>
         			<tbody></tbody>
      			</table>
	        </form>
	     </div>
		<div class="am-u-sm-12 am-margin-top">
		 	<div class="am-u-sm-4 padding-horizontal-o">
				<select class="chartType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
					<option value="1">用电量</option>
					<option value="2">用气量</option>
				</select>
		 	</div>
		</div>
		 <div id="chartContainer" class="am-margin-bottom"></div>
	 </div>
</div>
</script>


<script class="template EnergyList" type="text/x-jquery-tmpl">
{{~ it.data : data : index}}
<tr class="table-tr">
	<td><input type='checkbox' class='box' name='box'/></td>
	<td>{{=index+1}}</td>
	<td class="">{{=data.monthly}}</td>
	<td class="am-text-primary">{{=data.energy_current != null ? data.energy_current.electricity : "-"}}</td>
	<td>{{=data.electricity_yearGrowth !=null ? (data.electricity_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td>{{=data.electricity_monthGrowth !=null ? (data.electricity_monthGrowth*100).toFixed(2) : "-"}}</td>
	<td class="am-text-primary">{{=data.energy_current != null ? data.energy_current.gas : "-"}}</td>
	<td>{{=data.gas_yearGrowth !=null ? (data.gas_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td>{{=data.gas_monthGrowth !=null ? (data.gas_monthGrowth*100).toFixed(2) : "-"}}</td>
</tr>
{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "Energy";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		$tempDialogTar: {
			value: $(".template." + fnName + "Dialog")
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				
				$tar
				.on("change", ".searchType", function() {
					$tar.find(".searchTypeList").html("");
					switch(parseInt($(this).val())) {
					case 1:
						$k.util.getEnterpriseList({
							success: function(data){
								$("<option value='0'>企业总览</option>").appendTo(".searchTypeList");
								$.each(data.data, function(key, val) {
									$("<option value='"+val.id+"'>"+val.name+"</option>").appendTo(".searchTypeList");
								});
							}
						});
						break;
					case 2:
						$k.util.getProductTypeList({
							success: function(data){
								$("<option value=''>请选择</option>").appendTo(".searchTypeList");
								$.each(data.data, function(key, val) {
									$("<option value='"+val.id+"'>"+val.name+"</option>").appendTo(".searchTypeList");
								});
							}
						});
						break;
					case 3:
						$k.util.getAreaList({
							success: function(data){
								$("<option value=''>请选择</option>").appendTo(".searchTypeList");
								$.each(data.data, function(key, val) {
									$("<option value='"+val.id+"'>"+val.name+"</option>").appendTo(".searchTypeList");
								});
							}
						});
					}
				})
				.on("change", ".chartType", function() {
					$tar.find(".chartContainer").html("");
					if($(this).val() == "1") {
						self.load(1);
					} else {
						self.load(2);
					}
				})
				.on("click", ".energy-search-btn", function(e) {
					$tar.find(".chartType").find('option[value="1"]').attr('selected', true);
					var $searchForm = $tar.find("#searchForm");
					self.getValidate();
					if($searchForm.valid()){
						self.load();
					}
				})
				.on("change", "#energy-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#energy-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#energy-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				});
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				var now = new Date();
				now.setMonth(now.getMonth() - 1);
				self.$tar.html(self.$tempTar.doT({
					resource: $k.user.get().role.resource,
				}));
				$('[data-am-selected]').selected();
				self.$tar.find(".searchTypeList").html("<option value='0'>企业总览</option>");
				$k.util.getEnterpriseList({
					success: function(data){
						$.each(data.data, function(key, val) {
							$("<option value='"+val.id+"'>"+val.name+"</option>").appendTo(".searchTypeList");
						});
					}
				});
				self.datetimepicker(self.$tar.find("#monthlyStart"));
				self.datetimepicker(self.$tar.find("#monthlyEnd"));
				self.$tar.find("#monthlyStart").val(now.format("yyyy-mm"));
				self.$tar.find("#monthlyEnd").val(now.format("yyyy-mm"));
				return self;
			}
		},
		load: {
			value: function(chartType){
				var self = this;
				if(chartType != "1" && chartType != "2" && self.datatables) {
					self.$tar.find("#energy-table").find("tbody").html("");
					self.datatables.fnDestroy();
				}
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if(enterpriseData.data != null && enterpriseData.data.length != 0) {
							$.ajax({
								url: "energy/listByEnterpriseIdRange",
								type: "POST",
								data: {
									enterpriseId: enterpriseData.data.id,
									monthlyStart: self.$tar.find("#monthlyStart").val(),
									monthlyEnd: self.$tar.find("#monthlyEnd").val()
								},
								success: function(data) {
									if(chartType == "1") {
										self.getElectricityChart(data.data);
									} else if(chartType == "2") {
										self.getGasChart(data.data);
									} else {
										self.getElectricityChart(data.data);
										self.$tar.find("#energy-table").find("tbody").html(
											$(".template.EnergyList").doT({
												data: data.data
											})
										);
										self.datatables = self.$tar.find("#energy-table").dataTable({
											"searching": false,
										});
									}
								},
								error: function(err) {}
							});
						} else {
							var searchType = self.$tar.find(".searchType").val();
							var id = self.$tar.find(".searchTypeList").val();
							var url = "";
							var data = {};
							if(id == "0") {
								url = "energy/listRange";
								data = {
										monthlyStart: self.$tar.find("#monthlyStart").val(),
										monthlyEnd: self.$tar.find("#monthlyEnd").val()
									}
							} else if(searchType == "1") {
								url = "energy/listByEnterpriseIdRange";
								data = {
										enterpriseId: id,
										monthlyStart: self.$tar.find("#monthlyStart").val(),
										monthlyEnd: self.$tar.find("#monthlyEnd").val()
									}
							} else if(searchType == "2") {
								url = "energy/listByProductTypeIdRange";
								data = {
										productTypeId: id,
										monthlyStart: self.$tar.find("#monthlyStart").val(),
										monthlyEnd: self.$tar.find("#monthlyEnd").val()
									}
							} else if(searchType == "3") {
								url = "energy/listByAreaIdRange";
								data = {
										areaId: id,
										monthlyStart: self.$tar.find("#monthlyStart").val(),
										monthlyEnd: self.$tar.find("#monthlyEnd").val()
									}
							}
							$.ajax({
								url: url,
								type: "POST",
								data: data,
								success: function(data) {
									if(chartType == "1") {
										self.getElectricityChart(data.data);
									} else if(chartType == "2") {
										self.getGasChart(data.data);
									} else {
										self.getElectricityChart(data.data);
										self.$tar.find("#energy-table").find("tbody").html(
											$(".template.EnergyList").doT({
												data: data.data
											})
										);
										self.datatables = self.$tar.find("#energy-table").dataTable({
											"searching": false,
										});
									}
								},
								error: function(err) {}
							});
						}
					}
				});
				return self;
			}
		},
		getElectricityChart: {
			value: function(data) {
				var self = this;
				
				if(data == null) {
					return;
				}
				
				var xAxisArr = [];
				var electricityArr = [];
				var electricityLastYearArr = [];
				var electricityYearGrowthArr = [];
				$.each(data, function(key, val) {
					xAxisArr.push(val.monthly);
					var electricity = val.energy_current != null ? val.energy_current.electricity : 0;
					electricityArr.push({y: electricity, extra: val.energy_current == null ? "-" : electricity + "度"});
					var electricity_lastYear = val.energy_lastYear != null ? val.energy_lastYear.electricity : 0;
					electricityLastYearArr.push({y: electricity_lastYear, extra: val.energy_lastYear == null ? "-" : electricity_lastYear + "度"});
					var electricity_yearGrowth = val.electricity_yearGrowth != null ? (parseFloat(val.electricity_yearGrowth)*100).toFixed(2) : 0; 
					electricityYearGrowthArr.push({y: parseFloat(electricity_yearGrowth), extra: val.electricity_yearGrowth == null ? "-" : parseFloat(electricity_yearGrowth)});
	            });
				self.$tar.find('#chartContainer').highcharts({
					chart: { zoomType: 'xy' }, 
					credits: { enabled: false }, 
					title: { text: '能源消耗分析图' }, 
					subtitle: { text: '用电量分析' }, 
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
			                text: '用电',
			            },
			            labels: {
			                formatter: function() {
			                    return this.value +' 度';
			                },
			            }

			        }], 
					tooltip: { shared: true }, 
					series: [{ 
						name: '本月', 
						color: '#4572A7', 
						type: 'column', 
						yAxis: 1, 
						data: electricityArr,
						tooltip: { 
							valueSuffix: ' 度' ,
							pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
				            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
						} 
					}, 
					{ 
						name: '去年同期', 
						color: '#3bb4f2', 
						type: 'column', 
						yAxis: 1, 
						data: electricityLastYearArr,
						tooltip: { 
							valueSuffix: ' 度',
							pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
				            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
						} 
					},
					{ 
					    name: '同比增长%', 
					    color: '#B2DE53', 
					    type: 'spline', 
					    data: electricityYearGrowthArr, 
					    tooltip: { 
					    	valueSuffix: '%',
					    	pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
				            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
					    } 
					}] 
				});
			}
		},
		getGasChart: {
			value: function(data) {
				var self = this;
				
				if(data == null) {
					return;
				}
				var xAxisArr = [];
				var gasArr = [];
				var gasLastYearArr = [];
				var gasYearGrowthArr = [];
				$.each(data, function(key, val) {
					xAxisArr.push(val.monthly);
					var gas = val.energy_current != null ? val.energy_current.gas : 0;
					gasArr.push({y: gas, extra: val.energy_current == null ? "-" : gas + "立方米"});
					var gas_lastYear = val.energy_lastYear != null ? val.energy_lastYear.gas : 0;
					gasLastYearArr.push({y: gas_lastYear, extra: val.energy_lastYear == null ? "-" : gas_lastYear + "立方米"});
					var gas_yearGrowth = val.gas_yearGrowth != null ? (parseFloat(val.gas_yearGrowth)*100).toFixed(2) : 0; 
					gasYearGrowthArr.push({y: parseFloat(gas_yearGrowth), extra: val.gas_yearGrowth == null ? "-" : parseFloat(gas_yearGrowth)});
	            });
				self.$tar.find('#chartContainer').highcharts({
					chart: { zoomType: 'xy' }, 
					credits: { enabled: false }, 
					title: { text: '能源消耗分析图' }, 
					subtitle: { text: '用气量分析' }, 
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

			        }, { 
			            title: {
			                text: '用气',
			            },
			            labels: {
			                formatter: function() {
			                    return this.value +' 立方米';
			                },
			            }
			        }], 
					tooltip: { shared: true }, 
					series: [
					{ 
						name: '本月', 
						color: '#4572A7', 
						type: 'column', 
						yAxis: 1, 
						data: gasArr,
						tooltip: { 
							valueSuffix: ' 立方米',
							pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
				            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
						} 
					},
					{ 
						name: '去年同期', 
						color: '#3bb4f2', 
						type: 'column', 
						yAxis: 1, 
						data: gasLastYearArr,
						tooltip: { 
							valueSuffix: ' 立方米' ,
							pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
				            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
						} 
					},
					{ 	  
					    name: '同比增长%', 
					    color: '#B2DE53', 
					    type: 'spline', 
					    dashStyle: 'shortdot',
					    data: gasYearGrowthArr,
					    tooltip: { 
					    	valueSuffix: '%',
					    	pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
				            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
					    } 
					}] 
				});
			}
		},
		datetimepicker: {
			value: function($obj) {
				var self = this;
				$obj.datetimepicker( {
				      lang: "ch",           //语言选择中文
				      format: "Y-m",   //格式化日期
				      timepicker: false,
				      onShow: function() {
						$(this).find(".xdsoft_calendar").addClass("am-hide");
				      },
				      onChangeMonth: function(currentDateTime) {
				    	  $obj.val(currentDateTime.format("yyyy-mm"));
				      } 
				});
				return self;
			}
		},
		getValidate: {
			value: function() {
				var self = this;
				var validatorr = self.$tar.find("#searchForm").validate({
					  errorElement: "li",
					  errorLabelContainer: self.$tar.find(".warningDiv"),
				      success: function(label) {
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  //monthlyStart: "required",
				    	  monthlyEnd: {
				    		  //required: true,
				    		  compareDate: "#monthlyStart"
				    	  },
				    	  searchId: "required",
				      },
				      messages: {
				    	  //monthlyStart: {required: "请选择开始年月！"},
				    	  monthlyEnd: {
				    		  //required: "请选择结束年月！",
				    		  compareDate: "结束年月要比开始年月大！"
				    	  },
				    	  searchId: {
				    		  required: "请下拉选择查询项",
				    	  }
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>
