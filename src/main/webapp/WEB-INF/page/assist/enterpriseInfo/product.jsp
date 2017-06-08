<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EnterpriseProduct" type="text/x-jquery-tmpl">
<!-- 企业产品信息  -->
<div class="admin-content">
   	<div class="am-g">
   		<div class="am-u-sm-12">
        	<form class="" id="enterpriseProduct">
				<div class="am-btn-toolbar am-fl">
					<div class="am-btn-group am-btn-group-xs">
            			<button type="button" class="am-btn am-btn-default enterprise-product-add-btn"><span class="am-icon-plus"></span> 新增</button>
            			<button type="button" class="am-btn am-btn-default enterprise-product-update-btn"><span class="am-icon-save"></span> 编辑</button>
            			<button type="button" class="am-btn am-btn-default enterprise-product-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
          			</div>
        		</div>
				<input class="enterpriseId am-hide"/>
        		<table class="am-table am-table-striped am-table-hover table-main" id="enterprise-product-table">
		  		 	<thead>
		  		  		<tr>
					 		<th></th>
			            	<th>#</th><th>产品名称</th>
	                 		<th>联系电话</th><th>产品介绍</th>
							<th>规格参数</th><th>图片路径</th>
				  		</tr>
			  		</thead>
			  		<tbody></tbody>
				</table>
        	</form>
		</div>
	</div>
</div>
</script>

<script class="template EnterpriseProductDialog" type="text/x-jquery-tmpl">
<!-- 产品信息 -->
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	产品信息
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd">
		<form class="am-form am-form-horizontal" id="enterprise-product-input-form" style="overflow:auto;max-height:400px;">
			  <input name="id" id="id" type="text" class="am-hide"/>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">产品名称:</label>
			    <div class="am-u-sm-9 padding-left">
			      	<input type="text" name="name" id="name" class="am-form-field"/>
			    </div>
			  </div>

			  <div class="am-form-group am-form-file">
	    		<label for="" class="am-u-sm-3 am-form-label font-normal">产品图片:</label>
	    		<div class="am-u-sm-3 padding-left">
					<button type="button" class="am-btn am-btn-secondary">
   					<i class="am-icon-cloud-upload"></i> 选择图片</button>
 						<input id="upload-file-input" name="uploadImage" type="file" accept="image/*">
 					</div>
	    		<div class="am-u-sm-5">
	      			<input type="text" id="imagePath" name="imagePath" class="am-form-field" style="line-height:normal;"/>
	    		</div>
				<div class="am-u-sm-1 padding-horizontal-o upload-loading-icon am-hide"><i class="am-icon-spinner am-icon-pulse am-icon-md"></i></div>
	 		 </div>
	  
	 		 <div class="am-form-group imageShow am-hide">
	     		<label for="" class="am-u-sm-3 am-form-label font-normal">企业图片:</label>
	     		<div class="am-u-sm-9 padding-left">
	        		<img src="" style="width: 100%;"/>
	     		</div>
	  		 </div>

		  <div class="am-form-group">
		     <label for="" class="am-u-sm-3 am-form-label font-normal">联系电话:</label>
		     <div class="am-u-sm-9 padding-left">
		       <input name="telephone" id="telephone" class="am-form-field"/>
		     </div>
		   </div>

    	   <div class="am-form-group">
		     <label for="" class="am-u-sm-3 am-form-label font-normal">规格参数:</label>
		     <div class="am-u-sm-9 padding-left">
		       <textarea rows="5" name="specification" id="specification"></textarea>
		     </div>
		   </div>

			<div class="am-form-group">
		    	<label for="introduction" class="am-u-sm-3 am-form-label font-normal">产品介绍:</label>
		    	<div class="am-u-sm-9 padding-left">
					<textarea rows="5" name="introduction" id="introduction"></textarea>
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

