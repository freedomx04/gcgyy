<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template DeclareEP" type="text/x-jquery-tmpl">
	<div class="admin-content">
    	<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">网上申报</strong></div>
    	</div>
    	
    	<div class="am-tabs" data-am-tabs>
	  	  <ul class="am-tabs-nav am-nav am-nav-tabs">
	  	    <li class="am-active" tab="tab1"><a href="#tab1">申报项目</a></li>
	  	    <li tab="tab2"><a href="#tab2">我的申报</a></li>
	  	  </ul>
	
	  	  <div class="am-tabs-bd">
	  	    <div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
		    	<div class="am-g">
					<div class="am-u-sm-12">
						<form class="" id="declare">
							<div class="am-btn-toolbar am-fl">
								<div class="am-btn-group am-btn-group-sm">
		           					<button type="button" class="am-btn am-btn-default declare-apply-btn"><span class="am-icon-plus"></span> 申报</button>
		         				</div>
							</div>
							<table class="am-table am-table-striped am-table-hover table-main" id="declare-table">
							</table>
						</form>
					</div>
				</div>
			</div>
			
			<div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
		    	<div class="am-g">
				  <div class="am-u-sm-12 am-margin-top">
					  <form class="" id="declareApply">
						<div class="am-btn-toolbar am-fl">
							<div class="am-btn-group am-btn-group-sm">
								<button type="button" class="am-btn am-btn-default declareApply-update-btn"><span class="am-icon-save"></span> 编辑</button>
								<button type="button" class="am-btn am-btn-default declareApply-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
	       					</div>
						</div>
						<table class="am-table am-table-striped am-table-hover table-main" id="declareApply-table">
							<thead>
								<tr>
									<th class="table-check"></th>
									<th>#</th>
									<th>申报项目名称</th>
									<th>申报开始时间</th>
									<th>申报结束时间</th>
									<th>状态</th>
									<th>申报内容</th>
									<th>申报人</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</form>
				  </div>
	    		</div>
		    </div>
		</div>
	  </div>
	</div>
</script>

<script class="template DeclareEPDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">申报信息
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="declare-input-form" style="max-height:500px;overflow:auto;">
		
				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报名称:</label>
			    	<div class="am-u-sm-8 padding-left-o">
						<input type="text" value="{{=it.data.declare.itemName}}" class="am-form-field" disabled/>
			    	</div>
				</div>

				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报开始时间:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<input type="text" class="am-form-field" value="{{=$k.util.getDateString(it.data.declare.startTime)}}" disabled/>
		    		</div>
				</div>

				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报结束时间:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<input type="text" class="am-form-field" value="{{=$k.util.getDateString(it.data.declare.endTime)}}" disabled/>
		    		</div>
				</div>

				<div class="am-form-group filepathInput">
		    		<label for="" class="am-u-sm-4 am-form-label font-normal">文件模板:</label>
		    		<a class="am-u-sm-8 padding-left-o am-text-left" style="padding-top:.6em;" href="{{="downloadFile?filepath="+it.data.declare.attachPath}}" title="点击下载">
						{{=it.data.declare.attachName}}
					</a>
		  		</div>

				<div class="am-form-group">
		    		<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">发布人:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<input type="text" class="am-form-field" value="{{=it.data.declare.user.name}}" disabled/>
		    		</div>
				</div>

				<div class="am-form-group">
		    		<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">审核状态:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<input type="text" class="am-form-field" disabled value="{{=it.data.status == "1" ? "未审批" : it.data.status == "2" ? "通过" : it.data.status =="3" ? "未通过" : "新增"}}"/>
		    		</div>
				</div>

				<div class="am-form-group">
		    		<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">审核原由:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<textarea rows="5" disabled>{{=it.data.declare.opinion || ""}}</textarea>
		    		</div>
				</div>

				<div class="am-form-group">
		    		<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报内容:</label>
		    		<a class="am-u-sm-8 padding-left-o am-text-left" style="padding-top:.6em;" href="{{="downloadFile?filepath="+it.data.attachPath}}" title="点击下载">
						{{=it.data.attachName}}
					</a>
				</div>

			</form>
			<button type="button" class="am-btn am-btn-primary" data-am-modal-cancel>确定</button>
		</div>
	</div>
