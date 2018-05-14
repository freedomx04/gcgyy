<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EnergyGV" type="text/x-jquery-tmpl">
<div class="admin-content" style="height:initial!important;">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">信息直报系统</strong></div>
	</div>

	<div class="am-tabs" data-am-tabs>
		<ul class="am-tabs-nav am-nav am-nav-tabs">
			<li class="am-active" tab="tab1"><a href="#tab1">能源消耗</a></li>
			<li tab="tab2"><a href="#tab2">效益指标月报表</a></li>
		</ul>

		<div class="am-tabs-bd">
	    	<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
	    		<div class="am-g">
			  		<div class="am-u-sm-12 am-margin-bottom" style="display: table; border-bottom: 1px solid #ccc;">
						<div class="padding-left-o am-inline-block" style="display: table-cell!important; vertical-align: middle;">
							<button type="button" class="am-btn am-btn-sm template-btn">报表模板下载</button>
						</div>
						<form id="importEnergy-file-form">
							<div class="padding-right-o am-fr">
								<div class="am-form-file am-inline-block am-fr">
									<label class="am-form-label am-text-primary am-text-sm">导入Excel：</label>
		  							<button type="button" class="am-btn am-btn-default am-btn-sm">
		    						<i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
		  							<input type="file" id="importEnergy-file-input" name="uploadfile" accept=".xls, .xlsx, .xlsm">
								</div>
								<div class="am-text-danger am-text-sm" style="margin-bottom: 5px;clear:both;">注意:请下载模版，并保持模版原样填写有效数据后导入!</div>
							</div>
						</form>
			  		</div>
			  		<div class="am-u-sm-12">
						<div class="am-u-sm-3 padding-left-o">
							<select class="searchType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
								<option value="1">企业明细</option>
								<option value="2">产业明细</option>
								<option value="3">园区明细</option>
							</select>
						</div>
						<div class="am-u-sm-2 am-u-sm-offset-4 padding-right-o am-text-right">
							<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">月报表时间：</label>
						</div>
						<div class="am-u-sm-3 am-u-end padding-horizontal-o">
							<input type="text" id="" class="am-form-field datetimepicker am-input-sm monthly"/>
						</div>
			  		</div>
		      		<div class="am-u-sm-12">
						<div class="am-btn-toolbar am-fl">
		   					<div class="am-btn-group am-btn-group-xs">
		     					<button type="button" class="am-btn am-btn-default energy-add-btn"><span class="am-icon-plus"></span> 新增</button>
		     					<button type="button" class="am-btn am-btn-default energy-update-btn"><span class="am-icon-save"></span> 编辑</button>
		     					<button type="button" class="am-btn am-btn-default energy-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
								<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
		   					</div>
  						</div>
				        <form id="energy" class="am-cf">
			          		<table class="am-table am-table-striped am-table-hover table-main" id="energy-table" style="width:100%;">
			            		<thead>
			              			<tr>
			                			<th></th>
			                			<th class="table-id">序号</th>
										<th class="table-name">企业名称</th>
			                			<th>本月用电</th>
										<th>去年同月</th>
										<th>同比增长%</th>
										<th>环比增长%</th>
			                			<th>本月用气</th>
										<th>去年同月</th>
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
					<div class="am-u-sm-12">
						<div class="am-u-sm-3 padding-left-o">
							<select class="searchType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
								<option value="1">企业明细</option>
								<option value="2">产业明细</option>
								<option value="3">园区明细</option>
							</select>
						</div>
						<div class="am-u-sm-2 am-u-sm-offset-4 padding-right-o am-text-right">
							<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">月报表时间：</label>
						</div>
						<div class="am-u-sm-3 am-u-end padding-horizontal-o">
							<input type="text" id="" class="am-form-field datetimepicker am-input-sm monthly"/>
						</div>
			  		</div>
					<div class="am-u-sm-12 am-scrollable-horizontal">
						<div class="am-btn-toolbar am-fl">
 							<div class="am-btn-group am-btn-group-xs">
								<button type="button" class="am-btn am-btn-default benefit-pass-btn"><span class="am-icon-save"></span> 通过</button>
								<button type="button" class="am-btn am-btn-default benefit-reject-btn"><span class="am-icon-save"></span> 驳回</button>
								<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
 							</div>
						</div>
						<form id="benefit">
			          		<table class="am-table am-table-striped am-table-hover table-main am-text-nowrap" id="benefit-table">
			       			</table>
				        </form>
					</div>
				</div>
	    	</div>
	  	</div>
	</div>
