<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template ProductInfo" type="text/x-jquery-tmpl">
<div class="introduce_right border">
	<div>
		<div class="hd">
			<span class="title">{{=it.data.name}}</span>
		</div>
		<div class="yuanqu_w" style="font-size: 1.6rem;">
			<div style="margin-bottom: 60px; width: 85%; margin-left: auto; margin-right: auto;">
				<div>
					{{? it.data.imagePath != "" && it.data.imagePath != null}}
						<img src="{{="./"+it.data.imagePath}}" style="max-width: 180px; max-height: 180px;"/>
					{{??}}
						<img src="{{="./img/product_default.jpg"}}" style="max-width: 180px; max-height: 180px;"/>
					{{?}}
				</div>
				<div style="margin-top: 10px;">
					<span style="color: #aaa;">产品名称：</span>
					<span style="color: #06c; font-size: 2rem;">{{=it.data.name}}</span>
				</div>
				<div style="margin-top: 10px;">
					<span style="color: #aaa;">产品规格参数：</span>
					<span style="color: #f60;">{{=it.data.specification}}</span>
				</div>
				<div style="margin-top: 10px;">
					<span style="color: #aaa;">联系电话：</span>
					<span>{{=it.data.telephone}}</span>
				</div>
				<div style="margin-top: 10px;">
					<span style="color: #aaa;">公司名称：</span>
					<span>{{=it.data.enterprise.name}}</span>
				</div>
				<div style="margin-top: 10px;">
					<span style="color: #aaa;">产品介绍：</span>
					<span>{{=it.data.introduction}}</span>
				</div>
			</div>
		</div>
	</div>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "ProductInfo";
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
					url: "enterprise/product/detail",
					type: "POST",
					data: {
						productId: id,
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