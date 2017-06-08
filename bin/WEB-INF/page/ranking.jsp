<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Ranking" type="text/x-jquery-tmpl">
<div class="admin-content">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">{{=it.title}}</strong></div>
	</div>

	{{? it.type == '1'}}
	    <div class="am-g ranging1">
			<div class="am-u-sm-12">
				<div class="sk-three-bounce">
					<div class="sk-child sk-bounce1"></div>
					<div class="sk-child sk-bounce2"></div>
					<div class="sk-child sk-bounce3"></div>
				</div>
				<table class="am-table am-table-striped am-table-hover table-main" id="point-rank-table">
				</table>
			</div>
		</div>

	{{?? it.type == '2'}}
		<div class="am-g ranging2">
			<div class="am-u-sm-12">
				<div class="am-u-sm-4 padding-horizontal-o">
					<input type="text" class="am-form-field am-align-left datetimepicker monthly" style="height: 30px; line-height: 16px;width: 120px;" placeholder="请选择年月"/>
					<button type="button" class="am-btn am-radius am-btn-default am-btn-sm search">查询</button>
				</div>
				<div class="sk-three-bounce">
					<div class="sk-child sk-bounce1"></div>
					<div class="sk-child sk-bounce2"></div>
					<div class="sk-child sk-bounce3"></div>
				</div>
				<table class="am-table am-table-striped am-table-hover table-main" id="economic-desc-table">
			   </table>
			</div>
		</div>

	{{?? it.type == '3'}}
		<div class="am-g ranging3">
			<div class="am-u-sm-12">
				<div class="am-u-sm-4 padding-horizontal-o">
					<input type="text" class="am-form-field am-align-left datetimepicker monthly" style="height: 30px; line-height: 16px; width: 120px;" placeholder="请选择年月"/>
					<button type="button" class="am-btn am-radius am-btn-default am-btn-sm search">查询</button>
				</div>
				<div class="sk-three-bounce">
					<div class="sk-child sk-bounce1"></div>
					<div class="sk-child sk-bounce2"></div>
					<div class="sk-child sk-bounce3"></div>
				</div>
				<table class="am-table am-table-striped am-table-hover table-main" id="economic-asc-table">
			    </table>
			</div>
		</div>
	{{?}}

	
</div>
</script>

<script class="template PointRankList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th>#</th>
		<th class="table-name" style="min-width: 120px!important;">企业名称</th>
		<th>积分</th>
	</tr>
</thead>
<tbody>
	{{~it.data: data: index}}
	<tr class="table-tr">
		<td>{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=data.enterprise.name}}">{{=data.enterprise.name}}</td>
		<td>{{=data.score}}</td>
	</tr>
	{{~}}
</tbody>
</script>

<script class="template EconomicRankList" type="text/x-jquery-tmpl">
<thead>
	<tr>
		<th>#</th>
		<th style="min-width: 120px!important;">企业名称</th>
		<th>本月止工业总产值</th>
		<th>上月止工业总产值</th>
		<th>环比降幅%</th>
	</tr>
</thead>
<tbody>
	{{~it.data :data:index}}
	<tr class="table-tr">
		<td>{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=data.economic_current.enterprise!=null ? data.economic_current.enterprise.name : ""}}">{{=data.economic_current.enterprise!=null ? data.economic_current.enterprise.name : "-"}}</td>
    	<td>{{=data.economic_current.industryAddition || "-"}}</td>
    	<td>{{=data.economic_lastYear !=null ? data.economic_lastYear.industryAddition : "-"}}</td>
    	<td>{{=data.industryAddition_monthGrowth != null ? (data.industryAddition_monthGrowth*100).toFixed(2) : "-"}}</td>
	</tr>
{{~}}
</tbody>
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
				.on('click', '.ranging2 .search', function() {
					self.type = '2';
					self.load();
				})
				.on('click', '.ranging3 .search', function() {
					self.type = '3';
					self.load();
				});
				return self;
			}
		},
		draw: {
			value: function(type) {
				var self = this;
				self.type = type;
				
				var title = self.getTitle(type);
				self.$tar.html(self.$tempTar.doT({
					type: self.type,
					title: title
				}));
				
				var now = new Date();
				now.setMonth(now.getMonth() - 1);
				$k.util.datePicker(self.$tar.find(".monthly"));
				$k.util.datePicker(self.$tar.find(".monthly"));
				self.$tar.find(".monthly").val(now.format("yyyy-mm"));
				
				return self;
			}
		},
		load: {
			value: function(){
				var self = this;
				if (self.table) {
					self.table.fnDestroy();
				}
				self.$tar.find(".sk-three-bounce").show();
				self.$tar.find("table").html("");
				switch (self.type) {
				case '1':
					$.ajax({
						url: "ranking/score",
						type: "POST",
						success: function(data) {
							self.$tar.find("#point-rank-table").prev().hide();
							self.$tar.find("#point-rank-table").html(
								$(".template.PointRankList").doT({
									data: data.data
								})
							);
							self.table = self.$tar.find("#point-rank-table").dataTable({
								searching: true
							});
						},
						error: function(err) {}
					});
					
					break;
				case '2':
					var monthly = self.$tar.find(".ranging2 .monthly").val();
					$.ajax({
						url: 'ranking/industryDesc',
						type: 'POST',
						data: {
							monthly: monthly,
						},
						success: function(data) {
							self.$tar.find("#economic-desc-table").prev().hide();
							self.$tar.find("#economic-desc-table").html(
								$(".template.EconomicRankList").doT({
									data: data.data
								})
							);
							self.table = self.$tar.find("#economic-desc-table").dataTable({
								searching: true
							});
						},
						error: function(err) {}
					});
					break;
				case '3':
					var monthly = self.$tar.find(".ranging3 .monthly").val();
					$.ajax({
						url: 'ranking/industryAsc',
						type: 'POST',
						data: {
							monthly: monthly,
						},
						success: function(data) {
							self.$tar.find("#economic-asc-table").prev().hide();
							self.$tar.find("#economic-asc-table").html(
									$(".template.EconomicRankList").doT({
										data: data.data
									})
								);
								self.table = self.$tar.find("#economic-asc-table").dataTable({
									searching: true
								});
						},
						error: function(err) {}
					});
					break;
				}
				
				return self;
			}
		},
		getTitle: {
			value: function(type) {
				var title;
				switch (type) {
				case '1':		title = '企业填报得分排名';		break;
				case '2':		title = '工业总产值环比增幅排名';	break;
				case '3':		title = '工业总产值环比降幅排名';	break;
				}
				return title;
			}
		},
	});
	
})( jQuery );
</script>
