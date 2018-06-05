<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EconomicGV" type="text/x-jquery-tmpl">
<div class="admin-content economicGV" style="height: auto!important;">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">主要指标</strong></div>
	</div>

	<div class="am-g">
		<div class="am-u-sm-12" style="height: 50px;">
			<div class="padding-horizontal-o am-fl">
				<input type="text" class="am-form-field am-align-left datetimepicker monthly" style="font-size: 1.4rem; width: 120px;" placeholder="请选择年月"/>
				<button type="button" class="am-btn am-radius am-btn-default am-btn-sm search">查询</button>
			</div>

			<div class="padding-right-o am-fr" style="margin-left: 20px;">
				<div class="am-btn-toolbar am-fl">
		   			<div class="am-btn-group am-btn-group-sm">
						<button type="button" class="am-btn am-btn-default template-download"><span class="am-icon-download"></span> 模板下载</button>
						<form id="importEconomic-file-form" class="am-fl">
							<div class="am-form-file am-inline-block am-fr">
								<button type="button" class="am-btn am-btn-default am-btn-sm"> <i class="am-icon-cloud-upload"></i> 导入Excel</button>
		  						<input type="file" id="importEconomic-file-input" name="uploadfile" accept=".xls, .xlsx, .xlsm">
							</div>
						</form>
		   			</div>
  				</div>
			</div>

			<div class="padding-right-o am-fr">
				<div class="am-btn-toolbar am-fl">
		   			<div class="am-btn-group am-btn-group-sm">
		     			<button type="button" class="am-btn am-btn-default economic-add-btn"><span class="am-icon-plus"></span> 新增</button>
		     			<button type="button" class="am-btn am-btn-default economic-update-btn"><span class="am-icon-save"></span> 编辑</button>
		     			<button type="button" class="am-btn am-btn-default economic-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
						<button type="button" class="am-btn am-btn-default economic-export-btn"><span class="am-icon-save"></span> 导出Excel</button>
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
			<table class="am-table am-table-striped am-table-hover table-main" id="economic-table">
			</table>
    	</div>	
	</div>
</div>
</script>

<script class="template EconomicGVDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	经济运行状况
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd" style="overflow:auto;max-height:500px">
	    <form class="am-form am-form-horizontal" id="economic-input-form">
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
			    <label for="" class="am-u-sm-4 am-form-label font-normal">本月止主营业务收入(千元):</label>
			    <div class="am-u-sm-8 padding-left-o">
				     <input type="text" name="mainBusiness" id="mainBusiness" class="am-form-field" />
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-4 am-form-label font-normal">本月止利润总额(千元):</label>
			    <div class="am-u-sm-8 padding-left-o">
				     <input type="text" name="profit" id="profit" class="am-form-field" />
		     	</div>
			  </div>

			 <div class="am-form-group">
			    <label for="" class="am-u-sm-4 am-form-label font-normal">本月止税金总额(千元):</label>
			    <div class="am-u-sm-8 padding-left-o">
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

