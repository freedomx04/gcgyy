<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template BenefitGV" type="text/x-jquery-tmpl">
<div class="admin-content benefitGV">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">效益指标</strong></div>
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
						<form id="importBenefit-file-form" class="am-fl">
							<div class="am-form-file am-inline-block am-fr">
								<button type="button" class="am-btn am-btn-default am-btn-sm"> <i class="am-icon-cloud-upload"></i> 导入Excel</button>
		  						<input type="file" id="importBenefit-file-input" name="uploadfile" accept=".xls, .xlsx, .xlsm">
							</div>
						</form>
		   			</div>
  				</div>
			</div>

			<div class="padding-right-o am-fr">
				<div class="am-btn-toolbar am-fl">
		   			<div class="am-btn-group am-btn-group-sm">
		     			<button type="button" class="am-btn am-btn-default benefit-add-btn"><span class="am-icon-plus"></span> 新增</button>
		     			<button type="button" class="am-btn am-btn-default benefit-update-btn"><span class="am-icon-save"></span> 编辑</button>
		     			<button type="button" class="am-btn am-btn-default benefit-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
						<button type="button" class="am-btn am-btn-default benefit-export-btn"><span class="am-icon-save"></span> 导出Excel</button>
		   			</div>
  				</div>
			</div>
		</div>

		<div class="am-u-sm-12 am-scrollable-horizontal">
			<div class="sk-three-bounce">
				<div class="sk-child sk-bounce1"></div>
				<div class="sk-child sk-bounce2"></div>
				<div class="sk-child sk-bounce3"></div>
			</div>
			<table class="am-table am-table-striped am-table-hover table-main" id="benefit-table">
			</table>
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
	    <form class="am-form am-form-horizontal" id="benefit-input-form">
			<div class="am-form-group am-margin-bottom-xs">
				<label for="userId" class="am-u-sm-3 am-form-label font-normal">企业名称:</label>
				<div class="am-u-sm-9 padding-left-o">
			 		<select name="enterpriseId" id="enterpriseId" class="am-form-field" data-am-selected="{searchBox: 1}">
						<option value="" selected>请选择</option>
						{{~ it.enterpriseData: enterprise}}	
						<option value="{{=enterprise.id}}">{{=enterprise.name}}</option>
						{{~}}
					</select>
				</div>
			</div>
			<div class="am-form-group">
				<label for="userId" class="am-u-sm-3 am-form-label font-normal">月报表时间:</label>
				<div class="am-u-sm-9 padding-left-o">
					<input type="text" class="am-form-field datetimepicker am-input-sm" id="monthly" name="monthly"/>
				</div>
			</div>
			<input name="id" id="id" type="text" class="am-hide"/>
			<table class="am-table am-table-centered am-padding-horizontal">
			<thead>
				<tr class="warningTr am-hide">
					<th class="am-text-danger">该月份数据已存在，请勿重复添加！</th>
					<th></th>
				</tr>
   				<tr>
       				<th>单位（千元）</th>
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

<script class="template BenefitList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		{{?it.type == "GV"}}
		<th></th>
		{{?}}
		<th>#</th>
		<th class="table-name">
		{{?it.type == "GV"}}
		企业名称
		{{??it.type == "EP"}}
		月份
		{{??}}
		{{?}}
		<th>应收账款（千元）</th>
		<th>产存品存货（千元）</th>
		<th>资产累计（千元）</th>
		<th>负债累计（千元）</th>
	</tr>
</thead>
<tbody>
	{{~ it.data:data : index}}
	<tr class="table-tr">
		{{if(it.type == "GV") {}}
		<td><input type='radio' class='box' name='box'/></td>
		{{}}}
		<td id="{{=data.benefit_current != null ? data.benefit_current.id : ""}}">{{=index+1}}</td>
		{{if(it.type == "GV") {}}
		<td class="td-title ellipsis">{{=data.enterprise != null ? data.enterprise.name : ""}}</td>
		{{}else{ }}
		<td>{{=data.monthly || ""}}</td>
		{{}}}
		<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.receivable : "-"}}</td>
		<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.inventory : "-"}}</td>
		<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.assets : "-"}}</td>
		<td class="am-text-primary">{{=data.benefit_current != null ? data.benefit_current.debt : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>


<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "BenefitGV";
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
				.on("click", ".benefit-add-btn", function() {
					$k.util.getEnterpriseList({
						success: function(enterpriseData){
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html($(".template.BenefitDialog").doT({
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
									var $benefitInputForm = $dialog.find("#benefit-input-form");
									if ($benefitInputForm.valid()) {  
										var monthly = $dialog.find("#monthly").val();
										$.ajax({
											url: "benefit/add",
											type: "POST",
											data:{
												monthly: monthly,
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
				.on("click", ".benefit-update-btn", function() {
					var id = $tar.find("tr.am-active").find("td[id]").attr("id");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "benefit/detail",
						type: "POST",
						data:{ benefitId: id },
						success: function(data) {
							$k.util.getEnterpriseList({
								success: function(enterpriseData){
									var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
									$dialog.html($(".template.BenefitDialog").doT({
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
				.on("click", ".benefit-delete-btn", function() {
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
								url: 'benefit/delete',
								type: "POST",
								data: { benefitIds: id.toString(), },
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
				.on("change", "#importBenefit-file-input", function() {
					$.ajax({
						url: "reportForm/importBenefit",
						type: "POST",
						data: new FormData($("#importBenefit-file-form")[0]),
						enctype : 'multipart/form-data',
						processData: false,
						contentType: false,
						cache: false,
						success: function(data) {
							if(data.status != 0) {
								$k.util.alertModal("上传数据格式不正确，请重新上传！");
							} else {
								self.load($tar.find(".monthly").val());
								$tar.find('#importBenefit-file-input').val("");
							}
						},
						error: function(data) {
						}
					});
				})
				.on("click", ".benefit-export-btn", function() {
					var monthly = $tar.find(".monthly").val();
					location.href = "reportForm/export?monthly=" + monthly + "&type=4";
				})
				.on("click", ".template-download", function() {
					var monthly = $tar.find(".monthly").val();
					location.href = "reportForm/template?monthly=" + monthly + "&type=2";
				})
				.on("click", "#benefit-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					var id = $this.closest("tr").find("td[id]").attr("id");
					
					$tar.find(".benefitGV .am-btn").removeClass("am-disabled");
					$tar.find("#benefit-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					
					if(id == "") {
						$tar.find(".benefit-update-btn").addClass("am-disabled");
						$tar.find(".benefit-delete-btn").addClass("am-disabled");
					}
				})
				.on("click", "#benefit-table .table-tr", function(e) {
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
				self.$tar.find("table").html("");
				self.$tar.find(".sk-three-bounce").show();
				$.ajax({
					url: 'benefit/listByMonthly',
					type: 'POST',
					data: {
						monthly: monthly == undefined ? self.$tar.find(".monthly").val() : monthly
					},
					success: function(data) {
						self.$tar.find(".sk-three-bounce").hide();
						self.$tar.find("#benefit-table").html(
							$(".template.BenefitList").doT({
								data: data.data,
								type: "GV"
							})
						);
						self.table = self.$tar.find("#benefit-table").dataTable();
					},
					error: function(data) {}
				});
				
				return self;
			}
		},
		getValidate: {
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
	});
	
})( jQuery );
</script>