<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Warning" type="text/x-jquery-tmpl">
<div class="admin-content">
	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">{{= it.type == 1 ? "企业预警信息" : "报表预警"}}</strong></div>
	</div>
	{{?it.type == 1}}
	<div class="am-g">
	    <div class="am-u-sm-12 am-scrollable-horizontal">
			<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
			</div>
	        <form id="enterprise-warning" class="am-cf">
				{{ if(it.resource.indexOf('agency_department') > -1) { }}
				<div class="am-u-sm-2 padding-horizontal-o">
					<input type="text" class="am-form-field datetimepicker monthly" style="height: 2.4rem;" placeholder="请选择年月"/>
				</div>
				{{ } else { }}
				<div class="am-u-sm-2 padding-horizontal-o">
					<input type="text" id="monthlyStart" name="monthlyStart" class="am-form-field datetimepicker am-input-sm"  placeholder="请选择年月"/>
				</div>
				<div class="am-u-sm-1 padding-horizontal-o am-text-center" style="width: 4%;">
					<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">到</label>
				</div>
				<div class="am-u-sm-2 padding-horizontal-o">
					<input type="text" id="monthlyEnd" name="monthlyEnd" class="am-form-field datetimepicker am-input-sm" placeholder="请选择年月"/>
				</div>
				{{ } }}
				<div class="am-u-sm-1 padding-right-o">
					<button type="button" class="am-btn am-btn-sm warning-search-btn">查询</button>
				</div>
				
				<div class="sk-three-bounce">
					<div class="sk-child sk-bounce1"></div>
					<div class="sk-child sk-bounce2"></div>
					<div class="sk-child sk-bounce3"></div>
				</div>	
			
	         	<table class="am-table am-table-striped am-table-hover table-main am-text-nowrap" id="enterprise-warning-table">
      			</table>
	        </form>
	     </div>
	 </div>
	{{?}}
	{{?it.type == 2}}
	<div class="am-g">
	    <div class="am-u-sm-12">
			<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
			</div>
	        <form id="report-warning" class="am-cf">
				{{ if(it.resource.indexOf('agency_department') > -1) { }}
				<div class="am-u-sm-2 padding-horizontal-o">
					<input type="text" class="am-form-field datetimepicker monthly" style="height: 2.4rem;" placeholder="请选择年月"/>
				</div>
				{{ } else { }}
				<div class="am-u-sm-2 padding-horizontal-o">
					<input type="text" id="monthlyStart" name="monthlyStart" class="am-form-field datetimepicker am-input-sm monthly"  placeholder="请选择年月"/>
				</div>
				<div class="am-u-sm-1 padding-horizontal-o am-text-center" style="width: 4%;">
					<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">到</label>
				</div>
				<div class="am-u-sm-2 padding-horizontal-o">
					<input type="text" id="monthlyEnd" name="monthlyEnd" class="am-form-field datetimepicker am-input-sm monthly" placeholder="请选择年月"/>
				</div>
				{{ }　}}
				<div class="am-u-sm-1 padding-right-o">
					<button type="button" class="am-btn am-btn-sm warning-search-btn">查询</button>
				</div>

				<div class="sk-three-bounce">
					<div class="sk-child sk-bounce1"></div>
					<div class="sk-child sk-bounce2"></div>
					<div class="sk-child sk-bounce3"></div>
				</div>
				<table class="am-table am-table-striped am-table-hover table-main am-text-nowrap" id="report-warning-table">
      			</table>
	        </form>
	     </div>
	 </div>
	{{?}}
</div>
</script>


<script class="template EnterpriseWarningList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th class="table-id">#</th>
		{{ if(it.resource.indexOf('agency_department') > -1) { }}
		<th>企业名称</th>
		{{ } else { }}
		<th>月份</th>
		{{ } }}
		<th>工业总产值同比增长%</th>
		<th>工业总产值环比增长%</th>
		<th>主营业务收入同比增长%</th>
		<th>主营业务收入环比增长%</th>
		<th>国税同比增长%</th>
		<th>国税环比增长%</th>
		<th>地税同比增长%</th>
		<th>地税环比增长%</th>
		<th>气能耗同比增长%</th>
		<th>气能耗环比增长%</th>
		<th>电能耗同比增长%</th>
		<th>电能耗环比增长%</th>
	</tr>
