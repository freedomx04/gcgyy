<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Profit" type="text/x-jquery-tmpl">
	<div class="admin-content">
    	<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">利润总额</strong></div>
    	</div>

    	<div class="am-g">
			<div class="am-u-sm-12" style="height: 50px;">
				<div class="padding-horizontal-o am-fl">
					<input type="text" class="am-form-field am-align-left datetimepicker monthly" style="font-size: 1.4rem; width: 120px;" placeholder="请选择年月"/>
					<button type="button" class="am-btn am-radius am-btn-default am-btn-sm search">查询</button>
				</div>
	
				{{? it.editable}}
				<div class="padding-right-o am-fr" style="margin-left: 20px;">
					<div class="am-btn-toolbar am-fl">
			   			<div class="am-btn-group am-btn-group-sm">
							<button type="button" class="am-btn am-btn-default template-download"><span class="am-icon-download"></span> 模板下载</button>
							<form id="importProfit-file-form" class="am-fl">
								<div class="am-form-file am-inline-block am-fr">
									<button type="button" class="am-btn am-btn-default am-btn-sm"> <i class="am-icon-cloud-upload"></i> 导入Excel</button>
			  						<input type="file" id="importProfit-file-input" name="uploadfile" accept=".xls, .xlsx, .xlsm">
								</div>
							</form>
			   			</div>
	  				</div>
				</div>
				{{?}}
	
				<div class="padding-right-o am-fr">
					<div class="am-btn-toolbar am-fl">
			   			<div class="am-btn-group am-btn-group-sm">
							{{? it.editable}}
			     			<button type="button" class="am-btn am-btn-default profit-update-btn"><span class="am-icon-save"></span> 编辑</button>
			     			<button type="button" class="am-btn am-btn-default profit-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
			   				{{?}}
							<button type="button" class="am-btn am-btn-default profit-export-btn"><span class="am-icon-save"></span> 导出Excel</button>
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
				<table class="am-table am-table-striped am-table-hover table-main" id="profit-table">
				</table>
	    	</div>
		</div>
	</div>
</script>
<script class="template ProfitDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">上报信息
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="profit-input-form">
		
				<input name="id" id="id" type="text" class="am-hide"/>
		
				<div class="am-form-group">
					<label for="county" class="am-u-sm-3 am-form-label font-normal">县区名称:</label>
					<div class="am-u-sm-9 padding-left-o">
		    			<select name="county" id="county" class="am-form-field" data-am-selected="{searchBox: 1}">
							<option value="" selected>请选择</option>
							{{~ it.county: county}}	
							<option value="{{=county.id}}">{{=county.name}}</option>
							{{~}}
						</select>
					</div>
			  	</div>

			  	<div class="am-form-group">
			   		<label for="monthly" class="am-u-sm-3 am-form-label font-normal">年月:</label>
			    	<div class="am-u-sm-9 padding-left-o">
				     	<input type="text" name="monthly" id="monthly" class="am-form-field datetimepicker" />
		     		</div>
			  	</div>

				<div class="am-form-group">
					<label for="total" class="am-u-sm-3 am-form-label font-normal">本月止累计(万元):</label>
		    		<div class="am-u-sm-9 padding-left-o">
						<input type="text" name="total" id="total" class="am-form-field"/>
		    		</div>
				</div>
		
				<div class="am-form-group">
					<label for="yearGrowth" class="am-u-sm-3 am-form-label font-normal">同比±%:</label>
		    		<div class="am-u-sm-9 padding-left-o">
						<input type="text" name="yearGrowth" id="yearGrowth" class="am-form-field"/>
		    		</div>
				</div>

				<div class="am-form-group">
					<label for="sort" class="am-u-sm-3 am-form-label font-normal">增幅排序:</label>
		    		<div class="am-u-sm-9 padding-left-o">
						<input type="text" name="sort" id="sort" class="am-form-field"/>
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
<script class="template ProfitList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		{{?it.editable}}<th><input type='checkbox' class='box_all' name='box'/></th>{{?}}
		<th>#</th>
		<th>县区名称</th>
		<th>本月止累计(万元)</th>
		<th>同比±%</th>
		<th>增幅排序</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: profit:index }}
		<tr class="table-tr">
			{{?it.editable}}<td><input type='checkbox' class='box' name='box'/></td>{{?}}
			<td id="{{=profit.id}}">{{=index+1}}</td>
			<td class="ellipsis">{{=(profit.county != null ? profit.county.name : "" )}}</td>
			<td>{{=profit.total != null ? profit.total : ""}}</td>
			<td>{{=profit.yearGrowth != null ? profit.yearGrowth.toFixed(2) : ""}}</td>
			<td>{{=profit.sort || ""}}</td>
		</tr>
	{{~}}
