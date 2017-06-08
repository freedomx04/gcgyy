<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template AppealCenterDispatcher" type="text/x-jquery-tmpl">
	<div class="admin-content" style="height:initial!important;">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">诉求中心</strong></div>
    </div>

	<div class="am-tabs" data-am-tabs>
	  <ul class="am-tabs-nav am-nav am-nav-tabs">
	    <li class="am-active" tab="tab1"><a href="#tab1">诉求列表</a></li>
	    <li tab="tab2"><a href="#tab2">诉求分类</a></li>
		<li tab="tab3"><a href="#tab3">诉求预警</a></li>
	  </ul>

	  <div class="am-tabs-bd">
	    <div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
	    	<div class="am-g">
		      <div class="am-u-sm-12">
		        <form id="appealCenterDispatcher">
					<div class="am-btn-toolbar am-fl">
       					<div class="am-btn-group am-btn-group-xs">
       						{{? it.resource.indexOf('assist_appeal_dispatcher') > -1}}
							<button type="button" class="am-btn am-btn-default appeal-dispatch-btn"><span class="am-icon-send-o"></span> 派单</button>
         					<button type="button" class="am-btn am-btn-default appeal-reject-btn"><span class="am-icon-save"></span> 驳回</button>
         					{{?}}
         					{{? it.resource.indexOf('assist_appeal_monitor') > -1}}
							<button type="button" class="am-btn am-btn-default appeal-urge-btn"><span class="am-icon-hourglass-o"></span> 催办</button>
							{{?}}
       					</div>
       				</div>
	          		<table class="am-table am-table-striped am-table-hover table-main" id="appealCenterDispatcher-table">
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

	    <div class="am-tab-panel am-fade" id="tab2" style="-webkit-user-select:all!important;">
	    	<div class="am-g">
			  <div class="am-u-sm-12 am-margin-top">
			 	  <div id="typeHighchartContainer" class="am-u-sm-6 am-text-center"></div>
			  	  <div id="statusHighchartContainer" class="am-u-sm-6 am-text-center"></div>
			  </div>
    		</div>
	    </div>

		<div class="am-tab-panel am-fade" id="tab3" style="-webkit-user-select:all!important;">
	    	<div class="am-g">
			  <div id="warningHighchartContainer" class="am-text-center"></div>
    		</div>
	    </div>
	  </div>
	</div>
  </div>
</script>

<script class="template AppealCenterDispatcherList" type="text/x-jquery-tmpl">
	{{ var i = 0;}}
	{{~ it.data: appeal: index }}
		{{? appeal.status!=0}}
		{{ i = i + 1;}}
		<tr class="table-tr">
			<td><input type='radio' class='box' name='box' value="{{=appeal.status}}"/></td>
			<td id="{{=appeal.id}}">{{=i}}</td>
			<td class="ellipsis td-name" title="{{=appeal.enterprise!=null?appeal.enterprise.name||"":""}}">{{=appeal.enterprise!=null?appeal.enterprise.name||"":""}}</td>
			<td class="ellipsis td-title" title="{{=appeal.title}}">{{=appeal.title||""}}</td>
			<td>{{=appeal.appealType!=null?appeal.appealType.name||"":""}}</td>
			<td class="appealCenterInfo-href" appealId="{{=appeal.id}}"><a>诉求详情</a></td>
			<td status="{{=appeal.status}}" class="appeal-status">{{=$k.constant.getAppealStatus(appeal.status)}}</td>
			<td>{{=$k.util.getDateString(appeal.createTime)}}</td>
			<td>{{=$k.util.getDateString(appeal.dispatchTime)}}</td>
			<td>{{=$k.util.getDateString(appeal.acceptTime)}}</td>
			<td class="urgeInfo-href" appealId="{{=appeal.id}}"><a>催办详情</a></td>
		</tr>
		{{?}}
	{{~}}
</script>

