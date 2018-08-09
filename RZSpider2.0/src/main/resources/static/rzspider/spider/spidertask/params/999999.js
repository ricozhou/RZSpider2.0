$("#form-spidertask-params").validate({
	rules : {
		taskParams : {
			checkJson : true
		}
	},
	messages : {},
	submitHandler : function(form) {
		update();
	}
});

// 更新设置参数
function update() {
	// id
	var taskId = $("input[name='taskId']").val();
	// params
	var taskParams = $("#taskParams").val();
	console.log(taskParams);
	$.ajax({
		cache : true,
		type : "POST",
		url : ctx + "spider/spidertask/saveParams",
		data : {
			"taskId" : taskId,
			"taskParams" : taskParams
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
