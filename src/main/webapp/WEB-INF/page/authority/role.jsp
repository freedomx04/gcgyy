<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Role" type="text/x-jquery-tmpl">
	<div class="admin-content">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">角色管理</strong></div>
    	</div>

    	<div class="am-g">
    		<div class="am-u-sm-12">
	        	<form id="role">
					<div class="am-btn-toolbar am-fl">
       					<div class="am-btn-group am-btn-group-xs">
       						<button type="button" class="am-btn am-btn-default role-add-btn"><span class="am-icon-plus"></span> 新增</button>
       						<button type="button" class="am-btn am-btn-default role-update-btn"><span class="am-icon-save"></span> 编辑</button>
       						<button type="button" class="am-btn am-btn-default role-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
       					</div>
        			</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="role-table">
            			<thead>
            				<tr>
            					<th><input type='checkbox' class='box_all' name='box'/></th>
            					<th>#</th>
								<th>角色名称</th>
            					<th>角色编码</th>
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

<script class="template RoleDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">角色信息
   			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
   		</div>
   		<div class="am-modal-bd">
    		<form class="am-form am-form-horizontal" id="role-input-form">
    			<input name="id" id="id" type="text" class="am-hide"/>
				<div class="am-form-group">
					<label for="name" class="am-u-sm-3 am-form-label font-normal">角色名称:</label>
		    		<div class="am-u-sm-9 padding-left">
						<input type="text" name="name" id="name" class="am-form-field"/>
		    		</div>
				</div>
				<div class="am-form-group">
					<label for="code" class="am-u-sm-3 am-form-label font-normal">角色编码:</label>
		    		<div class="am-u-sm-9 padding-left">
						<input type="text" name="code" id="code" class="am-form-field"/>
		    		</div>
				</div>
				<div class="am-form-group">
					<label for="resources" class="am-u-sm-3 am-form-label font-normal">关联资源:</label>
					<div class="am-u-sm-9 padding-left">
		    			<select name="resource" id="resource" multiple data-am-selected="{minHeight: 400}" placeholder="请下拉选择">
	     		 			{{~ $k.user.resource: resource}}
							<optgroup label="{{=resource.name}}">
								{{~ resource.list: module}}
									<option name="{{=module.value}}" value="{{=module.value}}">{{=module.name}}</option>
								{{~}}
							</optgroup>
							{{~}}
						</select>
					</div>
				</div>
				<div class="am-form-group">
		    		<label for="remark" class="am-u-sm-3 am-form-label font-normal">描述:</label>
		    		<div class="am-u-sm-9 padding-left">
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

