<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EnergyEP" type="text/x-jquery-tmpl">
<div class="admin-content" style="height:initial!important;">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">信息直报系统</strong></div>
	</div>

	<input type="text" id="enterpriseId" class="am-hide"/>

	<div class="am-tabs" data-am-tabs>
		<ul class="am-tabs-nav am-nav am-nav-tabs">
			<li class="am-active" tab="tab1"><a href="#tab1">能源消耗</a></li>
			<li tab="tab2"><a href="#tab2">效益指标月报表</a></li>
		</ul>

		<div class="am-tabs-bd">
	    	<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
	    		<div class="am-g">
		      		<div class="am-u-sm-12">
						<div class="am-btn-toolbar am-fl">
	   						<div class="am-btn-group am-btn-group-xs">
								<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
	   						</div>
  						</div>
				        <form id="energy" class="am-cf">
			          		<table class="am-table am-table-striped am-table-hover table-main" id="energy-table" style="width:100%;">
			            		<thead>
			              			<tr>
			                			<th class="table-check"><input type="checkbox" class="box_all"/></th>
			                			<th class="table-id">序号</th>
										<th>月份</th>
			                			<th>本月用电(度)</th>
										<th>去年同月(度)</th>
										<th>同比增长%</th>
										<th>环比增长%</th>
			                			<th>本月用气(立方米)</th>
										<th>去年同月(立方米)</th>
			                			<th>同比增长%</th>
										<th>环比增长%</th>
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
					<div class="am-u-sm-12 am-scrollable-horizontal">
						<div class="am-btn-toolbar am-fl">
	   						<div class="am-btn-group am-btn-group-xs">
	     						<button type="button" class="am-btn am-btn-default benefit-add-btn"><span class="am-icon-plus"></span> 新增</button>
	     						<button type="button" class="am-btn am-btn-default benefit-update-btn"><span class="am-icon-save"></span> 编辑</button>
	     						<button type="button" class="am-btn am-btn-default benefit-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
								<button type="button" class="am-btn am-btn-default benefit-send-btn"><span class="am-icon-plus"></span> 发送</button>
								<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
	   						</div>
  						</div>
						<form id="benefit">
			          		<table class="am-table am-table-striped am-table-hover table-main am-table-centered am-text-nowrap" id="benefit-table">
			            		<thead>
			              			<tr>
			                			<th></th>
										<th></th>
										<th></th>
										<th></th>
			                			<th colspan="9">流动资产合计</th>
										<th colspan="9">两项资产合计</th>
			              			</tr>
			              			<tr>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th colspan="3"></th>
			              				<th colspan="3">其中：应收账款</th>
			              				<th colspan="3">产存品存货</th>
			              				<th colspan="3"></th>
			              				<th colspan="3">资产累计</th>
			              				<th colspan="3">负债累计</th>
			              			</tr>
			              			<tr>
										<th></th>
			                			<th class="table-id">序号</th>
										<th class="table-name">月份</th>
										<th>状态</th>
			              				<th>本月(元)</th>
			              				<th>上年同期(元)</th>
			              				<th>同比增幅%</th>
			              				<th>本月(元)</th>
			              				<th>上年同期(元)</th>
			              				<th>同比增幅%</th>
			              				<th>本月(元)</th>
			              				<th>上年同期(元)</th>
			              				<th>同比增幅%</th>
			              				<th>本月(元)</th>
			              				<th>上年同期(元)</th>
			              				<th>同比增幅%</th>
			              				<th>本月(元)</th>
			              				<th>上年同期(元)</th>
			              				<th>同比增幅%</th>
			              				<th>本月(元)</th>
			              				<th>上年同期(元)</th>
			              				<th>同比增幅%</th>
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

