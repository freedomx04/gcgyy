<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Jobplatform" type="text/x-jquery-tmpl">
	<div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">招工平台</strong></div>
    </div>

	<div class="am-tabs" data-am-tabs>
	  <ul class="am-tabs-nav am-nav am-nav-tabs">
	    <li class="am-active" tab="tab1"><a href="#tab1">招工信息</a></li>
	    <li tab="tab2"><a href="#tab2">求职信息</a></li>
	  </ul>

	  <div class="am-tabs-bd">
	    <div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
	    	<div class="am-g">
		      <div class="am-u-sm-12">
		        <form id="hire">
					<div class="table-div">
						<div class="am-btn-toolbar am-fl" id="hire-toolbar">
          					<div class="am-btn-group am-btn-group-xs">
            					<button type="button" class="am-btn am-btn-default hire-add-btn"><span class="am-icon-plus"></span> 新增</button>
            					<button type="button" class="am-btn am-btn-default hire-update-btn"><span class="am-icon-save"></span> 编辑</button>
            					<button type="button" class="am-btn am-btn-default hire-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
          					</div>
        				</div>
		          		<table class="am-table am-table-striped am-table-hover table-main" id="hire-table">
		            		<thead>
		              			<tr>
		                			<th class="table-id">#</th>
									<th>企业名称</th>
									<th>职位名称</th>
									<th>联系电话</th>
									<th>薪资</th>
		                			<th>行业</th>
									<th>职位要求</th>
		              			</tr>
		          			</thead>
		          			<tbody></tbody>
		       			</table>
					</div>
		        </form>
		      </div>
    		</div>
	    </div>
	    <div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
	    	<div class="am-g">
		      <div class="am-u-sm-12">
		        <form id="job">
					<div class="table-div">
						<div class="am-btn-toolbar am-fl {{=($k.user.get().role.resource.indexOf('agency_enterprise') > -1) ? "am-hide" : ""}}" id="job-toolbar">
          					<div class="am-btn-group am-btn-group-xs">
            					<button type="button" class="am-btn am-btn-default job-add-btn"><span class="am-icon-plus"></span> 新增</button>
            					<button type="button" class="am-btn am-btn-default job-update-btn"><span class="am-icon-save"></span> 编辑</button>
            					<button type="button" class="am-btn am-btn-default job-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
          					</div>
        				</div>
		          		<table class="am-table am-table-striped am-table-hover table-main" id="job-table">
		            		<thead>
		              			<tr>
									<th><input type='checkbox' class='box_all' name='box'/></th>
		                			<th class="table-id">#</th>
									<th>姓名</th>
		                			<th>个人电话</th>
									<th>性别</th>
									<th>年龄</th>
									<th>行业</th>
		                			<th>资薪</th>
									<th>自我描述</th>
		                			<th>工作经历</th>
		              			</tr>
		          			</thead>
		          			<tbody></tbody>
		        		</table>
					</div>
		        </form>
		      </div>
    		</div>
	    </div>
	  </div>
	</div>
  </div>
</script>

<script class="template HireDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	招工信息
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd" style="max-height:500px;overflow:auto;">
	    <form class="am-form am-form-horizontal" id="hire-input-form">
	    	  <input name="id" id="id" type="text" class="am-hide"/>
				
			 <div class="am-form-group am-form-file">
			     <label for="" class="am-u-sm-3 am-form-label font-normal">图片:</label>
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

			  <div class="am-form-group imageShow am-hide">
			     <label for="" class="am-u-sm-3 am-form-label font-normal">图片:</label>
			     <div class="am-u-sm-9 padding-left">
			        <img src="" style="width: 100%; max-width: 350px; max-height: 200px;"/>
			     </div>
			  </div>

	    	  <div class="am-form-group">
					<label for="enterpriseId" class="am-u-sm-3 am-form-label font-normal">企业名称:</label>
					<div class="am-u-sm-9 padding-left">
		    			<select name="enterpriseId" id="enterpriseId"  maxchecked="1" disabled>
	     		 			{{~ it.enterprise: enterprise}}	
								<option value="{{=enterprise.id}}">{{=enterprise.name}}</option>
							{{~}} 
						</select>
					</div>
			  </div>
			  
			  <div class="am-form-group">
					<label for="title" class="am-u-sm-3 am-form-label font-normal">职位名称:</label>
		    		<div class="am-u-sm-9 padding-left">
						<input type="text" name="position" id="position" class="am-form-field"/>
		    		</div>
			  </div>
			  
			  <div class="am-form-group">
					<label for="telephone" class="am-u-sm-3 am-form-label font-normal">电话:</label>
		    		<div class="am-u-sm-9 padding-left">
						<input type="text" name="telephone" id="telephone" class="am-form-field"/>
		    		</div>
			  </div>

			  <div class="am-form-group">
					<label for="title" class="am-u-sm-3 am-form-label font-normal">资薪:</label>
		    		<div class="am-u-sm-9 padding-left">
						<input type="text" name="salary" id="salary" class="am-form-field"/>
		    		</div>
			  </div>
			
			  <div class="am-form-group">
					<label for="businessId" class="am-u-sm-3 am-form-label font-normal">行业:</label>
					<div class="am-u-sm-9 padding-left">
		    			<select name="businessId" id="businessId"  maxchecked="1" >
							<option value="">请选择</option>
	     		 			{{~ it.business: business}}	
								<option value="{{=business.id}}">{{=business.name}}</option>
							{{~}} 
						</select>
					</div>
			  </div>

			  <div class="am-form-group">
					<label for="title" class="am-u-sm-3 am-form-label font-normal">职位介绍:</label>
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

