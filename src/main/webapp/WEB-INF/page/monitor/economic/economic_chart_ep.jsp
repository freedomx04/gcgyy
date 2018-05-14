<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EconomicChartEP" type="text/x-jquery-tmpl">
<div class="admin-content" style="height:initial!important;">
	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">经济运行</strong></div>
	</div>

	<div class="am-g">
		<div class="am-u-sm-12">
			<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
			</div>
		</div>
		<div class="am-u-sm-12" style="margin-bottom: 5px;">
			<form id="searchForm">
				<div class="am-u-sm-2 padding-horizontal-o">
					<input type="text" id="monthlyStart" name="monthlyStart" class="am-form-field datetimepicker am-input-sm monthly"  placeholder="请选择年月"/>
				</div>
				<div class="am-u-sm-1 padding-horizontal-o am-text-center" style="width: 4%;">
					<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">到</label>
				</div>
				<div class="am-u-sm-2 padding-left-o">
					<input type="text" id="monthlyEnd" name="monthlyEnd" class="am-form-field datetimepicker am-input-sm monthly" placeholder="请选择年月"/>
				</div>
				<div class="am-u-sm-1 padding-horizontal-o">
					<button type="button" class="am-btn am-btn-sm economic-search-btn">查询</button>
				</div>
				<div class="am-u-sm-3 am-u-sm-offset-3">
					<select class="secondType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
						<option value="1">工业增加值</option>
						<option value="2">主营业务收入</option>
					</select>
				</div>
			</form>
		</div>
	    <div class="am-u-sm-12">
	        <form id="economic-chart" class="am-cf">
	         	<table class="am-table am-table-striped am-table-hover table-main" id="economic-chart-table" style="width:100%;">
	     			</table>
	        </form>
	     </div>
		 <div id="chartContainer" class="am-margin-bottom"></div>
	 </div>
</div>
</script>


<script class="template EconomicChartEPList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th class="table-check"><input type="checkbox" class="box_all"/></th>
		<th class="table-id">序号</th>
		<th>月份</th>
		<th class="{{= it.secondType!=1 ? "am-hide": ""}}" secondType="1">工业增加值(元)</th>
		<th class="{{= it.secondType!=1 ? "am-hide": ""}}" secondType="1">同比增长%</th>
		<th class="{{= it.secondType!=1 ? "am-hide": ""}}" secondType="1">环比增长%</th>
		<th class="{{= it.secondType!=2 ? "am-hide": ""}}" secondType="2">主营业务收入(元)</th>
		<th class="{{= it.secondType!=2 ? "am-hide": ""}}" secondType="2">同比增长%</th>
		<th class="{{= it.secondType!=2 ? "am-hide": ""}}" secondType="2">环比增长%</th>
	</tr>