<script class="template AppealRejectDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">驳回
   			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
   		</div>
   		<div class="am-modal-bd">
    		<form class="am-form am-form-horizontal" id="appeal-reject-input-form">
				<div class="am-form-group">
		    		<label for="rejectOpinion" class="am-u-sm-3 am-form-label font-normal">驳回意见:</label>
		    		<div class="am-u-sm-9 padding-left">
						<textarea rows="5" name="rejectOpinion" id="rejectOpinion"></textarea>
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
<script class="template AppealDispatchDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">派单
   			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
   		</div>
   		<div class="am-modal-bd">
    		<form class="am-form am-form-horizontal" id="appeal-dispatch-input-form">
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
		    		<label for="dispatchOpinion" class="am-u-sm-3 am-form-label font-normal">意见:</label>
					<div class="am-u-sm-9 padding-left">
						<textarea rows="5" name="dispatchOpinion" id="dispatchOpinion"></textarea>
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
	var fnName = "AppealCenterDispatcher";
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
						self.getAppealList();
					} else if(tab == "tab2"){
						self.getAppealTypeChart();
						self.getAppealStatusChart();
					} else{
						self.getAppealWarningChart();
					}
				})
				
				.on("click", ".appealCenterInfo-href, .appealInfo-href",function(e) {
					e.stopPropagation();
					$this = $(this);
					var id = $this.attr("appealId");
					$.ajax({
						url: "appeal/detail",
						type: "POST",
						data:{ appealId: id },
						success: function(data) {
							$k.util.getDepartmentList({
								success: function(departmentData) {
									$k.util.getAppealTypeList({
										success: function(appealTypeData) {
											var $dialog = $('<div class="am-modal am-modal-prompt" id="appealCenter-input"></div>').appendTo(self.$tar);
											$dialog.html($(".template.AppealCenterDialog").doT({
												appealTypeData: appealTypeData.data,
												departmentData: departmentData.data
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
											$tar.find("#appeal-modal").modal("close");
											$dialog.modal({
												closeViaDimmer: false,
												onCancel: function(e){
													this.close($dialog.remove());
													if($this.hasClass("appealInfo-href")) {
														$tar.find("#appeal-modal").modal({closeViaDimmer: false});
													}
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
				.on("click", ".appeal-dispatch-btn", function() {
					var id = $k.util.trChecked("appealCenterDispatcher");
					if (id == null){
						return;
					}
					$k.util.getDepartmentList({
						success: function(departmentData ) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html($(".template.AppealDispatchDialog").doT({
								departmentData: departmentData.data
							}));
							self.getDispatchValidate($dialog);
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $appealSendForm = $dialog.find("#appeal-dispatch-input-form");
									if($appealSendForm.valid()) {
										$.ajax({
											url: "appeal/dispatch",
											type: "POST",
											data: {
												appealId: id,
												departmentId: $appealSendForm.find("#departmentId").val(),	
												dispatchOpinion: $appealSendForm.find("#dispatchOpinion").val(),	
											},
											success: function(data) {
												self.getAppealList();
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
				})
				.on("click", ".appeal-reject-btn", function() {
					var id = $k.util.trChecked("appealCenterDispatcher");
					if (id == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html($(".template.AppealRejectDialog").doT());
					self.getRejectValidate($dialog);
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#appeal-reject-input-form').valid()) {//如果表单验证成功，则进行提交。  
								$.ajax({
									url: "appeal/reject",
									type: "POST",
									data:{
										appealId: id,
										rejectOpinion: $dialog.find("#rejectOpinion").val()
									},
									success: function(data) {
										if (data.status == 0) {
											self.getAppealList();
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
				.on("click", ".appeal-urge-btn", function() {
					var id = $k.util.trChecked("appealCenterDispatcher");
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
				.on("click", "#appealCenterDispatcher-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					var status = $this.val();
					$tar.find("#appealCenterDispatcher-table").find("tr").removeClass("am-active");
					$tar.find("#appealCenterDispatcher").find(".am-btn").removeClass("am-disabled");
					$this.closest("tr").addClass("am-active");
					if(status == 1) {
						$tar.find("#appealCenterDispatcher").find(".am-btn").addClass("am-disabled");
						$tar.find(".appeal-dispatch-btn").removeClass("am-disabled");
						$tar.find(".appeal-reject-btn").removeClass("am-disabled");
						$tar.find(".appeal-urge-btn").removeClass("am-disabled");
					} else if(status == 2) {
						$tar.find(".appeal-dispatch-btn").addClass("am-disabled");
						$tar.find(".appeal-reject-btn").addClass("am-disabled");
					} else if(status == 3) {
						$tar.find(".appeal-dispatch-btn").addClass("am-disabled");
						$tar.find(".appeal-reject-btn").addClass("am-disabled");
					} else if(status == 4 || status == 5 || status == 6) {
						$tar.find("#appealCenterDispatcher").find(".am-btn").addClass("am-disabled");
					}
				})
				.on("click", "#appealCenterDispatcher-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				});
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				$.ajax({
					url: "enterprise/list",
					type: "POST",
					success: function(enterpriseData) {
						self.$tar.html(self.$tempTar.doT({
							enterpriseData: enterpriseData.data,
							resource: $k.user.get().role.resource,
						}));
						self.getAppealList();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		load: {
			value: function() {
				var self = this;
				return self;
			}
		},
		getAppealList: {
			value: function() {
				var self = this;
				self.$tar.find("#appealCenterDispatcher-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				self.$tar.find("#appealCenterDispatcher").find(".am-btn").removeClass("am-disabled");
				$.ajax({
					url: "appeal/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#appealCenterDispatcher-table").find("tbody").html(
							$(".template.AppealCenterDispatcherList").doT({
								data: data.data
							})
						);
						self.datatables = self.$tar.find("#appealCenterDispatcher-table").dataTable();
						self.$tar.find("th").eq(0).removeClass("sorting_asc");
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getAppealTypeChart: {
			value: function() {
				var self = this;
				var $chartContainer = self.$tar.find('#typeHighchartContainer');
				$k.util.getDepartment({
					success: function(departmentData) {
						$.ajax({
							url: "appeal/getAppealCountByType",
							type: "POST",
							success: function(data) {
								/* if(data.status != 0 || data.data == null || data.data.length == 0) {
									$chartContainer.html("暂无数据！");
									return;
								} */
								var seriesData = [];
								$.each(data.data, function(key, val) {
									seriesData.push({name: val.appealTypeName, y: val.count, value: val.appealTypeId});
					            });
								var chart = $chartContainer.highcharts({
									 chart: { plotBackgroundColor: null, plotBorderWidth: null, plotShadow: false }, 
									 title: { text: '诉求分类分布图' }, 
									 credits: {
							             text: '',
							             href: '#'
							         },
									 tooltip: { 
										 formatter: function() {
								            return '<b>'+ this.point.name +'</b>: '+ Highcharts.numberFormat(this.percentage, 1) +'% ('+
					                         Highcharts.numberFormat(this.y, 0, ',') +' 条)';
					         
										 } 		
							         }, 
									 plotOptions: { 
										 pie: { 
											 allowPointSelect: true, 
											 cursor: 'pointer', 
											 dataLabels: { enabled: false }, 
											 showInLegend: true,
										},
										series: {
				                            events: {
				                               legendItemClick: function (event){                                    
				                                  return false;
				                               },
				                               click: function(e) {  
				                            	    var $dialog = $('<div class="am-modal am-modal-no-btn" id="appeal-modal"> </div>').appendTo(self.$tar);
				                            	    self.$tar.find("#appeal-table").find("tbody").html("");
					                   				if (self.datatables) {
					                   					self.datatables.fnDestroy();
					                   				}
					                   				$.ajax({
					                   					url: "appeal/listByAppealTypeId",
					                   					type: "POST",
					                   					data: { 
					                   						appealTypeId: e.point.value,
					                   					},
					                   					success: function(data) {
						               						$dialog.html($(".template.AppealListDialog").doT({
						               							data: data.data
						               						}));
							           						self.datatables = $dialog.find("#appeal-table").dataTable();
							           						$dialog.modal({
							           							closeViaDimmer:false,
							           							onCancel: function(e) {
							           								this.close($dialog.remove());
							           					        }
							           						});
					                   					}
					                   				});
					                           } 
				                            }
				                       }
									 }, 
								    series: [{
								    	type: "pie",
								    	name: "占",
								    	data: seriesData
								    }]
								});
							},
							error: function(err) {}
						});
					}
				});
			}
		},
		getAppealStatusChart: {
			value: function() {
				var self = this;
				var $chartContainer = self.$tar.find('#statusHighchartContainer');
				$k.util.getDepartment({
					success: function(departmentData) {
						$.ajax({
							url: "appeal/appealStatusCount",
							type: "POST",
							success: function(data) {
								if(data.status != 0 || data.data.length == 0) {
									$chartContainer.html("暂无数据！");
									return;
								}
								var seriesData = [];
								$.each(data.data, function(key, val) {
									var statusData = [];
									$.each(val, function(ky, vl) {
										statusData.push(vl.length);
									})
									seriesData.push({name: key, data: statusData});
					            });
								
								 $chartContainer.highcharts({ 
									 chart: { type: 'column' }, 
									 title: { text: '诉求分类状态统计图' }, 
									 credits: {
							             text: '',
							             href: '#'
							         },
									 xAxis: { categories: ['待发送', '待派发', '待处理', '处理中', '待确认', '办结', '驳回'] }, 
									 yAxis: { 
										 min: 0, title: { text: '记录(条)' }, 
									 	 stackLabels: { 
										 	enabled: true, 
										 	style: { 
											 	fontWeight: 'bold', 
											 	color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray' 
										 	} 
									 	} 	
									}, 
									tooltip: { 
										formatter: function() { 
											return '<b>'+ this.x +'</b><br/>'+ this.series.name +': '+ this.y +'<br/>'+ '总计: '+ this.point.stackTotal; 
											} 
									}, 
									plotOptions: { 
										column: { 
											stacking: 'normal', 
											dataLabels: { 
												enabled: true, 
												color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white' 
											},
										},
									   series: {
				                            events: {
				                               legendItemClick: function (event){                                    
				                                  return false;
				                               },
				                               click: function(e) {  
				                            	   
					                           	} 
				                            }
				                       }
									}, 
									series: seriesData 
								});
							},
							error: function(err) {}
						});
					}
				});
			}
		},
		getAppealWarningChart: {
			value: function() {
				var self = this;
				var $chartContainer = self.$tar.find('#warningHighchartContainer');
				$k.util.getDepartment({
					success: function(departmentData) {
						$.ajax({
							url: "appeal/overAppealDaysPC",
							type: "POST",
							success: function(data) {
								var result = data.data;
								if(data.status != 0 || result == null || result.length == 0) {
									$chartContainer.html("暂无数据！");
									return;
								}
								
								var appealTypeName = [];
								var acceptDays = [];
								var handleDays = [];
								$.each(data.data, function(key, val) {
									appealTypeName.push(val.appealTypeName);
									acceptDays.push({y: val.acceptDays.length, extra: val.acceptDays});
									handleDays.push({y: val.handleDays.length, extra: val.handleDays});
					            });
								$chartContainer.highcharts({
									 chart: { type: 'bar' }, 
									 title: { text: '诉求预警提醒' }, 
									 credits: {
							             text: '',
							             href: '#'
							         },
									 xAxis: { 
										 categories: appealTypeName, 
										 title: { text: null },
									 }, 
									 yAxis: { 
										 min: 0, 
										 title: { text: '记录 (条)', align: 'high' }, 
										 labels: { overflow: 'justify', step: 4 } 
									}, 
									 tooltip: { valueSuffix: ' 条' }, 
									 plotOptions: { 
										 bar: { dataLabels: { enabled: true } },
								         series: {
											cursor: 'pointer', 
				                            events: {
				                               legendItemClick: function (event){                                    
				                                  return false;
				                               },
				                               click: function(e) { 
				                            	   var $dialog = $('<div class="am-modal am-modal-no-btn" id="appeal-modal"> </div>').appendTo(self.$tar);
				                            	    self.$tar.find("#appeal-table").find("tbody").html("");
					                   				if (self.datatables) {
					                   					self.datatables.fnDestroy();
					                   				}
				               						$dialog.html($(".template.AppealListDialog").doT({data: e.point.extra}));
					           						self.datatables = $dialog.find("#appeal-table").dataTable();
					           						$dialog.modal({
					           							closeViaDimmer:false,
					           							onCancel: function(e) {
					           								this.close($dialog.remove());
					           					        }
					           						});
								                }
				                            }
				                         }
									 }, 
									 credits: { enabled: false }, 
									 series: [
								         { name: '超过受理天数', data: acceptDays},
								         { name: '超过处理天数', data: handleDays}
									 ] 
							    });
							},
							error: function(err) {}
					    });
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
				    	  title:"required",
				    	  content:"required"
				      }
			    });
				return validatorr;
			}
		},
		getRejectValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#appeal-reject-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  rejectOpinion: "required"
				      }
			    });
				return validatorr;
			}
		},
		getDispatchValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#appeal-dispatch-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  departmentId: "required"
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>
