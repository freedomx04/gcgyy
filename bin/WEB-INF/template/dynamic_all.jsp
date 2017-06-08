<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template DynamicAll" type="text/x-jquery-tmpl">
	<div class="list-title">
		<span>{{=it.title}}</span>
	</div>
	<div id="list-content-wrapper" class="list-content-wrapper">
	</div>
	
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
</script>

<script class="template DynamicAllList" type="text/x-jquery-tmpl">
<div id="list-content" class="list-content">
	<div style="text-align: center; font-size: 18px;">
		{{? it.list.length == 0}}
		暂无数据！
		{{?}}
	</div>
	<ul>
		{{~ it.list: announce: num}}
		<li>
			<div style="width: 620px; float: left;" class="ellipsis">
				<a target="_blank" href="{{="./noteList?type=3&id="+announce.id}}" title="{{=announce.title || ""}}">{{=announce.title || ""}}</a>
				{{? (Number(new Date()) - Number(new Date(announce.createTime))) / (1000 * 60 * 60 * 24) <= $k.constant.latest}}
				<img src="./img/new.gif">
				{{?}}
			</div>
			<div style="width:200px;float:right; text-align: right;">
				<em> {{=$k.util.getDateString(announce.createTime)}}</em>
			</div>
		</li>
		{{? it.list.length != num}}
			<li>
				<div style="height:2px; background:#ddd">
				</div>
			</li>
		{{?}}
		{{~}}
	</ul>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "DynamicAll";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar, type) {
				var self = this;
				self.type = type;
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
					self.load(type, parseInt($(this).find("a").text())-1);
					
				})
				.on("click", ".prev, .next", function() {
					var $li =  $(this).parent().find(".am-active");
					var currPage = $li.find("a").text();
					$li.removeClass("am-active");
					
					if($(this).hasClass("prev")) {
						$li.prev().addClass("am-active");
						self.load(type, parseInt(currPage)-2);
					} else {
						$li.next().addClass("am-active");
						self.load(type, parseInt(currPage));
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
				var type = self.type;
				$.ajax({
					url: "dynamic/listByType",
					type: "POST",
					data: {
						type: type,
					},
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							pageSize: $k.constant.pageSize,
							count: data.data.length,
							title: $k.constant.getDynamicType(type)
						}));
						self.load(type, 0);
					},
					error: function() {}
				});
				return self;
			}
		},
		load: {
			value: function(type, page) {
				var self = this;
				$.ajax({
					url: "dynamic/listByTypePaging",
					type: "POST",
					data: {
						type: type,
						page: page,
						size: $k.constant.pageSize
					},
					success: function(data) {
						self.$tar.find(".list-content-wrapper").html($(".template.DynamicAllList").doT({
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