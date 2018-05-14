<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template DeclareGV" type="text/x-jquery-tmpl">
	<div class="admin-content">
    	<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">网上申报</strong></div>
    	</div>

    	<div class="am-g">
			<div class="am-u-sm-12">
				<form class="" id="declare">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-sm">
           					<button type="button" class="am-btn am-btn-default declare-add-btn"><span class="am-icon-plus"></span> 新增</button>
           					<button type="button" class="am-btn am-btn-default declare-update-btn"><span class="am-icon-save"></span> 编辑</button>
							<button type="button" class="am-btn am-btn-default declare-display-btn"><span class="am-icon-save"></span> 发布/结束</button>
							<button type="button" class="am-btn am-btn-default declare-enterprise-btn"><span class="am-icon-save"></span> 查看申报企业</button>
           					<button type="button" class="am-btn am-btn-default declare-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
         				</div>
					</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="declare-table">
					</table>
				</form>
			</div>
		</div>
	</div>
</script>
<script class="template DeclareGVDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">申报信息
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="declare-input-form">
		
				<input name="id" id="id" type="text" class="am-hide"/>
		
				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报名称:</label>
			    	<div class="am-u-sm-8 padding-left-o">
						<input type="text" name="itemName" id="itemName" class="am-form-field"/>
			    	</div>
				</div>

				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报开始时间:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<input type="text" id="startTime" name="startTime" class="am-form-field datetimepicker"/>
		    		</div>
				</div>

				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报结束时间:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<input type="text" id="endTime" name="endTime" class="am-form-field datetimepicker"/>
		    		</div>
				</div>
				
				<div class="am-form-group am-form-file">
		    		<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">文件模板:</label>
		    		<div class="am-u-sm-3 padding-left-o">
			    		<button type="button" class="am-btn am-btn-secondary">
    					<i class="am-icon-cloud-upload"></i> 选择上传模板</button>
  						<input id="upload-file-input" name="uploadfile" type="file" accept="*">
  					</div>
		    		<div class="am-u-sm-5">
		      			<input type="text" id="attachName" name="attachName" class="am-form-field"/>
						<input type="text" id="attachPath" name="attachPath" class="am-form-field am-hide" style="line-height:normal"/>
		    		</div>
		  		</div>

				<div class="am-form-group filepathInput am-hide">
		    		<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">文件模板:</label>
		    		<a class="am-u-sm-8 padding-left-o am-text-left" style="padding-top:.6em;" title="下载"></a>
		  		</div>

				<div class="am-form-group">
		    		<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">项目描述:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<textarea rows="5" name="description" id="description" class="am-form-field"></textarea>
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

<script class="template DeclareApproveDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">申报信息
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="declare-approve-input-form">
		
				<input name="id" id="id" type="text" class="am-hide"/>
		
				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报企业名称:</label>
			    	<div class="am-u-sm-8 padding-left-o">
						<input type="text" class="am-form-field" value="{{=it.data.enterprise.name}}" disabled/>
			    	</div>
				</div>
			
				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报材料:</label>
			    	<div class="am-u-sm-8 padding-left-o am-text-left">
						<a title="点击下载" href="{{="downloadFile?filepath="+it.data.attachPath}}">{{=it.data.attachName}}</a>
			    	</div>
				</div>
				
				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">申报时间:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<input type="text" class="am-form-field" value="{{=$k.util.getDateString(it.data.createTime)}}" disabled/>
		    		</div>
				</div>

				<div class="am-form-group">
					<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">审核状态:</label>
			    	<div class="am-u-sm-8 padding-left-o">
						<select name="status" id="status" class="am-form-field">
							<option value="">请选择</option>
							<option value="2">通过</option>
							<option value="3">未通过</option>
						</select>
			    	</div>
				</div>
				
				<div class="am-form-group">
		    		<label for="" class="am-u-sm-4 am-form-label font-normal padding-left-o">审核原因:</label>
		    		<div class="am-u-sm-8 padding-left-o">
						<textarea rows="5" name="opinion" id="opinion"></textarea>
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


<script class="template DeclareEnterpriseDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog" style="width:750px;">
	  <div class="am-modal-hd am-text-left" style="background-color:#eee;border-bottom:1px solid #ccc;">
	    	申报企业列表
	    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
	  </div>
	  <div class="am-modal-bd">
		<div class="am-g">
		<div class="am-u-sm-12">
			<form style="overflow:auto;max-height:500px;margin-top:20px;" id="declare-enterprise">
				<div class="am-text-danger am-hide am-text-left am-margin-bottom">还未选中一条记录！</div>
				<div class="am-btn-toolbar am-fl">
					<div class="am-btn-group am-btn-group-xs">
           				<button type="button" class="am-btn am-btn-default declare-approve-btn"><span class="am-icon-plus"></span> 审核</button>
         			</div>
				</div>
				<input id="declareId" class="am-hide"/>
	  			<table align="center" id="declare-enterprise-table" class="am-table am-table-striped am-table-hover table-main am-table-centered" style="width: 100%!important;">
	  		 		<thead>
						<tr>
							<th></th>
				  			<th>#</th>
							<th>企业名称</th>
							<th>申报材料</th>
							<th>企业申报时间</th>
							<th>审核状态</th>
							<th>审核原因</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</form>
		</div>
		</div>
			<button type="button" class="am-btn am-btn-primary" data-am-modal-cancel>确定</button>
	  </div>
	</div>
