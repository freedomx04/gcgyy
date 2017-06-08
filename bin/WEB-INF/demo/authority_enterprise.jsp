<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>企业</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="enterpriseMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">企业新增(enterprise/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>imagePath:</td><td><input type="text" class="add-imagePath"/></td></tr>
						<tr><td>name:</td><td><input type="text" class="add-name"/></td></tr>
						<tr><td>introduction:</td><td><input type="text" class="add-introduction"/></td></tr>
						<tr><td>areaId:</td><td><input type="text" class="add-areaId"/></td></tr>
						<tr><td>productTypeId:</td><td><input type="text" class="add-productTypeId"/></td></tr>
						<tr><td>mainProduct:</td><td><input type="text" class="add-mainProduct"/></td></tr>
						<tr><td>productionTime:</td><td><input type="text" class="add-productionTime datepicker"/></td></tr>
						<tr><td>principal:</td><td><input type="text" class="add-principal"/></td></tr>
						<tr><td>telephone:</td><td><input type="text" class="add-telephone"/></td></tr>
						<tr><td>address:</td><td><input type="text" class="add-address"/></td></tr>
						<tr><td>representative:</td><td><input type="text" class="add-representative"/></td></tr>
						<tr><td>shareholder:</td><td><input type="text" class="add-shareholder"/></td></tr>
						<tr><td>registeredCapital:</td><td><input type="text" class="add-registeredCapital"/></td></tr>
						<tr><td>alterRecording:</td><td><input type="text" class="add-alterRecording"/></td></tr>
						<tr><td>pointUserId:</td><td><input type="text" class="add-pointUserId"/></td></tr>
						<tr><td>pointUserTel:</td><td><input type="text" class="add-pointUserTel"/></td></tr>
						<tr><td>pointStatus:</td><td><input type="text" class="add-pointStatus"/></td></tr>
						<tr><td>nationalTaxNumber:</td><td><input type="text" class="add-nationalTaxNumber"/></td></tr>
						<tr><td>nationalTaxUser:</td><td><input type="text" class="add-nationalTaxUser"/></td></tr>
						<tr><td>localTaxNumber:</td><td><input type="text" class="add-localTaxNumber"/></td></tr>
						<tr><td>localTaxUser:</td><td><input type="text" class="add-localTaxUser"/></td></tr>
						<tr><td colspan="2"><input type="button" class="add-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="add-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="edit">
		<label class="font-bold">企业编辑(enterprise/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="edit-enterpriseId"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="edit-imagePath"/></td></tr>
						<tr><td>name:</td><td><input type="text" class="edit-name"/></td></tr>
						<tr><td>introduction:</td><td><input type="text" class="edit-introduction"/></td></tr>
						<tr><td>areaId:</td><td><input type="text" class="edit-areaId"/></td></tr>
						<tr><td>productTypeId:</td><td><input type="text" class="edit-productTypeId"/></td></tr>
						<tr><td>mainProduct:</td><td><input type="text" class="edit-mainProduct"/></td></tr>
						<tr><td>productionTime:</td><td><input type="text" class="edit-productionTime datepicker"/></td></tr>
						<tr><td>principal:</td><td><input type="text" class="edit-principal"/></td></tr>
						<tr><td>telephone:</td><td><input type="text" class="edit-telephone"/></td></tr>
						<tr><td>address:</td><td><input type="text" class="edit-address"/></td></tr>
						<tr><td>representative:</td><td><input type="text" class="edit-representative"/></td></tr>
						<tr><td>shareholder:</td><td><input type="text" class="edit-shareholder"/></td></tr>
						<tr><td>registeredCapital:</td><td><input type="text" class="edit-registeredCapital"/></td></tr>
						<tr><td>alterRecording:</td><td><input type="text" class="edit-alterRecording"/></td></tr>
						<tr><td>pointUserId:</td><td><input type="text" class="edit-pointUserId"/></td></tr>
						<tr><td>pointUserTel:</td><td><input type="text" class="edit-pointUserTel"/></td></tr>
						<tr><td>pointStatus:</td><td><input type="text" class="edit-pointStatus"/></td></tr>
						<tr><td>nationalTaxNumber:</td><td><input type="text" class="edit-nationalTaxNumber"/></td></tr>
						<tr><td>nationalTaxUser:</td><td><input type="text" class="edit-nationalTaxUser"/></td></tr>
						<tr><td>localTaxNumber:</td><td><input type="text" class="edit-localTaxNumber"/></td></tr>
						<tr><td>localTaxUser:</td><td><input type="text" class="edit-localTaxUser"/></td></tr>
						<tr><td colspan="2"><input type="button" class="edit-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="edit-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="delete">
		<label class="font-bold">企业删除(enterprise/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseIds:</td><td><input type="text" class="delete-enterpriseIds"/></td></tr>
						<tr><td colspan="2"><input type="button" class="delete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="delete-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listBase">
		<label class="font-bold">企业列表_基本信息(enterprise/listBase)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="listBase-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listBase-textarea" style="width: 600px; height: 600px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="list">
		<label class="font-bold">企业列表(enterprise/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="list-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="list-textarea" style="width: 600px; height: 600px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listPaging">
		<label class="font-bold">企业列表分页(enterprise/listPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>page:</td><td><input type="text" class="listPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listPaging-textarea" style="width: 600px; height: 600px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="detail">
		<label class="font-bold">企业详情(enterprise/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="detail-enterpriseId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="detail-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="detail-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="getEnterpriseByUserId">
		<label class="font-bold">根据用户ID获取企业列表(enterprise/getEnterpriseByUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="getEnterpriseByUserId-userId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="getEnterpriseByUserId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="getEnterpriseByUserId-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByPointUserId">
		<label class="font-bold">根据挂点人ID获取企业列表(enterprise/listByPointUserId)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>pointUserId:</td><td><input type="text" class="listByPointUserId-pointUserId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByPointUserId-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByPointUserId-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByPointUserIdPaging">
		<label class="font-bold">根据挂点人ID获取企业列表分页(enterprise/listByPointUserIdPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>pointUserId:</td><td><input type="text" class="listByPointUserIdPaging-pointUserId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByPointUserIdPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByPointUserIdPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="listByPointUserIdPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByPointUserIdPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listPointEnterprise">
		<label class="font-bold">重点企业列表(enterprise/listPointEnterprise)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="listPointEnterprise-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listPointEnterprise-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="productAdd">
		<label class="font-bold">企业产品新增(enterprise/product/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="productAdd-enterpriseId"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="productAdd-imagePath"/></td></tr>
						<tr><td>name:</td><td><input type="text" class="productAdd-name"/></td></tr>
						<tr><td>introduction:</td><td><input type="text" class="productAdd-introduction"/></td></tr>
						<tr><td>specification:</td><td><input type="text" class="productAdd-specification"/></td></tr>
						<tr><td>telephone:</td><td><input type="text" class="productAdd-telephone"/></td></tr>
						<tr><td colspan="2"><input type="button" class="productAdd-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="productAdd-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="productEdit">
		<label class="font-bold">企业产品编辑(enterprise/product/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>productId:</td><td><input type="text" class="productEdit-productId"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="productEdit-imagePath"/></td></tr>
						<tr><td>name:</td><td><input type="text" class="productEdit-name"/></td></tr>
						<tr><td>introduction:</td><td><input type="text" class="productEdit-introduction"/></td></tr>
						<tr><td>specification:</td><td><input type="text" class="productEdit-specification"/></td></tr>
						<tr><td>telephone:</td><td><input type="text" class="productEdit-telephone"/></td></tr>
						<tr><td colspan="2"><input type="button" class="productEdit-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="productEdit-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="productDelete">
		<label class="font-bold">企业产品删除(enterprise/product/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>productIds:</td><td><input type="text" class="productDelete-productIds"/></td></tr>
						<tr><td colspan="2"><input type="button" class="productDelete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="productDelete-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="productList">
		<label class="font-bold">企业产品列表(enterprise/product/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="productList-enterpriseId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="productList-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="productList-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="productListPaging">
		<label class="font-bold">企业产品列表分页(enterprise/product/listPaing)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="productListPaging-enterpriseId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="productListPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="productListPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="productListPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="productListPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="productDetail">
		<label class="font-bold">产品列表详情（enterprise/product/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>productId:</td><td><input type="text" class="productDetail-productId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="productDetail-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="productDetail-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="productListAll">
		<label class="font-bold">获取所有产品列表(enterprise/product/listAll)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td colspan="2"><input type="button" class="productListAll-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="productListAll-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="productListAllPaging">
		<label class="font-bold">获取所有产品列表分页(enterprise/product/listAllPaing)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>page:</td><td><input type="text" class="productListAllPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="productListAllPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="productListAllPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="productListAllPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="newsAdd">
		<label class="font-bold">企业新闻新增(enterprise/news/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="newsAdd-enterpriseId"/></td></tr>
						<tr><td>title:</td><td><input type="text" class="newsAdd-title"/></td></tr>
						<tr><td>allHtml:</td><td><input type="text" class="newsAdd-allHtml"/></td></tr>
						<tr><td colspan="2"><input type="button" class="newsAdd-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="newsAdd-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="newsEdit">
		<label class="font-bold">企业新闻编辑(enterprise/news/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>newsId:</td><td><input type="text" class="newsEdit-newsId"/></td></tr>
						<tr><td>title:</td><td><input type="text" class="newsEdit-title"/></td></tr>
						<tr><td>allHtml:</td><td><input type="text" class="newsEdit-allHtml"/></td></tr>
						<tr><td colspan="2"><input type="button" class="newsEdit-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="newsEdit-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="newsDelete">
		<label class="font-bold">企业新闻删除(enterprise/news/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>newsIds:</td><td><input type="text" class="newsDelete-newsIds"/></td></tr>
						<tr><td colspan="2"><input type="button" class="newsDelete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="newsDelete-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="newsList">
		<label class="font-bold">企业新闻列表(enterprise/news/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="newsList-enterpriseId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="newsList-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="newsList-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="newsListPaging">
		<label class="font-bold">企业新闻列表分页(enterprise/news/listPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>enterpriseId:</td><td><input type="text" class="newsListPaging-enterpriseId"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="newsListPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="newsListPaging-size"/></td></tr>
						<tr><td colspan="2"><input type="button" class="newsListPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="newsListPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="newsDetail">
		<label class="font-bold">企业新闻详情(enterprise/news/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>newsId:</td><td><input type="text" class="newsDetail-newsId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="newsDetail-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="newsDetail-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			$(".enterpriseMgr").find(".datepicker").datepicker();
			
			var $add = $(".enterpriseMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "enterprise/add",
					type: "POST",
					data: {
						imagePath: $add.find(".add-imagePath").val(),
						name: $add.find(".add-name").val(),
						introduction: $add.find(".add-introduction").val(),
						areaId: $add.find(".add-areaId").val(),
						productTypeId: $add.find(".add-productTypeId").val(),
						mainProduct: $add.find(".add-mainProduct").val(),
						productionTime: strToDate($add.find(".add-productionTime").val()),
						principal: $add.find(".add-principal").val(),
						telephone: $add.find(".add-telephone").val(),
						address: $add.find(".add-address").val(),
						representative: $add.find(".add-representative").val(),
						shareholder: $add.find(".add-shareholder").val(),
						registeredCapital: $add.find(".add-registeredCapital").val(),
						alterRecording: $add.find(".add-alterRecording").val(),
						pointUserId: $add.find(".add-pointUserId").val(),
						pointUserTel: $add.find(".add-pointUserTel").val(),
						pointStatus: $add.find(".add-pointStatus").val(),
						nationalTaxNumber: $edit.find(".add-nationalTaxNumber").val(),
						nationalTaxUser: $edit.find(".add-nationalTaxUser").val(),
						localTaxNumber: $edit.find(".add-localTaxNumber").val(),
						localTaxUser: $edit.find(".add-localTaxUser").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".enterpriseMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "enterprise/edit",
					type: "POST",
					data: {
						enterpriseId: $edit.find(".edit-enterpriseId").val(),
						imagePath: $edit.find(".edit-imagePath").val(),
						name: $edit.find(".edit-name").val(),
						introduction: $edit.find(".edit-introduction").val(),
						areaId: $edit.find(".edit-areaId").val(),
						productTypeId: $edit.find(".edit-productTypeId").val(),
						mainProduct: $edit.find(".edit-mainProduct").val(),
						productionTime: strToDate($edit.find(".edit-productionTime").val()),
						principal: $edit.find(".edit-principal").val(),
						telephone: $edit.find(".edit-telephone").val(),
						address: $edit.find(".edit-address").val(),
						representative: $edit.find(".edit-representative").val(),
						shareholder: $edit.find(".edit-shareholder").val(),
						registeredCapital: $edit.find(".edit-registeredCapital").val(),
						alterRecording: $edit.find(".edit-alterRecording").val(),
						pointUserId: $edit.find(".edit-pointUserId").val(),
						pointUserTel: $edit.find(".edit-pointUserTel").val(),
						pointStatus: $edit.find(".edit-pointStatus").val(),
						nationalTaxNumber: $edit.find(".edit-nationalTaxNumber").val(),
						nationalTaxUser: $edit.find(".edit-nationalTaxUser").val(),
						localTaxNumber: $edit.find(".edit-localTaxNumber").val(),
						localTaxUser: $edit.find(".edit-localTaxUser").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".enterpriseMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "enterprise/delete",
					type: "POST",
					data: {
						enterpriseIds: $delete.find(".delete-enterpriseIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listBase = $(".enterpriseMgr .listBase");
			$listBase.on("click", ".listBase-btn", function() {
				$.ajax({
					url: "enterprise/listBase",
					type: "POST",
					success: function(data) {
						$listBase.find(".listBase-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listBase.find(".listBase-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".enterpriseMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "enterprise/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPaging = $(".enterpriseMgr .listPaging");
			$listPaging.on("click", ".listPaging-btn", function() {
				$.ajax({
					url: "enterprise/listPaging",
					type: "POST",
					data: {
						page: $listPaging.find(".listPaging-page").val(),
						size: $listPaging.find(".listPaging-size").val(),
					},
					success: function(data) {
						$listPaging.find(".listPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listPaging.find(".listPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".enterpriseMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "enterprise/detail",
					type: "POST",
					data: {
						enterpriseId: $detail.find(".detail-enterpriseId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $getEnterpriseByUserId = $(".enterpriseMgr .getEnterpriseByUserId");
			$getEnterpriseByUserId.on("click", ".getEnterpriseByUserId-btn", function() {
				$.ajax({
					url: "enterprise/getEnterpriseByUserId",
					type: "POST",
					data: {
						userId: $getEnterpriseByUserId.find(".getEnterpriseByUserId-userId").val()
					},
					success: function(data) {
						$getEnterpriseByUserId.find(".getEnterpriseByUserId-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$getEnterpriseByUserId.find(".getEnterpriseByUserId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByPointUserId = $(".enterpriseMgr .listByPointUserId");
			$listByPointUserId.on("click", ".listByPointUserId-btn", function() {
				$.ajax({
					url: "enterprise/listByPointUserId",
					type: "POST",
					data: {
						pointUserId: $listByPointUserId.find(".listByPointUserId-pointUserId").val()
					},
					success: function(data) {
						$listByPointUserId.find(".listByPointUserId-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByPointUserId.find(".listByPointUserId-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByPointUserIdPaging = $(".enterpriseMgr .listByPointUserIdPaging");
			$listByPointUserIdPaging.on("click", ".listByPointUserIdPaging-btn", function() {
				$.ajax({
					url: "enterprise/listByPointUserIdPaging",
					type: "POST",
					data: {
						pointUserId: $listByPointUserIdPaging.find(".listByPointUserIdPaging-pointUserId").val(),
						page: $listByPointUserIdPaging.find(".listByPointUserIdPaging-page").val(),
						size: $listByPointUserIdPaging.find(".listByPointUserIdPaging-size").val(),
					},
					success: function(data) {
						$listByPointUserIdPaging.find(".listByPointUserIdPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByPointUserIdPaging.find(".listByPointUserIdPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPointEnterprise = $(".enterpriseMgr .listPointEnterprise");
			$listPointEnterprise.on("click", ".listPointEnterprise-btn", function() {
				$.ajax({
					url: "enterprise/listPointEnterprise",
					type: "POST",
					success: function(data) {
						$listPointEnterprise.find(".listPointEnterprise-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listPointEnterprise.find(".listPointEnterprise-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $productAdd = $(".enterpriseMgr .productAdd");
			$productAdd.on("click", ".productAdd-btn", function() {
				$.ajax({
					url: "enterprise/product/add",
					type: "POST",
					data: {
						enterpriseId: $productAdd.find(".productAdd-enterpriseId").val(),
						imagePath: $productAdd.find(".productAdd-imagePath").val(),
						name: $productAdd.find(".productAdd-name").val(),
						introduction: $productAdd.find(".productAdd-introduction").val(),
						specification: $productAdd.find(".productAdd-specification").val(),
						telephone: $productAdd.find(".productAdd-telephone").val(),
					},
					success: function(data) {
						$productAdd.find(".productAdd-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$productAdd.find(".productAdd-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $productEdit = $(".enterpriseMgr .productEdit");
			$productEdit.on("click", ".productEdit-btn", function() {
				$.ajax({
					url: "enterprise/product/edit",
					type: "POST",
					data: {
						productId: $productEdit.find(".productEdit-productId").val(),
						imagePath: $productEdit.find(".productEdit-imagePath").val(),
						name: $productEdit.find(".productEdit-name").val(),
						introduction: $productEdit.find(".productEdit-introduction").val(),
						specification: $productEdit.find(".productEdit-specification").val(),
						telephone: $productEdit.find(".productEdit-telephone").val(),
					},
					success: function(data) {
						$productEdit.find(".productEdit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$productEdit.find(".productEdit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $productDelete = $(".enterpriseMgr .productDelete");
			$productDelete.on("click", ".productDelete-btn", function() {
				$.ajax({
					url: "enterprise/product/delete",
					type: "POST",
					data: {
						productIds: $productDelete.find(".productDelete-productIds").val()
					},
					success: function(data) {
						$productDelete.find(".productDelete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$productDelete.find(".productDelete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $productList = $(".enterpriseMgr .productList");
			$productList.on("click", ".productList-btn", function() {
				$.ajax({
					url: "enterprise/product/list",
					type: "POST",
					data: {
						enterpriseId: $productList.find(".productList-enterpriseId").val()
					},
					success: function(data) {
						$productList.find(".productList-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$productList.find(".productList-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $productListPaging = $(".enterpriseMgr .productListPaging");
			$productListPaging.on("click", ".productListPaging-btn", function() {
				$.ajax({
					url: "enterprise/product/listPaging",
					type: "POST",
					data: {
						enterpriseId: $productListPaging.find(".productListPaging-enterpriseId").val(),
						page: $productListPaging.find(".productListPaging-page").val(),
						size: $productListPaging.find(".productListPaging-size").val(),
					},
					success: function(data) {
						$productListPaging.find(".productListPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$productListPaging.find(".productListPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $productDetail = $(".enterpriseMgr .productDetail");
			$productDetail.on("click", ".productDetail-btn", function() {
				$.ajax({
					url: "enterprise/product/detail",
					type: "POST",
					data: {
						productId: $productDetail.find(".productDetail-productId").val()
					},
					success: function(data) {
						$productDetail.find(".productDetail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$productDetail.find(".productDetail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $productListAll = $(".enterpriseMgr .productListAll");
			$productListAll.on("click", ".productListAll-btn", function() {
				$.ajax({
					url: "enterprise/product/listAll",
					type: "POST",
					success: function(data) {
						$productListAll.find(".productListAll-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$productListAll.find(".productListAll-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $productListAllPaging = $(".enterpriseMgr .productListAllPaging");
			$productListAllPaging.on("click", ".productListAllPaging-btn", function() {
				$.ajax({
					url: "enterprise/product/listAllPaging",
					type: "POST",
					data: {
						page: $productListAllPaging.find(".productListAllPaging-page").val(),
						size: $productListAllPaging.find(".productListAllPaging-size").val(),
					},
					success: function(data) {
						$productListAllPaging.find(".productListAllPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$productListAllPaging.find(".productListAllPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $newsAdd = $(".enterpriseMgr .newsAdd");
			$newsAdd.on("click", ".newsAdd-btn", function() {
				$.ajax({
					url: "enterprise/news/add",
					type: "POST",
					data: {
						enterpriseId: $newsAdd.find(".newsAdd-enterpriseId").val(),
						title: $newsAdd.find(".newsAdd-title").val(),
						allHtml: $newsAdd.find(".newsAdd-allHtml").val(),
					},
					success: function(data) {
						$newsAdd.find(".newsAdd-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$newsAdd.find(".newsAdd-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $newsEdit = $(".enterpriseMgr .newsEdit");
			$newsEdit.on("click", ".newsEdit-btn", function() {
				$.ajax({
					url: "enterprise/news/edit",
					type: "POST",
					data: {
						newsId: $newsEdit.find(".newsEdit-newsId").val(),
						title: $newsEdit.find(".newsEdit-title").val(),
						allHtml: $newsEdit.find(".newsEdit-allHtml").val(),
					},
					success: function(data) {
						$newsEdit.find(".newsEdit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$newsEdit.find(".newsEdit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $newsDelete = $(".enterpriseMgr .newsDelete");
			$newsDelete.on("click", ".newsDelete-btn", function() {
				$.ajax({
					url: "enterprise/news/delete",
					type: "POST",
					data: {
						newsIds: $newsDelete.find(".newsDelete-newsIds").val()
					},
					success: function(data) {
						$newsDelete.find(".newsDelete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$newsDelete.find(".newsDelete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $newsList = $(".enterpriseMgr .newsList");
			$newsList.on("click", ".newsList-btn", function() {
				$.ajax({
					url: "enterprise/news/list",
					type: "POST",
					data: {
						enterpriseId: $newsList.find(".newsList-enterpriseId").val()
					},
					success: function(data) {
						$newsList.find(".newsList-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$newsList.find(".newsList-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $newsListPaging = $(".enterpriseMgr .newsListPaging");
			$newsListPaging.on("click", ".newsListPaging-btn", function() {
				$.ajax({
					url: "enterprise/news/listPaging",
					type: "POST",
					data: {
						enterpriseId: $newsListPaging.find(".newsListPaging-enterpriseId").val(),
						page: $newsListPaging.find(".newsListPaging-page").val(),
						size: $newsListPaging.find(".newsListPaging-size").val(),
					},
					success: function(data) {
						$newsListPaging.find(".newsListPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$newsListPaging.find(".newsListPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $newsDetail = $(".enterpriseMgr .newsDetail");
			$newsDetail.on("click", ".newsDetail-btn", function() {
				$.ajax({
					url: "enterprise/news/detail",
					type: "POST",
					data: {
						newsId: $newsDetail.find(".newsDetail-newsId").val()
					},
					success: function(data) {
						$newsDetail.find(".newsDetail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$newsDetail.find(".newsDetail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			function strToDate(str) {
				if (str == "") {
					return undefined;
				}
				var val = Date.parse(str);
				var newDate = new Date(val);
				return newDate;
			}
			
		})(jQuery);
	</script>
</body>
</html>