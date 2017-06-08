<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Ranking" type="text/x-jquery-tmpl">
<div class="admin-content">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">积分排名系统</strong></div>
	</div>

	<div class="am-tabs" data-am-tabs>
		<ul class="am-tabs-nav am-nav am-nav-tabs">
			<li class="am-active" tab="tab1"><a href="#tab1">企业填报得分排名</a></li>
			<li tab="tab2"><a href="#tab2">工业增加值环比增幅排名</a></li>
			<li tab="tab3"><a href="#tab3">工业增加值环比降幅排名</a></li>
		</ul>

		<div class="am-tabs-bd">
	    	<div class="am-tab-panel am-fade am-in am-active" id="tab1" style="-webkit-user-select:all!important;">
	    		<div class="am-g">
		      		<div class="am-u-sm-12">
				        <form id="" class="am-cf">
			          		<table class="am-table am-table-striped am-table-hover table-main" id="point-rank-table" style="width:100%;">
			            		<thead>
			              			<tr>
			                			<th class="table-check"><input type="checkbox" class="box_all"/></th>
			                			<th class="table-id">排名</th>
										<th class="table-name">企业名称</th>
			                			<th>积分</th>
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
					<div class="am-u-sm-12">
						<div class="am-u-sm-2 padding-horizontal-o">
							<input type="text" class="am-form-field datetimepicker monthly" style="height: 2.4rem;" placeholder="请选择年月"/>
						</div>
						<form id="">
			          		<table class="am-table am-table-striped am-table-hover table-main" id="economic-growth-table">
			            		<thead>
			              			<tr>
										<th class="table-check"><input type="checkbox" class="box_all"/></th>
		                				<th class="table-id">排名</th>
				          		   	 	<th>企业名称</th>
				          		   		<th>本月工业增加值</th>
										<th>上月工业增加值</th>
										<th>环比增幅%</th>
				          			</tr>
			          			</thead>
			          			<tbody></tbody>
			       			</table>
				        </form>
					</div>
				</div>
	    	</div>
	    	<div class="am-tab-panel am-fade" id="tab3" style="-webkit-user-select:all!important;">
				<div class="am-g">
					<div class="am-u-sm-12">
						<div class="am-u-sm-2 padding-horizontal-o">
							<input type="text" class="am-form-field datetimepicker monthly" style="height: 2.4rem;" placeholder="请选择年月"/>
						</div>
						<form id="">
			          		<table class="am-table am-table-striped am-table-hover table-main" id="economic-drop-table">
				          		<thead>
					          		<tr>
										<th class="table-check"><input type="checkbox" class="box_all"/></th>
		                				<th class="table-id">排名</th>
				          		   	 	<th>企业名称</th>
				          		   		<th>本月工业增加值(元)</th>
										<th>上月工业增加值(元)</th>
										<th>环比降幅%</th>
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

<script class="template PointRankList" type="text/x-jquery-tmpl">
{{~it.data : data : index}}
<tr class="table-tr">
	<td><input type='checkbox' class='box' name='box'/></td>
	<td>{{=index+1}}</td>
	<td>{{=data.enterprise.name}}</td>
	<td>{{=data.score}}</td>
</tr>
{{~}}
</script>

<script class="template EconomicRankList" type="text/x-jquery-tmpl">
{{~it.data :data:index}}
<tr class="table-tr">
	<td><input type='checkbox' class='box' name='box'/></td>
	<td>{{=index+1}}</td>
	<td>{{=data.economic_current.enterprise!=null ? data.economic_current.enterprise.name : "-"}}</td>
    <td>{{=data.economic_current.industryAddition || "-"}}</td>
    <td>{{=data.economic_lastYear !=null ? data.economic_lastYear.industryAddition : "-"}}</td>
    <td>{{=data.industryAddition_monthGrowth != null ? (data.industryAddition_monthGrowth*100).toFixed(2) : "-"}}</td>
</tr>
{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "Ranking";
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
					if(tab == "tab1"){
						self.load();
					} else if(tab == "tab2") {
						self.getEconomicRankList(0);
					} else {
						self.getEconomicRankList(1);
					}
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
				self.datetimepicker(self.$tar.find("#tab2 .monthly"));
				self.datetimepicker(self.$tar.find("#tab3 .monthly"));
				self.$tar.find(".monthly").val(now.format("yyyy-mm"));
				return self;
			}
		},
		load: {
			value: function(){
				var self = this;
				self.$tar.find("#point-rank-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "ranking/score",
					type: "POST",
					success: function(data) {
						self.$tar.find("#point-rank-table").find("tbody").html(
							$(".template.PointRankList").doT({
								data: data.data
							})
						);
						self.datatables = self.$tar.find("#point-rank-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getEconomicRankList: {
			value: function(type){
				var self = this;
				var $table = null;
				var url = "";
				var monthly = null;
				if(type == 0) {
					$table = self.$tar.find("#economic-growth-table");
					url = "ranking/industryDesc";
					monthly = self.$tar.find("#tab2 .monthly").val();
				} else {
					$table = self.$tar.find("#economic-drop-table");
					url = "ranking/industryAsc";
					monthly = self.$tar.find("#tab3 .monthly").val();
				}
				$table.find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: url,
					type: "POST",
					data: {
						monthly: monthly,
					},
					success: function(data) {
						$table.find("tbody").html(
							$(".template.EconomicRankList").doT({
								data: data.data
							})
						);
						self.datatables = $table.dataTable();
					},
					error: function(err) {}
				});
				return self;
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
				      onChangeMonth: function(currentDateTime) {
				    	  $obj.val(currentDateTime.format("yyyy-mm"));
				    	  var tab = $obj.closest(".am-tab-panel").attr("id");
			    		  var $tab = self.$tar.find("#" + tab);
			    		  $tab.find('.searchType option').removeAttr('selected');
						  $tab.find('.searchType option[value="1"]').attr('selected', true);
				    	  if(tab == "tab2"){
							  self.getEconomicRankList(0);
						  } else if(tab == "tab3"){
								self.getEconomicRankList(1);
						  }
				      } 
				});
				return self;
			}
		}
	});
})( jQuery );
</script>