<script class="template BenefitDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	效益指标月报表
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd" style="overflow:auto;max-height:500px">
		<div class="am-u-sm-12 am-padding-top" style="margin-bottom: 5px;">
			<div class="am-u-sm-3 padding-horizontal-o">
				<label class="am-form-label am-text-primary" style="line-height: 2.8rem;font-weight:normal;">月报表时间：</label>
			</div>
			<div class="am-u-sm-3 am-u-end padding-horizontal-o">
				<input type="text" class="am-form-field datetimepicker am-input-sm" id="monthly" name="monthly"/>
			</div>
	   </div>
	    <form class="am-form am-form-horizontal" id="benefit-input-form">
	    	  <input name="id" id="id" type="text" class="am-hide"/>
			  <table class="am-table am-table-centered am-padding-horizontal">
					<thead>
						<tr class="warningTr am-hide">
							<th class="am-text-danger">该月份数据已存在，请勿重复添加！</th>
							<th></th>
						</tr>
        				<tr>
            				<th>单位（元）</th>
            				<th>本月</th>
        				</tr>
   					</thead>
   					<tbody>
						<tr>
							<td>流动资产合计</td>
							<td></td>
						</tr>
        				<tr>
							<td style="font-size: 1.4rem">其中：应收账款</td>
							<td><input type="text" name="receivable" id="receivable" style="border: none;font-size: 1.4rem" placeholder="请输入."/></td>
						</tr>
						<tr>
							<td style="font-size: 1.4rem">产成品存货</td>
							<td><input type="text" name="inventory" id="inventory" style="border: none;font-size: 1.4rem" placeholder="请输入."/></td>
						</tr>
						<tr>
							<td>两项资金合计</td>
							<td></td>
						</tr>
						<tr>
							<td style="font-size: 1.4rem">资产总计</td>
							<td><input type="text" name="assets" id="assets" style="border: none;font-size: 1.4rem" placeholder="请输入."/></td>
						</tr>
						<tr>
							<td style="font-size: 1.4rem">负债总计</td>
							<td><input type="text" name="debt" id="debt" style="border: none;font-size: 1.4rem" placeholder="请输入."/></td>
						</tr>
					</tbody>
			  </table>
		</form>
		<button type="button" class="am-btn am-btn-primary am-hide" data-am-modal-cancel>确定</button>
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
    </div>
  </div>
</script>

<script class="template EnergyEPList" type="text/x-jquery-tmpl">
{{~ it.data: data :index}}
<tr class="table-tr">
	<td><input type='checkbox' class='box' name='box'/></td>
	<td>{{=index+1}}</td>
	<td class="">{{=data.monthly || ""}}</td>
	<td class="am-text-primary">{{=data.energy_current.electricity || "-"}}</td>
	<td>{{=data.energy_lastYear != null ? data.energy_lastYear.electricity : "-"}}</td>
	<td>{{=data.electricity_yearGrowth !=null ? (data.electricity_yearGrowth*100).toFixed(2): "-"}}</td>
	<td>{{=data.electricity_monthGrowth !=null ? (data.electricity_monthGrowth*100).toFixed(2) : "-"}}</td>
	<td class="am-text-primary">{{=data.energy_current.gas || "-"}}</td>
	<td>{{=data.energy_lastYear != null ? data.energy_lastYear.gas : "-"}}</td>
	<td>{{=data.gas_yearGrowth !=null ? (data.gas_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td>{{=data.gas_monthGrowth !=null ? (data.gas_monthGrowth*100).toFixed(2) : "-"}}</td>
</tr>
{{~}}
</script>

<script class="template BenefitList" type="text/x-jquery-tmpl">
{{~ it.data: data : index}}
<tr class="table-tr">
	<td><input type='radio' class='box' name='box' value="{{=data.benefit_current != null ? data.benefit_current.id : ""}}"/></td>
	<td id="{{=data.benefit_current != null ? data.benefit_current.id : ""}}">{{=index+1}}</td>
	<td>{{=data.monthly}}</td>
	<td status="{{=data.benefit_current != null ? data.benefit_current.status : ""}}">
		{{if(data.benefit_current != null && data.benefit_current.status == 1) { }}
			{{="待审核" }}
		{{ } else if(data.benefit_current != null && data.benefit_current.status == 2) { }}
			{{="通过"}}
		{{ } else if(data.benefit_current != null && data.benefit_current.status == -1) { }}
			{{="驳回"}}
		{{ } else if(data.benefit_current != null && data.benefit_current.status == 0){ }}
			{{="待发送"}}
		{{ } }}
	</td>
	<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.flowAssets : "-"}}</td>
	<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.flowAssets : "-"}}</td>
	<td>{{=data.flowAssets_yearGrowth !=null ? (data.flowAssets_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.receivable : "-"}}</td>
	<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.receivable : "-"}}</td>
	<td>{{=data.receivable_yearGrowth !=null ? data.receivable_yearGrowth*100 : "-"}}</td>
	<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.inventory : "-"}}</td>
	<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.inventory : "-"}}</td>
	<td>{{=data.inventory_yearGrowth !=null ? (data.inventory_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.totleAssets : "-"}}</td>
	<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.totleAssets : "-"}}</td>
	<td>{{=data.totleAssets_yearGrowth !=null ? (data.totleAssets_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.assets : "-"}}</td>
	<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.assets : "-"}}</td>
	<td>{{=data.assets_yearGrowth !=null ? (data.assets_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.debt : "-"}}</td>
	<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.debt : "-"}}</td>
	<td>{{=data.debt_yearGrowth !=null ? (data.debt_yearGrowth*100).toFixed(2) : "-"}}</td>
