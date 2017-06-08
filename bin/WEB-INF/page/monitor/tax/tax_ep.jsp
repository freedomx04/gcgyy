<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template TaxEP" type="text/x-jquery-tmpl">
<div class="admin-content">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">纳税系统</strong></div>
	</div>

	<input type="text" id="enterpriseId" class="am-hide"/>

	<div class="am-tabs" data-am-tabs>
		<ul class="am-tabs-nav am-nav am-nav-tabs">
			<li class="am-active" tab="tab1"><a href="#tab1">国税</a></li>
			<li tab="tab2"><a href="#tab2">地税</a></li>
		</ul>
		<div class="am-tabs-bd">
	    	<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
	    		<div class="am-g">
					<div class="am-u-sm-12">
						<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
						</div>
					</div>
			  		<div class="am-u-sm-12">
		        		<form id="national-tax" class="am-cf class="searchForm"">
							<div class="am-u-sm-2 padding-horizontal-o">
								<input type="text" id="monthlyStart" name="monthlyStart" class="am-form-field datetimepicker am-input-sm monthly"  placeholder="请选择年月"/>
							</div>
							<div class="am-u-sm-1 padding-horizontal-o am-text-center" style="width: 4%;">
								<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">到</label>
							</div>
							<div class="am-u-sm-2 padding-horizontal-o">
								<input type="text" id="monthlyEnd" name="monthlyEnd" class="am-form-field datetimepicker am-input-sm monthly" placeholder="请选择年月"/>
							</div>
							<div class="am-u-sm-1 padding-right-o" style="margin-right: 15px;">
								<button type="button" class="am-btn am-btn-sm national-tax-search-btn">查询</button>
							</div>
							<div class="am-u-sm-2 padding-horizontal-o">
								<button type="button" class="am-btn am-btn-sm export-btn"><span class="am-icon-save"></span> 导出Excel</button>
							</div>
	          				<table class="am-table am-table-striped am-table-hover table-main" id="national-tax-table" style="width:100%;">
			            		<thead>
			              			<tr>
			                			<th class="table-check"><input type="checkbox" class="box_all"/></th>
			                			<th>序号</th>
										<th>月份</th>
										<th>销售收入(元)</th>
										<th>去年同期(元)</th>
										<th>同比增长%</th>
			                			<th>累计税收(元)</th>
										<th>去年同期(元)</th>
										<th>同比增长%</th>
			              			</tr>
			          			</thead>
			          			<tbody></tbody>
	       					</table>
		        		</form>
    				</div>
	    		</div>
	    	</div>
	    	<div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
				<div class="am-g">
					<div class="am-u-sm-12">
						<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
						</div>
					</div>
					<div class="am-u-sm-12">
						<form id="local-tax" class="searchForm">
							<div class="am-u-sm-2 padding-horizontal-o">
								<input type="text" id="monthlyStart" name="monthlyStart" class="am-form-field datetimepicker am-input-sm monthly"  placeholder="请选择年月"/>
							</div>
							<div class="am-u-sm-1 padding-horizontal-o am-text-center" style="width: 4%;">
								<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">到</label>
							</div>
							<div class="am-u-sm-2 padding-horizontal-o">
								<input type="text" id="monthlyEnd" name="monthlyEnd" class="am-form-field datetimepicker am-input-sm monthly" placeholder="请选择年月"/>
							</div>
							<div class="am-u-sm-1 padding-right-o" style="margin-right: 15px;" >
								<button type="button" class="am-btn am-btn-sm local-tax-search-btn">查询</button>
							</div>
							<div class="am-u-sm-1 padding-horizontal-o">
								<button type="button" class="am-btn am-btn-sm export-btn"><span class="am-icon-save"></span> 导出Excel</button>
							</div>
			          		<table class="am-table am-table-striped am-table-hover table-main" id="local-tax-table">
				          		<thead>
					          		<tr>
										<th class="table-check"><input type="checkbox" class="box_all"/></th>
			                			<th>序号</th>
										<th>月份</th>
			                			<th>本月税款(元)</th>
										<th>去年同期(元)</th>
										<th>同比增长%</th>
					          		</tr>
				          		</thead>
			          			<tbody></tbody>
			       			</table>
			        	</form>
					</div>
				</div>
	    	</div>
	  	</div>
	</div>
</div>
</script>

<script class="template NationalTaxEPList" type="text/x-jquery-tmpl">
	{{~ it.data: data:index }}
		<tr class="table-tr">
			<td><input type='checkbox' class='box' name='box'/></td>
			<td>{{=index+1}}</td>
			<td title="{{=data.monthly}}">{{=data.monthly}}</td>
			<td class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.sale : "-"}}</td>
			<td>{{=data.nationalTax_lastYear != null ? data.nationalTax_lastYear.sale : "-"}}</td>
			<td>{{=data.sale_yearGrowth != null ? (data.sale_yearGrowth*100).toFixed(2) : "-"}}</td>
			<td class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.taxes : "-"}}</td>
			<td>{{=data.nationalTax_lastYear != null ? data.nationalTax_lastYear.taxes : "-"}}</td>
			<td>{{=data.nationalTax_yearGrowth != null ? (data.nationalTax_yearGrowth*100).toFixed(2) : "-"}}</td></td>
		</tr>
	{{~}}
</script>

