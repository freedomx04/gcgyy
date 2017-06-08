<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template TaxEP" type="text/x-jquery-tmpl">
<div class="admin-content taxEP" style="height: auto!important;">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">纳税系统</strong></div>
	</div>

	<div class="am-tabs" data-am-tabs>
		<ul class="am-tabs-nav am-nav am-nav-tabs">
			<li class="am-active" tab="tab1"><a href="#tab1">国税</a></li>
			<li tab="tab2"><a href="#tab2">地税</a></li>
		</ul>
		<div class="am-tabs-bd">
	    	<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
				<div class="am-g">
					<div class="am-u-sm-12" style="height: 50px;">
						<div class="am-fl">
							<input type="text" id="monthlyStart" class="am-form-field am-align-left datetimepicker" style="font-size: 1.4rem; width: 120px;" placeholder="请选择年月"/>
							到
						</div>
						<div class="am-fl">
							<input type="text" id="monthlyEnd" class="am-form-field am-align-left datetimepicker" style="font-size: 1.4rem; width: 120px; margin-left: 1rem;" placeholder="请选择年月"/>
							<button type="button" class="am-btn am-radius am-btn-default am-btn-sm national-tax-search">查询</button>
						</div>
						<div class="am-fr">
							<div class="am-btn-toolbar am-fl">
		   						<div class="am-btn-group am-btn-group-sm">
								<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
		   						</div>
  							</div>
						</div>
				  </div>

					<div class="am-u-sm-12">
						<div class="sk-three-bounce">
							<div class="sk-child sk-bounce1"></div>
							<div class="sk-child sk-bounce2"></div>
							<div class="sk-child sk-bounce3"></div>
						</div>
						<table class="am-table am-table-striped am-table-hover table-main" id="national-tax-table">
						</table>
    				</div>	
				</div>
			</div>

	    	<div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
				<div class="am-g">
					<div class="am-u-sm-12" style="height: 50px;">
						<div class="am-fl">
							<input type="text" id="monthlyStart" class="am-form-field am-align-left datetimepicker" style="font-size: 1.4rem; width: 120px;" placeholder="请选择年月"/>
							到
						</div>
						<div class="am-fl">
							<input type="text" id="monthlyEnd" class="am-form-field am-align-left datetimepicker" style="font-size: 1.4rem; width: 120px; margin-left: 1rem;" placeholder="请选择年月"/>
							<button type="button" class="am-btn am-radius am-btn-default am-btn-sm local-tax-search">查询</button>
						</div>
						<div class="am-fr">
							<div class="am-btn-toolbar am-fl">
		   						<div class="am-btn-group am-btn-group-sm">
								<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
		   						</div>
  							</div>
						</div>
				  </div>

					<div class="am-u-sm-12">
						<div class="sk-three-bounce">
							<div class="sk-child sk-bounce1"></div>
							<div class="sk-child sk-bounce2"></div>
							<div class="sk-child sk-bounce3"></div>
						</div>
						<table class="am-table am-table-striped am-table-hover table-main" id="local-tax-table">
						</table>
    				</div>	
				</div>
			</div>
		</div>
	</div>


</div>
</script>

<script class="template NationalTaxEPList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th class="table-id">#</th>
		<th>月份</th>
		<th>本月止销售收入(元)</th>
		<th>本月止国税(元)</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: data : index}}
	<tr class="table-tr">
		<td id="{{=data.nationalTax_current != null ? data.nationalTax_current.id : ""}}">{{=index+1}}</td>
		<td>{{=data.monthly || ""}}</td>
		<td class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.sale : "-"}}</td>
		<td class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.taxes : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>


<script class="template LocalTaxEPList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th class="table-id">#</th>
		<th>月份</th>
		<th>本月止地税(元)</th>
	</tr>
</thead>
<tbody>
	{{~ it.data:data : index}}
	<tr class="table-tr">
		<td id="{{=data.localTax_current != null ? data.localTax_current.id : ""}}">{{=index+1}}</td>
		<td>{{=data.monthly || ""}}</td>
		<td class="am-text-primary">{{=data.localTax_current != null ? data.localTax_current.taxes : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>


<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "TaxEP";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTarEP: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on('click', '.national-tax-search', function() {
					self.reload('tab1');
				})
				.on('click', '.am-tabs-nav li', function() {
					var tab = $(this).attr("tab");
					self.reload(tab);
				})
				
				.on('click', '.local-tax-search', function() {
					self.reload('tab2');
				})
				.on("click", ".export-btn", function() {
					var tab = $(this).closest(".am-tab-panel").attr("id");
					var type ;
					if(tab == "tab1") {
						type = 19;
					} else {
						type = 20;
					}
					location.href = "reportForm/exportByEnterpriseId?enterpriseId=" + self.enterpriseId + "&type=" + type;
				})
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
					
				var monthlyStart = new Date();
				var monthlyEnd = new Date();
				monthlyEnd.setDate(1);
				monthlyStart.setYear(monthlyStart.getFullYear() - 1);
				monthlyEnd.setMonth(monthlyEnd.getMonth() - 1);
				
				self.$tar.html(self.$tempTarEP.doT());
				$k.util.datePicker(self.$tar.find("#tab1 #monthlyStart"));
				$k.util.datePicker(self.$tar.find("#tab1 #monthlyEnd"));
				$k.util.datePicker(self.$tar.find("#tab2 #monthlyStart"));
				$k.util.datePicker(self.$tar.find("#tab2 #monthlyEnd"));
				self.$tar.find("#tab1 #monthlyStart, #tab2 #monthlyStart").val(monthlyStart.format("yyyy-mm"));
				self.$tar.find("#tab1 #monthlyEnd, #tab2 #monthlyEnd").val(monthlyEnd.format("yyyy-mm"));
				
				return self;
			}
		},
		reload: {
			value: function(tab) {
				var self = this;
				if (self.table1) {
					self.table1.fnDestroy();
				}
				if (self.table2) {
					self.table2.fnDestroy();
				}

				self.$tar.find("#"+tab+" table").html("");
				self.$tar.find("#"+tab+" .sk-three-bounce").show();
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if(enterpriseData.data != null && enterpriseData.data.length != 0) {
							self.enterpriseId = enterpriseData.data.id;
							
							$.ajax({
								url: "tax/listByEnterpriseIdRange",
								type: "POST",
								data:{
									enterpriseId: enterpriseData.data.id,
									monthlyStart: self.$tar.find("#"+tab+" #monthlyStart").val(),
									monthlyEnd: self.$tar.find("#"+tab+" #monthlyEnd").val()
								},
								success: function(data) {
									self.$tar.find("#"+tab+" .sk-three-bounce").hide();
									if (tab == 'tab1') {
										self.$tar.find("#national-tax-table").html(
											$(".template.NationalTaxEPList").doT({
												data: data.data
											})
										);
										self.table1 = self.$tar.find("#national-tax-table").dataTable();
									}
									else if (tab == 'tab2') {
										self.$tar.find("#local-tax-table").html(
											$(".template.LocalTaxEPList").doT({
												data: data.data
											})
										);
										self.table2 = self.$tar.find("#local-tax-table").dataTable();							
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
		load: {
			value: function(){
				var self = this;
				self.reload('tab1');
				return self;
			}
		}
	});
	
})( jQuery );
</script>