<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template NoteInfo" type="text/x-jquery-tmpl">
<div class="newsdetail">
    <h1 class="title" style="margin-bottom: 10px!important;">
		{{=it.data.title}}
	</h1>
	<div style="text-align:right;padding: 0px 20px 0px 20px;margin:0;">{{=$k.util.getDateString(it.data.createTime)}}</div>
    <div class="meta"></div>
	<div class="content">
		{{=it.data.content}}
	</div>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "NoteInfo";
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
					url: "dynamic/detail",
					type: "POST",
					data: {
						dynamicId: id,
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