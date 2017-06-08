<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template AppealCenterGV" type="text/x-jquery-tmpl">
	<div class="admin-content" style="height:initial!important;">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">诉求中心</strong></div>
    </div>

	<div class="am-tabs" data-am-tabs>
	  <ul class="am-tabs-nav am-nav am-nav-tabs">
	    <li class="am-active" tab="tab1"><a href="#tab1">诉求列表</a></li>
		{{? $k.user.get().role.code != "00"}}
	    <li tab="tab2"><a href="#tab2">诉求分类</a></li>
		<li tab="tab3"><a href="#tab3">诉求预警</a></li>
		{{?}}
	  </ul>

	  <div class="am-tabs-bd">
	    <div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
	    	<div class="am-g">
		      <div class="am-u-sm-12">
		        <form id="appealCenterGV">
					{{? $k.user.get().role.code != "00"}}
					<div class="am-btn-toolbar am-fl">
         				<div class="am-btn-group am-btn-group-xs">
           				<button type="button" class="am-btn am-btn-default appeal-reject-btn"><span class="am-icon-save"></span> 驳回</button>
           				<button type="button" class="am-btn am-btn-default appeal-accept-btn"><span class="am-icon-plus"></span> 确认受理</button>
           				<button type="button" class="am-btn am-btn-default appeal-handle-btn"><span class="am-icon-trash-o"></span> 办结</button>
         				</div>
       				</div>
					{{?}}
	          		<table class="am-table am-table-striped am-table-hover table-main" id="appealCenterGV-table">
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

<script class="template AppealCenterList" type="text/x-jquery-tmpl">
	{{~ it.data: appeal: index }}
		<tr class="table-tr">
			<td><input type='radio' class='box' name='box' value="{{=appeal.status}}"/></td>
			<td id="{{=appeal.id}}">{{=index+1}}</td>
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
	{{~}}
</script>

<script class="template AppealListDialog" type="text/x-jquery-tmpl">
  <div class="am-modal-dialog" style="width:750px;">
	  <div class="am-modal-hd am-text-left" style="background-color:#eee;border-bottom:1px solid #ccc;">
	    	诉求
	    	<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
	  </div>
	  <div class="am-modal-bd">
		<div class="am-g">
		<div class="am-u-sm-12">
			<form style="overflow:auto;max-height:500px;margin-top:20px;">
	  			<table align="center" id="appeal-table" class="am-table am-table-striped am-table-hover table-main am-table-centered" style="width:100%;" >
	  		 		<thead>
						<tr>
				  			<th>#</th>
							<th>公司名称</th>
							<th>诉求标题</th>
							<th>诉求类型</th>
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
								<td>{{= index +1}}</td>
								<td class="ellipsis td-name" title="{{=appeal.enterprise!=null?appeal.enterprise.name||"":""}}">{{=appeal.enterprise!=null?appeal.enterprise.name||"":""}}</td>
								<td class="ellipsis td-title" title="{{=appeal.title}}">{{=appeal.title||""}}</td>
								<td>{{=appeal.appealType!=null?appeal.appealType.name||"":""}}</td>
								<td class="appealInfo-href" appealId="{{=appeal.id}}"><a>详情</a></td>
								<td status="{{=appeal.status}}" class="appeal-status">{{=$k.constant.getAppealStatus(appeal.status)}}</td>
								<td>{{=$k.util.getDateString(appeal.createTime)}}</td>
								<td>{{=$k.util.getDateString(appeal.dispatchTime)}}</td>
								<td>{{=$k.util.getDateString(appeal.acceptTime)}}</td>
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

<script type="text/javascript">
;(function( $ ) {
	var fnName = "AppealCenterGV";
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
				.on("click", ".appeal-accept-btn", function() {
					var id = $k.util.trChecked("appealCenterGV");
					if (id == null){
						return;
					}
					
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: "您确定受理该诉求吗?"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: "appeal/accept",
								type: "POST",
								data: { appealId: id },
								success: function(data) {
									self.getAppealList();
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
				.on("click", ".appeal-handle-btn", function() {
					var id = $k.util.trChecked("appealCenterGV");
					if (id == null){
						return;
					}
					
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: "您确定该诉求已办结吗?"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: "appeal/handle",
								type: "POST",
								data: { appealId: id },
								success: function(data) {
									self.getAppealList();
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
				.on("click", ".appeal-reject-btn", function() {
					var id = $k.util.trChecked("appealCenterGV");
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
				.on("click", "#appealCenterGV-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					var status = $this.val();
					$tar.find("#appealCenterGV-table").find("tr").removeClass("am-active");
					$tar.find("#appealCenterGV").find(".am-btn").removeClass("am-disabled");
					$this.closest("tr").addClass("am-active");
					if(status == 1) {
						$tar.find("#appealCenterGV").find(".am-btn").addClass("am-disabled");
						$tar.find(".appeal-reject-btn").removeClass("am-disabled");
					} else if(status == 2) {
						$tar.find(".appeal-handle-btn").addClass("am-disabled");
					} else if(status == 3) {
						$tar.find(".appeal-reject-btn").addClass("am-disabled");
						$tar.find(".appeal-accept-btn").addClass("am-disabled");
					} else if(status == 4 || status == 5 || status == 6) {
						$tar.find("#appealCenterGV").find(".am-btn").addClass("am-disabled");
					}
				})
				.on("click", "#appealCenterGV-table .table-tr", function(e) {
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
				self.$tar.find("#appealCenterGV-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				self.$tar.find("#appealCenterGV").find(".am-btn").removeClass("am-disabled");
				
				$k.util.getDepartment({
					success: function(departmentData) {
						var url = "appeal/listByDepartmentId";
						var data =  {};
						if ($k.user.get().role.code == "00") {
							url = "appeal/list";
						} else {
							data = {
									departmentId: departmentData.data.id
							};
						}
						$.ajax({
							url: url,
							type: "POST",
							data: data,
							success: function(data) {
								self.$tar.find("#appealCenterGV-table").find("tbody").html(
									$(".template.AppealCenterList").doT({
										data: data.data
									})
								);
								self.datatables = self.$tar.find("#appealCenterGV-table").dataTable();
								self.$tar.find("th").eq(0).removeClass("sorting_asc");
							},
							error: function(err) {}
						});
					}
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
							data: {
								departmentId: departmentData.data.id
							},
							success: function(data) {
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
					                   						departmentId: departmentData.data.id
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
							data: {
								departmentId: departmentData.data.id
							},
							success: function(data) {
								if(data.status != 0 || data.data.length == 0) {
									$chartContainer.html("暂无数据！");
									return;
								}
								var seriesData = [];
								$.each(data.data, function(key, val) {
									var statusData = [];
									$.each(val, function(ky, vl) {
										if(ky != 0 && ky != 1) {
											statusData.push(vl.length);
										}
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
									 xAxis: { categories: ['待处理', '处理中', '待确认', '办结', '驳回'] }, 
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
							data: {
								departmentId: departmentData.data.id
							},
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
		}
	});
})( jQuery );
</script>
