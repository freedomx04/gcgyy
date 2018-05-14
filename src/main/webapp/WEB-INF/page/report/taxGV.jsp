<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template TaxGV" type="text/x-jquery-tmpl">
<div class="admin-content taxGV">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">纳税系统</strong></div>
	</div>

	<div class="am-tabs" data-am-tabs>
		<ul class="am-tabs-nav am-nav am-nav-tabs">
			<li class="am-active" tab="tab1"><a href="#tab1">国税</a></li>
			<li tab="tab2"><a href="#tab2">地税</a></li>
		</ul>
		<div class="am-tabs-bd">
	    	<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
				<div class="am-g">
					<div class="am-u-sm-12" style="height: 50px;">
						<div class="padding-horizontal-o am-fl">
							<input type="text" class="am-form-field am-align-left datetimepicker monthly" style="font-size: 1.4rem; width: 120px;" placeholder="请选择年月"/>
							<button type="button" class="am-btn am-radius am-btn-default am-btn-sm national-tax-search">查询</button>
						</div>

						<div class="padding-right-o am-fr" style="margin-left: 20px;">
							<div class="am-btn-toolbar am-fl">
		   						<div class="am-btn-group am-btn-group-sm">
									<button type="button" class="am-btn am-btn-default template-download"><span class="am-icon-download"></span> 模板下载</button>
									<form id="importEnergy-file-form" class="am-fl">
										<div class="am-form-file am-inline-block am-fr">
											<button type="button" class="am-btn am-btn-default am-btn-sm"> <i class="am-icon-cloud-upload"></i> 导入Excel</button>
		  									<input type="file" id="importNationalTax-file-input" name="uploadfile" accept=".xls, .xlsx, .xlsm">
										</div>
									</form>
		   						</div>
  							</div>
						</div>

						<div class="padding-right-o am-fr">
							<div class="am-btn-toolbar am-fl">
		   						<div class="am-btn-group am-btn-group-sm">
		     						<button type="button" class="am-btn am-btn-default national-tax-add-btn"><span class="am-icon-plus"></span> 新增</button>
		     						<button type="button" class="am-btn am-btn-default national-tax-update-btn"><span class="am-icon-save"></span> 编辑</button>
		     						<button type="button" class="am-btn am-btn-default national-tax-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
									<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
		   						</div>
  							</div>
						</div>
					</div>

					<div class="am-u-sm-12">
						<div class="sk-three-bounce">
							<div class="sk-child sk-bounce1"></div>
							<div class="sk-child sk-bounce2"></div>
							<div class="sk-child sk-bounce3"></div>
						</div>
						<table class="am-table am-table-striped am-table-hover table-main" id="national-tax-table">
						</table>
    				</div>	
				</div>
			</div>

	    	<div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
				<div class="am-g">
					<div class="am-u-sm-12" style="height: 50px;">
						<div class="padding-horizontal-o am-fl">
							<input type="text" class="am-form-field am-align-left datetimepicker monthly" style="font-size: 1.4rem; width: 120px;" placeholder="请选择年月"/>
							<button type="button" class="am-btn am-radius am-btn-default am-btn-sm local-tax-search">查询</button>
						</div>

						<div class="padding-right-o am-fr" style="margin-left: 20px;">
							<div class="am-btn-toolbar am-fl">
		   						<div class="am-btn-group am-btn-group-sm">
									<button type="button" class="am-btn am-btn-default template-download"><span class="am-icon-download"></span> 模板下载</button>
									<form id="importEnergy-file-form" class="am-fl">
										<div class="am-form-file am-inline-block am-fr">
											<button type="button" class="am-btn am-btn-default am-btn-sm"> <i class="am-icon-cloud-upload"></i> 导入Excel</button>
		  									<input type="file" id="importLocalTax-file-input" name="uploadfile" accept=".xls, .xlsx, .xlsm">
										</div>
									</form>
		   						</div>
  							</div>
						</div>

						<div class="padding-right-o am-fr">
							<div class="am-btn-toolbar am-fl">
		   						<div class="am-btn-group am-btn-group-sm">
		     						<button type="button" class="am-btn am-btn-default local-tax-add-btn"><span class="am-icon-plus"></span> 新增</button>
		     						<button type="button" class="am-btn am-btn-default local-tax-update-btn"><span class="am-icon-save"></span> 编辑</button>
		     						<button type="button" class="am-btn am-btn-default local-tax-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
									<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
		   						</div>
  							</div>
						</div>
					</div>

					<div class="am-u-sm-12">
						<div class="sk-three-bounce">
							<div class="sk-child sk-bounce1"></div>
							<div class="sk-child sk-bounce2"></div>
							<div class="sk-child sk-bounce3"></div>
						</div>
						<table class="am-table am-table-striped am-table-hover table-main" id="local-tax-table">
						</table>
    				</div>	
				</div>
			</div>
		</div>
	</div>
