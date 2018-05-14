<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script class="template Visit" type="text/x-jquery-tmpl">
	<div class="admin-content">
  		<div class="am-cf am-padding">
      		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">访问量</strong></div>
    	</div>

    	<div class="am-g">
    		<div class="am-u-sm-12">
	        	<form id="role">
					<table class="am-table am-table-striped am-table-hover table-main" id="visit-table">
            		<thead>
            			<tr>
            				<th>#</th>
							<th>日期</th>
            				<th>访问量</th>
               			</tr>
            		</thead>
            		<tbody>
						{{~ it.data: visit: index }}
						<tr class="table-tr">
							<td>{{=index+1}}</td>
							<td>{{=visit[0]}}</td>
							<td>{{=visit[1]}}</td>
						</tr>
						{{~}}
					</tbody>
          			</table>
	        	</form>
			</div>
		</div>
	</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Visit";
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
				
				if (self.datatables) {
					self.datatables.fnDestroy();
				}
				
				$.ajax({
					url: 'visit/list',
					type: 'POST',
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							data: data.data
						}));
						self.datatables = self.$tar.find("#visit-table").dataTable();
					},
					error: function(err) {}
				});
				
				return self;
			}
		},
		load: {
			value: function() {
				var self = this;
				return self;
			}
		}
		
	});
})( jQuery );
</script>