<script class="template LocalTaxEPList" type="text/x-jquery-tmpl">
{{~ it.data: data:index }}
<tr class="table-tr">
	<td><input type='checkbox' class='box' name='box'/></td>
	<td>{{=index+1}}</td>
	<td>{{=data.monthly}}</td>
	<td>{{=data.localTax_current != null ? data.localTax_current.taxes : "-"}}</td>
	<td>{{=data.localTax_lastYear != null ? data.localTax_lastYear.taxes : "-"}}</td>
	<td>{{=data.localTax_yearGrowth != null ? (data.localTax_yearGrowth*100).toFixed(2) : "-"}}</td></td>
</tr>
{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "TaxEP";
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
				.on("click", ".am-tabs-nav li", function() {
					var tab = $(this).attr("tab");
					var now = new Date();
					now.setMonth(now.getMonth() - 1);
					$tar.find("#"+tab).find("#monthlyStart").val(now.format("yyyy-mm"));
					$tar.find("#"+tab).find("#monthlyEnd").val(now.format("yyyy-mm"));
					if (tab == "tab1"){
						self.load();
					} else {
						self.getLocalTaxList();
					}
				})
				.on("click", ".export-btn", function() {
					var tab = $(this).closest(".am-tab-panel").attr("id");
					var type ;
					if (tab == "tab1") {
						type = 19;
					} else {
						type = 20;
					}
					location.href = "reportForm/exportByEnterpriseId?enterpriseId=" + $tar.find("#enterpriseId").val() + "&type=" + type;
				})
				.on("click", ".national-tax-search-btn", function(e) {
					var $searchForm = $(this).closest("form");
					self.getValidate($searchForm);
					if ($searchForm.valid()){
						self.load();
					}
				})
				.on("click", ".local-tax-search-btn", function(e) {
					var $searchForm = $(this).closest("form");
					self.getValidate($searchForm);
					if ($searchForm.valid()) {
						self.getLocalTaxList();
					}
				})
				.on("change", "#national-tax-table .box_all, #local-tax-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#national-tax-table .box, #local-tax-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#national-tax-table .table-tr, #local-tax-table .table-tr", function(e) {
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
				self.$tar.html(self.$tempTar.doT());
				self.datetimepicker(self.$tar.find("#tab1 #monthlyStart"));
				self.datetimepicker(self.$tar.find("#tab1 #monthlyEnd"));
				self.datetimepicker(self.$tar.find("#tab2 #monthlyStart"));
				self.datetimepicker(self.$tar.find("#tab2 #monthlyEnd"));
				self.$tar.find("#tab1 #monthlyStart").val(now.format("yyyy-mm"));
				self.$tar.find("#tab1 #monthlyEnd").val(now.format("yyyy-mm"));
				self.$tar.find("#tab2 #monthlyStart").val(now.format("yyyy-mm"));
				self.$tar.find("#tab2 #monthlyEnd").val(now.format("yyyy-mm"));
				return self;
			}
		},
		load: {
			value: function(){
				var self = this;
				self.$tar.find("#national-tax-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if (enterpriseData.data != null && enterpriseData.data.length != 0) {
							self.$tar.find("#enterpriseId").val(enterpriseData.data.id);
							$.ajax({
								url: "tax/listByEnterpriseIdRange",
								type: "POST",
								data:{
									enterpriseId: enterpriseData.data.id,
									monthlyStart: self.$tar.find("#tab1 #monthlyStart").val(),
									monthlyEnd: self.$tar.find("#tab1 #monthlyEnd").val()
								},
								success: function(data) {
									self.$tar.find("#national-tax-table").find("tbody").html(
										$(".template.NationalTaxEPList").doT({
											data: data.data
										})
									);
									self.datatables = self.$tar.find("#national-tax-table").dataTable();
								},
								error: function(err) {}
							});
						} else {
							self.datatables = self.$tar.find("#national-tax-table").dataTable();
						}
					}
				});
				$('[data-am-selected]').selected();
				return self;
			}
		},
		getLocalTaxList: {
			value: function(){
				var self = this;
				self.$tar.find("#local-tax-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "tax/listByEnterpriseIdRange",
					type: "POST",
					data:{
						enterpriseId: self.$tar.find("#enterpriseId").val(),
						monthlyStart: self.$tar.find("#tab2 #monthlyStart").val(),
						monthlyEnd: self.$tar.find("#tab2 #monthlyEnd").val()
					},
					success: function(data) {
						self.$tar.find("#local-tax-table").find("tbody").html(
							$(".template.LocalTaxEPList").doT({
								data: data.data
							})
						);
						self.datatables = self.$tar.find("#local-tax-table").dataTable();
					},
					error: function(err) {}
				});
				$('[data-am-selected]').selected();
				return self;
			}
		},
		datetimepicker: {
			value: function(obj) {
				var self = this;
				$(obj).datetimepicker( {
				      lang: "ch",           //语言选择中文
				      format: "Y-m",   //格式化日期
				      timepicker: false,
				      onShow: function() {
						$(this).find(".xdsoft_calendar").addClass("am-hide");
				      },
				      onChangeMonth: function(currentDateTime) {
				    	  $(obj).val(currentDateTime.format("yyyy-mm"));
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
					  errorLabelContainer: $searchForm.parent().prev().find(".warningDiv"),
				      success: function(label) {
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  monthlyEnd: {
				    		  compareDate: "#monthlyStart"
				    	  },
				    	  searchId: "required",
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
