<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EconomicChartGV" type="text/x-jquery-tmpl">
<div class="admin-content" style="height:initial!important;">
	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">经济运行</strong></div>
	</div>

	<div class="am-tabs" data-am-tabs>
		<ul class="am-tabs-nav am-nav am-nav-tabs">
			<li class="am-active" tab="tab1"><a href="#tab1">全县主要指标</a></li>
			<li tab="tab2"><a href="#tab2">重点企业主要指标</a></li>
		</ul>

		<div class="am-tabs-bd">
	    	<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
	    		<div class="am-g">
					<div class="am-u-sm-12">
						<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
						</div>
					</div>
					<form id="searchForm">
						<div class="am-u-sm-12" style="margin-bottom: 5px;">
							<div class="am-u-sm-2 padding-horizontal-o">
								<select class="searchType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
									<option value="1">企业明细</option>
									<option value="2">产业明细</option>
									<option value="3">园区明细</option>
								</select>
							</div>
							<div class="am-u-sm-3">
								<select class="searchTypeList" data-am-selected="{btnSize: 'xs', searchBox: 1}" >
									<<option value="0" selected>企业总览</option>
									{{~ it.enterpriseData: enterprise}}	
									<option value="{{=enterprise.id}}">{{=enterprise.name}}</option>
									{{~}}
								</select>
							</div>
							<div class="am-u-sm-2 padding-horizontal-o">
								<input type="text" id="monthlyStart" name="monthlyStart" class="am-form-field datetimepicker am-input-sm monthly"  placeholder="请选择年月"/>
							</div>
							<div class="am-u-sm-1 padding-horizontal-o am-text-center" style="width: 4%;">
								<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">到</label>
							</div>
							<div class="am-u-sm-2 padding-left-o"  style="width: 21%;">
								<input type="text" id="monthlyEnd" name="monthlyEnd" class="am-form-field datetimepicker am-input-sm monthly" placeholder="请选择年月"/>
							</div>
							<div class="am-u-sm-1 am-u-sm-offset-1 am-text-right">
								<button type="button" class="am-btn am-btn-sm economic-search-btn">查询</button>
							</div>
						</div>
						<div class="am-u-sm-12 am-margin-bottom">
							<div class="am-u-sm-2 padding-horizontal-o">
								<select class="secondType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
									<option value="1">工业增加值</option>
									<option value="2">主营业务收入</option>
								</select>
							</div>
						</div>
					</form>
				    <div class="am-u-sm-12">
				        <form id="economic-chart" class="am-cf">
				         	<table class="am-table am-table-striped am-table-hover table-main" id="economic-chart-table" style="width:100%;">
			      			</table>
				        </form>
				     </div>
					 <div id="chartContainer" class="am-margin-bottom"></div>
				 </div>
	    	</div>
	    	
	    	<div class="am-tab-panel am-fade am-in am-active" id="tab2" style="-webkit-user-select:all!important;">
				<div class="am-g">
					<div class="am-u-sm-12">
						<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
						</div>
					</div>
					<form id="searchForm">
						<div class="am-u-sm-12" style="margin-bottom: 5px;">
							<div class="am-u-sm-2 padding-horizontal-o">
								<input type="text" id="monthlyStart" name="monthlyStart" class="am-form-field datetimepicker am-input-sm monthly"  placeholder="请选择年月"/>
							</div>
							<div class="am-u-sm-1 padding-horizontal-o am-text-center" style="width: 4%;">
								<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">到</label>
							</div>
							<div class="am-u-sm-2 padding-left-o">
								<input type="text" id="monthlyEnd" name="monthlyEnd" class="am-form-field datetimepicker am-input-sm monthly" placeholder="请选择年月"/>
							</div>
							<div class="am-u-sm-3 padding-horizontal-o">
								<select class="searchEnterpriseList" data-am-selected="{btnSize: 'xs'}">
									<<option value="" selected>请选择</option>
								</select>
							</div>
							<div class="am-u-sm-1 am-text-right">
								<button type="button" class="am-btn am-btn-sm economic-search-btn">查询</button>
							</div>
							<div class="am-u-sm-2 am-u-sm-offset-1 padding-horizontal-o">
								<select class="secondType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
									<option value="1">工业增加值</option>
									<option value="2">主营业务收入</option>
								</select>
							</div>
						</div>
					</form>
							
				    <div class="am-u-sm-12">
				        <form id="economic-chart" class="am-cf">
				         	<table class="am-table am-table-striped am-table-hover table-main" id="economic-point-chart-table" style="width:100%;">
			      			</table>
				        </form>
				     </div>
					 <div id="chartContainer" class="am-margin-bottom"></div>
				 </div>
	    	</div>
	    </div>
	</div>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "EconomicChartGV";
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
				.on("click", ".am-tabs-nav li", function() {
					var tab = $(this).attr("tab");
					var now = new Date();
					now.setMonth(now.getMonth() - 1);
					$tar.find("#" +tab +" .warningDiv").html("");
					$tar.find("#" +tab +" #monthlStart").val(now.format("yyyy-mm"));
					$tar.find("#" +tab +" #monthlyEnd").removeClass("error").val(now.format("yyyy-mm"));
					if(tab == "tab1"){
						/* $tar.find(".searchType").next().find('.am-selected-status').html("企业名称");
						$tar.find("#tab1 .searchType").next().find("li").removeClass("am-checked");
						$tar.find("#tab1 .searchType").next().find("li").first().addClass("am-checked");
						$tar.find("#tab1 .searchType").val("1"); */
						self.load();
					} else if(tab == "tab2"){
						self.getPointList();
					}
				})
				.on("change", ".secondType", function() {
					var tab = $tar.find(".am-tabs-nav li[class='am-active']").attr("tab");
					var monthlyStart = self.$tar.find("#monthlyStart").val();
					var monthlyEnd = self.$tar.find("#monthlyEnd").val();
					if(tab == "tab1") {
						self.load(monthlyStart, monthlyEnd);
					} else {
						self.getPointList(monthlyStart, monthlyEnd);
					}
				})
				.on("change", ".searchType", function() {
					$tar.find(".searchTypeList").html("");
					switch(parseInt($(this).val())) {
					case 1:
						$("<option value='0'>企业总览</option>").appendTo(".searchTypeList");
						$k.util.getEnterpriseList({
							success: function(data){
								$.each(data.data, function(key, val) {
									$("<option value='"+val.id+"'>"+val.name+"</option>").appendTo(".searchTypeList");
								});
							}
						});
						break;
					case 2:
						$("<option value=''>请选择</option>").appendTo(".searchTypeList");
						$k.util.getProductTypeList({
							success: function(data){
								$.each(data.data, function(key, val) {
									$("<option value='"+val.id+"'>"+val.name+"</option>").appendTo(".searchTypeList");
								});
							}
						});
						break;
					case 3:
						$("<option value=''>请选择</option>").appendTo(".searchTypeList");
						$k.util.getAreaList({
							success: function(data){
								$.each(data.data, function(key, val) {
									$("<option value='"+val.id+"'>"+val.name+"</option>").appendTo(".searchTypeList");
								});
							}
						});
					}
				})
				.on("click", ".economic-search-btn", function(e) {
					var $this = $(this);
					var tab = $this.closest(".am-tab-panel").attr("id");
					var $searchForm = $this.closest("#searchForm");
					var monthlyStart = $searchForm.find("#monthlyStart").val();
					var monthlyEnd = $searchForm.find("#monthlyEnd").val();
					self.getValidate($searchForm);
					if($searchForm.valid()){
						if(tab == "tab1") {
							if($tar.find("#tab1 .searchTypeList").val() == "0") {
								self.load(monthlyStart, monthlyEnd);
							} else {
								self.getListByRange();
							}
						} else {
							self.getPointList(monthlyStart, monthlyEnd);
						}
					}
				})
				.on("change", "#economic-chart-table .box_all, #economic-point-chart-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#economic-chart-table .box, #economic-point-chart-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#economic-chart-table .table-tr, #economic-point-chart-table .table-tr", function(e) {
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
						self.datetimepicker(self.$tar.find("#tab1 #monthlyStart"));
						self.datetimepicker(self.$tar.find("#tab2 #monthlyStart"));
						self.datetimepicker(self.$tar.find("#tab1 #monthlyEnd"));
						self.datetimepicker(self.$tar.find("#tab2 #monthlyEnd"));
						self.$tar.find("#monthlyStart, #monthlyEnd").val(now.format("yyyy-mm"));
					}
				});
				return self;
			}
		},
		load: {
			value: function(monthlyStart, monthlyEnd){
				var self = this;
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				var now = new Date();
				now.setMonth(now.getMonth() - 1);
				$.ajax({
					url: "economic/listRange",
					type: "POST",
					data: {
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
						self.getChart(data, self.$tar.find('#tab1 #chartContainer'));
						self.$tar.find("#economic-chart-table").find("[secondType]").addClass("am-hide");
						self.$tar.find("#economic-chart-table").find("[secondType='"+self.$tar.find(".secondType").val()+"']").removeClass("am-hide");
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getPointList: {
			value: function(monthlyStart, monthlyEnd){
				var self = this;
				self.$tar.find("#economic-point-chart-table").html("");
				if (self.datatablesA) {
					self.datatablesA.fnDestroy();
				}
				if(monthlyStart == null || monthlyStart == "") {
					self.$tar.find(".searchEnterpriseList").html("<option value=''>请选择</option>");
					$.ajax({
						url: "enterprise/listPointEnterprise",
						type: "POST",
						success: function(data) {
							$.each(data.data, function(key, val) {
								$("<option value='"+val.id+"'>"+val.name+"</option>").appendTo(".searchEnterpriseList");
							});
						},
						error: function(err) {}
					});
					self.datatablesA = self.$tar.find("#economic-point-chart-table").dataTable({
						"searching": false,
					});
				} else {
					var secondType = self.$tar.find("#tab2 .secondType").val();
					$.ajax({
						url: "economic/listByEnterpriseIdRange",
						type: "POST",
						data: {
							enterpriseId: self.$tar.find(".searchEnterpriseList").val(),
							monthlyStart: monthlyStart,
							monthlyEnd: monthlyEnd
						},
						success: function(data) {
							self.$tar.find("#economic-point-chart-table").html(
								$(".template.EconomicChartEPList").doT({
									data: data.data,
									secondType: secondType
								})
							);
							self.datatablesA = self.$tar.find("#economic-point-chart-table").dataTable({
								"searching": false,
							});
							self.getChart(data, self.$tar.find('#tab2 #chartContainer'));
							self.$tar.find("#economic-point-chart-table").find("[secondType]").addClass("am-hide");
							self.$tar.find("#economic-point-chart-table").find("[secondType='"+secondType+"']").removeClass("am-hide");
						},
						error: function(err) {}
					});
				}
				return self;
			}
		},
		getListByRange: {
			value: function(data){
				var self = this;
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				var searchType = self.$tar.find("#tab1 .searchType").val();
				var secondType = self.$tar.find("#tab1 .secondType").val();
				var id = self.$tar.find(".searchTypeList").val();
				var data = {};
				if(searchType == "1") {
					url = "economic/listByEnterpriseIdRange";
					data =  {
						enterpriseId: id,
						monthlyStart: self.$tar.find("#monthlyStart").val(),
						monthlyEnd: self.$tar.find("#monthlyEnd").val()
					}
				} else if(searchType == "2") {
					url = "economic/listByProductTypeIdRange";
					data =  {
						productTypeId: id,
						monthlyStart: self.$tar.find("#monthlyStart").val(),
						monthlyEnd: self.$tar.find("#monthlyEnd").val()
					}
				} else {
					url = "economic/listByAreaIdRange";
					data =  {
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
						self.$tar.find("#economic-chart-table").html(
							$(".template.EconomicChartEPList").doT({
								data: data.data,
								secondType: secondType
							})
						);
						self.datatables = self.$tar.find("#economic-chart-table").dataTable({
							"searching": false,
						});
						self.$tar.find("#economic-chart-table").find("[secondType]").addClass("am-hide");
						self.$tar.find("#economic-chart-table").find("[secondType='"+self.$tar.find(".secondType").val()+"']").removeClass("am-hide");
						self.getChart(data, self.$tar.find('#tab1 #chartContainer'));
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getChart: {
			value: function(data, $obj) {
				var self = this;
				$obj.html("");
				var secondType = $obj.parent().find(".secondType").val();
				var searchType = $obj.parent().find(".searchTypeList").val();
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
				$obj.highcharts({
					chart: { zoomType: 'xy' }, 
					credits: { enabled: false }, 
					title: { text: '经济运行分析图' }, 
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
						name: text2, 
						color: '#3bb4f2', 
						type: 'column', 
						data: arr2,
						yAxis: 1,
						tooltip: { 
							valueSuffix: ' 元',
							pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
				            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
						} 
					},
					{ 
					    name: '同比增长%', 
					    color: '#B2DE53', 
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
			value: function($searchForm) {
				var self = this;
				var validatorr = $searchForm.validate({
					  errorElement: "li",
					  errorLabelContainer: $searchForm.prev().find(".warningDiv"),
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
