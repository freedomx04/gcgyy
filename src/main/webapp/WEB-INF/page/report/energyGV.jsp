<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EnergyGV" type="text/x-jquery-tmpl">
<div class="admin-content energyGV">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">能源消耗</strong></div>
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
						<form id="importEnergy-file-form" class="am-fl">
							<div class="am-form-file am-inline-block am-fr">
								<button type="button" class="am-btn am-btn-default am-btn-sm"> <i class="am-icon-cloud-upload"></i> 导入Excel</button>
		  						<input type="file" id="importEnergy-file-input" name="uploadfile" accept=".xls, .xlsx, .xlsm">
							</div>
						</form>
		   			</div>
  				</div>
			</div>

			<div class="padding-right-o am-fr">
				<div class="am-btn-toolbar am-fl">
		   			<div class="am-btn-group am-btn-group-sm">
		     			<button type="button" class="am-btn am-btn-default energy-add-btn"><span class="am-icon-plus"></span> 新增</button>
		     			<button type="button" class="am-btn am-btn-default energy-update-btn"><span class="am-icon-save"></span> 编辑</button>
		     			<button type="button" class="am-btn am-btn-default energy-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
						<button type="button" class="am-btn am-btn-default energy-export-btn"><span class="am-icon-save"></span> 导出Excel</button>
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
			<table class="am-table am-table-striped am-table-hover table-main" id="energy-table">
			</table>
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
			    <label for="" class="am-u-sm-4 am-form-label font-normal">本月用电量(度):</label>
			    <div class="am-u-sm-8 padding-left-o">
				     <input type="text" name="electricity" id="electricity" class="am-form-field" />
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
<thead>
	<tr>
		<th></th>
		<th class="table-id">#</th>
		<th class="table-name">企业名称</th>
	    <th>本月用电量（度）</th>
	</tr>
</thead>
<tbody>
	{{~ it.data:data : index}}
	<tr class="table-tr">
		<td><input type='radio' class='box' name='box'/></td>
		<td id="{{=data.energy_current != null ? data.energy_current.id : ""}}">{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=data.enterprise.name}}">{{=data.enterprise!=null ? data.enterprise.name : ""}}</td>
		<td class="am-text-primary">{{=data.energy_current != null ? data.energy_current.electricity : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>


<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "EnergyGV";
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
				.on('click', '.energy-add-btn', function() {
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
				.on('click', '.energy-update-btn', function() {
					var id = $tar.find("tr.am-active").find("td[id]").attr("id");
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
											var $energyInputForm = $dialog.find("#energy-input-form");
											var monthly = $energyInputForm.find("#monthly").val();
											if ($energyInputForm.valid()) {  
												$.ajax({
													url: "energy/edit",
													type: "POST",
													data:{
														energyId: $energyInputForm.find("#id").val(),
														monthly: monthly,
														enterpriseId: $energyInputForm.find("#enterpriseId").val(),
														electricity: $energyInputForm.find("#electricity").val(),
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
				.on("click", ".energy-delete-btn", function() {
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
								url: 'energy/delete',
								type: "POST",
								data: { energyIds: id.toString(), },
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
								self.load($tar.find(".monthly").val());
								$tar.find('#importEnergy-file-input').val("");
							}
						},
						error: function(data) {
						}
					});
				})
				.on("click", ".energy-export-btn", function() {
					var monthly = $tar.find(".monthly").val();
					location.href = "reportForm/export?monthly=" + monthly + "&type=1";
				})
				.on("click", ".template-download", function() {
					var monthly = $tar.find(".monthly").val();
					location.href = "reportForm/template?monthly=" + monthly + "&type=1";
				})
				.on("click", "#energy-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					var id = $this.closest("tr").find("td[id]").attr("id");
					
					$tar.find(".energyGV .am-btn").removeClass("am-disabled");
					$tar.find("#energy-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					
					if(id == "") {
						$tar.find(".energy-update-btn").addClass("am-disabled");
						$tar.find(".energy-delete-btn").addClass("am-disabled");
					}
				})
				.on("click", "#energy-table .table-tr", function(e) {
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
					url: 'energy/listByMonthly',
					type: 'POST',
					data: {
						monthly: monthly == undefined ? self.$tar.find(".monthly").val() : monthly
					},
					success: function(data) {
						self.$tar.find(".sk-three-bounce").hide();
						self.$tar.find("#energy-table").html(
							$(".template.EnergyGVList").doT({
								data: data.data
							})
						);
						self.table = self.$tar.find("#energy-table").dataTable();
					},
					error: function(data) {}
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
				    	  }
				      }
			    });
				return validatorr;
			}
		},
	});
	
})( jQuery );
</script>