</div>
</script>

<script class="template EnergyGVDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	能源消耗
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd" style="overflow:auto;max-height:500px">
	    <form class="am-form am-form-horizontal" id="energy-input-form">
	    	  <input name="id" id="id" type="text" class="am-hide"/>

			 <div class="am-form-group">
				<label for="userId" class="am-u-sm-4 am-form-label font-normal">企业名称:</label>
				<div class="am-u-sm-8 padding-left-o">
		    		<select name="enterpriseId" id="enterpriseId" class="am-form-field" data-am-selected="{searchBox: 1}">
						<option value="" selected>请选择</option>
						{{~ it.enterpriseData: enterprise}}	
						<option value="{{=enterprise.id}}">{{=enterprise.name}}</option>
						{{~}}
					</select>
				</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-4 am-form-label font-normal">年月:</label>
			    <div class="am-u-sm-8 padding-left-o">
				     <input type="text" name="monthly" id="monthly" class="am-form-field datetimepicker" />
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-4 am-form-label font-normal">用电量(度):</label>
			    <div class="am-u-sm-8 padding-left-o">
				     <input type="text" name="electricity" id="electricity" class="am-form-field" />
		     	</div>
			  </div>
			  
			 <div class="am-form-group">
			    <label for="" class="am-u-sm-4 am-form-label font-normal">用气量(立方米):</label>
			    <div class="am-u-sm-8 padding-left-o">
				     <input type="text" name="gas" id="gas" class="am-form-field" />
		     	</div>
			  </div>
		</form>
		<button type="button" class="am-btn am-btn-primary am-hide" data-am-modal-cancel>确定</button>
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
    </div>
  </div>
</script>