</script>

<script class="template DeclareApplyDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">申报信息
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="declareApply-input-form">
		
				<input name="id" id="id" type="text" class="am-hide"/>
		
				<div class="am-form-group am-form-file">
		    		<label for="" class="am-u-sm-3 am-form-label font-normal">申报文件:</label>
		    		<div class="am-u-sm-4 padding-left">
			    		<button type="button" class="am-btn am-btn-secondary">
    					<i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
  						<input id="upload-file-input" name="uploadfile" type="file" accept="*">
  					</div>
		    		<div class="am-u-sm-5">
		      			<input type="text" id="attachName" name="attachName" class="am-form-field"/>
						<input type="text" id="attachPath" name="attachPath" class="am-form-field am-hide" style="line-height:normal"/>
		    		</div>
		  		</div>

				<div class="am-form-group">
		    		<label for="remark" class="am-u-sm-3 am-form-label font-normal">申报描述:</label>
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
<script class="template DeclareList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th></th>
		<th>#</th>
		<th>申报项目名称</th>
		<th>申报开始时间</th>
		<th>申报结束时间</th>
		<th>
			{{ if(it.resource.indexOf('agency_department') > -1) {　}}
				状态
			{{ } else if(it.resource.indexOf('agency_enterprise') > -1) { }}
				是否申报
			{{ } }}
		</th>
		<th>已申报企业数</th>								
		<th>申报模板</th>
		<th>发布人</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: declare:index }}
		<tr class="table-tr">
			<td><input type='radio' class='box' name='box'/></td>
			<td id="{{=declare.id}}">{{=index+1}}</td>
			<td class="td-title ellipsis" title=""><a class="declareInfo-href">{{=declare.itemName || ""}}</a></td>	
			<td>{{=$k.util.getDateString(declare.startTime)}}</td>
			<td declareEndTime="{{=declare.endTime}}">{{=$k.util.getDateString(declare.endTime)}}</td>
			{{ if(it.resource.indexOf('agency_department') > -1) {　}}
				<td declareStatus="{{=declare.status}}" applyStatus="{{=declare.applyStatus}}">{{=declare.status=="1" ? "展示中": declare.status=="2" ? "下架" : "新增"}}</td>
			{{ } else if(it.resource.indexOf('agency_enterprise') > -1) { }}
				<td declareStatus="{{=declare.status}}" applyStatus="{{=declare.applyStatus}}">{{=declare.applyStatus=="1" ? "已申报": declare.applyStatus=="0" ? "未申报" : ""}}</td>
			{{ } }}
			<td>{{=declare.declareApplys.length}}</td>
			<td title="点击下载"><a href="{{="downloadFile?filepath="+declare.attachPath}}">{{=declare.attachName}}</a></td>
			<td>{{=declare.user !=null ? declare.user.name : ""}}</td>
		</tr>
	{{~}}
</tbody>
</script>

<script class="template DeclareApplyList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th></th>
		<th>#</th>
		<th>申报项目名称</th>
		<th>申报开始时间</th>
		<th>申报结束时间</th>
		<th>审核状态</th>
		<th>模板</th>
		<th>申报内容</th>
		<th>发布人</th>
	</tr>
