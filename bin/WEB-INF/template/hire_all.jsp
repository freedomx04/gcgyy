<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template HireAll" type="text/x-jquery-tmpl">
<div class="list-all" style="margin-top: 20px; width: 800px; float: right;">
	<div class="list-title" style="text-align: left;">
		<span>招聘信息</span>
	</div>

	<div id="list-content-wrapper" class="list-content-wrapper"></div>
	
	<div style="margin-top: 20px;">
		<ul class="am-pagination am-fr">
			<li class="prev am-hide"><a>&laquo;</a></li>
			{{ for(var i=1; i <= Math.ceil(it.count/it.pageSize); i++) { }}
				{{if(i==1){ }}
				<li class="page am-active"><a>{{=i}}</a></li>
				{{ } else { }}
  				<li class="page"><a>{{=i}}</a></li>
				{{ } }}
			{{ } }}
			{{ if(parseInt(it.count/it.pageSize) != 0) { }}
			<li class="next"><a>&raquo;</a></li>
			{{ } }}
		</ul>
	</div>
</div>
</script>

<script class="template HireAllList" type="text/x-jquery-tmpl">
<div id="list-content" class="list-content">
	<ul>
		{{~ it.list: hire: num}}
		<li style="display: inline-table;">
			<div>
				<table style="width: 100%;">
					<tr>
						<td>
							<a target="_blank" href="{{="./introduce?type=4&id="+hire.id}}" title="{{=hire.position || ""}}" style="color: #0692db;">{{=hire.position || ""}}</a>
						</td>
						<td align="right" style="padding-right: 20px; font-size: 14px;">
							<em> {{=$k.util.getDateString(hire.createTime)}}</em>
						</td>
					</tr>
					<tr>
						<td style="font-size: 14px;">
							<a target="_blank" href="{{="./introduce?type=5&id="+hire.enterprise.id}}" title="{{=hire.enterprise.name || ""}}">{{=hire.enterprise.name || ""}}</a>
						</td>
						<td align="right" style="padding-right: 20px; font-size: 14px;">
							<span>{{=hire.business.name || ""}}</span>
						</td>
					</tr>
				</table>
				<div style="width: 800px; height: 2px; background: #ddd"></div>
			</div>
		{{~}}
	</ul>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "HireAll";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on("click", ".page", function() {
					$tar.find(".am-pagination li").removeClass("am-active");
					$(this).addClass("am-active");
					var currPage = $(this).parent().find(".am-active").find("a").text();
					if(currPage == 1) {
						$(this).prev().addClass("am-hide");
						$tar.find(".next").removeClass("am-hide");
					} else if($(this).next().hasClass("next")) {
						$(this).next().addClass("am-hide");
						$tar.find(".prev").removeClass("am-hide");
					} else {
						$tar.find(".prev").removeClass("am-hide");
						$tar.find(".next").removeClass("am-hide");
					}
					self.load(parseInt($(this).find("a").text())-1);
					
				})
				.on("click", ".prev, .next", function() {
					var $li =  $(this).parent().find(".am-active");
					var currPage = $li.find("a").text();
					$li.removeClass("am-active");
					if($(this).hasClass("prev")) {
						$li.prev().addClass("am-active");
						self.load(parseInt(currPage)-2);
					} else {
						$li.next().addClass("am-active");
						self.load(parseInt(currPage));
					}
					
					var $currli = $(this).parent().find(".am-active");
					var currPage = $currli.find("a").text();
					if(currPage == 1) {
						$currli.prev().addClass("am-hide");
						$tar.find(".next").removeClass("am-hide");
					} else if($currli.next().hasClass("next")) {
						$currli.next().addClass("am-hide");
						$tar.find(".prev").removeClass("am-hide");
					} else {
						$tar.find(".prev").removeClass("am-hide");
						$tar.find(".next").removeClass("am-hide");
					}
				})
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				$.ajax({
					url: "hire/list",
					type: "POST",
					data: {
						type: 0,
					},
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							pageSize: $k.constant.pageSize,
							count: data.data.length
						}));
						self.load(0);
					},
					error: function() {}
				});
				return self;
			}
		},
		load: {
			value: function(page) {
				var self = this;
				
				$.ajax({
					url: "hire/listPaging",
					type: "POST",
					data: {
						type: 0,
						page: page,
						size: $k.constant.pageSize
					},
					success: function(data) {
						self.$tar.find(".list-content-wrapper").html($(".template.HireAllList").doT({
							list: data.data
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