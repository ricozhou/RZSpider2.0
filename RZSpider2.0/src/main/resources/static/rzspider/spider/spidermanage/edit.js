$("#form-spider-edit").validate({
	rules : {
		spiderName : {
			required : true,
			maxlength : 15,
			remote : {
				url : ctx + "spider/spidermanage/checkSpiderNameUnique",
				type : "post",
				dataType : "json",
				data : {
					"spiderId" : function() {
						return $("input[name='spiderId']").val();
					},
					"spiderName" : function() {
						return $("input[name='spiderName']").val();
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
		// spiderBackId:{
		// required:true,
		// number:true,
		// minlength:5,
		// maxlength:5,
		// remote: {
		// url: ctx + "spider/spidermanage/checkSpiderBackIdUnique",
		// type: "post",
		// dataType: "json",
		// data: {
		// "spiderBackId" : function() {
		// return $.trim($("#spiderBackId").val());
		// }
		// },
		// dataFilter: function(data, type) {
		// if (data == "0") return true;
		// else return false;
		// }
		// }
		// },
		spiderType : {
			required : true
		},
		createType : {
			required : true
		},
		spiderDefaultParams : {
			checkJson : true
		}
	},
	messages : {
		"spiderName" : {
			remote : "爬虫已经存在",
			maxlength : '最长15字'
		},
	// "spiderBackId":{
	// number:"必须是数字",
	// minlength:"必须是五位数字",
	// maxlength:"必须是五位数字",
	// remote: "爬虫后台ID已经存在"
	// },
	},
	submitHandler : function(form) {
		update();
	}
});
var spiderData;
// 一开始便加载
$(document).ready(function() {
	// 查询所有爬虫后台id
	$.ajax({
		cache : true,
		type : "GET",
		url : ctx + "spider/spidermanage/selectSpiderBackId",
		async : false,
		error : function(request) {
			$.modalAlert("系统错误", modal_status.FAIL);
		},
		success : function(data) {
			spiderData = data;
			if (data != null) {
				// 动态显示爬虫类型
				$("#spiderBackId").find("option").remove();
				for (var i = 0; i < data.length; i++) {
					var newOption = document.createElement("option");
					newOption.text = data[i].spiderBackId;
					newOption.value = data[i].spiderBackId;
					document.getElementById("spiderBackId").add(newOption);
				}
				// 设置初始值
				var spiderBackId = $("#spiderBackIdh").val();
				var obj = document.getElementById("spiderBackId");
				for (var i = 0; i < obj.options.length; i++) {
					var tmp = obj.options[i].value;
					if (tmp == spiderBackId) {
						obj.options[i].selected = 'selected';
						break;
					}
				}
				data2 = {
					"createType" : $("#createTypeh").val(),
					"spiderDefaultParams" : $("#spiderDefaultParamsh").val()
				}
				setBaseData(data2);
			} else {
				$.modalAlert(data.msg, modal_status.FAIL);
			}

		}
	});

})
// 绑定监听事件
$(function() {
	$('#spiderBackId').bind('change', function() {
		var spiderBackId = $(this).val();
		for (var i = 0; i < spiderData.length; i++) {
			if (spiderBackId == spiderData[i].spiderBackId) {
				setBaseData(spiderData[i]);
			}
		}

	});
});
// 设置初始值
function setBaseData(data) {
	document.getElementById("radio1").removeAttribute("checked");
	document.getElementById("radio2").removeAttribute("checked");
	if (data.createType == 0) {
		// 内置
		document.getElementById("radio1").setAttribute("checked", true);
		document.getElementById("radio2").removeAttribute("checked");
		$(".i-checks").iCheck({
			checkboxClass : "icheckbox_square-green",
			radioClass : "iradio_square-green",
		})
	} else if (data.createType == 1) {
		// 自定义
		document.getElementById("radio1").removeAttribute("checked");
		document.getElementById("radio2").setAttribute("checked", true);
		$(".i-checks").iCheck({
			checkboxClass : "icheckbox_square-green",
			radioClass : "iradio_square-green",
		})
	}

	// 设置默认参数
	$("#spiderDefaultParams").val('');
	$("#spiderDefaultParams").val(data.spiderDefaultParams);

}
function update() {
	var spiderId = $("input[name='spiderId']").val();
	var spiderName = $("input[name='spiderName']").val();
	var spiderBackId = $("#spiderBackId").val();
	var spiderType = $("input[name='spiderType']").val();
	var createType = $("#radio1").is(':checked') == true ? 0 : 1;
	var description = $("input[name='description']").val();
	var link = $("input[name='link']").val();
	var spiderDefaultParams = $("#spiderDefaultParams").val();
	var status = $("input[name='status']").is(':checked') == true ? 0 : 1;
	var remark = $("input[name='remark']").val();
	$.ajax({
		cache : true,
		type : "POST",
		url : ctx + "spider/spidermanage/save",
		data : {
			"spiderId" : spiderId,
			"spiderName" : spiderName,
			"spiderBackId" : spiderBackId,
			"spiderType" : spiderType,
			"createType" : createType,
			"spiderDes" : description,
			"spiderLink" : link,
			"spiderDefaultParams" : spiderDefaultParams,
			"status" : status,
			"remark" : remark,
		},
		async : false,
		error : function(request) {
			$.modalAlert("系统错误", modal_status.FAIL);
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("修改成功,正在刷新数据请稍后……", {
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
