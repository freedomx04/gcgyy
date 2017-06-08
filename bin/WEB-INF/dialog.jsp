<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- alert模态窗口  -->
<script class="template AlertDialog" type="text/x-jquery-tmpl">
<div class="am-modal-dialog">
	<div class="am-modal-bd">{{=it.content}}</div>
	<div class="am-modal-footer">
		<span class="am-modal-btn" data-am-modal-confirm>确定</span>
	</div>
</div>
</script>
<script class="template ConfirmDialog" type="text/x-jquery-tmpl">
<div class="am-modal-dialog">
	<div class="am-modal-hd">{{=it.title}}</div>
	<div class="am-modal-bd">{{=it.content}}</div>
	<div class="am-modal-footer">
		<span class="am-modal-btn" data-am-modal-cancel>取消</span>
		<span class="am-modal-btn" data-am-modal-confirm>确定</span>
	</div>
</div>
</script>