</script>

<script class="template DeclareEnterpriseList" type="text/x-jquery-tmpl">
	{{~ it.data: declareApply:index }}
		<tr class="table-tr">
			<td><input type='radio' class='box' name='box'/></td>
			<td id="{{=declareApply.id}}">{{=index+1}}</td>
			<td class="td-name ellipsis" title="{{=declareApply.enterprise != null ? declareApply.enterprise.name : ""}}">{{=declareApply.enterprise != null ? declareApply.enterprise.name : ""}}</td>
			<td title="点击下载"><a href="downloadFile?filepath={{=declareApply.attachPath}}">{{=declareApply.attachName}}</a></td>
			<td declareEndTime="{{=declareApply.declare.endTime}}">{{=$k.util.getDateString(declareApply.createTime)}}</td>
			<td declareStatus="{{=declareApply.status}}">{{=declareApply.status=="2" ? "通过": declareApply.status=="3" ? "未通过" : declareApply.status=="1" ? "未审核" : "新增"}}</td>
			<td class="td-content ellipsis" title="{{=declareApply.opinion || ""}}">{{=declareApply.opinion || ""}}</td>
		</tr>
	{{~}}
</script>
<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "DeclareGV";
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
				.on("click", ".declare-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempDialogTar.doT());
					self.getValidate($dialog);
					$k.util.dateTimepicker("Y-m-d H:i");
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#declare-input-form').valid()) {//如果表单验证成功，则进行提交。  
								$.ajax({
									url: "declare/add",
									type: "POST",
									data:{
										itemName: $dialog.find("#itemName").val(),
										description: $dialog.find("#description").val(),
										startTime: new Date(Date.parse($dialog.find("#startTime").val())),
										endTime: new Date(Date.parse($dialog.find("#endTime").val())),
										attachName: $dialog.find("#attachName").val(),
										attachPath: $dialog.find("#attachPath").val(),
										userId: $k.user.get().id
									},
									success: function(data) {
										if (data.status == 0) {
											self.load();
											$modal.close($dialog.remove());
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
				.on("click", ".declare-update-btn", function() {
					var id = $k.util.trChecked("declare");
					if (id == null){
						return;
					}
					$.ajax({
						url: "declare/detail",
						type: "POST",
						data:{ declareId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT());
							self.getValidate($dialog);
							$k.util.dateTimepicker("Y-m-d H:i");
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl);
								if(ky=="startTime"&&vl!=""&&vl!=null){
									$tar.find("#startTime").val(new Date(vl).format("yyyy-mm-dd HH:MM"));
								} else if(ky=="endTime"&&vl!=""&&vl!=null){
									$tar.find("#endTime").val(new Date(vl).format("yyyy-mm-dd HH:MM"));
									
								}
							})
							$dialog.modal({
								closeViaDimmer:false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $declareInputForm = $("#declare-input-form");
									if ($declareInputForm.valid()) {//如果表单验证成功，则进行提交。  
										$.ajax({
											url: "declare/edit",
											type: "POST",
											data:{
												declareId: $declareInputForm.find("#id").val(),
												itemName: $declareInputForm.find("#itemName").val(),
												description: $declareInputForm.find("#description").val(),
												startTime: new Date(Date.parse($declareInputForm.find("#startTime").val())),
												endTime: new Date(Date.parse($declareInputForm.find("#endTime").val())),
												attachName: $declareInputForm.find("#attachName").val(),
												attachPath: $declareInputForm.find("#attachPath").val(),
												userId: $k.user.get().id
											},
											success: function(data) {
												$modal.close($dialog.remove());
												self.load();
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
				.on("click", ".declare-delete-btn", function() {
					var ids = $k.util.trOperateChecked("declare");
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
								url: "declare/delete",
								type: "POST",
								data: { declareIds: ids.toString() },
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
							$dialog.html(self.$tempDialogTar.doT());
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
				.on("click", ".declare-enterprise-btn", function() {
					var id = $k.util.trChecked("declare");
					if (id == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-prompt" id="declare-enterprise-dialog"></div>').appendTo(self.$tar);
					$dialog.html($(".template.DeclareEnterpriseDialog").doT());
					$dialog.find("#declareId").val(id);
					self.getDeclareEnterpriseList(id);
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onCancel: function() {
							this.close($dialog.remove());
						}
					});
				})
				.on("click", ".declare-approve-btn", function() {
					var id = null;
					$("#declare-enterprise .box").each(function(i,e){
						if($(this).prop("checked")==true){
							id = $(this).parent().next().attr('id');
						}
					})
					if (id == null){
						$(this).parent().parent().prev().removeClass("am-hide");
						setTimeout(function() {
							$tar.find(".declare-approve-btn").parent().parent().prev().addClass("am-hide");
						}, "1000");
					} else {
						$.ajax({
							url: "declareApply/detail",
							type: "POST",
							data:{ declareApplyId: id },
							success: function(data) {
								var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
								$dialog.html($(".template.DeclareApproveDialog").doT({
									data: data.data
								}));
								self.getApproveValidate($dialog);
								
								$tar.find("#declare-enterprise-dialog").modal("close");
								
								$dialog.modal({
									closeViaDimmer:false,
									closeOnConfirm: false,
									onConfirm: function(e) {
										var $modal = this;
										if ($dialog.find('#declare-approve-input-form').valid()) {//如果表单验证成功，则进行提交。  
											$.ajax({
												url: "declareApply/approve",
												type: "POST",
												data:{
													declareApplyId: id,
													status: $dialog.find("#status").val(),
													opinion: $dialog.find("#opinion").val()
												},
												success: function(data) {
													if (data.status == 0) {
														$modal.close($dialog.remove());
														$tar.find("#declare-enterprise-dialog").modal({closeViaDimmer:false});
														self.getDeclareEnterpriseList($tar.find("#declare-enterprise-dialog").find("#declareId").val());
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
										$tar.find("#declare-enterprise-dialog").modal({closeViaDimmer:false});
									}
								});
							},
							error: function(err) {}
						});
					}
				})
				.on('change', '#upload-file-input', function() {
				      $.ajax({
							url: "uploadFile",
							type: "POST",
							data: new FormData($("#declare-input-form")[0]),
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
			    .on("click", ".declare-display-btn", function() {
					var id = $k.util.trChecked("declare");
					if(id==null){
						return;
					}
					var status = $tar.find("#"+id).closest("tr").find("td[declareStatus]").attr("declareStatus");
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: (status == "0" || status == "2") ? "确定将该项目上架吗？" : "确定将该项目下架吗？"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: status == "0" || status == "2" ? "declare/online" : "declare/downline",
								type: "POST",
								data: {
									declareId: id,
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
				.on("change", "#declare-table .box_all, #declare-enterprise-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#declare-enterprise-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					$this.closest("tbody").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					$tar.find("#declare-enterprise .declare-approve-btn").removeClass("am-disabled");
					var id = $this.closest("tr").find("td[id]").attr("id");
					var status = $tar.find("#declare-enterprise-table #"+id).closest("tr").find("td[declareStatus]").attr("declareStatus");
					if(status == "2" || status == "3") {
						$tar.find("#declare-enterprise .declare-approve-btn").addClass("am-disabled");
					}
				})
				.on("click", "#declare-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					$this.closest("tbody").find("tr").removeClass("am-active");
					$this.closest("tr").addClass("am-active");
					$tar.find("#declare .am-btn").removeClass("am-disabled");
					var id = $this.closest("tr").find("td[id]").attr("id");
					var status = $tar.find("#declare-table #"+id).closest("tr").find("td[declareStatus]").attr("declareStatus");
					var declareEndTime = $tar.find("#declare-table #"+id).closest("tr").find("td[declareEndTime]").attr("declareEndTime");
					if(status != "0") {
						$tar.find("#declare .declare-delete-btn").addClass("am-disabled");
					}
					if(status == "1") {
						$tar.find("#declare .declare-update-btn").addClass("am-disabled");
					}
					if(declareEndTime < new Date()) {
						$tar.find("#declare .declare-display-btn").addClass("am-disabled");
					}
				})
				.on("click", "#declare-table .table-tr, #declare-enterprise-table .table-tr", function(e) {
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
					url: "declare/listByUserId",
					type: "POST",
					data: {
						userId: $k.user.get().id
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
				return self;
			}
		},
		getDeclareEnterpriseList: {
			value: function(declareId) {
				var self = this;
				self.$tar.find("#declare-enterprise-table").find("tbody").html("");
				if (self.datatablesA) {
					self.datatablesA.fnDestroy();
				}
				$.ajax({
					url: "declare/detail",
					type: "POST",
					data: {
						declareId: declareId,
					},
					success: function(data) {
						if(data.data.endTime < new Date()) {
							self.$tar.find("#declare-enterprise").find(".declare-approve-btn").addClass("am-hide");
						}
						self.$tar.find("#declare-enterprise-table").find("tbody").html(
							$(".template.DeclareEnterpriseList").doT({
									data: data.data.length != 0 ? data.data.declareApplys : ""
								})
							);
						self.datatablesA = self.$tar.find("#declare-enterprise-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#declare-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  itemName: "required",
				    	  endTime:{compareDate: "#startTime"},
				    	  attachPath: "required"
				      },
				      messages: {
				    	  endTime:{
			                compareDate: "结束日期必须大于开始日期!"
			              } 
				      }
			    });
				return validatorr;
			}
		},
		getApproveValidate: {
			value: function($dialog) {
				var self = this;
				var validator = $dialog.find("#declare-approve-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  status: "required",
				    	  opionion: "required"
				      },
			    });
				return validator;
			}
		}
	});
})( jQuery );
</script>