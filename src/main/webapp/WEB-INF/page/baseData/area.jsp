<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Area" type="text/x-jquery-tmpl">
	<div class="admin-content">
    	<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">区域管理</strong></div>
    	</div>

    	<div class="am-g">
			<div class="am-u-sm-12">
				<form class="" id="area">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-xs">
           					<button type="button" class="am-btn am-btn-default area-add-btn"><span class="am-icon-plus"></span> 新增</button>
           					<button type="button" class="am-btn am-btn-default area-update-btn"><span class="am-icon-save"></span> 编辑</button>
           					<button type="button" class="am-btn am-btn-default area-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
         				</div>
					</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="area-table">
						<thead>
							<tr>
								<th><input type='checkbox' class='box_all' name='box'/></th>
								<th>#</th>
								<th>名称</th>
								<th>描述</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</script>
<script class="template AreaDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">区域信息
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="area-input-form">
		
				<input name="id" id="id" type="text" class="am-hide"/>
		
				<div class="am-form-group">
					<label for=name"" class="am-u-sm-2 am-form-label font-normal">名称:</label>
		    		<div class="am-u-sm-10 padding-left">
						<input type="text" name="name" id="name" class="am-form-field"/>
		    		</div>
				</div>
		
				<div class="am-form-group">
		    		<label for="description" class="am-u-sm-2 am-form-label font-normal">描述:</label>
		    		<div class="am-u-sm-10 padding-left">
						<textarea rows="5" name="description" id="description"></textarea>
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
<script class="template AreaList" type="text/x-jquery-tmpl">
	{{~ it.data: area:index }}
		<tr class="table-tr">
			<td><input type='checkbox' class='box' name='box'/></td>
			<td id="{{=area.id}}">{{=index+1}}</td>
			<td class="td-title ellipsis" title="{{=area.name}}"><a class="areaInfo-href">{{=(area.name|| "" )}}</a></td>	
			<td class="td-content ellipsis" title="{{=area.description}}">{{=(area.description|| "" )}}</td>
		</tr>
	{{~}}
</script>
<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Area";
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
				.on("click", ".area-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempDialogTar.doT());
					self.getValidate($dialog);
					
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#area-input-form').valid()) {//如果表单验证成功，则进行提交。  
								$.ajax({
									url: "area/add",
									type: "POST",
									data:{
										name: $dialog.find("#name").val(),
										description: $dialog.find("#description").val()
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
				.on("click", ".area-update-btn", function() {
					var id = $k.util.trChecked("area");
					if (id == null){
						return;
					}
					$.ajax({
						url: "area/detail",
						type: "POST",
						data:{ areaId: id },
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
									var $areaInputForm = $("#area-input-form");
									if ($areaInputForm.valid()) {//如果表单验证成功，则进行提交。  
										$.ajax({
											url: "area/edit",
											type: "POST",
											data:{
												areaId: $areaInputForm.find("#id").val(),
												name: $areaInputForm.find("#name").val(),
												description: $areaInputForm.find("#description").val()
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
				.on("click", ".area-delete-btn", function() {
					var ids = $k.util.trOperateChecked("area");
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
								url: "area/delete",
								type: "POST",
								data: { areaIds: ids.toString() },
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
				.on("click",".areaInfo-href",function(e){
					e.stopPropagation();
					var areaId = $(this).parent().prev().attr("id");
					$.ajax({
						url: "area/detail",
						type: "POST",
						data:{ areaId: areaId },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt" id="area-input"></div>').appendTo(self.$tar);
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
							$k.util.inputDisabled("area");
						},
						error: function(err) {}
					});
				})
				.on("change", "#area-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#area-table .box", function(e) {
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
				self.$tar.find("#area-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "area/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#area-table").find("tbody").html(
							$(".template.AreaList").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#area-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#area-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  name:"required"
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>