$("#form-customspider-add")
		.validate(
				{
					rules : {
						customSpiderBackId : {
							required : true,
							digits : true,
							min : 20000,
							max : 29999,
							remote : {
								url : ctx
										+ "spider/customspider/checkCustomSpiderBackIdUnique",
								type : "post",
								dataType : "json",
								data : {
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
						//不能有特殊字符，还得再次验证
						spiderDefaultParams : {
							checkJson : true
						}
					},
					messages : {
						"customSpiderBackId" : {
							remote : "此爬虫已经存在",
						}
					},
					submitHandler : function(form) {
						add();
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
				}
			} else {
				$.modalAlert(data.msg, modal_status.FAIL);
			}

		}
	});
})

function add() {
	var customSpiderBackId = $("input[name='customSpiderBackId']").val();
	var customSpiderType = $("#customSpiderType").val();
	var spiderDefaultParams = $("#spiderDefaultParams").val();
	var customStatus = $("input[name='status']").is(':checked') == true ? 0 : 1;
	var remark = $("input[name='remark']").val();
	$.ajax({
		cache : true,
		type : "POST",
		url : ctx + "spider/customspider/save",
		data : {
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
				parent.layer.msg("创建自定义成功,正在刷新数据请稍后……", {
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