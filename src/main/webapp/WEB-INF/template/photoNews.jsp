<script class="template PhotoNews" type="text/x-jquery-tmpl">
	<div class="unit_slide slideBox">
		<ul class="items">
			{{~ it.list: news: num}}
				<li>
					<a href="{{="./noteList?type=3&id="+news.id}}" title="{{=news.title}}" target="_blank">
						<img src="{{=news.imagePath}}" width="500" height="270">
					</a>
				</li>
			{{~}}
	    </ul>
	</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "PhotoNews";
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
			value: function() {
				var self = this;
				
				$.ajax({
					url: "dynamic/listByTypePaging",
					type: "POST",
					data: {
						type: 3,
						page: 0,
						size: 3
					},
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							list: data.data
						}));
						
						self.$tar.find(".unit_slide").slideBox({
							duration: 0.5,	
							easing: 'linear',	
							delay: 5,
							hideClickBar: true
						});
					},
					error: function() {}
				});
				return self;
			}
		}
	});

})( jQuery );
</script>