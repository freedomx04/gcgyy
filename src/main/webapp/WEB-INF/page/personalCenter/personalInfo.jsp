<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template PersonalInfo" type="text/x-jquery-tmpl">
	<div class="admin-content">
	    <div class="am-cf am-padding">
	      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人信息</strong></div>
	    </div>

	    <div class="am-g">
	      	<div class="am-u-sm-12">
	        	<div class="am-btn-toolbar am-fl">
	          		<div class="am-btn-group am-btn-group-sm">
	            		<button type="button" class="am-btn am-btn-default account-edit-btn"><span class="am-icon-edit"></span>修改个人信息</button>
	            		<button type="button" class="am-btn am-btn-default account-changepsw-btn"><span class="am-icon-lock"></span>修改密码</button>
	          		</div>
	        	</div>
	      	</div>
		    <div class="personalInfo-div am-u-sm-12" style="margin-top: 35px;"></div>
	    </div>
  	</div>
</script>

<script class="template PersonalInfoTable" type="text/x-jquery-tmpl">
<table>
	<tr>
		<td style='width: 200px; vertical-align: top;'>
			{{? it.data.imagePath}}
        		<img class='am-u-sm-3 am-radius' src='{{="./"+it.data.imagePath}}' style='width:100%;'>
			{{??}}
				<img src='img/default-user-200.jpg'>
			{{?}}
		</td>
  		<td style='padding-left: 40px;'>
			<table style="line-height: 30px;">
				<tr>
					<td style="width: 80px;"><span>账号名:</span></td>
					<td><span>{{=it.data.username}}</span></td>
				</tr>
				<tr>
					<td style="width: 80px;"><span>姓名:</span></td>
					<td><span>{{=it.data.name}}</span></td>
				</tr>
				<tr>
					<td><span>性别:</span></td>
					<td><span>{{=(it.data.sex=="0" ? "女" : it.data.sex==1?"男":"")}}</span></td>
				</tr>
				<tr>
					<td><span>角色:</span></td>
					<td><span>{{=it.data.role!=null ? it.data.role.name:""}}</span></td>
				</tr>
				<tr>
					<td><span>办公电话:</span></td>
					<td><span>{{=it.data.officephone||""}}</span></td>
				</tr>	
				<tr>
					<td><span>手机号:</span></td>
					<td><span>{{=it.data.telephone||""}}</span></td>
				</tr>
				<tr>
					<td><span>地址:</span></td>
					<td><span>{{=it.data.address||""}}</span></td>
				</tr>
				<tr>
					<td><span>邮箱:</span></td>
					<td><span>{{=it.data.email||""}}</span></td>
				</tr>
				{{? it.data.department!=null}}
				<tr>
					<td><span>所属部门:</span></td>
					<td><span>{{=it.data.department.name||""}}</span></td>
				</tr>
				{{?}}
				{{? it.data.enterprise!=null}}
				<tr>
					<td><span>所属企业:</span></td>
					<td><span>{{=it.data.enterprise.name||""}}</span></td>
				</tr>
				{{?}}
				<tr>
					<td><span>个人描述:</span></td>
					<td><span>{{=it.data.description||""}}</span></td>
				</tr>
			</table>
  		</td>
	</tr>
</table>
</script>

<script class="template PersonalInfoDialog" type="text/x-jquery-tmpl">
	<!-- 修改个人信息  -->
  <div class="am-modal-dialog">
	  <div class="am-modal-hd">
	    	个人信息
	  </div>
	  <div class="am-modal-bd">
	  	 <form class="am-form am-form-horizontal" id="accountInfo-input-form">
	  	 	  <div class="am-form-group am-form-file">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">头像图片:</label>
			    <div class="am-u-sm-4 padding-left">
					<button type="button" class="am-btn am-btn-secondary">
	    			<i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
	  				<input id="upload-file-input" name="uploadImage" type="file" accept="image/*">
	  			</div>
			    <div class="am-u-sm-5">
			      	<input type="text" id="filename" name="filename" class="am-form-field" style="line-height:normal;"/>
					<input type="text" id="imagePath" name="imagePath" class="am-form-field am-hide"/>
			    </div>
			  </div>
			  
	    	  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">姓名:</label>
			    <div class="am-u-sm-9 padding-left">
			      <input type="text" name="name" id="name" class="am-form-field"/>
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
			    <label for="" class="am-u-sm-3 am-form-label font-normal">办公电话:</label>
			    <div class="am-u-sm-9 padding-left">
			      <input type="text" name="officephone" id="officephone" class="am-form-field"/>
			    </div>
			  </div>
			  
			  <div class="am-form-group">
			    <label for="telephone" class="am-u-sm-3 am-form-label font-normal">手机号:</label>
			    <div class="am-u-sm-9 padding-left">
			      <input type="text" id="telephone" name="telephone" class="am-form-field"/>
			    </div>
			  </div>
			  
			  <div class="am-form-group">
			    <label for="address" class="am-u-sm-3 am-form-label font-normal">地址:</label>
			    <div class="am-u-sm-9 padding-left">
			      <input type="text" id="address" name="address" class="am-form-field"/>
			    </div>
			  </div>

			  <div class="am-form-group">
			    <label for="email" class="am-u-sm-3 am-form-label font-normal">邮箱:</label>
			    <div class="am-u-sm-9 padding-left">
			      <input type="text" id="email" name="email" class="am-form-field"/>
			    </div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">个人描述:</label>
			    <div class="am-u-sm-9 padding-left">
			      <textarea rows="5" name="description" id="description"></textarea>
			    </div>
			 </div>
		</form>
	  </div>
	  <div class="am-modal-footer">
		<span class="am-modal-btn" data-am-modal-cancel>取消</span>
		<span class="am-modal-btn" data-am-modal-confirm>提交</span>
	  </div>
	</div>
