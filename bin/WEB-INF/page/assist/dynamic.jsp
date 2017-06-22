<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- <link rel="stylesheet" type="text/css" href="js/ueditor/third-party/video-js/video-js.min.css"/>
<script type="text/javascript" src="js/ueditor/third-party/video-js/video.js"></script>
<script src="http://cdn.bootcss.com/html5media/1.1.8/html5media.min.js";></script> -->
<script class="template Dynamic" type="text/x-jquery-tmpl">
	<div class="admin-content">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">{{=it.title}}</strong></div>
    	</div>

    	<div class="am-g">
    		<div class="am-u-sm-12">
	        	<form id="dynamic">
					<div class="am-btn-toolbar am-fl">
        				<div class="am-btn-group am-btn-group-sm">
        					<button type="button" class="am-btn am-btn-default dynamic-add-btn"><span class="am-icon-plus"></span> 新增</button>
        					<button type="button" class="am-btn am-btn-default dynamic-update-btn"><span class="am-icon-save"></span> 编辑</button>
        					<button type="button" class="am-btn am-btn-default dynamic-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
        				</div>
	        		</div>
					<div class="sk-three-bounce">
						<div class="sk-child sk-bounce1"></div>
						<div class="sk-child sk-bounce2"></div>
						<div class="sk-child sk-bounce3"></div>
					</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="dynamic-table">
           			</table>
	        	</form>
			</div>
		</div>
	</div>
</script>

<script class="template DynamicDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog" style="width: 900px;">
		<div class="am-modal-hd">{{=$k.constant.getDynamicType(parseInt(it.type))}}
   			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
   		</div>
   		<div class="am-modal-bd" style="max-height: 600px; overflow: auto;">
    		<form class="am-form am-form-horizontal" id="dynamic-input-form">
    			<input name="id" id="id" type="text" class="am-hide"/>
				<div class="am-form-group">
					<label for="title" class="am-u-sm-1 am-form-label font-normal">标题:</label>
		    		<div class="am-u-sm-11">
						<input type="text" name="title" id="title" class="am-form-field"/>
		    		</div>
				</div>

				{{? it.type == "3" || it.type == "4"}}
				<div class="am-form-group am-form-file">
	    			<label for="" class="am-u-sm-1 am-form-label font-normal">图片:</label>
	    			<div class="am-u-sm-2 am-text-left">
						<button type="button" class="am-btn am-btn-secondary">
   						<i class="am-icon-cloud-upload"></i> 选择图片</button>
 						<input id="upload-file-input" name="uploadImage" type="file" accept="image/jpg,image/jpeg,image/png,image/gif,image/bmp">
 					</div>
	    			<div class="am-u-sm-9">
	      				<input type="text" id="imagePath" name="imagePath" class="am-form-field" style="line-height:normal;"/>
						{{? it.type == "3"}}
						<span class="am-text-danger am-padding-left-xs">(*最佳图片大小建议为500px*270px)</span>
						{{?? it.type == "4"}}
						<span class="am-text-danger am-padding-left-xs">(*最佳图片大小建议为1024px*250px)</span>
						{{??}}
						{{?}}
	    			</div>
	 		 	</div>
				{{?}}
				<div class="am-form-group">
		    		<label for="remark" class="am-u-sm-1 am-form-label font-normal">正文:</label>
		    		<div class="am-u-sm-11">
						<div id="editor" name="editor" type="text/plain" style="height: 320px; text-align: left;"></div>
		    		</div>
					<em class="error am-hide">正文不能为空！</em>
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
<script class="template DynamicList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th><input type="checkbox" class="box_all"/></th>
		<th>#</th>
		<th>标题</th>
		<th>链接地址</th>
		<th>创建时间</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: dynamic:index }}
	<tr class="table-tr">
		<td><input type='checkbox' class='box' name='box'/></td>
		<td id="{{=dynamic.id}}">{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=dynamic.title}}">{{=dynamic.title}}</td>
		<td title="查看"><span class="linkPath clickableLink">{{=dynamic.linkPath || ""}}</span></td>
		<td>{{=new Date(dynamic.createTime).format("yyyy-mm-dd")}}</td>
	</tr>
	{{~}}
</tbody>
</script>
<link type="text/css" rel="stylesheet" href="./js/ueditor/third-party/video-js/video-js.css"/>

