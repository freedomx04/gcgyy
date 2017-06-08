<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template AppealCenterPoint" type="text/x-jquery-tmpl">
	<div class="admin-content">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">挂点企业诉求</strong></div>
    	</div>

		<div class="am-tabs" data-am-tabs>
			<ul class="am-tabs-nav am-nav am-nav-tabs">
				<li class="am-active" tab="tab1"><a href="#tab1">企业列表</a></li>
				<li tab="tab2"><a href="#tab2">诉求列表</a></li>
				<li tab="tab3"><a href="#tab3">诉求预警</a></li>
			</ul>

			<div class="am-tabs-bd">
				<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
					<div class="am-g">
   						<div class="am-u-sm-12">
        					<form id="enterpriseInfo">
								<div class="sk-three-bounce">
									<div class="sk-child sk-bounce1"></div>
									<div class="sk-child sk-bounce2"></div>
									<div class="sk-child sk-bounce3"></div>
								</div>
								<table class="am-table am-table-striped am-table-hover table-main" id="enterpriseInfo-table">
								</table>
							</form>
						</div>
					</div>
			    </div>
				<div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
					<div class="am-g">
			    		<div class="am-u-sm-12">
				        	<form id="appealCenter">
								<table class="am-table am-table-striped am-table-hover table-main" id="appealCenter-table">
									<thead>
	              						<tr>
											<th></th>
	        								<th>#</th>
											<th>公司名称</th>
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
	          						<tbody></tbody>
								</table>
				        	</form>
						</div>
					</div>
			    </div>
			    <div class="am-tab-panel am-fade" id="tab3" style="-webkit-user-select:all!important;">
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

<script class="template OverDaysTable" type="text/x-jquery-tmpl">
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
    </tr>
</thead>
<tbody>
	{{~ it.data: appeal:index}}
	<tr class="table-tr">
		<td>{{= index+1}}</td>
		<td>{{=appeal.appealType!=null ? appeal.appealType.name : ""}}</td>
		<td class="ellipsis td-title" title="{{=appeal.title}}">{{=appeal.title||""}}</td>
		<td class="appealCenterInfo-href" appealId="{{=appeal.id}}"><a>详情</a></td>
		<td status="{{=appeal.status}}" class="appeal-status">{{=$k.constant.getAppealStatus(appeal.status)}}</td>
		<td>{{=$k.util.getDateString(appeal.createTime)}}</td>
		<td>{{=$k.util.getDateString(appeal.dispatchTime)}}</td>
		<td>{{=$k.util.getDateString(appeal.acceptTime)}}</td>
	</tr>
	{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "AppealCenterPoint";
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
					if(tab == "tab1"){
						self.load();
					} else if(tab == "tab2") {
						self.getAppealList();
					} else {
						self.getOverDays();
					}
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
				.on("click",".appealCenterInfo-href",function(e){
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
											$dialog.html($(".template.AppealCenterDialog").doT({
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
				.on("click",".enterpriseInfo-href",function(e){
					e.stopPropagation();
					var id = $(this).closest("tr").find("td[id]").attr("id");
					$.ajax({
						url: "enterprise/detail",
						type: "POST",
						data:{
							enterpriseId: id
						},
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html($(".template.EnterpriseInfoGVDialog").doT({
								data: data.data
							}));
							$dialog.modal({
								closeViaDimmer: false,
								onCancel: function(e){
									this.close($dialog.remove());
								}
							});
						},
						error: function(err) {}
					})
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
				.on("click", "#appealCenter-table .box, #enterpriseInfo-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if($this.closest("table").hasClass("appealCenter-table")) {
						$this.closest("tr").addClass("am-active")
					} else {
						if ($this.prop("checked") == true) {
							$this.closest("tr").addClass("am-active");
						} else {
							$this.closest("tr").removeClass("am-active");
						}
					}
				})
				.on("click", "#appealCenter-table .table-tr, #enterpriseInfo-table .table-tr", function(e) {
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
				var $table = self.$tar.find("#enterpriseInfo-table");
				self.$tar.find("#tab1 .sk-three-bounce").show();
				$.ajax({
					url: "enterprise/listByPointUserId",
					type: "POST",
					data:{
						pointUserId: $k.user.get().id
					},
					success: function(data) {
						self.$tar.find("#tab1 .sk-three-bounce").hide();
						$table.html(
							$(".template.EnterpriseInfoTable").doT({
								data: data.data
							})
						);
						self.datatables = $table.dataTable();
					},
					error: function(err) {
						
					}
				});
				return self;
			}
		},
		getAppealList: {
			value: function() {
				var self = this;
				self.$tar.find("#appealCenter-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "appeal/listByPointUserId",
					type: "POST",
					data: {pointUserId: $k.user.get().id},
					success: function(data) {
						self.$tar.find("#appealCenter-table").find("tbody").html(
							$(".template.AppealCenterDispatcherList").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#appealCenter-table").dataTable();
						self.$tar.find("th").eq(0).removeClass("sorting_asc");
					},
					error: function(err) {}
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
				$k.util.getEnterpriseListByPointUserId({
					success: function(enterpriseData) {
						if(enterpriseData.data != null) {
							$.ajax({
								url: "appeal/overAppealDaysBypointUser",
								type: "POST",
								data: {pointUserId: $k.user.get().id},
								success: function(data) {
									self.$tar.find("#overAcceptDays-table").html(
										$(".template.OverDaysTable").doT({
											data: data.data.acceptDays
										})
									);
									self.$tar.find("#overHandleDays-table").html(
										$(".template.OverDaysTable").doT({
											data: data.data.handleDays
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
		}
	});
})( jQuery );
</script>