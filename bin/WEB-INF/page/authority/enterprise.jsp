<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Enterprise" type="text/x-jquery-tmpl">
	<div class="admin-content" style="height:initial!important;">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">企业管理</strong></div>
    	</div>

    	<div class="am-g">
    		<div class="am-u-sm-12  am-scrollable-horizontal">
	        	<form id="enterprise">
	        		<div class="am-btn-toolbar am-fl">
	        			<div class="am-btn-group am-btn-group-xs">
	        				<button type="button" class="am-btn am-btn-default enterprise-add-btn"><span class="am-icon-plus"></span> 新增</button>
	        				<button type="button" class="am-btn am-btn-default enterprise-update-btn"><span class="am-icon-save"></span> 编辑</button>
	        				<button type="button" class="am-btn am-btn-default enterprise-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
	        			</div>
		        	</div>
					<div class="sk-three-bounce" style="clear: both;">
						<div class="sk-child sk-bounce1"></div>
						<div class="sk-child sk-bounce2"></div>
						<div class="sk-child sk-bounce3"></div>
					</div>
		        	<table class="am-table am-table-striped am-table-hover table-main am-text-nowrap" id="enterprise-table">
	           		</table>
	        	</form>
			</div>
		</div>
	</div>
</script>

<script class="template EnterpriseDialog" type="text/x-jquery-tmpl">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">企业信息
    			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    		</div>
    		<div class="am-modal-bd" style="max-height:500px;overflow:auto;">
	    		<form class="am-form am-form-horizontal" id="enterprise-input-form">

	    			<input name="id" id="id" type="text" class="am-hide"/>

					<div class="am-form-group">
						<label for="name" class="am-u-sm-3 am-form-label font-normal">企业名称:</label>
			    		<div class="am-u-sm-9">
							<input type="text" name="name" id="name" class="am-form-field"/>
			    		</div>
					</div>

					<div class="am-form-group">
						<label for="name" class="am-u-sm-3 am-form-label font-normal">是否重点:</label>
			    		<div class="am-u-sm-9 am-text-left" style="padding-top: 1.2rem;">
							<input type="checkbox" name="pointStatus" id="pointStatus" value="1"/>
			    		</div>
					</div>

					<div class="am-form-group am-form-file">
			    		<label for="" class="am-u-sm-3 am-form-label font-normal">企业图片:</label>
			    		<div class="am-u-sm-3">
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
			     		<div class="am-u-sm-9">
			        		<img src="" style="width: 100%; max-width: 300px; max-height: 200px;"/>
			     		</div>
			  		</div>

					<div class="am-form-group">
						<label for="areaId" class="am-u-sm-3 am-form-label font-normal">所属区域:</label>
						<div class="am-u-sm-9">
			    			<select name="areaId" id="areaId">
								<option value="">请选择</option>
								{{~ it.areaData: area}}	
									<option value="{{=area.id}}">{{=area.name}}</option>
								{{~}} 
		     		 		</select>
						</div>
					</div>

					<div class="am-form-group">
						 <label for="" class="am-u-sm-3 am-form-label font-normal">主要产品:</label>
						 <div class="am-u-sm-9">
						     <input type="text" name="mainProduct" id="mainProduct" class="am-form-field"/>
						 </div>
				    </div>

					<div class="am-form-group">
						<label for="industryId" class="am-u-sm-3 am-form-label font-normal">产业类别:</label>
						<div class="am-u-sm-9">
			    			<select name="productTypeId" id="productTypeId">
								<option value="" selected>请选择</option>
								{{~ it.productTypeData: productType}}	
									<option value="{{=productType.id}}">{{=productType.name}}</option>
								{{~}} 
		     		 		</select>
						</div>
					</div>

					<div class="am-form-group">
						 <label for="" class="am-u-sm-3 am-form-label font-normal">投产时间:</label>
						 <div class="am-u-sm-9">
						     <input type="text" name="productionTime" id="productionTime" class="am-form-field datetimepicker"/>
						 </div>
				    </div>

					<div class="am-form-group">
						 <label for="" class="am-u-sm-3 am-form-label font-normal">企业负责人:</label>
						 <div class="am-u-sm-9">
						     <input type="text" name="principal" id="principal" class="am-form-field"/>
						 </div>
				    </div>

					<div class="am-form-group">
						<label class="am-u-sm-3 am-form-label font-normal">联系电话:</label>
			    		<div class="am-u-sm-9">
							<input type="text" name="telephone" id="telephone" class="am-form-field"/>
			    		</div>
					</div>

					<div class="am-form-group">
		    			<label for="pointUserId" class="am-u-sm-3 am-form-label font-normal">挂点人:</label>
		    			<div class="am-u-sm-9">
							<select name="pointUserId" id="pointUserId" class="am-form-field" data-am-selected="{searchBox: 1}" maxchecked="1">
								<option value="">请选择</option>
								{{~ it.userData: user}}	
									{{if (user.department != null){ }}
									<option value="{{=user.id}}">{{=user.name}}</option>
									{{ } }}
								{{~}} 
							</select>
		    			</div>
		  			</div>
					
					<div class="am-form-group">
						<label  class="am-u-sm-3 am-form-label font-normal">地址:</label>
			    		<div class="am-u-sm-9">
							<input type="text" name="address" id="address" class="am-form-field"/>
			    		</div>
					</div>

					<div class="am-form-group">
						 <label for="" class="am-u-sm-3 am-form-label font-normal">国税识别码:</label>
						 <div class="am-u-sm-9">
						     <input type="text" name="nationalTaxNumber" id="nationalTaxNumber" class="am-form-field"/>
						 </div>
				    </div>
				
					<div class="am-form-group">
						 <label for="" class="am-u-sm-3 am-form-label font-normal">国税纳税人:</label>
						 <div class="am-u-sm-9">
						     <input type="text" name="nationalTaxUser" id="nationalTaxUser" class="am-form-field"/>
						 </div>
				    </div>

					<div class="am-form-group">
						 <label for="" class="am-u-sm-3 am-form-label font-normal">地税识别码:</label>
						 <div class="am-u-sm-9">
						     <input type="text" name="localTaxNumber" id="localTaxNumber" class="am-form-field"/>
						 </div>
				    </div>

					<div class="am-form-group">
						 <label for="" class="am-u-sm-3 am-form-label font-normal">地税纳税人:</label>
						 <div class="am-u-sm-9">
						     <input type="text" name="localTaxUser" id="localTaxUser" class="am-form-field"/>
						 </div>
				    </div>

					<div class="am-form-group">
		    			<label for="introduction" class="am-u-sm-3 am-form-label font-normal">企业简介:</label>
		    			<div class="am-u-sm-9">
							<textarea rows="5" name="introduction" id="introduction"></textarea>
		    			</div>
					</div>
		
					<div class="enterprise-credit am-hide">
						  <div class="am-form-group">
						    <label for="shareholder" class="am-u-sm-3 am-form-label font-normal">主要股东:</label>
						    <div class="am-u-sm-9">
						      <input type="text" name="shareholder" id="shareholder" class="am-form-field"/>
						    </div>
						  </div>
				
						  <div class="am-form-group">
						    <label for="representative" class="am-u-sm-3 am-form-label font-normal">企业法人:</label>
						    <div class="am-u-sm-9">
						      <input type="text" id="representative" name="representative" class="am-form-field"/>
						    </div>
						  </div>
						  
						  <div class="am-form-group">
						    <label for="registeredCapital" class="am-u-sm-3 am-form-label font-normal">注册资金:</label>
						    <div class="am-u-sm-9">
						      <input type="text" id="registeredCapital" name="registeredCapital" class="am-form-field"/>
						    </div>
						  </div>
				
					  	<div class="am-form-group">
					    	<label for="alterRecording" class="am-u-sm-3 am-form-label font-normal">主要变更记录:</label>
					    	<div class="am-u-sm-9">
					      	<textarea rows="5" name="alterRecording" id="alterRecording"></textarea>
					    	</div>
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