</tr>
{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "EnergyEP";
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
					if(tab == "tab1"){
						self.load();
					} else if(tab == "tab2"){
						self.getBenefitList();
					}
				})
				.on("click", ".export-btn", function() {
					var tab = $(this).closest(".am-tab-panel").attr("id");
					var type ;
					if(tab == "tab1") {
						type = 16;
					} else {
						type = 17;
					}
					location.href = "reportForm/exportByEnterpriseId?enterpriseId=" + $tar.find("#enterpriseId").val() + "&type=" + type;
				})
				.on("click", ".benefit-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html($(".template.BenefitDialog").doT());
					self.getBenefitValidate($dialog);
					self.datetimepicker($dialog.find("#monthly"));
					$dialog.modal({
						closeViaDimmer: false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							var $benefitInputForm = $dialog.find("#benefit-input-form");
							if ($benefitInputForm.valid()) {  
								$.ajax({
									url: "benefit/add",
									type: "POST",
									data:{
										monthly: $dialog.find("#monthly").val(),
										enterpriseId: $tar.find("#enterpriseId").val(),
										assets: $benefitInputForm.find("#assets").val(),
										debt: $benefitInputForm.find("#debt").val(),
										inventory: $benefitInputForm.find("#inventory").val(),
										receivable: $benefitInputForm.find("#receivable").val()
									},
									success: function(data) {
										if(data.status == 3) {
											$tar.find(".warningTr").removeClass("am-hide");
											setTimeout(function() {
												$tar.find(".warningTr").addClass("am-hide");
											}, 1000);
											return;
										}
										self.getBenefitList();
										$modal.close($dialog.remove());
									},
									error: function(err) {}
								});
							}else{
								return;
							}
						},
						onCancel: function() {
							this.close($dialog.remove());
						}
					});
				})
				.on("click", ".benefit-update-btn", function() {
					var id = $k.util.trChecked("benefit");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "benefit/detail",
						type: "POST",
						data:{ benefitId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html($(".template.BenefitDialog").doT());
							self.getBenefitValidate($dialog);
							self.datetimepicker($dialog.find("#monthly"));
							$.each(data.data, function(key, val) {
								$dialog.find("[name='"+key+"']").val(val);
							});
							$dialog.find("[name='monthly']").attr("disabled", "disabled");
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $benefitInputForm = $dialog.find("#benefit-input-form");
									if ($benefitInputForm.valid()) {  
										$.ajax({
											url: "benefit/edit",
											type: "POST",
											data:{
												benefitId: id,
												monthly: $dialog.find("#monthly").val(),
												enterpriseId: $tar.find("#enterpriseId").val(),
												assets: $benefitInputForm.find("#assets").val(),
												debt: $benefitInputForm.find("#debt").val(),
												inventory: $benefitInputForm.find("#inventory").val(),
												receivable: $benefitInputForm.find("#receivable").val()
											},
											success: function(data) {
												self.getBenefitList();
												$modal.close($dialog.remove());
											},
											error: function(err) {}
										});
									}else{
										return;
									}
								},
								onCancel: function() {
									this.close($dialog.remove());
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".benefit-send-btn", function() {
					var id = $k.util.trChecked("benefit");
					if (id == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: "确定将该条数据上报吗?"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: 'benefit/report',
								type: "POST",
								data: { benefitId: id, },
								success: function(data) {
									if (data.status == 0) {
										self.getBenefitList();
										$modal.close($dialog.remove());
									}
								},
								error: function(err) {}
							});
						},
						onCancel: function() {
							this.close($dialog.remove());
						}
					});
				})
				.on("click", ".benefit-delete-btn", function() {
					var ids = $k.util.trOperateChecked("benefit");
					if (ids == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: "确定要删除此数据吗?"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: 'benefit/delete',
								type: "POST",
								data: { benefitIds: ids.toString(), },
								success: function(data) {
									if (data.status == 0) {
										self.getBenefitList();
										$modal.close($dialog.remove());
									}
								},
								error: function(err) {}
							});
						},
						onCancel: function() {
							this.close($dialog.remove());
						}
					});
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
				.on("click", " #benefit .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					$tar.find(".am-btn").removeClass("am-disabled");
					$tar.find("#benefit-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					var status = $this.closest("tr").find("td[status]").attr("status");
					if(status == "1" || status == "2") {
						$tar.find(".benefit-update-btn").addClass("am-disabled");
						$tar.find(".benefit-send-btn").addClass("am-disabled");
						$tar.find(".benefit-delete-btn").addClass("am-disabled");
						$tar.find(".benefit-target-btn").addClass("am-disabled");
					}
				})
				.on("click", "#energy-table .table-tr, #benefit-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				});
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				self.$tar.html(self.$tempTar.doT());
				$('[data-am-selected]').selected();
				return self;
			}
		},
		load: {
			value: function(){
				var self = this;
				self.$tar.find("#energy-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if(enterpriseData.data != null  && enterpriseData.data.length != 0) {
							self.$tar.find("#enterpriseId").val(enterpriseData.data.id);
							$.ajax({
								url: "energy/listByEnterpriseId",
								type: "POST",
								data: {
									enterpriseId: enterpriseData.data.id
								},
								success: function(data) {
									self.$tar.find("#energy-table").find("tbody").html(
										$(".template.EnergyEPList").doT({
											data: data.data
										})
									);
									self.datatables = self.$tar.find("#energy-table").dataTable();
								},
								error: function(err) {}
							});
						} else {
							self.datatables = self.$tar.find("#energy-table").dataTable();
						}
					}
				});
				return self;
			}
		},
		getBenefitList: {
			value: function(){
				var self = this;
				self.$tar.find("#benefit-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "benefit/listByEnterpriseId",
					type: "POST",
					data: {
						enterpriseId: self.$tar.find("#enterpriseId").val()
					},
					success: function(data) {
						self.$tar.find("#benefit-table").find("tbody").html(
							$(".template.BenefitList").doT({
								data: data.data
							})
						);
						self.datatables = self.$tar.find("#benefit-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getBenefitValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#benefit-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  monthly: "required",
				    	  debt: {
				    		  required: true,
				    		  number: true
				    	  },
				    	  receivable: {
				    		  required: true,
				    		  number: true
				    	  },
				    	  inventory: {
				    		  required: true,
				    		  number: true
				    	  },
				    	  assets: {
				    		  required: true,
				    		  number: true
				    	  }
				      }
			    });
				return validatorr;
			}
		},
		datetimepicker: {
			value: function($obj) {
				var self = this;
				$obj.datetimepicker( {
				      lang: "ch",           //语言选择中文
				      format: "Y-m",   //格式化日期
				      timepicker: false,
				      scrollInput: false,
				      onShow: function() {
						$(this).find(".xdsoft_calendar").addClass("am-hide");
				      },
				      onChangeMonth: function(currentDateTime) {
				    	  $obj.val(currentDateTime.format("yyyy-mm"));
				      } 
				});
				return self;
			}
		}
	});
})( jQuery );
</script>