</div>
</script>

<script class="template NationalTaxGVDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	国税信息
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd" style="overflow:auto;max-height:500px">
	    <form class="am-form am-form-horizontal" id="national-input-form">
	    	  <input name="id" id="id" type="text" class="am-hide"/>

			 <div class="am-form-group">
					<label for="enterpriseId" class="am-u-sm-3 am-form-label font-normal">企业名称:</label>
					<div class="am-u-sm-9 padding-left-o">
		    			<select name="enterpriseId" id="enterpriseId" data-am-selected="{searchBox: 1}" >
								<option value="">请选择企业</option>
	     		 			{{~ it.enterprise: enterprise}}	
								<option value="{{=enterprise.id}}">{{=enterprise.name}}</option>
							{{~}} 
						</select>
					</div>
			  </div>
			  <em for="enterpriseId" generated="true" class="error am-hide">必须字段！</em>
			 <div class="am-form-group">
			    <label for="nationalTaxNumber" class="am-u-sm-3 am-form-label font-normal">税收识别码:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="nationalTaxNumber" id="nationalTaxNumber" class="taxNumber am-form-field" disabled/>
					 <em for="nationalTaxNumber" generated="true" class="taxTips error am-hide">请先去添加税收识别码！</em>
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="nationalTaxUser" class="am-u-sm-3 am-form-label font-normal">税收人:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="nationalTaxUser" id="nationalTaxUser" class="taxUser am-form-field" disabled/>
					 <em for="nationalTaxUser" generated="true" class="taxTips error am-hide">请先去添加税收人！</em>
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">年月:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="monthly" id="monthly" class="am-form-field datetimepicker" />
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="sale" class="am-u-sm-3 am-form-label font-normal">本月止销售收入(元):</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="sale" id="sale" class="am-form-field" />
		     	</div>
			  </div>
			  
			 <div class="am-form-group">
			    <label for="taxes" class="am-u-sm-3 am-form-label font-normal">本月止国税(元):</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="taxes" id="taxes" class="am-form-field" />
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

<script class="template LocalTaxGVDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	地税信息
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd" style="overflow:auto;max-height:500px">
	    <form class="am-form am-form-horizontal" id="local-input-form">
	    	  <input name="id" id="id" type="text" class="am-hide"/>

			 <div class="am-form-group">
					<label for="enterpriseId" class="am-u-sm-3 am-form-label font-normal">企业名称:</label>
					<div class="am-u-sm-9 padding-left-o">
		    			<select name="enterpriseId" id="enterpriseId" data-am-selected="{searchBox: 1}" >
								<option value="">请选择企业</option>
	     		 			{{~ it.enterprise: enterprise}}	
								<option value="{{=enterprise.id}}">{{=enterprise.name}}</option>
							{{~}} 
						</select>
					</div>
			  </div>
			  <em for="enterpriseId" generated="true" class="error am-hide">必须字段！</em>
			 <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">纳税识别码:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="localTaxNumber" id="localTaxNumber" class="taxNumber am-form-field" disabled/>
					 <em for="localTaxNumber" generated="true" class="taxTips error am-hide">请先去添加税收识别码！</em>
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">纳税人:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="localTaxUser" id="localTaxUser" class="taxUser am-form-field" disabled/>
					 <em for="localTaxUser" generated="true" class="taxTips error am-hide">请先去添加税收人！</em>
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">年月:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="monthly" id="monthly" class="am-form-field datetimepicker" />
		     	</div>
			  </div>

			 <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">本月止地税(元):</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="taxes" id="taxes" class="am-form-field" />
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

<script class="template NationalTaxGVList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th></th>
		<th class="table-id">#</th>
		<th class="table-name">企业名称</th>
		<th>本月止销售收入(元)</th>
		<th>本月止国税(元)</th>
   </tr>