<script language="javascript" type="text/javascript" src="./js/ueditor/third-party/video-js/video.js"></script>
<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Dynamic";
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
				.on("click", ".dynamic-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempDialogTar.doT({
						type: self.type
					}));
					var ue = $k.util.ueditor('editor');
					self.getValidate($dialog);
					$dialog.modal({
						closeViaDimmer: false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if(!UE.getEditor('editor').hasContents()) {
								$dialog.find("#editor").parent().next().removeClass("am-hide");
								setTimeout(function() {
									$dialog.find("#editor").parent().next().addClass("am-hide");
								}, '1000')
								return;
							}
							if ($dialog.find('#dynamic-input-form').valid()) {  
								var $dynamicInputForm = $dialog.find("#dynamic-input-form");
								$.ajax({
									url: "dynamic/add",
									type: "POST",
									data:{
										title: $dynamicInputForm.find("#title").val(),
										type: self.type,
										imagePath: $dynamicInputForm.find("#imagePath").val(),
										content: UE.getEditor('editor').getContent()
									},
									success: function(data) {
										$modal.close($dialog.remove());
										self.load();
										ue.destroy();
									},
									error: function(data) {}
								});
							} else {
								return;
							}
						},
						onCancel: function() {
							this.close($dialog.remove());
							ue.destroy();
						}
					});
				})
				.on("click", ".dynamic-update-btn", function() {
					var id = $k.util.trChecked("dynamic");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "dynamic/detail",
						type: "POST",
						data:{ dynamicId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt dynamic-input"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT({
								type: self.type
							}));
							self.getValidate($dialog);
							var ue = $k.util.ueditor('editor');
									
							$.each(data.data, function(ky, vl) {
								$dialog.find("[name='"+ ky +"']").val(vl);
							});
							// init ueditor
							$.ajax({
								url: "./" + data.data.linkPath,
								success: function(ret) {
									ue.ready(function() {
										ue.setContent(ret);
									});
								}
							});
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									if (!UE.getEditor('editor').hasContents()) {
										setTimeout(function() {
											$dialog.find("#editor").parent().next().addClass("am-hide");
										}, 1000);
										return;
									}
									if ($dialog.find('#dynamic-input-form').valid()) {//如果表单验证成功，则进行提交。  
										var $dynamicInputForm = $dialog.find("#dynamic-input-form");
										$.ajax({
											url: "dynamic/edit",
											type: "POST",
											data:{
												dynamicId: $dynamicInputForm.find("#id").val(),
												title: $dynamicInputForm.find("#title").val(),
												type: self.type,
												imagePath: $dynamicInputForm.find("#imagePath").val(),
												content: UE.getEditor('editor').getContent()
											},
											success: function(data) {
												$modal.close($dialog.remove());
												self.load();
												ue.destroy();
											},
											error: function(err) {}
										});
									}else{
										return;
									}
								},
								onCancel: function(e){
									this.close($dialog.remove());
									ue.destroy();
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".dynamic-delete-btn", function() {
					var ids = $k.util.trOperateChecked("dynamic");
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
								url: 'dynamic/delete',
								type: "POST",
								data: { dynamicIds: ids.toString() },
								success: function(data) {
									if (data.status == 0) {
										self.load();
										$modal.close($dialog.remove());
									} else{
										$k.util.alertModal("删除错误！");
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
				
				.on('change', '#upload-file-input', function() {
					var $form = $tar.find("#dynamic-input-form");
					$form.find(".upload-loading-icon").removeClass("am-hide");
				      $.ajax({
							url: "uploadImage",
							type: "POST",
							data: new FormData($form[0]),
							enctype : 'multipart/form-data',
							processData: false,
							contentType: false,
							cache: false,
							success: function(data) {
								if (data.status == 0) {
									self.$tar.find("#imagePath").val(data.data);
									//$form.find(".upload-loading-icon").addClass("am-hide");
								}
							},
							error: function(data) {}
					});
				})
				
				.on("change", "#dynamic-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#dynamic-table  .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#dynamic-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				})
				.on("click", ".linkPath", function(e) {
					e.stopPropagation();
					window.open($(this).text());
				});
				
				return self;
			}
		},
		draw: {
			value: function(type) {
				var self = this;
				self.type = type;
				self.$tar.html(self.$tempTar.doT({
					title: $k.constant.getDynamicType(parseInt(type))
				}));
				
				return self;
			}
		},
		load: {
			value: function() {
				var self = this;
				var $table = self.$tar.find("#dynamic-table");
				self.$tar.find(".sk-three-bounce").show();
				$table.html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "dynamic/listByType",
					data: {type: parseInt(self.type)},
					type: "POST",
					success: function(data) {
						self.$tar.find(".sk-three-bounce").hide();
						$table.html(
							$(".template.DynamicList").doT({
									data: data.data
								})
							);
				    	self.datatables = $table.dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#dynamic-input-form").validate({
				      errorElement: "em",
				      errorPlacement: function(error, element) { //指定错误信息位置
			    		 error.insertAfter(element);
			    	  }, 
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  title: "required",
				    	  type: "required",
				    	  imagePath: "required"
				      }
			    });
				return validatorr;
			}
		}
	});
	
})( jQuery );
</script>