<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template AppealCenter" type="text/x-jquery-tmpl">
	<div class="admin-content">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">诉求中心</strong></div>
    	</div>

		<div class="am-tabs" data-am-tabs>
			<ul class="am-tabs-nav am-nav am-nav-tabs">
				<li class="am-active" tab="tab1"><a href="#tab1">诉求列表</a></li>
				<li tab="tab2"><a href="#tab2">诉求预警</a></li>
			</ul>

			<div class="am-tabs-bd">
			    <div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
					<div class="am-g">
			    		<div class="am-u-sm-12">
				        	<form id="appealCenter">
								<div class="am-btn-toolbar am-fl" style="height: 50px;">
			        				<div class="am-btn-group am-btn-group-sm">
			        					<button type="button" class="am-btn am-btn-default appealCenter-add-btn"><span class="am-icon-plus"></span> 新增</button>
			        					<button type="button" class="am-btn am-btn-default appealCenter-update-btn"><span class="am-icon-save"></span> 编辑</button>
			        					<button type="button" class="am-btn am-btn-default appealCenter-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
										<button type="button" class="am-btn am-btn-default appealCenter-dispatch-btn"><span class="am-icon-send-o"></span> 发送</button>
										<button type="button" class="am-btn am-btn-default appealCenter-urge-btn"><span class="am-icon-hourglass-half"></span> 催办</button>
										<button type="button" class="am-btn am-btn-default appealCenter-confirm-btn"><span class="am-icon-commenting-o"></span> 确认办结</button>
			        				</div>
				        		</div>
								<div class="sk-three-bounce">
									<div class="sk-child sk-bounce1"></div>
									<div class="sk-child sk-bounce2"></div>
									<div class="sk-child sk-bounce3"></div>
								</div>
								<table class="am-table am-table-striped am-table-hover table-main" id="appealCenter-table">
								</table>
				        	</form>
						</div>
					</div>
			    </div>
		
			    <div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
					<div class="am-text-center am-text-lg am-text-secondary">超过受理天数</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="overAcceptDays-table">
					</table>
					<div class="am-text-center am-text-lg am-text-secondary am-margin-top">超过处理天数</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="overHandleDays-table">
					</table>
			    </div>
		  	</div>
		</div>
	</div>
</script>

