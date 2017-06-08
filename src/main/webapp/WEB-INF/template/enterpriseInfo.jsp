<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
.yuanqu_w ul li {
	list-style-type: none;
}
.yuanqu_w .introduce-title {
	color: #000;
	padding-left: 10px;
}
</style>
<script class="template EnterpriseInfo" type="text/x-jquery-tmpl">
<div class="introduce_right border">
	<div>
		<div class="hd">
			<span class="title">{{=it.data.name}}</span>
		</div>
		<div class="yuanqu_w" style="font-size: 1.6rem;">
			<h3 style="color: #000; border-bottom: 1px solid #686868;">企业信息</h3>
			<div style="width: 95%; margin-left: auto; margin-right: auto;">
				<div>主营产品:<span class="introduce-title">{{=it.data.mainProduct  || ""}}</span></div>
				<div>联系电话:<span class="introduce-title">{{=it.data.telephone || ""}}</span></div>
				<div>企业地址:<span class="introduce-title">{{=it.data.address  || ""}}</span></div>
				<div>企业简介:</div>
				{{? it.data.imagePath != "" && it.data.imagePath != null}}
					<img src="{{="./"+it.data.imagePath}}" hspace="10" vspace="10" width="200" align="right">
				{{??}}
					<img src="{{="./img/enterprise_default.jpg"}}" hspace="10" vspace="10" width="200" align="left">
				{{?}}
				<div style="color:#000; text-indent: 2em;">
					{{=it.data.introduction || ""}}
				</div>
			</div>

			<h3 style="color: #000; border-bottom: 1px solid #686868; clear: both;">企业产品</h3>
			<div>
				<ul>
					{{~it.data.products : product: index}}
					<ol style="clear:both; padding: 20px 0 10px 0; border-bottom: 1px solid #ccc; display:table; width:100%;">
						<li style="width: 180px;display:table-cell;padding-right:20px;">
							{{? product.imagePath !="" && product.imagePath != null}}
							<img style="width:100%;" src="{{="./"+product.imagePath}}"/>
							{{??}}
							<img style="width:100%;" src="{{="./img/product_default.jpg"}}" align="middle"/>
							{{?}}
						</li>
						<li style="display: table-cell; vertical-align: top;">
							<p style="margin-bottom: 0;">{{=product.name}}</p>
							<p style="font-size: 14px; color: #999; margin-top: 6px;">{{=product.introduction}}</p>
						</li>
					</ol>
					{{~}}
				</ul>
			</div>

			<h3 style="color: #000; border-bottom: 1px solid #686868; clear: both;">企业新闻</h3>
			<ul style="width: 95%; margin-left: auto; margin-right: auto;">
				{{~it.data.newsList : news}}
				<li style="padding: 4px 0;">
					<a href="{{=news.linkPath}}" target="_blank">{{=news.title}}</a>
				</li>
				{{~}}
			</ul>
		</div>
	</div>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "EnterpriseInfo";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				return self;
			}
		},
		draw: {
			value: function(id) {
				var self = this;
				$.ajax({
					url: "enterprise/detail",
					type: "POST",
					data: {
						enterpriseId: id,
					},
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							data: data.data
						}));
					},
					error: function() {}
				});
				return self;
			}
		}
	});

})( jQuery );
</script>