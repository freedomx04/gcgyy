<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template User" type="text/x-jquery-tmpl">
	<div class="admin-content" style="height:initial!important;">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong></div>
    	</div>

    	<div class="am-g">
    		<div class="am-u-sm-12">
	        	<form class="" id="user">
        			<div class="am-btn-toolbar am-fl">
        				<div class="am-btn-group am-btn-group-xs">
        					<button type="button" class="am-btn am-btn-default user-add-btn"><span class="am-icon-plus"></span> 新增</button>
        					<button type="button" class="am-btn am-btn-default user-update-btn"><span class="am-icon-save"></span> 编辑</button>
							<button type="button" class="am-btn am-btn-default user-psw-btn"><span class="am-icon-lock"></span> 修改密码</button>
							<button type="button" class="am-btn am-btn-default user-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
        				</div>
	        		</div>
					<div class="sk-three-bounce" style="clear: both;">
						<div class="sk-child sk-bounce1"></div>
						<div class="sk-child sk-bounce2"></div>
						<div class="sk-child sk-bounce3"></div>
					</div>
	        		<table class="am-table am-table-striped am-table-hover table-main" id="user-table">
           			</table>
	        	</form>
			</div>
		</div>
	</div>
</script>

<script class="template UserList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th><input type='checkbox' class='box_all' name='box'/></th>
		<th>#</th>
		<th>登录名</th>
		<th>姓名</th>
		<th>电话</th>
		<th>所属部门</th>
		<th>所属企业</th>
		<th>关联角色</th>
		<th>性别</th>
		<th>操作</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: user:index }}
		<tr class="table-tr">
			<td><input type='checkbox' class='box' name='box'/></td>
			<td id="{{=user.id}}">{{=index+1}}</td>
			<td  class="td-name ellipsis" title="{{=user.username}}"><a class="userInfo-href">{{=user.username}}</a></td>
			<td  class="td-name ellipsis" title="{{=user.name}}">{{=(user.name==null ? "" : user.name)}}</td>	
			<td>{{=user.telephone}}</td>
			<td class="td-name ellipsis" title="{{=user.department==null ? "": user.department.name}}">{{=user.department==null ? "" : user.department.name}}</td>
			<td class="td-name ellipsis" title="{{=user.enterprise==null ? "": user.enterprise.name}}">{{=user.enterprise==null ? "" : user.enterprise.name}}</td>
			<td class="td-name ellipsis" title="{{=user.role==null ? "": user.role.name}}">{{=user.role==null ? "" : user.role.name}}</td>
			<td>{{=(user.sex=="0" ? "女" : user.sex==1?"男":"")}}</td>
			<td disableCode="{{=user.status}}"><a class="user-disable-btn">{{=(user.status==1?"禁用":"恢复")}}</a></td>
		</tr>
	{{~}}
</tbody>
</script>

