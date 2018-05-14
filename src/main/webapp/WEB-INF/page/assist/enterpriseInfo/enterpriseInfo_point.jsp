<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EnterpriseInfoPoint" type="text/x-jquery-tmpl">
<div class="admin-content" style="height:initial!important;">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">企业信息</strong></div>
    </div>

	<div class="am-tabs" data-am-tabs>
	  <ul class="am-tabs-nav am-nav am-nav-tabs">
	    <li class="am-active" tab="tab1"><a href="#tab1">企业基本信息</a></li>
		<li tab="tab2"><a href="#tab2">企业产品</a></li>
		<li tab="tab3"><a href="#tab3">企业新闻</a></li>
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
        			<form id="enterpriseInfo-product">
						<table class="am-table am-table-striped am-table-hover table-main" id="enterprise-product-table">
		  		 			<thead>
		  		  				<tr>
					 				<th class="table-check"><input type="checkbox" class="box_all"/></th>
			            			<th>序号</th><th>产品名称</th>
	                 				<th>产品介绍</th><th>图片路径</th>
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
        			<form id="enterpriseInfo-news">
        			</form>
				</div>
			</div>
	    </div>
	  </div>
	</div>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "EnterpriseInfoPoint";
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
					} else if(tab == "tab2"){
						self.getProduct();
					} else {
						self.getNews();
					}
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
					})
					.on("click", ".productInfo-href", function(e) {
					e.stopPropagation();
					var id = $(this).parent().prev().attr("id");
					if(id==null){
						return;
					}
					$.ajax({
						url: "enterprise/product/detail",
						type: "POST",
						data:{productId: id},
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt" id="enterprise-product-input"></div>').appendTo(self.$tar.closest(".content"));
							$dialog.html(self.$tempDialogTar.doT());
							$dialog.find(".am-form-file").addClass("am-hide");
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl);
								$dialog.find(".am-form-file").addClass("am-hide");
								if(ky=="imagePath"&&vl!=""){
									$dialog.find(".imageShow").removeClass("am-hide");
									$dialog.find(".imageShow").find("img").attr("src","./"+vl);
								}
							})
							$dialog.modal({
								closeViaDimmer:false,
								closeOnConfirm: false,
								onCancel: function(e) {
									this.close($dialog.remove());
						        }
							});
							$k.util.inputDisabled("enterprise-product");
						},
						error: function(err) {}
					});
					
				})
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
				var $table = self.$tar.find("#enterpriseInfo-table")
				$table.html("");
				self.$tar.find("#tab1 .sk-three-bounce").show();
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
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
		getProduct: {
			value: function() {
				var self = this;
				self.$tar.find("#enterprise-product-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "enterprise/product/listByPointUserId",
					type: "POST",
					data:{
						pointUserId: $k.user.get().id
					},
					success: function(data) {
						self.$tar.find("#enterpriseInfo-product").find("tbody").html(
							$(".template.EnterpriseProductList").doT({
								data: data.data
							})
						);
						self.datatables = self.$tar.find("#enterprise-product-table").dataTable();
					},
					error: function(err) {
						
					}
				});
				return self;
			}
		},
		getNews: {
			value: function() {
				var self = this;
				self.$tar.find("#enterprise-news-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "enterprise/news/listByPointUserId",
					type: "POST",
					data:{
						pointUserId: $k.user.get().id
					},
					success: function(data) {
						self.$tar.find("#enterpriseInfo-news").html(
							$(".template.EnterpriseNewsTable").doT({
								data: data.data
							})
						);
						self.datatables = self.$tar.find("#enterprise-news-table").dataTable();
					},
					error: function(err) {
						
					}
				});
				return self;
			}
		}
	});
})( jQuery );
</script>