</thead>
<tbody>
{{~it.data : data : index}}
<tr class="table-tr">
	<td>{{=index+1}}</td>
	{{ if(it.resource.indexOf('agency_department') > -1) { }}
	<td class="td-title ellipsis" title="data.enterprise != null ? data.enterprise.name : """>{{=data.enterprise != null ? data.enterprise.name : ""}}</td>
	{{ }else{ }}
	<td>{{=data.monthly || ""}}</td>
	{{ } }}
	<td class="{{=$k.util.getStatusClass(data.industryAddition_yearGrowth)}}">{{=data.industryAddition_yearGrowth != null ? (data.industryAddition_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.industryAddition_monthGrowth)}}">{{=data.industryAddition_monthGrowth != null ? (data.industryAddition_monthGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.mainBusiness_yearGrowth)}}">{{=data.mainBusiness_yearGrowth != null ? (data.mainBusiness_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.mainBusiness_monthGrowth)}}">{{=data.mainBusiness_monthGrowth != null ? (data.mainBusiness_monthGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.nationalTax_yearGrowth)}}">{{=data.nationalTax_yearGrowth != null ? (data.nationalTax_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.nationalTax_monthGrowth)}}">{{=data.nationalTax_monthGrowth != null ? (data.nationalTax_monthGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.localTax_yearGrowth)}}">{{=data.localTax_yearGrowth != null ? (data.localTax_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.localTax_monthGrowth)}}">{{=data.localTax_monthGrowth != null ? (data.localTax_monthGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.gas_yearGrowth)}}">{{=data.gas_yearGrowth != null ? (data.gas_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.gas_monthGrowth)}}">{{=data.gas_monthGrowth != null ? (data.gas_monthGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.electricity_yearGrowth)}}">{{=data.electricity_yearGrowth != null ? (data.electricity_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="{{=$k.util.getStatusClass(data.electricity_monthGrowth)}}">{{=data.electricity_monthGrowth != null ? (data.electricity_monthGrowth*100).toFixed(2) : "-"}}</td>
</tr>
{{~}}
</tbody>
</script>

<script class="template ReportWarningList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th class="table-id">#</th>
		{{ if(it.resource.indexOf('agency_department') > -1) { }}
		<th>企业名称</th>
		{{ } else{ }}
		<th>月份</th>
		{{ } }}
		<th>国税</th>
		<th>地税</th>
		<th>工业总产值</th>
		<th>能源消耗</th>
		<th>效益指标月报表</th>
	</tr>
</thead>
<tbody>
	{{~it.data : data : index}}
	<tr class="table-tr">
		<td id="">{{=index+1}}</td>
		{{ if(it.resource.indexOf('agency_department') > -1) { }}
		<td>{{=data.enterprise != null ? data.enterprise.name : ""}}</td>
		{{ } else { }}
		<td>{{=data.monthly || ""}}</td>
		{{ } }}
		<td class="{{=data.nationalTax == 0 ? "am-text-warning" : data.nationalTax == 1 ? "am-text-primary" : ""}}">{{=data.nationalTax == 0 ? "未上报" : data.nationalTax == 1 ? "已上报" : ""}}</td>
		<td class="{{=data.localTax == 0 ? "am-text-warning" : data.localTax == 1 ? "am-text-primary" : ""}}">{{=data.localTax == 0 ? "未上报" : data.localTax == 1 ? "已上报" : ""}}</td>
		<td class="{{=data.economic == 0 ? "am-text-warning" : data.economic == 1 ? "am-text-primary" : ""}}">{{=data.economic == 0 ? "未上报" : data.economic == 1 ? "已上报" : ""}}</td>
		<td class="{{=data.energy == 0 ? "am-text-warning" : data.energy == 1 ? "am-text-primary" : ""}}">{{=data.energy == 0 ? "未上报" : data.energy == 1 ? "已上报" : ""}}</td>
		<td class="{{=data.benefit == 0 ? "am-text-warning" : data.benefit == 1 ? "am-text-primary" : ""}}">{{=data.benefit == 0 ? "未上报" : data.benefit == 1 ? "已上报" : ""}}</td>
	</tr>
	{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "Warning";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				
				$tar
				.on("click", ".warning-search-btn", function(e) {
					var $this = $(this);
					var $searchForm = $this.closest("form");
					if($k.user.get().role.resource.indexOf('agency_enterprise') > -1) {
						self.getValidate($searchForm);
						if(!$searchForm.valid()){
							return;
						}
					}
					self.load();
				})
				return self;
			}
		},
		draw: {
			value: function(type) {
				var self = this;
				var resource = $k.user.get().role.resource;
				self.type = type;
				self.$tar.html(self.$tempTar.doT({
					resource: resource,
					type: type
				}));
				$('[data-am-selected]').selected();
				var monthlyStart = new Date();
				var monthlyEnd = new Date();
				monthlyStart.setYear(monthlyStart.getFullYear() - 1);
				monthlyEnd.setMonth(monthlyEnd.getMonth() - 1);
				
				if(resource.indexOf('agency_department') > -1) {
					self.datetimepicker(self.$tar.find(".monthly"));
					self.$tar.find(".monthly").val(monthlyEnd.format("yyyy-mm"))
				} else {
					self.datetimepicker(self.$tar.find("#monthlyStart"));
					self.datetimepicker(self.$tar.find("#monthlyEnd"));
					self.$tar.find("#monthlyStart").val(monthlyStart.format("yyyy-mm"));
					self.$tar.find("#monthlyEnd").val(monthlyEnd.format("yyyy-mm"));
				}
				return self;
			}
		},
		load: {
			value: function(){
				var self = this;
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				var $table = self.type == 1 ? self.$tar.find("#enterprise-warning-table") : self.$tar.find("#report-warning-table");
				var $template = self.type ==1 ? $(".template.EnterpriseWarningList") : $(".template.ReportWarningList");
				self.$tar.find(".sk-three-bounce").show();
				
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if(enterpriseData.data != null && enterpriseData.data.length != 0) {
							var url = self.type == 1 ? "alert/listEnterpriseByMonthlyRange" : "alert/listReportByMonthlyRange";
							$.ajax({
								url: url,
								type: "POST",
								data: {
									enterpriseId: enterpriseData.data.id,
									monthlyStart: self.$tar.find("#monthlyStart").val(),
									monthlyEnd: self.$tar.find("#monthlyEnd").val(),
								},
								success: function(data) {
									$table.prev().hide();
									$table.html(
										$template.doT({
											data: data.data,
											resource: $k.user.get().role.resource,
										})
									);
									self.datatables = $table.dataTable();
								},
								error: function(err) {}
							});
						} else {
							var url = self.type == 1 ? "alert/listEnterprise" : "alert/listReport";
							$.ajax({
								url: url,
								type: "POST",
								data: {
									monthly: self.$tar.find(".monthly").val()
								},
								success: function(data) {
									$table.prev().hide();
									$table.html(
										$template.doT({
											data: data.data,
											resource: $k.user.get().role.resource,
										})
									);
									self.datatables = $table.dataTable();
								},
								error: function(err) {}
							});
						}
					}
				});
				return self;
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
			value: function($obj) {
				var self = this;
				var validatorr = $obj.validate({
					  errorElement: "li",
					  errorLabelContainer: $obj.closest("div").find(".warningDiv"),
				      success: function(label) {
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  monthlyEnd: {
				    		  compareDate: "#monthlyStart"
				    	  }
				      },
				      messages: {
				    	  monthlyEnd: {
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