</script>
<script class="template AccountInfoPSWDialog" type="text/x-jquery-tmpl">
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
	</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "PersonalInfo";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		$tempDialogTar: {
			value: $(".template." + fnName + "Dialog")
		},
		$tempAnotherDialogTar: {
			value: $(".template.AccountInfoPSWDialog")
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				
				$tar
				.on("click", ".account-edit-btn", function() {
					$.ajax({
						url: "user/detail",
						type: "POST",
						data:{
							userId: $k.user.get().id
						},
						success: function(userData) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT());
							self.getValidate($dialog);
							$.each(userData.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl);
								if(ky=="imagePath"&&vl!=""&&vl!=null) {
									$dialog.find("#filename").val(vl.split("/")[vl.split("/").length-1]);
								} 
							})
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									if ($dialog.find('#accountInfo-input-form').valid()) {
										$.ajax({
											url: "user/changeImage",
											type: "POST",
											data:{
												userId: $k.user.get().id,
												imagePath: $dialog.find("#imagePath").val()
											},
											success: function(data) {
												$.ajax({
													url: "user/edit",
													type: "POST",
													data:{
														userId: $k.user.get().id,
														name: $dialog.find("#name").val(),
														roleId: userData.data.role!=null?userData.data.role.id:null,
														departmentId: userData.data.department!=null?userData.data.department.id:null,
														enterpriseId: userData.data.enterprise!=null?userData.data.enterprise.id:null,
														address: $dialog.find("#address").val(),
														email: $dialog.find("#email").val(),
														officephone: $dialog.find("#officephone").val(),
														telephone: $dialog.find("#telephone").val(),
														sex: $dialog.find("#sex").val(),
														description: $dialog.find("#description").val()
													},
													success: function(data) {
														self.load();
														$modal.close($dialog.remove());
													},
													error: function(err) {}
												});
											},
											error: function(err) {}
										});
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
				.on("click", ".account-changepsw-btn", function() {
						var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
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
										data:{
											userId:	$k.user.get().id,
											oldPassword: $k.util.encrptByDES($dialog.find("#oldPassword").val()),
											newPassword: $k.util.encrptByDES($dialog.find("#newPassword").val())
										},
										success: function(data) {
											if(data.status=="11") {
												$dialog.find("#oldPassword").next().addClass("error").html("密码错误！！");
												return;
											}else{
												$k.util.alertModal("修改成功！");
												$modal.close($dialog.remove());
												window.location.href="login.html";
											}
										},
										error: function(err) {}
									});
								}
							},
							onCancel: function(e){
								this.close($dialog.remove());
							}
					   });
				})
				.on("change", "#accountInfo-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#accountInfo-table  .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#accountInfo-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				})
				.on('change', "#upload-file-input", function() {
				      $.ajax({
							url: "uploadImage",
							type: "POST",
							data: new FormData($("#accountInfo-input-form")[0]),
							enctype : 'multipart/form-data',
							processData: false,
							contentType: false,
							success: function(data) {
								if(data.status=="0"){
									self.$tar.find("#imagePath").val(data.data);
									self.$tar.find("#filename").val(data.data.split("/")[data.data.split("/").length-1]);
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
			value: function() {
				var self = this;
				self.$tar.find(".personalInfo-div").html("");
				$.ajax({
					url: "user/detail",
					type: "POST",
					data: {
						userId: $k.user.get().id
					},
					success: function(data) {
						self.$tar.find(".personalInfo-div").html(
							$(".template.PersonalInfoTable").doT({
									data: data.data
								})
							);
					},
					error: function(err) {}
				});
				return self;
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
				    	  newPassword: {required:true,rangelength:[6,12]},
				    	  confirmNewpsw: {required: true, equalTo:'#newPassword'}
				      },
				      messages: {
				    	  confirmNewpsw: {required:"请再次确认新密码", equalTo:"两次密码不一致"},
				      }
			    });
				return validatorr;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#accountInfo-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  name: "required",
				    	  telephone: "required",
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>