</tbody>
</script>
<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Profit";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		$tempDialogTar: {
			value: $(".template." + fnName + "Dialog")
		},
		init: {
			value: function($tar, editable) {
				var self = this;
				self.$tar = $tar
				self.editable = editable;
				$tar
				.on('click', '.search', function() {
					self.load();
				})
				.on("click", ".profit-update-btn", function() {
					var active_td = $tar.find("tr.am-active").find("td[id]");
					var ids = new Array();
					$.each(active_td, function(el, vl) {
						ids.push($(vl).attr("id"));
					});
					if (ids.length == 0){
						$k.util.alertModal("还未选中一条记录！");
						return;
					}
					if (ids.length > 1){
						$k.util.alertModal("最多只能操作一条记录！");
						return;
					}
					$.ajax({
						url: "profit/detail",
						type: "POST",
						data:{ profitId: ids.toString() },
						success: function(data) {
							$k.util.getCountyList({
								success: function(county){
									var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
									$dialog.html(self.$tempDialogTar.doT({
										county: county.data
									}));
									self.getValidate($dialog);
									$('[data-am-selected]').selected();
									
									$.each(data.data,function(ky,vl){
										if(ky == "county") {
											$dialog.find("#county").find('option[value="'+vl.id+'"]').attr('selected', true);
											if (vl.name == "全市总计") {
												$dialog.find("#sort").rules("remove");
											}
										} else if (ky == "yearGrowth"&& vl != null) {
											$dialog.find("[name='"+ky+"']").val(vl.toFixed(2));
										} else {
											$dialog.find("[name='"+ky+"']").val(vl);
										}
									});
									$dialog.find(".am-selected-list").off("click", "> li");
									$dialog.find("[name='monthly']").attr("disabled", "disabled");
									$dialog.modal({
										closeViaDimmer:false,
										closeOnConfirm: false,
										onConfirm: function(e) {
											var $modal = this;
											var $profitInputForm = $("#profit-input-form");
											var monthly = $profitInputForm.find("#monthly").val();
											if ($profitInputForm.valid()) {//如果表单验证成功，则进行提交。  
												$.ajax({
													url: "profit/edit",
													type: "POST",
													data:{
														monthly: monthly,
														countyId: $profitInputForm.find("#county").val(),
														profitId: $profitInputForm.find("#id").val(),
														total: $profitInputForm.find("#total").val(),
														yearGrowth: $profitInputForm.find("#yearGrowth").val(),
														sort: $profitInputForm.find("#sort").val()
													},
													success: function(data) {
														$modal.close($dialog.remove());
														self.load();
													},
													error: function(err) {
													}
												});
											} else {
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
				.on("click", ".profit-delete-btn", function() {
					var active_td = $tar.find("tr.am-active").find("td[id]");
					var ids = new Array();
					$.each(active_td, function(el, vl) {
						ids.push($(vl).attr("id"));
					});
					if (ids.length == 0){
						$k.util.alertModal("还未选中一条记录！");
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: "确定要删除这些数据吗?"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: "profit/delete",
								type: "POST",
								data: { profitIds: ids.toString() },
								success: function(data) {
									if (data.status == 0) {
										self.load();
										$modal.close($dialog.remove());
									} else if(data.status == 4){
										$k.util.alertModal("该记录正在使用，请先删除关联记录，再行删除！！");
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
				.on("change", "#importProfit-file-input", function() {
					$.ajax({
						url: "rankingReport/importReport?type=7",
						type: "POST",
						data: new FormData($("#importProfit-file-form")[0]),
						enctype : 'multipart/form-data',
						processData: false,
						contentType: false,
						cache: false,
						success: function(data) {
							if(data.status != 0) {
								$k.util.alertModal("上传数据格式不正确，请重新上传！");
							} else {
								self.load($tar.find(".monthly").val());
								$tar.find('#importProfit-file-input').val("");
							}
						},
						error: function(data) {
						}
					});
				})
				.on("click", ".profit-export-btn", function() {
					var monthly = $tar.find(".monthly").val();
					location.href = "rankingReport/export?monthly=" + monthly + "&type=7";
				})
				.on("click", ".template-download", function() {
					var monthly = $tar.find(".monthly").val();
					location.href = "rankingReport/template?monthly=" + monthly + "&type=7";
				})
				.on("change", "#profit-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#profit-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", ".table-tr", function(e) {
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
				self.$tar.html(self.$tempTar.doT({
					editable: self.editable
				}));
				$k.util.datePicker(self.$tar.find(".monthly"));
				self.$tar.find(".monthly").val(now.format("yyyy-mm"));
				
				return self;
			}
		},
		load: {
			value: function(monthly) {
				var self = this;
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				var $table = self.$tar.find("table");
				$table.html("");
				self.$tar.find(".sk-three-bounce").show();
				$.ajax({
					url: "profit/listByMonthly",
					type: "POST",
					data: {monthly: monthly == undefined ? self.$tar.find(".monthly").val() : monthly},
					success: function(data) {
						self.$tar.find(".sk-three-bounce").hide();
						$table.html(
							$(".template.ProfitList").doT({
									data: data.data,
									editable: self.editable
								})
							);
						self.datatables = $table.dataTable({
							"paginate": false,
							"searching": false
						});
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#profit-input-form").validate({
				      errorElement: "em",
				      errorPlacement: function(error, element) { //指定错误信息位置
				    	  if (element.is('#county') ) { //如果是radio或checkbox
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
				    	  county: "required",
				    	  yearGrowth: {required: true, number: true},
				    	  sort: {required: true, digits: true},
				    	  total: {required: true, number: true}
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>