<script class="template EnterpriseProductList" type="text/x-jquery-tmpl">
	{{~ it.data: product:index }}
		<tr class="table-tr">
			<td><input type='checkbox' class='box' name='box'/></td>
			<td id="{{=product.id}}">{{=index+1}}</td>
			<td class="td-title ellipsis" title="{{=product.name}}"><a class="productInfo-href">{{=(product.name|| "" )}}</a></td>	
			<td>{{=(product.telephone|| "" )}}</td>
			<td class="td-content ellipsis" title="{{=product.introduction}}">{{=(product.introduction|| "" )}}</td>
			<td class="td-content ellipsis" title="{{=product.specification}}">{{=(product.specification|| "" )}}</td>
			<td>
				{{?product.imagePath!=""}}
				<a href="{{='./downloadFile?filepath='+product.imagePath}}">下载</a>
				{{?}}
			</td>
		</tr>
	{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	oTable2 = null;
	var inittimes = 0;
	var fnName = "EnterpriseProduct";
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
				.on("click", ".enterprise-product-add-btn", function() {
					var id = $tar.find(".enterpriseId").val();
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar.closest(".content"));
					$dialog.html(self.$tempDialogTar.doT());
					self.getValidate($dialog);
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							var $productForm = $dialog.find("#enterprise-product-input-form");
							if ($productForm.valid()) {
								$.ajax({
									url: "enterprise/product/add",
									type: "POST",
									data:{
										enterpriseId: id,
										name: $productForm.find("#name").val(),
										specification: $productForm.find("#specification").val(),
										introduction: $productForm.find("#introduction").val(),
										imagePath: $productForm.find("#imagePath").val(),
										telephone: $productForm.find("#telephone").val()
									},
									success: function(data) {
										$modal.close($dialog.remove());
										self.load(id);
									},
									error: function(err) {
										$modal.close($dialog.remove());
									}
								});
							}
						},
						onCancel: function(e) {
							this.close($dialog.remove());
				        }
					});
				})
				
				.on("click", ".enterprise-product-update-btn", function() {
					var id = $k.util.trChecked("enterprise-product-table");
					var enterpriseId = $tar.find(".enterpriseId").val();
					if(id==null){
						return;
					}
					$.ajax({
						url: "enterprise/product/detail",
						type: "POST",
						data:{productId: id},
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar.closest(".content"));
							$dialog.html(self.$tempDialogTar.doT());
							self.getValidate($dialog);
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl);
							})
							$dialog.modal({
								closeViaDimmer:false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $productForm = $dialog.find("#enterprise-product-input-form");
									if ($productForm.valid()) {
										$.ajax({
											url: "enterprise/product/edit",
											type: "POST",
											data:{
												enterpriseId: enterpriseId,
												productId: id,
												name: $productForm.find("#name").val(),
												specification: $productForm.find("#specification").val(),
												introduction: $productForm.find("#introduction").val(),
												imagePath: $productForm.find("#imagePath").val(),
												telephone: $productForm.find("#telephone").val()
											},
											success: function(data) {
												self.load(enterpriseId);
												$modal.close($dialog.remove());
											},
											error: function(err) {
												$modal.close($dialog.remove());
											}
										});
									}
								},
								onCancel: function(e) {
									this.close($dialog.remove());
						        }
							});
						},
						error: function(err) {}
					});
					
				})
				
				.on("click", ".productInfo-href", function(e) {
					e.stopPropagation();
					var id = $(this).parent().prev().attr("id");
					if(id==null){
						return;
					}
					$.ajax({
						url: "enterprise/product/detail",
						type: "POST",
						data:{productId: id},
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt" id="enterprise-product-input"></div>').appendTo(self.$tar.closest(".content"));
							$dialog.html(self.$tempDialogTar.doT());
							$dialog.find(".am-form-file").addClass("am-hide");
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl);
								$dialog.find(".am-form-file").addClass("am-hide");
								if(ky=="imagePath"&&vl!=""){
									$dialog.find(".imageShow").removeClass("am-hide");
									$dialog.find(".imageShow").find("img").attr("src","./"+vl);
								}
							})
							$dialog.modal({
								closeViaDimmer:false,
								closeOnConfirm: false,
								onCancel: function(e) {
									this.close($dialog.remove());
						        }
							});
							$k.util.inputDisabled("enterprise-product");
						},
						error: function(err) {}
					});
					
				})
				
				.on("click", ".enterprise-product-delete-btn", function() {
					var ids = $k.util.trOperateChecked("enterprise-product-table");
					if (ids == null){
						return;
					}
					$tar.find('#enterprise-product').modal('close');
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar.closest(".content"));
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
								url: 'enterprise/product/delete',
								type: "POST",
								data: { productIds: ids.toString(), },
								success: function(data) {
									if (data.status == 0) {
										self.load($tar.find(".enterpriseId").val());
										$modal.close($dialog.remove());
									} else{
									}
								},
								error: function(err) {
								}
							});
						},
						onCancel: function() {
							this.close($dialog.remove());
						}
					});
				})
				.on("change", "#enterprise-product-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#enterprise-product-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#enterprise-product-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				});
				$tar.closest(".content").on('change', '#upload-file-input', function() {
					var $productForm = $tar.closest(".content").find("#enterprise-product-input-form");
					$productForm.find(".upload-loading-icon").removeClass("am-hide");
				      $.ajax({
							url: "uploadImage",
							type: "POST",
							data: new FormData($productForm[0]),
							enctype : 'multipart/form-data',
							processData: false,
							contentType: false,
							cache: false,
							success: function(data) {
								if(data.status=="0"){
									$tar.closest(".content").find("#imagePath").val(data.data);
									$productForm.find(".upload-loading-icon").addClass("am-hide");
								}
							},
							error: function(data) {}
					});
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
			value: function(enterpriseId) {
				var self = this;
				self.$tar.find("#enterprise-product-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "enterprise/product/list",
					type: "POST",
					data: {
						enterpriseId: enterpriseId,
					},
					success: function(data) {
						if(data.status=="0"){
							self.$tar.find("#enterprise-product-table").find("tbody").html(
									$(".template.EnterpriseProductList").doT({
									data: data.data
								})
							);
							self.datatables = self.$tar.find("#enterprise-product-table").dataTable();
						}
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#enterprise-product-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  introduction: {required: true},
				    	  name: "required",
				    	  telephone: {phone: true}
				      },
				      messages: {
				   		  telephone: { phone: "请输入正确的手机格式"}
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>