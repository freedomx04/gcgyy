<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template TaxGV" type="text/x-jquery-tmpl">
<div class="admin-content">

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
	    			<form id="searchForm">
				  		<div class="am-u-sm-12 am-margin-bottom" style="display: table; border-bottom: 1px solid #ccc;">
							<div class="padding-left-o am-inline-block" style="display: table-cell!important; vertical-align: middle;">
								<button type="button" class="am-btn am-btn-sm template-btn">报表模板下载</button>
							</div>
							<div class="padding-right-o am-fr">
								<div class="am-form-file am-inline-block am-fr">
									<label class="am-form-label am-text-primary am-text-sm">导入Excel：</label>
		  							<button type="button" class="am-btn am-btn-default am-btn-sm">
		    						<i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
		  							<input type="file" id="importNationalTax-file-input" name="uploadfile" accept=".xls, .xlsx, .xlsm">
								</div>
								<div class="am-text-danger am-text-sm" style="margin-bottom: 5px;clear:both;">注意:请下载模版，并保持模版原样填写有效数据后导入!</div>
							</div>
				  		</div>
						<div class="am-u-sm-12">
							<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
							</div>
						</div>
				  		<div class="am-u-sm-12">
							<div class="am-u-sm-3 padding-left-o">
								<select class="searchType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
									<option value="1">企业明细</option>
									<option value="2">产业明细</option>
									<option value="3">园区明细</option>
								</select>
							</div>
							<div class="am-u-sm-2 am-u-sm-offset-4 padding-right-o am-text-right">
								<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">月报表时间：</label>
							</div>
							<div class="am-u-sm-3 am-u-end padding-horizontal-o">
								<input type="text" id="" class="am-form-field datetimepicker am-input-sm monthly"/>
							</div>
				  		</div>
			      	</form>
			  		<div class="am-u-sm-12">
						<div class="am-btn-toolbar am-fl">
			   				<div class="am-btn-group am-btn-group-xs">
			     				<button type="button" class="am-btn am-btn-default national-tax-add-btn"><span class="am-icon-plus"></span> 新增</button>
			     				<button type="button" class="am-btn am-btn-default national-tax-update-btn"><span class="am-icon-save"></span> 编辑</button>
			     				<button type="button" class="am-btn am-btn-default national-tax-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
								<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
			   				</div>
	  					</div>
		        		<form id="national-tax" class="am-cf">
	          				<table class="am-table am-table-striped am-table-hover table-main" id="national-tax-table" style="width:100%;">
	       					</table>
		        		</form>
    				</div>
	    		</div>
	    	</div>
	    	<div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
				<div class="am-g">
					<form id="searchForm">
						<div class="am-u-sm-12 am-margin-bottom" style="display: table; border-bottom: 1px solid #ccc;">
						<div class="padding-left-o am-inline-block" style="display: table-cell!important; vertical-align: middle;">
							<button type="button" class="am-btn am-btn-sm template-btn">报表模板下载</button>
						</div>
						<div class="padding-right-o am-fr">
							<div class="am-form-file am-inline-block am-fr">
								<label class="am-form-label am-text-primary am-text-sm">导入Excel：</label>
	  							<button type="button" class="am-btn am-btn-default am-btn-sm">
	    						<i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
	  							<input type="file" id="importLocalTax-file-input" name="uploadfile" accept=".xls, .xlsx, .xlsm">
							</div>
							<div class="am-text-danger am-text-sm" style="margin-bottom: 5px; clear:both;">注意:请下载模版，并保持模版原样填写有效数据后导入!</div>
						</div>
			  		</div>
					<div class="am-u-sm-12">
						<div class="warningDiv am-text-danger" style="margin-bottom: 5px; font-weight: normal;">
						</div>
					</div>
			  		<div class="am-u-sm-12">
						<div class="am-u-sm-3 padding-left-o">
							<select class="searchType" data-am-selected="{btnSize: 'xs', btnStyle: 'secondary'}">
								<option value="1">企业明细</option>
								<option value="2">产业明细</option>
								<option value="3">园区明细</option>
							</select>
						</div>
						<div class="am-u-sm-2 am-u-sm-offset-4 padding-right-o am-text-right">
							<label class="am-form-label am-text-sm" style="line-height: 2.8rem;">月报表时间：</label>
						</div>
						<div class="am-u-sm-3 am-u-end padding-horizontal-o">
							<input type="text" id="" class="am-form-field datetimepicker am-input-sm monthly"/>
						</div>
			  		</div>
					</form>
					<div class="am-u-sm-12">
						<div class="am-btn-toolbar am-fl">
		   					<div class="am-btn-group am-btn-group-xs">
		     					<button type="button" class="am-btn am-btn-default local-tax-add-btn"><span class="am-icon-plus"></span> 新增</button>
		     					<button type="button" class="am-btn am-btn-default local-tax-update-btn"><span class="am-icon-save"></span> 编辑</button>
		     					<button type="button" class="am-btn am-btn-default local-tax-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
								<button type="button" class="am-btn am-btn-default export-btn"><span class="am-icon-save"></span> 导出Excel</button>
		   					</div>
  						</div>
						<form id="local-tax">
			          		<table class="am-table am-table-striped am-table-hover table-main" id="local-tax-table">
			       			</table>
			        	</form>
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
			    <label for="nationalTaxNumber" class="am-u-sm-3 am-form-label font-normal">税收人识别码:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="nationalTaxNumber" id="nationalTaxNumber" class="am-form-field" disabled/>
					 <em for="nationalTaxNumber" generated="true" class="error am-hide">请先去添加税收人识别码！</em>
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="nationalTaxUser" class="am-u-sm-3 am-form-label font-normal">税收人名称:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="nationalTaxUser" id="nationalTaxUser" class="am-form-field" disabled/>
					 <em for="nationalTaxUser" generated="true" class="error am-hide">请先去添加税收人名称！</em>
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="time" class="am-u-sm-3 am-form-label font-normal">年月:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="monthly" id="monthly" class="am-form-field datetimepicker" />
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="sale" class="am-u-sm-3 am-form-label font-normal">销售收入(元):</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="sale" id="sale" class="am-form-field" />
		     	</div>
			  </div>
			  
			 <div class="am-form-group">
			    <label for="taxes" class="am-u-sm-3 am-form-label font-normal">税收(元):</label>
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
			    <label for="" class="am-u-sm-3 am-form-label font-normal">纳税人识别码:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="localTaxNumber" id="localTaxNumber" class="am-form-field" disabled/>
					 <em for="localTaxNumber" generated="true" class="error am-hide">请先去添加税收人识别码！</em>
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">纳税人名称:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="localTaxUser" id="localTaxUser" class="am-form-field" disabled/>
					 <em for="localTaxUser" generated="true" class="error am-hide">请先去添加税收人名称！</em>
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">年月:</label>
			    <div class="am-u-sm-9 padding-left-o">
				     <input type="text" name="monthly" id="monthly" class="am-form-field datetimepicker" />
		     	</div>
			  </div>

			 <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">税收:</label>
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
	<th>序号</th>
	{{ if(it.searchType == "1") { }}
	<th>企业名称</th>
	{{ } else if(it.searchType == "2") { }}
	<th>产业名称</th>
	{{ } else if(it.searchType == "3") { }}
	<th>园区名称</th>
	{{ } }}
	</th>
	<th>销售收入(元)</th>
	<th>去年同期</th>
	<th>同比增长%</th>
	<th>本月税收</th>
	<th>去年同期(元)</th>
	<th>同比增长%</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: data:index }}
		<tr class="table-tr">
			<td><input type='radio' class='box' name='box'/></td>
			<td id="{{=data.nationalTax_current != null ? data.nationalTax_current.id : ""}}">{{=index+1}}</td>
			{{ if(it.searchType == "1") { }}
			<td class="td-title ellipsis" title="{{=data.enterprise.name}}">{{=data.enterprise.name}}</td>
			{{ } else if(it.searchType == "2"){ }}
			<td class="">{{=data.productType!=null ? data.productType.name : ""}}</td>
			{{ } else if(it.searchType == "3"){ }}
			<td class="">{{=data.area!=null ? data.area.name : ""}}</td>
			{{ } }}
			<td status="{{=data.nationalTax_current == null ? "0" : ""}}" class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.sale : "-"}}</td>
			<td>{{=data.nationalTax_lastYear != null ? data.nationalTax_lastYear.sale : "-"}}</td>
			<td>{{=data.sale_yearGrowth != null ? (data.sale_yearGrowth*100).toFixed(2) : "-"}}</td>
			<td class="am-text-primary">{{=data.nationalTax_current != null ? data.nationalTax_current.taxes : "-"}}</td>
			<td>{{=data.nationalTax_lastYear != null ? data.nationalTax_lastYear.taxes : "-"}}</td>
			<td>{{=data.nationalTax_yearGrowth != null ? (data.nationalTax_yearGrowth*100).toFixed(2) : "-"}}</td></td>
		</tr>
	{{~}}