<script class="template AppealCenterDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">企业诉求
   			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
   		</div>
   		<div class="am-modal-bd">
    		<form class="am-form am-form-horizontal" id="appealCenter-input-form">
    			<input name="id" id="id" type="text" class="am-hide"/>
				<div class="am-form-group">
					<label for="name" class="am-u-sm-3 am-form-label font-normal">诉求标题:</label>
		    		<div class="am-u-sm-9 padding-left">
						<input type="text" name="title" id="title" class="am-form-field"/>
		    		</div>
				</div>
				<div class="am-form-group">
					<label for="appealTypeIdId" class="am-u-sm-3 am-form-label font-normal">诉求类别:</label>
		    		<div class="am-u-sm-9 padding-left">
						<select name="appealTypeId" id="appealTypeId" class="am-form-field">
							<option value="" selected>请选择</option>
							{{~ it.appealTypeData: appealType}}	
								<option value="{{=appealType.id}}">{{=appealType.name}}</option>
							{{~}}
						</select>
		    		</div>
				</div>
				<div class="am-form-group">
		    		<label for="description" class="am-u-sm-3 am-form-label font-normal">诉求详情:</label>
		    		<div class="am-u-sm-9 padding-left">
						<textarea rows="5" name="description" id="description"></textarea>
		    		</div>
				</div>

				<div class="am-form-group am-hide">
					<label for="name" class="am-u-sm-3 am-form-label font-normal">处理部门:</label>
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
		    		<label for="description" class="am-u-sm-3 am-form-label font-normal">驳回意见:</label>
		    		<div class="am-u-sm-9 padding-left">
						<textarea rows="5" name="rejectOpinion" id="rejectOpinion"></textarea>
		    		</div>
				</div>
				
				<div class="am-form-group am-hide">
		    		<label for="" class="am-u-sm-3 am-form-label font-normal">受理速度:</label>
		    		<div class="am-u-sm-9 padding-left am-text-left" id="acceptSpeed" style="padding-top: 0.8rem;">
						<i class="am-icon-star-o star-1 am-text-primary" star="1"></i>
						<i class="am-icon-star-o star-2 am-text-primary" star="2"></i>
						<i class="am-icon-star-o star-3 am-text-primary" star="3"></i>
						<i class="am-icon-star-o star-4 am-text-primary" star="4"></i>
						<i class="am-icon-star-o star-5 am-text-primary" star="5"></i>
		    		</div>
				</div>

				<div class="am-form-group am-hide">
		    		<label for="" class="am-u-sm-3 am-form-label font-normal">办结速度:</label>
		    		<div class="am-u-sm-9 padding-left am-text-left" id="processSpeed" style="padding-top: 0.8rem;">
						<i class="am-icon-star-o star-1 am-text-primary" star="1"></i>
						<i class="am-icon-star-o star-2 am-text-primary" star="2"></i>
						<i class="am-icon-star-o star-3 am-text-primary" star="3"></i>
						<i class="am-icon-star-o star-4 am-text-primary" star="4"></i>
						<i class="am-icon-star-o star-5 am-text-primary" star="5"></i>
		    		</div>
				</div>

				<div class="am-form-group am-hide">
		    		<label for="" class="am-u-sm-3 am-form-label font-normal">办结结果:</label>
		    		<div class="am-u-sm-9 padding-left am-text-left" id="result" style="padding-top: 0.8rem;">
						<i class="am-icon-star-o star-1 am-text-primary" star="1"></i>
						<i class="am-icon-star-o star-2 am-text-primary" star="2"></i>
						<i class="am-icon-star-o star-3 am-text-primary" star="3"></i>
						<i class="am-icon-star-o star-4 am-text-primary" star="4"></i>
						<i class="am-icon-star-o star-5 am-text-primary" star="5"></i>
		    		</div>
				</div>

				<div class="am-form-group am-hide">
		    		<label for="" class="am-u-sm-3 am-form-label font-normal">评价详情:</label>
		    		<div class="am-u-sm-9 padding-left">
						<textarea rows="5" name="evaluation" id="evaluation"></textarea>
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

<script class="template AppealUrgeDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">催办
   			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
   		</div>
   		<div class="am-modal-bd">
    		<form class="am-form am-form-horizontal" id="appeal-urge-input-form">
				<div class="am-form-group">
		    		<label for="content" class="am-u-sm-3 am-form-label font-normal">催办意见:</label>
		    		<div class="am-u-sm-9 padding-left">
						<textarea rows="5" name="content" id="content"></textarea>
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

