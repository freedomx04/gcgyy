<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template ProductType" type="text/x-jquery-tmpl">
	<div class="admin-content">
    	<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">企业产业类别</strong></div>
    	</div>

    	<div class="am-g">
			<div class="am-u-sm-12">
				<form class="" id="productType">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-xs">
           					<button type="button" class="am-btn am-btn-default productType-add-btn"><span class="am-icon-plus"></span> 新增</button>
           					<button type="button" class="am-btn am-btn-default productType-update-btn"><span class="am-icon-save"></span> 编辑</button>
           					<button type="button" class="am-btn am-btn-default productType-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
         				</div>
					</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="productType-table">
						<thead>
							<tr>
								<th><input type='checkbox' class='box_all' name='box'/></th>
								<th>#</th>
								<th>名称</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</script>
<script class="template ProductTypeDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">产业类别名称
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="productType-input-form">
		
				<input name="id" id="id" type="text" class="am-hide"/>
		
				<div class="am-form-group">
					<label for=name"" class="am-u-sm-2 am-form-label font-normal">名称:</label>
		    		<div class="am-u-sm-10 padding-left">
						<input type="text" name="name" id="name" class="am-form-field"/>
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
<script class="template ProductTypeList" type="text/x-jquery-tmpl">
	{{~ it.data: productType:index }}
		<tr class="table-tr">
			<td><input type='checkbox' class='box' name='box'/></td>
			<td id="{{=productType.id}}">{{=index+1}}</td>
			<td class="td-title ellipsis" title="{{=productType.name}}"><a class="productTypeInfo-href">{{=(productType.name|| "" )}}</a></td>	
		</tr>
	{{~}}
</script>
<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "ProductType";
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
				.on("click", ".productType-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempDialogTar.doT());
					self.getValidate($dialog);
					
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#productType-input-form').valid()) {//如果表单验证成功，则进行提交。  
								var $productTypeInputForm = $dialog.find("#productType-input-form");
								$.ajax({
									url: "productType/add",
									type: "POST",
									data:{
										name: $dialog.find("#name").val()
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
				.on("click", ".productType-update-btn", function() {
					var id = $k.util.trChecked("productType");
					if (id == null){
						return;
					}
					$.ajax({
						url: "productType/detail",
						type: "POST",
						data:{ productTypeId: id },
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
									if ($dialog.find('#productType-input-form').valid()) {//如果表单验证成功，则进行提交。  
										var $productTypeInputForm = $("#productType-input-form");
										$.ajax({
											url: "productType/edit",
											type: "POST",
											data:{
												productTypeId: $productTypeInputForm.find("#id").val(),
												name: $productTypeInputForm.find("#name").val()
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
				.on("click", ".productType-delete-btn", function() {
					var ids = $k.util.trOperateChecked("productType");
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
								url: "productType/delete",
								type: "POST",
								data: { productTypeIds: ids.toString() },
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
				.on("click",".productTypeInfo-href",function(e){
					e.stopPropagation();
					var productTypeId = $(this).parent().prev().attr("id");
					$.ajax({
						url: "productType/detail",
						type: "POST",
						data:{ productTypeId: productTypeId },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt" id="productType-input"></div>').appendTo(self.$tar);
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
							$k.util.inputDisabled("productType");
						},
						error: function(err) {}
					});
				})
				.on("change", "#productType-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#productType-table .box", function(e) {
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
				self.$tar.find("#productType-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "productType/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#productType-table").find("tbody").html(
							$(".template.ProductTypeList").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#productType-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#productType-input-form").validate({
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