<script class="template JobDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">
    	求职信息
    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    </div>
    <div class="am-modal-bd" style="overflow:auto;height:500px">
	    <form class="am-form am-form-horizontal" id="job-input-form">
	    	  <input name="id" id="id" type="text" class="am-hide"/>

			 <div class="am-form-group">
					<label for="userId" class="am-u-sm-3 am-form-label font-normal">姓名:</label>
					<div class="am-u-sm-9 padding-left">
		    			<select name="userId" id="userId" disabled>
	     		 			{{~ it.user: user}}	
								<option value="{{=user.id}}">{{=user.name}}</option>
							{{~}} 
						</select>
					</div>
			  </div>

			  <div class="am-form-group sexShow am-hide">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">性别:</label>
			    <div class="am-u-sm-9 padding-left">
				    <input type="text" name="sex" id="sex" value="{{=(user.sex=="0"?"女":user.sex=="1"?"男":"")}}" class="am-form-field" />
		     	</div>
			  </div>
			  
			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">年龄:</label>
			    <div class="am-u-sm-9 padding-left">
				     <input type="text" name="age" id="age" class="am-form-field" />
		     	</div>
			  </div>
			  
			  <div class="am-form-group">
					<label for="businessId" class="am-u-sm-3 am-form-label font-normal">行业:</label>
					<div class="am-u-sm-9 padding-left">
		    			<select name="businessId" id="businessId"  maxchecked="1" >
							<option value="">请选择</option>
	     		 			{{~ it.business: business}}	
								<option value="{{=business.id}}">{{=business.name}}</option>
							{{~}} 
						</select>
					</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">个人电话:</label>
			    <div class="am-u-sm-9 padding-left">
				    <input type="text" name="telephone" id="telephone" class="am-form-field" />
		     	</div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">薪资:</label>
			    <div class="am-u-sm-9 padding-left">
				    <input type="text" name="salary" id="salary" class="am-form-field" />
		     	</div>
			  </div>
			
			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">自我描述:</label>
			    <div class="am-u-sm-9 padding-left">
			      <textarea rows="5" name="description" id="description" ></textarea>
			    </div>
			  </div>

			  <div class="am-form-group">
			    <label for="" class="am-u-sm-3 am-form-label font-normal">工作经历:</label>
			    <div class="am-u-sm-9 padding-left">
			      <textarea rows="5" name="experience" id="experience" ></textarea>
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

<script class="template JobList" type="text/x-jquery-tmpl">
	{{~ it.data: job:index }}
		<tr class="table-tr">
			<td><input type='checkbox' class='box' name='box'/></td>
			<td id="{{=job.id}}">{{=index+1}}</td>
			<td class="td-title ellipsis" title="{{=job.user !=null ?  job.user.name:""}}"><a class="jobInfo-href">{{=job.user !=null ? job.user.name:""}}</a></td>
			<td class="td-content ellipsis" title="{{=job.telephone}}">{{=job.telephone}}</td>
			<td>{{=job.user !=null ? (job.user.sex=="0"?"女":job.user.sex=="1"?"男":"") : ""}}</td>
			<td>{{=job.age || ""}}</td>
			<td class="td-name ellipsis" title="{{=job.business.id}}">{{=job.business.name}}</td>
			<td class="td-content ellipsis" title="{{=job.salary}}">{{=job.salary || ""}}</td>
			<td class="td-content ellipsis" title="{{=job.description}}">{{=(job.description|| "" )}}</td>
			<td class="td-content ellipsis" title="{{=job.experience}}">{{=(job.experience|| "" )}}</td>
		</tr>
	{{~}}
