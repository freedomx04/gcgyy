<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template policy" type="text/x-jquery-tmpl">
	<div class="admin-content">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">政策信息</strong></div>
    	</div>

    	<div class="am-g">
    		<div class="am-u-sm-12">
	        	<form id="policy">
					<div class="am-btn-toolbar am-fl">
	       				<div class="am-btn-group am-btn-group-xs">
	       					<button type="button" class="am-btn am-btn-default policy-add-btn"><span class="am-icon-plus"></span> 新增</button>
	       					<button type="button" class="am-btn am-btn-default policy-update-btn"><span class="am-icon-save"></span> 编辑</button>
	       					<button type="button" class="am-btn am-btn-default policy-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
	       				</div>
	        		</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="policy-table">
	            		<thead>
	            			<tr>
								<th><input type="checkbox" class="box_all"/></th>
	            				<th>序号</th>
	            				<th>类型</th>
								<th>标题</th>
	            				<th>链接地址</th>
	               			</tr>
	            		</thead>
	            		<tbody></tbody>
	          			</table>
	        	</form>
			</div>
		</div>
	</div>
</script>

<script class="template PolicyDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog" style="width: 700px;">
		<div class="am-modal-hd">政策信息
   			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
   		</div>
   		<div class="am-modal-bd" style="max-height: 400px; overflow: auto;">
    		<form class="am-form am-form-horizontal" id="policy-input-form">
    			<input name="id" id="id" type="text" class="am-hide"/>
				<div class="am-form-group">
					<label for="title" class="am-u-sm-2 am-form-label font-normal">标题:</label>
		    		<div class="am-u-sm-10 padding-left">
						<input type="text" name="title" id="title" class="am-form-field"/>
		    		</div>
				</div>
				<div class="am-form-group">
					<label for="policyTypeId" class="am-u-sm-2 am-form-label font-normal">类型:</label>
					<div class="am-u-sm-10 padding-left">
		    			<select name="policyTypeId" id="policyTypeId"  maxchecked="1" >
							<option value="">请选择</option>
	     		 			{{~ it.data: policyType}}	
								<option value="{{=policyType.id}}">{{=policyType.name}}</option>
							{{~}} 
						</select>
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

<script class="template PolicyList" type="text/x-jquery-tmpl">
	{{~ it.data: policy:index }}
	<tr class="table-tr">
		<td><input type='checkbox' class='box' name='box'/></td>
		<td id="{{=policy.id}}">{{=index+1}}</td>
		<td class="td-name ellipsis" title="{{=policy.policyType.name}}">{{=policy.policyType.name}}</td>
		<td class="td-title ellipsis" title="{{=policy.title}}">{{=policy.title}}</td>
		<td title="查看"><span class="linkPath clickableLink">{{=policy.linkPath || ""}}</span></td>
	</tr>
	{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Policy";
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
				.on("click", ".policy-add-btn", function() {
					$k.util.getPolicyTypeList({
						success: function(policyData){
							var $dialog = $('<div class="am-modal am-modal-prompt" id="policy-input"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT({
								data: policyData.data
							}));
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
							$('[data-am-selected]').selected();
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									if(!UE.getEditor('editor').hasContents()) {
										$dialog.find("#editor").next().removeClass("am-hide");
										setTimeout(function() {
											$dialog.find("#editor").next().addClass("am-hide");
										}, 1500);
										return;
									}
									if ($dialog.find('#policy-input-form').valid()) {  
										var $policyInputForm = $dialog.find("#policy-input-form");
										$.ajax({
											url: "policy/add",
											type: "POST",
											data:{
												title: $policyInputForm.find("#title").val(),
												policyTypeId: String($policyInputForm.find("#policyTypeId").val()),
												allHtml: UE.getEditor('editor').getContent()
											},
											success: function(data) {
												$modal.close($dialog.remove());
												self.load();
												ue.destroy();
											},
											error: function(data) {ue.destroy();}
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
						}
					});
				})
				.on("click", ".policy-update-btn", function() {
					var id = $k.util.trChecked("policy");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "policy/detail",
						type: "POST",
						data:{ policyId: id },
						success: function(data) {
							$k.util.getPolicyTypeList({
								success: function(policyData){
									var $dialog = $('<div class="am-modal am-modal-prompt policy-input"></div>').appendTo(self.$tar);
									$dialog.html(self.$tempDialogTar.doT({
										data: policyData.data
									}));
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
									self.getValidate($dialog);
									$('[data-am-selected]').selected();
									
									$.each(data.data, function(ky, vl) {
										if(ky == "policyType"){
											$dialog.find("[name='policyTypeId']").val(vl.id);
										}else{
											$dialog.find("[name='"+ ky +"']").val(vl);
										}
									});
									
									$dialog.modal({
										closeViaDimmer: false,
										closeOnConfirm: false,
										onConfirm: function(e) {
											var $modal = this;
											if(!UE.getEditor('editor').hasContents()) {
												$dialog.find("#editor").next().removeClass("am-hide");
												setTimeout(function() {
													$dialog.find("#editor").next().addClass("am-hide");
												}, 1500);
												return;
											}
											if ($dialog.find('#policy-input-form').valid()) {//如果表单验证成功，则进行提交。  
												var $policyInputForm = $dialog.find("#policy-input-form");
												
												$.ajax({
													url: "policy/edit",
													type: "POST",
													data:{
														policyId: $policyInputForm.find("#id").val(),
														title: $policyInputForm.find("#title").val(),
														policyTypeId: String($policyInputForm.find("#policyTypeId").val()),
														allHtml: UE.getEditor('editor').getContent()
													},
													success: function(data) {
														$modal.close($dialog.remove());
														self.load();
														ue.destroy();
													},
													error: function(err) {ue.destroy();}
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
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".policy-delete-btn", function() {
					var ids = $k.util.trOperateChecked("policy");
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
								url: 'policy/delete',
								type: "POST",
								data: { policyIds: ids.toString() },
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
				
				
				.on("change", "#policy-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#policy-table  .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#policy-table .table-tr", function(e) {
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
				self.$tar.find("#policy-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "policy/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#policy-table").find("tbody").html(
							$(".template.PolicyList").doT({
									data: data.data
								})
							);
				    	self.datatables = self.$tar.find("#policy-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#policy-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  title: "required",
				    	  policyTypeId: "required",
						  eidtor: "required"				    	  
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>
