<script class="template Footer" type="text/x-jquery-tmpl">
	<div class="foot" style="margin-top: 20px; border-top: 2px solid #0391db;">
		<div class="siteinfo" style="text-align: center; padding: 20px 20px 0;">
			<div>主办单位：广昌县工业和信息化委员会     地址：江西省广昌县解放南路154号   邮编：344900    联系电话：0794-3622123 邮箱：jxgcgxw@163.com</div>
			<div>赣ICP备17002970号</div>
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