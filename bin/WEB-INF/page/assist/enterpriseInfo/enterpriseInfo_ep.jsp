<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EnterpriseInfo" type="text/x-jquery-tmpl">
<div class="admin-content" style="height:initial!important;">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">企业信息</strong></div>
    </div>

	<div class="am-tabs" data-am-tabs>
	  <ul class="am-tabs-nav am-nav am-nav-tabs">
	    <li class="am-active" tab="tab1"><a href="#tab1">企业基本信息</a></li>
		<li tab="tab2"><a href="#tab2">企业产品</a></li>
		<li tab="tab3"><a href="#tab3">企业新闻</a></li>
	  </ul>

	  <div class="am-tabs-bd">
	    <div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
	    </div>

	    <div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
	    </div>

		<div class="am-tab-panel am-fade" id="tab3" style="-webkit-user-select:all!important;">
	    </div>
	  </div>
	</div>
</div>
</script>

<script class="template EnterpriseInfoTab1" type="text/x-jquery-tmpl">
	<div class="am-g">
		<div class="am-u-sm-12">
			<div class="am-btn-toolbar am-fl">
	  			<div class="am-btn-group am-btn-group-xs">
	    			<button type="button" class="am-btn am-btn-default enterpriseInfo-edit-btn"><span class="am-icon-edit"></span>编辑</button>
	  			</div>
			</div>
		</div>
	</div>
	
	<div class="am-g" style="margin-top: 15px;">
		<div class="am-u-sm-3">
			{{? it.data.imagePath}}
				<img src="{{="./"+it.data.imagePath}}" style="width: 100%; max-width: 400px; max-height: 300px;"/>
			{{??}}
				<img src='img/default-user-200.jpg' style="width: 100%;" alt="无企业图片">
			{{?}}
		</div>

		<div class="am-u-sm-7 padding-horizontal-o" style="line-height: 2.5rem; float: left;">
			<div class="am-g">
				<div class="am-u-sm-12 line-feed">
					<div class="am-u-sm-3 am-text-right">企业名称：</div>
					<div class="am-u-sm-9">{{=it.data.name||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">企业地址：</div>
					<div class="am-u-sm-9">{{=it.data.address||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">所属区域：</div>
					<div class="am-u-sm-9">{{=it.data.area != null ? it.data.area.name : ""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">主要产品：</div>
					<div class="am-u-sm-9">{{=it.data.mainProduct||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">产业类别：</div>
					<div class="am-u-sm-9">{{=it.data.productType!=null?it.data.productType.name:""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">投产时间：</div>
					<div class="am-u-sm-9">{{=$k.util.getDateString2(it.data.productionTime)||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">企业负责人：</div>
					<div class="am-u-sm-9">{{=it.data.principal||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">企业联系人：</div>
					<div class="am-u-sm-9">
						{{~it.data.users: user:x}}
							{{?x!=(it.data.users.length-1)}}
								{{=user.name + ","}}
							{{??x == (it.data.users.length-1)}}
								{{=user.name}}
							{{?}}
						{{~}}
					</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">联系电话：</div>
					<div class="am-u-sm-9">{{=it.data.telephone||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">企业法人：</div>
					<div class="am-u-sm-9">{{=it.data.representative||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12 ">
					<div class="am-u-sm-3 am-text-right">主要股东：</div>
					<div class="am-u-sm-9">{{=it.data.shareholder||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12 ">
					<div class="am-u-sm-3 am-text-right">注册资金：</div>
					<div class="am-u-sm-9">{{=it.data.registeredCapital||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12 line-feed">
					<div class="am-u-sm-3 am-text-right">主要变更记录：</div>
					<div class="am-u-sm-9">{{=it.data.alterRecording||""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">挂点人：</div>
					<div class="am-u-sm-9">{{=it.data.pointUser!=null?it.data.pointUser.name||"":""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">国税识别码：</div>
					<div class="am-u-sm-9">{{=it.data.nationalTaxNumber || ""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">国税纳税人名称：</div>
					<div class="am-u-sm-9">{{=it.data.nationalTaxUser || ""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">地税识别码：</div>
					<div class="am-u-sm-9">{{=it.data.localTaxNumber || ""}}</div>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<div class="am-u-sm-3 am-text-right">地税纳税人名称：</div>
					<div class="am-u-sm-9">{{=it.data.localTaxUser || ""}}</div>
				</div>
			</div>
			<div class="am-g" style="margin-bottom:50px;">
				<div class="am-u-sm-12 line-feed">
					<div class="am-u-sm-3 am-text-right">企业简介：</div>
					<div class="am-u-sm-9">{{=it.data.introduction||""}}</div>
				</div>
			</div>
		</div>		

	</div>
</script>

<script class="template EnterpriseInfoDialog" type="text/x-jquery-tmpl">
	<!-- 修改企业信息  -->
  <div class="am-modal-dialog">
	  <div class="am-modal-hd">
	    	企业信息
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
	  </div>
	  <div class="am-modal-bd" style="max-height: 450px;overflow:auto;">
	  	 <form class="am-form am-form-horizontal" id="enterpriseInfo-input-form">
			<input name="id" id="id" type="text" class="am-hide"/>

	    	<input type="text" name="name" id="name" class="am-form-field am-hide"/>
			<input type="text" name="pointUserId" id="pointUserId" class="am-form-field am-hide"/>
	    	<select name="userIds" id="userIds" class="am-hide" multiple data-am-selected>
				<option value="">请选择</option>
				{{~ it.userData: user}}	
					<option value="{{=user.id}}">{{=user.name}}</option>
				{{~}} 
     	    </select>

			<div class="am-form-group am-form-file">
	    		<label for="" class="am-u-sm-3 am-form-label font-normal">企业图片:</label>
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

			<div class="am-form-group">
				<label for="areaId" class="am-u-sm-3 am-form-label font-normal">所属区域:</label>
				<div class="am-u-sm-9 padding-left">
	    			<select name="areaId" id="areaId">
						<option value="">请选择</option>
						{{~ it.areaData: area}}	
							<option value="{{=area.id}}">{{=area.name}}</option>
						{{~}} 
     		 		</select>
				</div>
			</div>

			<div class="am-form-group">
		    	<label for="code" class="am-u-sm-3 am-form-label font-normal">主要产品:</label>
		    	<div class="am-u-sm-9 padding-left">
		      		<input type="text" name="mainProduct" id="mainProduct" class="am-form-field"/>
		    	</div>
		    </div>			

			<div class="am-form-group">
				<label for="industryId" class="am-u-sm-3 am-form-label font-normal">产业类别:</label>
				<div class="am-u-sm-9 padding-left">
	    			<select name="productTypeId" id="productTypeId">
						<option value="">请选择</option>
						{{~ it.productTypeData: productType}}	
							<option value="{{=productType.id}}">{{=productType.name}}</option>
						{{~}} 
     		 		</select>
				</div>
			</div>

			<div class="am-form-group">
		    	<label for="code" class="am-u-sm-3 am-form-label font-normal">投产时间:</label>
		    	<div class="am-u-sm-9 padding-left">
		      		<input type="text" name="productionTime" id="productionTime" class="am-form-field datetimepicker" placeholde="年-月"/>
		    	</div>
		    </div>			

			<div class="am-form-group">
		    	<label for="code" class="am-u-sm-3 am-form-label font-normal">企业主要负责人:</label>
		    	<div class="am-u-sm-9 padding-left">
		      		<input type="text" name="principal" id="principal" class="am-form-field"/>
		    	</div>
		    </div>	

			<div class="am-form-group">
				<label class="am-u-sm-3 am-form-label font-normal">电话号码:</label>
	    		<div class="am-u-sm-9 padding-left">
					<input type="text" name="telephone" id="telephone" class="am-form-field"/>
	    		</div>
			</div>

			<div class="am-form-group">
				<label  class="am-u-sm-3 am-form-label font-normal">地址:</label>
	    		<div class="am-u-sm-9 padding-left">
					<input type="text" name="address" id="address" class="am-form-field"/>
	    		</div>
			</div>
			
			<div class="am-form-group">
    			<label for="introduction" class="am-u-sm-3 am-form-label font-normal">企业简介:</label>
    			<div class="am-u-sm-9 padding-left">
					<textarea rows="5" name="introduction" id="introduction"></textarea>
    			</div>
			</div>

		  <div class="am-form-group">
		    <label for="shareholder" class="am-u-sm-3 am-form-label font-normal">主要股东:</label>
		    <div class="am-u-sm-9 padding-left">
		      <input type="text" name="shareholder" id="shareholder" class="am-form-field"/>
		    </div>
		  </div>

		  <div class="am-form-group">
		    <label for="representative" class="am-u-sm-3 am-form-label font-normal">企业法人:</label>
		    <div class="am-u-sm-9 padding-left">
		      <input type="text" id="representative" name="representative" class="am-form-field"/>
		    </div>
		  </div>
		  
		  <div class="am-form-group">
		    <label for="registeredCapital" class="am-u-sm-3 am-form-label font-normal">注册资金:</label>
		    <div class="am-u-sm-9 padding-left">
		      <input type="text" id="registeredCapital" name="registeredCapital" class="am-form-field"/>
		    </div>
		  </div>

		 <div class="am-form-group">
		    <label for="registeredCapital" class="am-u-sm-3 am-form-label font-normal">国税纳税人码:</label>
		    <div class="am-u-sm-9 padding-left">
		      <input type="text" id="nationalTaxNumber" name="nationalTaxNumber" class="am-form-field"/>
		    </div>
		  </div>

		  <div class="am-form-group">
		    <label for="registeredCapital" class="am-u-sm-3 am-form-label font-normal">国税纳税人名称:</label>
		    <div class="am-u-sm-9 padding-left">
		      <input type="text" id="nationalTaxUser" name="nationalTaxUser" class="am-form-field"/>
		    </div>
		  </div>

		  <div class="am-form-group">
		    <label for="registeredCapital" class="am-u-sm-3 am-form-label font-normal">地税纳税人码:</label>
		    <div class="am-u-sm-9 padding-left">
		      <input type="text" id="localTaxNumber" name="localTaxNumber" class="am-form-field"/>
		    </div>
		  </div>

		  <div class="am-form-group">
		    <label for="registeredCapital" class="am-u-sm-3 am-form-label font-normal">地税纳税人名称:</label>
		    <div class="am-u-sm-9 padding-left">
		      <input type="text" id="localTaxUser" name="localTaxUser" class="am-form-field"/>
		    </div>
		  </div>

	  	<div class="am-form-group">
	    	<label for="alterRecording" class="am-u-sm-3 am-form-label font-normal">主要变更记录:</label>
	    	<div class="am-u-sm-9 padding-left">
	      	<textarea rows="5" name="alterRecording" id="alterRecording"></textarea>
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

<script type="text/javascript">
;(function( $ ) {
	var fnName = "EnterpriseInfo";
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
				.on("click", ".am-tabs-nav li", function() {
					var tab = $(this).attr("tab");
					if(tab == "tab1"){
						self.load();
					} else if(tab == "tab2"){
						$k.util.getEnterprise({
							success: function(enterpriseData) {
								if(enterpriseData.data != null) {
									new $k.proto.EnterpriseProduct().init($tar.find("#tab2")).draw().load(enterpriseData.data.id);
									$tar.find("#tab2").find(".enterpriseId").val(enterpriseData.data.id);
								}
							}
						});
					} else {
						$k.util.getEnterprise({
							success: function(enterpriseData) {
								if(enterpriseData.data != null) {
									new $k.proto.EnterpriseNews().init($tar.find("#tab3")).draw().load(enterpriseData.data.id);
									$tar.find("#tab3").find(".enterpriseId").val(enterpriseData.data.id);
								}
							}
						});
					}
				})
				.on("click", ".enterpriseInfo-edit-btn", function() {
					$k.util.getEnterprise({
						success: function(enterpriseData) {
							if(enterpriseData.data != null) {
								$.ajax({
									url: "enterprise/detail",
									type: "POST",
									data:{
										enterpriseId: enterpriseData.data.id
									},
									success: function(data) {
										$k.util.getProductTypeList({
											success: function(productTypeData) {
												$k.util.getAreaList({
													success: function(areaData) {
														$k.util.getUserList({
															success: function(userData) {
																var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
																$dialog.html(self.$tempDialogTar.doT({
																	areaData: areaData.data,
																	userData: userData.data,
																	productTypeData: productTypeData.data
																}));
																$('[data-am-selected]').selected();
																$k.util.dateTimepicker();
																$dialog.find(".am-selected").addClass("am-hide");
																self.getValidate($dialog);
																$.each(data.data,function(ky,vl){
																	$dialog.find("[name='"+ky+"']").val(vl);
																	if(ky == "pointUser" && vl!=null) {
																		$dialog.find("[name='pointUserId']").val(vl.id);
																	}
																	if (ky == "users") {
																		$.each(vl, function(k, v) {
																			$dialog.find('#userIds option[value="'+v.id+'"]').attr('selected', true);
																		});
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
																})
																$dialog.modal({
																	closeViaDimmer: false,
																	closeOnConfirm: false,
																	onConfirm: function(e) {
																		var $modal = this;
																		if ($dialog.find('#enterpriseInfo-input-form').valid()) {
																			$.ajax({
																				url: "enterprise/edit",
																				type: "POST",
																				data:{
																					enterpriseId: $dialog.find("#id").val(),
																					imagePath: $dialog.find("#imagePath").val(),
																					name: $dialog.find("#name").val(),
																					introduction: $dialog.find("#introduction").val(),
																					areaId: $dialog.find("#areaId").val(),
																					productTypeId: $dialog.find("#productTypeId").val(),
																					principal: $dialog.find("#principal").val(),
																					mainProduct: $dialog.find("#mainProduct").val(),
																					productionTime: new Date($dialog.find("#productionTime").val()),
																					representative: $dialog.find("#representative").val(),
																					shareholder: $dialog.find("#shareholder").val(),
																					registeredCapital: $dialog.find("#registeredCapital").val(),
																					alterRecording: $dialog.find("#alterRecording").val(),
																					address: $dialog.find("#address").val(),
																					telephone: $dialog.find("#telephone").val(),
																					userIds: String($dialog.find("#userIds").val()),
																					pointUserId: $dialog.find("#pointUserId").val(),
																					nationalTaxNumber: $dialog.find("#nationalTaxNumber").val(),
																					nationalTaxUser: $dialog.find("#nationalTaxUser").val(),
																					localTaxNumber: $dialog.find("#localTaxNumber").val(),
																					localTaxUser: $dialog.find("#localTaxUser").val(),
																				},
																				success: function(data) {
																					$modal.close($dialog.remove());
																					self.load();
																				},
																				error: function(err) {}
																			});
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
							}
						}
					});
				})
				.on('change', '#upload-file-input', function() {
					var $form = $tar.find("#enterpriseInfo-input-form");
					$form.find(".upload-loading-icon").removeClass("am-hide");
				      $.ajax({
							url: "uploadImage",
							type: "POST",
							data: new FormData($("#enterpriseInfo-input-form")[0]),
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
							error: function(err) {
								alert("上传的图片过大");
							}
					});
				})
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
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if(enterpriseData.data != null) {
							$.ajax({
								url: "enterprise/detail",
								type: "POST",
								data:{
									enterpriseId: enterpriseData.data.id
								},
								success: function(data) {
									self.$tar.find("#tab1").html(
										$(".template.EnterpriseInfoTab1").doT({
											data: data.data
										})
									);
								},
								error: function(err) {
									
								}
							});
						}
					},
					error: function(err) {
						
					}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#enterpriseInfo-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  registeredCapital: "number",
				    	  productTypeId: "required",
				    	  areaId: "required",
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>
