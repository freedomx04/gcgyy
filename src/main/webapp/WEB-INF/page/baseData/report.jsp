<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Report" type="text/x-jquery-tmpl">
	<div class="admin-content">
    	<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">上报截止日期</strong></div>
    	</div>

    	<div class="am-g">
			<div class="am-u-sm-12">
				<form class="" id="report">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-xs">
           					<button type="button" class="am-btn am-btn-default report-add-btn"><span class="am-icon-plus"></span> 新增</button>
           					<button type="button" class="am-btn am-btn-default report-update-btn"><span class="am-icon-save"></span> 编辑</button>
           					<button type="button" class="am-btn am-btn-default report-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
         				</div>
					</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="report-table">
						<thead>
							<tr>
								<th><input type='checkbox' class='box_all' name='box'/></th>
								<th>#</th>
								<th>上报类型</th>
								<th>每月上报截止日期</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</script>
<script class="template ReportDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">上报截止日期
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="report-input-form">
		
				<input name="id" id="id" type="text" class="am-hide"/>
		
				<div class="am-form-group">
					<label for=name"" class="am-u-sm-3 am-form-label font-normal">上报类型:</label>
		    		<div class="am-u-sm-9 padding-left">
						<select name="type" id="type" class="am-form-field">
							<option value="" selected>请选择</option>
							<option value="1">工业总产值与主营业务收入</option>
							<option value="2">效益指标</option>
						</select>
		    		</div>
				</div>
		
				<div class="am-form-group">
		    		<label for="description" class="am-u-sm-3 am-form-label font-normal">每月截止日期:</label>
		    		<div class="am-u-sm-9 padding-left">
						<select name="days" id="days" class="am-form-field">
							<option value="" selected>请选择</option>
							{{ for(var i=1; i<=31; i++) { }}
							<option value="{{=i}}">{{=i}}</option>
							{{ } }}
						</select>
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
<script class="template ReportList" type="text/x-jquery-tmpl">
	{{~ it.data: report:index }}
		<tr class="table-tr">
			<td><input type='checkbox' class='box' name='box'/></td>
			<td id="{{=report.id}}">{{=index+1}}</td>
			<td>{{=(report.type == 1 ? "工业总产值与主营业务收入" :report.type == 2 ? "效益指标" : "" )}}</td>	
			<td>{{=(report.days|| "" )}}</td>
		</tr>
	{{~}}
</script>
<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Report";
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
				.on("click", ".report-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempDialogTar.doT());
					self.getValidate($dialog);
					
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#report-input-form').valid()) {//如果表单验证成功，则进行提交。  
								$.ajax({
									url: "report/add",
									type: "POST",
									data:{
										type: $dialog.find("#type").val(),
										days: $dialog.find("#days").val()
									},
									success: function(data) {
										if(data.status == 3) {
											$dialog.find("#type").next().removeClass("success").text("该类型上报时间已存在！");
										} else {
											$modal.close($dialog.remove());
											self.load();
										}
									},
									error: function(err) {
										alertModal("操作失败，请稍后重试！");
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
				})
				.on("click", ".report-update-btn", function() {
					var id = $k.util.trChecked("report");
					if (id == null){
						return;
					}
					$.ajax({
						url: "report/detail",
						type: "POST",
						data:{ reportId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT());
							self.getValidate($dialog);
							
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl)
							})
							$dialog.modal({
								closeViaDimmer:false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $reportInputForm = $dialog.find("#report-input-form");
									if ($reportInputForm.valid()) {//如果表单验证成功，则进行提交。  
										$.ajax({
											url: "report/edit",
											type: "POST",
											data:{
												reportId: $reportInputForm.find("#id").val(),
												type: $reportInputForm.find("#type").val(),
												days: $reportInputForm.find("#days").val()
											},
											success: function(data) {
												if(data.status == 3) {
													$dialog.find("#type").next().removeClass("success").text("该类型上报时间已存在！");
												} else {
													$modal.close($dialog.remove());
													self.load();
												}
											},
											error: function(err) {
												alertModal("操作失败，请稍后重试！");
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".report-delete-btn", function() {
					var ids = $k.util.trOperateChecked("report");
					if (ids == null){
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
								url: "report/delete",
								type: "POST",
								data: { reportIds: ids.toString() },
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
				.on("change", "#report-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#report-table .box", function(e) {
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
				self.$tar.html(self.$tempTar.doT());
				return self;
			}
		},
		load: {
			value: function() {
				var self = this;
				self.$tar.find("#report-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "report/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#report-table").find("tbody").html(
							$(".template.ReportList").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#report-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#report-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  type: "required",
				    	  days: {
				    		  required: true,
				    		  number: true
				    	  }
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>