<script class="template AppealConfirmDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">确认办结
   			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
   		</div>
   		<div class="am-modal-bd">
    		<form class="am-form am-form-horizontal am-text-left" id="appeal-confirm-input-form">
    			<input name="id" id="id" type="text" class="am-hide"/>
				<div class="am-form-group">
					<label for="name" class="am-u-sm-3 am-form-label font-normal">处理部门:</label>
		    		<div class="am-u-sm-9 padding-left">
						<select name="departmentId" id="departmentId" class="am-form-field">
							<option value="" selected>请选择</option>
							{{~ it.departmentData: department}}	
								<option value="{{=department.id}}">{{=department.name}}</option>
							{{~}}
						</select>
		    		</div>
				</div>
				
				<div class="am-form-group">
		    		<label for="acceptSpeed" class="am-u-sm-3 am-form-label font-normal">受理速度:</label>
		    		<div class="am-u-sm-9 padding-left" id="acceptSpeed" style="padding-top: 0.8rem;">
						<i class="am-icon-star-o star-1 clickable am-text-primary" star="1"></i>
						<i class="am-icon-star-o star-2 clickable am-text-primary" star="2"></i>
						<i class="am-icon-star-o star-3 clickable am-text-primary" star="3"></i>
						<i class="am-icon-star-o star-4 clickable am-text-primary" star="4"></i>
						<i class="am-icon-star-o star-5 clickable am-text-primary" star="5"></i>
		    		</div>
				</div>

				<div class="am-form-group">
		    		<label for="processSpeed" class="am-u-sm-3 am-form-label font-normal">办结速度:</label>
		    		<div class="am-u-sm-9 padding-left" id="processSpeed" style="padding-top: 0.8rem;">
						<i class="am-icon-star-o star-1 clickable am-text-primary" star="1"></i>
						<i class="am-icon-star-o star-2 clickable am-text-primary" star="2"></i>
						<i class="am-icon-star-o star-3 clickable am-text-primary" star="3"></i>
						<i class="am-icon-star-o star-4 clickable am-text-primary" star="4"></i>
						<i class="am-icon-star-o star-5 clickable am-text-primary" star="5"></i>
		    		</div>
				</div>

				<div class="am-form-group">
		    		<label for="result" class="am-u-sm-3 am-form-label font-normal">办结结果:</label>
		    		<div class="am-u-sm-9 padding-left" id="result" style="padding-top: 0.8rem;">
						<i class="am-icon-star-o star-1 clickable am-text-primary" star="1"></i>
						<i class="am-icon-star-o star-2 clickable am-text-primary" star="2"></i>
						<i class="am-icon-star-o star-3 clickable am-text-primary" star="3"></i>
						<i class="am-icon-star-o star-4 clickable am-text-primary" star="4"></i>
						<i class="am-icon-star-o star-5 clickable am-text-primary" star="5"></i>
		    		</div>
				</div>

				<div class="am-form-group">
		    		<label for="evaluation" class="am-u-sm-3 am-form-label font-normal">评价:</label>
		    		<div class="am-u-sm-9 padding-left">
						<textarea rows="5" name="evaluation" id="evaluation"></textarea>
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

<script class="template AppealCenterTable" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th></th>
        <th>#</th>
		<th>诉求标题</th>
		<th>诉求类型</th>
		<th>查看详细</th>
		<th>状态</th>
		<th>发起时间</th>
		<th>派单时间</th>
		<th>受理时间</th>
		<th>催办详细</th>
    </tr>
</thead>
<tbody>
	{{~ it.data: appeal: num }}
	<tr class="table-tr">
		<td><input type='radio' class='box' name='box' value="{{=appeal.status}}"/></td>
		<td id="{{=appeal.id}}">{{=num+1}}</td>
		<td class="ellipsis td-title" title="{{= appeal.title}}">{{=appeal.title}}</td>
		<td class="ellipsis td-name" title="{{=appeal.appealType!=null?appeal.appealType.name||"":""}}">{{=appeal.appealType!=null?appeal.appealType.name||"":""}}</td>
		<td class="appealCenterInfo-href" appealId="{{=appeal.id}}"><a>诉求详情</a></td>
		<td>{{=$k.constant.getAppealStatus(appeal.status)}}</td>
		<td>{{=$k.util.getDateString(appeal.createTime)}}</td>
		<td>{{=$k.util.getDateString(appeal.dispatchTime)}}</td>
		<td>{{=$k.util.getDateString(appeal.acceptTime)}}</td>
		<td class="urgeInfo-href" appealId="{{=appeal.id}}"><a>催办详情</a></td>
	</tr>
	{{~}}
</tbody>
</script>

<script class="template UrgeListDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog" style="width:600px;">
	  <div class="am-modal-hd am-text-left" style="background-color:#eee;border-bottom:1px solid #ccc;">
	    	催办列表
	    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
	  </div>
	  <div class="am-modal-bd">
		<div class="am-g">
		<div class="am-u-sm-12">
			<form style="overflow:auto;max-height:500px;margin-top:20px;">
	  			<table align="center" id="urge-table" class="am-table am-table-striped am-table-hover table-main am-table-centered" style="width:100%;" >
	  		 		<thead>
						<tr>
				  			<th>#</th>
							<th>催办人</th>
							<th>催办意见</th>
							<th>催办时间</th>
						</tr>
					</thead>
					<tbody>
						{{? it.data.length==0}}
							<tr><td colspan='4'>暂无数据！</td></tr>
						{{?}}
						{{~ it.data: urge:index}}
							<tr class="table-tr">
								<td appealId="{{=urge.id}}">{{= index +1}}</td>
								<td class="td-name ellipsis" title="{{=urge.user!=null?urge.user.name||"":""}}">{{=urge.user!=null?urge.user.name||"":""}}</td>
								<td class="td-content ellipsis" title="{{=urge.content}}">{{=urge.content||""}}</td>
								<td>{{=$k.util.getDateString(urge.createTime)}}</td>
							</tr>
						{{~}}
					</tbody>
				</table>
			</form>
		</div>
		</div>
			<button type="button" class="am-btn am-btn-primary" data-am-modal-cancel>确定</button>
	  </div>
	</div>
