<script class="template Footer" type="text/x-jquery-tmpl">
	<div class="foot" style="margin-top: 20px; border-top: 2px solid #0391db;">
		<div class="siteinfo" style="text-align: center; padding: 20px;">
			<div>广昌工业和信息化委员会 版权所有 - 赣ICP备17002970号 </div>
		</div>
	</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Footer";
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
				self.$tar.html(self.$tempTar.doT());
				return self;
			}
		}
	});

})( jQuery );
</script>