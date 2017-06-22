;(function() {
	
	$k.util.encrptByDES = function(pwd) {
		var key = new Date().format("yyyymmdd");
		var keyHex = CryptoJS.enc.Utf8.parse(key);
	    var encrypted = CryptoJS.DES.encrypt(pwd, keyHex, {
	        mode: CryptoJS.mode.ECB,
	        padding: CryptoJS.pad.Pkcs7
	    });
	    return encrypted.ciphertext.toString(CryptoJS.enc.Base64);
	}
	
	$k.util.decryptByDES = function(pwd) {
		var key = new Date().format("yyyyMMdd");
		var keyHex = CryptoJS.enc.Utf8.parse(key);
		var decrypted = CryptoJS.DES.decrypt({
		    ciphertext: CryptoJS.enc.Base64.parse(pwd)
		}, keyHex, {
		    mode: CryptoJS.mode.ECB,
		    padding: CryptoJS.pad.Pkcs7
		});
		return decrypted.toString(CryptoJS.enc.Utf8);
	}
	
	$k.util.getDateString = function(data) {
		if (data) {
			if (data.$data) {
				return Date.init(data).format("yyyy-mm-dd HH:MM"); 
			}
			return Date.init(data).format("yyyy-mm-dd HH:MM");
		}
		return "";
	}
	
	$k.util.getDateString2 = function(data) {
		if (data) {
			if (data.$date) {
				return Date.init(data.$date).format("yyyy-mm-dd");
			}
			return Date.init(data).format("yyyy-mm-dd");
		}
		return "";
	};
	
	$k.util.getDate = function(data) {
		if (data) {
			if (data.$date) {
				return Date.init(data.$date).format("yyyy-mm-dd HH:MM:ss");
			}
			return Date.init(data).format("yyyy-mm-dd");
		}
		return "";
	};
	
	$k.util.getAreaList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "area/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getRoleList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "role/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getProductTypeList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "productType/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getDepartmentList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "department/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getAppealTypeList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "appealType/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getPolicyTypeList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "policyType/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getOverviewTypeList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "overviewType/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getUserList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "user/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getEnterpriseList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "enterprise/listBase",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getBusinessList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "business/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getEnterprise = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "enterprise/getEnterpriseByUserId",
			type: "POST",
			data:{
				userId: $k.user.get().id
			},
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getPointEnterpriseList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "enterprise/listPointEnterprise",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getEnterpriseListByPointUserId = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "enterprise/listByPointUserId",
			type: "POST",
			data:{
				pointUserId: $k.user.get().id
			},
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getDepartment = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "department/getDepartmentByUserId",
			type: "POST",
			data:{
				userId: $k.user.get().id
			},
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getCountyList = function(options) {
		this.options = $.extend({}, DEFAULTS, options || {});
		var DEFAULTS = {
			success: function() {},
			error: function() {},
		};
		
		$.ajax({
			url: "county/list",
			type: "POST",
			success: function(data) {
				$.Callbacks().add(options.success).fire(data);
			},
			error: function(err) {
				$.Callbacks().add(options.error).fire(err);
			} 
		});
	};
	
	$k.util.getRequestParam = function(paras) {
		/** 从url中获取参数 **/
		var url = location.href;
		var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
		var paraObj = {};
		for ( var i = 0; j = paraString[i]; i++) {
			paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j
					.indexOf("=") + 1, j.length);
		}
		var returnValue = paraObj[paras.toLowerCase()];
		if (typeof (returnValue) == "undefined") {
			return "";
		} else {
			return returnValue;
		}
	}
	
	$k.util.trChecked = function(formName) {
		/** 某一行被选中编辑或其他操作的提示 **/
		var boxCheckedCount = 0;
		var id;
		$("#"+formName+" .box").each(function(i,e){
			if($(this).prop("checked")==true){
				boxCheckedCount = boxCheckedCount + 1;
				id = $(this).parent().next().attr('id');
			}
		})
		if(boxCheckedCount == 0){
			$k.util.alertModal("您还未选中一条记录！");
			return null;
		}
		if(boxCheckedCount > 1){
			$k.util.alertModal("最多只能选择一条记录！");
			return null;
		}
		return id;
	}
	
	$k.util.trOperateChecked = function(formName, alertContent) {
		var ids = new Array();
		$("#"+formName+" .box").each(function() {
			if ($(this).prop("checked") == true) {
				ids.push($(this).parent().next().attr('id'));
			}
		});
		if (ids.length == 0) {
			$k.util.alertModal("您还未选中一条记录！");
			return null;
		}
		return ids;
	}
	
	$k.util.alertModal = function(bdContent) {
		/** alert模态窗口内容  **/
		var $dialog = $('<div class="am-modal am-modal-alert" tabindex="-1">').appendTo($(".content"));
		$dialog.html($(".template.AlertDialog").doT({
			content: bdContent
		}));
		$dialog.modal({
		    closeViaDimmer: false,
		    onConfirm: function(e){
				this.close($dialog.remove());
			}
		});
	}
	
	$k.util.inputDisabled = function(inputName) {
		//编辑或查看详细信息的时候表单不能编辑
		var $input = $('#'+inputName+'-input');
		$input.find('input').attr("readonly","readonly");
		$input.find('select').attr("disabled","disabled");
		$input.find('textarea').attr("readonly","readonly");
		$('.am-modal-footer').addClass("am-hide");
		$input.find('#'+inputName+'-input-form').next().removeClass('am-hide');
	}
	
	$k.util.datatableDefaults = function($table) {
		$.extend( $.fn.dataTable.defaults, {
			"processing": true, 
			"info": false,
			"lengthChange": false,
			"displayLength": $k.config.datatables.displayLength,
			"autoWidth" : false,
			"ordering": false,
			"searching": true,
			"retrieve": true,
			"language": {
				"emptyTable": "没有找到记录！",
				"zeroRecords": "没有找到记录！",
				"search": "搜索",
				"infoEmpty" : "暂无数据！",
				"paginate": {
					"previous": "上页",
					"next": "下页"
				}, 
				"processing": "正在加载中...", 
			},
			"columnDefs": [ { 
				"targets": [ 0 ],
				"width": "20px",
				"orderable": false 
			}, {
				"targets": 1,
				"width": "40px"
			}],
			"aoColumnDefs": [{ "bSortable": false, "aTargets": [0]}],
            "aaSorting": [[1, "asc"]],
		} );
	}
	
	$k.util.ueditor = function(name) {
		var ue = UE.getEditor(name, {
			toolbars: [
	           ['source', 'undo', 'redo', '|', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 
	            '|', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', '|' ,'fontfamily', 'fontsize', '|', 'insertorderedlist', 'insertunorderedlist', 'simpleupload',
	           '|' ,'indent', '|', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify', '|', 'link', 'unlink', '|', 'horizontal', 'date', 'insertvideo', 'attachment']
	        ],
	        zIndex: 10000,
	     	autoHeightEnabled: true,
	     	autoFloatEnabled: true,
		});
		return ue;
	}
	
	$k.util.dateTimepicker = function(format) {
		if(format == "" || format == undefined) {
			format = "Y-m-d";
		}
		rule = {
	      lang: "ch",           //语言选择中文
	      format: format,     //格式化日期
	      timepicker: false,    //关闭时间选项
	      scrollInput: false,
		}
		$('.datetimepicker').datetimepicker(rule);
	}
	
	$k.util.datePicker = function($obj) {
		$obj.datetimepicker( {
		      lang: "ch",      //语言选择中文
		      format: "Y-m",   //格式化日期
		      timepicker: false,
		      onShow: function() {
				$(this).find(".xdsoft_calendar").addClass("am-hide");
		      },
		      scrollInput: false,
		      onChangeMonth: function(currentDateTime) {
		    	  $obj.val(currentDateTime.format("yyyy-mm"));
		      } 
		});
	}
	
	$k.util.getStatusClass = function(growth) {
		if(growth == null || growth == "") {
			return "";
		} else {
			if(growth < -0.1) {
				return "am-text-danger";
			} else if(growth >= -0.1 && growth < 0) {
				return "am-text-warning";
			} else if(growth >= 0 && growth < 0.1) {
				return "am-text-primary";
			} else if(growth >= 0.1 && growth < 0.2) {
				return "am-text-secondary";
			} else if(growth >= 0.2) {
				return "am-text-success";
			}
		}
	};
	
	
})();