</thead>
<tbody>
	{{~ it.data : data : index}}
	<tr class="table-tr">
		<td><input type='checkbox' class='box' name='box'/></td>
		<td>{{=index+1}}</td>
		<td class="">{{=data.monthly || ""}}</td>
		<td class="am-text-primary {{= it.secondType!=1 ? "am-hide": ""}}" secondType="1">{{=data.economic_current !=null ? data.economic_current.industryAddition : "-"}}</td>
		<td class="{{= it.secondType!=1 ? "am-hide": ""}}" secondType="1">{{=data.industryAddition_yearGrowth !=null ? (data.industryAddition_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="{{= it.secondType!=1 ? "am-hide": ""}}" secondType="1">{{=data.industryAddition_monthGrowth !=null ? (data.industryAddition_monthGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary {{= it.secondType!=2 ? "am-hide": ""}}" secondType="2">{{=data.economic_current != null ? data.economic_current.mainBusiness : "-"}}</td>
		<td class="{{= it.secondType!=2 ? "am-hide": ""}}" secondType="2">{{=data.mainBusiness_yearGrowth !=null ? (data.mainBusiness_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="{{= it.secondType!=2 ? "am-hide": ""}}" secondType="2">{{=data.mainBusiness_monthGrowth !=null ? (data.mainBusiness_monthGrowth*100).toFixed(2) : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "EconomicChartEP";
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
				.on("change", ".secondType", function() {
					self.load(self.$tar.find("#monthlyStart").val(), self.$tar.find("#monthlyEnd").val(), $(this).val());
				})
				.on("click", ".economic-search-btn", function(e) {
					var $searchForm = $tar.find("#searchForm");
					var monthlyStart = self.$tar.find("#monthlyStart").val();
					var monthlyEnd = self.$tar.find("#monthlyEnd").val();
					self.getValidate();
					if($searchForm.valid()){
						self.load(monthlyStart, monthlyEnd);
					}
				})
				.on("change", "#economic-chart-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#economic-chart-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#economic-chart-table .table-tr", function(e) {
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
				$k.util.getEnterpriseList({
					success: function(data){
						self.$tar.html(self.$tempTar.doT({
							enterpriseData: data.data
						}));
						$('[data-am-selected]').selected();
						self.datetimepicker(self.$tar.find("#monthlyStart"));
						self.datetimepicker(self.$tar.find("#monthlyEnd"));
						self.$tar.find("#monthlyStart, #monthlyEnd").val(now.format("yyyy-mm"));
					}
				});
				return self;
			}
		},
		load: {
			value: function(monthlyStart, monthlyEnd, secondType){
				var self = this;
				var now = new Date();
				now.setMonth(now.getMonth() - 1);
				self.$tar.find("#economic-chart-table").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if(enterpriseData.data==null) {
							self.datatables = self.$tar.find("#economic-chart-table").dataTable({
								"searching": false,
							});
							return;
						}
						$.ajax({
							url: "economic/listByEnterpriseIdRange",
							type: "POST",
							data: {
								enterpriseId: enterpriseData.data.id,
								monthlyStart: monthlyStart || now.format("yyyy-mm"),
								monthlyEnd: monthlyEnd || now.format("yyyy-mm")
							},
							success: function(data) {
								self.$tar.find("#economic-chart-table").html(
									$(".template.EconomicChartEPList").doT({
										data: data.data,
										secondType: 1
									})
								);
								self.datatables = self.$tar.find("#economic-chart-table").dataTable({
									"searching": false,
								});
								self.getChart(data);
								self.$tar.find("#economic-chart-table").find("[secondType]").addClass("am-hide");
								self.$tar.find("#economic-chart-table").find("[secondType='"+self.$tar.find(".secondType").val()+"']").removeClass("am-hide");
							},
							error: function(err) {}
						});
					}
				});
				return self;
			}
		},
		getChart: {
			value: function(data) {
				var self = this;
				self.$tar.find('#chartContainer').html("");
				var secondType = self.$tar.find(".secondType").val();
				var xAxisArr = [];
				var arr1 = [];
				var arr2 = [];
				var arr3 = [];
				var text1 = "";
				var text2 = "";
				$.each(data.data, function(key, val) {
					xAxisArr.push(val.monthly);
					if(secondType == "1") {
						text1 = "工业增加值去年同期";
						text2 = "工业增加值本月";
						var industryAddition_yearGrowth = val.industryAddition_yearGrowth != null && val.industryAddition_yearGrowth != "" ? (parseFloat(val.industryAddition_yearGrowth)*100).toFixed(2) : 0;
						var industryAddition_lastYear = val.economic_lastYear != null ? val.economic_lastYear.industryAddition : 0;
						arr1.push({y: industryAddition_lastYear, extra: val.economic_lastYear==null ? "-" : industryAddition_lastYear + "元"});
						var industryAddition = val.economic_current != null ? val.economic_current.industryAddition : 0;
						arr2.push({y: industryAddition, extra: val.economic_lastYear==null ? "-" : industryAddition + "元"});
						arr3.push({y: parseFloat(industryAddition_yearGrowth), extra: val.industryAddition_yearGrowth==null ? "-" : industryAddition_yearGrowth});
					} else if(secondType == "2") {
						text1 = "主营业务收入去年同期";
						text2 = "主营业务收入本月";
						var mainBusiness_yearGrowth = val.mainBusiness_yearGrowth != null && val.mainBusiness_yearGrowth != "" ? (parseFloat(val.mainBusiness_yearGrowth)*100).toFixed(2) : 0;
						var mainBusiness_lastYear = val.economic_lastYear != null ? val.economic_lastYear.mainBusiness : 0;
						arr1.push({y: mainBusiness_lastYear, extra: val.economic_lastYear==null ? "-" : mainBusiness_lastYear + "元"});
						var mainBusiness = val.economic_current != null ? val.economic_current.mainBusiness : 0;
						arr2.push({y: mainBusiness, extra: val.economic_lastYear==null ? "-" : mainBusiness + "元"});
						arr3.push({y: parseFloat(mainBusiness_yearGrowth), extra: val.mainBusiness_yearGrowth==null ? "-" : mainBusiness_yearGrowth});
					}
	            });
				self.$tar.find('#chartContainer').highcharts({
					chart: { zoomType: 'xy' }, 
					credits: { enabled: false }, 
					title: { text: '经济运行分析图' }, 
					xAxis: [{ 
						categories: xAxisArr
					}], 
					yAxis: [{ 
			            title: {
			                text: '元',
			            },
			            labels: {
			                formatter: function() {
			                    return this.value;
			                },
			            }

			        }, { // Primary yAxis
			            labels: {
			                formatter: function() {
			                    return this.value +'%';
			                },
			            },
			            title: {
			                text: '',
			            },
			            opposite: true

			        }], 
					tooltip: { shared: true }, 
					series: [{ 
						name: text1, 
						color: '#4572A7', 
						type: 'column', 
						data: arr1,
						tooltip: { 
							valueSuffix: ' 元',
							pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
				            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
						} 
					},
					{ 
						name: text2, 
						color: '#3bb4f2', 
						type: 'column', 
						data: arr2,
						tooltip: { 
							valueSuffix: ' 元' ,
							pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
				            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
						} 
					},
					{ 
					    name: '同比增长%', 
					    color: '#B2DE53', 
					    type: 'spline', 
					    data: arr3, 
					    yAxis: 1,
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
				    	  monthlyStart: "required",
				    	  monthlyEnd: {
				    		  required: true,
				    		  compareDate: "#monthlyStart"
				    	  },
				    	  searchId: "required",
				      },
				      messages: {
				    	  monthlyStart: {required: "请选择开始年月！"},
				    	  monthlyEnd: {
				    		  required: "请选择结束年月！",
				    		  compareDate: "结束年月要比开始年月大！"
				    	  }
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>