</script>

<script class="template OverAcceptDaysTable" type="text/x-jquery-tmpl">
<thead>
	<tr>
        <th>#</th>
		<th>诉求类型</th>
		<th>诉求标题</th>
		<th>查看详细</th>
		<th>状态</th>
		<th>发起时间</th>
		<th>派单时间</th>
		<th>受理时间</th>
		<th>催办详细</th>
    </tr>
</thead>
<tbody>
	{{var i = 0;}}
	{{~ it.data: data}}
		{{~ data.acceptDays: appeal}}
			{{i = i + 1;}}
		<tr class="table-tr">
			<td>{{= i}}</td>
			<td>{{=data.appealTypeName}}</td>
			<td class="ellipsis td-title" title="{{=appeal.title}}">{{=appeal.title||""}}</td>
			<td class="appealCenterInfo-href" appealId="{{=appeal.id}}"><a>诉求详情</a></td>
			<td status="{{=appeal.status}}" class="appeal-status">{{=$k.constant.getAppealStatus(appeal.status)}}</td>
			<td>{{=$k.util.getDateString(appeal.createTime)}}</td>
			<td>{{=$k.util.getDateString(appeal.dispatchTime)}}</td>
			<td>{{=$k.util.getDateString(appeal.acceptTime)}}</td>
			<td class="urgeInfo-href" appealId="{{=appeal.id}}"><a>催办详情</a></td>
		</tr>
		{{~}}
	{{~}}
</tbody>
</script>

<script class="template OverHandleDaysTable" type="text/x-jquery-tmpl">
<thead>
	<tr>
        <th>#</th>
		<th>诉求类型</th>
		<th>诉求标题</th>
		<th>查看详细</th>
		<th>状态</th>
		<th>发起时间</th>
		<th>派单时间</th>
		<th>受理时间</th>
		<th>催办详细</th>
    </tr>
