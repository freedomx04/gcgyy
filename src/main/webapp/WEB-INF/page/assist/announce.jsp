<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Dynamic" type="text/x-jquery-tmpl">
	<div class="admin-content">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">公告</strong></div>
    	</div>

    	<div class="am-g">
    		<div class="am-u-sm-12">
	        	<form id="dynamic">
					<div class="am-btn-toolbar am-fl">
        				<div class="am-btn-group am-btn-group-xs">
        					<button type="button" class="am-btn am-btn-default dynamic-add-btn"><span class="am-icon-plus"></span> 新增</button>
        					<button type="button" class="am-btn am-btn-default dynamic-update-btn"><span class="am-icon-save"></span> 编辑</button>
        					<button type="button" class="am-btn am-btn-default dynamic-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
        				</div>
	        		</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="dynamic-table">
	            		<thead>
	            			<tr>
								<th class="table-check"><input type="checkbox" class="box_all"/></th>
	            				<th class="table-id  td-number">序号</th>
								<th class="td-title">标题</th>
	            				<th class="td-linkPath">链接地址</th>
	               			</tr>
	            		</thead>
	            		<tbody></tbody>
           			</table>
	        	</form>
			</div>
		</div>
	</div>
</script>

<script class="template DynamicDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog" style="width: 700px;">
		<div class="am-modal-hd">公告
   			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
   		</div>
   		<div class="am-modal-bd" style="max-height: 400px; overflow: auto;">
    		<form class="am-form am-form-horizontal" id="dynamic-input-form">
    			<input name="id" id="id" type="text" class="am-hide"/>
				<div class="am-form-group">
					<label for="title" class="am-u-sm-2 am-form-label font-normal">标题:</label>
		    		<div class="am-u-sm-10 padding-left">
						<input type="text" name="title" id="title" class="am-form-field"/>
		    		</div>
				</div>
				<div class="am-form-group">
		    		<label for="remark" class="am-u-sm-2 am-form-label font-normal">正文:</label>
		    		<div class="am-u-sm-10 padding-left">
						<div id="editor" name="editor" type="text/plain" style="width: 530px; height: 320px; text-align: left;"></div>
						<em class="error am-hide">正文不能为空！</em>
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

<script class="template DynamicList" type="text/x-jquery-tmpl">
	{{~ it.data: dynamic:index }}
	<tr class="table-tr">
		<td><input type='checkbox' class='box' name='box'/></td>
		<td id="{{=dynamic.id}}">{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=dynamic.title}}">{{=dynamic.title}}</td>
		<td title="查看"><span class="linkPath clickableLink">{{=dynamic.linkPath || ""}}</span></td>
	</tr>
	{{~}}
</script>

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
							$dialog.html(self.$tempDialogTar.doT());
							var ue = UE.getEditor('editor', {
								toolbars: [
						           ['fullscreen', 'undo', 'redo', '|', 'bold', 'italic', 'underline', 'fontborder', 
						            'strikethrough', 'superscript', 'subscript', '|', 'formatmatch', 'autotypeset', 
						            'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor'],
						           ['fontfamily', 'fontsize', '|', 'removeformat', 'insertorderedlist', 'insertunorderedlist', 
						            'selectall', 'cleardoc', 'simpleupload', 'emotion', 'map', 'spechars'],
						           ['directionalityltr', 'directionalityrtl', 'indent', '|', 'justifyleft', 'justifyright',
						            'justifycenter', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
						            'link', 'unlink', '|', 'horizontal', 'date', '|'],
						           ['inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow',
						            'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells',
						            'splittorows', 'splittocols', '|', 'preview', 'searchreplace']
						       ],
						     autoHeightEnabled: true,
						     autoFloatEnabled: true,
					});
					self.getValidate($dialog);
					$dialog.modal({
						closeViaDimmer: false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if(!UE.getEditor('editor').hasContents()) {
								setTimeout(function() {
									$dialog.find("#editor").next().addClass("am-hide");
								}, 1000);
								return;
							}
							if ($dialog.find('#dynamic-input-form').valid()) {  
								var $dynamicInputForm = $dialog.find("#dynamic-input-form");
								$.ajax({
									url: "dynamic/add",
									type: "POST",
									data:{
										title: $dynamicInputForm.find("#title").val(),
										allHtml: UE.getEditor('editor').getContent()
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
									$dialog.html(self.$tempDialogTar.doT());
									self.getValidate($dialog);
									var ue = UE.getEditor('editor', {
										toolbars: [
								           ['fullscreen', 'undo', 'redo', '|', 'bold', 'italic', 'underline', 'fontborder', 
								            'strikethrough', 'superscript', 'subscript', '|', 'formatmatch', 'autotypeset', 
								            'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor'],
								           ['fontfamily', 'fontsize', '|', 'removeformat', 'insertorderedlist', 'insertunorderedlist', 
								            'selectall', 'cleardoc', 'simpleupload', 'emotion', 'map', 'spechars'],
								           ['directionalityltr', 'directionalityrtl', 'indent', '|', 'justifyleft', 'justifyright',
								            'justifycenter', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
								            'link', 'unlink', '|', 'horizontal', 'date', '|'],
								           ['inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow',
								            'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells',
								            'splittorows', 'splittocols', '|', 'preview', 'searchreplace']
								       ],
								       autoHeightEnabled: true,
								       autoFloatEnabled: true,
							});
									
									// init ueditor
							$.ajax({
								url: data.data.linkPath,
								success: function(ret) {
									ue.addListener("ready", function() {
										ue.setContent(ret);
									});
								}
							});
							$.each(data.data, function(ky, vl) {
								$dialog.find("[name='"+ ky +"']").val(vl);
							});
							
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									if(!UE.getEditor('editor').hasContents()) {
										setTimeout(function() {
											$dialog.find("#editor").next().addClass("am-hide");
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
												allHtml: UE.getEditor('editor').getContent()
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
			value: function() {
				var self = this;
				self.$tar.html(self.$tempTar.doT());
				return self;
			}
		},
		load: {
			value: function() {
				var self = this;
				self.$tar.find("#dynamic-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "dynamic/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#dynamic-table").find("tbody").html(
							$(".template.DynamicList").doT({
									data: data.data
								})
							);
				    	self.datatables = self.$tar.find("#dynamic-table").dataTable();
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
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  title: "required",
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>