<script class="template EconomicList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		{{?it.type == "GV"}}
		<th></th>
		{{?}}
		<th class="table-id">#</th>
		<th class="table-name">
		{{?it.type == "GV"}}
		企业名称
		{{??it.type == "EP"}}
		月份
		{{??}}
		{{?}}
		</th>
	    <th>本月止主营业务收入(千元)</th>
		<th>本月止利润总额(千元)</th>
	    <th>本月止税金总额(千元)</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: data : index}}
	<tr class="table-tr">
		{{if(it.type == "GV") {}}
		<td><input type='radio' class='box' name='box'/></td>
		{{}}}
		<td id="{{=data.economic_current != null ? data.economic_current.id : ""}}">{{=index+1}}</td>
		{{if(it.type == "GV") {}}
		<td class="td-title ellipsis">{{=data.enterprise != null ? data.enterprise.name : ""}}</td>
		{{}else{ }}
		<td>{{=data.monthly || ""}}</td>
		{{}}}
		<td class="am-text-primary">{{=data.economic_current !=null ? data.economic_current.mainBusiness : "-"}}</td>
		<td class="am-text-primary">{{=data.economic_current !=null ? data.economic_current.profit : "-"}}</td>
		<td class="am-text-primary">{{=data.economic_current !=null ? data.economic_current.tax : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>


<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "EconomicGV";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTarGV: {
			value: $(".template." + fnName)
		},
		$tempDialogTar: {
			value: $(".template." + fnName + "Dialog")
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on('click', '.search', function() {
					self.load();
				})
				.on("click", ".economic-add-btn", function() {
					$k.util.getEnterpriseList({
						success: function(enterpriseData){
							
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT({
								enterpriseData: enterpriseData.data
							}));
							self.getValidate($dialog);
							$('[data-am-selected]').selected();
							$k.util.datePicker($dialog.find("#monthly"));
							
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $economicInputForm = $dialog.find("#economic-input-form");
									if ($economicInputForm.valid()) {  
										var monthly = $economicInputForm.find("#monthly").val();
										$.ajax({
											url: "economic/add",
											type: "POST",
											data:{
												monthly: monthly,
												enterpriseId: $tar.find("#enterpriseId").val(),
												mainBusiness: $economicInputForm.find("#mainBusiness").val(),
												profit: $economicInputForm.find("#profit").val(),
												tax: $economicInputForm.find("#tax").val()
											},
											success: function(data) {
												if(data.status == 3) {
													$dialog.find("#monthly").next().removeClass("success").text("该月份记录已存在！");
													return;
												}
												$tar.find(".monthly").val(monthly);
												self.load(monthly);
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
				.on("click", ".economic-update-btn", function() {
					var id = $tar.find("tr.am-active").find("td[id]").attr("id");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "economic/detail",
						type: "POST",
						data:{ economicId: id },
						success: function(data) {
							$k.util.getEnterpriseList({
								success: function(enterpriseData){
									var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
									$dialog.html(self.$tempDialogTar.doT({
										enterpriseData: enterpriseData.data
									}));
									
									self.getValidate($dialog);
									$('[data-am-selected]').selected();
									$k.util.datePicker($dialog.find("#monthly"));
									
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
											var $economicInputForm = $dialog.find("#economic-input-form");
											if ($economicInputForm.valid()) {  
												var monthly = $economicInputForm.find("#monthly").val();
												$.ajax({
													url: "economic/edit",
													type: "POST",
													data:{
														economicId: $economicInputForm.find("#id").val(),
														monthly: monthly,
														enterpriseId: $tar.find("#enterpriseId").val(),
														mainBusiness: $economicInputForm.find("#mainBusiness").val(),
														profit: $economicInputForm.find("#profit").val(),
														tax: $economicInputForm.find("#tax").val()
													},
													success: function(data) {
														$tar.find(".monthly").val(monthly);
														self.load(monthly);
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
				.on("click", ".economic-delete-btn", function() {
					var id = $tar.find("tr.am-active").find("td[id]").attr("id");
					if (id == null){
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
								data: { economicIds: id.toString(), },
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
				.on("change", "#importEconomic-file-input", function() {
					$.ajax({
						url: "reportForm/importEconomic",
						type: "POST",
						data: new FormData($("#importEconomic-file-form")[0]),
						enctype : 'multipart/form-data',
						processData: false,
						contentType: false,
						cache: false,
						success: function(data) {
							if(data.status != 0) {
								$k.util.alertModal("上传数据格式不正确，请重新上传！");
							} else {
								self.load($tar.find(".monthly").val());
								$tar.find('#importEconomic-file-input').val("");
							}
						},
						error: function(data) {
						}
					});
				})
				.on("click", ".economic-export-btn", function() {
					var monthly = $tar.find(".monthly").val();
					location.href = "reportForm/export?monthly=" + monthly + "&type=7";
				})
				.on("click", ".template-download", function() {
					var monthly = $tar.find(".monthly").val();
					location.href = "reportForm/template?monthly=" + monthly + "&type=3";
				})
				.on("click", "#economic-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					var id = $this.closest("tr").find("td[id]").attr("id");
					
					$tar.find(".economicGV .am-btn").removeClass("am-disabled");
					$tar.find("#economic-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					
					if(id == "") {
						$tar.find(".economic-update-btn").addClass("am-disabled");
						$tar.find(".economic-delete-btn").addClass("am-disabled");
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
					
				var now = new Date();
				now.setDate(1);
				now.setMonth(now.getMonth() - 1);
				self.$tar.html(self.$tempTarGV.doT());
				$k.util.datePicker(self.$tar.find(".monthly"));
				self.$tar.find(".monthly").val(now.format("yyyy-mm"));
				
				return self;
			}
		},
		load: {
			value: function(monthly){
				var self = this;
				if (self.table) {
					self.table.fnDestroy();
				}
				self.$tar.find(".sk-three-bounce").show();
				self.$tar.find("table").html("");
				$.ajax({
					url: 'economic/listByMonthly',
					type: 'POST',
					data: {
						monthly: monthly == undefined ? self.$tar.find(".monthly").val() :monthly
					},
					success: function(data) {
						self.$tar.find(".sk-three-bounce").hide();
						self.$tar.find("#economic-table").html(
							$(".template.EconomicList").doT({
								data: data.data,
								type: "GV"
							})
						);
						self.table = self.$tar.find("#economic-table").dataTable();
					},
					error: function(data) {}
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
	});
	
})( jQuery );
</script>