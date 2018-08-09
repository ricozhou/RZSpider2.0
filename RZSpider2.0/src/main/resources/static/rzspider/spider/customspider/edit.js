$("#form-customspider-edit").validate({
	rules : {
		customSpiderBackId : {
			required : true,
			digits : true,
			min : 20000,
			max : 99999,
			remote : {
				url : ctx
						+ "spider/customspider/checkCustomSpiderBackIdUnique",
				type : "post",
				dataType : "json",
				data : {
					"customSpiderId" : function() {
						return $.trim($("#customSpiderId")
								.val());
					},
					"customSpiderBackId" : function() {
						return $.trim($("#customSpiderBackId")
								.val());
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
		spiderDefaultParams:{
			checkJson : true
		}
	},
	messages : {
		"customSpiderBackId" : {
			remote : "此爬虫已经存在",
		}
	},
	submitHandler : function(form) {
		update();
	}
});

//一开始便加载
$(document).ready(function() {
	// 查询所有爬虫代码类型
	$.ajax({
		cache : true,
		type : "GET",
		url : ctx + "spider/customspider/selectSpiderCodeType",
		async : false,
		error : function(request) {
			$.modalAlert("系统错误", modal_status.FAIL);
		},
		success : function(data) {
			if (data != null) {
				// 动态显示爬虫类型
				$("#customSpiderType").find("option").remove();
				for (var i = 0; i < data.length; i++) {
					var newOption = document.createElement("option");
					newOption.text = data[i].spiderCodeTypeName;
					newOption.value = data[i].customSpiderType;
					document.getElementById("customSpiderType").add(newOption);
					if($('#customSpiderType2').val()==newOption.value){
						newOption.selected = 'selected';
					}
				}
			} else {
				$.modalAlert(data.msg, modal_status.FAIL);
			}

		}
	});
})

function update() {
	var customSpiderId = $("input[name='customSpiderId']").val();
	var customSpiderBackId = $("input[name='customSpiderBackId']").val();
	var customSpiderType = $("#customSpiderType").val();
	var spiderDefaultParams = $("#spiderDefaultParams").val();
	var customStatus = $("input[name='status']").is(':checked') == true ? 0
			: 1;
	var remark = $("input[name='remark']").val();
	$.ajax({
		cache : true,
		type : "POST",
		url : ctx + "spider/customspider/save",
		data : {
			"customSpiderId" : customSpiderId,
			"customSpiderBackId" : customSpiderBackId,
			"customSpiderType" : customSpiderType,
			"spiderDefaultParams" : spiderDefaultParams,
			"customStatus" : customStatus,
			"remark" : remark
		},
		async : false,
		error : function(request) {
			$.modalAlert("系统错误", modal_status.FAIL);
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("修改自定义成功,正在刷新数据请稍后……", {
					icon : 1,
					time : 500,
					shade : [ 0.1, '#fff' ]
				}, function() {
					$.parentReload();
				});
			} else {
				$.modalAlert(data.msg, modal_status.FAIL);
			}

		}
	});
}