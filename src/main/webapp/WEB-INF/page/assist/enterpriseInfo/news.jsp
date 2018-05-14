<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EnterpriseNews" type="text/x-jquery-tmpl">
	<div class="admin-content">
    	<div class="am-g">
    		<div class="am-u-sm-12">
	        	<form class="" id="enterprise-news">
					<div class="am-btn-toolbar am-fl">
        				<div class="am-btn-group am-btn-group-xs">
        					<button type="button" class="am-btn am-btn-default enterprise-news-add-btn"><span class="am-icon-plus"></span> 新增</button>
        					<button type="button" class="am-btn am-btn-default enterprise-news-update-btn"><span class="am-icon-save"></span> 编辑</button>
        					<button type="button" class="am-btn am-btn-default enterprise-news-delete-btn"><span class="am-icon-trash-o"></span> 删除</button>
        				</div>
	        		</div>
					<input class="enterpriseId am-hide"/>
					<div class="enterprise-news-table"></div>
	        	</form>
			</div>
		</div>
	</div>
</script>
<script class="template EnterpriseNewsDailog" type="text/x-jquery-tmpl">
<div class="am-modal-dialog div-ueditor" style="padding-top: 30px;width: 700px;">
	<div class="am-modal-hd">
		企业新闻
		<a class="am-close am-close-spin" data-am-modal-cancel href="javascript: void(0)">×</a>
	</div>
	<div class="am-modal-bd" style="max-height:400px;overflow:auto;">
		<form class="am-form am-form-horizontal" id="enterprise-news-input-form">
    			<input name="id" id="id" type="text" class="am-hide"/>
				<div class="am-form-group">
					<label for="title" class="am-u-sm-2 am-form-label font-normal">标题:</label>
		    		<div class="am-u-sm-10 padding-left">
						<input type="text" name="title" id="title" class="am-form-field"/>
		    		</div>
				</div>
				<div class="am-form-group">
		    		<label for="remark" class="am-u-sm-2 am-form-label font-normal">正文:</label>
		    		<div class="am-u-sm-10 padding-left">
						<div id="editor" name="editor" type="text/plain" style="width: 530px; height: 320px; text-align: left;"></div>
						<em class="error am-hide">正文不能为空！</em>
		    		</div>
				</div>
		</form>
		<button type="button" class="am-btn am-btn-primary am-hide" data-am-modal-cancel>确定</button>
	</div>
	<div class="am-modal-footer">
		<span class="am-modal-btn  data-am-modal-cancel" data-am-modal-cancel>取消</span>
		<span class="am-modal-btn  data-am-modal-confirm" data-am-modal-confirm>提交</span>
	</div>
</div>
</script>
<script class="template EnterpriseNewsTable" type="text/x-jquery-tmpl">
	<table class="am-table am-table-striped am-table-hover table-main" id="enterprise-news-table">
		<thead>
			<tr>
				<th></th>
		        <th class="table-id">#</th>
				<th>图文名称</th>
				<th>添加时间</th>
				<th>链接地址</th>
		    </tr>
		</thead>
		<tbody>
			{{~ it.data: news: num }}
			<tr class="table-tr">
				<td><input type='checkbox' class='box' name='box'/></td>
				<td id="{{=news.id}}">{{=num+1}}</td>
				<td class="td-title ellipsis" title="{{=news.title}}">{{=news.title || ""}}</td>
				<td>{{=$k.util.getDateString(news.createTime) || ""}}</td>
				<td class="ellipsis td-content" title="{{=news.linkPath||""}}"><span class="linkPath clickableLink" title="查看">{{=news.linkPath || ""}}</span></td>
			</tr>
		{{~}}
		</tbody>
	</table>
</script>