<script class="template UserDialog" type="text/x-jquery-tmpl">
<div class="am-modal-dialog">
	<div class="am-modal-hd">用户信息
		<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
	</div>
	<div class="am-modal-bd scroll-modal" style="max-height: 420px; overflow: auto;">
		<form class="am-form am-form-horizontal" id="user-input-form">

			<input name="id" id="id" type="text" class="am-hide"/>

			<div class="am-form-group">
				<label for="username" class="am-u-sm-3 am-form-label font-normal">登录名:</label>
    			<div class="am-u-sm-9 padding-left">
					<input type="text" name="username" id="username" class="am-form-field"/>
    			</div>
			</div>
		
			<div class="am-form-group">
				<label for="name" class="am-u-sm-3 am-form-label font-normal">姓名:</label>
    			<div class="am-u-sm-9 padding-left">
					<input type="text" id="name" name="name" class="am-form-field"/>
    			</div>
			</div>

			<div class="am-form-group">
				<label for="roleId" class="am-u-sm-3 am-form-label font-normal">角色:</label>
    			<div class="am-u-sm-9 padding-left">
					<select name="roleId" id="roleId" class="am-form-field">
						<option value="" selected>请选择</option>
						{{~ it.roleData: role}}	
						<option value="{{=role.id}}" resource="{{=role.resource}}">{{=role.name}}</option>
						{{~}}
					</select>
    			</div>
			</div>

			<div class="am-form-group am-hide">
				<label for="departmentId" class="am-u-sm-3 am-form-label font-normal">部门:</label>
    			<div class="am-u-sm-9 padding-left">
					<select name="departmentId" id="departmentId" class="am-form-field">
						<option value="" selected>请选择</option>
						{{~ it.departmentData: department}}	
						<option value="{{=department.id}}">{{=department.name}}</option>
						{{~}}
					</select>
    			</div>
			</div>

			<div class="am-form-group am-hide">
				<label for="enterpriseId" class="am-u-sm-3 am-form-label font-normal">企业:</label>
    			<div class="am-u-sm-9 padding-left">
					<select name="enterpriseId" id="enterpriseId" class="am-form-field"  data-am-selected="{searchBox: 1}">
						<option value="" selected>请选择</option>
						{{~ it.enterpriseData: enterprise}}	
						<option value="{{=enterprise.id}}">{{=enterprise.name}}</option>
						{{~}}
					</select>
    			</div>
			</div>

			<div class="am-form-group">
    			<label for="" class="am-u-sm-3 am-form-label font-normal">性别:</label>
    			<div class="am-u-sm-9 padding-left">
      				<select name="sex" id="sex" class="am-form-field">
						<option value="">请选择</option>
      	   				<option value="1">男</option>
      	   				<option value="0">女</option>
		 			</select>
    			</div>
  			</div>
  
  			<div class="am-form-group">
    			<label for="" class="am-u-sm-3 am-form-label font-normal">邮箱:</label>
    			<div class="am-u-sm-9 padding-left">
      				<input type="text" name="email" id="email" class="am-form-field"/>
    			</div>
  			</div>
  
  			<div class="am-form-group">
   				<label for="" class="am-u-sm-3 am-form-label font-normal">地址:</label>
    			<div class="am-u-sm-9 padding-left">
      				<input type="text" name="address" id="address" class="am-form-field"/>
    			</div>
  			</div>
  
  			<div class="am-form-group">
    			<label for="" class="am-u-sm-3 am-form-label font-normal">办公室电话:</label>
    			<div class="am-u-sm-9 padding-left">
      				<input type="text" name="officephone" id="officephone" class="am-form-field"/>
    			</div>
  			</div>
  
  			<div class="am-form-group"> 
    			<label for="" class="am-u-sm-3 am-form-label font-normal">手机号:</label>
    			<div class="am-u-sm-9 padding-left">
      				<input type="text" name="telephone" id="telephone" class="am-form-field"/>
    			</div>
  			</div>

			<div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">个人描述:</label>
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

<script class="template UserPasswordDialog" type="text/x-jquery-tmpl">
<div class="am-modal-dialog">
	<div class="am-modal-hd">修改用户密码
		<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
	</div>
	<div class="am-modal-bd">
		<form class="am-form am-form-horizontal" id="user-password-input-form">
		<input name="id" type="text" class="am-hide"/>

		<div class="am-form-group">
    		<label for="" class="am-u-sm-3 am-form-label font-normal">原密码:</label>
    		<div class="am-u-sm-9 padding-left">
      			<input type="password" id="oldPassword" name="oldPassword" class="am-form-field"/>
				<em generated="true"></em>
    		</div>
  		</div>

  		<div class="am-form-group">
    		<label for="" class="am-u-sm-3 am-form-label font-normal">新密码:</label>
    		<div class="am-u-sm-9 padding-left">
      			<input type="password" id="newPassword" name="newPassword" class="am-form-field"/>
    		</div>
  		</div>
  
  		<div class="am-form-group">
    		<label for="" class="am-u-sm-3 am-form-label font-normal">确认新密码:</label>
    		<div class="am-u-sm-9 padding-left">
      			<input type="password" id="confirmNewpsw"  name="confirmNewpsw" class="am-form-field"/>
    		</div>
  		</div>
	</form>
</div>
<div class="am-modal-footer">
	<span class="am-modal-btn" data-am-modal-cancel>取消</span>
	<span class="am-modal-btn" data-am-modal-confirm>提交</span>
</div>
</script>
<script type="text/javascript">

