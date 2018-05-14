<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>诉求详情</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/constant.js"></script>
	<script src="${ctx}/plugins/wx/select.js"></script>
	
	<style type="text/css">
		.weui_cell_bd {
			min-width: 5em;
		}
		.weui_cell_ft {
			word-break: break-all;
		}
		.enterprise-info {
			margin-right: 0;
		}
	</style>
	
</head>

<body class="wx-appeal-info">
	<div class="weui-weixin_ui">
		
		<div class="weui_cells">
			<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>诉求标题</p>
	            </div>
	            <div class="weui_cell_ft appeal-info" data-appeal-id="${appeal.id}">${appeal.title}</div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>诉求企业</p>
	            </div>
	            <div class="weui_cell_ft">
	            	<a class="weui-weixin-a enterprise-info" href="javascript:;" data-enterprise-id="${appeal.enterprise.id}">${appeal.enterprise.name}</a>
	            </div>
        	</div>
		</div>
		
		<div class="weui_cells">
			<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>诉求类型</p>
	            </div>
	            <div class="weui_cell_ft">${appeal.appealType.name}</div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>状态</p>
	            </div>
	            <div class="weui_cell_ft appeal-status" data-appeal-status="${appeal.status}"></div>
        	</div>
        	<c:if test="${appeal.department != null}">
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>受理部门</p>
	            </div>
	            <div class="weui_cell_ft">${appeal.department.name}</div>
        	</div>
        	</c:if>
		</div>
		
		<c:if test="${appeal.status == 5}">
		<div class="weui_cells">
			<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>受理速度</p>
	            </div>
	            <div class="weui_cell_ft">
	            	<c:forEach begin="1" end="${appeal.evaluate.acceptSpeed}">
					<span class="icon icon-48"></span>
		    	    </c:forEach>
		    	    <c:forEach begin="1" end="${5 - appeal.evaluate.acceptSpeed}">
					<span class="icon icon-49"></span>
		    	    </c:forEach>
	            </div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>办结速度</p>
	            </div>
	            <div class="weui_cell_ft">
	            	<c:forEach begin="1" end="${appeal.evaluate.processSpeed}">
					<span class="icon icon-48"></span>
		    	    </c:forEach>
		    	    <c:forEach begin="1" end="${5 - appeal.evaluate.processSpeed}">
					<span class="icon icon-49"></span>
		    	    </c:forEach>
	            </div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>办结结果</p>
	            </div>
	            <div class="weui_cell_ft">
	            	<c:forEach begin="1" end="${appeal.evaluate.result}">
					<span class="icon icon-48"></span>
		    	    </c:forEach>
		    	    <c:forEach begin="1" end="${5 - appeal.evaluate.result}">
					<span class="icon icon-49"></span>
		    	    </c:forEach>
	            </div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>评价详情</p>
	            </div>
        	</div>
            <div style="margin-left: 1em; color: #888;">
            	${appeal.evaluate.evaluation}
            </div>
		</div>
		</c:if>
		
		
		<div class="weui_cells">
			<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>发起时间</p>
	            </div>
	            <div class="weui_cell_ft">
					<fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/>
				</div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>派单时间</p>
	            </div>
	            <div class="weui_cell_ft">
	            	<fmt:formatDate value="${appeal.dispatchTime}" pattern="yyyy-MM-dd HH:mm"/>
	            </div>
        	</div>
        	<div class="weui_cell">
	            <div class="weui_cell_bd weui_cell_primary">
	                <p>受理时间</p>
	            </div>
	            <div class="weui_cell_ft">
	            	<fmt:formatDate value="${appeal.acceptTime}" pattern="yyyy-MM-dd HH:mm"/>
	            </div>
        	</div>
		</div>
		
		<div class="weui_cells">
			<div class="weui_cell">
			    <div class="weui_cell_bd weui_cell_primary">
	                <p>诉求详情</p>
	            </div>
		    </div>
            <div style="margin-left: 1em; color: #888;">
            	${appeal.description}
            </div>
		</div>
		
		<div class="weui_cells">
			<div class="weui_cell">
			    <div class="weui_cell_bd weui_cell_primary">
	                <a href="javascript:;" class="open-popup" data-target="#popup">催办详细</a>
	            </div>
	            <div class="weui_cell_ft">
	            </div>
		    </div>
		</div>
		
		<c:if test="${role == 'ep'}">
    	<div class="weui_btn_area weui_btn_area_inline">
	        <button class="weui_btn weui_btn_primary btn-appeal-send">发送</button>
	        <button class="weui_btn weui_btn_primary btn-appeal-urge">催办</button>
	        <button class="weui_btn weui_btn_primary btn-appeal-confirm">确认办结</button>
        </div>
        </c:if>
        
        <c:if test="${role == 'gv'}">
        <div class="weui_btn_area weui_btn_area_inline">
	        <button class="weui_btn weui_btn_primary btn-appeal-reject">驳回</button>
	        <button class="weui_btn weui_btn_primary btn-appeal-accept">确认受理</button>
	        <button class="weui_btn weui_btn_primary btn-appeal-handle">办结</button>
        </div>
        </c:if>
		
		<c:if test="${role == 'dispatcher'}">
		<div class="weui_btn_area weui_btn_area_inline">
	        <button class="weui_btn weui_btn_primary btn-appeal-dispatch">派单</button>
	        <button class="weui_btn weui_btn_primary btn-appeal-reject">驳回</button>
        </div>
        </c:if>
		
	</div>
	
	
	<div id="popup" class="weui-popup-container">
		<div class="weui-popup-modal">
			<div class="page-bd wx-electricity-list">  
				<ul>
					<c:if test="${empty appeal.urges}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="urge" items="${appeal.urges}">
						<li style="background-color: #efeff4;">
							<div class="weui-flex js-category">
								<p class="weui-flex-item">${urge.user.name}</p>
								<p><fmt:formatDate value="${urge.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
								<i class="icon icon-74"></i>
							</div>
							<div class="page-category js-categoryInner">
								<div class="weui_cells weui_cells_access" style="margin-top: 0px;">
						            <div class="weui_cell" style="background-color: #efeff4;">
						            	${urge.content}
						            </div>
								</div>
					        </div>
					    </li>
					</c:forEach>
				</ul>
			</div>
	  		<p class='page-bd-15'><a href="javascript:;" class="weui_btn weui_btn_plain_primary close-popup" id="p1">关闭</a></p>
		</div>
	 </div> 
	
	<script type="text/javascript">
	$(function() {
		var $page = $(".wx-appeal-info");
		var $appealStatus = $page.find(".appeal-status");
		var $sendBtn = $page.find(".btn-appeal-send");
		var $urgeBtn = $page.find(".btn-appeal-urge");
		var $confirmBtn = $page.find(".btn-appeal-confirm");
		var $appealStatus = $page.find(".appeal-status");
		var $rejectBtn = $page.find(".btn-appeal-reject");
		var $handleBtn = $page.find(".btn-appeal-handle");
		var $acceptBtn = $page.find(".btn-appeal-accept");
		var $dispatchBtn = $page.find(".btn-appeal-dispatch");
		var appealId = parseInt($page.find(".appeal-info").data('appealId'));
		
		var appealStatus = $appealStatus.data('appealStatus');
		$appealStatus.text($k.constant.getAppealStatus(appealStatus));
		$page.find(".weui_btn").removeAttr("disabled");
		if ("${role}" == "ep") {
			if(appealStatus == 0) {
				$urgeBtn.addClass("weui_btn_disabled").attr("disabled", "true");
				$confirmBtn.addClass("weui_btn_disabled").attr("disabled", "true");
			} else if(appealStatus == 1 || appealStatus == 2 || appealStatus == 3) {
				$sendBtn.addClass("weui_btn_disabled").attr("disabled", "true");
				$confirmBtn.addClass("weui_btn_disabled").attr("disabled", "true");
			} else if(appealStatus == 4) {
				$sendBtn.addClass("weui_btn_disabled").attr("disabled", "true");
				$urgeBtn.addClass("weui_btn_disabled").attr("disabled", "true");
			} else if(appealStatus == 5 || appealStatus == 6) {
				$page.find(".weui_btn").addClass("weui_btn_disabled").attr("disabled", "true");
			}
		} else if ("${role}" == "gv") {
			if(appealStatus == 1) {
				$page.find(".weui_btn").addClass("weui_btn_disabled").attr("disabled", "true");
				$rejectBtn.removeClass("weui_btn_disabled").removeAttr("disabled");
			} else if(appealStatus == 2) {
				$handleBtn.addClass("weui_btn_disabled").attr("disabled", "true");
			} else if(appealStatus == 3) {
				$rejectBtn.addClass("weui_btn_disabled").attr("disabled", "true");
				$acceptBtn.addClass("weui_btn_disabled").attr("disabled", "true");
			} else if(appealStatus == 4 || appealStatus == 5 || appealStatus == 6) {
				$page.find(".weui_btn").addClass("weui_btn_disabled").attr("disabled", "true");
			}
		} else if ("${role}" == "dispatcher") {
			if(appealStatus == 2 || appealStatus == 3) {
				$dispatchBtn.addClass("weui_btn_disabled").attr("disabled", "true");
				$rejectBtn.addClass("weui_btn_disabled").attr("disabled", "true");
			} else if(appealStatus == 1) {
				$dispatchBtn.removeClass("weui_btn_disabled").removeAttr("disabled");
				$rejectBtn.removeClass("weui_btn_disabled").removeAttr("disabled");
			} else if(appealStatus == 4 || appealStatus == 5 || appealStatus == 6) {
				$page.find(".weui_btn").addClass("weui_btn_disabled").attr("disabled", "true");
			}
		}
		
		$page
		.on('.js-category', "click", function(){
			$parent = $(this).parent('li');
			if($parent.hasClass('js-show')){
				$parent.removeClass('js-show');
				$(this).children('i').removeClass('icon-35').addClass('icon-74');
			}else{
				$parent.siblings().removeClass('js-show');
				$parent.addClass('js-show');
				$(this).children('i').removeClass('icon-74').addClass('icon-35');
				$parent.siblings().find('i').removeClass('icon-35').addClass('icon-74');
			}
		})
		
		.on("click", ".btn-appeal-send", function() {
			var $this = $(this);
	        $.confirm("您确定要发送给派单员吗?", "确认发送?", function() {
	        	$.ajax({
					url: "${ctx}/appeal/send",
					type: "POST",
					data: {
						appealId: appealId,
					},
					success: function(data) {
						if(data.status=="0"){
							$.toast("发送成功!");
							setTimeout(function () {
								window.location = '${ctx}/wx/appealCenter/appealinfo?appealId=' + appealId + "&role=${role}&userId=${userId}";
							}, 1000);
						}
					},
					error: function(err) {}
				});
	        }, function() {
	        });
      	})
      	
      	.on("click", ".btn-appeal-accept", function() {
			var $this = $(this);
	        $.confirm("您确定要受理该诉求吗?", "确认受理?", function() {
	        	$.ajax({
					url: "${ctx}/appeal/accept",
					type: "POST",
					data: {
						appealId: appealId,
					},
					success: function(data) {
						if(data.status=="0"){
							$.toast("受理成功!");
							setTimeout(function () {
								window.location = '${ctx}/wx/appealCenter/appealinfo?appealId=' + appealId + "&role=${role}&userId=${userId}";
							}, 1000);
						}
					},
					error: function(err) {}
				});
	        }, function() {
	        });
      	})
      	
      	.on("click", ".btn-appeal-handle", function() {
			var $this = $(this);
	        $.confirm("您确定要办结该诉求吗?", "确认办结?", function() {
	        	$.ajax({
					url: "${ctx}/appeal/handle",
					type: "POST",
					data: {
						appealId: appealId,
					},
					success: function(data) {
						if(data.status=="0"){
							$.toast("办结成功!");
							setTimeout(function () {
								window.location = '${ctx}/wx/appealCenter/appealinfo?appealId=' + appealId + "&role=${role}&userId=${userId}";
							}, 1000);
						}
					},
					error: function(err) {}
				});
	        }, function() {
	        });
      	})
      	
      	.on("click", ".btn-appeal-urge", function() {
      		window.location = '${ctx}/wx/appealCenter/urge?appealId=' + appealId + "&role=${role}&userId=${userId}";
      	})
      	
      	.on("click", ".btn-appeal-confirm", function() {
      		window.location = '${ctx}/wx/appealCenter/confirm?appealId=' + appealId + "&role=${role}&userId=${userId}";
      	})
      	
      	.on("click", ".btn-appeal-reject", function() {
      		window.location = '${ctx}/wx/appealCenter/reject?appealId=' + appealId + "&role=${role}&userId=${userId}";
      	})
      	
      	.on("click", ".btn-appeal-dispatch", function() {
      		window.location.href = '${ctx}/wx/appealCenter/dispatch?appealId=' + appealId + "&role=${role}&userId=${userId}";
      	})
      	
      	.on("click", ".js-category", function(){
    		$parent = $(this).parent('li');
    		if($parent.hasClass('js-show')){
    			$parent.removeClass('js-show');
    			$(this).children('i').removeClass('icon-35').addClass('icon-74');
    		}else{
    			$parent.siblings().removeClass('js-show');
    			$parent.addClass('js-show');
    			$(this).children('i').removeClass('icon-74').addClass('icon-35');
    			$parent.siblings().find('i').removeClass('icon-35').addClass('icon-74');
    		}
    	});
	});
	
	</script>
	
</body>
</html>