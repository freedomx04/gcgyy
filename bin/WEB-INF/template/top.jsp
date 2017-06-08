<%@page import="com.google.gson.Gson"%>
<%@page import="com.hongmeng.gcgyy.entity.authority.BaseUserEntity"%>
<style type="text/css">
.top-menu a {
	padding: 0 10px;
}
</style>

<script class="template Top" type="text/x-jquery-tmpl">
	<div class="top-menu" style="height: 30px; line-height: 30px;">
		<ul>
			<li style="float: left;">
				<a href="./">首页</a>
					 |  
				<a href="javascript:void(0)" onclick="shoucang(document.title,window.location)">加入收藏</a>
					 |  
				<a href="javascript:void(0)" onclick="SetHome(this,window.location)">设为首页</a>
			</li>
			<li style="float: right; padding-right: 30px;">
				{{?it.user == null}}
				<a href="register">注册</a>
					 |  
				<a href="login">登录</a>
				{{??}}
				<a href="manager">后台管理</a>
					 |  
				{{=it.user.name}}
				{{?}}
			</li>
		</ul>
	</div>
	
	<div class="flexslider">
		<img src="./img/portal_top.png">
		<div class="portal_slide slideBox am-hide">
			<ul class="items">
				{{~ it.list: news: num}}
					<li>
						<a href="{{="./noteList?type=4&id="+news.id}}" title="{{=news.title}}" target="_blank">
							<img src="{{=news.imagePath}}" width="1024" height="250">
						</a>
					</li>
				{{~}}
	    	</ul>
		</div>
	</div>	
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Top";
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
			value: function(user) {
				var self = this;
				// set session
				<% 
					Gson gson = new Gson();
					BaseUserEntity user = (BaseUserEntity) session.getAttribute("cur_user");
					String str = gson.toJson(user);
				%>
				var user = JSON.parse('<%=str%>');
				$k.user.set(user);
				$.ajax({
					url: "dynamic/listByTypePaging",
					type: "POST",
					data: {
						type: 4,
						page: 0,
						size: 2
					},
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							list: data.data,
							user: user
						}));
						
						self.$tar.find(".portal_slide").slideBox({
							duration: 0.5,	//滚动持续时间，单位：秒
							easing: 'linear',	//swing,linear//滚动特效
							delay: 5,	//滚动延迟时间，单位：秒
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
<script type="text/javascript"> 

	function SetHome(obj,vrl) { // 设置为主页 
		try{ 
			obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl); 
		} catch(e){ 
			if (window.netscape) { 
				try { 
					netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
				} catch (e) { 
					alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。"); 
				} 
				var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); 
				prefs.setCharPref('browser.startup.homepage',vrl); 
			} else { 
				alert("您的浏览器不支持，请按照下面步骤操作：1.打开浏览器设置。2.点击设置网页。3.输入："+vrl+"点击确定。"); 
			} 
		} 
	} 
	
	function shoucang(sTitle,sURL) { // 加入收藏 兼容360和IE6 
		try { 
			window.external.addFavorite(sURL, sTitle); 
		} catch (e) { 
			try { 
				window.sidebar.addPanel(sTitle, sURL, ""); 
			} catch (e) { 
				alert("加入收藏失败，请使用Ctrl+D进行添加"); 
			} 
		} 
	} 
	
</script>