;(function( $ ) {
	
	var fnName = "User";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		$tempDialogTar: {
			value: $(".template." + fnName + "Dialog")
		},
		$tempAnotherDialogTar: {
			value: $(".template.UserPasswordDialog")
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				$tar
				.on("change", "#roleId", function() {
					$tar.find("#departmentId").val("");
					$tar.find("#enterpriseId").val("");
					var resource = $(this).find("option:selected").attr("resource");
					if(resource.indexOf("agency_enterprise") != -1) {
						$tar.find("#departmentId").parent().parent().addClass("am-hide");
						$tar.find("#enterpriseId").parent().parent().removeClass("am-hide");
					} else if(resource.indexOf("agency_department") != -1) {
						$tar.find("#enterpriseId").parent().parent().addClass("am-hide");
						$tar.find("#departmentId").parent().parent().removeClass("am-hide");
					} else {
						$tar.find("#enterpriseId").parent().parent().addClass("am-hide");
						$tar.find("#departmentId").parent().parent().addClass("am-hide");
					}
				})
				.on("click", ".user-add-btn", function() {
					$k.util.getEnterpriseList({
						success: function(enterpriseData) {
							$k.util.getDepartmentList({
								success: function(departmentData) {
									$k.util.getRoleList({
										success: function(roleData) {
											var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempDialogTar.doT({
												roleData: roleData.data,
												departmentData: departmentData.data,
												enterpriseData: enterpriseData.data
											}));
											self.getUserValidate($dialog);
											$('[data-am-selected]').selected();
											$dialog.modal({
												closeViaDimmer: false,
												closeOnConfirm: false,
												onConfirm: function(e) {
													var $modal = this;
													if ($dialog.find('#user-input-form').valid()) {//如果表单验证成功，则进行提交。  
														var $userInputForm = $dialog.find("#user-input-form");
														$.ajax({
															url: "user/add",
															type: "POST",
															data: {
																username: $userInputForm.find("#username").val(),
																name: $userInputForm.find("#name").val(),
																roleId: $userInputForm.find("#roleId").val(),
																departmentId: $userInputForm.find("#departmentId").val(),
																enterpriseId: $userInputForm.find("#enterpriseId").val(),
																sex: $userInputForm.find("#sex").val(),
																email: $userInputForm.find("#email").val(),
																address: $userInputForm.find("#address").val(),
																telephone: $userInputForm.find("#telephone").val(),
																officephone: $userInputForm.find("#officephone").val(),
																description: $userInputForm.find("#description").val()
															},
															success: function(data) {
																if (data.status == 0) {
																	self.load();
																	$modal.close($dialog.remove());
																} else if (data.status == 10) {
																}
															},
															error: function(err) {}
														});
													} else {
														return;
													}
												},
												onCancel: function(e){
													this.close($dialog.remove());
												}
											});
										}
									});
								}
							});
						}
					});
				})
				.on("click", ".user-update-btn", function() {
					var id = $k.util.trChecked("user");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "user/detail",
						type: "POST",
						data:{ userId: id },
						success: function(data) {
							$k.util.getEnterpriseList({
								success: function(enterpriseData) {
									$k.util.getDepartmentList({
										success: function(departmentData) {
											$k.util.getRoleList({
												success: function(roleData) {
													var $dialog = $('<div class="am-modal am-modal-prompt user-input"></div>').appendTo(self.$tar);
													$dialog.html(self.$tempDialogTar.doT({
														roleData: roleData.data,
														departmentData: departmentData.data,
														enterpriseData: enterpriseData.data
													}));
													$dialog.find("#username").parent().parent().addClass("am-hide");
													$.each(data.data,function(ky,vl){
														$dialog.find("[name='"+ky+"']").val(vl);
														if(ky=="role"&&vl!=null&&vl!=undefined) {
															$dialog.find("#roleId").val(vl.id);
														}
														if(ky=="department"&&vl!=null&&vl!=undefined) {
															$dialog.find("#departmentId").parent().parent().removeClass("am-hide");
															$dialog.find("#departmentId").val(vl.id);
														} else if(ky=="enterprise"&&vl!=null&&vl!=undefined) {
															$dialog.find("#enterpriseId").parent().parent().removeClass("am-hide");
															$dialog.find("#enterpriseId").val(vl.id);
														}
													});
													self.getUserValidate($dialog);
													$('[data-am-selected]').selected();
													$dialog.modal({
														closeViaDimmer:false,
														closeOnConfirm: false,
														onConfirm: function(e) {
															var $modal = this;
															if ($dialog.find('#user-input-form').valid()) {//如果表单验证成功，则进行提交。  
																var $userInputForm = $dialog.find("#user-input-form");
																$.ajax({
																	url: "user/edit",
																	type: "POST",
																	data: {
																		userId: id,
																		name: $userInputForm.find("#name").val(),
																		roleId: $userInputForm.find("#roleId").val(),
																		departmentId: $userInputForm.find("#departmentId").val(),
																		enterpriseId: $userInputForm.find("#enterpriseId").val(),
																		sex: $userInputForm.find("#sex").val(),
																		email: $userInputForm.find("#email").val(),
																		address: $userInputForm.find("#address").val(),
																		telephone: $userInputForm.find("#telephone").val(),
																		officephone: $userInputForm.find("#officephone").val(),
																		description: $userInputForm.find("#description").val()
																	},
																	success: function(data) {
																		self.load();
																		$modal.close($dialog.remove());
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
				.on("click", ".user-disable-btn", function(e) {
					e.stopPropagation();
					var id =  $(this).parent().parent().find("td").eq(1).attr("id");
					var disableCode = $(this).parent().attr("disableCode");
					var changeStatus = disableCode ==1 ? 0 : 1 ;
					var operateTip = disableCode==1 ? "确定要禁用此用户吗?" : "确定要恢复此用户吗?";
					if(id==null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: operateTip
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: "user/status",
								type: "POST",
								data: {
									userId: id,
									status: changeStatus
								},
								success: function(data) {
									if(data.status=="0"){
										self.load();
										$modal.close($dialog.remove());
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
				.on("click", ".user-psw-btn", function() {
					var id = $k.util.trChecked("user");
					if(id==null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-prompt user-password-input"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempAnotherDialogTar.doT());
					self.getUserPSWValidate($dialog);
					
					$dialog.modal({
						closeViaDimmer: false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#user-password-input-form').valid()) {//如果表单验证成功，则进行提交。 
								$.ajax({
									url: "user/changePassword",
									type: "POST",
									data: {
										userId: id,
										oldPassword: $k.util.encrptByDES($dialog.find("#oldPassword").val()),
                                        newPassword: $k.util.encrptByDES($dialog.find("#newPassword").val()),
									},
									success: function(data) {
										if(data.status=="11") {
											$dialog.find("#oldPassword").next().addClass("error").html("密码错误！！");
											return;
										}else{
											$k.util.alertModal("修改成功！");
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
				})
				.on("click", ".user-delete-btn", function() {
					var id = $k.util.trChecked("user");
					if (id == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "请确认是否删除该用户？",
						content: "<span style='color: red'>如果删除该用户的话，则该用户相关的求职、申报、企业挂点人、催办信息等所有数据信息都将被删除，请知悉！！！</span>"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: 'user/delete',
								type: "POST",
								data: { 
									userId: id, 
								},
								success: function(data) {
									if (data.status == 0) {
										self.load();
										$modal.close($dialog.remove());
									} else if(data.status == 4){
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
				.on("click", ".userInfo-href", function() {
					var id = $(this).parent().prev().attr("id");
					if (id == null) {
						return;
					}
					$.ajax({
						url: "user/detail",
						type: "POST",
						data:{ userId: id },
						success: function(data) {
							$k.util.getEnterpriseList({
								success: function(enterpriseData) {
									$k.util.getDepartmentList({
										success: function(departmentData) {
											$k.util.getRoleList({
												success: function(roleData) {
													var $dialog = $('<div class="am-modal am-modal-prompt" id="user-input"></div>').appendTo(self.$tar);
													$dialog.html(self.$tempDialogTar.doT({
														roleData: roleData.data,
														departmentData: departmentData.data,
														enterpriseData: enterpriseData.data
													}));
													$('[data-am-selected]').selected();
													$dialog.find(".am-selected-list").off("click", "> li");
													$.each(data.data,function(ky,vl){
														$dialog.find("[name='"+ky+"']").val(vl);
														if(ky=="role"&&vl!=null&&vl!=undefined) {
															$dialog.find("#roleId").val(vl.id);
														}
														if(ky=="department"&&vl!=null&&vl!=undefined) {
															$dialog.find("#departmentId").parent().parent().removeClass("am-hide");
															$dialog.find("#departmentId").val(vl.id);
														} else if(ky=="enterprise"&&vl!=null&&vl!=undefined) {
															$dialog.find("#enterpriseId").parent().parent().removeClass("am-hide");
															$dialog.find("#enterpriseId").find('option[value="'+vl.id+'"]').attr('selected', true);
														}
													});
													$dialog.modal({
														closeViaDimmer:false,
														onCancel: function(e){
															this.close($dialog.remove());
														}
													});
													$k.util.inputDisabled("user");
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
				.on("input", "#username", function() {
					$tar.find("#username").rules("add",{usernameIsexist: true, messages:{usernameIsexist: "用户名已存在"}})
				})				
				
				.on("change", "#user-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#user-table .box", function(e) {
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
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				self.$tar.find("#user-table").html("");
				self.$tar.find(".sk-three-bounce").show();
				$.ajax({
					url: "user/list",
					type: "POST",
					success: function(data) {
						self.$tar.find(".sk-three-bounce").hide();
						self.$tar.find("#user-table").html(
							$(".template.UserList").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#user-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getUserValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#user-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  telephone: { required: true, phone: true },
				    	  email: {email: true},
				    	  roleId: "required"
				      },
				      messages: {
				   		  username: "请输入姓名",
				   		  telephone: { phone: "请输入正确的手机格式"}
				      }
			    });
				return validatorr;
			}
		},
		getUserPSWValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#user-password-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  //oldPassword: { required: true, rangelength: [6,12] },
				    	  newPassword: { required: true, rangelength: [6,12] },
				    	  confirmNewpsw: { required: true, equalTo: '#newPassword' }
				      },
				      messages: {
				    	  confirmNewpsw: {required: "请再次确认新密码", equalTo: "两次密码不一致"},
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>

