<%@page import="com.google.gson.Gson"%>
<%@page import="com.hongmeng.gcgyy.entity.authority.BaseUserEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>广昌工业经济运行监测平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="./img/favicon.ico" type="image/x-icon" />

<jsp:include flush="true" page="/WEB-INF/include/html_head_preload.jsp">
	<jsp:param name="html_head_preload" value="html_head_preload"/> 
</jsp:include>

<jsp:include flush="true" page="/WEB-INF/page/target.jsp">
    <jsp:param name="target" value="target"/>  
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/targetEP.jsp">
    <jsp:param name="targetEP" value="targetEP"/>  
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/ranking.jsp">
    <jsp:param name="ranking" value="ranking"/>  
</jsp:include>
<jsp:include flush="true" page="/WEB-INF/page/monitor/warning.jsp">
    <jsp:param name="warning" value="warning"/>  
</jsp:include>

<style type="text/css">
li.admin-parent {
	background-color: #0e90d2;
}
li.admin-parent > a {
	color: #fff!important;
}
.admin-sidebar-sub > li > a {
	font-size: 14px;
}
.am-nav > li > a:hover,
.am-nav > li > a:focus {
  text-decoration: none;
  background-color: inherit;
}
@media only screen and (max-width: 640px) {
  .am-topbar-collapse .am-topbar-btn,
  .am-topbar-collapse .am-btn {
    display: inline-block;
    width: auto;
  }
}
@media only screen and (max-width: 640px) {
  #bg {
    float: none!important;
  }
}
@media only screen and (max-width: 640px) {
	.admin-sidebar-list a:hover, .admin-sidebar-list a:active {
	    background: #0e90d2;
	}
}
</style>

