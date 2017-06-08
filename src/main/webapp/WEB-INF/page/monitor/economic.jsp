<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Economic" type="text/x-jquery-tmpl">
<div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">工业增加值与主营业务收入</strong></div>
    </div>

	<input name="enterpriseId" id="enterpriseId" type="text" class="am-hide"/>

   	<div class="am-g">
		{{ if(it.resource.indexOf('agency_department') > -1) {　}}
		<div class="am-u-sm-12">
			<div class="am-u-sm-3 padding-left-o">
				<select class="searchType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
					<option value="1" selected>企业明细</option>
					<option value="2">产业明细</option>
					<option value="3">园区明细</option>
				</select>
			</div>
			<div class="am-u-sm-2 am-u-sm-offset-5 padding-right-o am-text-right">
				<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">月报表时间：</label>
			</div>
			<div class="am-u-sm-2 am-u-end padding-horizontal-o">
				<input type="text" class="am-form-field datetimepicker am-input-sm monthly"/>
			</div>
		</div>
		{{ } }}
		<div class="am-u-sm-12 am-scrollable-horizontal">
			{{ if(it.resource.indexOf('agency_enterprise') > -1) { }}
			<div class="am-btn-toolbar am-fl">
		   		<div class="am-btn-group am-btn-group-xs">
					<button type="button" class="am-btn am-btn-default economic-target-btn"><span class="am-icon-plus"></span> 设置年度目标数</button>
					<button type="button" class="am-btn am-btn-default economic-add-btn"><span class="am-icon-plus"></span> 新增</button>
			     	<button type="button" class="am-btn am-btn-default economic-update-btn"><span class="am-icon-save"></span> 编辑</button>
			     	<button type="button" class="am-btn am-btn-default economic-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
					<button type="button" class="am-btn am-btn-default economic-send-btn"><span class="am-icon-plus"></span> 发送</button>
					<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
		   		</div>
	  		</div>
			{{ } else{ }}
			<div class="am-btn-toolbar am-fl">
		   		<div class="am-btn-group am-btn-group-xs">
					<button type="button" class="am-btn am-btn-default economic-pass-btn"><span class="am-icon-plus"></span> 通过</button>
		     		<button type="button" class="am-btn am-btn-default economic-reject-btn"><span class="am-icon-save"></span> 驳回</button>
					<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
		   		</div>
	  		</div>
			{{ } }}
			<form id="economic">
	      		<table class="am-table am-table-striped am-table-hover table-main am-text-nowrap" id="economic-table">
	   			</table>
	        </form>
		</div>
   </div>
</div>
</script>

<script class="template EconomicDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	经济运行状况
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd" style="overflow:auto;max-height:500px">
	    <form class="am-form am-form-horizontal" id="economic-input-form">
	    	  <input name="id" id="id" type="text" class="am-hide"/>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">年月:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="monthly" id="monthly" class="am-form-field datetimepicker" />
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">工业增加值:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="industryAddition" id="industryAddition" class="am-form-field" />
		     	</div>
			  </div>
			  
			 <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">主营业务收入:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="mainBusiness" id="mainBusiness" class="am-form-field" />
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">利润总额:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="profit" id="profit" class="am-form-field" />
		     	</div>
			  </div>

			 <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">税金总额:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="tax" id="tax" class="am-form-field" />
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

<script class="template EconomicTargetDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	年度目标数
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd" style="overflow:auto;max-height:500px">
	    <form class="am-form am-form-horizontal" id="economic-target-input-form">
	    	  <input name="id" id="id" type="text" class="am-hide"/>

			  <div class="am-form-group">
				 	<label for="year" class="am-u-sm-3 am-form-label font-normal">年份:</label>
					<div class="am-u-sm-9 padding-left-o">
		    			 <select name="year" id="year" class="am-form-field">
							<option value="" selected>请选择</option>
							{{ for(var i=1990; i<2050; i++) { }}	
							<option value="{{=i}}">{{=i}}</option>
							{{ } }}
						</select>
					</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">年度目标数:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="value" id="value" class="am-form-field" />
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

