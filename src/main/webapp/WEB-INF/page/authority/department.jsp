<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Department" type="text/x-jquery-tmpl">
	<div class="admin-content">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">部门管理</strong></div>
    	</div>

    	<div class="am-g">
    		<div class="am-u-sm-12">
	        	<form class="" id="department">
					<div class="am-btn-toolbar am-fl">
        				<div class="am-btn-group am-btn-group-xs">
        					<button type="button" class="am-btn am-btn-default department-add-btn"><span class="am-icon-plus"></span> 新增</button>
        					<button type="button" class="am-btn am-btn-default department-update-btn"><span class="am-icon-save"></span> 编辑</button>
        					<button type="button" class="am-btn am-btn-default department-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
        				</div>
	        		</div>
					<div class="department-table"></div>
	        	</form>
			</div>
		</div>
	</div>
</script>

<script class="template DepartmentDialog" type="text/x-jquery-tmpl">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">部门信息
    			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    		</div>
    		<div class="am-modal-bd">
	    		<form class="am-form am-form-horizontal" id="department-input-form">
	    			<input name="id" id="id" type="text" class="am-hide"/>
					<div class="am-form-group">
						<label for="name" class="am-u-sm-3 am-form-label font-normal">部门名称:</label>
			    		<div class="am-u-sm-9 padding-left">
							<input type="text" name="name" id="name" class="am-form-field"/>
			    		</div>
					</div>
					<div class="am-form-group">
						<label for="areaId" class="am-u-sm-3 am-form-label font-normal">所属园区:</label>
			    		<div class="am-u-sm-9 padding-left">
							<select name="areaId" id="areaId" class="am-form-field">
								<option value="" selected>请选择</option>
								{{~ it.areaData: area}}	
									<option value="{{=area.id}}">{{=area.name}}</option>
								{{~}}
							</select>
			    		</div>
					</div>
		
					<div class="am-form-group">
						<label for="principal" class="am-u-sm-3 am-form-label font-normal">部门负责人:</label>
			    		<div class="am-u-sm-9 padding-left">
							<input type="text" name="principal" id="principal" class="am-form-field"/>
			    		</div>
					</div>

					<div class="am-form-group">
			    		<label for="description" class="am-u-sm-3 am-form-label font-normal">部门信息:</label>
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