<script class="template EnergyGVList" type="text/x-jquery-tmpl">
{{~ it.data:data : index}}
<tr class="table-tr">
	<td><input type='radio' class='box' name='box'/></td>
	<td  id="{{=data.energy_current != null ? data.energy_current.id : ""}}">{{=index+1}}</td>
	{{ if(it.searchType == "1") { }}
		<td class="td-title ellipsis" title="{{=data.enterprise.name}}">{{=data.enterprise!=null ? data.enterprise.name : ""}}</td>
	{{ } else if(it.searchType == "2"){ }}
		<td class="td-title ellipsis" title="{{=data.productType.name}}">{{=data.productType!=null ? data.productType.name : ""}}</td>
	{{ } else{ }}
		<td class="td-title ellipsis" title="{{=data.area.name}}">{{=data.area!=null ? data.area.name : ""}}</td>
	{{ } }}
	<td status="{{=data.energy_current==null ? "0" : ""}}" class="am-text-primary">{{=data.energy_current != null ? data.energy_current.electricity : "-"}}</td>
	<td>{{=data.energy_lastYear != null ? data.energy_lastYear.electricity : "-"}}</td>
	<td>{{=data.electricity_yearGrowth !=null ? (data.electricity_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td>{{=data.electricity_monthGrowth !=null ? (data.electricity_monthGrowth*100).toFixed(2) : "-"}}</td>
	<td class="am-text-primary">{{=data.energy_current != null ? data.energy_current.gas : "-"}}</td>
	<td>{{=data.energy_lastYear != null ? data.energy_lastYear.gas : "-"}}</td>
	<td>{{=data.gas_yearGrowth !=null ? (data.gas_yearGrowth*100).toFixed(2) : "-"}}</td>
	<td>{{=data.gas_monthGrowth !=null ? (data.gas_monthGrowth*100).toFixed(2) : "-"}}</td>
</tr>
{{~}}
</script>

<script class="template BenefitGVList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th colspan="9" class="am-text-center">流动资产合计</th>
		<th colspan="9" class="am-text-center">两项资产合计</th>
	</tr>
	<tr>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th colspan="3"></th>
		<th colspan="3" class="am-text-center">其中：应收账款</th>
		<th colspan="3" class="am-text-center">产存品存货</th>
		<th colspan="3"></th>
		<th colspan="3" class="am-text-center">资产累计</th>
		<th colspan="3" class="am-text-center">负债累计</th>
	</tr>
	<tr>
		<th></th>
		<th class="table-id">序号</th>
		{{ if(it.searchType == "1") { }}
		<th class="table-name">
		企业名称
		</th>
		<th>状态</th>
		{{ } else if(it.searchType == "2") { }}
		<th class="table-name">
		产业名称
		</th>
		{{ } else if(it.searchType == "3") { }}
		<th class="table-name">
		园区名称
		</th>
		{{ } }}
		<th>本月累计</th>
		<th>上年同期</th>
		<th>同比增幅%</th>
		<th>本月</th>
		<th>上年同期</th>
		<th>同比增幅%</th>
		<th>本月</th>
		<th>上年同期</th>
		<th>同比增幅%</th>
		<th>本月累计</th>
		<th>上年同期</th>
		<th>同比增幅%</th>
		<th>本月</th>
		<th>上年同期</th>
		<th>同比增幅%</th>
		<th>本月</th>
		<th>上年同期</th>
		<th>同比增幅%</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: data :index}}
	<tr class="table-tr">
		<td><input type='radio' class='box' name='box'/></td>
		<td id="{{=data.benefit_current != null ? data.benefit_current.id : ""}}">{{=index+1}}</td>
		{{ if(it.searchType == "1") { }}
			<td class="td-title ellipsis" title="{{=data.enterprise.name}}">{{=data.enterprise!=null ? data.enterprise.name : ""}}</td>
			<td status="{{=data.benefit_current !=null ? data.benefit_current.status : ""}}">
				{{if(data.benefit_current !=null && data.benefit_current.status == 1) { }}
					{{="待审核" }}
				{{ } else if(data.benefit_current !=null && data.benefit_current.status == 2) { }}
					{{="通过"}}
				{{ } else if(data.benefit_current !=null && data.benefit_current.status == -1) { }}
					{{="驳回"}}
				{{ } else if(data.benefit_current !=null && data.benefit_current.status == 0){ }}
					{{="待发送"}}
				{{ } }}
			</td>
		{{ } else if(it.searchType == "2"){ }}
			<td class="td-title ellipsis" title="{{=data.productType.name}}">{{=data.productType!=null ? data.productType.name : ""}}</td>
		{{ } else{ }}
			<td class="td-title ellipsis" title="{{=data.area.name}}">{{=data.area!=null ? data.area.name : ""}}</td>
		{{ } }}
		<td status="{{=data.benefit_current == null ? "0" : ""}}" class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.flowAssets : "-"}}</td>
		<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.flowAssets : "-"}}</td>
		<td>{{=data.flowAssets_yearGrowth !=null ? (data.flowAssets_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.receivable : "-"}}</td>
		<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.receivable : "-"}}</td>
		<td>{{=data.receivable_yearGrowth !=null ? (data.receivable_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.inventory : "-"}}</td>
		<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.inventory : "-"}}</td>
		<td>{{=data.inventory_yearGrowth !=null ? (data.inventory_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.totleAssets : "-"}}</td>
		<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.totleAssets : "-"}}</td>
		<td>{{=data.totleAssets_yearGrowth !=null ? (data.totleAssets_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary">{{=data.benefit_current !=null ? data.benefit_current.assets : "-"}}</td>
		<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.assets : "-"}}</td>
		<td>{{=data.assets_yearGrowth !=null ? (data.assets_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary">{{=data.benefit_current !=null ? data.benefit_current.debt : "-"}}</td>
		<td>{{=data.benefit_lastYear!=null ? data.benefit_lastYear.debt : "-"}}</td>
		<td>{{=data.debt_yearGrowth !=null ? (data.debt_yearGrowth*100).toFixed(2) : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "EnergyGV";
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
					$tar.find("#" +tab).find('.am-selected-status').html("企业明细");
					$tar.find("#" +tab).find(".am-selected-list").find("li").removeClass("am-checked");
					$tar.find("#" +tab).find(".am-selected-list").find("li").first().addClass("am-checked");
					$tar.find("#" +tab +" .searchType").val("1");
					$tar.find("#" +tab +" .monthly").val(now.format("yyyy-mm"));
					if(tab == "tab1"){
						self.load();
					} else if(tab == "tab2"){
						self.getBenefitList();
					}
				})
				.on("click", ".export-btn", function() {
					var tab = $(this).closest(".am-tab-panel").attr("id");
					var monthly = $tar.find("#"+tab+" .monthly").val();
					var searchType = $tar.find("#"+tab+" .searchType").val();
					var type ;
					if(tab == "tab1") {
						if(searchType == "1") {
							type = 1;
						} else if(searchType == "2") {
							type = 2 ;
						} else if(searchType == "3") {
							type = 3;
						}
					} else {
						if(searchType == "1") {
							type = 4;
						} else if(searchType == "2") {
							type = 5 ;
						} else if(searchType == "3") {
							type = 6;
						}
					}
					location.href = "reportForm/export?monthly=" + monthly + "&type=" + type;
				})
				.on("click", ".template-btn", function() {
					var monthly = $tar.find("#tab1 .monthly").val();
					location.href = "reportForm/template?monthly=" + monthly + "&type=1";
				})
				.on("change", ".searchType", function() {
					var tab = $tar.find(".am-tabs-nav li[class='am-active']").attr("tab");
					var $tab = $tar.find("#"+tab);
					if(tab == "tab1") {
						if($(this).val() == "1") {
							$tab.find("#energy-table").find("th.table-name").html("企业名称");
							$tab.find(".am-btn-toolbar .am-btn").not(".export-btn").removeClass("am-hide");
						} else if($(this).val() == "2") {
							$tab.find("#energy-table").find("th.table-name").html("产业名称");
							$tab.find(".am-btn-toolbar .am-btn").not(".export-btn").addClass("am-hide");
						} else if($(this).val() == "3") {
							$tab.find("#energy-table").find("th.table-name").html("园区名称");
							$tab.find(".am-btn-toolbar .am-btn").not(".export-btn").addClass("am-hide");
						}
						self.load();
					} else if(tab == "tab2") {
						if($(this).val() == "1") {
							$tab.find(".am-btn-toolbar .am-btn").not(".export-btn").removeClass("am-hide");
						} else {
							$tab.find(".am-btn-toolbar .am-btn").not(".export-btn").addClass("am-hide");
						}
						self.getBenefitList();						
					}
				})
				.on("click", ".energy-add-btn", function() {
					$k.util.getEnterpriseList({
						success: function(enterpriseData){
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT({
								enterpriseData: enterpriseData.data
							}));
							self.getValidate($dialog);
							$('[data-am-selected]').selected();
							self.datetimepicker($dialog.find("#monthly"));
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $energyInputForm = $dialog.find("#energy-input-form");
									var monthly = $energyInputForm.find("#monthly").val();
									if ($energyInputForm.valid()) {  
										$.ajax({
											url: "energy/add",
											type: "POST",
											data:{
												monthly: monthly,
												enterpriseId: $energyInputForm.find("#enterpriseId").val(),
												electricity: $energyInputForm.find("#electricity").val(),
												gas: $energyInputForm.find("#gas").val()
											},
											success: function(data) {
												if(data.status == 3) {
													$dialog.find("#monthly").next().removeClass("success").text("该月份记录已存在！");
													return;
												}
												self.load(monthly);
												$tar.find("#tab1").find(".monthly").val(monthly);
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
						}
					});
				})
				.on("click", ".energy-update-btn", function() {
					var id = $k.util.trChecked("energy");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "energy/detail",
						type: "POST",
						data:{ energyId: id },
						success: function(data) {
							$k.util.getEnterpriseList({
								success: function(enterpriseData){
									var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
									$dialog.html(self.$tempDialogTar.doT({
										enterpriseData: enterpriseData.data
									}));
									self.getValidate($dialog);
									$('[data-am-selected]').selected();
									self.datetimepicker($dialog.find("#monthly"));
									$.each(data.data, function(key, val) {
										if(key == "enterprise") {
											$dialog.find("#enterpriseId").find('option[value="'+val.id+'"]').attr('selected', true);
										} else {
											$dialog.find("[name='"+key+"']").val(val);
										}
									});
									$dialog.find(".am-selected-list").off("click", "> li");
									$dialog.find("[name='monthly']").attr("disabled", "disabled");
									$dialog.modal({
										closeViaDimmer: false,
										closeOnConfirm: false,
										onConfirm: function(e) {
											var $modal = this;
											var $energyInputForm = $dialog.find("#energy-input-form");
											if ($energyInputForm.valid()) {  
												$.ajax({
													url: "energy/edit",
													type: "POST",
													data:{
														energyId: $energyInputForm.find("#id").val(),
														monthly: $energyInputForm.find("#monthly").val(),
														enterpriseId: $energyInputForm.find("#enterpriseId").val(),
														electricity: $energyInputForm.find("#electricity").val(),
														gas: $energyInputForm.find("#gas").val()
													},
													success: function(data) {
														self.load();
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
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".benefit-pass-btn, .benefit-reject-btn", function() {
					var id = $k.util.trChecked("benefit");
					if (id == null){
						return;
					}
					var content = "";
					var url = "";
					if($(this).hasClass("benefit-pass-btn")) {
						content = "确定该条数据审核通过吗?";
						url = 'benefit/pass';
					} else {
						content = "确定驳回该条数据吗?";
						url = 'benefit/reject';
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: content
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: url,
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
				.on("click", ".energy-delete-btn", function() {
					var ids = $k.util.trOperateChecked("energy");
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
								url: 'energy/delete',
								type: "POST",
								data: { energyIds: ids.toString(), },
								success: function(data) {
									if (data.status == 0) {
										self.load();
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
				.on("change", "#importEnergy-file-input", function() {
					$.ajax({
						url: "reportForm/importEnergy",
						type: "POST",
						data: new FormData($("#importEnergy-file-form")[0]),
						enctype : 'multipart/form-data',
						processData: false,
						contentType: false,
						cache: false,
						success: function(data) {
							if(data.status != 0) {
								$k.util.alertModal("上传数据格式不正确，请重新上传！");
							} else {
								self.load($tar.find("#tab1 .monthly").val());
							}
						},
						error: function(data) {
						}
					});
				})
				.on("click", "#energy-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					$tar.find("#tab1 .am-btn").removeClass("am-disabled");
					$tar.find("#energy-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					var status = $this.closest("tr").find("td[status]").attr("status");
					if(status == "0") {
						$tar.find(".energy-update-btn").addClass("am-disabled");
						$tar.find(".energy-delete-btn").addClass("am-disabled");
					}
				})
				.on("click", "#benefit-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					$tar.find(".am-btn").removeClass("am-disabled");
					$tar.find("#benefit-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					var status = $this.closest("tr").find("td[status]").attr("status");
					if(status != "1") {
						$tar.find(".benefit-pass-btn").addClass("am-disabled");
						$tar.find(".benefit-reject-btn").addClass("am-disabled");
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
				var now = new Date();
				now.setMonth(now.getMonth() - 1);
				self.$tar.html(self.$tempTar.doT());
				$('[data-am-selected]').selected();
				self.$tar.find(".monthly").val(now.format("yyyy-mm"));
				return self;
			}
		},
		load: {
			value: function(monthly){
				var self = this;
				var url = "";
				var searchType = self.$tar.find("#tab1 .searchType").val();				
				self.datetimepicker(self.$tar.find("#tab1 .monthly"));
				if(searchType == "1") {
					url = "energy/listByMonthly";
				} else if(searchType == "2") {
					url = "energy/listByProductType";
				} else {
					url = "energy/listByArea";
				}
				var monthlyVal = null;
				if(monthly == null || monthly == "") {
					monthlyVal = self.$tar.find("#tab1").find(".monthly").val();
				} else {
					monthlyVal = monthly;
				}
				self.$tar.find("#energy-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: url,
					type: "POST",
					data: {
						monthly: monthlyVal,
					},
					success: function(data) {
						self.$tar.find("#energy-table").find("tbody").html(
							$(".template.EnergyGVList").doT({
								data: data.data,
								searchType: searchType
							})
						);
						self.datatables = self.$tar.find("#energy-table").dataTable({
							"dom": '<"datatable-header"<"dataTables_filter">l><"datatable-scroll"t><"datatable-footer"ip>',
							//"searchable": false,//不能加，不然会影响search方法
							initComplete: function(settings) {
								var searchHTML = '<label style="font-size: 1.5rem;">搜索:</label> <input type="search" class="am-form-field am-input-sm am-inline-block" style="width: 60%;font-size:1.2rem!important;" placeholder="关键字搜索..." aria-controls="datatable1">';
								self.$tar.find('#energy .dataTables_filter').append(searchHTML); //快捷操作的HTML DOM
								/** 重写搜索事件 **/
								$('.dataTables_filter input').bind('keyup',
								function(e) {
									self.datatables.fnFilter(this.value);
								});
							}
						});
						self.$tar.find(".dataTables_filter").css("width", "41.5%");
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getBenefitList: {
			value: function(monthly){
				var self = this;
				var url = "";
				var searchType = self.$tar.find("#tab2 .searchType").val();
				self.datetimepicker(self.$tar.find("#tab2 .monthly"));
				if(searchType == "1") {
					url = "benefit/listByMonthly";
				} else if(searchType == "2") {
					url = "benefit/listByProductType";
				} else {
					url = "benefit/listByArea";
				}
				var monthlyVal = null;
				if(monthly == null || monthly == "") {
					monthlyVal = self.$tar.find("#tab2").find(".monthly").val();
				} else {
					monthlyVal = monthly;
				}
				self.$tar.find("#benefit-table").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: url,
					type: "POST",
					data: {
						monthly: monthlyVal
					},
					success: function(data) {
						self.$tar.find("#benefit-table").html(
								$(".template.BenefitGVList").doT({
									data: data.data,
									searchType: searchType
								})
						);
						 self.datatables = self.$tar.find("#benefit-table").dataTable({
							"dom": '<"datatable-header"<"dataTables_filter">l><"datatable-scroll"t><"datatable-footer"ip>',
							//"searchable": false,//不能加，不然会影响search方法
							initComplete: function(settings) {
								var searchHTML = '<label style="font-size: 1.5rem;">搜索:</label> <input type="search" class="am-form-field am-input-sm am-inline-block" style="width: 60%;font-size:1.2rem!important;" placeholder="关键字搜索..." aria-controls="datatable2">';
								self.$tar.find('#benefit .dataTables_filter').append(searchHTML); //快捷操作的HTML DOM
								/** 重写搜索事件 **/
								$('.dataTables_filter input').bind('keyup',
								function(e) {
									self.datatables.fnFilter(this.value);
								});
							}
						});
						self.$tar.find(".dataTables_filter").css("width", "41.5%"); 
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#energy-input-form").validate({
				      errorElement: "em",
				      errorPlacement: function(error, element) { //指定错误信息位置
				    	  if (element.is('#enterpriseId') ) { //如果是radio或checkbox
					    	  error.appendTo(element.next(".am-selected")); //将错误信息添加当前元素的父结点后面
				    	  } else {
				    	  	  error.insertAfter(element);
				    	  }
			    	  }, 
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  enterpriseId: "required",
				    	  monthly: "required",
				    	  electricity: {
				    		  required: true,
				    		  number: true
				    	  },
				    	  gas: {
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
				      onShow: function() {
						$(this).find(".xdsoft_calendar").addClass("am-hide");
				      },
				      scrollInput: false,
				      onChangeMonth: function(currentDateTime) {
				    	  $obj.val(currentDateTime.format("yyyy-mm"));
				    	  if($obj.hasClass("monthly")) {
					    	  var tab = $obj.closest(".am-tab-panel").attr("id");
				    		 // var $tab = self.$tar.find("#" + tab);
				    		 // $tab.find('.searchType option').removeAttr('selected');
							  //$tab.find('.searchType option[value="1"]').attr('selected', true);
					    	  if(tab == "tab1"){
								  self.load($obj.val());
							  } else if(tab == "tab2"){
									self.getBenefitList($obj.val());
							  }
				    	  }
				      } 
				});
				return self;
			}
		}
	});
})( jQuery );
</script>