<script class="template EconomicList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th colspan="2" class="am-text-center">工业增加值</th>
		<th colspan="2" class="am-text-center">主营业务收入</th>
		<th colspan="2" class="am-text-center">利润总额</th>
		<th colspan="2" class="am-text-center">税金总额</th>
		<th colspan="5" class="am-text-center">本月止累计工业增加值</th>
		<th colspan="3" class="am-text-center">本月止累计主营业务收入</th>
	</tr>
	<tr>
		<th/></th>
	    <th class="table-id">序号</th>
	    {{ if(it.resource.indexOf('agency_enterprise') > -1) { }}
	    <th class="table-name">月份</th>
		{{ } else if(it.searchType == "2") { }}
		<th class="table-name">产业名称</th>
		{{ } else if(it.searchType == "3"){ }}
		<th class="table-name">园区名称</th>
		{{ } else { }}
		<th class="table-name">企业名称</th>
		{{ } }}
		<th>状态</th>
		<th>本月(元)</th>
		<th>比去年增长%</th>
		<th>本月(元)</th>
		<th>比去年增长%</th>
		<th>本月(元)</th>
		<th>比去年增长%</th>
		<th>本月(元)</th>
		<th>比去年增长%</th>
		<th>本月止工业增加值(元)</th>
		<th>去年同期止工业增加值(元)</th>
		<th>同比增减%</th>
		<th>工业增加值年度目标数(元)</th>
		<th>完成比例%</th>
		<th>本月止主营业务收入(元)</th>
		<th>去年同期止主营业务收入(元)</th>
		<th>同比增减%</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: data : index}}
	<tr class="table-tr">
		<td><input type='radio' class='box' name="box"/></td>
		<td id="{{=data.economic_current != null ? data.economic_current.id : ""}}">{{=index+1}}</td>
		{{ if(it.resource.indexOf('agency_enterprise') > -1) { }}
			<td>{{=data.economic_current !=null ? data.economic_current.monthly : ""}}</td>
		{{ } else if(it.searchType == "2") { }}
			<td class="td-title ellipsis">{{=data.productType != null ? data.productType.name : ""}}</td>
		{{ } else if(it.searchType == "3"){ }}
			<td class="td-title ellipsis">{{=data.area != null ? data.area.name : ""}}</td>
		{{ } else { }}
			<td class="td-title ellipsis">{{=data.enterprise != null ? data.enterprise.name : ""}}</td>
		{{ } }}
		<td status="{{=data.economic_current !=null ? data.economic_current.status : ""}}">
			{{if(data.economic_current !=null && data.economic_current.status == 1) { }}
				{{="待审核" }}
			{{ } else if(data.economic_current !=null && data.economic_current.status == 2) { }}
				{{="通过"}}
			{{ } else if(data.economic_current !=null && data.economic_current.status == -1) { }}
				{{="驳回"}}
			{{ } else if(data.economic_current !=null && data.economic_current.status == 0){ }}
				{{="待发送"}}
			{{ } }}
		</td>
		<td class="am-text-primary">{{=data.economic_current !=null ? data.economic_current.industryAddition : "-"}}</td>
		<td>{{=data.industryAddition_yearGrowth !=null ? (data.industryAddition_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary">{{=data.economic_current !=null ? data.economic_current.mainBusiness : "-"}}</td>
		<td>{{=data.mainBusiness_yearGrowth !=null ? (data.mainBusiness_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary">{{=data.economic_current !=null ? data.economic_current.profit : "-"}}</td>
		<td>{{=data.profit_yearGrowth !=null ? (data.profit_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary">{{=data.economic_current !=null ? data.economic_current.tax : "-"}}</td>
		<td>{{=data.tax_yearGrowth !=null ? (data.tax_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td class="am-text-primary">{{=data.industryAddition_current_endMonth}}</td>
		<td>{{=data.industryAddition_lastYear_endMonth}}</td>
		<td>{{=data.industryAddition_endMonth_yearGrowth !=null ? (data.industryAddition_endMonth_yearGrowth*100).toFixed(2) : "-"}}</td>
		<td target="{{=data.industryAddition_Target!=null ?data.industryAddition_Target.id : ""}}">{{=data.industryAddition_Target!=null ?data.industryAddition_Target.value : "-"}}</td>
		<td>{{=data.industryAddition_complete !=null ? (data.industryAddition_complete*100).toFixed(2) :　"-"}}</td>
		<td class="am-text-primary">{{=data.mainBusiness_current_endMonth}}</td>
		<td>{{=data.mainBusiness_lastYear_endMonth}}</td>
		<td>{{=data.mainBusiness_endMonth_yearGrowth !=null ? (data.mainBusiness_endMonth_yearGrowth*100).toFixed(2) : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "Economic";
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
					if($(this).val() == "1"){
						$tar.find(".am-btn-toolbar .am-btn").not(".export-btn").removeClass("am-hide");
					} else {
						$tar.find(".am-btn-toolbar .am-btn").not(".export-btn").addClass("am-hide");
					}
					self.load();
				})
				.on("click", ".export-btn", function() {
					var type ;
					if($k.user.get().role.resource.indexOf('agency_department') > -1) {
						var monthly = $tar.find(".monthly").val();
						var searchType = $tar.find(".searchType").val();
						if(searchType == "1") {
							type = 7;
						} else if(searchType == "2") {
							type = 8 ;
						} else if(searchType == "3") {
							type = 9;
						}
						location.href = "reportForm/export?monthly=" + monthly + "&type=" + type;
					} else {
						location.href = "reportForm/exportByEnterpriseId?enterpriseId=" + $tar.find("#enterpriseId").val() + "&type=18";
					}
				})
				.on("click", ".economic-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempDialogTar.doT());
					self.getValidate($dialog);
					self.datetimepicker($dialog.find("#monthly"));
					$dialog.modal({
						closeViaDimmer: false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							var $economicInputForm = $dialog.find("#economic-input-form");
							if ($economicInputForm.valid()) {  
								$.ajax({
									url: "economic/add",
									type: "POST",
									data:{
										monthly: $economicInputForm.find("#monthly").val(),
										enterpriseId: $tar.find("#enterpriseId").val(),
										industryAddition: $economicInputForm.find("#industryAddition").val(),
										mainBusiness: $economicInputForm.find("#mainBusiness").val(),
										profit: $economicInputForm.find("#profit").val(),
										tax: $economicInputForm.find("#tax").val()
									},
									success: function(data) {
										if(data.status == 3) {
											$dialog.find("#monthly").next().removeClass("success").text("该月份记录已存在！");
											return;
										}
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
				})
				.on("click", ".economic-update-btn", function() {
					var id = $k.util.trChecked("economic");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "economic/detail",
						type: "POST",
						data:{ economicId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT());
							self.getValidate($dialog);
							self.datetimepicker($dialog.find("#monthly"));
							$.each(data.data, function(key, val) {
								if(key == "enterprise") {
									$dialog.find("#enterpriseId").val(val.id);
								} else {
									$dialog.find("[name='"+key+"']").val(val);
								}
							});
							$dialog.find("[name='monthly']").attr("disabled", "disabled");
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $economicInputForm = $dialog.find("#economic-input-form");
									if ($economicInputForm.valid()) {  
										$.ajax({
											url: "economic/edit",
											type: "POST",
											data:{
												economicId: $economicInputForm.find("#id").val(),
												monthly: $economicInputForm.find("#monthly").val(),
												enterpriseId: $tar.find("#enterpriseId").val(),
												industryAddition: $economicInputForm.find("#industryAddition").val(),
												mainBusiness: $economicInputForm.find("#mainBusiness").val(),
												profit: $economicInputForm.find("#profit").val(),
												tax: $economicInputForm.find("#tax").val()
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".economic-target-btn", function() {
					var id = $k.util.trChecked("economic");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "economic/detail",
						type: "POST",
						data:{ economicId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html($(".template.EconomicTargetDialog").doT());
							//self.getValidate($dialog);
							var url = "";
							var targetId = $tar.find("#economic-table").find("td[target]").attr("target");
							if(targetId != "") {
								url = "economic/targetEdit";
								$.each(data.data, function(key, val) {
									$dialog.find("[name='"+key+"']").val(val);
								});
							} else {
								url = "economic/targetAdd";
							}
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $economicTargetInputForm = $dialog.find("#economic-target-input-form");
									if ($economicTargetInputForm.valid()) {  
										$.ajax({
											url: url,
											type: "POST",
											data:{
												economicTargetId: targetId,
												enterpriseId: data.data.enterprise.id,
												year: $economicTargetInputForm.find("#year").val(),
												value: $economicTargetInputForm.find("#value").val(),
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".economic-send-btn, .economic-pass-btn, .economic-reject-btn", function() {
					var id = $k.util.trChecked("economic");
					if (id == null){
						return;
					}
					var content = "";
					var url = "";
					if($(this).hasClass("economic-send-btn")) {
						content = "确定将该条数据上报吗?";
						url = 'economic/report';
					} else if($(this).hasClass("economic-pass-btn")) {
						content = "确定该条数据审核通过吗?";
						url = 'economic/pass';
					} else {
						content = "确定驳回该条数据吗?";
						url = 'economic/reject';
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
								data: { economicId: id, },
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
				.on("click", ".economic-delete-btn", function() {
					var ids = $k.util.trOperateChecked("economic");
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
								url: 'economic/delete',
								type: "POST",
								data: { economicIds: ids.toString(), },
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
				.on("click", "#economic-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					$tar.find(".am-btn").removeClass("am-disabled");
					$tar.find("#economic-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					var status = $this.closest("tr").find("td[status]").attr("status");
					if(status == "1" || status == "2") {
						$tar.find(".economic-update-btn").addClass("am-disabled");
						$tar.find(".economic-send-btn").addClass("am-disabled");
						$tar.find(".economic-delete-btn").addClass("am-disabled");
					}
					if(status != "1") {
						$tar.find(".economic-pass-btn").addClass("am-disabled");
						$tar.find(".economic-reject-btn").addClass("am-disabled");
					}
				})
				.on("click", "#economic-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				});
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				self.$tar.html(self.$tempTar.doT({
					resource: $k.user.get().role.resource,
				}));
				var now = new Date();
				now.setMonth(now.getMonth() - 1);
				$('[data-am-selected]').selected();
				self.datetimepicker(self.$tar.find(".monthly"));
				self.$tar.find(".monthly").val(now.format("yyyy-mm"));
				return self;
			}
		},
		load: {
			value: function(monthly){
				var self = this;
				var url = "";
				self.$tar.find("#economic-table").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if(enterpriseData.data != null && enterpriseData.data.length != 0) {
							self.$tar.find("#enterpriseId").val(enterpriseData.data.id);
							$.ajax({
								url: "economic/listByEnterpriseId",
								type: "POST",
								data: {
									enterpriseId: enterpriseData.data.id,
								},
								success: function(data) {
									if(data.data.length != 0) {
										self.$tar.find("#economic-table").html(
												$(".template.EconomicList").doT({
													data: data.data,
													resource: $k.user.get().role.resource,
												})
											);
											self.datatables = self.$tar.find("#economic-table").dataTable();
									} else {
										self.datatables = self.$tar.find("#economic-table").dataTable();
									}
								},
								error: function(err) {}
							});
						} else {
							var searchType = self.$tar.find(".searchType").val();
							self.datetimepicker(self.$tar.find(".monthly"));
							if(searchType == "2") {
								url = "economic/listByProductType";
							} else if(searchType == "3") {
								url = "economic/listByArea";
							} else {
								url = "economic/listByMonthly";
							}
							var monthlyVal = null;
							if(monthly == null || monthly == "") {
								monthlyVal = self.$tar.find(".monthly").val();
							} else {
								monthlyVal = monthly;
							}
							$.ajax({
								url: url,
								type: "POST",
								data: {
									monthly: monthlyVal,
								},
								success: function(data) {
									if(data.data.length != 0) {
										self.$tar.find("#economic-table").html(
												$(".template.EconomicList").doT({
													data: data.data,
													searchType: searchType,
													resource: $k.user.get().role.resource,
												})
											);
											self.datatables = self.$tar.find("#economic-table").dataTable({
												"dom": '<"datatable-header"<"dataTables_filter">l><"datatable-scroll"t><"datatable-footer"ip>',
												initComplete: function(settings) {
													var searchHTML = '<label style="font-size: 1.5rem;">搜索:</label> <input type="search" class="am-form-field am-input-sm am-inline-block" style="width: 51.5%;font-size:1.2rem!important;" placeholder="关键字搜索..." aria-controls="datatable1">';
													$('.dataTables_filter').append(searchHTML);
													/** 重写搜索事件 **/
													$('.dataTables_filter input').bind('keyup',
													function(e) {
														self.datatables.fnFilter(this.value);
													});
												}
											});
											self.$tar.find(".dataTables_filter").css("width", "32.5%");
									} else {
										self.datatables = self.$tar.find("#economic-table").dataTable();
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
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#economic-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  enterpriseId: "required",
				    	  monthly: "required",
				    	  industryAddition: {
				    		  required: true,
				    		  number: true
				    	  },
				    	  mainBusiness: {
				    		  required: true,
				    		  number: true
				    	  },
				    	  profit: {
				    		  required: true,
				    		  number: true
				    	  },
				    	  tax: {
				    		  required: true,
				    		  number: true
				    	  },
				    	  yearTarget: {
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
				      onChangeMonth: function(currentDateTime) {
				    	  $obj.val(currentDateTime.format("yyyy-mm"));
				    	  if($obj.hasClass("monthly")) {
				    		  self.$tar.find('.searchType option').removeAttr('selected');
				    		  self.$tar.find('.searchType option[value="1"]').attr('selected', true);
							  self.load($obj.val());
				    	  }
				      } 
				});
				return self;
			}
		}
	});
})( jQuery );
</script>