</script>

<script class="template HireList" type="text/x-jquery-tmpl">
	{{~ it.data: hire:index }}
		<tr class="table-tr">
			<td id="{{=hire.id}}">{{=index+1}}</td>
			<td class="td-title ellipsis" title="{{=hire.enterprise.name}}">{{=hire.enterprise.name}}</td>
			<td class="td-name ellipsis" title="{{=hire.position}}"><a class="hireInfo-href">{{=hire.position}}</a></td>
			<td class="td-content ellipsis" title="{{=hire.telephone}}">{{=hire.telephone}}</td>
			<td class="td-content ellipsis" title="{{=hire.salary}}">{{=hire.salary}}</td>
			<td class="td-name ellipsis" title="{{=hire.business.name}}">{{=hire.business.name}}</td>
			<td class="td-content ellipsis" title="{{=hire.description}}">{{=(hire.description|| "" )}}</td>
		</tr>
	{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "Jobplatform";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		$tempHireDialogTar: {
			value: $(".template.HireDialog")
		},
		$tempJobDialogTar: {
			value: $(".template.JobDialog")
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				
				$tar
				.on("click", "[tab='tab1']", function() {
						self.load();
				})
				.on("click", "[tab='tab2']", function() {
						self.getJobList();
				})
				.on("click", ".hire-add-btn", function() {
					$k.util.getEnterpriseList({
						success: function(enterpriseData){
							$k.util.getBusinessList({
								success: function(businessData){
									$k.util.getEnterprise({
										success: function(enterprise) {
											if (enterpriseData == null || businessData.data == null || enterprise.data == null) {
												return;
											}
											var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempHireDialogTar.doT({
												enterprise: enterpriseData.data,
												business: businessData.data
											}));
											self.getValidate($dialog);
											$dialog.find("[name='enterpriseId']").val(enterprise.data.id);
											
											$dialog.modal({
												closeViaDimmer: false,
												closeOnConfirm: false,
												onConfirm: function(e) {
													var $modal = this;
													var $hireInputForm = $("#hire-input-form");
													if ($dialog.find('#hire-input-form').valid()) {
														$.ajax({
															url: "hire/add",
															type: "POST",
															data:{
																imagePath: $hireInputForm.find("#imagePath").val(),
																enterpriseId: $hireInputForm.find("#enterpriseId").val(),
																position: $hireInputForm.find("#position").val(),
																telephone: $hireInputForm.find("#telephone").val(),
																salary: $hireInputForm.find("#salary").val(),
																businessId: $hireInputForm.find("#businessId").val(),
																description: $hireInputForm.find("#description").val()
															},
															success: function(data) {
																self.load();
																$modal.close($dialog.remove());
															},
															error: function(err) {
																alertModal("操作失败，请稍后重试！");
															}
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
				.on("click", ".hire-update-btn", function() {
					var id = $k.util.trChecked("hire");
					if(id==null){
						return;
					}
					$.ajax({
						url: "hire/detail",
						type: "POST",
						data: {hireId: id},
						success: function(data) {
							$k.util.getEnterpriseList({
								success: function(enterpriseData) {
									$k.util.getBusinessList({
										success: function(businessData){
											var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempHireDialogTar.doT({
												enterprise: enterpriseData.data,
												business: businessData.data
											}));
											self.getValidate($dialog);
											$.each(data.data,function(ky,vl) {
												$tar.find("[name='"+ky+"']").val(vl);
												if(ky == "enterprise" && vl!=null) {
													$dialog.find("[name='enterpriseId']").val(vl.id);
												}
												if(ky == "business" && vl!=null) {
													$dialog.find("[name='businessId']").val(vl.id);
												}
											})
											$dialog.modal({
												closeViaDimmer: false,
												closeOnConfirm: false,
												onConfirm: function(e) {
													var $modal = this;
													if ($dialog.find('#hire-input-form').valid()) {  
														var $hireInputForm = $("#hire-input-form");
														$.ajax({
															url: "hire/edit",
															type: "POST",
															data:{
																hireId: $hireInputForm.find("#id").val(),
																imagePath: $hireInputForm.find("#imagePath").val(),
																enterpriseId: $hireInputForm.find("#enterpriseId").val(),
																position: $hireInputForm.find("#position").val(),
																telephone: $hireInputForm.find("#telephone").val(),
																salary: $hireInputForm.find("#salary").val(),
																businessId: $hireInputForm.find("#businessId").val(),
																description: $hireInputForm.find("#description").val()
															},
															success: function(data) {
																$modal.close($dialog.remove());
																self.load();
															},
															error: function(err) {
																alertModal("操作失败，请稍后重试！");
															}
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".hire-delete-btn", function() {
					var ids = $k.util.trOperateChecked("hire");
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
								url: "hire/delete",
								type: "POST",
								data: { hireIds: ids.toString() },
								success: function(data) {
									if (data.status == 0) {
										self.load();
										$modal.close($dialog.remove());
									} else{
										alertModal("删除错误！");
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
				.on("click",".hireInfo-href",function(e){
					e.stopPropagation();
					var hireId = $(this).parent().prev().prev().attr("id");
					$.ajax({
						url: "hire/detail",
						type: "POST",
						data:{
							hireId: hireId
						},
						success: function(data) {
							$k.util.getEnterpriseList({
								success: function(enterpriseData){
									$k.util.getBusinessList({
										success:function(businessData){
											var $dialog = $('<div class="am-modal am-modal-prompt" id="hire-input"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempHireDialogTar.doT({
												enterprise: enterpriseData.data,
												business: businessData.data
											}));
											$.each(data.data,function(ky,vl){
												$dialog.find("[name='"+ky+"']").val(vl);
												$dialog.find(".am-form-file").addClass("am-hide");
												if(ky=="imagePath" && vl!=""){
													$dialog.find(".imageShow").removeClass("am-hide");
													$dialog.find(".imageShow").find("img").attr("src","./"+vl);
												}
												if(ky == "enterprise" && vl!=null) {
													$dialog.find("[name='enterpriseId']").val(vl.id);
												}
												if(ky == "business" && vl!=null) {
													$dialog.find("[name='businessId']").val(vl.id);
												}
											});
											
											$dialog.modal({
												closeViaDimmer: false,
												onCancel: function() {
													this.close($dialog.remove());
												}
											});
											$k.util.inputDisabled("hire");
										}
									});
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".job-add-btn", function() {
					$k.util.getUserList({
						success: function(userData){
							$k.util.getBusinessList({
								success: function(businessData){
									var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
									$dialog.html(self.$tempJobDialogTar.doT({
										user: userData.data,
										business: businessData.data
									}));
									self.getJobValidate($dialog);
									$.each(userData.data,function(ky,vl) {
											$dialog.find("[name='userId']").val($k.user.get().id);
									})
									$dialog.modal({
										closeViaDimmer: false,
										closeOnConfirm: false,
										onConfirm: function(e) {
											var $modal = this;
											var $jobInputForm = $("#job-input-form");
											if ($dialog.find('#job-input-form').valid()) {
												$.ajax({
													url: "job/add",
													type: "POST",
													data:{
														userId: $jobInputForm.find("#userId").val(),
														age:$jobInputForm.find("#age").val(),
														telephone:$jobInputForm.find("#telephone").val(),
														businessId: $jobInputForm.find("#businessId").val(),
														salary: $jobInputForm.find("#salary").val(),
														description: $jobInputForm.find("#description").val(),
														experience: $jobInputForm.find("#experience").val()
													},
													success: function(data) {
														self.getJobList();
														$modal.close($dialog.remove());
													},
													error: function(err) {
														alertModal("操作失败，请稍后重试！");
													}
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
				})
				.on("click", ".job-update-btn", function() {
					var id = $k.util.trChecked("job");
					if(id==null){
						return;
					}
					$.ajax({
						url: "job/detail",
						type: "POST",
						data: {jobId: id},
						success: function(data) {
							$k.util.getUserList({
								success: function(userData) {
									$k.util.getBusinessList({
										success: function(businessData){
											var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempJobDialogTar.doT({
												user: userData.data,
												business: businessData.data
											}));
											self.getJobValidate($dialog);
											$.each(data.data,function(ky,vl) {
												$tar.find("[name='"+ky+"']").val(vl);
												if(ky == "user" && vl!=null) {
													$dialog.find("[name='userId']").val(vl.id);
												}
												if(ky == "business" && vl!=null) {
													$dialog.find("[name='businessId']").val(vl.id);
												}
											})
											$dialog.modal({
												closeViaDimmer: false,
												closeOnConfirm: false,
												onConfirm: function(e) {
													var $modal = this;
													if ($dialog.find('#job-input-form').valid()) {  
														var $jobInputForm = $("#job-input-form");
														$.ajax({
															url: "job/edit",
															type: "POST",
															data:{
																jobId: $jobInputForm.find("#id").val(),
																userId: $jobInputForm.find("#userId").val(),
																age:$jobInputForm.find("#age").val(),
																telephone:$jobInputForm.find("#telephone").val(),
																businessId: $jobInputForm.find("#businessId").val(),
																salary: $jobInputForm.find("#salary").val(),
																description: $jobInputForm.find("#description").val(),
																experience: $jobInputForm.find("#experience").val()
															},
															success: function(data) {
																$modal.close($dialog.remove());
																self.getJobList();
															},
															error: function(err) {
																alertModal("操作失败，请稍后重试！");
															}
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".job-delete-btn", function() {
					var ids = $k.util.trOperateChecked("job");
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
								url: "job/delete",
								type: "POST",
								data: { jobIds: ids.toString() },
								success: function(data) {
									if (data.status == 0) {
										self.getJobList();
										$modal.close($dialog.remove());
									} else{
										alertModal("删除错误！");
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
				.on("click",".jobInfo-href",function(e){
					e.stopPropagation();
					var jobId = $(this).parent().prev().attr("id");
					$.ajax({
						url: "job/detail",
						type: "POST",
						data:{
							jobId: jobId
						},
						success: function(data) {
							$k.util.getUserList({
								success: function(userData){
									$k.util.getBusinessList({
										success:function(businessData){
											var $dialog = $('<div class="am-modal am-modal-prompt" id="job-input"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempJobDialogTar.doT({
												user: userData.data,
												business: businessData.data
											}));
											$.each(data.data,function(ky,vl){
												$dialog.find("[name='"+ky+"']").val(vl);
												if(ky == "user" && vl!=null) {
													$dialog.find("[name='userId']").val(vl.id);
												}
												if(ky == "business" && vl!=null) {
													$dialog.find("[name='businessId']").val(vl.id);
												}
											});
											
											$dialog.modal({
												closeViaDimmer: false,
												onCancel: function() {
													this.close($dialog.remove());
												}
											});
											$k.util.inputDisabled("job");
										}
									});
								}
							});
						},
						error: function(err) {}
					});
				})
				.on('change', '#upload-file-input', function() {
					var $form = $tar.find("#hire-input-form");
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
				.on("change", "#hire-table .box_all, #job-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#hire-table .box, #job-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#hire-table .table-tr, #job-table .table-tr", function(e) {
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
			value: function(){
				var self = this;
				$k.util.getEnterprise({
					success: function(data) {
						if(data.data == null){
							if (self.datatables) {
								self.datatables.fnDestroy();
							}
							$.ajax({
								url: "hire/list",
								type: "POST",
								success: function(data) {
									$("#hire-table").find("tbody").html(
										$(".template.HireList").doT({
												data: data.data
											})
										);
									$("#hire-toolbar").addClass("am-hide");
									self.datatables = self.$tar.find("#hire-table").dataTable();
								},
								error: function(err) {}
							});
							return self;
						}else{
							if (self.datatables) {
								self.datatables.fnDestroy();
							}
							$.ajax({
								url: "hire/findByUserId",
								type: "POST",
								data:{
									userId: $k.user.get().id
								},
								success: function(data) {
									$("#hire-table").find("tbody").html(
										$(".template.HireList").doT({
												data: data.data
											})
										);
									self.datatables = self.$tar.find("#hire-table").dataTable();
								},
								error: function(err) {}
							});
							return self;
						}
					}
				});
			}
		},
		getJobList: {
			value: function(){
				var self = this;
				if($k.user.get().enterprise != null || $k.user.get().role.resource.indexOf('agency_department') > -1){
					if (self.datatables) {
						self.datatables.fnDestroy();
					}
					$.ajax({
						url: "job/list",
						type: "POST",
						success: function(data) {
							$("#job-table").find("tbody").html(
								$(".template.JobList").doT({
										data: data.data
									})
								);
							$("#job-toolbar").addClass("am-hide");
							self.datatables = self.$tar.find("#job-table").dataTable();
						},
						error: function(err) {}
					});
					return self;
				}else{
					if (self.datatables) {
						self.datatables.fnDestroy();
					}
					$.ajax({
						url: "job/findByUserId",
						type: "POST",
						data:{
							userId: $k.user.get().id
						},
						success: function(data) {
							$("#job-table").find("tbody").html(
								$(".template.JobList").doT({
										data: data.data
									})
								);
							self.datatables = self.$tar.find("#job-table").dataTable();
						},
						error: function(err) {}
					});
					return self;
				}
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#hire-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  position: "required",
				    	  telephone: {required: true, phone: true},
				    	  businessId: "required"
				      }
			    });
				return validatorr;
			}
		},
		getJobValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#job-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  age: {digits: true},
				    	  telephone: {required: true, phone: true},
				    	  businessId: "required"
				      },
				      messages: {
				    	  age: {digits: "请输入正确年龄格式"}
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>