</thead>
<tbody>
	{{~ it.data: data:index }}
		<tr class="table-tr">
			<td><input type='radio' class='box' name='box'/></td>
			<td id="{{=data.id}}">{{=index+1}}</td>
			<td class="td-title ellipsis" title=""><a class="declareApplyInfo-href">{{=data.declare.itemName}}</a></td>	
			<td>{{=$k.util.getDateString(data.declare.startTime)}}</td>
			<td declareEndTime="{{=data.declare.endTime}}">{{=$k.util.getDateString(data.declare.endTime)}}</td>
			<td declareApplyStatus="{{=data.status}}">{{=data.status=="1" ? "未审核": data.status=="2" ? "通过" : data.status=="3" ? "未通过" : "新增"}}</td>
			<td title="点击下载"><a href="{{="downloadFile?filepath="+data.declare.attachPath}}">{{=data.declare.attachName}}</a></td>
			<td title="点击下载"><a href="{{="downloadFile?filepath="+data.attachPath}}">{{=data.attachName}}</a></td>
			<td>{{=data.declare.user !=null ? data.declare.user.name : ""}}</td>
		</tr>
	{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "DeclareEP";
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
						self.getDeclareApplyList();
					}
				})
				.on("click", ".declare-apply-btn", function() {
					var id = $k.util.trChecked("declare");
					if (id == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html($(".template.DeclareApplyDialog").doT());
					self.getValidate($dialog);
					$k.util.dateTimepicker();
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#declareApply-input-form').valid()) {//如果表单验证成功，则进行提交。  
								$.ajax({
									url: "declareApply/add",
									type: "POST",
									data:{
										declareId: id,
										enterpriseId: self.enterpriseId,
										description: $dialog.find("#description").val(),
										attachName: $dialog.find("#attachName").val(),
										attachPath: $dialog.find("#attachPath").val(),
									},
									success: function(data) {
										if (data.status == 0) {
											self.load();
											$modal.close($dialog.remove());
										} else if(data.status == 3) {
											$modal.close($dialog.remove());
											$k.util.alertModal("该项目您已申报，请勿重复申报！");
										}
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
				})
				.on("click", ".declareApply-update-btn", function() {
					var id = $k.util.trChecked("declareApply");
					if (id == null){
						return;
					}
					$.ajax({
						url: "declareApply/detail",
						type: "POST",
						data:{ declareApplyId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html($(".template.DeclareApplyDialog").doT());
							self.getValidate($dialog);
							$k.util.dateTimepicker();
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl)
							})
							$dialog.modal({
								closeViaDimmer:false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $declareApplyInputForm = $("#declareApply-input-form");
									if ($declareApplyInputForm.valid()) {//如果表单验证成功，则进行提交。  
										$.ajax({
											url: "declareApply/edit",
											type: "POST",
											data:{
												declareApplyId: $declareApplyInputForm.find("#id").val(),
												description: $declareApplyInputForm.find("#description").val(),	
												attachName:	$declareApplyInputForm.find("#attachName").val(),
												attachPath: $declareApplyInputForm.find("#attachPath").val()
											},
											success: function(data) {
												$modal.close($dialog.remove());
												self.getDeclareApplyList();
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".declareApply-delete-btn", function() {
					var ids = $k.util.trOperateChecked("declareApply");
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
								url: "declareApply/delete",
								type: "POST",
								data: { declareApplyIds: ids.toString() },
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
				.on("click",".declareInfo-href",function(e){
					e.stopPropagation();
					var declareId = $(this).parent().prev().attr("id");
					$.ajax({
						url: "declare/detail",
						type: "POST",
						data:{ declareId: declareId },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt" id="declare-input"></div>').appendTo(self.$tar);
							$dialog.html($(".template.DeclareGVDialog").doT());
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl);
								if(ky=="startTime"&&vl!=""&&vl!=null){
									$tar.find("#startTime").val(new Date(vl).format("yyyy-mm-dd HH:MM"));
								} else if(ky=="endTime"&&vl!=""&&vl!=null){
									$tar.find("#endTime").val(new Date(vl).format("yyyy-mm-dd HH:MM"));
									
								} else if(ky=="attachPath"){
									$dialog.find(".am-form-file").addClass("am-hide");
									$dialog.find(".filepathInput").removeClass("am-hide");
									$dialog.find(".filepathInput a").attr("href", "downloadFile?filepath="+vl);
								} else if(ky == "attachName"){
									$dialog.find(".filepathInput a").html(vl!=""?vl:"无");
								}
							});
							$dialog.modal({
								closeViaDimmer: false,
 								onCancel: function(e) {
									this.close($dialog.remove());
								} 
							});
							$k.util.inputDisabled("declare");
						},
						error: function(err) {}
					});
				})
				.on("click",".declareApplyInfo-href",function(e){
					e.stopPropagation();
					var declareApplyId = $(this).parent().prev().attr("id");
					$.ajax({
						url: "declareApply/detail",
						type: "POST",
						data:{ declareApplyId: declareApplyId },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT({
								data: data.data
							}));
							$dialog.modal({
								closeViaDimmer: false,
 								onCancel: function(e) {
									this.close($dialog.remove());
								} 
							});
						},
						error: function(err) {}
					});
				})
				.on('change', '#upload-file-input', function() {
				      $.ajax({
							url: "uploadFile",
							type: "POST",
							data: new FormData($("#declareApply-input-form")[0]),
							enctype : 'multipart/form-data',
							processData: false,
							contentType: false,
							cache: false,
							success: function(data) {
								if(data.status=="0"){
									self.$tar.find("#attachPath").val(data.data.filePath);
									self.$tar.find("#attachName").val(data.data.fileName);
								}
							},
							error: function(data) {}
					});
			    })
				.on("change", "#declare-table .box_all, #declareApply-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#declare-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					var id = $this.closest("tr").find("td[id]").attr("id");
					$this.closest("tbody").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					$tar.find("#declare .declare-apply-btn").removeClass("am-disabled");
					var applyStatus = $tar.find("#declare-table #"+id).closest("tr").find("td[applyStatus]").attr("applyStatus");
					if(applyStatus == 1) {
						$tar.find("#declare .declare-apply-btn").addClass("am-disabled");
					}
				})
				.on("click", "#declareApply-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					$this.closest("tbody").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					$tar.find("#declareApply .declareApply-delete-btn").removeClass("am-disabled");
					$tar.find("#declareApply .declareApply-update-btn").removeClass("am-disabled");
					var id = $this.closest("tr").find("td[id]").attr("id");
					var status = $tar.find("#declareApply-table #"+id).closest("tr").find("td[declareApplyStatus]").attr("declareApplyStatus");
					var declareEndTime = $tar.find("#declareApply-table #"+id).closest("tr").find("td[declareEndTime]").attr("declareEndTime");
					if(declareEndTime < new Date() || status == "2" || status == "3") {
						$tar.find("#declareApply .declareApply-delete-btn").addClass("am-disabled");
						$tar.find("#declareApply .declareApply-update-btn").addClass("am-disabled");
					}
				})
				.on("click", "#declare-table .table-tr, #declareApply-table .table-tr", function(e) {
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
				self.$tar.find("#declare-table").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "user/detail",
					type: "POST",
					data: {
						userId: $k.user.get().id
					},
					success: function(data) {
						if(data.status == 0) {
							self.enterpriseId = data.data.enterprise.id
							$.ajax({
								url: "declare/listOnline",
								type: "POST",
								data: {
									enterpriseId: self.enterpriseId
								},
								success: function(data) {
									self.$tar.find("#declare-table").html(
										$(".template.DeclareList").doT({
												data: data.data,
												resource: $k.user.get().role.resource
											})
										);
									self.datatables = self.$tar.find("#declare-table").dataTable();
								},
								error: function(err) {}
							});
						}
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getDeclareApplyList: {
			value: function() {
				var self = this;
				self.$tar.find("#declareApply-table").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "declareApply/listByEnterpriseId",
					type: "POST",
					data: {
						enterpriseId: self.enterpriseId
					},
					success: function(data) {
						self.$tar.find("#declareApply-table").html(
							$(".template.DeclareApplyList").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#declareApply-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validator = $dialog.find("#declareApply-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  attachPath: "required"
				      }
			    });
				return validator;
			}
		}
	});
})( jQuery );
</script>