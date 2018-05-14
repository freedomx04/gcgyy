<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template EnterpriseAll" type="text/x-jquery-tmpl">
<div class="list-all" style="margin-top: 20px; width: 800px; float: right;">
	<div class="list-title">
		<span>企业列表</span>
		<div style="float: right;">
     		<input type="text" id="enterprise-search-input" placeholder="    搜索关键字" style="">
			<button id="enterprise-search" type="button">搜索</button>
		</div>
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
</div>
</script>

<script class="template EnterpriseAllList" type="text/x-jquery-tmpl">
<div id="list-content" class="list-content">
	<ul>
		{{~ it.list: enterprise: num}}
		<li>
			<div style="float:left;" class="ellipsis">
				<a target="_blank" href="{{="./introduce?type=5&id="+enterprise.id}}" title="{{=enterprise.name || ""}}">{{=enterprise.name || ""}}</a>
			</div>
			<div style="float:right; text-align: right;margin-right:20px;font-size: 1.2rem;">
				<em> {{=enterprise.productType!=null ? enterprise.productType.name : ""}}</em>
			</div>
		</li>
		{{? it.list.length != num}}
			<li>
				<div style="width:800px; height:2px; background:#ddd">
				</div>
			</li>
		{{?}}
		{{~}}
	</ul>
</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "EnterpriseAll";
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
				.on("click", "#enterprise-search", function() {
					window.location.href = "./introduce?type=2&input=" + encodeURI($("#enterprise-search-input").val());
				})
				.on("keydown", "#enterprise-search-input", function(e) {
					if (e.keyCode==13) {
						window.location = "./introduce?type=2&input=" + encodeURI($("#enterprise-search-input").val());
					}
				});
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				$.ajax({
					url: "enterprise/listBase",
					type: "POST",
					data: {
						type: 0,
					},
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							pageSize: 100,
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
				var searchStr = decodeURI($k.util.getRequestParam("input"));
				
				if (searchStr != "") {
					$.ajax({
						url: "enterprise/search",
						data: {input: searchStr},
						success: function(data) {
							if (data.status == 0) {
								self.$tar.find(".list-content-wrapper").html($(".template.EnterpriseAllList").doT({
									list: data.data
								}));
							}
						},
						error: function(err) {}
					});
				} else {
					$.ajax({
						url: "enterprise/listPaging",
						type: "POST",
						data: {
							type: 0,
							page: page,
							size: 100
						},
						success: function(data) {
							self.$tar.find(".list-content-wrapper").html($(".template.EnterpriseAllList").doT({
								list: data.data
							}));
						},
						error: function() {}
					});
				}
				return self;
			}
		}
	});

})( jQuery );
</script>