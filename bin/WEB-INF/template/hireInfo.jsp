<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template HireInfo" type="text/x-jquery-tmpl">
<div class="introduce_right border">
	<div>
		<div class="hd">
			<span class="title">{{=it.data.position + "招聘"}}</span>
		</div>
		<div class="yuanqu_w" style="font-size: 1.6rem;">
			<div style="margin-bottom: 60px; width: 85%; margin-left: auto; margin-right: auto;">
				<div style="text-align: center; margin-bottom: 10px;">
					{{? it.data.imagePath != ""}}
						<img src="{{="./"+it.data.imagePath}}"/>
					{{?}}
				</div>
				<div style="width: 50%; display:inline-block;">
					<span style="color: #aaa;">职位名称：</span>
					<span style="color: #06c; font-size: 2rem;">{{=it.data.position}}</span>
				</div>
				<div style="display:inline-block; width: 49%;">
					<span style="color: #aaa;">薪资：</span>
					<span style="color: #f60;">{{=it.data.salary}}元</span>
				</div>
				<div style="width: 50%;display:inline-block;margin-top: 20px;">
					<span style="color: #aaa;">行业名称：</span>
					<span>{{=it.data.business.name}}</span>
				</div>
				<div style="display:inline-block;width: 49%;">
					<span style="color: #aaa;">联系电话：</span>
					<span>{{=it.data.telephone}}</span>
				</div>
				<div style="margin-top: 20px;">
					<span style="color: #aaa;">公司名称：</span>
					<span>{{=it.data.enterprise.name}}</span>
				</div>
				<div style="margin-top: 20px;">
					<span style="color: #aaa;">详细要求：</span>
					<span>{{=it.data.description}}</span>
				</div>
			</div>
		</div>
	</div>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "HireInfo";
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
					url: "hire/detail",
					type: "POST",
					data: {
						hireId: id,
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