</head>
<body>
	<div class="page"></div>
	
	<script class="template monitorPage" type="text/x-jquery-tmpl">
		<header class="am-topbar am-topbar-inverse admin-header" style="background-image: url('img/top.png'); color: white;">
			<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-primary am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">登录/退出</span> <span class="am-icon-bars"></span></button>
			<div id="bg" style="float: left; padding: 25px;">
				<div style="font-weight: bold; font-size: 2.2rem;">广昌工业经济运行监测平台</div>
				<div>Guangchang Industrial Economic Operation Information Monitoring Network</div>
			</div>
			<div class="am-collapse am-topbar-collapse" id="topbar-collapse" style="margin-top: 10px;">
				<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
					{{? it.user}}
					<li class="am-dropdown" data-am-dropdown>
						<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;" style="color: white;">
							<span class="am-icon-user"></span>
							<span class="user-name">{{=it.user.name}}</span>
							<span class="am-icon-caret-down"></span>
				        </a>
				        <ul class="am-dropdown-content">
				        	<li class="logout-btn"><a href="#"><span class="am-icon-power-off"></span>退出</a></li>
				        </ul>
				    </li>
					{{??}}
					<li>
						<form class="login-form am-form-inline" role="form" action="" method="post">
							<div class="am-fl" style="margin: 4px; color: #333;">
  								<div class="am-form-group-sm am-form-icon">
									<i class="am-icon-user"></i>
    								<input type="text" class="am-form-field form-username" placeholder="请输入用户名">
  								</div>

  								<div class="am-form-group-sm am-form-icon">
									<i class="am-icon-lock"></i>
    								<input type="password" class="am-form-field form-password" placeholder="请输入密码">
  								</div>

								<div class="login-message" style="color: white;"></div>
							</div>
							<button type="submit" class="am-btn am-btn-primary" style="margin: 6px 20px 16px 0; height: 60px;">登录</button>
						</form> 
					</li>
					{{?}}
				</ul>
			</div>
		</header>	
		<div class="am-cf admin-main">
			<div class="sidebar admin-sidebar am-offcanvas" id="admin-offcanvas">
				<div class="am-offcanvas-bar admin-offcanvas-bar">
					<ul class="am-list admin-sidebar-list">

					<!-- 企业主要指标   -->
					<li class="enterpriseTarget admin-parent" auth="{{=it.user.role.resource.indexOf('monitor_enterprise_target,') > -1 ? "0" : "1"}}">
      					<a class="am-cf" data-am-collapse="{target: '#collapse-nav4'}">
					        <span class="am-icon-bar-chart"></span> 企业主要指标<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        	</a>
						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav4">
						{{ var arr = ['工业总产值', '主营业务收入', '利润总额', '税金总额', '用电量', '用气量', '国税', '地税', '应收账款', '产存品存货', '资产累计', '负债累计'];}}
						{{~ arr: item: index}}

							{{? it.user}}
								{{? it.user.role.resource.indexOf('agency_enterprise') > -1}}
									<li class="module clickable" module="targetEP" type="enterpriseTarget-{{=index+1}}" id="collapse-nav-4.{{=index+1}}">
				            			<a class="am-cf">{{=item}}及增幅图表</a>
				            		</li>
								{{??}} 
									<li class="module clickable" module="target" type="enterpriseTarget-{{=index+1}}" id="collapse-nav-4.{{=index+1}}">
				            			<a class="am-cf">{{=item}}及增幅图表</a>
				            		</li>
								{{?}}
							{{??}}
								<li class="module clickable" module="target" type="enterpriseTarget-{{=index+1}}" id="collapse-nav-4.{{=index+1}}">
				            		<a class="am-cf">{{=item}}及增幅图表</a>
				            	</li>
							{{?}}

						{{~}}
						</ul>
					</li>	

					<!-- 行业主要指标   -->
					<li class="businessTarget admin-parent" auth="{{=it.user.role.resource.indexOf('monitor_business_target,') > -1 ? "0" : "1"}}">
      					<a class="am-cf" data-am-collapse="{target: '#collapse-nav5'}">
					        <span class="am-icon-bar-chart"></span> 行业主要指标<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        	</a>
						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav5">
						{{ var arr = ['工业总产值', '主营业务收入', '利润总额', '税金总额', '用电量', '用气量', '国税', '地税', '应收账款', '产存品存货', '资产累计', '负债累计'];}}
						{{~ arr: item: index}}
							<li class="module clickable" module="target" type="businessTarget-{{=index+1}}" id="collapse-nav-5.{{=index+1}}">
				            	<a class="am-cf">{{=item}}及增幅图表</a>
				            </li>
						{{~}}
						</ul>
					</li>

					<!-- 区域主要指标   -->
					<li class="areaTarget admin-parent" auth="{{=it.user.role.resource.indexOf('monitor_area_target,') > -1 ? "0" : "1"}}">
      					<a class="am-cf" data-am-collapse="{target: '#collapse-nav6'}">
					        <span class="am-icon-bar-chart"></span> 区域主要指标<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        	</a>
						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav6">
						{{ var arr = ['工业总产值', '主营业务收入', '利润总额', '税金总额', '用电量', '用气量', '国税', '地税', '应收账款', '产存品存货', '资产累计', '负债累计'];}}
						{{~ arr: item: index}}
							<li class="module clickable" module="target" type="areaTarget-{{=index+1}}" id="collapse-nav-6.{{=index+1}}">
				            	<a class="am-cf">{{=item}}及增幅图表</a>
				            </li>
						{{~}}
						</ul>
					</li>

					<!-- 重点企业主要指标   -->
					<li class="pointEnterpriseTarget admin-parent" auth="{{=it.user.role.resource.indexOf('monitor_point_enterprise_target,') > -1 ? "0" : "1"}}">
      					<a class="am-cf" data-am-collapse="{target: '#collapse-nav7'}">
					        <span class="am-icon-bar-chart"></span> 重点企业主要指标<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        	</a>
						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav7">
						{{ var arr = ['工业总产值', '主营业务收入', '利润总额', '税金总额', '用电量', '用气量', '国税', '地税', '应收账款', '产存品存货', '资产累计', '负债累计'];}}
						{{~ arr: item: index}}
							<li class="module clickable" module="target" type="pointEnterpriseTarget-{{=index+1}}" id="collapse-nav-7.{{=index+1}}">
				            	<a class="am-cf">{{=item}}及增幅图表</a>
				           	</li>
						{{~}}
						</ul>
					</li>

					<!-- 企业预警   -->
					<li class="monitor admin-parent" auth="{{=it.user.role.resource.indexOf('monitor_warning,') > -1 ? "0" : "1"}}">
      					<a class="am-cf" data-am-collapse="{target: '#collapse-nav8'}">
					        <span class="am-icon-exclamation-triangle"></span> 企业预警<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        	</a>
						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav8">
							<li class="warning module clickable" module="warning" type="1">
				            	<a class="am-cf"><span class="am-icon-skype"></span> 企业预警信息</a>
				            </li>	
							<li class="warning module clickable" module="warning" type="2">
				            	<a class="am-cf"><span class="am-icon-skype"></span> 报表预警</a>
				            </li>
						</ul>	
					</li>	

					<!-- 积分排名   -->
					<li class="ranking admin-parent" auth="{{=it.user.role.resource.indexOf('monitor_ranking,') > -1 ? "0" : "1"}}">
      					<a class="am-cf" data-am-collapse="{target: '#collapse-nav9'}">
					        <span class="am-icon-list"></span> 积分排名<span class="am-icon-angle-right am-fr am-margin-right"></span>
			        	</a>
						<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav9">
							<li class="module clickable" module="ranking" type="1" id="collapse-nav-9.1">
				            	<a class="am-cf"><span class="am-icon-th-list"></span> 企业填报得分排名</a>
				            </li>
							<li class="module clickable" module="ranking" type="2" id="collapse-nav-9.2">
				            	<a class="am-cf"><span class="am-icon-arrow-up"></span> 工业总产值环比增幅排名</a>
				            </li>
							<li class="module clickable" module="ranking" type="3" id="collapse-nav-9.3">
				            	<a class="am-cf"><span class="am-icon-arrow-down"></span> 工业总产值环比降幅排名</a>
				            </li>
						</ul>	
					</li>
				</ul>
			</div>
		</div>
		<div class="content">
			<div class="no_auth" style="display: none; text-align: center; padding: 50px; background-color: #fff;">
				<div>
					<span class="am-icon-lg am-icon-exclamation-triangle"></span>
					<div><strong>您未登录或您没有权限查看此栏目信息</strong></div>
					<div><strong>请先 登录 或者联系管理员修改权限</strong></div>
				</div>
			</div>
		</div>
		<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	</div>
	</script>
	
	<script type="text/javascript">
	;(function($) {
		
		// set session
		<% 
			Gson gson = new Gson();
			BaseUserEntity user = (BaseUserEntity) session.getAttribute("cur_user");
			String str = gson.toJson(user);
		%>
		var user = JSON.parse('<%=str%>');
		$k.user.set(user);
		if (!user) {
			window.location.href = "./login?redirect=monitor";
			return;
		}
		
		var $page = $(".page");
		var $content, $sidebar, $form;
		
		$page.html($(".template.monitorPage").doT({
			user: user
		}));
		
		$sidebar = $page.find(".sidebar");
		$content = $page.find(".content");
		$form = $page.find(".login-form");
		
		init($content);
		$k.util.datatableDefaults();
		
		// form submit
		$form.submit(function(e) {
			var username = $form.find(".form-username").val();
			var password = $form.find(".form-password").val();
			if (username == "" || password == "") {
				return;
			}
			
			$.ajax({
				url: 'account/login',
				type: "POST",
				data:{
					username: username,
					password: $k.util.encrptByDES(password),
				},
				success: function(data) {
					switch (data.status) {
					case 0:
						window.location.href = "./monitor";
						break;
					case 2:
						$page.find(".login-message").text("用户名不存在！");
						break;
					case 11:
						$page.find(".login-message").text("密码错误！");
						break;
					case 13:
						$page.find(".login-message").text("用户已被禁用！");
						break;
					default:
						break;
					}
				},
				error: function() {}
			});
			return false;
		});
		
		$page
		.on("click", ".sidebar .module", function() {
			var moduleName = $(this).attr("module");
			var user = $k.user.get();
			var auth = $(this).closest("ul").parent().attr("auth");
			if (user) {
				if (auth == 0) {
					var type = $(this).attr('type');
					if (type) {
						$k.page[moduleName].draw(type).load();
					} else {
						$k.page[moduleName].draw().load();
					}
					
					$content.find(".modulePage").hide();
					$content.find('.no_auth').hide()
					$content.find('.' + moduleName + 'Page').show();
				} else {
					$content.find(".modulePage").hide();
					$content.find('.no_auth').show();
					return;
				}
			} else {
				$content.find(".modulePage").hide();
				$content.find('.no_auth').show();
			}
			/* if ($(this).hasClass("auth")) {
				if (user) {
					var type = $(this).attr('type');
					if (type) {
						$k.page[moduleName].draw(type).load();
					} else {
						$k.page[moduleName].draw().load();
					}
					
					$content.find(".modulePage").hide();
					$content.find('.' + moduleName + 'Page').show();
				} else {
					$content.find(".modulePage").hide();
					$content.find('.no_auth').show();
				}
			} else {
				var type = $(this).attr('type');
				if (type) {
					$k.page[moduleName].draw(type).load();
				} else {
					$k.page[moduleName].draw().load();
				}
				
				$content.find('.no_auth').hide();
				$content.find(".modulePage").hide();
				$content.find('.' + moduleName + 'Page').show();
			} */
			
			menuChange(this);
			$page.find("#admin-offcanvas").offCanvas('close')
		})
		.on("click", ".logout-btn", function() {
			$.ajax({
				url: "account/logout",
				type: "POST",
				data: { 
					userId: $k.user.get().id 
				},
				success: function(data) {
					if (data.status == 0) {
						window.location.href = "./monitor";
					}
					$k.user.logout();
				},
				error: function(err) {}
			});
		})
		.on("click", ".testBtn", function() {
			alert("11");
		});
		
		function menuChange(obj){
			<!-- 点击左侧菜单样式   -->
			var $menuli = $(obj)
			var $adminParent = $(".admin-parent");
			$adminParent.find("ul").find("li").find("a").removeClass("am-active");
			$(".admin-parent a").addClass("am-collapsed");
			$(".admin-parent ul").removeClass("am-in");
			$(".admin-parent ul").addClass("am-collapse");
			$(".admin-parent ul").css("height","0px");
			
			$menuli.find('a').addClass("am-active");
			$(".am-active").parent().parent().addClass("am-in");
			$(".am-active").parent().parent().css("height","auto")
		}
		
		function init($content) {
			$('<div class="targetPage modulePage"></div>').appendTo($content);
			$k.page.target = new $k.proto.Target().init($content.find(".targetPage"));
			
			$('<div class="targetEPPage modulePage"></div>').appendTo($content);
			$k.page.targetEP = new $k.proto.TargetEP().init($content.find(".targetEPPage"));
			
			$('<div class="rankingPage modulePage"></div>').appendTo($content);
			$k.page.ranking = new $k.proto.Ranking().init($content.find(".rankingPage"));
			
			$('<div class="warningPage modulePage"></div>').appendTo($content);
			$k.page.warning = new $k.proto.Warning().init($content.find(".warningPage"));
		}
		
		// init UI
		$page.find('li.module[type="enterpriseTarget-1"]').trigger('click');
		
	})(jQuery);
	</script>
	
</body>
</html>