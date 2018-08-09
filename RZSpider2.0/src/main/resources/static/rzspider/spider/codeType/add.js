$("#form-codeType-add").validate({
	rules : {
		customSpiderType : {
			required : true,
			digits : true,
			min : 0,
			max : 20,
			remote : {
				url : ctx + "spider/codeType/checkCustomSpiderTypeUnique",
				type : "post",
				dataType : "json",
				data : {
					"customSpiderType" : function() {
						return $.trim($("#customSpiderType").val());
					}
				},
				dataFilter : function(data, type) {
					if (data == "0")
						return true;
					else
						return false;
				}
			}
		},
		spiderCodeTypeFolder : {
			required : true,
			maxlength : 20,
			remote : {
				url : ctx + "spider/codeType/checkSpiderCodeTypeFolderUnique",
				type : "post",
				dataType : "json",
				data : {
					"spiderCodeTypeFolder" : function() {
						return $.trim($("#spiderCodeTypeFolder").val());
					}
				},
				dataFilter : function(data, type) {
					if (data == "0")
						return true;
					else
						return false;
				}
			}
		},
	},
	messages : {
		"customSpiderType" : {
			remote : "此代码类型已经存在",
		},
		"spiderCodeTypeFolder" : {
			remote : "此代码目录已经存在",
		}
	},
	submitHandler : function(form) {
		add();
	}
});

function add() {
	var customSpiderType = $('#customSpiderType').val();
	var spiderCodeTypeName = $('#spiderCodeTypeName').val();
	var spiderCodeTypeFolder = $('#spiderCodeTypeFolder').val();
	var status = $("input[name='status']").is(':checked') == true ? 0 : 1;
	data = {
		"customSpiderType" : customSpiderType,
		"spiderCodeTypeName" : spiderCodeTypeName,
		"spiderCodeTypeFolder" : spiderCodeTypeFolder,
		"status" : status
	}
	_ajax_save(ctx + "spider/codeType/save", data);
}