<script class="template EnterpriseList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th><input type='checkbox' class='box_all' name='box'/></th>
		<th>#</th>
		<th>企业名称</th>
		<th>是否重点</th>
		<th>所属园区</th>
		<th>企业负责人</th>
		<th>联系电话</th>
		<th>企业联系人</th>
		<th>产业类别</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: enterprise:index }}
	<tr class="table-tr">
		<td><input type='checkbox' class='box' name='box'/></td>
		<td id="{{=enterprise.id}}">{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=enterprise.name|| "" }}"><a class="enterpriseInfo-href">{{=(enterprise.name|| "" )}}</a></td>
		<td>{{= enterprise.pointStatus == 0 ? "否" : enterprise.pointStatus == 1 ? "是" :""}}</td>
		<td class="td-name ellipsis">{{=enterprise.area!=null?enterprise.area.name:""}}</td>
		<td class="td-name ellipsis">{{=enterprise.principal || ""}}</td>
		<td>{{=(enterprise.telephone|| "" )}}</td>
		<td class="td-name ellipsis">
			{{~enterprise.users: user:x}}
				{{?x!=(enterprise.users.length-1)}}
					<a class="userInfo-href" id="{{=user.id}}">{{=user.name}}</a>{{=","}}
				{{??x == (enterprise.users.length-1)}}
					<a class="userInfo-href" id="{{=user.id}}">{{=user.name}}</a>
				{{?}}
			{{~}}
		</td>
		<td class="td-name ellipsis" title="{{=enterprise.productType!=null?enterprise.productType.name:""}}">{{=enterprise.productType!=null?enterprise.productType.name:""}}</td>
	</tr>
	{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Enterprise";
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
				.on("click", ".enterprise-add-btn", function() {
					$k.util.getUserList({
						success: function(userData) {
							$k.util.getProductTypeList({
								success: function(productTypeData) {
									$k.util.getAreaList({
										success: function(areaData) {
											var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempDialogTar.doT({
												productTypeData: productTypeData.data,
												areaData: areaData.data,
												userData: userData.data
											}));
											$('[data-am-selected]').selected();
											$k.util.dateTimepicker();
											self.getValidate($dialog);
											$dialog.modal({
												closeViaDimmer: false,
												closeOnConfirm: false,
												onConfirm: function(e) {
													var $modal = this;
													var $enterpriseInputForm = $dialog.find("#enterprise-input-form");
													if ($enterpriseInputForm.valid()) {//如果表单验证成功，则进行提交。  
														$.ajax({
															url: "enterprise/add",
															type: "POST",
															data:{
																imagePath: $enterpriseInputForm.find("#imagePath").val(),
																name: $enterpriseInputForm.find("#name").val(),
																introduction: $enterpriseInputForm.find("#introduction").val(),
																areaId: $enterpriseInputForm.find("#areaId").val(),
																productTypeId: $enterpriseInputForm.find("#productTypeId").val(),
																address: $enterpriseInputForm.find("#address").val(),
																telephone: $enterpriseInputForm.find("#telephone").val(),
																principal: $enterpriseInputForm.find("#principal").val(),
																mainProduct: $enterpriseInputForm.find("#mainProduct").val(),
																productionTime: new Date($enterpriseInputForm.find("#productionTime").val()),
																pointUserId: $enterpriseInputForm.find("#pointUserId").val(),
																pointStatu:  $enterpriseInputForm.find("#pointStatus").prop("checked") ? 1 : 0,
																nationalTaxNumber: $enterpriseInputForm.find("#nationalTaxNumber").val(),
																nationalTaxUser: $enterpriseInputForm.find("#nationalTaxUser").val(),
																localTaxNumber: $enterpriseInputForm.find("#localTaxNumber").val(),
																localTaxUser: $enterpriseInputForm.find("#localTaxUser").val(),
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
												onCancel: function() {
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
				.on("click", ".enterprise-update-btn", function() {
					var id = $k.util.trChecked("enterprise");
					if(id == null){
						return;
					}
					$.ajax({
						url: "enterprise/detail",
						type: "POST",
						data:{enterpriseId:id},
						success: function(data) {
							$k.util.getUserList({
								success: function(userData) {
									$k.util.getProductTypeList({
										success: function(productTypeData) {
											$k.util.getAreaList({
												success: function(areaData) {
													var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
													$dialog.html(self.$tempDialogTar.doT({
														productTypeData: productTypeData.data,
														areaData: areaData.data,
														userData: userData.data,
														enterpriseId: id
													}));
													$('[data-am-selected]').selected();
													$k.util.dateTimepicker();
													self.getValidate($dialog);
													$.each(data.data,function(ky,vl){
														$dialog.find("[name='"+ky+"']").val(vl);
														if(ky=="imagePath"&&vl!=""&&vl!=null) {
															$dialog.find("#filename").val(vl.split("-")[1]);
														} 
														if(ky == "pointUser" && vl!=null) {
															$dialog.find("#pointUserId").find('option[value="'+vl.id+'"]').attr('selected', true);
														}
														if(ky == "area" && vl!=null) {
															$dialog.find("[name='areaId']").val(vl.id);
														}
														if(ky == "productType" && vl!=null) {
															$dialog.find("[name='productTypeId']").val(vl.id);
														}
														if(ky == "productionTime" && vl!=null) {
															$dialog.find("[name='productionTime']").val($k.util.getDateString2(vl));
														}
														if(ky == "pointStatus" && vl == 1) {
															$dialog.find("#pointStatus").prop("checked", "true");
														}
													})
													$dialog.modal({
														closeViaDimmer: false,
														closeOnConfirm: false,
														onConfirm: function(e) {
															var $modal = this;
															if ($dialog.find('#enterprise-input-form').valid()) {//如果表单验证成功，则进行提交。  
																var $enterpriseInputForm = $dialog.find("#enterprise-input-form");
																$.ajax({
																	url: "enterprise/edit",
																	type: "POST",
																	data:{
																		enterpriseId: $enterpriseInputForm.find("#id").val(),
																		imagePath: $enterpriseInputForm.find("#imagePath").val(),
																		name: $enterpriseInputForm.find("#name").val(),
																		introduction: $enterpriseInputForm.find("#introduction").val(),
																		areaId: $enterpriseInputForm.find("#areaId").val(),
																		productTypeId: $enterpriseInputForm.find("#productTypeId").val(),
																		principal: $enterpriseInputForm.find("#principal").val(),
																		mainProduct: $enterpriseInputForm.find("#mainProduct").val(),
																		productionTime: new Date($enterpriseInputForm.find("#productionTime").val()),
																		representative: $enterpriseInputForm.find("#representative").val(),
																		shareholder: $enterpriseInputForm.find("#shareholder").val(),
																		registeredCapital: $enterpriseInputForm.find("#registeredCapital").val(),
																		alterRecording: $enterpriseInputForm.find("#alterRecording").val(),
																		address: $enterpriseInputForm.find("#address").val(),
																		telephone: $enterpriseInputForm.find("#telephone").val(),
																		pointUserId: $enterpriseInputForm.find("#pointUserId").val(),
																		pointStatus: $enterpriseInputForm.find("#pointStatus").prop("checked") ? 1 : 0,
																		nationalTaxNumber: $enterpriseInputForm.find("#nationalTaxNumber").val(),
																		nationalTaxUser: $enterpriseInputForm.find("#nationalTaxUser").val(),
																		localTaxNumber: $enterpriseInputForm.find("#localTaxNumber").val(),
																		localTaxUser: $enterpriseInputForm.find("#localTaxUser").val(),
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
				.on("click", ".enterprise-delete-btn", function() {
					var id = $k.util.trChecked("enterprise");
					if (id == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "请确认是否删除该企业？",
						content: "<span style='color: red'>如果删除该企业的话，则该企业相关的国税、地税等所有数据信息都将被删除，请知悉！！！</span>"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: 'enterprise/delete',
								type: 'POST',
								data: { 
									enterpriseId: id
								},
								success: function(data) {
									if (data.status == 0){
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
				.on("click",".enterpriseInfo-href",function(e){
					e.stopPropagation();
					var enterpriseId = $(this).parent().prev().attr("id");
					$.ajax({
						url: "enterprise/detail",
						type: "POST",
						data:{
							enterpriseId: enterpriseId
						},
						success: function(data) {
							$k.util.getUserList({
								success: function(userData) {
									$k.util.getProductTypeList({
										success: function(productTypeData) {
											$k.util.getAreaList({
												success: function(areaData) {
													var $dialog = $('<div class="am-modal am-modal-prompt" id="enterprise-input"></div>').appendTo(self.$tar);
													$dialog.html(self.$tempDialogTar.doT({
														productTypeData: productTypeData.data,
														areaData: areaData.data,
														userData: userData.data,
														enterpriseId: enterpriseId
													}));
													$dialog.find(".enterprise-credit").removeClass("am-hide");
													$('[data-am-selected]').selected();
													$dialog.find(".am-selected-list").off("click", "> li");
													$.each(data.data,function(ky,vl){
														$dialog.find("[name='"+ky+"']").val(vl);
														$dialog.find(".am-form-file").addClass("am-hide");
														if(ky=="imagePath"&&vl!=""&&vl!=null){
															$dialog.find(".imageShow").removeClass("am-hide");
															$dialog.find(".imageShow").find("img").attr("src","./"+vl);
														}
														if(ky == "area" && vl!=null) {
															$dialog.find("[name='areaId']").val(vl.id);
														}
														if(ky == "productType" && vl!=null) {
															$dialog.find("[name='productTypeId']").val(vl.id);
														}
														if(ky == "pointUser" && vl!=null) {
															$dialog.find("#pointUserId").find('option[value="'+vl.id+'"]').attr('selected', true);
														}
														if(ky == "productionTime" && vl!=null) {
															$dialog.find("[name='productionTime']").val($k.util.getDateString2(vl));
														}
														if(ky == "pointStatus" && vl == 1) {
															$dialog.find("#pointStatus").prop("checked", "true");
														}
													});
													$dialog.modal({
														closeViaDimmer: false,
														onCancel: function(e){
															this.close($dialog.remove());
														}
													});
													$k.util.inputDisabled("enterprise");
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
				.on('change', '#upload-file-input', function() {
					var $form = $tar.find("#enterprise-input-form");
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
									$form.find(".upload-loading-icon").addClass("am-hide");
								}
							},
							error: function(data) {}
					});
				})
				.on("change", "#enterprise-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#enterprise-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#enterprise-table .table-tr", function(e) {
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
				self.$tar.find("#enterprise-table").html("");
				self.$tar.find(".sk-three-bounce").show();
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "enterprise/list",
					type: "POST",
					success: function(data) {
						self.$tar.find(".sk-three-bounce").hide();
						self.$tar.find("#enterprise-table").html(
							$(".template.EnterpriseList").doT({
									data: data.data
								})
							);
				    	self.datatables = self.$tar.find("#enterprise-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#enterprise-input-form").validate({
				      errorElement: "em",
				      errorPlacement: function(error, element) { //指定错误信息位置
				    	  if (element.is('#userIds') || element.is('#pointUserId') ) { //如果是radio或checkbox
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
				    	  productTypeId: "required",
				    	  areaId: "required",
				    	  pointUserId: "required",
				    	  telephone: {required: true, phone: true},
				    	  pointUserTel: {telORphone: true},
				    	  mainProduct: "required",
				    	  principal: "required",
				    	  productionTime: "required",
				    	  //nationalTaxNumber: "required",
						  //nationalTaxUser: "required",
						 // localTaxNumber: "required",
						 // localTaxUser: "required",
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>