<script class="template DepartmentTable" type="text/x-jquery-tmpl">
	<table class="am-table am-table-striped am-table-hover table-main" id="department-table">
		<thead>
			<tr>
				<th><input type='checkbox' class='box_all' name='box'/></th>
		        <th>#</th>
				<th>部门名称</th>
				<th>所属园区</th>
				<th>部门负责人</th>
				<th>部门联系人</th>
		    </tr>
		</thead>
		<tbody>
			{{~ it.data: department: num }}
			<tr class="table-tr">
				<td><input type='checkbox' class='box' name='box'/></td>
				<td id="{{=department.id}}">{{=num+1}}</td>
				<td class="td-title ellipsis" title="{{=department.name}}"><a class="departmentInfo-href">{{=department.name || ""}}</a></td>
				<td class="ellipsis td-name">{{=department.area!=null ? department.area.name : ""}}</td>
				<td class="td-name ellipsis" title="{{=department.principal}}">{{=department.principal || ""}}</td>
				<td class="td-name ellipsis">
					{{~department.users: user:x}}
						{{?x!=(department.users.length-1)}}
						<a class="userInfo-href" id="{{=user.id}}">{{=user.name}}</a>{{=","}}
						{{??x == (department.users.length-1)}}
						<a class="userInfo-href" id="{{=user.id}}">{{=user.name}}</a>
					{{?}}
				{{~}}
			</td>
			</tr>
		{{~}}
		</tbody>
	</table>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Department";
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
				.on("click", ".department-add-btn", function() {
					$k.util.getAreaList({
						success: function(areaData) {
							$k.util.getUserList({
								success: function(userData) {
									var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
									$dialog.html(self.$tempDialogTar.doT({
										data: userData.data,
										areaData: areaData.data
									}));
									$('[data-am-selected]').selected();
									self.getValidate($dialog);
									
									$dialog.modal({
										closeViaDimmer: false,
										closeOnConfirm: false,
										onConfirm: function(e) {
											var $modal = this;
											if ($dialog.find('#department-input-form').valid()) {//如果表单验证成功，则进行提交。  
												var $departmentForm = $dialog.find("#department-input-form");
												$.ajax({
													url: "department/add",
													type: "POST",
													data: {
														name: $departmentForm.find("#name").val(),
														description: $departmentForm.find("#description").val(),
														principal: $departmentForm.find("#principal").val(),
														areaId: $departmentForm.find("#areaId").val(),
													},
													success: function(data) {
														self.load();
														$modal.close($dialog.remove());
													},
													error: function(data) {}
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
						}
					});
				})
				.on("click", ".department-update-btn", function() {
					var id = $k.util.trChecked("department");
					if (id == null){
						return;
					}
					
					$.ajax({
						url: "department/detail",
						type: "POST",
						data:{ departmentId: id },
						success: function(data) {
							$k.util.getAreaList({
								success: function(areaData) {
									$k.util.getUserList({
										success: function(userData) {
											var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempDialogTar.doT({
												data: userData.data,
												areaData: areaData.data,
												departmentId: id
											}));
											$('[data-am-selected]').selected();
											self.getValidate($dialog);
											$.each(data.data, function(ky, vl){
												$("[name='"+ky+"']").val(vl);
												if(ky == "area" && vl!=null) {
													$dialog.find("[name='areaId']").val(vl.id);
												}
											});
											
											$dialog.modal({
												closeViaDimmer: false,
												closeOnConfirm: false,
												onConfirm: function(e) {
													var $modal = this;
													if ($dialog.find('#department-input-form').valid()) {
														var $departmentForm = $dialog.find("#department-input-form");
														$.ajax({
															url: "department/edit",
															type: "POST",
															data: {
																departmentId: $departmentForm.find("#id").val(),
																name: $departmentForm.find("#name").val(),
																description: $departmentForm.find("#description").val(),
																principal: $departmentForm.find("#principal").val(),
																areaId: $departmentForm.find("#areaId").val(),
															},
															success: function(data) {
																self.load();
																$modal.close($dialog.remove());
															},
															error: function(data) {}
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
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".department-delete-btn", function() {
					var ids = $k.util.trOperateChecked("department");
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
								url: "department/delete",
								type: "POST",
								data: { departmentIds: ids.toString() },
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
				.on("click",".departmentInfo-href",function(e){
					e.stopPropagation();
					var id = $(this).parent().prev().attr("id");
					$.ajax({
						url: "department/detail",
						type: "POST",
						data:{
							departmentId: id
						},
						success: function(data) {
							$k.util.getAreaList({
								success: function(areaData) {
									$k.util.getUserList({
										success: function(userData) {
											var $dialog = $('<div class="am-modal am-modal-prompt" id="department-input"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempDialogTar.doT({
												data: userData.data,
												areaData: areaData.data,
												departmentId: id
											}));
											$('[data-am-selected]').selected();
											$dialog.find(".am-selected-list").off("click", "> li");
											$.each(data.data,function(ky,vl){
												$dialog.find("[name='"+ky+"']").val(vl);
												if(ky == "area" && vl!=null) {
													$dialog.find("[name='areaId']").val(vl.id);
												}
											});
											$dialog.modal({
												closeViaDimmer: false,
												onCancel: function(e){
													this.close($dialog.remove());
												}
											});
											$k.util.inputDisabled("department");
										}
									});
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click",".userInfo-href",function(e){
					e.stopPropagation();
					var id = $(this).attr("id");
					$.ajax({
						url: "user/detail",
						type: "POST",
						data:{
							userId: id
						},
						success: function(data) {
							$k.util.getRoleList({
								success: function(roleData) {
									var $dialog = $('<div class="am-modal am-modal-prompt" id="user-input"></div>').appendTo(self.$tar);
									$dialog.html($(".template.UserDialog").doT({
										roleData: roleData.data
									}));
									$.each(data.data,function(ky,vl){
										$dialog.find("[name='"+ky+"']").val(vl);
										if(ky=="role"&&vl!=null&&vl!=undefined) {
											$dialog.find("#roleId").val(vl.id);
										}
									});
									$dialog.modal({
										closeViaDimmer: false,
										onCancel: function(e){
											this.close($dialog.remove());
										}
									});
									$k.util.inputDisabled("user");
								}
							})
						},
						error: function(err) {}
					});
				})
				.on("change", "#department-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#department-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#department-table .table-tr", function(e) {
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
				self.$tar.find("#department-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "department/list",
					type: "POST",
					success: function(data) {
						self.$tar.find(".department-table").html(
							$(".template.DepartmentTable").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#department-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#department-input-form").validate({
				      errorElement: "em",
				      errorPlacement: function(error, element) { //指定错误信息位置
				    	  if (element.is('#userIds') ) { //如果是radio或checkbox
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
				    	  name: "required",
				    	  principal: "required",
				    	  areaId: "required",
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>