<script type="text/javascript">
;(function( $ ) {
	var fnName = "EnterpriseNews";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar;
				
				$tar
				.on("click", ".enterprise-news-add-btn", function() {
					var $dialog = $('<div class="am-modal am-modal-prompt" id="enterprise-news-input"></div>').appendTo(self.$tar.closest(".content"));
					$dialog.html($(".template.EnterpriseNewsDailog").doT());
					var ue = UE.getEditor('editor', {
						toolbars: [
				           ['fullscreen', 'undo', 'redo', '|', 'bold', 'italic', 'underline', 'fontborder', 
				            'strikethrough', 'superscript', 'subscript', '|', 'formatmatch', 'autotypeset', 
				            'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor'],
				           ['fontfamily', 'fontsize', '|', 'removeformat', 'insertorderedlist', 'insertunorderedlist', 
				            'selectall', 'cleardoc', 'simpleupload', 'emotion', 'map', 'spechars'],
				           ['directionalityltr', 'directionalityrtl', 'indent', '|', 'justifyleft', 'justifyright',
				            'justifycenter', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
				            'link', 'unlink', '|', 'horizontal', 'date', '|'],
				           ['inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow',
				            'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells',
				            'splittorows', 'splittocols', '|', 'preview', 'searchreplace']
				       ],
				       autoHeightEnabled: true,
				       autoFloatEnabled: true,
					});
					self.getValidate($dialog);
					$dialog.modal({
						closeViaDimmer: false,
						closeOnConfirm: false,
						onConfirm: function(e) {
							var $modal = this;
							if(!UE.getEditor('editor').hasContents()) {
								$dialog.find("#editor").next().removeClass("am-hide");
								setTimeout(function() {
									$dialog.find("#editor").next().addClass("am-hide");
								}, 1500);
								return;
							}
							if ($dialog.find('#enterprise-news-input-form').valid()) {  
								var $newsInputForm = $dialog.find("#enterprise-news-input-form");
								$.ajax({
									url: "enterprise/news/add",
									type: "POST",
									data:{
										enterpriseId: $tar.find(".enterpriseId").val(),
										title: $newsInputForm.find("#title").val(),
										allHtml: UE.getEditor('editor').getContent()
									},
									success: function(data) {
										self.load($tar.find(".enterpriseId").val());
										$modal.close($dialog.remove());
										ue.destroy();
									},
									error: function(data) {ue.destroy();}
								});
							} else {
								return;
							}
						},
						onCancel: function() {
							this.close($dialog.remove());
							ue.destroy();
						}
					});
				})
				.on("click", ".enterprise-news-update-btn", function() {
					var id = $k.util.trChecked("enterprise-news");
					if (id == null){
						return;
					}
					$.ajax({
						url: "enterprise/news/detail",
						type: "POST",
						data:{ newsId: id },
						success: function(data) {
							var $dialog = $('<div class="am-modal am-modal-prompt enterprise-news-input"></div>').appendTo(self.$tar.closest(".content"));
							$dialog.html($(".template.EnterpriseNewsDailog").doT());
							self.getValidate($dialog);
							var ue = UE.getEditor('editor', {
								toolbars: [
						           ['fullscreen', 'undo', 'redo', '|', 'bold', 'italic', 'underline', 'fontborder', 
						            'strikethrough', 'superscript', 'subscript', '|', 'formatmatch', 'autotypeset', 
						            'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor'],
						           ['fontfamily', 'fontsize', '|', 'removeformat', 'insertorderedlist', 'insertunorderedlist', 
						            'selectall', 'cleardoc', 'simpleupload', 'emotion', 'map', 'spechars'],
						           ['directionalityltr', 'directionalityrtl', 'indent', '|', 'justifyleft', 'justifyright',
						            'justifycenter', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
						            'link', 'unlink', '|', 'horizontal', 'date', '|'],
						           ['inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow',
						            'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells',
						            'splittorows', 'splittocols', '|', 'preview', 'searchreplace']
						       ],
						       autoHeightEnabled: true,
						       autoFloatEnabled: true,
							});
							
							$.each(data.data, function(ky, vl) {
								$dialog.find("[name='"+ ky +"']").val(vl);
							});
							// init ueditor
							$.ajax({
								url: "./" + data.data.linkPath,
								success: function(ret) {
									ue.ready(function() {
										ue.setContent(ret);
									});
								}
							});
							$dialog.modal({
								closeViaDimmer: false,
								closeOnConfirm: false,
								onConfirm: function(e) {
									var $modal = this;
									if(!UE.getEditor('editor').hasContents()) {
										$dialog.find("#editor").next().removeClass("am-hide");
										setTimeout(function() {
											$dialog.find("#editor").next().addClass("am-hide");
										}, 1500);
										return;
									}
									if ($dialog.find('#enterprise-news-input-form').valid()) {//如果表单验证成功，则进行提交。  
										var $newsInputForm = $dialog.find("#enterprise-news-input-form");
										
										$.ajax({
											url: "enterprise/news/edit",
											type: "POST",
											data:{
												newsId: $newsInputForm.find("#id").val(),
												title: $newsInputForm.find("#title").val(),
												allHtml: UE.getEditor('editor').getContent()
											},
											success: function(data) {
												self.load($tar.find(".enterpriseId").val());
												$modal.close($dialog.remove());
												ue.destroy();
											},
											error: function(err) {ue.destroy();}
										});
									}else{
										return;
									}
								},
								onCancel: function(e){
									this.close($dialog.remove());
									ue.destroy();
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".enterprise-news-delete-btn", function() {
					var ids = $k.util.trOperateChecked("enterprise-news");
					if (ids == null){
						return;
					}
					var $dialog = $('<div class="am-modal am-modal-confirm"></div>').appendTo(self.$tar.closest(".content"));
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
								url: "enterprise/news/delete",
								type: "POST",
								data: { newsIds: ids.toString() },
								success: function(data) {
									if (data.status == 0) {
										self.load($tar.find(".enterpriseId").val());
										$modal.close($dialog.remove());
									} else{
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
				.on("change", "#enterprise-news-table .box_all", function(e) {
					e.stopPropagation();
					$tar.find(".box").prop("checked", this.checked);
				})
				.on("click", "#enterprise-news-table .box", function(e) {
					e.stopPropagation();
					var $this = $(this);
					if ($this.prop("checked") == true) {
						$this.closest("tr").addClass("am-active")
					} else {
						$this.closest("tr").removeClass("am-active")
					}
				})
				.on("click", "#enterprise-news-table .table-tr", function(e) {
					e.stopPropagation();
					$(this).find(".box").trigger("click");
				})
				.on("click", ".linkPath", function(e) {
					e.stopPropagation();
					window.open($(this).text());
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
			value: function(enterpriseId) {
				var self = this;
				self.$tar.find("#enterprise-news-table").find("tbody").html("");
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				$.ajax({
					url: "enterprise/news/list",
					type: "POST",
					data: {
						enterpriseId: enterpriseId,
					},
					success: function(data) {
						self.$tar.find(".enterprise-news-table").html(
							$(".template.EnterpriseNewsTable").doT({
									data: data.data
								})
							);
						self.datatables = self.$tar.find("#enterprise-news-table").dataTable();
					},
					error: function(err) {}
				});
				return self;
			}
		},
		getValidate: {
			value: function($dialog) {
				var self = this;
				var validatorr = $dialog.find("#enterprise-news-input-form").validate({
				      errorElement: "em",
				      success: function(label) {
				        label.text("ok!").addClass("success");
				      },
				      focusCleanup:true,
				      onkeyup: function(element) { $(element).valid(); },
				      rules: {
				    	  name:"required",
				    	  description:"required",
				      }
			    });
				return validatorr;
			}
		}
	});
})( jQuery );
</script>