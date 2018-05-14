<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template AppealType" type="text/x-jquery-tmpl">
	<div class="admin-content">
    	<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">诉求分类</strong></div>
    	</div>

    	<div class="am-g">
			<div class="am-u-sm-12">
				<form class="" id="appealType">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-xs">
           					<button type="button" class="am-btn am-btn-default appealType-add-btn"><span class="am-icon-plus"></span> 新增</button>
           					<button type="button" class="am-btn am-btn-default appealType-update-btn"><span class="am-icon-save"></span> 编辑</button>
           					<button type="button" class="am-btn am-btn-default appealType-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
         				</div>
					</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="appealType-table">
						<thead>
							<tr>
								<th><input type='checkbox' class='box_all' name='box'/></th>
								<th>#</th>
								<th>名称</th>
								<th>受理天数</th>
								<th>处理天数</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</script>
<script class="template AppealTypeDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">诉求分类
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="appealType-input-form">
		
				<input name="id" id="id" type="text" class="am-hide"/>
		
				<div class="am-form-group">
					<label for=name"" class="am-u-sm-3 am-form-label font-normal">名称:</label>
		    		<div class="am-u-sm-9 padding-left">
						<input type="text" name="name" id="name" class="am-form-field"/>
		    		</div>
				</div>
				<div class="am-form-group">
					<label for=name"" class="am-u-sm-3 am-form-label font-normal">受理天数:</label>
		    		<div class="am-u-sm-9 padding-left">
						<input type="text" name="acceptDays" id="acceptDays" class="am-form-field"/>
		    		</div>
				</div>
				<div class="am-form-group">
					<label for=name"" class="am-u-sm-3 am-form-label font-normal">处理天数:</label>
		    		<div class="am-u-sm-9 padding-left">
						<input type="text" name="handleDays" id="handleDays" class="am-form-field"/>
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
<script class="template AppealTypeList" type="text/x-jquery-tmpl">
	{{~ it.data: appealType:index }}
		<tr class="table-tr">
			<td><input type='checkbox' class='box' name='box'/></td>
			<td id="{{=appealType.id}}">{{=index+1}}</td>
			<td class="td-title ellipsis" title="{{=appealType.name}}"><a class="appealTypeInfo-href">{{=(appealType.name|| "" )}}</a></td>
			<td>{{=appealType.acceptDays||""}}</td>
			<td>{{=appealType.handleDays||""}}</td>	
		</tr>
	{{~}}
</script>
<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "AppealType";
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
				.on("click", ".appealType-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempDialogTar.doT());
					self.getValidate($dialog);
					
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#appealType-input-form').valid()) {//如果表单验证成功，则进行提交。  
								var $appealTypeInputForm = $dialog.find("#appealType-input-form");
								$.ajax({
									url: "appealType/add",
									type: "POST",
									data:{
										name: $dialog.find("#name").val(),
										handleDays: $appealTypeInputForm.find("#handleDays").val(),
										acceptDays: $appealTypeInputForm.find("#acceptDays").val(),
									},
									success: function(data) {
										if (data.status == 0) {
											self.load();
											$modal.close($dialog.remove());
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
				.on("click", ".appealType-update-btn", function() {
					var id = $k.util.trChecked("appealType");
					if (id == null){
						return;
					}
					$.ajax({
						url: "appealType/detail",
						type: "POST",
						data:{ appealTypeId: id },
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
									if ($dialog.find('#appealType-input-form').valid()) {//如果表单验证成功，则进行提交。  
										var $appealTypeInputForm = $("#appealType-input-form");
										$.ajax({
											url: "appealType/edit",
											type: "POST",
											data:{
												appealTypeId: $appealTypeInputForm.find("#id").val(),
												name: $appealTypeInputForm.find("#name").val(),
												handleDays: $appealTypeInputForm.find("#handleDays").val(),
												acceptDays: $appealTypeInputForm.find("#acceptDays").val(),
											},
											success: function(data) {
												$modal.close($dialog.remove());
												self.load();
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
				.on("click", ".appealType-delete-btn", function() {
					var ids = $k.util.trOperateChecked("appealType");
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
								url: "appealType/delete",
								type: "POST",
								data: { appealTypeIds: ids.toString() },
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
				.on("click",".appealTypeInfo-href",function(e){
					e.stopPropagation();
					var appealTypeId = $(this).parent().prev().attr("id");
					$.ajax({
						url: "appealType/detail",
						type: "POST",
						data:{ appealTypeId: appealTypeId },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt" id="appealType-input"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT());
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl);
							});
							$dialog.modal({
								closeViaDimmer: false,
 								onCancel: function(e) {
									this.close($dialog.remove());
								} 
							});
							$k.util.inputDisabled("appealType");
						},
						error: function(err) {}
					});
				})
				.on("change", "#appealType-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#appealType-table .box", function(e) {
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
				self.$tar.find("#appealType-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "appealType/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#appealType-table").find("tbody").html(
							$(".template.AppealTypeList").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#appealType-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#appealType-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  name: "required",
				    	  acceptDays: {required: true, digits: true},
				    	  handleDays: {required: true, digits: true},
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>