</tbody>
</script>

<script class="template LocalTaxGVList" type="text/x-jquery-tmpl">
<thead>
	<tr>
	<th></th>
	<th>序号</th>
	{{ if(it.searchType == "1") { }}
	<th>企业名称</th>
	{{ } else if(it.searchType == "2") { }}
	<th>产业名称</th>
	{{ } else if(it.searchType == "3") { }}
	<th>园区名称</th>
	{{ } }}
	</th>
	<th>地税税收(元)</th>
	<th>去年同期(元)</th>
	<th>同比增长%</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: data:index }}
		<tr class="table-tr">
			<td><input type='radio' class='box' name='box'/></td>
			<td id="{{=data.localTax_current != null ? data.localTax_current.id : ""}}">{{=index+1}}</td>
			{{ if(it.searchType == "1") { }}
			<td class="td-title ellipsis" title="{{=data.enterprise.name}}">{{=data.enterprise.name}}</td>
			{{ } else if(it.searchType == "2"){ }}
			<td class="">{{=data.productType!=null ? data.productType.name : ""}}</td>
			{{ } else if(it.searchType == "3"){ }}
			<td class="">{{=data.area!=null ? data.area.name : ""}}</td>
			{{ } }}
			<td class="am-text-primary" status="{{=data.localTax_current == null ? "0" : ""}}">{{=data.localTax_current != null ? data.localTax_current.taxes : "-"}}</td>
			<td>{{=data.localTax_lastYear != null ? data.localTax_lastYear.taxes : "-"}}</td>
			<td>{{=data.localTax_yearGrowth != null ? (data.localTax_yearGrowth*100).toFixed(2) : "-"}}</td>
		</tr>
	{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "TaxGV";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				
				$tar
				.on("click", ".am-tabs-nav li", function() {
					var tab = $(this).attr("tab");
					var now = new Date();
					now.setMonth(now.getMonth() - 1);
					
					$tar.find("#" +tab +" .monthly").val(now.format("yyyy-mm"));
					$tar.find("#" +tab).find('.am-selected-status').html("企业明细");
					$tar.find("#" +tab).find(".am-selected-list").find("li").removeClass("am-checked");
					$tar.find("#" +tab).find(".am-selected-list").find("li").first().addClass("am-checked");
					$tar.find("#" +tab +" .searchType").val("1");
					self.load(now.format("yyyy-mm"), tab);
				})
				.on("click", ".template-btn", function() {
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
					var searchType = $tar.find("#"+tab+" .searchType").val();
					var type ;
					if(tab == "tab1") {
						if(searchType == "1") {
							type = 10;
						} else if(searchType == "2") {
							type = 11 ;
						} else if(searchType == "3") {
							type = 12;
						}
					} else {
						if(searchType == "1") {
							type = 13;
						} else if(searchType == "2") {
							type = 14 ;
						} else if(searchType == "3") {
							type = 15;
						}
					}
					location.href = "reportForm/export?monthly=" + monthly + "&type=" + type;
				})
				.on("change", ".searchType", function() {
					var tab = $tar.find(".am-tabs-nav li[class='am-active']").attr("tab");
					if($(this).val() == "1"){
						$tar.find("#"+tab).find(".am-btn-toolbar .am-btn").not(".export-btn").removeClass("am-hide");
					} else {
						$tar.find("#"+tab).find(".am-btn-toolbar .am-btn").not(".export-btn").addClass("am-hide");
					}
					self.load($tar.find("#" +tab+" .monthly").val());
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
							self.datetimepicker($dialog.find("#monthly"));
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
												self.load(monthly);
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
					var id = $k.util.trChecked("national-tax");
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
									self.datetimepicker($dialog.find("#monthly"));
									$.each(data.data,function(ky,vl){
										$dialog.find("[name='"+ky+"']").val(vl)
										if(ky == "enterprise" && vl!=null) {
											$dialog.find("#enterpriseId").find('option[value="'+vl.id+'"]').attr('selected', true);
											$dialog.find("[name='nationalTaxNumber']").val(data.data.enterprise.nationalTaxNumber);
											$dialog.find("[name='nationalTaxUser']").val(data.data.enterprise.nationalTaxUser);
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
														self.load(monthly);
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
					var ids = $k.util.trOperateChecked("national-tax");
					if (ids == null){
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
								data: { nationalTaxIds: ids.toString() },
								success: function(data) {
									if (data.status == 0) {
										self.load($tar.find("#tab1").find(".monthly").val());
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
				.on("click", ".local-tax-add-btn", function() {
					$k.util.getEnterpriseList({
						success: function(enterpriseData){
							var $dialog = $('<div class="am-modal am-modal-prompt" id="local-modal"></div>').appendTo(self.$tar);
							$dialog.html($(".template.LocalTaxGVDialog").doT({
								enterprise: enterpriseData.data
							}));
							self.getLocalValidate($dialog);
							$('[data-am-selected]').selected();
							self.datetimepicker($dialog.find("#monthly"));
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
												self.load($tar.find("#tab2").find(".monthly").val());
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
					var id = $k.util.trChecked("local-tax");
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
									self.datetimepicker($dialog.find("#monthly"));
									$.each(data.data,function(ky,vl){
										$dialog.find("[name='"+ky+"']").val(vl)
										if(ky == "enterprise" && vl!=null) {
											$dialog.find("#enterpriseId").find('option[value="'+vl.id+'"]').attr('selected', true);
											$dialog.find("[name='localTaxNumber']").val(data.data.enterprise.localTaxNumber);
											$dialog.find("[name='localTaxUser']").val(data.data.enterprise.localTaxUser);
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
														self.load($tar.find("#tab2").find(".monthly").val());
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
					var ids = $k.util.trOperateChecked("local-tax");
					if (ids == null){
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
								data: { localTaxIds: ids.toString() },
								success: function(data) {
									if (data.status == 0) {
										self.load($tar.find("#tab2").find(".monthly").val());
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
				.on("change", "#importNationalTax-file-input", function() {
					$.ajax({
						url: "reportForm/importNationalTax",
						type: "POST",
						data: new FormData($tar.find("#tab1 #searchForm")[0]),
						enctype : 'multipart/form-data',
						processData: false,
						contentType: false,
						cache: false,
						success: function(data) {
							if(data.status != 0) {
								$k.util.alertModal("上传数据格式不正确，请重新上传！");
							} else {
								self.load($tar.find("#tab1").find(".monthly").val());
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
						data: new FormData($tar.find("#tab2 #searchForm")[0]),
						enctype : 'multipart/form-data',
						processData: false,
						contentType: false,
						cache: false,
						success: function(data) {
							if(data.status != 0) {
								$k.util.alertModal("上传数据格式不正确，请重新上传！");
							} else {
								self.load($tar.find("#tab2").find(".monthly").val());
							}
						},
						error: function(data) {
						}
					});
				})
				.on("click", "#national-tax-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					$tar.find(".am-btn").removeClass("am-disabled");
					$tar.find("#national-tax-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					var status = $this.closest("tr").find("td[status]").attr("status");
					if(status == "0") {
						$tar.find(".national-tax-update-btn").addClass("am-disabled");
						$tar.find(".national-tax-delete-btn").addClass("am-disabled");
					}
				})
				.on("click", "#local-tax-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					$tar.find(".am-btn").removeClass("am-disabled");
					$tar.find("#local-tax-table").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					var status = $this.closest("tr").find("td[status]").attr("status");
					if(status == "0") {
						$tar.find(".local-tax-update-btn").addClass("am-disabled");
						$tar.find(".local-tax-delete-btn").addClass("am-disabled");
					}
				})
				.on("click", "#national-tax-table .table-tr, #local-tax-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				})
				.on("change", "#enterpriseId", function(e){
					e.stopPropagation();
					var enterpriseId = $(this).val();
					$.ajax({
						url: "enterprise/detail",
						type: "POST",
						data:{
							enterpriseId: enterpriseId
						},
						success: function(data) {
							$.each(data.data,function(ky,vl){
								$("#national-modal").find("[name='nationalTaxNumber']").val(data.data.nationalTaxNumber);
								$("#national-modal").find("[name='nationalTaxUser']").val(data.data.nationalTaxUser);
								$("#local-modal").find("[name='localTaxNumber']").val(data.data.localTaxNumber);
								$("#local-modal").find("[name='localTaxUser']").val(data.data.localTaxUser);
							});
							$tar.find("#national-input-form").find("em").addClass("am-hide");
							$tar.find("#local-input-form").find("em").addClass("am-hide");
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
				now.setMonth(now.getMonth() - 1);
				
				self.$tar.html(self.$tempTar.doT());
				self.datetimepicker(self.$tar.find("#tab1 .monthly"));
				self.datetimepicker(self.$tar.find("#tab2 .monthly"));
				self.$tar.find("#tab1 .monthly").val(now.format("yyyy-mm"));
				self.$tar.find("#tab2 .monthly").val(now.format("yyyy-mm"));
				$('[data-am-selected]').selected();
				return self;
			}
		},
		load: {
			value: function(monthly, tab){
				var self = this;
				var url = "";
				var tab = tab;
				if(tab == null || tab == "") {
					tab = self.$tar.find(".am-tabs-nav li[class='am-active']").attr("tab");
				}
				var searchType = self.$tar.find("#"+tab).find(".searchType").val();
				var $table = null;
				var $Template = null;
				if(searchType == "2") {
					url = "tax/listByProductType";
				}else if(searchType == "3") {
					url = "tax/listByArea";
				} else {
					url = "tax/listByEnterprise";
				}
				if(tab == "tab1") {
					$table = self.$tar.find("#national-tax-table");
					$Template = $(".template.NationalTaxGVList");
				} else {
					$table = self.$tar.find("#local-tax-table");
					$Template = $(".template.LocalTaxGVList");
				}
				$table.html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				var now = new Date();
				now.setMonth(now.getMonth() - 1);
				
				$.ajax({
					url: url,
					type: "POST",
					data:{
						monthly: monthly || now.format("yyyy-mm"),
					},
					success: function(data) {
						$table.html(
							$Template.doT({
								data: data.data,
								searchType: searchType,
							})
						);
						var $dataTables_fileter;
						self.datatables = $table.dataTable({
							"dom": '<"datatable-header"<"dataTables_filter">l><"datatable-scroll"t><"datatable-footer"ip>',
							//"searchable": false,//不能加，不然会影响search方法
							initComplete: function(settings) {
								var searchHTML = '<label style="font-size: 1.5rem;">搜索:</label> <input type="search" class="am-form-field am-input-sm am-inline-block" style="width: 60%;font-size:1.2rem!important;" placeholder="关键字搜索..." aria-controls="datatable1">';
								if(tab == "tab1") {
									self.$tar.find('#national-tax .dataTables_filter').append(searchHTML);
								} else {
									self.$tar.find('#local-tax .dataTables_filter').append(searchHTML);
								}
								/** 重写搜索事件 **/
								$('.dataTables_filter input').bind('keyup',
								function(e) {
									self.datatables.fnFilter(this.value);
								});
							}
						});
						self.$tar.find(".dataTables_filter").css("width", "41.5%"); 
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#national-input-form").validate({
				      errorElement: "em",
				      errorPlacement: function(error, element) { //指定错误信息位置
				    	 // if (element.is('#enterpriseId') ) { //如果是radio或checkbox
					    //	  error.appendTo(element.next(".am-selected")); //将错误信息添加当前元素的父结点后面
				    	 // } else {
				    	  	  error.insertAfter(element);
				    	 // }
			    	  }, 
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  //enterpriseId: "required",
				    	  monthly: "required",
				          sale: {
				        	  required: true,
				    		  number: true
				          },
				          taxes: {
				        	  required: true,
				    		  number: true
				          },
				      }
			    });
				return validatorr;
			}
		},
		getLocalValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#local-input-form").validate({
				      errorElement: "em",
				      errorPlacement: function(error, element) { //指定错误信息位置
				    	  //if (element.is('#enterpriseId') ) { //如果是radio或checkbox
					    //	  error.appendTo(element.next(".am-selected")); //将错误信息添加当前元素的父结点后面
				    	 // } else {
				    	  	  error.insertAfter(element);
				    	 // }
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
		},
		datetimepicker: {
			value: function($obj) {
				var self = this;
				$obj.datetimepicker( {
				      lang: "ch",           //语言选择中文
				      format: "Y-m",   //格式化日期
				      timepicker: false,
				      onShow: function() {
						$(this).find(".xdsoft_calendar").addClass("am-hide");
				      },
				      scrollInput: false,
				      onChangeMonth: function(currentDateTime) {
				    	  $obj.val(currentDateTime.format("yyyy-mm"));
						  if($obj.hasClass("monthly")) {
							  self.load($obj.val());
				    	  }
				      } 
				});
				return self;
			}
		}
	});
})( jQuery );
</script>
