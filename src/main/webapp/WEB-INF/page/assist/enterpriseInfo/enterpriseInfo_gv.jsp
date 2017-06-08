<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EnterpriseInfoGV" type="text/x-jquery-tmpl">
	<div class="admin-content" style="height:initial!important;">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">企业信息</strong></div>
    	</div>

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
</script>

<script class="template EnterpriseInfoGVDialog" type="text/x-jquery-tmpl">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">企业信息
    			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
    		</div>
    		<div class="am-modal-bd" style="max-height: 500px; overflow: auto;">
	    		<form class="am-form am-form-horizontal" id="enterpriseInfo-input-form" style="line-height:3rem;">
	    			<div class="am-g" >
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">企业名称：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">{{=it.data.name}}</div>
						</div>
					</div>

					{{? it.data.imagePath != "" && it.data.imagePath != null}}
					<div class="am-g imageShow">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">企业图片：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">
								<img src="{{= "./" + it.data.imagePath}}" style="width: 100%;" alt="无企业图片"/>
							</div>
						</div>
					</div>
					{{?}}

					<div class="am-g">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">所属区域：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">{{=it.data.area!=null ? it.data.area.name : ""}}</div>
						</div>
					</div>

					<div class="am-g">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">企业负责人：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">{{=it.data.principal||""}}</div>
						</div>
					</div>
					<div class="am-g">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">企业联系人：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">
								{{~it.data.users: user:x}}
									{{?x!=(it.data.users.length-1)}}
										{{=user.name + ","}}
									{{??x == (it.data.users.length-1)}}
										{{=user.name}}
									{{?}}
								{{~}}
							</div>
						</div>
					</div>
					<div class="am-g">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">联系电话：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">{{=it.data.telephone||""}}</div>
						</div>
					</div>

					<div class="am-g">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">投产时间：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">{{= $k.util.getDateString2(it.data.productionTime)}}</div>
						</div>
					</div>

					<div class="am-g">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">主要产品：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">{{=it.data.mainProduct || ""}}</div>
						</div>
					</div>

					<div class="am-g">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">产业类别：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">{{=it.data.productType!=null?it.data.productType.name ||"":""}}</div>
						</div>
					</div>

					<div class="am-g">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">地址：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">{{=it.data.address || ""}}</div>
						</div>
					</div>

					<div class="am-g">
						<div class="am-u-sm-12">
							<div class="am-u-sm-3 am-text-right padding-right-o">企业简介：</div>
							<div class="am-u-sm-9 padding-horizontal-o am-text-left">{{=it.data.introduction || ""}}</div>
						</div>
					</div>
					
    		</div>
    		<div class="am-modal-footer">
      			<span class="am-modal-btn" data-am-modal-cancel>确定</span>
    		</div>
		</div>
</script>

<script class="template EnterpriseInfoTable" type="text/x-jquery-tmpl">
<thead>
	<tr>
        <th>#</th>
		<th>企业名称</th>
		<th>所属园区</th>
		<th>企业负责人</th>
		<th>企业联系人</th>
		<th>主要产品名称</th>
		<th>产业类别</th>
		<th>企业详情</th>
    </tr>
</thead>
<tbody>
	{{~ it.data: enterpriseInfo: num }}
	<tr class="table-tr">
		<td id="{{=enterpriseInfo.id}}">{{=num+1}}</td>
		<td class="ellipsis td-name" title="{{=enterpriseInfo.name}}">{{=enterpriseInfo.name}}</td>
		<td class="td-name ellipsis">{{=enterpriseInfo.area!=null?enterpriseInfo.area.name:""}}</td>
		<td class="td-name ellipsis">{{=enterpriseInfo.principal || ""}}</td>
		<td class="ellipsis td-name">
			{{~enterpriseInfo.users: user:x}}
				{{?x!=(enterpriseInfo.users.length-1)}}
					<a class="userInfo-href" id="{{=user.id}}">{{=user.name }}</a>{{= ","}}
				{{??x == (enterpriseInfo.users.length-1)}}
					<a class="userInfo-href" id="{{=user.id}}">{{=user.name}}</a>
				{{?}}
			{{~}}
		</td>
		<td class="td-name ellipsis">{{=enterpriseInfo.mainProduct || ""}}</td>
		<td class="td-name ellipsis" title="{{=enterpriseInfo.productType!=null?enterpriseInfo.productType.name:""}}">{{=enterpriseInfo.productType!=null?enterpriseInfo.productType.name:""}}</td>
		<td><a class="enterpriseInfo-href">查看</a></td>
	</tr>
{{~}}
</tbody>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "EnterpriseInfoGV";
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
							$dialog.html(self.$tempDialogTar.doT({
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
					});
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
				.on("change", "#enterpriseInfo-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#enterpriseInfo-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#enterpriseInfo-table .table-tr", function(e) {
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
				self.$tar.find("#enterpriseInfo-table").html("");
				self.$tar.find(".sk-three-bounce").show();
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "enterprise/list",
					type: "POST",
					success: function(data) {
						self.$tar.find(".sk-three-bounce").hide();
						self.$tar.find("#enterpriseInfo-table").html(
							$(".template.EnterpriseInfoTable").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#enterpriseInfo-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		}
	});
})( jQuery );
</script>