</thead>
<tbody>
	{{var i = 0;}}
	{{~ it.data: data}}
		{{~ data.handleDays: appeal}}
			{{i = i + 1;}}
		<tr class="table-tr">
			<td>{{= i}}</td>
			<td>{{=data.appealTypeName}}</td>
			<td class="ellipsis td-title" title="{{=appeal.title}}">{{=appeal.title||""}}</td>
			<td class="appealCenterInfo-href" appealId="{{=appeal.id}}"><a>诉求详情</a></td>
			<td status="{{=appeal.status}}" class="appeal-status">{{=$k.constant.getAppealStatus(appeal.status)}}</td>
			<td>{{=$k.util.getDateString(appeal.createTime)}}</td>
			<td>{{=$k.util.getDateString(appeal.dispatchTime)}}</td>
			<td>{{=$k.util.getDateString(appeal.acceptTime)}}</td>	
			<td class="urgeInfo-href" appealId="{{=appeal.id}}"><a>催办详情</a></td>
		</tr>
		{{~}}
	{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "AppealCenter";
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
					} else {
						self.getOverDays();
					}
				})
				.on("click mouseover mouseout", "#appeal-confirm-input-form .am-icon-star-o, #appeal-confirm-input-form .am-icon-star", function() {
					var starNum = $(this).attr("star");
					for(var i=1;i<=5;i++) {
						if(starNum == 1 && event.type != "mouseover") {
							$(this).parent().find(".star-"+i).removeClass("am-icon-star").addClass("am-icon-star-o");
						} else if(i<=starNum && $(this).hasClass("am-icon-star-o") && event.type != "mouseout"){
							$(this).parent().find(".star-"+i).removeClass("am-icon-star-o").addClass("am-icon-star");
						} else if(i>starNum){
							$(this).parent().find(".star-"+i).removeClass("am-icon-star").addClass("am-icon-star-o");
						}
					}
				})
				.on("click", ".appealCenter-add-btn", function() {
					$k.util.getEnterprise({
						success: function(enterpriseData) {
							if(enterpriseData.data != null) {
								$k.util.getAppealTypeList({
									success: function(appealTypeData) {
										var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
										$dialog.html(self.$tempDialogTar.doT({
											appealTypeData: appealTypeData.data
										}));
										self.getValidate($dialog);
										
										$dialog.modal({
											closeViaDimmer: false,
											closeOnConfirm: false,
											onConfirm: function(e) {
												var $modal = this;
												if ($dialog.find('#appealCenter-input-form').valid()) {//如果表单验证成功，则进行提交。
													var $appealCenterForm = $dialog.find("#appealCenter-input-form");
													$.ajax({
														url: "appeal/add",
														type: "POST",
														data: {
															enterpriseId: enterpriseData.data.id,
															title:	$appealCenterForm.find("#title").val(),
															appealTypeId: $appealCenterForm.find("#appealTypeId").val(),
															description: $appealCenterForm.find("#description").val()
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
						}
					});
				})
				.on("click", ".appealCenter-update-btn", function() {
					var id = $k.util.trChecked("appealCenter");
					if (id == null){
						return;
					}
					
					$.ajax({
						url: "appeal/detail",
						type: "POST",
						data:{ appealId: id },
						success: function(data) {
							$k.util.getAppealTypeList({
								success: function(appealTypeData) {
									var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
									$dialog.html(self.$tempDialogTar.doT({
										appealTypeData: appealTypeData.data
									}));
									self.getValidate($dialog);
									$.each(data.data, function(ky, vl){
										$("[name='"+ky+"']").val(vl);
										if(ky == "appealType" && vl!=null) {
											$dialog.find("[name='appealTypeId']").val(vl.id);
										}
									});
									
									$dialog.modal({
										closeViaDimmer: false,
										closeOnConfirm: false,
										onConfirm: function(e) {
											var $modal = this;
											if ($dialog.find('#appealCenter-input-form').valid()) {
												var $appealCenterForm = $dialog.find("#appealCenter-input-form");
												$.ajax({
													url: "appeal/edit",
													type: "POST",
													data: {
														appealId: $appealCenterForm.find("#id").val(),
														title:	$appealCenterForm.find("#title").val(),
														appealTypeId: $appealCenterForm.find("#appealTypeId").val(),
														description: $appealCenterForm.find("#description").val()
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".appealCenter-delete-btn", function() {
					var ids = $k.util.trOperateChecked("appealCenter");
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
								url: "appeal/delete",
								type: "POST",
								data: { appealIds: ids.toString() },
								success: function(data) {
									self.load();
									$modal.close($dialog.remove());
								},
								error: function(err) {}
							});
						},
						onCancel: function() {
							this.close($dialog.remove());
						}
					});
				})
				.on("click", ".appealCenter-dispatch-btn", function() {
					var id = $k.util.trChecked("appealCenter");
					if (id == null){
						return;
					}
					
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: "确定发送给派单员吗?"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: "appeal/send",
								type: "POST",
								data: { appealId: id },
								success: function(data) {
									self.load();
									$modal.close($dialog.remove());
								},
								error: function(err) {}
							});
						},
						onCancel: function() {
							this.close($dialog.remove());
						}
					});
				})
				.on("click", ".appealCenter-urge-btn", function() {
					var id = $k.util.trChecked("appealCenter");
					if (id == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html($(".template.AppealUrgeDialog").doT());
					
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
								$.ajax({
									url: "appeal/urge",
									type: "POST",
									data:{
										userId: $k.user.get().id,
										appealId: id,
										content: $dialog.find("#content").val()
									},
									success: function(data) {
										if (data.status == 0) {
											$modal.close($dialog.remove());
											$k.util.alertModal("催办成功");
										}
									},
									error: function(err) {
									}
								});
						},
						onCancel: function() {
							this.close($dialog.remove());
						}
					});
				})
				.on("click", ".appealCenter-confirm-btn", function() {
					var id = $k.util.trChecked("appealCenter");
					if (id == null){
						return;
					}
					
					$.ajax({
						url: "appeal/detail",
						type: "POST",
						data:{ appealId: id },
						success: function(data) {
							$k.util.getDepartmentList({
								success: function(departmentData ) {
									var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
									$dialog.html($(".template.AppealConfirmDialog").doT({
										departmentData: departmentData.data
									}));
									self.getConfirmValidate($dialog);
									$.each(data.data, function(ky, vl){
										$("[name='"+ky+"']").val(vl);
										if(ky == "department" && vl!=null) {
											$dialog.find("[name='departmentId']").val(vl.id).attr("disabled", "true");
										}
									});
									
									$dialog.modal({
										closeViaDimmer: false,
										closeOnConfirm: false,
										onConfirm: function(e) {
											var $modal = this;
											var $appealConfirmForm = $dialog.find("#appeal-confirm-input-form");
											if ($appealConfirmForm.valid()) {
												$.ajax({
													url: "appeal/confirm",
													type: "POST",
													data: {
														appealId: id,
														acceptSpeed: $appealConfirmForm.find("#acceptSpeed").find(".am-icon-star").length,	
														processSpeed: $appealConfirmForm.find("#processSpeed").find(".am-icon-star").length,	
														result:	$appealConfirmForm.find("#result").find(".am-icon-star").length,
														evaluation: $appealConfirmForm.find("#evaluation").val(),
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
						},
						error: function(err) {}
					});
				})
				.on("click", ".appealCenterInfo-href", function(e){
					e.stopPropagation();
					var id = $(this).attr("appealId");
					$.ajax({
						url: "appeal/detail",
						type: "POST",
						data:{
							appealId: id
						},
						success: function(data) {
							$k.util.getDepartmentList({
								success: function(departmentData) {
									$k.util.getAppealTypeList({
										success: function(appealTypeData) {
											var $dialog = $('<div class="am-modal am-modal-prompt" id="appealCenter-input"></div>').appendTo(self.$tar);
											$dialog.html(self.$tempDialogTar.doT({
												appealTypeData: appealTypeData.data,
												departmentData: departmentData.data,
											}));
											$.each(data.data,function(ky,vl){
												$dialog.find("[name='"+ky+"']").val(vl);
												if(ky == "appealType" && vl!=null) {
													$dialog.find("[name='appealTypeId']").val(vl.id);
												}
												if(ky == "department" && vl!=null) {
													$dialog.find("[name='departmentId']").val(vl.id).parent().parent().removeClass("am-hide");
												}
												if(ky == "status" && vl == 6) {
													$dialog.find("#rejectOpinion").parent().parent().removeClass("am-hide");
												} 
												if(ky == "evaluate" && vl != null && vl!="") {
													$dialog.find("#evaluation").parent().parent().removeClass("am-hide");
													$dialog.find("#evaluation").text(vl.evaluation);
													$dialog.find("#acceptSpeed").parent().removeClass("am-hide");
													$dialog.find("#processSpeed").parent().removeClass("am-hide");
													$dialog.find("#result").parent().removeClass("am-hide");
													for(var i=1;i<=vl.acceptSpeed;i++) { 
														$dialog.find("#acceptSpeed").parent().find(".star-"+i).removeClass("am-icon-star-o").addClass("am-icon-star");
													}
													for(var i=1;i<=vl.processSpeed;i++) { 
														$dialog.find("#processSpeed").parent().find(".star-"+i).removeClass("am-icon-star-o").addClass("am-icon-star");
													}
													for(var i=1;i<=vl.result;i++) { 
														$dialog.find("#result").parent().find(".star-"+i).removeClass("am-icon-star-o").addClass("am-icon-star");
													}
												}
											});
											$dialog.modal({
												closeViaDimmer: false,
												onCancel: function(e){
													this.close($dialog.remove());
												}
											});
											$k.util.inputDisabled("appealCenter");
										}
									});
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".urgeInfo-href", function(e){
					e.stopPropagation();
					var id = $(this).attr("appealId");
       				$.ajax({
       					url: "appeal/listUrge",
       					type: "POST",
       					data: { appealId: id },
       					success: function(data) {
       						var $dialog = $('<div class="am-modal am-modal-no-btn"> </div>').appendTo(self.$tar);

       						$dialog.html($(".template.UrgeListDialog").doT({
       							data: data.data
       						}));
       						$dialog.modal({
       							closeViaDimmer:false,
       							onCancel: function(e) {
       								this.close($dialog.remove());
       					        }
       						});
       					}
       				});
				})
				.on("click", "#appealCenter-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					var status = $this.val();
					$tar.find("#appealCenter-table").find("tr").removeClass("am-active");
					$tar.find("#appealCenter").find(".am-btn").removeClass("am-disabled");
					$this.closest("tr").addClass("am-active");
					if(status == 0) {
						$tar.find(".appealCenter-urge-btn").addClass("am-disabled");
						$tar.find(".appealCenter-confirm-btn").addClass("am-disabled");
					} else if(status == 1 || status == 2 || status == 3) {
						$tar.find(".appealCenter-dispatch-btn").addClass("am-disabled");
						$tar.find(".appealCenter-delete-btn").addClass("am-disabled");
						$tar.find(".appealCenter-update-btn").addClass("am-disabled");
						$tar.find(".appealCenter-confirm-btn").addClass("am-disabled");
					} else if(status == 4) {
						$tar.find(".appealCenter-dispatch-btn").addClass("am-disabled");
						$tar.find(".appealCenter-delete-btn").addClass("am-disabled");
						$tar.find(".appealCenter-update-btn").addClass("am-disabled");
						$tar.find(".appealCenter-urge-btn").addClass("am-disabled");
					} else if(status == 5 || status == 6) {
						$tar.find("#appealCenter").find(".am-btn").addClass("am-disabled");
						$tar.find(".appealCenter-add-btn").removeClass("am-disabled");
					}
				})
				.on("click", "#appealCenter-table .table-tr", function(e) {
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
				self.$tar.find("#appealCenter").find(".am-btn").removeClass("am-disabled");
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if(enterpriseData.data != null) {
							$.ajax({
								url: "appeal/listByEnterpriseId",
								type: "POST",
								data: {enterpriseId: enterpriseData.data.id},
								success: function(data) {
									self.$tar.find(".sk-three-bounce").hide();
									self.$tar.find("#appealCenter-table").html(
										$(".template.AppealCenterTable").doT({
												data: data.data
											})
										);
									self.datatables = self.$tar.find("#appealCenter-table").dataTable();
									self.$tar.find("th").eq(0).removeClass("sorting_asc");
								},
								error: function(err) {}
							});
						} else {
							self.$tar.find("#appealCenter-table").html(
								$(".template.AppealCenterTable").doT({
										data: null
									})
								);
							self.$tar.find(".sk-three-bounce").hide();
							self.datatables = self.$tar.find("#appealCenter-table").dataTable();
							self.$tar.find("th").eq(0).removeClass("sorting_asc");
						}
					},
					error: function(err) {
						
					}
				});
				return self;
			}
		},
		getOverDays: {
			value: function() {
				var self = this;
				self.$tar.find("#overAcceptDays-table, #overHandleDays-table").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$k.util.getEnterprise({
					success: function(enterpriseData) {
						if(enterpriseData.data != null) {
							$.ajax({
								url: "appeal/overAppealDaysPC",
								type: "POST",
								data: {enterpriseId: enterpriseData.data.id},
								success: function(data) {
									self.$tar.find("#overAcceptDays-table").html(
										$(".template.OverAcceptDaysTable").doT({
											data: data.data
										})
									);
									self.$tar.find("#overHandleDays-table").html(
										$(".template.OverHandleDaysTable").doT({
											data: data.data
										})
									);
									self.datatables = self.$tar.find("#overAcceptDays-table, #overHandleDays-table").dataTable();
								},
								error: function(err) {}
							});
						}
					}
				});
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#appealCenter-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  title: "required",
				    	  appealTypeId: "required",
				    	  description: "required"
				      }
			    });
				return validatorr;
			}
		},
		getConfirmValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#appeal-confirm-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  acceptSpeed: "required",
			    		  processSpeed:	"required",
			    		  result: "required",
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>