<script class="template RoleList" type="text/x-jquery-tmpl">
	{{~ it.data: role:index }}
	<tr class="table-tr">
		<td><input type='checkbox' class='box' name='box'/></td>
		<td id="{{=role.id}}">{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=role.name}}"><a class="roleInfo-href">{{=role.name}}</a></td>
		<td class="td-name ellipsis" title="{{=role.code}}">{{=role.code}}</td>
		<td class="td-content ellipsis" title="{{=role.description}}">{{=role.description}}</td>
	</tr>
	{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Role";
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
				.on("click", "li[data-value='agency_enterprise'], li[data-value='agency_department']", function() {
					$this = $(this);
					if ($this.attr("data-value") == "agency_enterprise") {
						if ($this.hasClass("am-checked")) {
							$tar.find("li[data-value='agency_department']").addClass("am-disabled");
						} else {
							$tar.find("li[data-value='agency_department']").removeClass("am-disabled");
						}
					} else {
						if ($this.hasClass("am-checked")) { 
							$tar.find("li[data-value='agency_enterprise']").addClass("am-disabled");
						} else {
							$tar.find("li[data-value='agency_enterprise']").removeClass("am-disabled");
						}
					}
					$.each($tar.find(".am-selected-list li"), function(k, v) {
						if ($(this).html().indexOf("监测") > -1 || ($(this).attr("data-value") != undefined && $(this).attr("data-value").indexOf("monitor") > -1 && $(this).attr("data-value").indexOf("assist") == -1)) {
							if ($this.hasClass("am-checked")) {
								$(this).removeClass("am-hide");
							} else {
								$(this).addClass("am-hide");
							}
						} else if ($(this).attr("data-value") != undefined && $(this).attr("data-value").indexOf("assist_appeal") > -1) {
							if($this.hasClass("am-checked")) {
								$(this).addClass("am-hide");
							} else {
								$(this).removeClass("am-hide");
							}
						}
					});
				})
				.on("click", ".role-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempDialogTar.doT());
					self.getValidate($dialog);
					$('[data-am-selected]').selected();
					$.each($dialog.find(".am-selected-list li"), function(k, v) {
						if($(this).html().indexOf("监测") > -1 || ($(this).attr("data-value") != undefined && $(this).attr("data-value").indexOf("monitor") > -1 && $(this).attr("data-value").indexOf("assist") == -1)) {
							$(this).addClass("am-hide");
						}
					});
					$dialog.modal({
						closeViaDimmer: false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#role-input-form').valid()) {  
								var $roleInputForm = $dialog.find("#role-input-form");
								$.ajax({
									url: "role/add",
									type: "POST",
									data:{
										name: $roleInputForm.find("#name").val(),
										code: $roleInputForm.find("#code").val(),
										resource: String($roleInputForm.find("#resource").val()),
										description: $roleInputForm.find("#description").val()
									},
									success: function(data) {
										if(data.status == 3) {
											$dialog.find("#name").next().removeClass("success").text("该角色名称已存在！");
										} else {
											self.load();
											$modal.close($dialog.remove());
										}
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
				})
				.on("click", ".role-update-btn", function() {
					var id = $k.util.trChecked("role");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "role/detail",
						type: "POST",
						data:{ roleId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt role-input"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT());
							var ep = false;
							var gv = false
							$.each(data.data, function(key, val) {
								if (key == "resource") {
									var arr = val.split(",");
									$.each(arr, function(k, v) {
										$dialog.find('option[value="'+v+'"]').attr('selected', true);
										if(v == "agency_enterprise") {
											ep = true;
										} else if(v == "agency_department") {
											gv = true;
										}
									});
								} else {
									$dialog.find("[name='"+key+"']").val(val);
								}
							});
							
							$('[data-am-selected]').selected();
							
							/* $.each($dialog.find(".am-selected-list li"), function(k, v) {
								if (!gv && !ep) {
									if($(this).html().indexOf("监测") > -1 || ($(this).attr("data-value") != undefined && $(this).attr("data-value").indexOf("monitor") > -1 && $(this).attr("data-value").indexOf("assist") == -1)) {
										$(this).addClass("am-hide");
									}
								}
								if (gv) {
									if($(this).attr("data-value") != undefined && $(this).attr("data-value").indexOf("assist_appeal") > -1) {
										$(this).addClass("am-hide");
									}
								}
							}); */
							
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									if ($dialog.find('#role-input-form').valid()) {//如果表单验证成功，则进行提交。  
										var $roleInputForm = $dialog.find("#role-input-form");
										
										$.ajax({
											url: "role/edit",
											type: "POST",
											data:{
												roleId: $roleInputForm.find("#id").val(),
												name: $roleInputForm.find("#name").val(),
												code: $roleInputForm.find("#code").val(),
												resource: String($roleInputForm.find("#resource").val()),
												description: $roleInputForm.find("#description").val()
											},
											success: function(data) {
												if(data.status == 3) {
													$dialog.find("#name").next().removeClass("success").text("该角色名称已存在！");
												} else {
													self.load();
													$modal.close($dialog.remove());
												}
											},
											error: function(err) {}
										});
									}else{
										return;
									}
								},
								onCancel: function(e){
									this.close($dialog.remove());
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".role-delete-btn", function() {
					var ids = $k.util.trOperateChecked("role");
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
								url: 'role/delete',
								type: "POST",
								data: { roleIds: ids.toString(), },
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
				.on("click",".roleInfo-href",function(e){
					e.stopPropagation();
					var roleId = $(this).parent().prev().attr("id");
					$.ajax({
						url: "role/detail",
						type: "POST",
						data:{
							roleId: roleId
						},
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt" id="role-input"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT());
							$('[data-am-selected]').selected();
							$dialog.find(".am-selected-list").off("click", "> li");
							$.each(data.data, function(key, val) {
								if (key == "resource") {
									var arr = val.split(",");
									$.each(arr, function(k, v) {
										$dialog.find('option[value="'+v+'"]').attr('selected', true);
									});
								} else {
									$dialog.find("[name='"+key+"']").val(val);
								}
							});
							$dialog.modal({
								closeViaDimmer: false,
								onCancel: function(e){
									this.close($dialog.remove());
								}
							});
							$k.util.inputDisabled("role");
						},
						error: function(err) {}
					});
				})
				
				.on("change", "#role-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#role-table  .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#role-table .table-tr", function(e) {
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
				self.$tar.find("#role-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "role/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#role-table").find("tbody").html(
							$(".template.RoleList").doT({
									data: data.data
								})
							);
				    	self.datatables = self.$tar.find("#role-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#role-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  description:"required",
				    	  name:"required",
				    	  code:"required"
				      }
			    });
				return validatorr;
			}
		}
	});
	
})( jQuery );
</script>