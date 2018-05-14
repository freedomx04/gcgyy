<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
.county-sort {
	border: 1px solid #ccc; 
	margin: 10px;
}
.county-sort ul {
	padding: 0;
	margin: 0;
}
.county-sort li {
	padding: 2px;
	border: 1px solid #ccc;
	background: #fff;
	cursor: move;
}
</style>

<script type="text/javascript" src="js/ddsort/ddsort.js"></script>

<script class="template County" type="text/x-jquery-tmpl">
	<div class="admin-content">
    	<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">县区管理</strong></div>
    	</div>

    	<div class="am-g">
			<div class="am-u-sm-12">
				<form class="" id="county">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-xs">
           					<button type="button" class="am-btn am-btn-default county-add-btn"><span class="am-icon-plus"></span> 新增</button>
           					<button type="button" class="am-btn am-btn-default county-update-btn"><span class="am-icon-save"></span> 编辑</button>
           					<button type="button" class="am-btn am-btn-default county-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
							<button type="button" class="am-btn am-btn-default county-sort-btn"><span class="am-icon-sort"></span> 排序</button>
         				</div>
					</div>
					<table class="am-table am-table-striped am-table-hover table-main" id="county-table">
						<thead>
							<tr>
								<th><input type='checkbox' class='box_all' name='box'/></th>
								<th>#</th>
								<th>名称</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</script>
<script class="template CountyDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">县区信息
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<form class="am-form am-form-horizontal" id="county-input-form">
		
				<input name="id" id="id" type="text" class="am-hide"/>
		
				<div class="am-form-group">
					<label for=name"" class="am-u-sm-2 am-form-label font-normal">名称:</label>
		    		<div class="am-u-sm-10 padding-left">
						<input type="text" name="name" id="name" class="am-form-field"/>
		    		</div>
				</div>
		
				<div class="am-form-group">
		    		<label for="remark" class="am-u-sm-2 am-form-label font-normal">备注:</label>
		    		<div class="am-u-sm-10 padding-left">
						<textarea rows="5" name="remark" id="remark"></textarea>
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


<script class="template CountySortDialog" type="text/x-jquery-tmpl">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">县区排序
			<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
		</div>
		<div class="am-modal-bd">
			<div>可通过拖拽县区名称进行排序, 全市排名列表将按照排序顺序显示!</div>
			<div class="county-sort">
    			<ul>
					{{~ it.data: county}}
        			<li data-id="{{=county.id}}">{{=county.name}}</li>
					{{~}}
    			</ul>
			</div>
		</div>
		<div class="am-modal-footer">
			<span class="am-modal-btn" data-am-modal-cancel>取消</span>
			<span class="am-modal-btn" data-am-modal-confirm>提交</span>
		</div>
	</div>
</script>
<script class="template CountyList" type="text/x-jquery-tmpl">
	{{~ it.data: county:index }}
		<tr class="table-tr">
			<td><input type='checkbox' class='box' name='box'/></td>
			<td id="{{=county.id}}">{{=index+1}}</td>
			<td class="td-title ellipsis" title="{{=county.name}}"><a class="countyInfo-href">{{=(county.name|| "" )}}</a></td>	
			<td class="td-content ellipsis" title="{{=county.remark}}">{{=(county.remark|| "" )}}</td>
		</tr>
	{{~}}
</script>
<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "County";
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
				.on("click", ".county-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
					$dialog.html(self.$tempDialogTar.doT());
					self.getValidate($dialog);
					
					$dialog.modal({
						closeViaDimmer:false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if ($dialog.find('#county-input-form').valid()) {//如果表单验证成功，则进行提交。  
								$.ajax({
									url: "county/add",
									type: "POST",
									data:{
										name: $dialog.find("#name").val(),
										remark: $dialog.find("#remark").val()
									},
									success: function(data) {
										if (data.status == 0) {
											self.load();
											$modal.close($dialog.remove());
										}
									},
									error: function(err) {
										$k.util.alertModal("操作失败，请稍后重试！");
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
				.on("click", ".county-update-btn", function() {
					var id = $k.util.trChecked("county");
					if (id == null){
						return;
					}
					$.ajax({
						url: "county/detail",
						type: "POST",
						data:{ countyId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT());
							self.getValidate($dialog);
							
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl)
							})
							$dialog.modal({
								closeViaDimmer:false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									var $countyInputForm = $("#county-input-form");
									if ($countyInputForm.valid()) {//如果表单验证成功，则进行提交。  
										$.ajax({
											url: "county/edit",
											type: "POST",
											data:{
												countyId: $countyInputForm.find("#id").val(),
												name: $countyInputForm.find("#name").val(),
												remark: $countyInputForm.find("#remark").val()
											},
											success: function(data) {
												$modal.close($dialog.remove());
												self.load();
											},
											error: function(err) {
												$k.util.alertModal("操作失败，请稍后重试！");
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
				.on("click", ".county-delete-btn", function() {
					var ids = $k.util.trOperateChecked("county");
					if (ids == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "",
						content: "<span style='color: red'>如果删除该县区的话，则该企业相关的工业增加值、工业用电等所有数据上报信息都将被删除，请知悉！！！</span>"
					}));
					$dialog.modal({
						relatedTarget: this,
					    closeViaDimmer: false,
						onConfirm: function(e) {
							var $modal = this;
							$.ajax({
								url: "county/delete",
								type: "POST",
								data: { countyIds: ids.toString() },
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
				.on("click",".countyInfo-href",function(e){
					e.stopPropagation();
					var countyId = $(this).parent().prev().attr("id");
					$.ajax({
						url: "county/detail",
						type: "POST",
						data:{ countyId: countyId },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt" id="county-input"></div>').appendTo(self.$tar);
							$dialog.html(self.$tempDialogTar.doT());
							$.each(data.data,function(ky,vl){
								$dialog.find("[name='"+ky+"']").val(vl);
							});
							$dialog.modal({
								closeViaDimmer: false,
 								onCancel: function(e) {
									this.close($dialog.remove());
								} 
							});
							$k.util.inputDisabled("county");
						},
						error: function(err) {}
					});
				})
				.on('click', '.county-sort-btn', function() {
					$.ajax({
						url: 'county/list',
						type: 'POST',
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt"></div>').appendTo(self.$tar);
							$dialog.html($(".template.CountySortDialog").doT({
								data: data.data
							}));
							
 							$dialog.find('.county-sort').DDSort({
							    target: 'li',           
							    floatStyle: {           
							        'border': '1px solid #ccc',
							        'background-color': '#fff',
							        'padding': '2px'
							    }
							}); 
							
							$dialog.modal({
								closeViaDimmer:false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									
									var arr = [];
									$.each($dialog.find('.county-sort li'), function(key, val) {
										var $li = $(val);
										arr.push($li.attr('data-id') + ',' + $li.text() + ',' + key);
									});
									
									$.ajax({
										url: 'county/sort',
										type: 'POST',
										data: {
											countyList: arr
										},
										success: function(data) {
											$modal.close($dialog.remove());
											self.load();
										},
										error: function(err) {
											$k.util.alertModal("操作失败，请稍后重试！");
										}
									});
									
								},
								onCancel: function() {
									this.close($dialog.remove());
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("change", "#county-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").trigger("click");
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#county-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", ".table-tr", function(e) {
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
				self.$tar.find("#county-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "county/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#county-table").find("tbody").html(
							$(".template.CountyList").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#county-table").dataTable({"paginate": false});
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#county-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  name:"required"
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>