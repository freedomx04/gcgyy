<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
.product-item .product-div {
	text-align: center; 
	border: 1px solid #e8e8e8; 
	margin-top: 16px;
}
.product-item .img-box {
	width: 180px; 
	height: 180px; 
	position: relative; 
	overflow: hidden; 
}
.product-item .img-href {
	width: 180px; 
	height: 180px; 
	text-align: center; 
	vertical-align: middle; 
	display: table-cell;
}
.product-item .title-row {
	width: 180px; 
	height: 36px; 
	line-height: 18px; 
	overflow: hidden; 
	padding: 2px 10px 15px; 
	font-size: 14px;
}
.product-item .title-row a:HOVER {
	text-decoration: underline;
	color: #f40;
}
</style>
<script class="template ProductAll" type="text/x-jquery-tmpl">
<div class="introduce_right border">
	<div>
		<div class="hd">
			<span class="title">产品宣传</span>
		</div>
		<div class="yuanqu_w" style="font-size: 1.6rem;">
			<div style="margin-left: auto; margin-right: auto;" id="product-list"></div>
			<ul class="am-pagination am-fr" style="clear: both;">
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
</div>
</script>
<script class="template ProductAllList" type="text/x-jquery-tmpl">
<ul>
	{{~ it.list: product}}
	<li class="product-item">
		<div class="product-div">
			<div class="img-box">
				<a class="img-href" href="{{="./introduce?type=7&id="+product.id}}" target="_blank">
					{{? product.imagePath != "" && product.imagePath != null}}
						<img src="{{="./"+product.imagePath}}" style="max-width: 180px; max-height: 180px;"/>
					{{??}}
						<img src="{{="./img/product_default.jpg"}}" style="max-width: 180px; max-height: 180px;"/>
					{{?}}
				</a>
			</div>
			<div class="info-cont" style="height: 50px;">
				<div class="title-row">
					<a href="{{="./introduce?type=7&id="+product.id}}" target="_blank">{{=product.name}}</a>
				</div>
			</div>
		</div>
	</li>
	{{~}}
</ul>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "ProductAll";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on("mouseover", ".product-item .product-div", function() {
					$(this).css("border", "1px solid #f40");
				})
				.on("mouseout", ".product-item .product-div", function() {
					$(this).css("border", "1px solid #e8e8e8");
				})
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
				});
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				$.ajax({
					url: "enterprise/product/listAll",
					type: "POST",
					data: {
						type: 1,
					},
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							pageSize: 40,
							count: data.data.length,
							data: data.data
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
					url: "enterprise/product/listAllPaging",
					type: "POST",
					data: {
						page: page,
						size: 40
					},
					success: function(data) {
						self.$tar.find("#product-list").html($(".template.ProductAllList").doT({
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