</thead>
<tbody>
	{{~ it.data: data : index}}
	<tr class="table-tr">
		<td><input type='radio' class='box' name='box'/></td>
		<td id="{{=data.nationalTax_current != null ? data.nationalTax_current.id : ""}}">{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=data.enterprise.name}}">{{=data.enterprise.name}}</td>
		<td class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.sale : "-"}}</td>
		<td class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.taxes : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>


<script class="template LocalTaxGVList" type="text/x-jquery-tmpl">
<thead>
    <tr>
		<th></th>
		<th class="table-id">#</th>
		<th class="table-name">企业名称</th>
       	<th>本月止地税(元)</th>
   </tr>
</thead>
<tbody>
	{{~ it.data:data : index}}
	<tr class="table-tr">
		<td><input type='radio' class='box' name='box'/></td>
		<td id="{{=data.localTax_current != null ? data.localTax_current.id : ""}}">{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=data.enterprise.name}}">{{=data.enterprise.name}}</td>
		<td class="am-text-primary">{{=data.localTax_current != null ? data.localTax_current.taxes : "-"}}</td>
	</tr>
	{{~}}
</tbody>
</script>


<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "TaxGV";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTarGV: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on('click', '.national-tax-search', function() {
					self.reload('tab1');
				})
				.on("click", ".national-tax-add-btn", function() {
					$k.util.getEnterpriseList({
						success: function(enterpriseData){
							var $dialog = $('<div class="am-modal am-modal-prompt" id="national-modal"></div>').appendTo(self.$tar);
							$dialog.html($(".template.NationalTaxGVDialog").doT({
								enterprise: enterpriseData.data
							}));
							
							self.getValidate($dialog);
							$('[data-am-selected]').selected();
							$k.util.datePicker($dialog.find("#monthly"));
							
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $nationalInputForm = $dialog.find('#national-input-form');
									var monthly = $nationalInputForm.find("#monthly").val();
									
									if($nationalInputForm.find("#enterpriseId").val() == "") {
										$nationalInputForm.find("[name='enterpriseId']").closest(".am-form-group").next().removeClass("am-hide");
									}
									if($nationalInputForm.find("#nationalTaxNumber").val() == "") {
										$nationalInputForm.find("[name='nationalTaxNumber']").next().removeClass("am-hide");
									}
									if($nationalInputForm.find("#nationalTaxUser").val() == "") {
										$nationalInputForm.find("[name='nationalTaxUser']").next().removeClass("am-hide");
										return;
									}
									if ($nationalInputForm.valid()) {  
										$.ajax({
											url: "nationalTax/add",
											type: "POST",
											data:{
												enterpriseId: $nationalInputForm.find("#enterpriseId").val(),
												monthly: monthly,
												sale: $nationalInputForm.find("#sale").val(),
												taxes: $nationalInputForm.find("#taxes").val()
											},
											success: function(data) {
												if(data.status == 3) {
													$dialog.find("#monthly").next().removeClass("success").text("该月份记录已存在！");
													return;
												}
												$tar.find("#tab1").find(".monthly").val(monthly);
												self.reload('tab1', monthly);
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
				})
				.on("click", ".national-tax-update-btn", function() {
					var id = $tar.find("tr.am-active").find("td[id]").attr("id");
					if (id == null){
						return;
					}
					$.ajax({
						url: "nationalTax/detail",
						type: "POST",
						data:{ nationalTaxId: id },
						success: function(data) {
							$k.util.getEnterpriseList({
								success: function(enterpriseData){
									var $dialog = $('<div class="am-modal am-modal-prompt" id="national-modal"></div>').appendTo(self.$tar);
									$dialog.html($(".template.NationalTaxGVDialog").doT({
										enterprise: enterpriseData.data
									}));
									
									self.getValidate($dialog);
									$('[data-am-selected]').selected();
									$k.util.datePicker($dialog.find("#monthly"));
									
									$.each(data.data,function(ky,vl){
										$dialog.find("[name='"+ky+"']").val(vl)
										if(ky == "enterprise" && vl!=null) {
											$dialog.find("#enterpriseId").find('option[value="'+vl.id+'"]').attr('selected', true);
											$dialog.find("#enterpriseId").trigger("change");
										}
									});
									$dialog.find(".am-selected-list").off("click", "> li");
									$dialog.find("[name='monthly']").attr("disabled", "disabled");
									$dialog.modal({
										closeViaDimmer:false,
										closeOnConfirm: false,
										onConfirm: function(e) {
											var $modal = this;
											var $nationalInputForm = $dialog.find("#national-input-form");
											var monthly = $nationalInputForm.find("#monthly").val();
											if($nationalInputForm.find("#nationalTaxNumber").val() == "") {
												$nationalInputForm.find("[name='nationalTaxNumber']").next().removeClass("am-hide");
											}
											if($nationalInputForm.find("#nationalTaxUser").val() == "") {
												$nationalInputForm.find("[name='nationalTaxUser']").next().removeClass("am-hide");
												return;
											}
											if ($nationalInputForm.valid()) {
												$.ajax({
													url: "nationalTax/edit",
													type: "POST",
													data:{
														nationalTaxId: $nationalInputForm.find("#id").val(),
														enterpriseId: $nationalInputForm.find("#enterpriseId").val(),
														monthly: monthly,
														sale: $nationalInputForm.find("#sale").val(),
														taxes: $nationalInputForm.find("#taxes").val()
													},
													success: function(data) {
														$tar.find("#tab1").find(".monthly").val(monthly);
														self.reload('tab1', monthly);
														$modal.close($dialog.remove());
													},
													error: function(err) {
													}
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".national-tax-delete-btn", function() {
					var id = $tar.find("#national-tax-table tr.am-active").find("td[id]").attr("id");
					if (id == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
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
								url: "nationalTax/delete",
								type: "POST",
								data: { nationalTaxIds: id.toString() },
								success: function(data) {
									if (data.status == 0) {
										self.reload('tab1', $tar.find("#tab1").find(".monthly").val());
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
				
				
				
				.on('click', '.local-tax-search', function() {
					self.reload('tab2');
				})
				.on("click", ".local-tax-add-btn", function() {
					$k.util.getEnterpriseList({
						success: function(enterpriseData){
							var $dialog = $('<div class="am-modal am-modal-prompt" id="local-modal"></div>').appendTo(self.$tar);
							$dialog.html($(".template.LocalTaxGVDialog").doT({
								enterprise: enterpriseData.data
							}));
							
							self.getLocalValidate($dialog);
							$('[data-am-selected]').selected();
							$k.util.datePicker($dialog.find("#monthly"));
							
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $localInputForm = $dialog.find("#local-input-form");
									if($localInputForm.find("#enterpriseId").val() == "") {
										$localInputForm.find("[name='enterpriseId']").closest(".am-form-group").next().removeClass("am-hide");
									}
									if($localInputForm.find("#localTaxNumber").val() == "") {
										$localInputForm.find("[name='localTaxNumber']").next().removeClass("am-hide");
									}
									if($localInputForm.find("#localTaxUser").val() == "") {
										$localInputForm.find("[name='localTaxUser']").next().removeClass("am-hide");
										return;
									}
									if ($localInputForm.valid()) {  
										$.ajax({
											url: "localTax/add",
											type: "POST",
											data:{
												enterpriseId: $localInputForm.find("#enterpriseId").val(),
												monthly: $localInputForm.find("#monthly").val(),
												taxes: $localInputForm.find("#taxes").val()
											},
											success: function(data) {
												if(data.status == 3) {
													$dialog.find("#monthly").next().removeClass("success").text("该月份记录已存在！");
													return;
												}
												$tar.find("#tab2").find(".monthly").val($localInputForm.find("#monthly").val());
												self.reload('tab2', $tar.find("#tab2").find(".monthly").val());
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
				})
				.on("click", ".local-tax-update-btn", function() {
					var id = $k.util.trChecked("local-tax-table");
					if (id == null){
						return;
					}
					$.ajax({
						url: "localTax/detail",
						type: "POST",
						data:{ localTaxId: id },
						success: function(data) {
							$k.util.getEnterpriseList({
								success: function(enterpriseData){
									var $dialog = $('<div class="am-modal am-modal-prompt" id="local-modal"></div>').appendTo(self.$tar);
									$dialog.html($(".template.LocalTaxGVDialog").doT({
										enterprise: enterpriseData.data
									}));
									
									self.getLocalValidate($dialog);
									$('[data-am-selected]').selected();
									$k.util.datePicker($dialog.find("#monthly"));
									
									$.each(data.data,function(ky,vl){
										$dialog.find("[name='"+ky+"']").val(vl)
										if(ky == "enterprise" && vl!=null) {
											$dialog.find("#enterpriseId").find('option[value="'+vl.id+'"]').attr('selected', true);
											$dialog.find("#enterpriseId").trigger("change");
										}
									})
									$dialog.find(".am-selected-list").off("click", "> li");
									$dialog.find("[name='monthly']").attr("disabled", "disabled");
									$dialog.modal({
										closeViaDimmer:false,
										closeOnConfirm: false,
										onConfirm: function(e) {
											var $modal = this;
											var $localInputForm = $dialog.find("#local-input-form");
											if($localInputForm.find("#localTaxNumber").val() == "") {
												$localInputForm.find("[name='localTaxNumber']").next().removeClass("am-hide");
											}
											if($localInputForm.find("#localTaxUser").val() == "") {
												$localInputForm.find("[name='localTaxUser']").next().removeClass("am-hide");
												return;
											}
											if ($localInputForm.valid()) {
												$.ajax({
													url: "localTax/edit",
													type: "POST",
													data:{
														localTaxId: $localInputForm.find("#id").val(),
														enterpriseId: $localInputForm.find("#enterpriseId").val(),
														monthly: $localInputForm.find("#monthly").val(),
														taxes: $localInputForm.find("#taxes").val()
													},
													success: function(data) {
														$tar.find("#tab2").find(".monthly").val($localInputForm.find("#monthly").val());
														$modal.close($dialog.remove());
														self.reload('tab2', $tar.find("#tab2").find(".monthly").val());
													},
													error: function(err) {
													}
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".local-tax-delete-btn", function() {
					var id = $tar.find("#local-tax-table tr.am-active").find("td[id]").attr("id");
					if (id == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
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
								url: "localTax/delete",
								type: "POST",
								data: { localTaxIds: id.toString() },
								success: function(data) {
									if (data.status == 0) {
										self.reload('tab2', $tar.find("#tab2").find(".monthly").val());
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
				
				.on("click", ".template-download", function() {
					var tab = $(this).closest(".am-tab-panel").attr("id");
					var monthly = $tar.find("#"+tab+" .monthly").val();
					var type ;
					if(tab == "tab1") {
						type = 4;
					} else {
						type = 5;
					}
					window.location.href = "./reportForm/template?monthly=" + monthly + "&type=" + type;
				})
				.on("click", ".export-btn", function() {
					var tab = $(this).closest(".am-tab-panel").attr("id");
					var monthly = $tar.find("#"+tab+" .monthly").val();
					var type ;
					if(tab == "tab1") {
						type = 10;
					} else {
						type = 13;
					}
					location.href = "reportForm/export?monthly=" + monthly + "&type=" + type;
				})
				.on("change", "#importNationalTax-file-input", function() {
					$.ajax({
						url: "reportForm/importNationalTax",
						type: "POST",
						data: new FormData($tar.find("#tab1 form")[0]),
						enctype : 'multipart/form-data',
						processData: false,
						contentType: false,
						cache: false,
						success: function(data) {
							if(data.status != 0) {
								$k.util.alertModal("上传数据格式不正确，请重新上传！");
							} else {
								self.reload('tab1', $tar.find("#tab1").find(".monthly").val());
								$tar.find('#importNationalTax-file-input').val("");
							}
						},
						error: function(data) {
						}
					});
				})
				.on("change", "#importLocalTax-file-input", function() {
					$.ajax({
						url: "reportForm/importLocalTax",
						type: "POST",
						data: new FormData($tar.find("#tab2 form")[0]),
						enctype : 'multipart/form-data',
						processData: false,
						contentType: false,
						cache: false,
						success: function(data) {
							if(data.status != 0) {
								$k.util.alertModal("上传数据格式不正确，请重新上传！");
							} else {
								self.reload('tab2', $tar.find("#tab2").find(".monthly").val());
								$tar.find('#importLocalTax-file-input').val("");
							}
						},
						error: function(data) {
						}
					});
				})
				
				.on("click", "#national-tax-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					var id = $this.closest("tr").find("td[id]").attr("id");
					
					$tar.find(".taxGV .am-btn").removeClass("am-disabled");
					$tar.find("#national-tax-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					
					if(id == "") {
						$tar.find(".national-tax-update-btn").addClass("am-disabled");
						$tar.find(".national-tax-delete-btn").addClass("am-disabled");
					}
				})
				.on("click", "#local-tax-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					var id = $this.closest("tr").find("td[id]").attr("id");
					
					$tar.find(".taxGV .am-btn").removeClass("am-disabled");
					$tar.find("#local-tax-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					
					if(id == "") {
						$tar.find(".local-tax-update-btn").addClass("am-disabled");
						$tar.find(".local-tax-delete-btn").addClass("am-disabled");
					}
				})
				.on("click", "#local-tax-table .table-tr, #national-tax-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				})
				.on("change", "#enterpriseId", function(e){
					e.stopPropagation();
					var enterpriseId = $(this).val();
					var $form = $(this).closest("form");
					$.ajax({
						url: "enterprise/detail",
						type: "POST",
						data:{
							enterpriseId: enterpriseId
						},
						success: function(data) {
							$.each(data.data,function(ky,vl){
								$form.find(".taxNumber").val(data.data.nationalTaxNumber);
								$form.find(".taxUser").val(data.data.nationalTaxUser);
							});
							$form.find(".taxTips").addClass("am-hide");
						},
						error: function(err) {}
					});
				})
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
					
				var now = new Date();
				now.setDate(1);
				now.setMonth(now.getMonth() - 1);
				self.$tar.html(self.$tempTarGV.doT());
				$k.util.datePicker(self.$tar.find("#tab1 .monthly"));
				$k.util.datePicker(self.$tar.find("#tab2 .monthly"));
				self.$tar.find("#tab1 .monthly").val(now.format("yyyy-mm"));
				self.$tar.find("#tab2 .monthly").val(now.format("yyyy-mm"));
				$('[data-am-selected]').selected();
				
				return self;
			}
		},
		reload: {
			value: function(tab, monthly) {
				var self = this;
				var moth = "";
				if(tab == 'tab') {
					self.$tar.find("table").html("");
					self.$tar.find(".sk-three-bounce").show();
					if (self.table1) {
						self.table1.fnDestroy();
					}
					if (self.table2) {
						self.table2.fnDestroy();
					}
					moth = monthly == undefined ? self.$tar.find("#tab1 .monthly").val() : monthly;
				} else {
					if(tab == "tab1" && self.table1) {
						self.table1.fnDestroy();
						moth = monthly == undefined ? self.$tar.find("#tab1 .monthly").val() : monthly;
					} else if(tab == "tab2" && self.table2) {
						self.table2.fnDestroy();
						moth = monthly  == undefined ? self.$tar.find("#tab2 .monthly").val() : monthly;
					}
					self.$tar.find("#"+tab+" table").html("");
					self.$tar.find("#"+tab+" .sk-three-bounce").show();
				}
				
				$.ajax({
					url: 'tax/listByEnterprise',
					type: 'POST',
					data: {
						monthly: moth
					},
					success: function(data) {
						if (tab == 'tab') {
							self.$tar.find(".sk-three-bounce").hide();
							self.$tar.find("#national-tax-table").html(
								$(".template.NationalTaxGVList").doT({
									data: data.data
								})
							);
							self.table1 = self.$tar.find("#national-tax-table").dataTable();
							self.$tar.find("#local-tax-table").html(
								$(".template.LocalTaxGVList").doT({
									data: data.data
								})
							);
							self.table2 = self.$tar.find("#local-tax-table").dataTable();	
						}
						else if (tab == 'tab1') {
							self.$tar.find("#tab1 .sk-three-bounce").hide();
							self.$tar.find("#national-tax-table").html(
								$(".template.NationalTaxGVList").doT({
									data: data.data
								})
							);
							self.table1 = self.$tar.find("#national-tax-table").dataTable();
						}
						else if (tab == 'tab2') {
							self.$tar.find("#tab2 .sk-three-bounce").hide();
							self.$tar.find("#local-tax-table").html(
								$(".template.LocalTaxGVList").doT({
									data: data.data
								})
							);
							self.table2 = self.$tar.find("#local-tax-table").dataTable();							
						}
					},
					error: function(data) {}
				});
				return self;
			}
		},
		load: {
			value: function(){
				var self = this;
				self.reload('tab');
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("form").validate({
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
				    	  enterpriseId: "required",
				    	  monthly: "required",
				    	  sale: {
				    		  required: true,
				    		  number: true
				    	  },
				    	  taxes: {
				    		  required: true,
				    		  number: true
				    	  }
				      }
			    });
				return validatorr;
			}
		},
		getLocalValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("form").validate({
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
				    	  //enterpriseId: "required",
				    	  monthly: "required",
				          taxes: {
				        	  required: true,
				    		  number: true
				          }
				      }
			    });
				return validatorr;
			}
		}
	});
	
})( jQuery );
</script>