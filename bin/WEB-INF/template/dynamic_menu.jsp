<script class="template DynamicMenu" type="text/x-jquery-tmpl">
	<table>
		<tbody>
			{{~ it.list: dynamic: num}}
			<tr class="tr">
				<td style="padding-left: 15px; display: none;">
					<span class="num">{{=num+1}}</span>
				</td>
				<td style="padding-left: 15px; width: 450px;">
					<div class="ellipsis">
						<a href="{{="./noteList?type="+it.type+"&id="+dynamic.id}}" target="_blank">{{=dynamic.title}}</a>
						{{? (Number(new Date()) - Number(new Date(dynamic.createTime))) / (1000 * 60 * 60 * 24) <= $k.constant.latest}}
						<img src="./img/new.gif">
						{{?}}
					</div>
				</td>
			</tr>
			{{~}}
		</tbody>
	</table>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "DynamicMenu";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar;
				return self;
			}
		},
		draw: {
			value: function(type) {
				var self = this;
				
				$.ajax({
					url: "dynamic/listByTypePaging",
					type: "POST",
					data: {
						type: type,
						page: 0,
						size: 7
					},
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							list: data.data,
							type: type
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